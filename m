Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2D1B26BD3
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 18:04:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081976.1441941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umaQx-0000pm-Ph; Thu, 14 Aug 2025 16:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081976.1441941; Thu, 14 Aug 2025 16:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umaQx-0000mj-MA; Thu, 14 Aug 2025 16:04:07 +0000
Received: by outflank-mailman (input) for mailman id 1081976;
 Thu, 14 Aug 2025 16:04:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Upc=22=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1umaQw-0000md-O2
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 16:04:06 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d613ce6-7928-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 18:04:05 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45a1b00a65fso5767355e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 09:04:05 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45a1c78c221sm28152895e9.26.2025.08.14.09.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 09:04:03 -0700 (PDT)
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
X-Inumbo-ID: 4d613ce6-7928-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755187444; x=1755792244; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jCKrWl0FEOIc08WwhKkIkC+zGADjn62RIWnNbdlXusg=;
        b=pctlDAv5UgovAdBOR9IgFhN+rrD/a/Ix2nRgFU6yeq8WFJBzNqYjET1gofiMtuLNmZ
         7e7bJQI0b6sDMatMCkCk7Gb2sClR0M2sIrWlaL7z4NJD2Aqjfpg7/AMDEymEwp0OLL9D
         12v/3xKdVe2I2qI4M7kFJzisTP3Hdi2LHAxhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755187444; x=1755792244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCKrWl0FEOIc08WwhKkIkC+zGADjn62RIWnNbdlXusg=;
        b=WXDS3QNp6Izg0P/LDRBTeDkYMm77VNIFebKucIWfqEtTYzH0K19U4Bahl/btQRswQa
         LBNq0p/lggtmY0zyL1q2tVeSqzq7Ab9aWk9+8OK5r20YTglxOk/UEHnnoTIDaxrakt2W
         fYuMMpskINZFLvhDHZ0De+JtBDybqGBkHy8uesxM8d0YSqsTOWc3Ii3xTDTNl/GAlTtg
         txH6ClEXivJ0itgwgJHx+h6AZqcHxMPL3ejhoS9M5GpkANkvrZV6rQC4qRvkjnTYdsYz
         71b89Do2XDKZ+ukGxiVTbgHY4SZMdbcvZwlFdC3gagtH6dY5sCGNaVEESw/FqMHp6Z73
         ReVQ==
X-Gm-Message-State: AOJu0Yzkjw3ghxuvI6hcQWdZqazl5krvt3uL9USPvygq+24ti49NKzKe
	HgEkRQrGCpaZDMnzlpvYsDbae4ust4WOuVMQQ7tQMHdpG5f9XuhuxuQc97QNMHa5WX4/5s/rDcp
	Sdsmy
X-Gm-Gg: ASbGnctAsHImjdBE4xzPA4sOYT2PFZwvsknrzSuGsikZ86XzuLpBq90JLFjXPe2lYYi
	m7HzZA4akRKrz78GPlvGTR0fHPeEVIuIrsOtJu5EMsyzdFKSiq66hXJTdxzDkAyNeJNRJMVRUwv
	/UHKKoMAmlXgul6H9Hy0dona7fkE7xUrR2IQ+UyZKPA6ES+vbIcUYwKNMoBWe9K6A/mnA26IDzY
	QymZrHDErDLl0zxap+Y5YxE7xfcE1Sih1ocH7gs1AvdgSfOKVqiQp9jkJ0yZOz8OVgQvOtTWjjD
	FzRMD35h2AYwYIcVZA6hJfUtRVWpHnNEK5FFansNpkLlP1K6wVZsr/mLWT3dovNxxwSmaJ+WyHo
	Ib7uYpN8lZ9zjrZnBX8qOBZrKTPvgc7H7zwPVFMkekIT02ZEctFa048BuO79V74SyyA==
X-Google-Smtp-Source: AGHT+IHSP78ZsNGWnELa4szKnXKmszKjtKx5MLU1Zi/ilP+83vvo8qWLR36rAlHuD2alOib/jPJqug==
X-Received: by 2002:a05:600c:354e:b0:459:d780:3602 with SMTP id 5b1f17b1804b1-45a1b657252mr25741995e9.23.1755187444387;
        Thu, 14 Aug 2025 09:04:04 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: stewart.hildebrand@amd.com,
	Jiqian.Chen@amd.com,
	jbeulich@suse.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 0/5] xen/vpci: miscellaneous fixes
Date: Thu, 14 Aug 2025 18:03:53 +0200
Message-ID: <20250814160358.95543-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The following series started with the report in:

https://lore.kernel.org/xen-devel/dbc003a2-9202-46ec-bf87-2829d8a63d53@citrix.com/

And ended up doing a bit of cleanup on the way.  I think the overall
result is nicer, I never really liked the deferral of the setting of the
command and ROM BAR registers, as it makes the logic much harder to
follow.  I've done some testing, but I will probably do some
specific testing to ensure the error paths work as expected - as I don't
have a system that trigger those.  Posting it ahead because some patches
are fairly trivial, and to get feedback on the approach.

Thanks, Roger.

Roger Pau Monne (5):
  xen/vpci: purge BAR rangeset contents before use
  xen/vpci: make BAR mapping more resilient for the hardware domain
  xen/vpci: simplify handling of memory decoding and ROM enable writes
  vpci/msix: move MSI-X hole punching as a result of memory decoding
    enable
  xen/vpci: only check BAR validity once

 xen/drivers/vpci/header.c | 186 ++++++++++++++++----------------------
 xen/include/xen/vpci.h    |   5 +
 2 files changed, 82 insertions(+), 109 deletions(-)

-- 
2.49.0


