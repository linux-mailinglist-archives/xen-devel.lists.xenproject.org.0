Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A9F9FFCA1
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 18:14:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864355.1275568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTOlO-0006Ls-ES; Thu, 02 Jan 2025 17:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864355.1275568; Thu, 02 Jan 2025 17:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTOlO-0006KE-B8; Thu, 02 Jan 2025 17:13:38 +0000
Received: by outflank-mailman (input) for mailman id 864355;
 Thu, 02 Jan 2025 17:13:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NS6K=T2=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1tTOlM-00065f-6X
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 17:13:36 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5b8eba2-c92c-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 18:13:34 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-385e0d47720so734557f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2025 09:13:34 -0800 (PST)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1fa2bdfbsm37802386f8f.102.2025.01.02.09.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 09:13:32 -0800 (PST)
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
X-Inumbo-ID: e5b8eba2-c92c-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735838013; x=1736442813; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pCkGEsGgCE2RUpUM015/qmwQ+iljMTVTTCfZJTPvFk=;
        b=E0mSIvTeiW4NXIBAaudPGbmqOPiS8VAALpC/xpWSbwBjjG4gYtR0bsxe7SJH7Vl9ZH
         PTr1/ryEbYjlZP86k7VgnQ9BJNR5yp3i2uigjt/Yy8WBbeNKDL2eBGXA7Ab05SzFjIO9
         MaC6RTgMHLZh1llH9mXpPSdqdNhj599HQJ4luEw5jscpiDiHImU84/Vdr3MOTXF9omvz
         kCwHb777CY73AZNtFLr3Pc2XF4EC7fN0TEn6zFzxGTYfo1GQA7GecxK5JW6D/Ynm6hOq
         K63r6vNCytxR5Y83ul3SGgWxXsaCeEWnBSLXQlgmO9Rvss8Vu+7Cd+hT57bPVK1+eWjJ
         vcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735838013; x=1736442813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pCkGEsGgCE2RUpUM015/qmwQ+iljMTVTTCfZJTPvFk=;
        b=StOIiwT0pFsg/qRIWRDRUUeDX0iaIvoEx5ysRRJbICr45Ov0VlHTHXFlYGi9uZ3p64
         RLczwQFlTCW5RkkPHKL1EZnS1e7cBuf5vSpK9ndlPK9MOVia1TkipnD4kBSddeDqOC3v
         MGiVi+E0BiJA6JqqxLyq7tSEUvKDvCb0ynAvp2f0khziV+DnIWHbnHd0CWC3sddkUF2y
         jxSlQqERoPOmSkvdxGeVRdgFYcAPcfzsokhM2HKvLc8nPZ/xZKvdP4tto6rl6mOB3oXy
         KtVvhexBuT2AebrKP1r7ER4njlBFzEPFZlMsOOV8Z0e1qOHgyOnz5scuWcavAW0tpNhk
         jsWw==
X-Gm-Message-State: AOJu0YyyPv7Pe9s+jHkIqyA+o0XfagtMMFpnD/0hHC71bn+l7WGNrIYV
	oJA8tH96vp3y39jHfspnYhYkQOMFP3J1lhkyDtF5Bar4HeA5pphlvX67TA==
X-Gm-Gg: ASbGncvmUeyQfq410jdjuwV+E4nxyzLnEBp91f+RKrS+v9zncDb472rK+CU7To+JDE2
	9FifGDDtEQLrL5ciICxyycBQidUMLMRv2HjCjXR91WNHvwtSN+4dBHQNLGZ9MZ3AjvvorUSiSqd
	6r7j8Mmdmxmm04z9bsuTntZvFsIIAicz+FnmCt86RgwOjQ9MewGdo8oK7TCpwKt5id1Rd8EYJeP
	Pk9PE5A3mUU/kFjDtkC4swDq9UkNZ062FduOiU/9Yh7smab/uj69RTSzK6A08jsNbL54Kq6H0Ql
	yOz+89DQj9bJyyUWLmAtcSs3nI3ESB3mYahVGTPjkw9FgMwxqUA5BWjW
X-Google-Smtp-Source: AGHT+IGYDpkSNkvHtFM2qH5s7Fu+H5ZZzcNWv6CQkRXAJ3ra1stNszeMpLBpXgsgkabfufbTUswc8g==
X-Received: by 2002:a05:6000:2c3:b0:385:f1bc:7644 with SMTP id ffacd0b85a97d-38a221f9f85mr16921092f8f.6.1735838013338;
        Thu, 02 Jan 2025 09:13:33 -0800 (PST)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v3 1/2] x86: Rename _rsvd field to pw and move it to the bit 58
Date: Thu,  2 Jan 2025 17:13:27 +0000
Message-Id: <525e1ef971f06e8f2ef196e52a150820d155a5c0.1735837806.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1735837806.git.w1benny@gmail.com>
References: <cover.1735837806.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

The EPT Paging-write feature (when enabled by the TERTIARY_EXEC_EPT_PAGING_WRITE bit) uses bit 58 of the EPT entry to indicate that guest paging may update the page, even if the W access is not set.

This patch is a preparation for the EPT Paging-write feature.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
---
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index f0ec459622..d920de96b7 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -34,8 +34,8 @@ typedef union {
                                EPT/VT-d usage */
         mfn         :   40, /* bits 51:12 - Machine physical frame number */
         sa_p2mt     :   6,  /* bits 57:52 - Software available 2 */
-        access      :   4,  /* bits 61:58 - p2m_access_t */
-        _rsvd       :   1,  /* bit 62 - reserved */
+        pw          :   1,  /* bit 58 - Paging-write access */
+        access      :   4,  /* bits 62:59 - p2m_access_t */
         suppress_ve :   1;  /* bit 63 - suppress #VE */
     };
     u64 epte;
-- 
2.34.1


