Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FE8B53EFB
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 01:12:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120999.1465602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwqSp-0007Zc-5i; Thu, 11 Sep 2025 23:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120999.1465602; Thu, 11 Sep 2025 23:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwqSo-0007VV-VD; Thu, 11 Sep 2025 23:12:26 +0000
Received: by outflank-mailman (input) for mailman id 1120999;
 Thu, 11 Sep 2025 23:12:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imb0=3W=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uwqSo-00070m-1y
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 23:12:26 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7897e24-8f64-11f0-9d13-b5c5bf9af7f9;
 Fri, 12 Sep 2025 01:12:25 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45cb6428c46so14741945e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 16:12:25 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e03729c76sm40014715e9.6.2025.09.11.16.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 16:12:24 -0700 (PDT)
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
X-Inumbo-ID: c7897e24-8f64-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757632345; x=1758237145; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRzzkStlIW6Boe0j8jd7BGR45fCprZcNJeI4i+HTj+s=;
        b=LWRIeHl4NrvrGslBWwqgX7AmAMiKU1Yhhk4Ld3RpZe2ecCRFKqYez9v7OnbQGdrhQe
         0bZCUvR3umzMboiG7ZJOzkHl14aEKZduqYtGfcQ5RiiyyHoyj85eW/TrhqsZmTMIFzFZ
         erPOS+QWzkTlkegqWYpdZfR9LQC6l3kU3RmMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757632345; x=1758237145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FRzzkStlIW6Boe0j8jd7BGR45fCprZcNJeI4i+HTj+s=;
        b=UuqjKBrdWplyhPR/keaACWwbHZh7uE9iVaMLOcTGmj7QgFSOGaSRKO07wszKRRja+Y
         eQHaSCU+LfXZYUWWOamnNFdiFyJ+f39N2Ry7FButaL+REwbVpL9X57IKsItQ1IEWknoj
         HV9WYg7BQrYTtMNUd2d6XQgjeQo67OLSMz0034ocloF9s59ukKvAf/iwJkejGaS85eXd
         HriWup7YmYLwSbr3tPxq3bYbh5tWnU18pG5fGVNlRkdNuKG0JA01/dCi7h2Ybzg22C0n
         XXA8LOcYz7ohnjLbw7eFchtH5uRDInn9JNkTNaAJ/m8q34S5kk5C+YRUL2RbufoRIhG6
         gJtA==
X-Gm-Message-State: AOJu0YwqePZCkoG7qoi17iNjr+j3fRp8o47IMCskJHjMJI9Y4QyIw9EY
	gtAwIaeS6FOGhLfowkU4Llu96fTjLqoz7JSHBc8OkAs/hoHtq2v8SkVOPl6WSIACbzszlADc4X1
	voxFD
X-Gm-Gg: ASbGnct/q2oPL0XxEcxoNp+ENyjU7m3uQzolyEhkN2e/5s1Jyp6ZtM9jIiOvhBhfEdq
	PwzhdJTv9/0EHjQwcyC4KH68H0u5kmN3WYugbcgei3Z7pQ6lPVldzs6Uo3+u6GMaRI6ERz1DlsG
	SjHi6/AcjEQ6HpYvidig/NC+LW1CN1j51Sb5pNhUnPOduDJQL1/DqE5lupD/XvSXt6o8ZJS7tOX
	Iwv9QSKgje6aqzxqz4fqc5ZusngdoL3ejJ6zrEL7T7fJFpLx2IAdkcesOzmBMYRNBWIzxlQKaVu
	nvAd0V6DYOm9IjeIcNVOMu8/u77l3dDT7JAfBrTRXvgOGeJxldxPKEg7VjuPpmhG6jn1c/E+y5o
	lJ6H4vtMLwb4w1t+EKgGz5x0c5zcZB4XGSSo1lZbY0G/hW4SgyRGr1LJcrEmPdAD2GTyXw54cB9
	ks
X-Google-Smtp-Source: AGHT+IFcVNFTgWUWmuJhtP5yb3dIMz7oWoZD78httYc6541oZoWGaa8cRwkdy9rw24mK4VTfMHgBXA==
X-Received: by 2002:a05:6000:290c:b0:3e3:1736:a7d9 with SMTP id ffacd0b85a97d-3e7657928b8mr655623f8f.18.1757632344851;
        Thu, 11 Sep 2025 16:12:24 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 5/5] CHANGELOG: Notes about distro changes in CI
Date: Fri, 12 Sep 2025 00:12:16 +0100
Message-Id: <20250911231216.1886818-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911231216.1886818-1-andrew.cooper3@citrix.com>
References: <20250911231216.1886818-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Also state the RISC-V baseline now it's been set, as it's the reason why
RISC-V Bullseye got dropped.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

v2:
 * New
---
 CHANGELOG.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 7bd96ac09d14..ca1b43b940d2 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -10,6 +10,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - The minimum toolchain requirements have increased for some architectures:
    - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
    - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
+   - For RISC-V, GCC 12.2 and Binutils 2.39
+ - Debian Trixie added to CI.  Debian Bullseye retired from CI for RISC-V due
+   to the baseline change.
  - Linux based device model stubdomains are now fully supported.
 
  - On x86:
-- 
2.39.5


