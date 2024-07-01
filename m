Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8569591EAEC
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 00:45:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751880.1159974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOPl6-0005PA-Pa; Mon, 01 Jul 2024 22:44:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751880.1159974; Mon, 01 Jul 2024 22:44:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOPl6-0005NZ-Jd; Mon, 01 Jul 2024 22:44:28 +0000
Received: by outflank-mailman (input) for mailman id 751880;
 Mon, 01 Jul 2024 22:44:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K0KN=OB=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sOPl5-0005NO-Qq
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 22:44:27 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77509bde-37fb-11ef-958a-bbd156597b9e;
 Tue, 02 Jul 2024 00:44:25 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52cf4ca8904so5695707e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 15:44:25 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab3b154sm1590903e87.259.2024.07.01.15.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 15:44:23 -0700 (PDT)
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
X-Inumbo-ID: 77509bde-37fb-11ef-958a-bbd156597b9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719873864; x=1720478664; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P5PrX7Mf/uUnupEbVW+b7PDHyiggb6/C3MHTxe8hmSs=;
        b=nWxUTJBZzh+E03uF7T6bDE3afXojUBfCfKkl3lPT978p/kwk+78gqKO5SjUELqq1Fs
         EdsBwF0tiRl33gKoosb54h+9e+tUl5UP1XJci1SaBn0W7831M5AQQJI1v4FDPeUcRoHK
         lsqL1p0dJBozRpiaFayY7pDASWf8YZFrsIpaSpjdLNbT6Kx01qNtPx7W6D2Foeelg1I3
         un6ldJVrqE04OOFKDYhS+2nfZ7c84KzD0gF6oLt+dWuuogCDM5qCS9JQ04UCWqMnIuov
         oxfSF8EattXDC2ipG55ozfBrCxU8lKswvfUb0Ib0C1R986FUgTGhup1dS4gCONvd0GBD
         REZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719873864; x=1720478664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5PrX7Mf/uUnupEbVW+b7PDHyiggb6/C3MHTxe8hmSs=;
        b=VtX/pIuU2Vj0tBdL3DQQsmQShuBW+8ED+k7VPDpXjJu/8qAfAOZItqDaGLlzfSmuzc
         DzwwTukDUly7ZrlQs8/V2v/9awWuCGfCRFTS3tWOrDuo0n24YaFf0tk6/WpCEDkyPefX
         6kDzPhLGSSEWbm1Kv5DwdEW8EogycsnHvGlB/YH7r5t0IwSNP7Nfm2MPLNTd34QfsJnf
         X/lMo/nbEigBp3OXIp1vxQyUUXmHbBgwMuD3+4Zz9vwdeRI09SaJlwEpSvPMWlMxxxf/
         hSGvDL2sbtJJk8nSe84wmaxuda3CmlGVv85dht6Yd3SdVhv63+4wnRe14A66zpvO+F4U
         YcFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI/dmXwcgWduI6jDNMRXgsUdr1OO9iv0e6goIzWJ34jKgmH9fPEt2YlPJeN8hAaZfP4Jkm+kGDpyo8dpH0RO41Efk3SW3BK4jcQwqJ7p0=
X-Gm-Message-State: AOJu0YwkdP4w/mtnkMoTE8liFUMMdBOcXT5p2v9k51jHxb8pwi37Eejs
	X2em0cM10ByzyjKJknWJ+Oy/J/Vg4IG77Q0VBMNAyCuBIUX/z2LE
X-Google-Smtp-Source: AGHT+IGCO1KLkxlsTsh8WUidlGFP1OF4KX+DPy6pH829DSJkzsU8858klanFcWRr8vEYi1+YHzFmuQ==
X-Received: by 2002:a05:6512:2315:b0:52c:db75:9640 with SMTP id 2adb3069b0e04-52e82701721mr4566344e87.48.1719873864067;
        Mon, 01 Jul 2024 15:44:24 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: [PATCH v1 0/2] xen: mapcache: Fix unmapping of first the entry in a bucket
Date: Tue,  2 Jul 2024 00:44:19 +0200
Message-ID: <20240701224421.1432654-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

This fixes the unmapping of the first mapping in a bucket of a mapcache.

We also add error handling to qemu_ram_block_from_host() to bail out when
xen_ram_addr_from_mapcache() doesn't find an existing mapping.

Cheers,
Edgar

Edgar E. Iglesias (2):
  physmem: Bail out qemu_ram_block_from_host() for invalid ram addrs
  xen: mapcache: Fix unmapping of first entries in buckets

 hw/xen/xen-mapcache.c | 12 +++++++++++-
 system/physmem.c      |  4 ++++
 2 files changed, 15 insertions(+), 1 deletion(-)

-- 
2.43.0


