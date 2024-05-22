Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2A58CD931
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 19:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728780.1133819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sACMh-0006R6-8I; Thu, 23 May 2024 17:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728780.1133819; Thu, 23 May 2024 17:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sACMh-0006PF-5V; Thu, 23 May 2024 17:36:31 +0000
Received: by outflank-mailman (input) for mailman id 728780;
 Thu, 23 May 2024 17:36:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VxBl=M2=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sACMf-0006P9-Gb
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 17:36:29 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc64ac94-192a-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 19:36:28 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2e95125e257so11512871fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 10:36:28 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d0bbcc28sm42381361fa.11.2024.05.23.10.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 10:36:26 -0700 (PDT)
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
X-Inumbo-ID: fc64ac94-192a-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716485787; x=1717090587; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2nhVxn4m914yqzzG3ZTplvnUhE7IWg6qsPrEng0IE1s=;
        b=QevTmdB9syaU6km507CPmOshg7Zv6VhWw7Lg+SYURVsgUb0QO2/hD4r9ekopOII8nS
         Pz1grsYGodl0dsiWB081GRvsIqNBoJcDRYWOGyGSNsuIKfm+sv/BNMbsbNRlX0DqIeR3
         vgVnXmBGtRrCARQG5Xeaz9+machJ3pKTzWf6Xdhq08cLmCrSa55K5hye/O7aGRiw1zEv
         It8+EWCx/gDQb5D4Nk4dF2uHl8yBj0U//pROk/jo/H+5t7vR7e9xm2rcw3SMH4kGgS6o
         mcbWFe3rRJqU0gD9kSUD+q5CgEU3U/Bbr4Blglycxz9IZITCglJJjzXoHnA4IsNjWzk/
         VexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716485787; x=1717090587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2nhVxn4m914yqzzG3ZTplvnUhE7IWg6qsPrEng0IE1s=;
        b=FM36IHPKpIelMhnsB3qvirE5UhM8SCPutXMbnixmXuCAZfWKmU+nopakRrASOseKiw
         UfQanOQHunI4U+/CSVIhA0rBbYJLJELZ9VXS6VQZ6cqF4WtRTWHgAKhHnR64lMotWBsb
         AbkVU0bsomuSyF8xoM4v4b3wmdUHh2E4O4/DF4khkYEUhHeUsltAD8slTtZUPP28L9ts
         hOBDyzRZRcMvCjt8XQ/+OBkvmNbFc0kYKNRh9AilvKTw32LEOuVr6zkMs1NQZPtWmJ9Z
         csgNVu58ki220Lqevy5GZ6RF3biyTloNqz1eRWSDGpluLBwuyNAWgXejcaEPNa8SP0xJ
         WRTg==
X-Gm-Message-State: AOJu0Yw0pU0PZXsBcRPfpUoFRYKhz4S8w13SnaGMZSI4HjV7jHQzvjTO
	xWhM70XT/JQ0mcwelb6f+r2OytLZ4U862YKLAqNxAhirryAisjn/6R6aUpqV
X-Google-Smtp-Source: AGHT+IEjPh2S+gCXd+sQX9LTo20O76jh2A2wHSH6oaO2/vd+qem/f2LWcrbpGqr+CFZ5BQWRJN9QJA==
X-Received: by 2002:a2e:9611:0:b0:2dd:44b:d63d with SMTP id 38308e7fff4ca-2e951b82c05mr10292831fa.12.1716485787156;
        Thu, 23 May 2024 10:36:27 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	edgar.iglesias@amd.com
Subject: [PATCH v1 0/1] xen/arm: smmuv3: Mark more init-only functions with __init
Date: Wed, 22 May 2024 15:28:28 +0200
Message-Id: <20240522132829.1278625-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

I was scanning for code that we could potentially move from the
.text section into .init.text and found a few candidates.

I'm not sure if this makes sense, perhaps we don't want to mark
these functions for other reasons but my scripts found this chain
of SMMUv3 init functions as only reachable by .inittext code.
Perhaps it's a little late in the release cycle to consider this...

Best regards,
Edgar


Edgar E. Iglesias (1):
  xen/arm: smmuv3: Mark more init-only functions with __init

 xen/drivers/passthrough/arm/smmu-v3.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

-- 
2.40.1


