Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4641558E693
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 07:08:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383328.618523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLdwd-0006MP-1n; Wed, 10 Aug 2022 05:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383328.618523; Wed, 10 Aug 2022 05:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLdwc-0006Ix-Sw; Wed, 10 Aug 2022 05:07:50 +0000
Received: by outflank-mailman (input) for mailman id 383328;
 Wed, 10 Aug 2022 05:07:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CIQX=YO=gmail.com=lukas.bulwahn@srs-se1.protection.inumbo.net>)
 id 1oLdwa-0005BF-LX
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 05:07:48 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 603d2cd6-186a-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 07:07:48 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id k26so25713418ejx.5
 for <xen-devel@lists.xenproject.org>; Tue, 09 Aug 2022 22:07:48 -0700 (PDT)
Received: from felia.fritz.box
 (200116b826504800504e9aff21bf95aa.dip.versatel-1u1.de.
 [2001:16b8:2650:4800:504e:9aff:21bf:95aa])
 by smtp.gmail.com with ESMTPSA id
 ew12-20020a056402538c00b0043bbbaa323dsm7009781edb.0.2022.08.09.22.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 22:07:47 -0700 (PDT)
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
X-Inumbo-ID: 603d2cd6-186a-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=AYDlJnJ9PdqwWRCOXeLaxSS9GQWnExGZMPNDuuoNCE8=;
        b=bTfzSFHuqdVV0lFN/lzZnjifaJWhlYjtaAo1Ju6X9xnrzPfdXvNksvX94Xy3RNm4e0
         Mo9821IeGlN16p7oF4bUNWkUMBEiRDR38mAAkiW2tfLcSgRkWH+IL1kn4ANYCty1o6FO
         JMDWgAvxgqDhHN+hFR+CCGW6kuN4qer/EH+w2ZizF74vETRMr4fe46dEjzLc96Xb+Hq3
         adWDwQQXFnqviSrvb4sOEBhnqHqlumBOX2bQxTIsdGaLukSgPKq2vPqQpRd0ggX86e2f
         HHqjuoTg0lIPNrCr4nqOHYPSmPTrTRLnScYdD7VqPdv9v4IAj6I0dDN+Dx1GyCjxL/je
         bnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=AYDlJnJ9PdqwWRCOXeLaxSS9GQWnExGZMPNDuuoNCE8=;
        b=Ku+yfvFedegEEthnMsZO/PHUa/g5gqU9Hf3qu04zH180eqpQNP3xmEe+QVZEnnPFa6
         QH0r5D+9/H6QZj62xqIMh7FSLo9DJeYLAgLjqUnqFUBgborLbTppWnfXabChYib5K+oy
         ph//G94zP2WiFCBYLnUmLW2JrfM6VgCCkvkCzdmQBlDCJJSpXveQqGo/XLDpGhqofh9q
         UWqh+Fc7jAyHToSzmCk1hA7MFfm0+8tgqN6MgImK0tVG9Jz9IRuQNgdDDT4G6vo5Sd6K
         hq/M+LwyUmzyMTh7LtQT0WKWPJTiO8UAHdq7qCBTYwcZ8YFItg2TAyyJToMoCa17nWYz
         LYow==
X-Gm-Message-State: ACgBeo0QOVoq8nYcBgWntxMKH1FKt6zBK4qjgVTR+bJQjrNr7/xUGUau
	tSW7Py1+m3lsf2g09Y0ApmM=
X-Google-Smtp-Source: AA6agR7N5grn3FLzeXuLrRUfydMKCMsMWlGBR3iW3evvHqazBms9Xge3hhbgiHz69CDY/9axn9gf4g==
X-Received: by 2002:a17:906:7950:b0:730:f098:86ce with SMTP id l16-20020a170906795000b00730f09886cemr15915974ejo.390.1660108067589;
        Tue, 09 Aug 2022 22:07:47 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 4/4] MAINTAINERS: add xen config fragments to XEN HYPERVISOR sections
Date: Wed, 10 Aug 2022 07:07:12 +0200
Message-Id: <20220810050712.9539-5-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220810050712.9539-1-lukas.bulwahn@gmail.com>
References: <20220810050712.9539-1-lukas.bulwahn@gmail.com>

Make changes to the xen config fragments reach the XEN HYPERVISOR
maintainers and mailing list.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ee2098fc6f7c..6c2516b3da21 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22217,12 +22217,14 @@ F:	drivers/*/xen-*front.c
 F:	drivers/xen/
 F:	include/uapi/xen/
 F:	include/xen/
+F:	kernel/configs/xen.config
 
 XEN HYPERVISOR X86
 M:	Juergen Gross <jgross@suse.com>
 R:	Boris Ostrovsky <boris.ostrovsky@oracle.com>
 L:	xen-devel@lists.xenproject.org (moderated for non-subscribers)
 S:	Supported
+F:	arch/x86/configs/xen.config
 F:	arch/x86/include/asm/pvclock-abi.h
 F:	arch/x86/include/asm/xen/
 F:	arch/x86/platform/pvh/
-- 
2.17.1


