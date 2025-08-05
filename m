Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 787F8B1B891
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 18:32:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070746.1434384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujKaD-0003Dy-Th; Tue, 05 Aug 2025 16:32:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070746.1434384; Tue, 05 Aug 2025 16:32:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujKaD-0003Au-Q6; Tue, 05 Aug 2025 16:32:13 +0000
Received: by outflank-mailman (input) for mailman id 1070746;
 Tue, 05 Aug 2025 16:32:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FQWd=2R=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1ujKaB-0002Yg-SJ
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 16:32:11 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bca38bbb-7219-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 18:32:11 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-af91a6b7a06so1026243466b.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 09:32:11 -0700 (PDT)
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
X-Inumbo-ID: bca38bbb-7219-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754411531; x=1755016331; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HyChThRw6GVKg1romDTn5fzN51ukPoZgESaAn7xK/ic=;
        b=aNVpRU6C4xg2zlyZdIPP2L46YxQHMoGZUh19fkSorhraw2jWccc/q1mSbSDtEPazU0
         4F7k7t4374HowTm8y7/3wHZGh5xQ5iaZv+GCxDOvGrFedQR9i33sqCbbVU1alXtB1fnN
         1Afkw21KgYEI/oI/BZRjGmvhO49OW+MEoKbfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754411531; x=1755016331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HyChThRw6GVKg1romDTn5fzN51ukPoZgESaAn7xK/ic=;
        b=dLDkT7vTrF19oMiA5tcgpJYxO0LqnW7d2ChOnycMGrMnIBGhSVVZLEuIg3m994Y11I
         a2YeP5cGQt/xGeke3LuAtSRuLsTX79Phd69QA4UPhJwPTRqUwSYFBf+xNn+XwjtZRJ++
         i6SU5HgiaoH9c1dJmF06skXM7YwhSf5D2bpRihH55V0j/if6k95IcSkpDuE6d6DfRRTe
         OXkFFfmzQPAIVtKtH0EmNhoxZCkcO8uXzAYBw+idiXf/P7c9jRWwQDh3NSPVpxQjZsRu
         ltrzk3xcQcxX/exUeM4nd358JVZJ4FGtwX4Huats9xueVGppgzEfnAbDlMV+xiwCfCf6
         PNAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX/pb1XDciA1x4Ikly3yikgvF5pgNGwJ+O2TCXdSwZ767/hU8r6KP6IQ+yTEn2MkPtFUlm1ff3Grw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkzKHrjLhQmkRFGWx3rjP7QoUWuLJikl46enes8Q6WnERGR1TW
	L/sXIT0Q1dr+dfYugHh53Ur5Rimjtg0UTr5QjkWkRH99+BIMxXC9JQ+8pVNyJfBc8eWhrnilhmQ
	tWMA=
X-Gm-Gg: ASbGncs1ZxaaOFfyK6WZITiNddlmSDJaJty71/h33HJtHAwUSvjfrUYtza8RXT+3eMN
	KRKBEKA8WDkXUtkhSP55ZdwKadW4PS3GKbjjavIZc6GfJdJiK6UQOSCk92N2y9+oiv7JBPp7lD4
	QLLgUw5EQqBIpwvsqUGoMoJH5ogUxT+JKzteqNncZBi14NXqDa17d1/Bv/H3vezjm1i1chWrjTy
	dE+7eMdj99wo13lqdqdV4YDCKGn8meBibvLmvnW7YxeIA5L7WhM74R2DqsgF1glaOx4XsSQFbrE
	P4PCI7pBnJ134ZaSWInO5d+4o/ef8HVSeHnM/u693hMZ6Zj6GioEUf5nzZatvDDsJzVICnDZMQ8
	GZxSD4ouPNr7Vx+OLXDOL0EnyBt6a6U4Ptyz2xxR2G6av8w==
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


