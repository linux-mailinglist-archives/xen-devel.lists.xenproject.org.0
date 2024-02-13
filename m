Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB846853964
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 19:04:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680125.1058010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZx8L-0004Kz-Qe; Tue, 13 Feb 2024 18:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680125.1058010; Tue, 13 Feb 2024 18:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZx8L-0004JC-O5; Tue, 13 Feb 2024 18:03:53 +0000
Received: by outflank-mailman (input) for mailman id 680125;
 Tue, 13 Feb 2024 18:03:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gnrE=JW=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rZx8J-0004J6-Vt
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 18:03:51 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3dc0628e-ca9a-11ee-8a4d-1f161083a0e0;
 Tue, 13 Feb 2024 19:03:50 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-411d231ea71so3441065e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 10:03:50 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 w17-20020a05600c475100b00411062c123esm5119041wmo.26.2024.02.13.10.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 10:03:49 -0800 (PST)
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
X-Inumbo-ID: 3dc0628e-ca9a-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707847430; x=1708452230; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7M0bgXJxih24HFHY2drPmFWNVAVIDuvtRembp5cfhk4=;
        b=clOMFFegaros0gGvTx+lk+0QJv0arS9oXy7CLbTTRAClyOugFQ+sJ/chf/fwIJwR+W
         Rrwt2En5zEWc2PRTBpJEa21fF1kkzlEU2DC4sesg0UeEbhOvUDa4Y0t+NsSD08vcAar0
         dNMt1vGSjzUOi6T5qM2Rzv+WV/WI/7DZ4PQE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707847430; x=1708452230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7M0bgXJxih24HFHY2drPmFWNVAVIDuvtRembp5cfhk4=;
        b=KmSxEEDBmEak16siSFgsRhNICK1r0vi+Wq9YRFHUnEJg7whs61sj2ySJAjED0tqraY
         NMfWtVshncK9ifhvK/+ZWxO3PP1/MtsGAJ2OPgPG5QP1d8WFH7yPXG//jHcqtB3GATNY
         sAfYX3XdjEFk3gjm5CgYaJeUdYHLnDwG90aVjap/2Y6qzt9fNzNuGiqtT5d9NEyHBhVn
         qb3+6DauflE8r6Eun3dApT0F54HmlPElRktFfUdToV7U7Oiq5HJYoQhKM2uNDJzlWua7
         4t+iow/1/J2JovqEbl8i1sdDy2uzDhVQwYWoO0Rmdq7mEKuZoss95GAUfN8BPieNUxNX
         LT1A==
X-Gm-Message-State: AOJu0Ywt4lsJlCH+FZ9O2eEfHno9PWGtGeBIfsNureTnEtuX72/gbi6E
	Yi5akxnYWN7+rOTO3SZ/RWrgslGDyztQMPRh+R8BwxnQvS2lQy/7HI0SFKAAdCY=
X-Google-Smtp-Source: AGHT+IGE8XquhgKhtZWY7Ryp3SKnVu0sGy0jbAjZYde57mPrefI9TkJFhwQCYDSbkxr5ofxCBHUflQ==
X-Received: by 2002:a05:600c:5021:b0:40f:d3e4:8f85 with SMTP id n33-20020a05600c502100b0040fd3e48f85mr339895wmr.30.1707847430123;
        Tue, 13 Feb 2024 10:03:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX3kcDbpGD7EEotgPByO7VcuHu02Vk48EzChJ3t6vmm6/uy5cgCT+HW6mEGkB9YiYqGDp/Eu+Pw86+4Bl4ClksIidlFdUlYzN7jNRu1VWGPmFkxPRgcaXBIamZLEyiwBqBPmtC6YAn8oIwuf6p06TQLu9R1sVa8rS+uC0jvcT8aiBysrC0Jf22XwzcagBfrM4dyzuuEoVg=
Date: Tue, 13 Feb 2024 18:03:49 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>,
	Jason Andryuk <jandryuk@gmail.com>,
	George Dunlap <george.dunlap@cloud.com>
Subject: Re: [PATCH v5 15/22] tools/libs/light: add backend type for 9pfs PV
 devices
Message-ID: <5e6893dd-5280-4a14-8d00-4ed76e8c8e98@perard>
References: <20240208165546.5715-1-jgross@suse.com>
 <20240208165546.5715-16-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240208165546.5715-16-jgross@suse.com>

On Thu, Feb 08, 2024 at 05:55:39PM +0100, Juergen Gross wrote:
> +struct libxl__aop9_state {
> +    libxl__spawn_state spawn;
> +    libxl__ao_device *aodev;
> +    libxl_device_p9 p9;
> +    uint32_t domid;
> +    void (*callback)(libxl__egc *, libxl__aop9_state *, int);

This "callback" is never used, right?

> diff --git a/tools/libs/light/libxl_types_internal.idl b/tools/libs/light/libxl_types_internal.idl
> index e24288f1a5..39da71cef5 100644
> --- a/tools/libs/light/libxl_types_internal.idl
> +++ b/tools/libs/light/libxl_types_internal.idl
> @@ -34,6 +34,7 @@ libxl__device_kind = Enumeration("device_kind", [
>      (16, "VINPUT"),
>      (17, "VIRTIO_DISK"),
>      (18, "VIRTIO"),
> +    (19, "XEN_9PFS"),

That's going to need to be rebased ;-).

Patch looks fine otherwise: Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

