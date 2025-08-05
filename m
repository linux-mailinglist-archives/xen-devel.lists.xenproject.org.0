Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA125B1B892
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 18:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070747.1434395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujKaF-0003RY-6l; Tue, 05 Aug 2025 16:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070747.1434395; Tue, 05 Aug 2025 16:32:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujKaF-0003Q0-1P; Tue, 05 Aug 2025 16:32:15 +0000
Received: by outflank-mailman (input) for mailman id 1070747;
 Tue, 05 Aug 2025 16:32:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FQWd=2R=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1ujKaD-0002gS-GK
 for xen-devel@lists.xen.org; Tue, 05 Aug 2025 16:32:13 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcf8c4fa-7219-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 18:32:12 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-af967835d0aso402887866b.0
 for <xen-devel@lists.xen.org>; Tue, 05 Aug 2025 09:32:12 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af928c84154sm842980766b.84.2025.08.05.09.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 09:32:10 -0700 (PDT)
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
X-Inumbo-ID: bcf8c4fa-7219-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754411531; x=1755016331; darn=lists.xen.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HyChThRw6GVKg1romDTn5fzN51ukPoZgESaAn7xK/ic=;
        b=RjULSuQGaRH2h2sfIspmByy/vWktiO82zs8pqNmjM14Iy/56Vun4ihCiMzzcwGhEZP
         shDlH6SH1uoUFQ8TuHES6hZLIHQGiM1cGnYxYFB2aQUSz9HVJE2hW36xoXyxJkmyle6E
         +g/7os73Lmsfs8aK0vzDs+F3pjUr+VuEsj+Qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754411531; x=1755016331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HyChThRw6GVKg1romDTn5fzN51ukPoZgESaAn7xK/ic=;
        b=j+i+kJo+7AwLwK92Wcy0AYQARJmBmEeoAq/bNDNDYpUxfIOhgmAQvBbea44AFxiZM0
         JJNt0Gga6lt7sQFyV0ry9nLQNei2W3Vvll2p1oBLBydWP8rB9vJvsP2wA9lM/E1IvyOm
         F1KmGgocyoRbN+32FBrsCiLc6wBNH1oxEc83urKl4FjYRZaWMfDhtdeSuJ5syWlDKgo1
         85jEGHiLFhf22OKJuA63InAp7kaLKMC4ReK88I8VIueJvi6oIGcIy09MdqTSaDoZ3UP4
         Edmr9cBnXEBtujlK4PCogOOqMij39/wM7P1ULFRnV9NXso+prQRDtD1xs5usrV6BX1dD
         6j5g==
X-Gm-Message-State: AOJu0YwLirlRqq4SF734kR4hkU1yGcreq2PUunE00a3u+zIHMv6Zn497
	bfDpEUHAybnI3iD7VMsa1nKEIgtQ6vXv3M2dFIdY4yK05YRMVt7M2cCVTpjpjK6zBnIcyUAt3R2
	efS8=
X-Gm-Gg: ASbGncvIV0J8S1QdT8rf7BsAOj8PPKv/8lp19zQuqlLEg1nUZgaWfZnuLaqjECj7TBT
	1vwIGiYk0jgj5R79ycv0aYBJdZyaZnCkQwP5xsQQj8TvQeCMIdRRIHBh94/3rTN+SlEGykCkZtf
	uzi1QmkFIfeXVRbpBKM2AQXH98BHLHg0+FvTXbFa2QnNZqOK4vGzlAVhscDdV7dNcjvHj8gpT3z
	tlPy8d/JRhJeneFD1ew6kSbE5aOiuJQEMuaZxu7IzPoWw+kjqBLgR5EhHeBmg0wvcaNP7Joer2g
	T6uKp4PD0t3X9SzctLHvpfEo3w0R5xuy41Ljg1Ty84rd74o7EkA+iLMCJQkXF7UcI1+r4N5Gesh
	c0v9RoHEoTTaA28M3cO/Jwda2inq6MTyTXVoKQXEiqsfr3g==
X-Google-Smtp-Source: AGHT+IHfJbaJv57Bho8r5sfyd+qAP9P2dr44hKcu2gIKy6YgKG5c4omoNyMg3Ahg2Rn7mVRnYL6UEg==
X-Received: by 2002:a17:907:2d2c:b0:add:ede0:b9d4 with SMTP id a640c23a62f3a-af93fd76ffamr1568967066b.0.1754411530898;
        Tue, 05 Aug 2025 09:32:10 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Xen-devel <xen-devel@lists.xen.org>,
	xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 1/2] efi: Call FreePages only if needed
Date: Tue,  5 Aug 2025 17:32:03 +0100
Message-ID: <20250805163204.3631483-2-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805163204.3631483-1-ross.lagerwall@citrix.com>
References: <20250805163204.3631483-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the config file is builtin, cfg.addr will be zero but Xen
unconditionally calls FreePages() on the address.

Xen may also call FreePages() with a zero address if blexit() is called
after this point since cfg.need_to_free is not set to false.

The UEFI specification does not say whether calling FreePages() with a
zero address is allowed so let's be cautious and use cfg.need_to_free
properly.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/common/efi/boot.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 778a39cc48e6..50ff1d1bd225 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1534,8 +1534,11 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
 
         efi_arch_cfg_file_late(loaded_image, dir_handle, section.s);
 
-        efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
-        cfg.addr = 0;
+        if ( cfg.need_to_free )
+        {
+            efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
+            cfg.need_to_free = false;
+        }
 
         if ( dir_handle )
             dir_handle->Close(dir_handle);
-- 
2.50.1


