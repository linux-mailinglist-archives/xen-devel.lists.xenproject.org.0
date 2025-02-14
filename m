Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F64AA35904
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 09:38:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888592.1297943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tirCi-0000Rv-K6; Fri, 14 Feb 2025 08:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888592.1297943; Fri, 14 Feb 2025 08:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tirCi-0000QT-Gh; Fri, 14 Feb 2025 08:37:44 +0000
Received: by outflank-mailman (input) for mailman id 888592;
 Fri, 14 Feb 2025 08:37:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zro/=VF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tirCg-0000QN-QL
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 08:37:42 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f303a371-eaae-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 09:37:40 +0100 (CET)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-21f78b1fb7dso30769725ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2025 00:37:40 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7324273e422sm2689698b3a.109.2025.02.14.00.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 00:37:38 -0800 (PST)
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
X-Inumbo-ID: f303a371-eaae-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739522259; x=1740127059; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sRN9mUQ80FrjgTSqWQnbmTICKWlodAFApkavZuOf1Xc=;
        b=u/HYRxanKyUJO+hWoAh/KGbXq851uk263kdhTqNKmLxOMSZHsjF5dmaSJvp1Pxbqfl
         nXTgqWr+3ZZ1bA+cJCE9bjakD8T/iRZwh6II3fb0EPgeFmbhrOWasM0nZUN7kgkzQ13Q
         6CyGjoj0lVeDHU/rQ4W67zfysYnpINUmqfNJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739522259; x=1740127059;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sRN9mUQ80FrjgTSqWQnbmTICKWlodAFApkavZuOf1Xc=;
        b=MUFKsbNqpcO78u7buYMNx5jxBOk7cf5K/FG6npFL1zvzPldzCD1Vt5hyj7B0QcVVCJ
         gE5rFK0jzys/rcds3U13jGDjfjVas3ypkHLByucaQ9QAByrFm4vBwaK7BqyFUNyCQSNx
         bEB4Cb2nnvmZvfqSELeBW0V4LlWy6GDDljyR0tpyAJZ7zqnTpySIG6CgqQrxhGTOntZi
         DHUbP8L3A8VxKwrL4G6j72Hykw29KWx6LTh2+LcUVgHbL6fiNHFm9hjg/1ht/yJcn0qr
         sj4ySbONeAEEx4qILM2iu/LUn5zWOtRPHgRwN5XIuflGHsnca4I4PJzuysWBS2S4ZVwt
         8sWw==
X-Gm-Message-State: AOJu0YzioxtxZw+AFbL/Rz+seeiGa5+ZmoHPGyknTY8BJ350JLHoduHj
	V/1kOiI2PUtGnVcBSNmzp0mvbSLOthIbAQ/3nm7fRV1GfOUloM1T3xyQiKpMms4=
X-Gm-Gg: ASbGncuTlV8gyUGS++Yd1QiEtsJkGlR28hia34IJffeFt4kwhMC0puZNaym80ZPlUaQ
	LFtdzXUrlAQ2erhpgRARW/FiaK6+/+C8GxpqtCqo+6z6u0YMxGafltC8AczmW/ktKWYV5HFwI4c
	zwW6oJ1dYKnp6RsP8IS3izuR0BeQ2JJohkIXXGxu7563a24bawoIc/cEBvoX+Uv4//YU3mAVukV
	SEIYz+R44dISVm5uwu7dddn2Mi+cjE94IUPu59lChM4rLUMkOnT7r0k+8EcVVrbAlZZgE0e9G80
	HaBs7Tfg6Cjwe1tDPFA9
X-Google-Smtp-Source: AGHT+IHnZoOdAqrM2U7t6eqdKlB4X72rLw4jBCVI/LdqahL8roouvarA91paoODcbxR1Fc7llwkRfg==
X-Received: by 2002:a05:6a21:112:b0:1ee:7b6c:e2f4 with SMTP id adf61e73a8af0-1ee7b6ce592mr5877475637.26.1739522258805;
        Fri, 14 Feb 2025 00:37:38 -0800 (PST)
Date: Fri, 14 Feb 2025 09:37:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/MCE: fail init more gracefully when CPU vendor isn't
 supported
Message-ID: <Z68AzZ1wYCwso55r@macbook.local>
References: <d27c75e2-df05-41b9-84d4-9d3d6443ef1d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d27c75e2-df05-41b9-84d4-9d3d6443ef1d@suse.com>

On Thu, Feb 13, 2025 at 02:24:53PM +0100, Jan Beulich wrote:
> When mcheck_init() doesn't recognize the CPU vendor, it will undo the
> all-banks allocation, and it will in particular not install the CPU
> notifier. This way APs will pointlessly try to re-establish an
> all-banks allocation, while then falling over NULL pointers due to the
> notifier hot having run and hence not having allocated anything for
           ^ not
> them.
> 
> Prevent both from happening, and additionally delay writing MCG_CTL
> until no errors can occur anymore in mca_cap_init().
> 
> Fixes: 741367e77d6c ("mce: Clean-up mcheck_init handler")
> Fixes: a5e1b534ac6f ("x86: mce cleanup for both Intel and AMD mce logic")
> Fixes: 560cf418c845 ("x86/mcheck: allow varying bank counts per CPU")
> Reported-by: Teddy Astie <teddy.astie@vates.tech>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

The relation between the notifier setting up the state and the init
path seems quite convoluted, but that would require a major refactor
of the logic.

Thanks, Roger.

