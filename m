Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 124F995CAFF
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 12:52:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782250.1191726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shRtm-0004FP-DE; Fri, 23 Aug 2024 10:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782250.1191726; Fri, 23 Aug 2024 10:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shRtm-0004CP-AV; Fri, 23 Aug 2024 10:52:06 +0000
Received: by outflank-mailman (input) for mailman id 782250;
 Fri, 23 Aug 2024 10:52:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imIp=PW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1shRtk-0004C8-Sn
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 10:52:04 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bad78ee3-613d-11ef-8776-851b0ebba9a2;
 Fri, 23 Aug 2024 12:52:02 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52f01b8738dso1400369e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 03:52:02 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f47d1c3sm239923866b.169.2024.08.23.03.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 03:52:00 -0700 (PDT)
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
X-Inumbo-ID: bad78ee3-613d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724410322; x=1725015122; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AeHyNpXsgfseJeT0cvaTJIaBLC+Vx+eo9RM6HETHoAE=;
        b=e4Pvcjmf4MEzL3kkX88B9GjdXoQceuVFzlBQ7qrC5TXSf6we08eCHtV34eTup3ViD7
         1NBBqog61ku6of4TX17zBGXTgql05Ng9zXXRR2l8E3cJKn3e81wUxPwJu7JSXmwCqycw
         rKKtfHFAP3wpqVIIudYHHP5I/rV3f5p/ARKtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724410322; x=1725015122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AeHyNpXsgfseJeT0cvaTJIaBLC+Vx+eo9RM6HETHoAE=;
        b=MftPfsLW8xFuqOwd2ngf3EkOf06lqXVKEyLIn2TBxTQNAwB4BvTTIMGdx9+EYtJDRm
         iaNxllkvn+pkLYwBeOMIamRMFoUYmq7WnQAY1O/DYOYA++cNJKxKhZIcqiedbvOuhZSh
         nBS6d4e1OB7rFrXUb4y4aZkJKhFkxAHCRHkCJn8g3EYtRceITMJSeEydBslL2aDBCKyA
         WdyBCVXoy0KwYdjdDbTk9c+mmRlSam3L9cXXO6PqF4wKocuLz9GmBrplK6HI+PIwIyYa
         Yzp28OjZ+I5KKogI727RiOTFmDmXCpdsxMUYpE5hiDyKfXCtkjoKDj4q1HmsFck5JkB5
         ye6w==
X-Gm-Message-State: AOJu0YwA9w75rNwiZpJ/gOo71BKDP0vcNlDmZLsHU8knsg8Jwq2cub1D
	O/dGeKVcu54wXXHHbKye/d6RQWvOEQAfqXrDaeNS5Jo52mM1/CbCLHTNpUYsDuEtSqTYBCoWULS
	U
X-Google-Smtp-Source: AGHT+IEQxCJOnxlTu8+00FLx7551MVKErmDQQstAwKkyi/JkA4dcwur1U8mrAjcvR1AIWJuVX/Eirg==
X-Received: by 2002:a05:6512:2822:b0:52c:df6d:e52e with SMTP id 2adb3069b0e04-53438773a92mr1163686e87.16.1724410321121;
        Fri, 23 Aug 2024 03:52:01 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Rob Hoes <Rob.Hoes@citrix.com>,
	Andrii Sultanov <andrii.sultanov@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 0/3] tools/ocaml: Incremental build fixes
Date: Fri, 23 Aug 2024 11:51:54 +0100
Message-Id: <20240823105157.991275-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Various extra build bugfixes found while reviewing the `Stabilize Oxenstored's
interface with` series.

Andrew Cooper (3):
  tools/ocaml: Drop OCAMLOPTFLAG_G invocation
  tools/ocaml: Drop o= rune
  tools/ocaml: Fix the version embedded in META files

 tools/ocaml/Makefile.rules | 5 +++--
 tools/ocaml/common.make    | 7 ++-----
 2 files changed, 5 insertions(+), 7 deletions(-)


base-commit: 5231765a4e6528a3208e49885b9eeff42519a6c1
-- 
2.39.2


