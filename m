Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A63A4BAED
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 10:38:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900057.1307977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp2FZ-0007sy-2P; Mon, 03 Mar 2025 09:38:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900057.1307977; Mon, 03 Mar 2025 09:38:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp2FY-0007qw-W5; Mon, 03 Mar 2025 09:38:12 +0000
Received: by outflank-mailman (input) for mailman id 900057;
 Mon, 03 Mar 2025 09:38:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kHuu=VW=redhat.com=lbulwahn@srs-se1.protection.inumbo.net>)
 id 1tp2FY-0007qq-0A
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 09:38:12 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36f040c2-f813-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 10:38:09 +0100 (CET)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-kJAge1ofPyeM0hhBqOsSFw-1; Mon, 03 Mar 2025 04:38:06 -0500
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-5e496b51f38so5321097a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 01:38:06 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb
 ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e4c3b6cfd0sm6614899a12.28.2025.03.03.01.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 01:38:02 -0800 (PST)
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
X-Inumbo-ID: 36f040c2-f813-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740994688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jtFF5Isb4vaWOmkrbTb6ml0NHfU6CXUYn/xbKnf16mo=;
	b=WCgMyMPlVOhdpedDPQWW+VdymGv6D62Xh4ZMwgiH/nPz5LdmegEXfeWK6p74Dw97A0STuK
	ZDf5VsCOhY3U3QDhHus/3/VQNoY3euD6+dQBJiXSNQN03hwJEFsoRPE0bGiwreOVTXSz62
	qsDpMr1TxV4QMPZTLKqD9w3aUZfDahI=
X-MC-Unique: kJAge1ofPyeM0hhBqOsSFw-1
X-Mimecast-MFC-AGG-ID: kJAge1ofPyeM0hhBqOsSFw_1740994685
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740994685; x=1741599485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtFF5Isb4vaWOmkrbTb6ml0NHfU6CXUYn/xbKnf16mo=;
        b=nXKqUEYeOTFFJl5V9OjGeEs+xpUCrN1Dxtk7rryw2lQwsbbGfnTsJccVoxi6WP9vWQ
         BNUIqNBVrAgxOybeoV3P2bEXrlh81fgVgd2oXCZoeuhWNim2TQeQ65WKq0ZkzBzc0Igl
         /z8yZmYsag2Wgd+e6D8bLFkzVT7xWiOxRwaZJ2JjkpRBLoHHBz1YE5g1ovFekE0ohqXB
         RVgKWJlg0MP64lUimzLQOQeff+jN+Vc0KM5KQYujtlk0BVW2mPZWlxjOVs91mQOwJouX
         FMWNL8krTE7ms+Pql+o9xxiDECzbP0YSmCmCaAYs9kJ+2+Vb+AIkeYTllSc2nFO7WxlG
         Gg9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXgnKB2jgr3RH8s+lvtuFdktNJZ8GosasHIjvVqk+pNmVa2bAk3JdbkX8a2DqMOxSwkuMvgDuzD75s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXn01OVjVWNtE8doBhGjZAbVUT0oYh1eJkWSR40kwEnoSj1OO6
	2wC/MHi9bkVNbiNOgRZGarEC4jU2TsiMH7fLE0x45w6ea1oy7Vc2tguPfHk88S3TBIrQuMKSHWe
	KIOiHqY808j8DhVJX3AoLRrEDzBFn4iVELfuj+A0fCOHHhQZW3A1Qjlf/wFi5iMSZ
X-Gm-Gg: ASbGnctPT/XgfKOv1Bu6Hne4S/OKd/5or2+RVOdJptH3KKMOd3unTYsIJUUkVQIHD6M
	NakOVlCgBYh/BYMULtgzhIZ+iNxCK/UoFDOVAcZa7r5R5C4MR/+riJZiczlOzVrK1vrLvxXYBlN
	0zyf/wxeZodIhF3bHd5vXwQ3hnQxtXnFrl0lW2O9KFUPW9rrZYr7WNWgAVQY8Z2uIAnytg1ByUZ
	Tsf5bIYfxwojyL8NE/BdzLBAy9QDG+iKA3obeftC+H9n7QJb/XMxGJCFn1BMu9n7sM4hgb4yd8/
	hANp7B+S/Lp8Sb3BmctSpgi0GBEnXt25ZgQCtN9HkSwEfdZnPIAr4KJX7ZgMimE=
X-Received: by 2002:a05:6402:51c6:b0:5de:5717:f235 with SMTP id 4fb4d7f45d1cf-5e4d6b6271cmr13603179a12.24.1740994684952;
        Mon, 03 Mar 2025 01:38:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0D4fk02QR9pNIZDoVtBIGIryV/5nnFm81RWTyHdja4tZ1wouSANXuFLVpCyDmAiODjbHbRQ==
X-Received: by 2002:a05:6402:51c6:b0:5de:5717:f235 with SMTP id 4fb4d7f45d1cf-5e4d6b6271cmr13603153a12.24.1740994684510;
        Mon, 03 Mar 2025 01:38:04 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] xen: Kconfig: Drop reference to obsolete configs MCORE2 and MK8
Date: Mon,  3 Mar 2025 10:37:59 +0100
Message-ID: <20250303093759.371445-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Qz4FpHhgFlBzsJ-bLL_9Uf0ELIzLVvc-vFrCD-Pd1xM_1740994685
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit f388f60ca904 ("x86/cpu: Drop configuration options for early 64-bit
CPUs") removes the config symbols MCORE2 and MK8.

With that, the references to those two config symbols in xen's x86 Kconfig
are obsolete. Drop them.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/x86/xen/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
index 77e788e928cd..98d8a50d2aed 100644
--- a/arch/x86/xen/Kconfig
+++ b/arch/x86/xen/Kconfig
@@ -9,7 +9,7 @@ config XEN
 	select PARAVIRT_CLOCK
 	select X86_HV_CALLBACK_VECTOR
 	depends on X86_64 || (X86_32 && X86_PAE)
-	depends on X86_64 || (X86_GENERIC || MPENTIUM4 || MCORE2 || MATOM || MK8)
+	depends on X86_64 || (X86_GENERIC || MPENTIUM4 || MATOM)
 	depends on X86_LOCAL_APIC && X86_TSC
 	help
 	  This is the Linux Xen port.  Enabling this will allow the
-- 
2.48.1


