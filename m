Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 139A8AAFDCB
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 16:52:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979480.1366085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD2aR-0004rG-KW; Thu, 08 May 2025 14:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979480.1366085; Thu, 08 May 2025 14:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD2aR-0004o8-GX; Thu, 08 May 2025 14:50:59 +0000
Received: by outflank-mailman (input) for mailman id 979480;
 Thu, 08 May 2025 14:50:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=326h=XY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uD2aP-0004nj-H3
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 14:50:57 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8710715-2c1b-11f0-9eb4-5ba50f476ded;
 Thu, 08 May 2025 16:50:55 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ace94273f0dso224936966b.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 May 2025 07:50:55 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad1891e980bsm1082773266b.76.2025.05.08.07.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 07:50:53 -0700 (PDT)
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
X-Inumbo-ID: d8710715-2c1b-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746715855; x=1747320655; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+HBTqfZR6NgZG35K7mvp1+0cDkzEQonUk7EnQP6X5Rc=;
        b=ONkhpWC1JYfHK259RBkoAsFyFLS27YkCT1mF5KVrX8iq8bLIVST3RnbABYqn92xVsn
         apMILovqBmS4bjAngpYOihpLMEskA9yYKvSyZ/hB4wZEELOgpXQAgWcke+LNVlZT/UZT
         e4L92jqL4sSeHu/Quw68ZyHsofKGNfDCcQVwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715855; x=1747320655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HBTqfZR6NgZG35K7mvp1+0cDkzEQonUk7EnQP6X5Rc=;
        b=UpPwRQrN4PaZd3q3MjLzFUpBohrGKGthSCHGARfuJviDcOEPulwDl84AIe4HZDQlIz
         HZ6P0QXU6Bt586z8+VGZ9FUhUKOzu/O/KspJWhmz3n48o4+GNCy7AOeozF3PZ4ZQuXRS
         cYTyiiS8CFyeoEVD0RUtNCgxXDpBL/Fxsgt6fuUyP8HnvBVwoe2/RFEcSswHc3rBcWdv
         R44TVVf/2I8uYIEfeNEehnW/SScBh0PFuNsV+OoyUvK+uU5XfGrLh3ATkr/EUzkELYJ3
         8N+n2tHvH6TT2q9cYKNDu8XBPpevTQdQDpWhdB7Ip+UIwiF3vnjhdmODMirIJmcCbxMm
         66lA==
X-Gm-Message-State: AOJu0YxzCMt8qhuuv+9vbSNp0VRk0Gryj9a902HceQzuNS7W4JYqJZDw
	rKNU28xK8V+L5JOhVbkQxdk7gEzPpSwW4/EexbzG/AF0Y4RcpfAj4Cee3p/5ocA=
X-Gm-Gg: ASbGncsaXhMpj1YyEFgbzXzT5oPTO/9LWwoB2pYeOjg405rI25FTnCnEWAp6yvAAFF3
	RQx9r1u53WMZdsp8E45oenCxr4HU1aRA6QyqLTAXDggyg0sOUskka8x0FgYx7hF8sjn/D1I8GlV
	E/hO/VIVpetVi2r+g9emHjLeHBHWi5oJ+0Bvaa84pWYcdk8d0KSNPmfhsaHOICxriHStOFUWpKk
	OQFJ/iOTNVJdLpG6ZsrRlvqBieyAF/vst6rITAs9/IqBd7ZArIBanNGc8l8+DnmiiJkmUR+5k63
	ybc2R+VU/6B+igp2tTnJZQb5QlCGmvrcQfLFUzkQTkxpuDGZfcHnTbUY
X-Google-Smtp-Source: AGHT+IHVteMDKEbgiX2m/l1kNbOGwyh/EehWfvJIEnkd6Qqaw/eelrg0fDGX+aNUXltFRVI+OqOZ6w==
X-Received: by 2002:a17:907:7246:b0:ace:68a5:ec50 with SMTP id a640c23a62f3a-ad1fe8e7fcemr297285866b.45.1746715854131;
        Thu, 08 May 2025 07:50:54 -0700 (PDT)
Date: Thu, 8 May 2025 16:50:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org, Kevin Lampis <kevin.lampis@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] livepatch: Pass buffer size to list sysctl
Message-ID: <aBzEzP93_gsMU_4o@macbook.lan>
References: <20250507163859.354711-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250507163859.354711-1-ross.lagerwall@citrix.com>

On Wed, May 07, 2025 at 05:38:59PM +0100, Ross Lagerwall wrote:
> From: Kevin Lampis <kevin.lampis@cloud.com>
> 
> The livepatch list sysctl writes metadata into a buffer provided by the
> caller. The caller is expected to allocate an appropriately sized buffer
> but this is racy and may result in Xen writing beyond the end of the
> buffer should the metadata size change.
> 
> The name buffer is expected to be an array of elements with size
> XEN_LIVEPATCH_NAME_SIZE to avoid this kind of race but the xen-livepatch
> tool allocates only as many bytes as needed, therefore encountering the
> same potential race condition.
> 
> Fix both these issues by requiring the caller to pass in the size of the
> name and metadata buffers and then not writing beyond the allocated
> size.
> 
> The sysctl interface version is bumped due to the change in semantics of
> the fields.
> 
> Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>  tools/libs/ctrl/xc_misc.c   |  3 +++
>  xen/common/livepatch.c      | 22 +++++++++++++++++-----
>  xen/include/public/sysctl.h | 12 ++++++++----
>  3 files changed, 28 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/libs/ctrl/xc_misc.c b/tools/libs/ctrl/xc_misc.c
> index 6a60216bda03..33e87bac2868 100644
> --- a/tools/libs/ctrl/xc_misc.c
> +++ b/tools/libs/ctrl/xc_misc.c
> @@ -867,6 +867,9 @@ int xc_livepatch_list(xc_interface *xch, const unsigned int max,
>          set_xen_guest_handle(sysctl.u.livepatch.u.list.metadata, metadata);
>          set_xen_guest_handle(sysctl.u.livepatch.u.list.metadata_len, metadata_len);
>  
> +        sysctl.u.livepatch.u.list.name_total_size = name_sz;
> +        sysctl.u.livepatch.u.list.metadata_total_size = metadata_sz;
> +
>          rc = do_sysctl(xch, &sysctl);
>          /*
>           * From here on we MUST call xc_hypercall_bounce. If rc < 0 we
> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> index be9b7e367553..72ef22bea5d2 100644
> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -1311,11 +1311,10 @@ static int livepatch_list(struct xen_sysctl_livepatch_list *list)
>          return -EINVAL;
>      }
>  
> -    list->name_total_size = 0;
> -    list->metadata_total_size = 0;
>      if ( list->nr )
>      {
>          size_t name_offset = 0, metadata_offset = 0;
> +        uint32_t name_total_copied = 0, metadata_total_copied = 0;
>  
>          list_for_each_entry( data, &payload_list, list )
>          {
> @@ -1328,10 +1327,14 @@ static int livepatch_list(struct xen_sysctl_livepatch_list *list)
>              status.rc = data->rc;
>  
>              name_len = strlen(data->name) + 1;
> -            list->name_total_size += name_len;
> -
>              metadata_len = data->metadata.len;
> -            list->metadata_total_size += metadata_len;
> +
> +            if ( ((uint64_t)name_total_copied + name_len) > list->name_total_size ||
> +                 ((uint64_t)metadata_total_copied + metadata_len) > list->metadata_total_size )

I would define name_total_copied and metadata_total_copied as size_t,
and then avoid doing the cast to uint64_t here.

Also please adjust line length to 80 characters max.

Thanks, Roger.

