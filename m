Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 309A79E9DAD
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 18:58:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851794.1265805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKi1D-0007q3-U1; Mon, 09 Dec 2024 17:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851794.1265805; Mon, 09 Dec 2024 17:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKi1D-0007nZ-Qq; Mon, 09 Dec 2024 17:58:03 +0000
Received: by outflank-mailman (input) for mailman id 851794;
 Mon, 09 Dec 2024 17:58:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VMJQ=TC=cloud.com=andrii.sultanov@srs-se1.protection.inumbo.net>)
 id 1tKi1B-0007nO-Sj
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 17:58:01 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2091f904-b657-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 18:57:59 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aa67ac42819so255780366b.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 09:57:59 -0800 (PST)
Received: from CSGPROD238885.citrite.net
 (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net. [82.13.70.251])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa66c646e64sm353428266b.25.2024.12.09.09.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 09:57:58 -0800 (PST)
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
X-Inumbo-ID: 2091f904-b657-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1733767079; x=1734371879; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vvxsWYZGY25rWK0i2gMHKsDthRQUDhGDBPCU5tlH/5o=;
        b=H3f8xmEtMzDPzswLnRAm/m1up6tGAWUmUB+lUxZUVXtGyH4zzQLBfboaWCl4OVC6X9
         TPM+dRwRbzKC6lgF6rB15PeIZth33+w5QP3/W0i1CGydE1wcIrmRZYsU0UzltJTV6BAN
         L9eRfisi3IfvhvYHUlTOlSj/kdikWL6nXosPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733767079; x=1734371879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vvxsWYZGY25rWK0i2gMHKsDthRQUDhGDBPCU5tlH/5o=;
        b=SMNGdhdvdfgPKuGJeKop5Q+Zrhyzo5WvL3vh/Ef1eMBHtOqDBEVbev3iUGyJ/v78oo
         fqN3JUMVLJFP+hn5FG3MrIYqWoVUzIOcHTTJCHbD5nymmaEe98sdZbYuadwmKF9RNWrv
         b6+XJhjREx1NY92nNyhsOvW5kAABwsmCjp0F6rMpxD8z0nj4rEicesU3Ivt3FVc64Cfm
         AI/mGZC0JMY0e6K46J9NgHo79D3jUtaVBaf5Jj2T7yEZPESFBntfBqTlcFsdrMsmQd0Z
         TLwSVTBLsiaSTG2SI6CkJONdxuzzaI01P608kBhBAgS/ITX5qkyszZCRu2ywuk/Pxdsu
         poBA==
X-Gm-Message-State: AOJu0Yz8xxgEBzBdDK2zS9Ff62BsJ0w8TENUlREdJyTz6MKHT0FbOQzM
	wDS72QhyVsLNY7Ayl+XM/x8Vu9PVZCRXjM2yX5HF4ctqL9a+RREznzbCjoXgiHaaC2s9OLPuogo
	5
X-Gm-Gg: ASbGncs4Exz8Y2WLMuvIbNQfd+ZjYxWkF5wjTNX75E8pDmPeyRjYvdFmGx1r7f/byr7
	gETWc8NNhMAc3IjlzU9AlsH6kMoCE6q6r8dYt3VUvFLXThkxDtkw9R/R6TaYYWeZfsQTFglUozr
	yUvSkz1JiMd2ozA0U3jocR8VcJCSH2De5Dx2o3HuSjJZ2nWHuvTk1n/pemlA7Lg5bnmlHcEGkbP
	eX1pilKBJT44EV9RS/aWbPiqBolEG3Aopk3TF6gc2PyydCUrgzxC0dSvV3pv7W8c60QAYrSREM0
	Ead8fR7t4Gq3NX/Zi6sAgJ1pSsWAMVs8eL7l8l3w6P6pqbF5Z/ZRcj7Mory3
X-Google-Smtp-Source: AGHT+IGZvQr/woSVfYu8SGNfWP4VHfrBEtaJm3m1X0KAemLihiBxtbD+J7S9JyMi+6R4/6Jb5RGfDQ==
X-Received: by 2002:a17:907:7847:b0:aa6:834b:d138 with SMTP id a640c23a62f3a-aa6834be354mr477407066b.19.1733767078854;
        Mon, 09 Dec 2024 09:57:58 -0800 (PST)
From: Andrii Sultanov <andrii.sultanov@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <andrii.sultanov@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 0/1] Fix rpath handling in OCaml's Makefile.rules
Date: Mon,  9 Dec 2024 17:57:48 +0000
Message-Id: <cover.1733766758.git.andrii.sultanov@cloud.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As reported by Nix's Xen team, OCaml stub libs would embed an absolute
rpath in the binaries, which was picked up on by patchelf. This is a
symptom of improper handling of -rpath-link in the first place, so
correct that and get rid of the issue.

Changes in v2:
- Previous version mistakenly did not actually get rid of the absolute
  rpath, pass -L directly to the linker as well
- Credit the original reporter

Andrii Sultanov (1):
  tools/ocaml: Specify rpath correctly for ocamlmklib

 tools/ocaml/Makefile.rules | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.39.5


