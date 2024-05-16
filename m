Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9F38C7537
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 13:28:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723178.1127802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZHf-00074U-1b; Thu, 16 May 2024 11:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723178.1127802; Thu, 16 May 2024 11:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZHe-0006z4-R6; Thu, 16 May 2024 11:28:26 +0000
Received: by outflank-mailman (input) for mailman id 723178;
 Thu, 16 May 2024 11:28:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S52g=MT=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s7ZHd-0006b7-QU
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 11:28:25 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68341d63-1377-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 13:28:24 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5731ffcc905so3612976a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 04:28:24 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574bcede889sm7083043a12.92.2024.05.16.04.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 04:28:23 -0700 (PDT)
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
X-Inumbo-ID: 68341d63-1377-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715858903; x=1716463703; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BlMJnuVPgAuWx5mzHbOSNLc3FPf2ltoLWAdUx3vSNgk=;
        b=gzVMOmwwqbE8u6F1Alm2kSXpRqxOTycAxF0lf0ewQX3WoV8k0MdCdBpmzf4axl8csN
         dn4hTFR97WvSpiqI1Hjs++H/y+e+tCchefjZsqSMKR4MZK+DaWlRjvP36e9h9u0SnrEg
         eFrWiADKTh++V7CeFaFap4Vglk/LBLMceyqiLUUmM1ozFGogeKqy8BjjmmL3li16kfbL
         RsDaC31zL8Swpw+c850H+TaYJ/9wnGUDCKpbPtDzH+JVc/3ODYSraicWJFLNFdf/ZcgZ
         GiO6pwDigqbuNnLZQqkJ9UNrbgl86Jv6FC0XeyAdTqPO1WLBnuBfvsw4J61VBzUHS+yU
         hJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858903; x=1716463703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BlMJnuVPgAuWx5mzHbOSNLc3FPf2ltoLWAdUx3vSNgk=;
        b=GWGEllRKoEOdN/FQ1LNzwEc5VRplE+fr1EYXCCfPnU31ybS4njQw1quJAjrccQ/MnY
         KlH5TF5fkBIIcONLHnOHiWh2eA65YeeqaOZ6Vv9iX8d1eon2QkJSvFQ91thZNO8UJdfN
         ltnV1kdOjo9xq16rwvhSKH1MQUzr7uiWO1ZzASEZzC7Q6vjTzO5/eRwiIrYQt81q/kNb
         s+p1AZvRBK4KtV/+S2GvD6mRgUK7sn2ozcgiyTyAT0/IReLvUdcp8VsBKiUdE/5dr7SN
         dWLmVoWe52pdcjLOJjhu1n60iUHh6AHmwHHP2wo2bK4B3MlqgqvQ6txZxy+unMHcugPr
         NMgg==
X-Gm-Message-State: AOJu0YxMDP5GFSx3QiGwKdX5MZVOBkd9u3WP0/o542qe0CY5DmKuJe36
	7C0k3vHnsAlkU+QoFFVNEWXERjxsLyxFSOIMD967FsycK/DkK704yz0LGw==
X-Google-Smtp-Source: AGHT+IF0k5pWTfdbbFTMbNHJJ4YGIIz1Hmc94hXY1We+20u83JMGUYKVzWzEzNTo2L/vf/NhpK+Sgg==
X-Received: by 2002:a50:ccdd:0:b0:574:eb22:3629 with SMTP id 4fb4d7f45d1cf-574eb223677mr4705030a12.19.1715858903583;
        Thu, 16 May 2024 04:28:23 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: [PATCH for-4.19? v3 3/6] docs/man: Add altp2m_count parameter to the xl.cfg manual
Date: Thu, 16 May 2024 11:28:10 +0000
Message-Id: <12aced8fdd0f2f8e0d1298895393edb8f741d641.1715858136.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715858136.git.w1benny@gmail.com>
References: <cover.1715858136.git.w1benny@gmail.com>
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


