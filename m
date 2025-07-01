Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C9CAF042B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 21:54:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029945.1403675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWh40-0000kR-Of; Tue, 01 Jul 2025 19:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029945.1403675; Tue, 01 Jul 2025 19:54:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWh40-0000hZ-LW; Tue, 01 Jul 2025 19:54:44 +0000
Received: by outflank-mailman (input) for mailman id 1029945;
 Tue, 01 Jul 2025 19:54:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u5am=ZO=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uWh3y-0000D0-TH
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 19:54:42 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39c67f59-56b5-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 21:54:40 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a5828d26e4so877671f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 12:54:40 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7e9d1csm14291644f8f.13.2025.07.01.12.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 12:54:39 -0700 (PDT)
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
X-Inumbo-ID: 39c67f59-56b5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751399680; x=1752004480; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vr3HAWcy3iR7RnCWpXjXk9ptcqN2sMtjI1FfiwT4ilQ=;
        b=jeHmPVAT9BaZNCp8sRjRX7034bVdSX7j4Baav3m17c3drX/8gVVpYFCSeQxTf3CwNd
         6Cf8Q2hja8Ynyxoi+/V5hIipjMyxORVJcW5yNSd4iKPxySHm2tqcK/r+sH6VPqVgfPOb
         qXjfZd2/o5mHFpr0jrrP6PUXVpdNN//42dRU+piVJgOdcSORaLNfJEGqKspnqKihJaGP
         2HogeIWYaULCHqliWjcsHby0AYMoANdzgkoXRoUPBDlvzsdGpSdqdMCjOXK29BhssT/x
         Ftz8nDPwolY3uhKwvnatN3VdifphTGAct9bXzohTPNdsqwsXiC5D8BtV0vWfOJCfWaCF
         ZVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751399680; x=1752004480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vr3HAWcy3iR7RnCWpXjXk9ptcqN2sMtjI1FfiwT4ilQ=;
        b=bTCEkZch+CLt3fvjgWTLOfBkpKCIamgzmtpkzP+ogEX4aMDp9mTM5R3RsAt7BVo/E2
         pKaCczrPXdaVdXtvnuu8aa3CEyJcDqNKyF49CRsK1Gj0exyz516o69rgyaCzpErfi/Ze
         bqEJ+1crVcAtLXEttf0U5Do+jPcR+OjmBqVjGSOVH6hbPl9hqaofmp9yxIcX6y0cwf7y
         a4QmALfshfa4CHS4+DA6SO+sOdVBM5UunwYuw49TSVzO5UZX6cJv2AVzxQJKJWaJ86lD
         eaah+m0Vmg86Uey42emYLfVukb2CMnsUjXWOyZt06R4asI4nS4p1Ctt+je4QsXD3m7HM
         zPow==
X-Gm-Message-State: AOJu0YybOabzM/y2EwNQnb9j0JrzUGlSpQKY6vHMI7X2hTuUY5Y18DYe
	ltw57vikUAxp7weFqVOp1EchmvtWF5ZBRSZxd970m0QPIXKPIlHMurV6aUXt5A==
X-Gm-Gg: ASbGncvZUJSN298OvH4fHT6LOlE4en/KqecWKHi6WmT9fnxGk0WvhewJ3A0riozktQS
	euo71ZFtY9PNRkMxzuV3AWZNLiRCP/L+DbYP7AHvdbFxYTuBkTI6rqRtbd7wXRTxFrp47zorDdR
	Y5yWMmcoPfXJ9LYJpKRdsOhkKdRMW3pKrrqIpTpAq6TCP6EWvWa1ep4NRE/64eeOXaz4AF3rRVZ
	P+K2o0SQRc7x9O66tCR/gv8z69xiCjOP4wtfjvkKyOARTW9wLZXUq//Bd054FxsQkF9BFwNwshn
	nY5CmOxPWVKfjhXYPdIvgyOCWzkc1b8bH+gXfuAvA4yYeXC6GNDohF87l/GOsCkYguPwvj1sGa3
	oII4gANh487kGpil2RRU3EDBRDUtGGLkaDlxIdsN33sdrKy+m/YPDRZtE1KK5Hg==
X-Google-Smtp-Source: AGHT+IE5MNyFWK/lLO1mAH7M1ZWZyzxLMqdKG4H+fdSXrnqN+L9LfTwuzNba/O0IRkDdrkgLzG65Cw==
X-Received: by 2002:a05:6000:4408:b0:3a4:f744:e019 with SMTP id ffacd0b85a97d-3af26beee03mr963549f8f.16.1751399679699;
        Tue, 01 Jul 2025 12:54:39 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v7 3/7] docs/man: Add altp2m_count parameter to the xl.cfg manual
Date: Tue,  1 Jul 2025 19:54:25 +0000
Message-Id: <862974b84f405ba81b801ec8613c3b05f87fc75d.1751397919.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1751397919.git.w1benny@gmail.com>
References: <cover.1751397919.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Update manual pages to include detailed information about the altp2m_count
configuration parameter.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Acked-by: Anthony PERARD <anthony.perard@vates.tech>
---
 docs/man/xl.cfg.5.pod.in | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 1d122982c6..5362fb0e9a 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2023,6 +2023,20 @@ a single guest HVM domain. B<This option is deprecated, use the option
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


