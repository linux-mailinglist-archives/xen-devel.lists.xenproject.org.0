Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7B8AB1983
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 17:58:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980131.1366614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQ6p-0006bm-Kt; Fri, 09 May 2025 15:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980131.1366614; Fri, 09 May 2025 15:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQ6p-0006Z0-H5; Fri, 09 May 2025 15:57:59 +0000
Received: by outflank-mailman (input) for mailman id 980131;
 Fri, 09 May 2025 15:57:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZIRI=XZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uDQ6n-0006Ks-NV
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 15:57:57 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f4d529d-2cee-11f0-9eb4-5ba50f476ded;
 Fri, 09 May 2025 17:57:56 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ad1d1f57a01so423943366b.2
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 08:57:56 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad21947a88fsm168723766b.81.2025.05.09.08.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 08:57:54 -0700 (PDT)
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
X-Inumbo-ID: 5f4d529d-2cee-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746806275; x=1747411075; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhgIiPK3XPnML7n+ScrJv7EOoTzBz2z0Tz9e4QcGSKw=;
        b=aaQPhSTKeqSVAFe4IYlOEYb5ywHAP17SH4HBFu9t1XZUUZK147ZdLu8uW6Jv7gvsa8
         uK6h0YA1BuOHH94auZwHe2OvYuH2tqazNOrFDWj8c6n6nQMV4PV62TGMx+uCCok/JXHh
         75m8RtMVAxxO8v7mp+HHaKHdEMN85KKhfhfaQswUtV34V/sXjXNcEHsaMRfrtAi2DB7k
         1QWsyzq1x/so21SvGQbHe6k4t1kWaVGaR14gz8p8wy834akuYPn5ndP6U8oRpNfNfHJo
         9cqyhAtz09TQ5n7GJklk+v1yEJKSK3GHih5+z0eSFFxqw7dipKDgW9MjeH4tcjaV1CrD
         o2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746806275; x=1747411075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhgIiPK3XPnML7n+ScrJv7EOoTzBz2z0Tz9e4QcGSKw=;
        b=JxObH6+urhHW7wxEgS77CX45rum6SXJ5JyRf3kFb7jbClqueKs9+oc7nwgTxy24ecg
         RXSCHmzK9v7MiBepGLesAZtuyT0O0QojgDIT7QKRJHHoUVgEPxMdzB07PeLEY7HG38Hh
         +N0JwOAw8QG4MS3OjYDKF6/hrkAYesXpjBFs7POzDnFOfoqcy+SZl+IlH+DVtgijVr76
         omBj7NDswHDstk3dHZTF+cZWctxiOi8/Vwnfn37ZvQsS62RzMFHD9aFgwwQuFfAkk+t1
         JrG/ukKZidh+UGVqi+2vV9fNFcYY5SCeQtwHalt8SfjVNCQbS3LdJ7UY3e4yEo6HQjVf
         hRLg==
X-Gm-Message-State: AOJu0YyfqD2sAT2VsAoDbjNBuIXkcCKAp9nyEzygQtcv+YipZOs6NFv8
	IHs8Q/CZ2qDZk2sfu+e+gYdDD/oJA9OoNsCzP5N5eTAH1KpMlO8JA7bL2g==
X-Gm-Gg: ASbGncswyv4Gs+Y8K32j7/YVwbI7C2nmdtebZl8X5CANZk+NrS/69kd40qUAyPm+/OF
	DIGBTT+gPgwwa98jmYEdSIkmBUW5Wt/ZOW6A8qL0H43sqpaXHB5VuTqbzYFLhFtM1Ky5A1t5tek
	YFetK02yxZE1b8DX519ttGBKNjPCXCrkstEV4260+Pn4tPM6fupGKsDDXpN3Xa+PNS3TfwzkmVT
	tzFEO3/GJ01iiI740u1/oOwZBCljnIAEjZaT2+boEH7Byufzvr6A8E6mdeY3P/S8KU5gZ/Lukw6
	Z9OREHK5MnQf+C53uYF68Bm7c3bHd4sJFV3yhuMYCUzJAXDz5JRPcRqBi24Uc9iMYNFOhrb9WQ1
	DuGkf5fbCuQ==
X-Google-Smtp-Source: AGHT+IGZ6zGvWzpoPLeEZf/9t/LcakqbMgpK4ZOsvGcXqc0SMLlpfVJZS8ugrMmTXcN7eRqKEeFTFA==
X-Received: by 2002:a17:907:8b8a:b0:ace:c416:4231 with SMTP id a640c23a62f3a-ad218e92f99mr413658566b.12.1746806275236;
        Fri, 09 May 2025 08:57:55 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 1/6] xen/riscv: add inclusion of xen/bitops.h to asm/cmpxchg.h
Date: Fri,  9 May 2025 17:57:46 +0200
Message-ID: <876ca1a5dcf7523657ed722f588824f6d8bfb171.1746805907.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746805907.git.oleksii.kurochko@gmail.com>
References: <cover.1746805907.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add inclusion of xen/bitops.h to asm/cmpxchg.h to avoid compilation issues
connected to GENMASK() which is used inside asm/cmpxchg.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
This patch should go first; otherwise one of the further patches of this
patch series could face a compilation issue.
---
 xen/arch/riscv/include/asm/cmpxchg.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/riscv/include/asm/cmpxchg.h b/xen/arch/riscv/include/asm/cmpxchg.h
index 7d7c89b6fa..d47ebaffce 100644
--- a/xen/arch/riscv/include/asm/cmpxchg.h
+++ b/xen/arch/riscv/include/asm/cmpxchg.h
@@ -4,6 +4,7 @@
 #ifndef ASM__RISCV__CMPXCHG_H
 #define ASM__RISCV__CMPXCHG_H
 
+#include <xen/bitops.h>
 #include <xen/compiler.h>
 #include <xen/lib.h>
 
-- 
2.49.0


