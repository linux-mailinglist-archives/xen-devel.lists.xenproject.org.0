Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E48A9EA3D
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 10:04:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970231.1358971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9JSx-00058g-JK; Mon, 28 Apr 2025 08:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970231.1358971; Mon, 28 Apr 2025 08:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9JSx-00057Q-GW; Mon, 28 Apr 2025 08:03:51 +0000
Received: by outflank-mailman (input) for mailman id 970231;
 Mon, 28 Apr 2025 08:03:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EzXt=XO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u9JSv-00057K-Ri
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 08:03:49 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e399f88-2407-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 10:03:44 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3913b539aabso2425597f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 01:03:44 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a073cbede5sm10233127f8f.49.2025.04.28.01.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 01:03:43 -0700 (PDT)
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
X-Inumbo-ID: 4e399f88-2407-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745827424; x=1746432224; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UB3Zl1XmZkw3Ra9H0Zj8H2ScPxIBTUw8yS+6fsbcQTA=;
        b=T/igFf1QCXp4qjXHduMZZi/5s3qyjg2W0jRVWfmqfnn6ot5PZhxaWBS0SO+kt/xTVc
         fcGjeAcE/bdSQ9yKQoQTA16wDUGCH3zQC+nrNLWViWLnAaIXmI4H0iqgpmkN08zBM1fj
         dKywLeMEyfBkWYS9fgmwiHMaJb2FrSxPdrTDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745827424; x=1746432224;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UB3Zl1XmZkw3Ra9H0Zj8H2ScPxIBTUw8yS+6fsbcQTA=;
        b=ONBIIbKH0jOHLzrOEpkG9kHDxlG6Ex+zaFFKG8SukQeZcYJw//O9UTAVhMSL+vnPxg
         LQngxOamdUZRKaKGr7EGbSUTKpJatuQBB5AKQIYKdo/a0BIGvb3JaJ40Z+VpNw6YRYti
         6NqXwEAB+XNjrDvLMvEepE0pWMa2JYjQihokKJQo7eT8uiLYbFA1yLtE05kdBh4uMDrL
         qCY8b/OrcILQJUK6HHYj9kSP/vtz8wPJKIpenECJy9I0EBWGgR2ZYz7XqQbmQgrvZSni
         lkvGC7jye6hdMBeKEll3tw5yei2AgD+yWvSqnDamFzNf6+lDkLkBkGxOn9CV4/pXJo73
         IBCA==
X-Gm-Message-State: AOJu0YxOC3s+0tL1afD+/NyGHxEqlAHgcyc36t/RLu8gnq7H6cl1Xeki
	9HUnpGNvv01TzCkSyKJajjubcj7eRcouuGIb5skcmOt0ILE37PHSGxwh+o6YSsc=
X-Gm-Gg: ASbGnctEJ43nhFBIXdlCTBddsfYBrKXbHQPCzyxOAq+z2r8sgJynPJlwxLn8pKGVXJj
	ISNEN+hYVpIjEi6fyvbleklke4MLHJJhnScxKPwUM3C3Xzn19JE0O/DLTh+//BRAL80DjqjwUF3
	MoPRd1B3bZnRH/jGGE/aAXV2h4AM7/a+ySBT6DU9EEEJ537DtgZ9kziaiULnCya07+dmPwydbp4
	pXq3rc1zN9dDklqHO58g12nrmIYGWc1w1x0q1odeX4ri8z6wuhqvOTqmYF085qXX+HsZUh1InYZ
	RYt/erOqK3xiAysljN5+yv49mOLBrKpT90z/19mPk+pxhw==
X-Google-Smtp-Source: AGHT+IExPZa9Bzy0MJ4vEvre3eiUFj5dVFynCBzmtsnJ9E+66Gt8OzzSGnDlHGhuwy6gr5xR2S3rFw==
X-Received: by 2002:a05:6000:2483:b0:39c:13fd:ea9c with SMTP id ffacd0b85a97d-3a07ab85d86mr6081871f8f.47.1745827424026;
        Mon, 28 Apr 2025 01:03:44 -0700 (PDT)
Date: Mon, 28 Apr 2025 10:03:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2] x86: constrain sub-page access length in
 mmio_ro_emulated_write()
Message-ID: <aA8zT3m8Q4__2SmX@macbook.lan>
References: <8e31896e-3603-4969-af7c-3175ceacff55@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e31896e-3603-4969-af7c-3175ceacff55@suse.com>

On Fri, Apr 25, 2025 at 04:57:18PM +0200, Jan Beulich wrote:
> Without doing so we could trigger the ASSERT_UNREACHABLE() in
> subpage_mmio_write_emulate(). A comment there actually says this
> validation would already have been done ...
> 
> Fixes: 8847d6e23f97 ("x86/mm: add API for marking only part of a MMIO page read only")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v2: Emit a warning message otherwise.
> 
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5195,8 +5195,13 @@ int cf_check mmio_ro_emulated_write(
>          return X86EMUL_UNHANDLEABLE;
>      }
>  
> -    subpage_mmio_write_emulate(mmio_ro_ctxt->mfn, PAGE_OFFSET(offset),
> -                               p_data, bytes);
> +    if ( bytes <= 8 )
> +        subpage_mmio_write_emulate(mmio_ro_ctxt->mfn, PAGE_OFFSET(offset),
> +                                   p_data, bytes);
> +    else if ( subpage_mmio_find_page(mmio_ro_ctxt->mfn) )
> +        gprintk(XENLOG_WARNING,
> +                "unsupported %u-byte write to R/O MMIO 0x%"PRI_mfn"%03lx\n",
> +                bytes, mfn_x(mmio_ro_ctxt->mfn), PAGE_OFFSET(offset));

It feels more natural to me to use:

"unsupported %u-byte write to r/o MMIO %#lx\n",
bytes, mfn_to_maddr(mmio_ro_ctxt->mfn) + PAGE_OFFSET(offset)

As it simplifies the printf format string, but that's just my taste.

Thanks, Roger.

