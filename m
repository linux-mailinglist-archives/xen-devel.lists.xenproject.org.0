Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 172AEA4E6E8
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 17:53:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901345.1309303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpVWJ-0007cU-Qu; Tue, 04 Mar 2025 16:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901345.1309303; Tue, 04 Mar 2025 16:53:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpVWJ-0007a1-OL; Tue, 04 Mar 2025 16:53:27 +0000
Received: by outflank-mailman (input) for mailman id 901345;
 Tue, 04 Mar 2025 16:53:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lwvO=VX=cc.itu.edu.tr=root@srs-se1.protection.inumbo.net>)
 id 1tpVWI-0007Zv-NL
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 16:53:26 +0000
Received: from beeline3.cc.itu.edu.tr (beeline3.cc.itu.edu.tr [160.75.25.117])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f7d208d-f919-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 17:53:24 +0100 (CET)
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr
 [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline3.cc.itu.edu.tr (Postfix) with ESMTPS id 4C87A40D1F43
 for <xen-devel@lists.xenproject.org>; Tue,  4 Mar 2025 19:53:23 +0300 (+03)
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6dWj3K06zFwLr
 for <xen-devel@lists.xenproject.org>; Tue,  4 Mar 2025 17:35:29 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id 22B814273D; Tue,  4 Mar 2025 17:35:15 +0300 (+03)
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
 by le2 (Postfix) with ESMTP id 202CD43785
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 12:38:24 +0300 (+03)
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
 by fgw2.itu.edu.tr (Postfix) with SMTP id F14B22DCE3
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 12:38:23 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by am.mirrors.kernel.org (Postfix) with ESMTPS id C81C51891B69
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 09:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC831F131C;
 Mon,  3 Mar 2025 09:38:12 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DF51DE2DE
 for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 09:38:08 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-WXtsxd-QMx2jXvkq3n0HJA-1; Mon, 03 Mar 2025 04:38:06 -0500
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5e55cf1e9b4so797028a12.2
 for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 01:38:06 -0800 (PST)
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
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 2f7d208d-f919-11ef-9898-31a8f345e629
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FOYIhFXT
X-Envelope-From: <linux-kernel+bounces-541282-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FOYIhFXT
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FOYIhFXT"
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740994690; cv=none; b=a7bYfOijgGuw4viwifYCX+3VEJb5M4zGQlcu1QwjavTH35Gjx7N4+lVTC0jvCf5oLlj1mp33lC/Nd7A4sizkZsrzecl6M1lAvs2rSWSDxBJr7TUl76JiqfntuW8Pd8iP+nZgqrlHTmlvBit2b/AXvprwOoQ/0N05jBlLIvH8Z4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740994690; c=relaxed/simple;
	bh=zlCMUidIBWNN9WpoUdZwIdQCmJ/Iyiw+Jbwq8oV+ti4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q2cC+2ctv8ZS1TDNTYcvjB1HgsGkkPvQxomtb09ZmspeR/w6r6OalJUyXpnXsMTls/sOdpqYdqvjE22cylo9TuGwjIZ6iNaYFZTVqH8QQvkqGbKLVcv7ZVroha+0V0iaG7J6JJXCWLscK4sMzfOAJe3EiBsL2Wgtd4dQ0yi7cms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FOYIhFXT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740994687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jtFF5Isb4vaWOmkrbTb6ml0NHfU6CXUYn/xbKnf16mo=;
	b=FOYIhFXTCO9H/UhaC53fNK+ksXBXLaS35+NjBtKku3NcXwtad/R8XjZg8DjSTSwJWHK31r
	K/U2nJqqyw5mkujBVM1MhQ80lHYrHsc7uYN1kGVHP6r/b6j9PNBqguhD/jn5foLNIVHFkt
	TSMtVmf5mqEX76UdZHC3tVSbiDYsZHo=
X-MC-Unique: WXtsxd-QMx2jXvkq3n0HJA-1
X-Mimecast-MFC-AGG-ID: WXtsxd-QMx2jXvkq3n0HJA_1740994685
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740994685; x=1741599485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtFF5Isb4vaWOmkrbTb6ml0NHfU6CXUYn/xbKnf16mo=;
        b=HaHWUQ5j+RwmYZ+5a5sdRBpR8CuwdaBKKJ1kbM2ElMkJwrq0PvtBuQ+7LlbWILLbLu
         2YpvZABP1JHzWg6cIUhJGnDNlcZKVel0Rjo6i0G+dCRe2tx4rkWqT/HFsl5jq35MRKnl
         HOKF21D/WRmHmOP97Iukcohr0h7D1TPKrqhzCqRH6ZQojs0RnXpVFLvUpZRv4BHMwKD5
         kiu2HJ/oi9+7pkdQQ8cv1csJgPBpZj5EJjBLuNVVJjfCKObBsRYk7JxVZ9c+9MFo8Iea
         kM75YirXk27luS7KaYUETdSPfXLeeDFpwMyzu8m/xCEWmkKT22AvV7ETr/sh51fEG98f
         OPJw==
X-Forwarded-Encrypted: i=1; AJvYcCUm36bZS216QPHxe9eZl9yBNhS9AX+nWo1L6RtvoJLL30d+pVGEDMNsA3wDUI6vhLvA7LMepsrYpqvLigw=@vger.kernel.org
X-Gm-Message-State: AOJu0YypTOUYBtZQpONlOLMZiR8lu+rdQNAWyE/p6q1OXUTKGFGOAMUY
	evvTRH49/dLbgrzO4RwOhHxT0QhXx6l5K0/ogEwjQx02sKq1QicJCr2Rp4mt2oL9RzXP6sJF4PM
	N56mU7mTrJPgxf5T+0Xnd/V8uWvEsp1UjHtOSej3S/gsB8+cOQL5RgGTdRILKNQ==
X-Gm-Gg: ASbGnct2cFBSfUKxrA9xUKn6/PUQt2aeZAiKexJmZh0PkfS9/zX2TYHdg8VaAyUsJUz
	TSE6sWRBxeXdJU5IHlJWzOngfRE4u16jVXtKN5MTiYx60vlxCnwDOLWHOc0SJsc7xgD3VBoGl/l
	vNEgqeoP5CmhY9kHGJuEUuEkLWtLHKJl1iLRX6+pRjvvUncEIObEq6pNgKuZW41P+VBJauL4THE
	VasYh7qgRLS7Vf8RRXkFlpR5y0W5bbvHq+qK+571PK2jXCekPOsZ/Jz9Qzr+lm4K8Q0XZoYlWwR
	Q8rdN8N17uzUH4+fJdzgtxLPGMgebyfQrJ37KmlB3zf/gc+S3AbT++zReZaXmts=
X-Received: by 2002:a05:6402:51c6:b0:5de:5717:f235 with SMTP id 4fb4d7f45d1cf-5e4d6b6271cmr13603176a12.24.1740994684950;
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
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6dWj3K06zFwLr
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741711885.10116@6O3D25dYYoEWLnUmePnxWQ
X-ITU-MailScanner-SpamCheck: not spam

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit f388f60ca904 ("x86/cpu: Drop configuration options for early 64-bi=
t
CPUs") removes the config symbols MCORE2 and MK8.

With that, the references to those two config symbols in xen's x86 Kconfi=
g
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
-	depends on X86_64 || (X86_GENERIC || MPENTIUM4 || MCORE2 || MATOM || MK=
8)
+	depends on X86_64 || (X86_GENERIC || MPENTIUM4 || MATOM)
 	depends on X86_LOCAL_APIC && X86_TSC
 	help
 	  This is the Linux Xen port.  Enabling this will allow the
--=20
2.48.1



