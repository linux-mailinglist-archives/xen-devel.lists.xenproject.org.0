Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3729D9E9A33
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 16:16:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851516.1265576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKfUo-0003lK-CY; Mon, 09 Dec 2024 15:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851516.1265576; Mon, 09 Dec 2024 15:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKfUo-0003jE-8U; Mon, 09 Dec 2024 15:16:26 +0000
Received: by outflank-mailman (input) for mailman id 851516;
 Mon, 09 Dec 2024 15:16:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VMJQ=TC=cloud.com=andrii.sultanov@srs-se1.protection.inumbo.net>)
 id 1tKfUm-0003j3-Ms
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 15:16:24 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d62bf36-b640-11ef-a0d5-8be0dac302b0;
 Mon, 09 Dec 2024 16:16:23 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aa684b6d9c7so206145166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 07:16:23 -0800 (PST)
Received: from CSGPROD238885.citrite.net
 (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net. [82.13.70.251])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa663334906sm365993466b.72.2024.12.09.07.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 07:16:22 -0800 (PST)
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
X-Inumbo-ID: 8d62bf36-b640-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1733757383; x=1734362183; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gCamU80fNjuDATSjKEwbAHTRUpRYNPRSPAburm9D41E=;
        b=bZk4FP07yv/0bCKFDkzN+H4rEKto5KslJPwyMlJHRMZ/r9N6Kxtiya5NybSPzD7C+u
         cVz+wag1QUMYB1lS46cV6wZkFGrhfUujLYcYf1Pt+YZT/3Vz3KgHjlp6f95rYu6YLj2p
         QE2wHBa9TBsik/GafV32aFfCUzPwqtMFZfAas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733757383; x=1734362183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gCamU80fNjuDATSjKEwbAHTRUpRYNPRSPAburm9D41E=;
        b=uOpJFPXs6l/84iXls/tYbZp1VtsWgoE/DHEbrEmsmIUkK5JkhS++8Vc39Ngf4XxuBq
         iODsRQtNSveYKfNP1RV1tBcX+fOh8W5PvGgOCROHE75I5bjsYxEw1qpydWlwKAl31qUl
         xfDcf03Fe0+VExmj2lsr/tJlYeQObWQIgitbu71BC8pNezRdZakE0OSGf+HUErBoUZ9k
         MKpmF1MBzAmKrKHSP7gaHuHyYB/NJFlUCK6FhYcXCxWLlf+RSCWRO5gWmwKWzZR1emnB
         CPGM7HtYxb+gizn3Byai+KnDCtVBMCa/FzSEpENKbwpoSwJiA0VCwjizbnerWUVpfJVE
         U69Q==
X-Gm-Message-State: AOJu0Yy2xLKb80s4hoLkK1UI3LQILph6Q9+tYB7bEpMmdt3HQpvPM3Ji
	nYCy/V+elqftkev693yS+nZVag7ARLVEFFx8iFO/pvRmRnhFhh5jJx8E33dmUA3nRQ/dHV9qROt
	O
X-Gm-Gg: ASbGnctU06pn7145F0uy+l/4tDzoMlvXClCrNd2GKGGG2dXZo7KhSLgH/DMdY9ownUt
	AZeVR4pswhNLFo2DQXfqmaGg6ldBynIRpA1a23QEaQ9e32rwbfELbzydWGyAX2T5Sc/BbL9xt2a
	FTA7tLrhtvLu4/Ep70JvwofF8vfLVhhW+PYvCj7M0StGdd8z/K9kEw+/1I0WgEu+PJpqFQKt8G3
	S2wQYyC0R9f/kgc7cVI2GOMyZ8fzKPxxDaeUDTOyix7Ct+LoDZBzIlJXbk6ZAottSsiD9o2YbQw
	Ot9i6zCef4xrX6hoN86kepICW3ZXPp2DWzx+kl3aaze2QtbOqCl6tXHW
X-Google-Smtp-Source: AGHT+IFvfcjXlljV7VBApJAZ1OTOiNMf95sJGveV1De9xnZ0aMYx2trgV2R48AFApVvF2W/Tqr7WrQ==
X-Received: by 2002:a17:906:18aa:b0:aa6:8096:2043 with SMTP id a640c23a62f3a-aa6809621a9mr396365766b.8.1733757382914;
        Mon, 09 Dec 2024 07:16:22 -0800 (PST)
From: Andrii Sultanov <andrii.sultanov@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <andrii.sultanov@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v1 0/1] Fix rpath handling in OCaml's Makefile.rules
Date: Mon,  9 Dec 2024 15:16:17 +0000
Message-Id: <cover.1733757256.git.andrii.sultanov@cloud.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As reported by Nix's Xen team, OCaml stub libs would embed an absolute
rpath in the binaries, which was picked up on by patchelf. This is a
symptom of improper handling of -rpath-link in the first place, so
correct that and get rid of the issue.

Andrii Sultanov (1):
  tools/ocaml: Specify rpath correctly for ocamlmklib

 tools/ocaml/Makefile.rules | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.39.5


