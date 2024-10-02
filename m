Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9710798D125
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 12:26:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808678.1220657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svwYN-00089P-6R; Wed, 02 Oct 2024 10:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808678.1220657; Wed, 02 Oct 2024 10:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svwYN-00086Y-2O; Wed, 02 Oct 2024 10:25:55 +0000
Received: by outflank-mailman (input) for mailman id 808678;
 Wed, 02 Oct 2024 10:25:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dlN+=Q6=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1svwYM-00086S-4S
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 10:25:54 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b298abb4-80a8-11ef-a0ba-8be0dac302b0;
 Wed, 02 Oct 2024 12:25:52 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-OuKjrCFRPf-1wKQBz_-ajg-1; Wed, 02 Oct 2024 06:25:49 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42cb6f3c476so49846455e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 03:25:49 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-49-143.web.vodafone.de.
 [109.42.49.143]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f79ff92desm14912885e9.40.2024.10.02.03.25.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2024 03:25:47 -0700 (PDT)
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
X-Inumbo-ID: b298abb4-80a8-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727864751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XMwMtz76lfJcPKySIzdnPKszxiHpDniIFN0UI66uwGE=;
	b=e6OhCbAA/jkESTbyBJN86dZTTD99WkoBrWBHTrv7g+JdLdLBvqgSyHRhGevRGA+8yuq6G1
	IFBlrCRDczN/C82Y8FaDmzNXIw6LRGSXr0I/usFugAAmRKyORcxg2nO9l4gq/915CRsOSq
	SgRI+u+3II25hawtCkK71hXOX5CtcI4=
X-MC-Unique: OuKjrCFRPf-1wKQBz_-ajg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727864748; x=1728469548;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XMwMtz76lfJcPKySIzdnPKszxiHpDniIFN0UI66uwGE=;
        b=vcqs/EO88PDI51BOV5HRX1cBfPRi+a9/5HuoXdk5mO6mKvY5BZeLPLcphG62muvYyS
         3wHGmBgsaz0mYwN3mgT/tsvsNWLPYArmqh/fz7bO7+9fueMPa3krVlM2AA7BdSalNJmL
         TDuNfX814UkReuYRHRgPqupv4oAEe0ecj25yBBT9ztUwg4nriH7gKvcva+ZXiHGW0D2D
         nnRtJVsB3Hcx1RpOUI61cj+ucz/mT+oJX68XYq7sfTnRmfuVIh4lIDz/NgZGNFSG2gs+
         k4Rg8n0STu6hVzpkBiifx9hEEvcI7M8Dy/hftuVJxfGa6VdTanjsFRgV0j5DDF0/bVDs
         Cs2A==
X-Gm-Message-State: AOJu0YxMTBwGtx5XjxAQmiX9D0AIa4sBlH0Q1wuHzaGtkylHdWODh/VJ
	hV3Xz4UualWe5iyQdyrZ/PVGUhWBqE/BxTmYWUhD6PtpQ2DQVwWdjQ6pADcymJWcxTiokHhGWn9
	zTdkuOELnvWSmngutzlwhGeSbvTAB9YAluQoD9/s6mQ4kmI6kTt2ONhvOzKS1s8pfYufkF4sHsV
	U=
X-Received: by 2002:a05:600c:3b03:b0:42c:b63e:fea6 with SMTP id 5b1f17b1804b1-42f777ee31amr21694765e9.22.1727864748358;
        Wed, 02 Oct 2024 03:25:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+jLvOZbOcEN+T8mygG4Xp+1ksnZoFvPLzjm0Rx8NQIi1TBH5V/5NqSM0WWZG1ZJ6kX9tmgw==
X-Received: by 2002:a05:600c:3b03:b0:42c:b63e:fea6 with SMTP id 5b1f17b1804b1-42f777ee31amr21694565e9.22.1727864747907;
        Wed, 02 Oct 2024 03:25:47 -0700 (PDT)
Message-ID: <408f72f4-4d18-46e6-9e8a-89542acaa306@redhat.com>
Date: Wed, 2 Oct 2024 12:25:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/xen: Remove deadcode
To: dave@treblig.org, sstabellini@kernel.org, anthony@xenproject.org,
 paul@xen.org, edgar.iglesias@gmail.com
