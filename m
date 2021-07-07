Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 429D93BE3D8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 09:45:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151989.280839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m12Ek-0002vz-4L; Wed, 07 Jul 2021 07:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151989.280839; Wed, 07 Jul 2021 07:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m12Ek-0002t4-1O; Wed, 07 Jul 2021 07:44:50 +0000
Received: by outflank-mailman (input) for mailman id 151989;
 Wed, 07 Jul 2021 07:44:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UvpK=L7=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1m12Ej-0002sy-Ba
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 07:44:49 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 34300adc-def7-11eb-84dc-12813bfff9fa;
 Wed, 07 Jul 2021 07:44:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B4F1ED1;
 Wed,  7 Jul 2021 00:44:47 -0700 (PDT)
Received: from [10.57.0.191] (unknown [10.57.0.191])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72FCC3F694;
 Wed,  7 Jul 2021 00:44:46 -0700 (PDT)
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
X-Inumbo-ID: 34300adc-def7-11eb-84dc-12813bfff9fa
Subject: Re: [PATCH] tools/xen-foreign: Update the size for
 vcpu_guest_{core_regs, context}
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, olaf@aepfle.de
References: <20210706132000.29892-1-julien@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <6227b008-6168-47ed-e947-a76423ca2fae@arm.com>
Date: Wed, 7 Jul 2021 09:44:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210706132000.29892-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 06.07.2021 15:20, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Commit 918b8842a852 ("arm64: Change type of hsr, cpsr, spsr_el1 to
> uint64_t") updated the size of the structure vcpu_guest_core_regs and
> indirectly vcpu_guest_context.
> 
> On Arm, the two structures are only accessible to the tools and the
> hypervisor (and therefore stable). However, they are still checked
> by the scripts in tools/include/xen-foreign are not able to understand
> that.
> 
> Ideally we should rework the scripts so we don't have to update
> the size for non-stable structure. But I don't have limited time
> to spend on the issue. So chose the simple solution and update
> the size accordingly.
> 
> Note that we need to keep vcpu_guest_core_regs around because
> the structure is used by vcpu_guest_context and therefore the
> scripts expects the generated header to contain it.
> 
> Fixes: 918b8842a852 ("arm64: Change type of hsr, cpsr, spsr_el1 to uint64_t")

Sorry for this inconvenience due to the lack of xen-tools testing.
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
Reviewed-by: Michal Orzel <michal.orzel@arm.com>
Tested-by: Michal Orzel <michal.orzel@arm.com>
> ---
> 
> Cc: michal.orzel@arm.com
> Cc: olaf@aepfle.de
> ---
>  tools/include/xen-foreign/reference.size | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/include/xen-foreign/reference.size b/tools/include/xen-foreign/reference.size
> index a0409db5c458..11a06a7a432c 100644
> --- a/tools/include/xen-foreign/reference.size
> +++ b/tools/include/xen-foreign/reference.size
> @@ -4,8 +4,8 @@ structs                   |   arm32   arm64  x86_32  x86_64
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
> 

