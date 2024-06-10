Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F68B902784
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 19:11:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737472.1143828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGiXs-0001Uf-5p; Mon, 10 Jun 2024 17:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737472.1143828; Mon, 10 Jun 2024 17:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGiXs-0001NA-28; Mon, 10 Jun 2024 17:11:00 +0000
Received: by outflank-mailman (input) for mailman id 737472;
 Mon, 10 Jun 2024 17:10:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7qHj=NM=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sGiXq-0000kp-9K
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 17:10:58 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 670c81b1-274c-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 19:10:57 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-579fa270e53so126105a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 10:10:57 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c76740d6asm3233169a12.7.2024.06.10.10.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 10:10:56 -0700 (PDT)
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
X-Inumbo-ID: 670c81b1-274c-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718039456; x=1718644256; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPmb+DHWEiqVT7szGSWw+jNtsJuaWk/ic+48cvb9OAo=;
        b=NsOWpw7sS/nXO+/4D4XoDrI/ApJmnH4hV+SssHOeplwmcdILGGPn0+/3e3o7yGUqA/
         j2flRi+gbXlglItLymEYqfXGnQ+SZtKU1ldKRtk1ttdlZPT+6v1tjjP9YnxAvmN3Ka86
         cstIgL4kR+I6ADqZZBcxCJsfm58Aic2ojVBV14S/hCIT4FtmLrlCjvGd59Rj+cbCYrmr
         1lg0Lv8elhHZzxCf5Q7aFhxiqJaJIOu/Pw2v6mZaWOyB5HwtuiGKY2aveleFpVczIBc1
         An0s9WhEHuS/irhMMLFE3TSv9ZHA+XHAVJiipx9Eh46f9vnEmSW3Qsudxai8ewzRTHH0
         fVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718039456; x=1718644256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPmb+DHWEiqVT7szGSWw+jNtsJuaWk/ic+48cvb9OAo=;
        b=de6LtBBBpGB4iDNOY/99lpd2f7wAV5Q0OcgOXEQVoROKZ/AWbSM5KAZduO+6XqHqG/
         IL590RC10OaEyZ9Xoh2ehptpzaoWyXOiNauO/3ZdyQ4vuYN7kVbg1Sscfr+VWXbTOLcB
         NtwaxQkArvfIccqjQumvorxYkdW1JCdYcIdaENRDpktH59mbNOiLXCJ+FyF81V4apBxA
         +aBbYlrog1jprXdCFh65ss649YpNYxBI0BqEe/AXTSw6uUhqG+EI4w79upmysxIcdGF6
         66oG4D04BDYTL4CS2tBgyDwP6AIIMDqxMtgDrGmEklyubLh3JvQ+D5lDNvQ7hah3H253
         9VtA==
X-Gm-Message-State: AOJu0Yw3Gy1n65F2bSy0smSI6ZCBkOE+Bw2rVUtuY5vxvQ9U5BXSEcxB
	DWrj/eui6ju7gmn+7zDhvkL30KFLiQhv0NZKplkJYr8yqxfomEFOVHQ7Hw==
X-Google-Smtp-Source: AGHT+IFF7WY/utzbt16P6pMIGjBwTMzNZPRvG1xOsy5dBLd/SvLAgJU2Ul0KuGeNsWZToGp5v3lUdA==
X-Received: by 2002:a17:906:388:b0:a6e:f596:7433 with SMTP id a640c23a62f3a-a6ef59675b7mr637961966b.45.1718039456495;
        Mon, 10 Jun 2024 10:10:56 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: [PATCH for-4.19? v6 5/9] docs/man: Add altp2m_count parameter to the xl.cfg manual
Date: Mon, 10 Jun 2024 17:10:43 +0000
Message-Id: <056a6d3337aafa36f341596e6236cf21dd7e705b.1718038855.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718038855.git.w1benny@gmail.com>
References: <cover.1718038855.git.w1benny@gmail.com>
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
index ac3f88fd57..ff03b43884 100644
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