Cc: xen-devel@lists.xenproject.org, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20240917002212.330893-1-dave@treblig.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240917002212.330893-1-dave@treblig.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/09/2024 02.22, dave@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <dave@treblig.org>
> 
> xen_be_copy_grant_refs is unused since 2019's
>    19f87870ba ("xen: remove the legacy 'xen_disk' backend")
> 
> xen_config_dev_console is unused since 2018's
>    6d7c06c213 ("Remove broken Xen PV domain builder")
> 
> Remove them.
> 
> Signed-off-by: Dr. David Alan Gilbert <dave@treblig.org>
> ---
>   hw/xen/xen-legacy-backend.c         | 18 ------------------
>   hw/xen/xen_devconfig.c              |  8 --------
>   include/hw/xen/xen-legacy-backend.h |  5 -----
>   3 files changed, 31 deletions(-)
> 
> diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
> index 5514184f9c..e8e1ee4f7d 100644
> --- a/hw/xen/xen-legacy-backend.c
> +++ b/hw/xen/xen-legacy-backend.c
> @@ -147,24 +147,6 @@ void xen_be_unmap_grant_refs(struct XenLegacyDevice *xendev, void *ptr,
>       }
>   }
>   
> -int xen_be_copy_grant_refs(struct XenLegacyDevice *xendev,
> -                           bool to_domain,
> -                           XenGrantCopySegment segs[],
> -                           unsigned int nr_segs)
> -{
> -    int rc;
> -
> -    assert(xendev->ops->flags & DEVOPS_FLAG_NEED_GNTDEV);
> -
> -    rc = qemu_xen_gnttab_grant_copy(xendev->gnttabdev, to_domain, xen_domid,
> -                                    segs, nr_segs, NULL);
> -    if (rc) {
> -        xen_pv_printf(xendev, 0, "xengnttab_grant_copy failed: %s\n",
> -                      strerror(-rc));
> -    }
> -    return rc;
> -}
> -
>   /*
>    * get xen backend device, allocate a new one if it doesn't exist.
>    */
> diff --git a/hw/xen/xen_devconfig.c b/hw/xen/xen_devconfig.c
> index 2150869f60..45ae134b84 100644
> --- a/hw/xen/xen_devconfig.c
> +++ b/hw/xen/xen_devconfig.c
> @@ -66,11 +66,3 @@ int xen_config_dev_vkbd(int vdev)
>       xen_config_dev_dirs("vkbd", "vkbd", vdev, fe, be, sizeof(fe));
>       return xen_config_dev_all(fe, be);
>   }
> -
> -int xen_config_dev_console(int vdev)
> -{
> -    char fe[256], be[256];
> -
> -    xen_config_dev_dirs("console", "console", vdev, fe, be, sizeof(fe));
> -    return xen_config_dev_all(fe, be);
> -}
> diff --git a/include/hw/xen/xen-legacy-backend.h b/include/hw/xen/xen-legacy-backend.h
> index 943732b8d1..e198b120c5 100644
> --- a/include/hw/xen/xen-legacy-backend.h
> +++ b/include/hw/xen/xen-legacy-backend.h
> @@ -50,10 +50,6 @@ void *xen_be_map_grant_refs(struct XenLegacyDevice *xendev, uint32_t *refs,
>   void xen_be_unmap_grant_refs(struct XenLegacyDevice *xendev, void *ptr,
>                                uint32_t *refs, unsigned int nr_refs);
>   
> -int xen_be_copy_grant_refs(struct XenLegacyDevice *xendev,
> -                           bool to_domain, XenGrantCopySegment segs[],
> -                           unsigned int nr_segs);
> -
>   static inline void *xen_be_map_grant_ref(struct XenLegacyDevice *xendev,
>                                            uint32_t ref, int prot)
>   {
> @@ -70,6 +66,5 @@ static inline void xen_be_unmap_grant_ref(struct XenLegacyDevice *xendev,
>   void xen_config_cleanup(void);
>   int xen_config_dev_vfb(int vdev, const char *type);
>   int xen_config_dev_vkbd(int vdev);
> -int xen_config_dev_console(int vdev);
>   
>   #endif /* HW_XEN_LEGACY_BACKEND_H */

Reviewed-by: Thomas Huth <thuth@redhat.com>


