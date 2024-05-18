Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9C48C9080
	for <lists+xen-devel@lfdr.de>; Sat, 18 May 2024 13:02:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724747.1129919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8Hpj-0006Xv-8Z; Sat, 18 May 2024 11:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724747.1129919; Sat, 18 May 2024 11:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8Hpj-0006VV-4N; Sat, 18 May 2024 11:02:35 +0000
Received: by outflank-mailman (input) for mailman id 724747;
 Sat, 18 May 2024 11:02:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v3Z6=MV=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s8Hph-0006PW-9X
 for xen-devel@lists.xenproject.org; Sat, 18 May 2024 11:02:33 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f11fff8-1506-11ef-b4bb-af5377834399;
 Sat, 18 May 2024 13:02:30 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3504ad82a64so739484f8f.3
 for <xen-devel@lists.xenproject.org>; Sat, 18 May 2024 04:02:30 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b8969fbsm23777282f8f.37.2024.05.18.04.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 May 2024 04:02:29 -0700 (PDT)
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
X-Inumbo-ID: 1f11fff8-1506-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716030150; x=1716634950; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BlMJnuVPgAuWx5mzHbOSNLc3FPf2ltoLWAdUx3vSNgk=;
        b=gLTjy9Ns0nqu8PTPCDvsCJKYBBslocmjcdAYLbmwi4X7FfMVA7HDdlbZIxUU4uXKZn
         6HyBJ/Po6UPTRp90DXOpQ2Qjs39sXS1bUg6pEGh71WEC7YOIJxzkgw/5yIsO2ni/K9Hf
         pzf8SQ7fXHm5xtpf1T1mwjhozvhaKj2Q98frzIS+oh2L20tBge0mMJ0Iyxf0Us1bu7Ht
         JSFVSAVodCNFG2Bw9NfgEZraWxeQvqkHHVuwL9OMj25EkpBEVP95DVFJH7SE9fh3v6CB
         KXIWq4LrUZgQXoJzVV58QckXSMPeQ5SAZI07jTXgdcDk2MrzBB0RK3mKJfAlMPJ3zS6b
         kS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716030150; x=1716634950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BlMJnuVPgAuWx5mzHbOSNLc3FPf2ltoLWAdUx3vSNgk=;
        b=ozckDJzIesOTB2XymCkxnKOENn8kbXGggmvU7JdZP1GvWsf1pT45P39pZPJa7QnkEQ
         /7N/FCLG/+Z07ly822P/D4TCOv3bljx59y8R/WSN9b/CgThYoHwHiyLW2Gnu3V9WfmTI
         k43qkvx4UP9FVOzNgelQaf0Ch8YnAiq34+uR3KWhCe9+5MQGcnXpARE3lT6E1XlsDbU6
         BgLDJKLDQSoigmnft4RU21/XjSVi5TQoQ6tZF0KPpSr/nPGNugSNA8AoeZjDqdyVMVwD
         eYlDNllO4U6g9GlzXaSBAM9XUKWOBCGYFpZjgV4x0F2AoYsFlXI8peAlWBHPfBuyThpe
         SGgw==
X-Gm-Message-State: AOJu0YwNQv0OtF2QrsTfuYHTcYl8rIa5wPzIMG2Bp69M8ItRKLurxVEd
	D6nZkb2pDkmyi7ybqWufAMKbIRDAJ5XMNAxY+UlltccGPETLfk5Gavbi1w==
X-Google-Smtp-Source: AGHT+IF3sugIpO35EWvY9cNYgcjkJaN2OWSjqd2R9sn79jz003ogS9QhQXo8F4pZmOtiVvARJnHCyw==
X-Received: by 2002:adf:e501:0:b0:34d:9e54:11ec with SMTP id ffacd0b85a97d-3504a61d24bmr16398583f8f.5.1716030150086;
        Sat, 18 May 2024 04:02:30 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: [PATCH for-4.19? v4 3/6] docs/man: Add altp2m_count parameter to the xl.cfg manual
Date: Sat, 18 May 2024 11:02:14 +0000
Message-Id: <35afc0e34aae2672a924103f77a8fe62b791b45e.1716029860.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716029860.git.w1benny@gmail.com>
References: <cover.1716029860.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Update manual pages to include detailed information about the altp2m_count
configuration parameter.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 docs/man/xl.cfg.5.pod.in | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 8f2b375ce9..5c09610cf4 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2039,6 +2039,20 @@ a single guest HVM domain. B<This option is deprecated, use the option
 B<Note>: While the option "altp2mhvm" is deprecated, legacy applications for
 x86 systems will continue to work using it.

+=item B<altp2m_count=NUMBER>
+
+Specifies the maximum number of alternate-p2m views available to the guest.
+This setting is crucial in domain introspection scenarios that require
+multiple physical-to-machine (p2m) memory mappings to be established
+simultaneously.
+
+Enabling multiple p2m views may increase memory usage. It is advisable to
+review and adjust the B<shadow_memory> setting as necessary to accommodate
+the additional memory requirements.
+
+B<Note>: This option is ignored if B<altp2m> is disabled. The default value
+is 10.
+
 =item B<nestedhvm=BOOLEAN>

 Enable or disables guest access to hardware virtualisation features,
--
2.34.1


