Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C58898DEF0
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 17:26:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808876.1220934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw1EL-0004lO-Pu; Wed, 02 Oct 2024 15:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808876.1220934; Wed, 02 Oct 2024 15:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw1EL-0004fi-IQ; Wed, 02 Oct 2024 15:25:33 +0000
Received: by outflank-mailman (input) for mailman id 808876;
 Wed, 02 Oct 2024 15:25:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6go0=Q6=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1sw1EK-0004SG-Go
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 15:25:32 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f2d3ef2-80d2-11ef-a0ba-8be0dac302b0;
 Wed, 02 Oct 2024 17:25:30 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8a789c4fc5so176875366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 08:25:30 -0700 (PDT)
Received: from mbarnes-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c277726asm894554866b.10.2024.10.02.08.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 08:25:29 -0700 (PDT)
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
X-Inumbo-ID: 8f2d3ef2-80d2-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727882730; x=1728487530; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AoQRiycGbrcRIfQe1rR1oSXPiTIGCUmJQ2PUwiSd4cc=;
        b=BpbwG7lnG3jUtXaxF22qbFgjXEzvA4jUyO57fKsE4o52TsZjOyvcTkJ3hBl65wWRym
         o+AK1YuUI1u4192miGJcwu7m7glcmHkQ5xb6vjbpVECd+p3rLIF5/BOOykRZF2KcvCUN
         iIseLyj2/4C+SyUHP8gXdQMsYiIv/iU3P1rSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727882730; x=1728487530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AoQRiycGbrcRIfQe1rR1oSXPiTIGCUmJQ2PUwiSd4cc=;
        b=dH7lTOkkCxRC+OOs6PYf+SWYdtYcgp9SdhklEQaH9pfcTHzmMmy3oxOemtNBGG0aGV
         d1C/0Fv9bH4e9DfEhqfPIWYkXaZ/Gc73zTPA8URl02x8vcUvTPfMTW+Awven7jNipntt
         9pnz2PSMae2IkX19w39KN9SPqIKAeuxpL6wBwaV3lT3uIjfcGvFwnBOYPSeJqvxbNLlR
         2lUzkMnzLra7ATah8tDWYn0YxOpqVIuWlBa66H4wKRzoJnfoJouAO+rrVW2usm3h1ZFA
         aPF094rEvc85vSw5OPPzLyrd8B+MAVYQqxaiKBKDDHEaPLv3RCY0L6yu0GMDzlMX4Jsa
         k60w==
X-Gm-Message-State: AOJu0Yybp4Iavzm7Z3nL062NdU7WIXl7ki288dD8mbE6dBZjsw23x6+W
	WRPsRCxGQvHSaj0VCVRvVAeMs9r/Ndj1v1ecy5LF2HAjEY9yvVBMHzMkVuuw4s4XBh9eyMYSHz4
	7
X-Google-Smtp-Source: AGHT+IGnyWJ2DJZlijMwNWhhfiN2aSGJwUSG7Zu+RTkUqbqT8HhbbkpU/+XMfJltf1qO3GBjT+6XZQ==
X-Received: by 2002:a17:906:c52:b0:a98:c4b7:7971 with SMTP id a640c23a62f3a-a98c4b787b9mr561548166b.32.1727882729807;
        Wed, 02 Oct 2024 08:25:29 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/3] x86/APIC: Refactor GENAPIC_FLAT -> GENAPIC_MIXED
Date: Wed,  2 Oct 2024 16:17:26 +0100
Message-Id: <4db841d51630263204dad2bec571462c031e30c9.1727880621.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727880621.git.matthew.barnes@cloud.com>
References: <cover.1727880621.git.matthew.barnes@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro name is changed to somewhat mirror x2apic driver code,
as logical flat is no longer used for external interrupts for this
mode.

No functional change.

Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
 xen/arch/x86/genapic/default.c     | 2 +-
 xen/arch/x86/include/asm/genapic.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/genapic/default.c b/xen/arch/x86/genapic/default.c
index a968836a1878..3f0d57ea5e25 100644
--- a/xen/arch/x86/genapic/default.c
+++ b/xen/arch/x86/genapic/default.c
@@ -16,5 +16,5 @@
 /* should be called last. */
 const struct genapic __initconst_cf_clobber apic_default = {
 	APIC_INIT("default", NULL),
-	GENAPIC_FLAT
+	GENAPIC_MIXED
 };
diff --git a/xen/arch/x86/include/asm/genapic.h b/xen/arch/x86/include/asm/genapic.h
index 91fdeaca47b3..fcb3eb04db7b 100644
--- a/xen/arch/x86/include/asm/genapic.h
+++ b/xen/arch/x86/include/asm/genapic.h
@@ -46,7 +46,7 @@ void cf_check send_IPI_self_legacy(uint8_t vector);
 void cf_check init_apic_ldr_flat(void);
 const cpumask_t *cf_check vector_allocation_cpumask_phys(int cpu);
 void cf_check send_IPI_mask_flat(const cpumask_t *cpumask, int vector);
-#define GENAPIC_FLAT \
+#define GENAPIC_MIXED \
 	.int_delivery_mode = dest_Fixed, \
 	.int_dest_mode = 0 /* physical delivery */, \
 	.init_apic_ldr = init_apic_ldr_flat, \
-- 
2.46.0


