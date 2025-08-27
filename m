Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3D4B38B4D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 23:23:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096968.1451521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urNc9-0004iI-RR; Wed, 27 Aug 2025 21:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096968.1451521; Wed, 27 Aug 2025 21:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urNc9-0004et-NY; Wed, 27 Aug 2025 21:23:29 +0000
Received: by outflank-mailman (input) for mailman id 1096968;
 Wed, 27 Aug 2025 21:23:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4G5n=3H=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1urNc7-0004Ze-F6
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 21:23:27 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1115eb59-838c-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 23:23:25 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-3367144d35cso2536521fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 14:23:25 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e2687acsm29844061fa.32.2025.08.27.14.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Aug 2025 14:23:23 -0700 (PDT)
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
X-Inumbo-ID: 1115eb59-838c-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756329805; x=1756934605; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hngrpYued6VRjNdXSCXsejFnZ9+NvVTFmNBYrfCV2Ms=;
        b=Cv79Ide2cFFt0s+TvdL6Zs/ahlS00JfhTEz4Oo1tvL7kUrjvw37MEyiTHI33dPlaFu
         dE13PWjjAVz9BgcJiHHhifefyhDiSTcT/IwgxLYqsyWEBvznZX56tLzCNCITa/4xDQn6
         q0vyjH+Yk6mek7SydGsYA8BUMSkw5diNt6JH8Rs7/n0eKdSEUZgiO7BC8Xg3Mg0rSAkV
         4zVu99kQTkOLE/9X4Qg4qPA37lJxBj0aPUAFithTErIAjlpUlRZYVpyH1MJ+OjKmeOZL
         oQb1FPDQ/TQH6B+NB8oJ6myaq3Lovj1bApbrfRCYedZQnVo68vgdDGhHg93iTVTyo+85
         y8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756329805; x=1756934605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hngrpYued6VRjNdXSCXsejFnZ9+NvVTFmNBYrfCV2Ms=;
        b=lk08IbutyMwZJmzVNIZF3X7ahWnxmiySfO6uiWk9ibj3lXT/I8xFF+sWd5lPRC8zZM
         Pevf1XQmn0h7eBoHFwDDxS+KxGn0ftLW9KHdEClioRA/sj58Wsrh934Qvr5rQLGx04zX
         R4VszUasFIhq1T6mPCjEDWbbCUGHxgd18KTynX241PZDg45EhukljlAjh7Ls+BxcfgJ4
         Ck3OFDuLObx+DiXDwlT4D+1jBtFScdqoMpUeEGRmDPGIHGcht13GIW71lSOZ/YdnNs6J
         du+31WipnroquxcD2dxBQ09nUJUBut4GIZGfozB7OpvK3oAYPMwyGScVokeFFwMDuW0T
         85lA==
X-Gm-Message-State: AOJu0YzX20PMCLuZKtwqBmSttBh+cwPVEQCf9ndYCi9kllAIGPA5uj6X
	m10i4uc84rkxV3oiUNvhHcJtDsDBVhzH16MPWDcvNMxChBepBRsxptNsvaukjQ==
X-Gm-Gg: ASbGncvSV05eC0L19lotiepFor2hlAQFGfH7OmvTApBvTkWvoDfMIGaXZ4Y3tKnSMji
	f8ma9rO0rPU21WG8spUNWSom2+xr4ebAb98TvRzxsphKeh8VgrmSyDxAcX74tKkzor3Cf0QekBv
	bdJ2Dl+ImtqKG9QV+UCBXIDXzSRCO1abrOt+aBggFfoiMtBYGoXvc6Sa2Cy45scCSn617Wpxq0w
	URj4R9ZwnpxT6yGrY7jjOPmKVjHPV+tr9Os9h86sXjwd82zxQ2wzJS6yRgrdC6UN5ESGFf8xSBa
	V3m+m31MQhA0D+WeV5byG03lDHqp2keBoHddt+aFYp9fllDZ0rz25PHcRbM+tSBvLF0JZpp6iCq
	LXNCTMUv7CH7eBqpMXJfldn9XqJKcbHb3QK0jvW88ri6vuuIblxMR0P7jIYiGBpfM77BQVX4s
X-Google-Smtp-Source: AGHT+IFZ7/a+Z4Ya5OFseGv4WAsudiBI8JlgzU95o3FyISDikdMjY/sPmohiGyLSeBFqe21NhR0jRA==
X-Received: by 2002:a2e:a54d:0:b0:336:6be3:2d0b with SMTP id 38308e7fff4ca-3366be3391bmr43153191fa.29.1756329804516;
        Wed, 27 Aug 2025 14:23:24 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v10 4/4] CHANGELOG: Document guest suspend/resume to RAM support on Arm
Date: Thu, 28 Aug 2025 00:21:36 +0300
Message-ID: <c31fe62632805cdd9c7640a496bfb8ca790346a1.1756329091.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756329091.git.mykola_kvach@epam.com>
References: <cover.1756329091.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Mention the newly added support for guest suspend and resume to/from
RAM via vPSCI on Arm platforms.

This support is limited to non-hardware domain guests.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Chnages in v6:
- removed reduntand explanation that thi support added for
  both arm32 and arm64.

Changes in v5:
- adjustments to the commit title and message
- expanded the changelog entry to include more context about
  suspend/resume support introduced in this patch series
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index cd34ea87b8..7a75bd37cb 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -36,6 +36,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
  - On Arm:
     - Ability to enable stack protector
+    - Support for guest suspend and resume to/from RAM via vPSCI.
+      Applies only to non-hardware domain guests.
 
 ### Removed
  - On x86:
-- 
2.48.1


