Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEE63BD650
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 14:30:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151211.279473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0kDR-0002pR-FC; Tue, 06 Jul 2021 12:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151211.279473; Tue, 06 Jul 2021 12:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0kDR-0002mw-By; Tue, 06 Jul 2021 12:30:17 +0000
Received: by outflank-mailman (input) for mailman id 151211;
 Tue, 06 Jul 2021 12:30:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbbY=L6=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1m0kDQ-0002mq-GA
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 12:30:16 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id bb6c7b94-a075-4f35-b2d7-ba54a00b66f1;
 Tue, 06 Jul 2021 12:30:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 698351FB;
 Tue,  6 Jul 2021 05:30:14 -0700 (PDT)
Received: from [10.57.8.167] (unknown [10.57.8.167])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C9D83F73B;
 Tue,  6 Jul 2021 05:30:11 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: bb6c7b94-a075-4f35-b2d7-ba54a00b66f1
Subject: Re: [PATCH v4] arm64: Change type of hsr, cpsr, spsr_el1 to uint64_t
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, bertrand.marquis@arm.com
References: <20210705063952.25629-1-michal.orzel@arm.com>
 <20210706140010.4b8802d9.olaf@aepfle.de>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <5d4ebedb-ebba-f586-f377-32467213369b@arm.com>
Date: Tue, 6 Jul 2021 14:30:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210706140010.4b8802d9.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 06.07.2021 14:00, Olaf Hering wrote:
> Am Mon,  5 Jul 2021 08:39:52 +0200
> schrieb Michal Orzel <michal.orzel@arm.com>:
> 
>> Modify type of hsr, cpsr, spsr_el1 to uint64_t.
> 
> I think this is now commit 918b8842a852e0e7446286f546724b1c63c56c66, which fails to build:
> 
> ...
> diff -u reference.size tmp.size
> --- reference.size      2021-06-29 10:50:32.237518309 +0200
> +++ tmp.size    2021-07-06 13:58:19.052592351 +0200
> @@ -4,8 +4,8 @@
>  start_info                |       -       -    1112    1168
>  trap_info                 |       -       -       8      16
>  cpu_user_regs             |       -       -      68     200
> -vcpu_guest_core_regs      |     304     304       -       -
> -vcpu_guest_context        |     344     344    2800    5168
> +vcpu_guest_core_regs      |     312     312       -       -
> +vcpu_guest_context        |     352     352    2800    5168
>  arch_vcpu_info            |       0       0      24      16
>  vcpu_time_info            |      32      32      32      32
>  vcpu_info                 |      48      48      64      64
> gmake[2]: *** [Makefile:24: check-headers] Error 1
> 
> osstest may catch this error as well.
> 
> Olaf
> 

Where does this report come from so that I can investigate it?
Locally I can build this patch on arm64,arm32,x86 without any issues.

Cheers,
Michal

