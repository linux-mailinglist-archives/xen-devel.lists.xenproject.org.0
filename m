Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A27B5520E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 16:44:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122091.1466016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux50x-0005Iu-1Q; Fri, 12 Sep 2025 14:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122091.1466016; Fri, 12 Sep 2025 14:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux50w-0005CT-Qz; Fri, 12 Sep 2025 14:44:38 +0000
Received: by outflank-mailman (input) for mailman id 1122091;
 Fri, 12 Sep 2025 14:44:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yT3b=3X=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ux50v-0004JT-3Z
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 14:44:37 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00eb5423-8fe7-11f0-9d13-b5c5bf9af7f9;
 Fri, 12 Sep 2025 16:44:36 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3e8123c07d7so47009f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Sep 2025 07:44:36 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e015784c3sm72070045e9.10.2025.09.12.07.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 07:44:35 -0700 (PDT)
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
X-Inumbo-ID: 00eb5423-8fe7-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757688276; x=1758293076; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8OCJ00B7SiN+TcNJnXk15Q6BMK+dvW43SxAcU8PxzY=;
        b=qOApSUJ2J2lP50EF0B0Qn0GB2bcMi0LNEcHrK8LJ1FGZdjtu0wRI3y23Zq4iNC85Kv
         GN62hvouCLSb/yHXIESafON9UhylSMaFvqf+8O5TIj/2k6ti5ns+BsFuEJC671X/4nKA
         JogoNkThGmBy0FnoyYDdlj71qiHODsDTatQ9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757688276; x=1758293076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8OCJ00B7SiN+TcNJnXk15Q6BMK+dvW43SxAcU8PxzY=;
        b=LnKkQNGn8R4tNXDdXp2MAoJeuLXsJerJBSGVLgu9nOOcmByAPEiksQbCGULCSB7bOZ
         ZtZ8HYZObFPWf86IjdivW6IedpU+imwtP98sU9ByQ6Yvro3dFOv+1aWsp3RgQJDKptT6
         w0g/haKmHH3juO6jDxKgDjmw71b9ccOFgZPS73bWJ2+LOsDWF++au5jGmu5X5o6n4VMH
         ZaWNDNODC+0Wo0gOIoAMIEU6dHtisREFD0b+CjSFJ6480eMWT9ellvSPJEJA/js3DQdf
         VuU7FiLOXYkqxRWYV6rQo7RDt1O+byOwtdxpeDzE0N1zwWs3ydDvA1WJUOu+clkfH53q
         M/fQ==
X-Gm-Message-State: AOJu0YyR6OzIm1O40opV7GLgEcSywZVmnEcaNSiysbJIzAIE2kRLaNGF
	urlW2V1Ci54oGO/uhqVE7CClGJiz6L7eIfBUM2gSn1XPOqzPzT0s4wVJwAYInh/MjVXo+/f8q99
	WjSXm
X-Gm-Gg: ASbGncuMLrq6bRna5eujs3jxe+Q0U0fhZkXD3nru0W9iagCHK8v+K206ARAN2yehUt5
	v4OnekE2Ir63UjcyvdVBgPwebxkLdzs6KdcIYuOwkCoTjPt67Zz59v3Eb6WFIT6M7GAiogmwSAV
	sH6a2DmW4ZlqzWl4PBQsyDkfSQpIdNMUniBWCY0/9CrwglVLt3oTrbul2z6oeDopINsnV8a3TVo
	jbMEzGyN/TCU/BmuQfrw3KK25Noc0csm++8FanjBEkahI80AZ1b2DZiLZoVUKVRM+6AvNknljz6
	lb5pz2feqhD2apKxEPzmFU6xVNk/1NLADOzcwYKrFY3GjIKe670U0wp8sLSWoL5dcxnOMc2ZKO/
	C1PWbTI+WUGAX3TGQVlyZYYvHNiuiu5lOQTFKswBXI+lrFImgC3MvSLRFq0avirYssktdXNDKak
	Dd
X-Google-Smtp-Source: AGHT+IFI+H0LGobGeE9zijNwuP0LN6Roi39UE0X8oThdZYHVRwFL4CZw2IWIM5DfdjrGcyGIMiEbCw==
X-Received: by 2002:a05:6000:26cb:b0:3e2:e851:7f93 with SMTP id ffacd0b85a97d-3e75e0fc32bmr6897230f8f.7.1757688275709;
        Fri, 12 Sep 2025 07:44:35 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: [PATCH v4 5/8] x86/emul: Make condition coverage warning non-fatal
Date: Fri, 12 Sep 2025 15:44:24 +0100
Message-Id: <20250912144427.1905141-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250912144427.1905141-1-andrew.cooper3@citrix.com>
References: <20250912144427.1905141-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Randconfig with GCC-14 (Debian Trixie) found:

  In file included from arch/x86/x86_emulate/x86_emulate.c:11,
                   from arch/x86/x86_emulate.c:27:
  arch/x86/x86_emulate/x86_emulate.c: In function 'x86_emulate':
  arch/x86/x86_emulate/private.h:482:8: error: Too many conditions (found 826); giving up coverage [-Werror=coverage-too-many-conditions]
    482 | ({  if ( (p) ) {                                                          \
        |        ^
  arch/x86/x86_emulate/x86_emulate.c:1283:5: note: in expansion of macro 'generate_exception_if'
   1283 |     generate_exception_if((mode_vif() &&
        |     ^~~~~~~~~~~~~~~~~~~~~

which is a consequence of having a new enough compiler to allow
CONFIG_CONDITIONAL_COVERAGE in to the mix.

In the short term make warning non-fatal.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

v4:
 * New

Full failure logs:
  https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/11331286819
---
 xen/arch/x86/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index d7aed7d92c15..a0bba5d9085e 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -98,6 +98,9 @@ $(obj)/usercopy.o: CFLAGS-y += -iquote .
 ifneq ($(CONFIG_HVM),y)
 $(obj)/x86_emulate.o: CFLAGS-y += -Wno-unused-label
 endif
+ifneq ($(CONFIG_CONDITION_COVERAGE),y)
+$(obj)/x86_emulate.o: CFLAGS-y += $(call cc-option,$(CC),-Wno-error=coverage-too-many-conditions)
+endif
 
 efi-y := $(shell if [ ! -r $(objtree)/include/xen/compile.h -o \
                       -O $(objtree)/include/xen/compile.h ]; then \
-- 
2.39.5


