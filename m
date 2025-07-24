Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E81EB106A5
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 11:42:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055532.1423912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uesSe-0008LX-Ue; Thu, 24 Jul 2025 09:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055532.1423912; Thu, 24 Jul 2025 09:42:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uesSe-0008Hk-O1; Thu, 24 Jul 2025 09:42:00 +0000
Received: by outflank-mailman (input) for mailman id 1055532;
 Thu, 24 Jul 2025 09:41:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t79f=2F=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uesSd-0007nR-Ob
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 09:41:59 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70bc2abd-6872-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 11:41:57 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-32b50f357ecso6956701fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 02:41:57 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-331e08e98aesm2418261fa.54.2025.07.24.02.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 02:41:55 -0700 (PDT)
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
X-Inumbo-ID: 70bc2abd-6872-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753350117; x=1753954917; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDyBEr2C8bHK7ao0mUQj4cm53R0gNtsq0NOW3g9oj/Q=;
        b=nLYN2YTYC3Tq3EmXpznRIFS/poVsuszaY1/EdoBsnENnweUpf6MVszGGcORqddGG8N
         6tPPn7lT+QTcE4F+EpTTh7dx002SEglDVl4Vrkn/ePNLIA6sY20N8C7aPIkFDZsRKz9o
         afaor4GwnXoY3fa7eY/edP8Fo29ZCYfWkBUCJXMMkZzACzPlhQ/RRKmwsV6fGWKpt6wo
         MtTFXv6l9BzntMHI78idnOjzA6juBWn5zFHFuXXEkdMjcrVmom3IszOLWo6ufjlRaZ1Q
         l9CJ61pwvhPev+lvbOHH3Wuw2Yo+DIReL5qYtWN5TmPnDqWY5LwvFzpFtY+kp2238m9d
         RKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753350117; x=1753954917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDyBEr2C8bHK7ao0mUQj4cm53R0gNtsq0NOW3g9oj/Q=;
        b=tH8fOIxyGA1/4pRkmEAaq99bGrWzRWnGnId+BLKQje7Ff/fhpRpd5a1bEBkbr71+OR
         nNGh/ydaHkUZj9GoHLPi+B8fCZdsIhGeybcsLT9+iCtnlmKh+5IfhZHlK2kycx2oUxN6
         /gLfVU+ndwoztMcMyesPF1f96KBoBsq0/x72VB0v9+meE0IVnTdoVlN7LR4MsbHGj0X9
         VMLODUjzacyessZwUAL4RRdQtowp65vlTNR3cRmaryk2rz4/xJNPWKrHdvG/ernyDNpr
         JH+p2M4NQsMHV3eYb8or5Wj8emQ7MhznpeQ6Q+mRpw+H/egFCQdTU+cydxQUJmmYgZl+
         tTHw==
X-Gm-Message-State: AOJu0Yy/h/v806qwtVQpHzlJtMJhxZwh/2WF7f1p8xj+svlZ2KRIWtCh
	VsjP4ZD9DBDQk737E4RaNCTRwVlltWmZFyIqpRwwz6vjGOWVpMYOGnctoWVDPQ==
X-Gm-Gg: ASbGncuGFGQeeFQa8F0VgXX/9xGan03r8IQ4OjYqOLBEEeFCgReYpsOnkiqANkiqFrg
	SFxFBeQI6gxuJN+SBWdTyV0l9yJEHsLyemB2xggETmPcdTI2Ca8XduZB8VA1J5UUyQT5AY3iyRN
	aB/ESR/jQ1xAGXi//zgr0DBYkGJ8dEPcxJE7oMdnNutdhxM9Z5/TzXAgC9iJCiuwX/pW3HPPMZ9
	05iuWEfC5y5gG1BGfzFl62WBlsYuHeVv96tE/WnVGsoik9URg7XbAjXws5rKi+DXzo+YeJGqWtZ
	ntov60+lUj5gztJodSxOsEmkzhmQpHaoVaumvDmkV8FGcaJ7GsQAfvlhRs1chKueETiLJWU57dv
	8MNFjlH9afePwfOs1mF7OFBwxWasuGOf0B5k40ygw3J98mQYmJP4gwoG2nekfRg==
X-Google-Smtp-Source: AGHT+IG9GwZak+d2gdXYdv5JwkuYoBsbORCRb/3VrhaWWfxO04GfqQIi4en2cdJdWRLhviWo+wWqmQ==
X-Received: by 2002:a2e:a549:0:b0:32a:78f7:9bef with SMTP id 38308e7fff4ca-330dfbdc5a1mr20783461fa.8.1753350116663;
        Thu, 24 Jul 2025 02:41:56 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 3/4] SUPPORT.md: Document PSCI SYSTEM_SUSPEND support for guests
Date: Thu, 24 Jul 2025 12:40:58 +0300
Message-ID: <4b6c7e5fe521d482d7268dfcc570f323b9bd0878.1753349109.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1753349108.git.mykola_kvach@epam.com>
References: <cover.1753349108.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Add a new entry under the "Virtual Hardware, QEMU" section documenting
support for the optional PSCI SYSTEM_SUSPEND function exposed to guests.

This function is available via the virtual PSCI (vPSCI) interface and
allows guest domains (domUs) to initiate system suspend operations.

The feature is currently marked as Experimental.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v6:
- Dropped the generic guest PSCI support entry (merged in a separate patch)
- This patch now documents only the SYSTEM_SUSPEND optional function
- Reworded commit message to match the final form after rebase

Changes in v5:
- Dropped ARM/PSCI entry: this refers to internal use of PSCI SMC calls,
  which is not relevant for SUPPORT.md
- Added a dedicated entry for PSCI SYSTEM_SUSPEND instead of generic guest
  PSCI info; guest PSCI support was documented in a separate patch
---
 SUPPORT.md | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 6a82a92189..b5ab049b52 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -962,8 +962,9 @@ Emulated PSCI interface exposed to guests. We support all mandatory
 functions of PSCI 1.1. See below for the list of optional PSCI call
 implemented and their status.
 
-   Status, Mandatory: Supported
-   Status, MIGRATE_INFO_TYPE: Supported
+    Status, Mandatory: Supported
+    Status, MIGRATE_INFO_TYPE: Supported
+    Status, SYSTEM_SUSPEND: Experimental
 
 ## Virtual Hardware, QEMU
 
-- 
2.48.1


