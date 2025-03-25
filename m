Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0104CA7085C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 18:41:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926850.1329689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx8H5-0004Gb-O3; Tue, 25 Mar 2025 17:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926850.1329689; Tue, 25 Mar 2025 17:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx8H5-0004EY-L3; Tue, 25 Mar 2025 17:41:15 +0000
Received: by outflank-mailman (input) for mailman id 926850;
 Tue, 25 Mar 2025 17:41:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+BiV=WM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tx8H3-00045y-L9
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 17:41:13 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57fb1843-09a0-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 18:41:12 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so57125125e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 10:41:12 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fdbd0a9sm158386185e9.38.2025.03.25.10.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 10:41:11 -0700 (PDT)
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
X-Inumbo-ID: 57fb1843-09a0-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742924472; x=1743529272; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tLAZyO/hfkBVvaNdLjamkv3ilsyR49xjpF30ZgT1n/8=;
        b=tg9PHeW0MldzVKfve53UYOq0C9GRTgYADcVExPWVyW/L4NkKzlAOUTnITRxQSrtkFz
         Hy5oaK3Y9A14tL8Sn/2RNuEHftopeOIYPRRUHizn4zKsvs5yAXtai9Xn8x5CIPLDkPwS
         s0cMYXNVZJe/WkPLpFiht7gUFmqn9oJv0IzSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742924472; x=1743529272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLAZyO/hfkBVvaNdLjamkv3ilsyR49xjpF30ZgT1n/8=;
        b=lKrjPDBV7U8NAtT3aHnIbWYetEqN2VkTjI3oIYL1ib/hJ6rAUbKpnfWVdmpTNuQ8Ut
         SbN3Bjo8CAynLxjYTB0tB/Jk7q5aVCHOyU4MmOoSrw9IG1Kko8GYv23obeWu/DD9UZoZ
         M9t/SvKCZMSvGAkhCQiEejZJ8fGML3VBUwM7kxrLtWSesjio+758ZXNcb2AXnw5WzTmT
         1EE+RjkGQbJ72WYiUJFfFa7j3VODCXyzJzLKbqIwRnaoSaJrSvsyqXUVGXVgKjRWk5l2
         71nBnxpUz+K9c4saaFQYBGFEnnCelMtVwxhKlm70/1iwtMSyJx4eqPj+dekdJO+ZWT9k
         gkZQ==
X-Gm-Message-State: AOJu0Yz3QBRXotVNVEBg+QahdIur+2hXdLmcSIe0VaMjVLrHGnRpV1Z2
	8YL8x+rnZbOrm0EdjQz3MAOsNsltGMTNveBUf0y1i14I/tHfSveB6FKl6NqMzuhM4n0mw/o1jjO
	Jfmg=
X-Gm-Gg: ASbGnctU4gfYc83W3t2jhDZnuiZM4vbTm9sTjETggTA8B7w0awF4aFBGRa9s2xu0FQk
	vqNNmkrRK8RauOd+Dt/imC86S61E6ErnWj0yllJhQXnFY3/ZspSSPhLkHb2Ei9sRVbHWVDdyjNQ
	pPRttnxWWYZuyNUWREbNLjmwpAgJTKd7wd9L9S3kiJkS1Dryq5IQlz2/0dSc9wbejOH/Yl6ZtrG
	bK4MRmUcmG/Ce8+9JrBPftr0tZcQGEYk7EL94RHMhJACah9iy5QZxDpmzKQvl7BvwKCe8dR11IA
	v9IHOVUjecoIOlG64pOmecqt9BoDxAeayBhEBJvAbZ94qi7Qqc3YHEe0xdzyxZcNCVyepooan3O
	jkEeQXminwvwlL9kFlg==
X-Google-Smtp-Source: AGHT+IEx75ae7xs7AIx78XldAkrS0yvoZ7/PwVSg5T8a1U1fapBS//Oerh/cu+TWPaxW0qG1+nVi0A==
X-Received: by 2002:a05:600c:c0d:b0:43d:738:4a9 with SMTP id 5b1f17b1804b1-43d50a33d03mr134380365e9.27.1742924471648;
        Tue, 25 Mar 2025 10:41:11 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>
Subject: [PATCH 0/2] x86/emul: Emulate %cr8 accesses
Date: Tue, 25 Mar 2025 17:41:07 +0000
Message-Id: <20250325174109.267974-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This very quickly turned into a rats nest.  I don't have time to fix %cr8
handling, so stay with a stopgap mitigation for introspection puporses, and
leave some notes for later.

Andrew Cooper (2):
  x86/hvm: Rearrange the logic in hvmemul_{read,write}_cr()
  x86/emul: Emulate %cr8 accesses

 xen/arch/x86/hvm/emulate.c           | 39 ++++++++++++++++++++++------
 xen/arch/x86/include/asm/x86-defns.h |  2 ++
 2 files changed, 33 insertions(+), 8 deletions(-)

-- 
2.39.5


