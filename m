Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6384048D39F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 09:30:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257026.441412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7vUz-0006O6-Vv; Thu, 13 Jan 2022 08:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257026.441412; Thu, 13 Jan 2022 08:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7vUz-0006L7-Sh; Thu, 13 Jan 2022 08:30:21 +0000
Received: by outflank-mailman (input) for mailman id 257026;
 Thu, 13 Jan 2022 08:30:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MCEk=R5=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1n7vUy-0005D3-Nm
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 08:30:20 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0abd7208-744b-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 09:30:19 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id o3so8642560wrh.10
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jan 2022 00:30:19 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec?
 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id k23sm1752946wmr.36.2022.01.13.00.30.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 00:30:18 -0800 (PST)
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
X-Inumbo-ID: 0abd7208-744b-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VxLov1MZBN2Ab6gB3yGozaeTOE8ijNEaDM2uD/TKn3Y=;
        b=Ni13/1r8lYKMiCSIIYgO7gV7S1QOV61B9d7Wg19fIjdDHfZZwvKVBU/2MS+ONLsvPX
         4h2S1l7uN70XEbNWUBd4sBK7bMVZqAiQPEWGBJa4khIpT/j7CGMWzxoNweVTS8uFGb1H
         waIbwIDj4MJC4ZMYOX2PjrpZZ0kmb6iMo/81syuyLe7yAy2NoOibEUgcC0KgitwZQAHI
         15wUZZXrq5XwLTcjIhmEY28LZnorK0ytFCIwpYn2NBFxw88AezC6Z7HjCtxz4NdLHvfL
         5PvM0s3q8nghGWikVVSsJyFVvvb1wagJrp7tZN2qJ64+VaLcMVQgKwubw5ZVXsFODbGM
         5Jcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VxLov1MZBN2Ab6gB3yGozaeTOE8ijNEaDM2uD/TKn3Y=;
        b=aLuoR00LcMKUofM0Yk6nkG/4VYGrAbcSYFSgCBBSjwBAdsh31JHTcmkgkFvFLR71HA
         afgSMK+mGxkrz8Np2xLFYbHdOV1a7yKWFzdIIv+BxnddMOeIMknVNff+7AZeiV+peZB4
         UxSfCgPEnALUfuKd/3VzsxEpZm14l80gBp3VnJOreyHM6UeLu8wTgMN+nOh+F+isH+05
         JeG/scEi9mBeppy3elzoUsyTqW/wITuovMgDo9jhUHkWupyh6M1mtFg3g/QH3hRKaEq0
         XYRDV5XVV7043iBTlqP+KH2MMD1ZAleWR9E5rjhqzW3nO4z2IdQH0AWVxfHwACD9cL0u
         wxuw==
X-Gm-Message-State: AOAM5310DEF+NRc93JebB10PfV78NpGXngDIc2Zgi0ye2us8PZDnP7O6
	rdlDII91ncqc0TZwY9pSmbM=
X-Google-Smtp-Source: ABdhPJxiPGB97YTtAceZtAD1sWnHjdSlbLQLvyRBarMoY6OriJBmE354O6tFWVLkTVf+jUK+iYwJbw==
X-Received: by 2002:a05:6000:18a6:: with SMTP id b6mr2833074wri.675.1642062619347;
        Thu, 13 Jan 2022 00:30:19 -0800 (PST)
Message-ID: <47b755da-38ec-01c8-2b0c-31ee9a9d7216@gmail.com>
Date: Thu, 13 Jan 2022 08:30:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Reply-To: paul@xen.org
Subject: Re: [PATCH v4] libxl/PCI: Fix PV hotplug & stubdom coldplug
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <20220113040142.20503-1-jandryuk@gmail.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20220113040142.20503-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/01/2022 04:01, Jason Andryuk wrote:
> commit 0fdb48ffe7a1 "libxl: Make sure devices added by pci-attach are
> reflected in the config" broken PCI hotplug (xl pci-attach) for PV
> domains when it moved libxl__create_pci_backend() later in the function.
> 
> This also broke HVM + stubdom PCI passthrough coldplug.  For that, the
> PCI devices are hotplugged to a running PV stubdom, and then the QEMU
> QMP device_add commands are made to QEMU inside the stubdom.
> 
> A running PV domain calls libxl__wait_for_backend().  With the current
> placement of libxl__create_pci_backend(), the path does not exist and
> the call immediately fails:
> libxl: error: libxl_device.c:1388:libxl__wait_for_backend: Backend /local/domain/0/backend/pci/43/0 does not exist
> libxl: error: libxl_pci.c:1764:device_pci_add_done: Domain 42:libxl__device_pci_add failed for PCI device 0:2:0.0 (rc -3)
> libxl: error: libxl_create.c:1857:domcreate_attach_devices: Domain 42:unable to add pci devices
> 
> The wait is only relevant when:
> 1) The domain is PV
> 3) The domain is running
> 2) The backend is already present

The numbering above needs fixing and I guess you want a "Because..." here.

> 
> 1) xen-pcifront is only used for PV.  It does not load for HVM domains
>     where QEMU is used.
> 
> 2) If the domain is not running (starting), then the frontend state will
>     be Initialising.  xen-pciback waits for the frontend to transition to
>     at Initialised before attempting to connect.  So a wait for a
>     non-running domain is not applicable as the backend will not
>     transition to Connected.
> 
> 3) For presence, num_devs is already used to determine if the backend
>     needs to be created.  Re-use num_devs to determine if the backend
>     wait is necessary.  The wait is necessary to avoid racing with
>     another PCI attachment reconfiguring the front/back or changing to
>     some other state like closing.  If we are creating the backend, then
>     we don't have to worry about the state since it is being created.
> 
> Fixes: 0fdb48ffe7a1 ("libxl: Make sure devices added by pci-attach are
> reflected in the config")
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
> Alternative to Jan's patch:
> https://lore.kernel.org/xen-devel/5114ae87-bc0e-3d58-e16e-6d9d2fee0801@suse.com/
> 
> v4:
> Use if (rc) return rc
> Capitalize comment sentence
> Change commit message
> 
> v3:
> Change title & commit message
> 
> v2:
> Add Fixes
> Expand num_devs use in commit message
> ---
>   tools/libs/light/libxl_pci.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 4c2d7aeefb..4bbbfe9f16 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -157,9 +157,11 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
>       if (domtype == LIBXL_DOMAIN_TYPE_INVALID)
>           return ERROR_FAIL;
>   
> -    if (!starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
> -        if (libxl__wait_for_backend(gc, be_path, GCSPRINTF("%d", XenbusStateConnected)) < 0)
> -            return ERROR_FAIL;
> +    /* Wait is only needed if the backend already exists (num_devs != NULL) */
> +    if (num_devs && !starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
> +        rc = libxl__wait_for_backend(gc, be_path,
> +                                     GCSPRINTF("%d", XenbusStateConnected));
> +        if (rc) return rc;
>       }
>   
>       back = flexarray_make(gc, 16, 1);


