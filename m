Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC43B04B00
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 00:49:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043178.1413312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubRys-0004iO-22; Mon, 14 Jul 2025 22:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043178.1413312; Mon, 14 Jul 2025 22:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubRyr-0004dS-RS; Mon, 14 Jul 2025 22:49:05 +0000
Received: by outflank-mailman (input) for mailman id 1043178;
 Mon, 14 Jul 2025 22:49:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c3lH=Z3=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1ubRyq-00040h-TO
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 22:49:04 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd08db91-6104-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 00:49:02 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a4e575db1aso268195f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 15:49:02 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd18ffsm13288903f8f.9.2025.07.14.15.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 15:49:01 -0700 (PDT)
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
X-Inumbo-ID: bd08db91-6104-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752533342; x=1753138142; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vr3HAWcy3iR7RnCWpXjXk9ptcqN2sMtjI1FfiwT4ilQ=;
        b=dfAA7JPDe9gmYQb/NaQsfED72tYqUB8+NurRd/G3ax8S6TspPK4VdVbdVlmIBDhL44
         NvFw9/93czJ2ui4TH5p9/DFLKBNBRSxxrcrkEWn/x8TvibE99GfZ9bqbIoSL58pQv1KW
         gR0Vi7VSFgn2A+q2shv6OSa5wTlovkf7aMrK7fRmgcpyVI+vZGz8d8U/AMmdzIJrCT85
         IVSyJgtNbCHg3L0fJ0kx6Wa9ihhZEOFU0XMe+8QGXvsS+jsy7jCyQg72LNGH3SKGJ3VU
         t1e9WB8W6BxvIUGcCOfs1aka54WV6Ly/R4/W8cg6SxBeaB2LowkxsQI3FyUfU/R1g2x3
         Xtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533342; x=1753138142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vr3HAWcy3iR7RnCWpXjXk9ptcqN2sMtjI1FfiwT4ilQ=;
        b=DM/2pnvCJIIKJNnbvloH/o1TIT+76su9YxjZfaaauDCmupkRYsL1it9jempr4MlMi5
         RR/F494tVT4OwG4WCbRg/zllpKTuK84uPF7HXLDmLaj33671qEC/PDPv3sjF/2M0HLKX
         M1vxa66Eq3H/NOLFO4SX2XLgczzvGDo3NFXavhYwMED0AFJdSp5UAtutsKsIoCF3MSS6
         ZOu9gA2GtYmLXgbXqYcZhvPWO14+LacYkcvIRMymtTZEH9NDPzkkZfkdyKWJn7It1LUj
         9W952cLvxi+lwcbk0uC/3F646QVKHi7H1VPwnQItxwZEbiajA1wxnDNvZgPBQBwu/Gvb
         a9GQ==
X-Gm-Message-State: AOJu0Yzt5kKvnS/qUEby3+rwDsdlOmItsQZ4shG6CwxYBBjiwspdrXAd
	5G7ogrFG4fPRbckCD8b97GybAYecF3O3mTpiHclSiQgsdpdosyiClvCaP0wDoQ==
X-Gm-Gg: ASbGncuLuVz4kKZJ0kgIENZhBEsgbXlKYEZZh0zpl5xccCLdI3/CSbuFosjBBa0dL5D
	KD/l/BCnRwJsadRaV0oZhqnDnuz+3yA+8OFqbjNUaxC8knSnvJ6GpDpKil0/PH7BM/ItsP0Z3CM
	bqsssuva/8spygZSf7E0OVO4hf7tKuuuI2262KIk4N2B0U54eJubanRKK2qyxLPXymvekj+Oy1X
	cIyEnSazXJQF0NdFSMhf3M4fnBEcCf7/F3awLeg4rN/9fixGKGuPsoKUKj4U0a8K710CPlkheUS
	rsvK7N0oy/56W2R2EfSHlQHnM0C9WFISA0PQXwjW2s3xaJJbJchH70g1noWiSs9TxFSpV96w3ci
	6v55mLNcM9JGIxwhprQ27rH2SHTdb0SRHmiiYEgZSsOboi0qS68W2eoYdEePEXUMk0NOA1CnDCZ
	eNozQSa5KLoangHQ9YZ8cZHQ==
X-Google-Smtp-Source: AGHT+IHS8m8AnrVA1AYpx7j+9GYNiQTp9QbybzArFtYabZVNom9umZhMZo12kJI17sriMaI0pWF7Gg==
X-Received: by 2002:a5d:5d83:0:b0:3a6:ed68:cef9 with SMTP id ffacd0b85a97d-3b5f2de5e18mr3680487f8f.3.1752533341712;
        Mon, 14 Jul 2025 15:49:01 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v8 3/7] docs/man: Add altp2m_count parameter to the xl.cfg manual
Date: Mon, 14 Jul 2025 22:48:50 +0000
Message-Id: <8ae729912e4aadf5ba8eb70d8d779e691858f4b9.1752531797.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1752531797.git.w1benny@gmail.com>
References: <cover.1752531797.git.w1benny@gmail.com>
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


