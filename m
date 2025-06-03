Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDCFACC337
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 11:35:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004123.1383777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMO2t-0005uk-0D; Tue, 03 Jun 2025 09:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004123.1383777; Tue, 03 Jun 2025 09:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMO2s-0005rf-TE; Tue, 03 Jun 2025 09:34:58 +0000
Received: by outflank-mailman (input) for mailman id 1004123;
 Tue, 03 Jun 2025 09:34:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uMO2r-0005rZ-QY
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 09:34:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uMO2q-0008dc-2b;
 Tue, 03 Jun 2025 09:34:56 +0000
Received: from [15.248.2.27] (helo=[10.24.67.31])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uMO2q-004G5J-35;
 Tue, 03 Jun 2025 09:34:56 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=ChVIruCtaiSIjFbQjuWx2tBxlQQ7RjmKNHtbn5ZIBjY=; b=pFJnnjLOx4p8MY77i4xa4Noay9
	Zy9Nb8LAolTGkbJ6hyGwf2q8wZkEVlYhOOObdmv6ry2Lehbz1zRwx6hEwtGJvXswiGzc1CTGlHgmP
	+rAbXq56Qdc+LqIBP8Yvm/ZFUSW3rOpRytVO6trp0BOGBWYoTGlv59ZdgH0Rf9LXcZNI=;
Message-ID: <dc9d383e-f23a-450f-b4d7-8e13e2155817@xen.org>
Date: Tue, 3 Jun 2025 10:34:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] tools/arm: Add the trap_unmapped_accesses xl
 config option
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com, andrew.cooper3@citrix.com,
 edgar.iglesias@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>
References: <20250530134559.1434255-1-edgar.iglesias@gmail.com>
 <20250530134559.1434255-4-edgar.iglesias@gmail.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250530134559.1434255-4-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Edgar,

On 30/05/2025 14:45, Edgar E. Iglesias wrote:
> @@ -1714,6 +1711,9 @@ int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
>       /* ACPI is disabled by default */
>       libxl_defbool_setdefault(&b_info->acpi, false);
>   
> +    /* Trapping of unmapped accesses enabled by default.  */
> +    libxl_defbool_setdefault(&b_info->trap_unmapped_accesses, true);
> +
>       /* Sanitise SVE parameter */
>       if (b_info->arch_arm.sve_vl) {
>           unsigned int max_sve_vl =
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index e03599ea99..38770eea5b 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -667,6 +667,9 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
>           if (libxl_defbool_val(b_info->vpmu))
>               create.flags |= XEN_DOMCTL_CDF_vpmu;
>   
> +        if (libxl_defbool_val(b_info->trap_unmapped_accesses))
> +            create.flags |= XEN_DOMCTL_CDF_trap_unmapped_accesses;
> +
>           assert(info->passthrough != LIBXL_PASSTHROUGH_DEFAULT);
>           LOG(DETAIL, "passthrough: %s",
>               libxl_passthrough_to_string(info->passthrough));
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 9bb2969931..e33785c661 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -736,6 +736,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>       ("vmtrace_buf_kb", integer),
>   
>       ("vpmu", libxl_defbool),
> +    ("trap_unmapped_accesses", libxl_defbool),

I think you want to add a LIBXL_HAVE in tools/include/libxl.h for this 
new field.

Cheers,

-- 
Julien Grall


