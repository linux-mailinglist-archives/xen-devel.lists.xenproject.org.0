Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A33996F6F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 17:15:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814782.1228456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syYPU-00008E-N9; Wed, 09 Oct 2024 15:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814782.1228456; Wed, 09 Oct 2024 15:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syYPU-00005e-K3; Wed, 09 Oct 2024 15:15:32 +0000
Received: by outflank-mailman (input) for mailman id 814782;
 Wed, 09 Oct 2024 15:15:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B0zC=RF=cloud.com=andrii.sultanov@srs-se1.protection.inumbo.net>)
 id 1syYPT-00005W-93
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 15:15:31 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51b4b2c0-8651-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 17:15:29 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c8a2579d94so8137980a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 08:15:29 -0700 (PDT)
Received: from EMEAENGAAD87503.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c91fd5d187sm857407a12.82.2024.10.09.08.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 08:15:28 -0700 (PDT)
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
X-Inumbo-ID: 51b4b2c0-8651-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728486928; x=1729091728; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r+/86E6IyE1vne2BAybxM85VAVTaht9kCIik4VBf/yI=;
        b=ZoTpIm+o3KWPwHQfcmjF+W2FubF5k7AvBpbLNvq1LtWubV8BzaisrI1QqGF5hlr0Co
         pk9LUTuofG6g5ourt0sjU8stxCj727K3X0Mpqf8ZoDrCuIdYOp2sfNJzJKZwlhaZ7jBj
         3bv6msYuHCNIOzqCBzIBGOsopuA7w+9LUPbTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728486928; x=1729091728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+/86E6IyE1vne2BAybxM85VAVTaht9kCIik4VBf/yI=;
        b=Yl5LGDkhZ0hR6tMCobZFDxmkjHQ1SEGB2JepcLfo2MBl7k0bz7KYSzwWTVc74QRCE+
         shtLVumoc5YJCgkuv6T89Vwfmus8okNsSeeJfo0VL1hXsvjLUKla2elczkddN8M4+emb
         OVJnlDtL/MYSVeVMoHBiA/v4XHYZwT1UgFWZcmOyiaZD8WkcHjMPw/xj0DijdRh/wIU9
         Qrpkh6qsg7hXrv2VUSKC9gvWoiBssHhJFDlEM9I+Mol+BLra0OyjcdTuKRswZscZwGWV
         Js6s0072V4eKEJt6+sgS+iTgz/yls7tThToM08xOO9d73ZjabkLRx72pTc1yMHRdXjaD
         wvjQ==
X-Gm-Message-State: AOJu0YxsnbfHC7bGV9AOuMKZl/Jf6b58o0Tmb8WR3Xvv9j8MKez7GWss
	rey8zjJfoBesss6bHww2sZjj+tlOswYwz4RAcrn22iEHovrbTVxumCfD/2DjutAZISuNnroynVO
	d
X-Google-Smtp-Source: AGHT+IEfsWJMqI1FWUQ07t0r+IqgNMs9Y8RYOPmremC1lEdDeVIGYNdZN6Q4RjUypk+J/xO6TKQggQ==
X-Received: by 2002:a05:6402:13c3:b0:5c3:d908:98f0 with SMTP id 4fb4d7f45d1cf-5c91d543cccmr2442864a12.3.1728486928551;
        Wed, 09 Oct 2024 08:15:28 -0700 (PDT)
From: Andrii Sultanov <andrii.sultanov@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <andrii.sultanov@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	Edwin Torok <edwin.torok@cloud.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v1 0/1] Oxenstored packaging fixes
Date: Wed,  9 Oct 2024 16:15:19 +0100
Message-Id: <cover.1728471268.git.andrii.sultanov@cloud.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following the work on stabilizing some interfaces used by oxenstored
to allow bringing it out of the xen tree, there are some additional
fixes needed around packaging the plugin interface.

With these changes, I was able to get the spec repo to build and the
forked oxenstored to launch properly on the host.

Andrii Sultanov (1):
  ocaml/libs: Remove xsd_glue_dev package, also install
    plugin_interface_v1.a

 tools/ocaml/libs/xsd_glue/Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

-- 
2.39.5


