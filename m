Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D422FFF99
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 10:57:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72647.130861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2tBk-00074M-Ig; Fri, 22 Jan 2021 09:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72647.130861; Fri, 22 Jan 2021 09:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2tBk-00073x-FL; Fri, 22 Jan 2021 09:57:08 +0000
Received: by outflank-mailman (input) for mailman id 72647;
 Fri, 22 Jan 2021 09:57:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l2tBi-00073s-HB
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 09:57:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2tBd-0004iH-1U; Fri, 22 Jan 2021 09:57:01 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2tBc-0000sy-R6; Fri, 22 Jan 2021 09:57:00 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=jWdwXnxB8O829E/jDOcYUKdxvU8VWgq11+YfGDNReMU=; b=EzvZHbya9q83kq6i9Kj1agn7Sz
	FHPUlFw/LGpnV1U+xDRcZGDjHuNjGZo0D28EcIMeXTjhys6tnpk6MjfpS6i2OtzzNo+LuR8II2mL9
	LU8YpR5EitTJ7JdnhMZPZHmeF28iSx1yIOSEN2ZmKxlEdrcAU/QRrOT23qb2S5K+/7Uo=;
Subject: Re: [PATCH v2 4/4] tools/libs: Apply MSR policy to a guest
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 jun.nakajima@intel.com, kevin.tian@intel.com
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-5-git-send-email-boris.ostrovsky@oracle.com>
From: Julien Grall <julien@xen.org>
Message-ID: <25bedac9-6d60-7c7f-46e4-7a439e7a17e2@xen.org>
Date: Fri, 22 Jan 2021 09:56:58 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1611182952-9941-5-git-send-email-boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Boris,

On 20/01/2021 22:49, Boris Ostrovsky wrote:
> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
> index 19168572fd3e..1f2abf6679d7 100644
> --- a/tools/libs/light/libxl_dom.c
> +++ b/tools/libs/light/libxl_dom.c
> @@ -383,9 +383,10 @@ int libxl__build_pre(libxl__gc *gc, uint32_t domid,
>       /* Construct a CPUID policy, but only for brand new domains.  Domains
>        * being migrated-in/restored have CPUID handled during the
>        * static_data_done() callback. */
> -    if (!state->restore)
> +    if (!state->restore) {
>           libxl__cpuid_legacy(ctx, domid, false, info);
> -
> +        libxl__msr_policy(ctx, domid, info);

AFAICT, this is going to break compilation of the toolst on Arm because 
libxl__msr_policy().

However, I am a bit unsure whether we should define a stub for this on 
Arm. It feels to me it would be better to pass an extra boolean 
(restore) to libxl__arch_domain_create() and directly implement it there.

Cheers,

-- 
Julien Grall

