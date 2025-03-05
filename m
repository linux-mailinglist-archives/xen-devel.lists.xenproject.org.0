Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 993E0A4FE5B
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 13:15:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902228.1310183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpndQ-0002IN-GJ; Wed, 05 Mar 2025 12:14:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902228.1310183; Wed, 05 Mar 2025 12:14:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpndQ-0002GK-Cl; Wed, 05 Mar 2025 12:14:00 +0000
Received: by outflank-mailman (input) for mailman id 902228;
 Wed, 05 Mar 2025 12:13:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eLt8=VY=cloud.com=andrii.sultanov@srs-se1.protection.inumbo.net>)
 id 1tpndP-0002GE-7g
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 12:13:59 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e64f899-f9bb-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 13:13:54 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ab744d5e567so137817266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 04:13:54 -0800 (PST)
Received: from CSGPROD238885.citrite.net
 (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net. [82.13.70.251])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac21dd2c297sm49786366b.110.2025.03.05.04.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 04:13:53 -0800 (PST)
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
X-Inumbo-ID: 4e64f899-f9bb-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741176834; x=1741781634; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvWiuk8Uxkqdm6Y9jUJ/8FAJWqJeQkr3WBjY90GvljY=;
        b=LxSBjkyBU/p1cJZyoj5r7yC8n23AEpuSzDdoSOgrq66LQTItQ4gMJGPw7NXE5vmgnw
         GDfEfno9+rnJAqo2GTuQZuIbNzP8WK6YMIBowpcyEt7EmsLaiSw1dTk9oI2oOzHKfQRF
         hQTlgR+JyYxblPA9vdDmfizfk3gcAI5x9C73o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741176834; x=1741781634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvWiuk8Uxkqdm6Y9jUJ/8FAJWqJeQkr3WBjY90GvljY=;
        b=QM4UKVZHDaUf0P9iiSh1XDa4GdrYRr5a3vaEzCV/WGltu8BSYHKURTZuXcyWu8kugD
         EPNQq7rev3jxLE0X/zIsNtVtbujIKlHBlcnR87NHM3KAyYYR0tl4xtcsy+dGUAFqvFcY
         GXGV2X3+Fe925cT3P4XCOQdQMG53vZzeW2UxhDuKMSyv8BO2l+0S02pajD/Q4q1lpTlG
         4jHvicNuekiRAtsBhARlzU32+VGDUOfPxZbxSoY2+R+tf+68kbCrLJfAbkyrtUxKQb+v
         +cY1aMc7EHlvfRzkWGM/62KEVSl7TMyN+5BM7BXVS/YnuOrY/vry8518aK1UsR/pMrA7
         g5qg==
X-Forwarded-Encrypted: i=1; AJvYcCUFagXeIif6k7SBMJ6SIZB6b961XjtAEhU+tI9kX6jrgO+RpfcWhEAC04A5vaP9Q91kr9v7QLJ0vjg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYU7l/yGfWoYf5lPHt0ErSnZwrsA10VOlyK1frUCipxqCBabzL
	SkQe+rQPtbgvfZ/uXpnuGlNaYk4lVqL3DhVq23qTt1y1zy/T+ZmDUhv72ib1Zro=
X-Gm-Gg: ASbGnctQkaEivZfhMtbDGHUynUmcfKxvJPxpC+7K0LHqThKmeFMJJwGQjRhCxlDE+0A
	O4fHF7ZqvE3IMZdTa32MiniXl7JSvifjdvqURfNxEwfpjVrAPwjb0u2XPVAk3x9lkwaN49LH44T
	sVVMMM7z5fYBCoUUiwrq8rdwSIXlmiH4yYVOam8+yorU5trNT50AHs9eM8a1ruXU/ko1MVe+QbU
	UziiK0qP7gIMdKiSvXhuOtZSAWX179wLJYE+WYJGM1OrK0tszz3p4mPM1hvNJ466ZOYyq9yB6It
	HFYuTXyf0N3D/k8wrXdiALxE3Ag9wRvGbriPetXaU2UmBeKivXruqN7TwW/gZqfujgZY/2X/DeX
	LecVtLOfNEVlBOqJFUam4ewYvGjIDUU8l/wZlYTzZpOfOc6BHcuE=
X-Google-Smtp-Source: AGHT+IHGUWwB1yE8HwBJm3ZSwkn5aVzqF4UWcCM8+vXy12m2Zo6U+E5Nz3gi1ID45TxzE4VIWaSsaQ==
X-Received: by 2002:a17:907:7b88:b0:abf:641a:571e with SMTP id a640c23a62f3a-ac20f01c0d6mr263168466b.30.1741176833648;
        Wed, 05 Mar 2025 04:13:53 -0800 (PST)
From: Andrii Sultanov <andrii.sultanov@cloud.com>
To: jgross@suse.com
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] docs: fix INTRODUCE description in xenstore.txt
Date: Wed,  5 Mar 2025 12:13:52 +0000
Message-Id: <20250305121352.83589-1-andrii.sultanov@cloud.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250305085201.14258-1-jgross@suse.com>
References: <20250305085201.14258-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unrelated to the contents of this patch, but talking about docs/misc/xenstore.txt:
it also mentions GET/SET_QUOTA calls, but these are not part of the xs_wire.h,
and instead can only be used as sub-arguments to CONTROL calls.


