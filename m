Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C64926C20
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 00:55:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753354.1161592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP8sx-0004MV-2B; Wed, 03 Jul 2024 22:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753354.1161592; Wed, 03 Jul 2024 22:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP8sw-0004Kz-VY; Wed, 03 Jul 2024 22:55:34 +0000
Received: by outflank-mailman (input) for mailman id 753354;
 Wed, 03 Jul 2024 22:55:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i9qc=OD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sP8sv-0004Kt-35
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 22:55:33 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5954058a-398f-11ef-bbf9-fd08da9f4363;
 Thu, 04 Jul 2024 00:55:31 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-58b0dddab8cso20899a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 15:55:31 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72aaf638f3sm549984566b.89.2024.07.03.15.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 15:55:28 -0700 (PDT)
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
X-Inumbo-ID: 5954058a-398f-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720047330; x=1720652130; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xNUcg+74yo1LZXA7SrhNeHIJmGxigv4IommGW56xp0A=;
        b=GV/6xALTND81lh6Fvta9lGwAV+aBgpl6n0VUnoEay0tAhUATSXcgR2eiIiry7x+gvi
         ru37Mdqr3VhU08qDpSeoxNoq5n9UOcVxFKG3qpHDgLR9DQR4zlqnVWI9yazEmDNCF/wH
         dY9DotpjXeScHc8bKurQWC5nJkjUpRcq+4nYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720047330; x=1720652130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNUcg+74yo1LZXA7SrhNeHIJmGxigv4IommGW56xp0A=;
        b=rr/T0u3BKOrzHPDePQthEJSMpdzc1bzYcwv05yQ63IkDPBATNanR8RCRHI9V0EeXAC
         IhqyRpGPAqJr0n4+3TMN8KdfVOuInpcTrsjbBDLjZ9t0rj141aVDKQgcTC46HTXztCE2
         4z69ehieVIc/Q+KrNvaw/OAn+1K+Fgudlzs4noSFYVNIhz9J1EYY4ejmax9BbsbcC+/r
         iYtQvgd77vMOW7uxaAeY5fr1OI99/TQvejYyQQntFsd5yrMYhFTAT8f4c6UBiZ0celmv
         T6CrcPWhVmf/eguEE2p1VdUgzftHwmw+wxIJbVG1AhDFo+97iJ1g8B9FOOwkYVNFs7lP
         HXyA==
X-Gm-Message-State: AOJu0YzlaTljI7Q40etL1APT1qHepES0MBKPKlCWhZ7q0oF2GkyDx2Zh
	TActKOPNKQBAGa398No80xji27XMZ6CWjmy5iM+PPMZuUS+VnfcpZq3QA/EdnHa1LkBQPHnNXak
	O
X-Google-Smtp-Source: AGHT+IHz12w/BXciCsA/NEklP5zwdjQGhruZ7XJg6uhpo1RWrskbviq0d4qM0PSt/EPhk+ovOcx8uw==
X-Received: by 2002:a17:906:d1cf:b0:a77:aea8:a793 with SMTP id a640c23a62f3a-a77aea8abb8mr79319466b.45.1720047329841;
        Wed, 03 Jul 2024 15:55:29 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19? 0/2] build/mkheader: Fixes
Date: Wed,  3 Jul 2024 23:55:23 +0100
Message-Id: <20240703225525.1759907-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For 4.19?  Noticed while staring at build logs.  Low risk, as the build system
contains a cross-check that mkheader generates the same layout.

Not the end of the world if these fixes delay to 4.20.

Andrew Cooper (2):
  build/mkheader: Remove C-isms from the code
  build/mkheader: Fix Syntax/DeprecationWarnings

 tools/include/xen-foreign/mkheader.py | 108 +++++++++++++-------------
 1 file changed, 53 insertions(+), 55 deletions(-)

-- 
2.39.2


