Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3312841A8F8
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 08:29:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197574.350700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV6bw-0003zu-Az; Tue, 28 Sep 2021 06:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197574.350700; Tue, 28 Sep 2021 06:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV6bw-0003y6-7p; Tue, 28 Sep 2021 06:29:04 +0000
Received: by outflank-mailman (input) for mailman id 197574;
 Tue, 28 Sep 2021 06:29:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s6b1=OS=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mV6bu-0003xy-LD
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 06:29:02 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5e7f1ebd-2025-11ec-bc6b-12813bfff9fa;
 Tue, 28 Sep 2021 06:29:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 079E2D6E;
 Mon, 27 Sep 2021 23:29:01 -0700 (PDT)
Received: from [10.57.20.114] (unknown [10.57.20.114])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B61D23F718;
 Mon, 27 Sep 2021 23:28:57 -0700 (PDT)
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
X-Inumbo-ID: 5e7f1ebd-2025-11ec-bc6b-12813bfff9fa
Subject: Re: [PATCH V3 1/3] xen: Introduce "gpaddr_bits" field to
 XEN_SYSCTL_physinfo
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1632437334-12015-1-git-send-email-olekstysh@gmail.com>
 <1632437334-12015-2-git-send-email-olekstysh@gmail.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <27840222-d5be-3df6-88bf-fb41c978791e@arm.com>
Date: Tue, 28 Sep 2021 08:28:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1632437334-12015-2-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 24.09.2021 00:48, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> We need to pass info about maximum supported guest address
> space size to the toolstack on Arm in order to properly
> calculate the base and size of the extended region (safe range)
> for the guest. The extended region is unused address space which
> could be safely used by domain for foreign/grant mappings on Arm.
> The extended region itself will be handled by the subsequents
> patch.
> 
> Use p2m_ipa_bits variable on Arm, the x86 equivalent is
> hap_paddr_bits.
> 
> As we change the size of structure bump the interface version.
> 
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> Please note, that review comments for the RFC version [1] haven't been addressed yet.
> It is not forgotten, some clarification is needed. It will be addressed for the next version.
> 
> [1] https://lore.kernel.org/xen-devel/973f5344-aa10-3ad6-ff02-ad5f358ad279@citrix.com/
> 
> Changes RFC -> V2:
>    - update patch subject/description
>    - replace arch-specific sub-struct with common gpaddr_bits
>      field and update code to reflect that
> 
> Changes V2 -> V3:
>    - make the field uint8_t and add uint8_t pad[7] after
>    - remove leading blanks in libxl.h
> ---
>  tools/include/libxl.h            | 7 +++++++
>  tools/libs/light/libxl.c         | 2 ++
>  tools/libs/light/libxl_types.idl | 2 ++
>  xen/arch/arm/sysctl.c            | 2 ++
>  xen/arch/x86/sysctl.c            | 2 ++
>  xen/include/public/sysctl.h      | 4 +++-
>  6 files changed, 18 insertions(+), 1 deletion(-)
> 

Don't you want to print gpaddr_bits field of xen_sysctl_physinfo from output_physinfo (xl_info.c)?

Apart from that:
Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Cheers

