Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6511B39E1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 10:17:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRAZL-00019t-Me; Wed, 22 Apr 2020 08:17:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+vI=6G=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jRAZJ-00019o-OU
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 08:17:17 +0000
X-Inumbo-ID: adf0604c-8471-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id adf0604c-8471-11ea-b4f4-bc764e2007e4;
 Wed, 22 Apr 2020 08:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bs4RCcJj1vtgZkHUIrOjbXNxo36I+mFDfybWCo5xYdM=; b=jV0/ja0MxRJwa3gVg1V9y/s3ru
 kelRXBWER6MUiTJsuAWC+JHCt+C+0Y03FDbsY7MhKkhSa+Csrod1KGLgX6x2jXFxd19OjDFLGRBXX
 LFH/emlaKmHYlmH5rXCWT2VZ6FkH6Xsnw4HAjeBESaAyVFeUzgfKs1hbKYtOlRX/6jGk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jRAZF-0000S4-SE; Wed, 22 Apr 2020 08:17:13 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jRAZF-0002tS-LR; Wed, 22 Apr 2020 08:17:13 +0000
Subject: Re: [PATCH v2 4/4] x86: adjustments to guest handle treatment
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9d4b738a-4487-6bfc-3076-597d074c7b47@suse.com>
 <e820e1b9-7a7e-21f3-1ea0-d939de1905dd@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9108f918-ee44-0740-48e0-7e0b0c761e1b@xen.org>
Date: Wed, 22 Apr 2020 09:17:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e820e1b9-7a7e-21f3-1ea0-d939de1905dd@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 21/04/2020 10:13, Jan Beulich wrote:
> First of all avoid excessive conversions. copy_{from,to}_guest(), for
> example, work fine with all of XEN_GUEST_HANDLE{,_64,_PARAM}().
> 
> Further
> - do_physdev_op_compat() didn't use the param form for its parameter,
> - {hap,shadow}_track_dirty_vram() wrongly used the param form,
> - compat processor Px logic failed to check compatibility of native and
>    compat structures not further converted.
> 
> As this eliminates all users of guest_handle_from_param() and as there's
> no real need to allow for conversions in both directions, drop the
> macros as well.

I was kind of expecting both guest_handle_from_param() and 
guest_handle_to_param() to be dropped together. May I ask why you still 
need guest_handle_to_param()?

[...]

>   /* Handler for shadow control ops: operations from user-space to enable
>    * and disable ephemeral shadow modes (test mode and log-dirty mode) and
> --- a/xen/include/xen/acpi.h
> +++ b/xen/include/xen/acpi.h
> @@ -184,8 +184,8 @@ static inline unsigned int acpi_get_csub
>   static inline void acpi_set_csubstate_limit(unsigned int new_limit) { return; }
>   #endif
>   
> -#ifdef XEN_GUEST_HANDLE_PARAM
> -int acpi_set_pdc_bits(u32 acpi_id, XEN_GUEST_HANDLE_PARAM(uint32));
> +#ifdef XEN_GUEST_HANDLE
> +int acpi_set_pdc_bits(u32 acpi_id, XEN_GUEST_HANDLE(uint32));
>   #endif

Do we really need to keep the #ifdef here?

>   int arch_acpi_set_pdc_bits(u32 acpi_id, u32 *, u32 mask);
>   
> 

Cheers,

-- 
Julien Grall

