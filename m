Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 716BE25D4E1
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 11:29:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE81y-0003N2-Q7; Fri, 04 Sep 2020 09:29:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pQwi=CN=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kE81y-0003Mx-2O
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 09:29:14 +0000
X-Inumbo-ID: ffeacc1e-b186-4e61-963a-b14ae7d86559
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ffeacc1e-b186-4e61-963a-b14ae7d86559;
 Fri, 04 Sep 2020 09:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject;
 bh=2edknCgBMU5duvGfJrpIFOffbfa5zsibxsk8B3PYIPY=; b=pY9ZaNPRUh0qn0K+8orAu27MHn
 zed4G4ay+cw4jRafSD5TVWdPgoef2DkDiWLH4W0qMhdUtEe0fVXNZZyprnHPKHF9i4MGmgRv1M+Rr
 q5NKT9vjw4L028m7vlGuzPV22T6uOyAJ8R1DhRwRuze27oUd+i+ID0srPtWYUzsSTPco=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kE81v-0000GJ-QQ; Fri, 04 Sep 2020 09:29:11 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kE81v-0001zd-Io; Fri, 04 Sep 2020 09:29:11 +0000
Subject: Re: [PATCH] EFI: Enable booting unified hypervisor/kernel/initrd
 images
To: Trammell Hudson <hudson@trmm.net>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <EGZ7EZE5F-c5YJVD9p0TtccTz06ZsdMcL21-BcB64dk9V3x8eKrB3dSDsLbGL4peCaENcp55uRsnWUONZYvrRaQh0tToALcaHRr-QMYNsH0=@trmm.net>
From: Julien Grall <julien@xen.org>
Message-ID: <96966138-552f-c86a-2d14-85b2f7af50e6@xen.org>
Date: Fri, 4 Sep 2020 10:29:09 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <EGZ7EZE5F-c5YJVD9p0TtccTz06ZsdMcL21-BcB64dk9V3x8eKrB3dSDsLbGL4peCaENcp55uRsnWUONZYvrRaQh0tToALcaHRr-QMYNsH0=@trmm.net>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 28/08/2020 12:51, Trammell Hudson wrote:
> +    /* PE32+ Subsystem type */
> +#if defined(__ARM__)

Shouldn't this be defined(__aarch64__) ?

> +    if (pe->FileHeader.Machine != PE_HEADER_MACHINE_ARM64)
> +        return NULL;
> +#elif defined(__x86_64__)
> +    if (pe->FileHeader.Machine != PE_HEADER_MACHINE_X64)
> +        return NULL;
> +#else
> +    /* unknown architecture */
> +    return NULL;
> +#endif

Cheers,

-- 
Julien Grall

