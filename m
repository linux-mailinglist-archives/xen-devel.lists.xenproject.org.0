Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A328902C9
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:14:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698964.1091289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rprS5-000472-Sd; Thu, 28 Mar 2024 15:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698964.1091289; Thu, 28 Mar 2024 15:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rprS5-00044z-PP; Thu, 28 Mar 2024 15:14:01 +0000
Received: by outflank-mailman (input) for mailman id 698964;
 Thu, 28 Mar 2024 15:14:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ab0Y=LC=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rprS4-00044r-S1
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:14:00 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd9c9e94-ed15-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 16:13:59 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33ec7e38b84so704405f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:13:59 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ea2-20020a0560000ec200b003432d79876esm1947746wrb.97.2024.03.28.08.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 08:13:52 -0700 (PDT)
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
X-Inumbo-ID: cd9c9e94-ed15-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711638839; x=1712243639; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vutwe9uQNhqbkQuib/VJsrR0Y5T7DY7pGtessWbxb5I=;
        b=PXFNm+mdpPm+wcgd/2Pj9+1P2tkID0md+7edaUTcxPIsxNRzcBIO7joqFf1H5BA17Q
         SvY0vz9JlcleWqC6AtqP0Tjm0s7t/h4+JiE7WMbgA/CYVLDpBhUwi3BqbkIFC+209cab
         nalhVsm7U0cb+JPZ14uxr/rySo5JrJtudGSUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711638839; x=1712243639;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vutwe9uQNhqbkQuib/VJsrR0Y5T7DY7pGtessWbxb5I=;
        b=eEqY4Xsh4Qyw3pFkAVUBon4/nXygvQCOq5kEspc5XlkCshZb0yFwwRlqAhB/v0sHIt
         osTVrF/vdLS2m/GaRjPEMGUhT0MVQmjJDVq2TV9wQD8JQwWNwUqR1AqVAmjHAgenGB13
         oc3IrGxzrCwDZ0mk8XK4cACNt5hzGp5kDehmAnwMIGchKACUcEvwTdXv+1oUL4DT0zNa
         EMW7EbdSp05iG8ncw2r2qkzjbWeZ8KJFMie0nS+MEBciGQgS7fJk+KSOf2nHsPHnbctd
         AC7FUvKNxjsbDi3yGwJ1eUqJsK5YPMcUDzLaLypRFtCbqrdwfCNCHRzKAmHBbiUP8kO6
         OeJg==
X-Forwarded-Encrypted: i=1; AJvYcCWWh+DTXPne/N+TjmgXI1m5uJGxHJFd2HUAObMTD97dcRoiO4yUBiDCKy4gUE7dcjYO5vbcawPA9NKLCa2IVHhh9OXeW05dk2XEApc8T50=
X-Gm-Message-State: AOJu0YzHTQPLbIEqtqWgfNBDeUntdvzBdW9ur8e7JH2t7UvhQIc7eFIt
	us80uc0xnUEdaZiUhrIM+TOURpQVCunD//DtcjSqJxW+x0yAwDF0I2Nb7erGbsI=
X-Google-Smtp-Source: AGHT+IGqAinQBfrXGU5/mTtpVN5DvsCj7MjTmxxo3BTpBz9VwcwzSMIjsSrbfaQrLhnH/z44soQEMQ==
X-Received: by 2002:adf:e9cf:0:b0:341:bf20:c840 with SMTP id l15-20020adfe9cf000000b00341bf20c840mr2502075wrn.11.1711638839070;
        Thu, 28 Mar 2024 08:13:59 -0700 (PDT)
Date: Thu, 28 Mar 2024 15:13:51 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
	kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH-for-9.0 v2 19/19] hw/xen: Have most of Xen files become
 target-agnostic
Message-ID: <83ff9fec-2ac1-418f-ac76-2256d03e676e@perard>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-20-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114143816.71079-20-philmd@linaro.org>

On Tue, Nov 14, 2023 at 03:38:15PM +0100, Philippe Mathieu-Daudé wrote:
> Previous commits re-organized the target-specific bits
> from Xen files. We can now build the common files once
> instead of per-target.
> 
> Only 4 files call libxen API (thus its CPPFLAGS):
> - xen-hvm-common.c,
> - xen_pt.c, xen_pt_graphics.c, xen_pt_msi.c
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Reworked since v1 so dropping David's R-b tag.
> ---
>  accel/xen/meson.build          |  2 +-
>  hw/block/dataplane/meson.build |  2 +-
>  hw/xen/meson.build             | 21 ++++++++++-----------
>  3 files changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/accel/xen/meson.build b/accel/xen/meson.build
> index 002bdb03c6..455ad5d6be 100644
> --- a/accel/xen/meson.build
> +++ b/accel/xen/meson.build
> @@ -1 +1 @@
> -specific_ss.add(when: 'CONFIG_XEN', if_true: files('xen-all.c'))
> +system_ss.add(when: 'CONFIG_XEN', if_true: files('xen-all.c'))
> diff --git a/hw/block/dataplane/meson.build b/hw/block/dataplane/meson.build
> index 025b3b061b..4d8bcb0bb9 100644
> --- a/hw/block/dataplane/meson.build
> +++ b/hw/block/dataplane/meson.build
> @@ -1,2 +1,2 @@
>  system_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
> -specific_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-block.c'))
> +system_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-block.c'))
> diff --git a/hw/xen/meson.build b/hw/xen/meson.build
> index d887fa9ba4..403cab49cf 100644
> --- a/hw/xen/meson.build
> +++ b/hw/xen/meson.build
> @@ -7,26 +7,25 @@ system_ss.add(when: ['CONFIG_XEN_BUS'], if_true: files(
>    'xen_pvdev.c',
>  ))
>  
> -system_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
> +system_ss.add(when: ['CONFIG_XEN'], if_true: files(
>    'xen-operations.c',
> -))
> -
> -xen_specific_ss = ss.source_set()
> -xen_specific_ss.add(files(
>    'xen-mapcache.c',
> +))
> +system_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
>    'xen-hvm-common.c',
>  ))
> +
>  if have_xen_pci_passthrough
> -  xen_specific_ss.add(files(
> +  system_ss.add(when: ['CONFIG_XEN'], if_true: files(
>      'xen-host-pci-device.c',
> -    'xen_pt.c',
>      'xen_pt_config_init.c',
> -    'xen_pt_graphics.c',
>      'xen_pt_load_rom.c',
> +  ))
> +  system_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
> +    'xen_pt.c',
> +    'xen_pt_graphics.c',

How is it useful to separate those source files? In the commit
description, there's a talk about "CPPFLAGS", but having `when: [xen]`
doesn't change the flags used to build those objects, so the talk about
"CPPFLAGS" is confusing.
Second, if for some reason the dependency `xen` is false, but
`CONFIG_XEN` is true, then we wouldn't be able to build QEMU. Try
linking a binary with "xen_pt_config_init.o" but without "xen_pt.o",
that's not going to work. So even if that first source file doesn't
directly depend on the Xen libraries, it depends on "xen_pt.o" which
depends on the Xen libraries. So ultimately, I think all those source
files should have the same condition: ['CONFIG_XEN', xen].

I've only checked the xen_pt* source files, I don't know if the same
applies to "xen-operations.c" or "xen-mapcache.c".

Beside this, QEMU built with Xen support still seems to works fine, so
adding the objects to `system_ss` instead of `specific_ss` seems
alright.

Thanks,

-- 
Anthony PERARD

