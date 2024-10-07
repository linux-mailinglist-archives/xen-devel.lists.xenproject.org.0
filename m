Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F26909938E5
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 23:17:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812487.1225254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxv63-0005fj-I5; Mon, 07 Oct 2024 21:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812487.1225254; Mon, 07 Oct 2024 21:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxv63-0005cf-Er; Mon, 07 Oct 2024 21:16:51 +0000
Received: by outflank-mailman (input) for mailman id 812487;
 Mon, 07 Oct 2024 21:16:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=siVB=RD=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sxv61-0005cT-IA
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 21:16:49 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 761cb62f-84f1-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 23:16:47 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5369f1c7cb8so5193912e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 14:16:47 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539aff1d1f3sm940665e87.153.2024.10.07.14.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 14:16:46 -0700 (PDT)
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
X-Inumbo-ID: 761cb62f-84f1-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728335807; x=1728940607; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WTsx4tGg+0BZ0batbq5fRRa5gbLdHaXOR3GOVsVa/MI=;
        b=Zk8TM0izDAjuDtXwcoLR5sSdPnDrXfSlZwAVFKTj61GNXYGTDpU6eI+mQNRM8xL5/k
         Ml45zEaBZzvPvd/Xd1Yr9VSzGzoV0iCVaS4QJh8WbdgkbOdk4fom7QpRXlwYyNMtElGX
         JiddsgiK93PDHBZiZ+2KAz4zb5c1OnrcUepdujJbpgU9muNJjUXLOVqQq8JxHMrc2ai1
         E05ypUglKj9sk3UzzMmA4jHBrpCFjFtV9D2oSeq7PUS1Rsa5gXcZwmc46GQ6ZQM+XUNE
         +duACPICsEFRixpKBy3S6Hp1f5r4cmRDMsHUqMNWT+VujJlgovHCeTEau0WsiObbDZSV
         fZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728335807; x=1728940607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTsx4tGg+0BZ0batbq5fRRa5gbLdHaXOR3GOVsVa/MI=;
        b=UheHQ8gLYis93U6j9GvziPaY5AvdYclYOwML2cFP/AmmfGikMMZScGFAV600kJWgHz
         GSd6ufNdzS1+/dAnVBOfSGQDBlwkuN+IiS+5/0lGFUJ+Yj3uUKOEERsP2SZ7o0TLJXgV
         2i+WNPaiuBtDdfEnCCyMVG26CZR1zxeC7Cuk+TdISt1G20sSpP/LyfR+VkVmhhDR8+UQ
         PEgM1mZwt/iYkxJfod5C43BSKGSdbfuxZSgf4OY0wax6cr85N/Y6OyXZbVx8plUmNMts
         VV1+iVVGmn9zVdc59dx20/FWJZwxyr8meTOPvHIMJIlQDb1mVzBVUSgKhBlwBC/NHN8U
         DLuA==
X-Forwarded-Encrypted: i=1; AJvYcCUuf/Y90qkE3yFF5zDlCKTF/GmQiqd5usqjaXZ/1PggDvd+yYpWEO16qdW11UkXVfYrlbd4xAxX90E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzliFvsMw/rDAyfV0pUoCH3wwTyVRhnCyoWGHLh9PHWYjAmAU/c
	gmMmXvU/XdfK2hpmsDPT7NiPj1+qJM6aUXuO8d/IlfKG1OAoGlqu
X-Google-Smtp-Source: AGHT+IHM96Ou/Yg0S6T+8VUjhm8uxhY/cn7FmBubowF4/pRcTBUlupijb+NR9My3MkGaQGgdakpFhQ==
X-Received: by 2002:a05:6512:ba2:b0:536:9f02:17b4 with SMTP id 2adb3069b0e04-539ab9cf41bmr6550868e87.40.1728335806821;
        Mon, 07 Oct 2024 14:16:46 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: [PATCH v1 0/1] hw/xen: Avoid Avoid use of uninitialized bufioreq_evtchn
Date: Mon,  7 Oct 2024 23:16:41 +0200
Message-ID: <20241007211643.1572271-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

This has a fix for Coverity CID 1563383 reported by Peter.

Avoid use of uninitialized bufioreq_evtchn. It should only
be used if buffered IOREQs are enabled.

Cheers,
Edgar

Edgar E. Iglesias (1):
  hw/xen: Avoid use of uninitialized bufioreq_evtchn

 hw/xen/xen-hvm-common.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.43.0


