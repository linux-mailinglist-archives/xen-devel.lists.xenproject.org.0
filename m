Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C666992E9A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 16:16:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812034.1224709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxoWn-0003VV-Jc; Mon, 07 Oct 2024 14:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812034.1224709; Mon, 07 Oct 2024 14:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxoWn-0003PJ-GZ; Mon, 07 Oct 2024 14:16:01 +0000
Received: by outflank-mailman (input) for mailman id 812034;
 Mon, 07 Oct 2024 14:16:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWQm=RD=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sxoWm-0002dC-Bi
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 14:16:00 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac8acb83-84b6-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 16:15:58 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c88e45f467so7377292a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 07:15:58 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e05c119esm3386204a12.55.2024.10.07.07.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 07:15:57 -0700 (PDT)
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
X-Inumbo-ID: ac8acb83-84b6-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728310558; x=1728915358; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRy9E4WznSom1/J2SL1lqN+BMsNpK3QJfQzYcePqKBM=;
        b=U0BRj+1EFayGnxqF3DrtI/WXWs7JsnXjt9SIqL5tx9A6hWVJToBJUXtxZDzlb2Y1XL
         wv5y5kdd0asreaKdP1pOnDi4ltcL0lr1JDK9kbiG9cyQIdV8joJ5+XK3MJ532PFtmGcJ
         EomCUbiPZZW/t4rudu9DfirJWkd3V23Lf8/Qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728310558; x=1728915358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MRy9E4WznSom1/J2SL1lqN+BMsNpK3QJfQzYcePqKBM=;
        b=obqZxP91uS0+tONWi+PxpsnK+OeW4QpTEFc6BsS5Mprx8V3dXsIBMtimROas6Vh8Bn
         JYkbLu/NBgvhmSxKJaxW3bFv6fSFiVjy4hrni8JvbsNAy162Sw4yIvjH/dyE28l0431S
         62a48EArqBTsgEeWynOBDyMXRHWrf2wj3urkkfUVitQ1ByLfyaDQISTwPf9mgBZvvlAa
         HzCA5aDNijeoq/fLvK4PLJrOvleZdZXifbuwz9D1+/t1DuzK6we0QvOf+t3gKBv3elbG
         scDMGZ2HZG+PHgVdBmT9He0A7XaEaMq4Iw+9yycghbG2sHsRSC4TamAZNHzwqEO2Y+ux
         Jy0A==
X-Gm-Message-State: AOJu0Yw8wj0DDanLn0hrDsECU2weptln2mWT4UnSZUd4BK+AhNFeu7vV
	i/Wv6w8DcVghOnGdMpIG5Rn+gBJ4hIknEVGsnDS8CrQ1nhhWBJhiyYgpheAj88kS1Sc6GYntPoq
	8
X-Google-Smtp-Source: AGHT+IFvMZ3MdnMKNmBIXqM2N3QWIBgPc3V0XUJuKrj9sTyeYf5AjCIfkMr96MfWko9Ru+iosrKe+w==
X-Received: by 2002:a05:6402:13c1:b0:5c8:a023:6b8b with SMTP id 4fb4d7f45d1cf-5c8d2f7d4bbmr14029909a12.15.1728310557854;
        Mon, 07 Oct 2024 07:15:57 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/6] .gitignore: Remove not generated files
Date: Mon,  7 Oct 2024 15:15:34 +0100
Message-Id: <20241007141539.1899350-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007141539.1899350-1-frediano.ziglio@cloud.com>
References: <20241007141539.1899350-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both reloc.S and cmdline.S are not generated since commit
d58a509e01c4833515a9a8340706d1a23bef168b
("build,x86: remove the need for build32.mk").

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 .gitignore | 2 --
 1 file changed, 2 deletions(-)

diff --git a/.gitignore b/.gitignore
index d88be80b28..5a75b204f7 100644
--- a/.gitignore
+++ b/.gitignore
@@ -248,8 +248,6 @@ xen/.config.old
 xen/.xen.elf32
 xen/System.map
 xen/arch/x86/boot/mkelf32
-xen/arch/x86/boot/cmdline.S
-xen/arch/x86/boot/reloc.S
 xen/arch/x86/boot/*.bin
 xen/arch/x86/boot/*.lnk
 xen/arch/x86/efi.lds
-- 
2.34.1


