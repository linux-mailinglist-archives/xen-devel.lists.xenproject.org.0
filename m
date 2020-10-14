Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B305B28E5C2
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 19:54:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6958.18189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSkyI-00060z-NB; Wed, 14 Oct 2020 17:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6958.18189; Wed, 14 Oct 2020 17:53:54 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSkyI-00060a-Jn; Wed, 14 Oct 2020 17:53:54 +0000
Received: by outflank-mailman (input) for mailman id 6958;
 Wed, 14 Oct 2020 17:53:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x6PD=DV=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kSkyH-00060V-ER
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 17:53:53 +0000
Received: from mail-io1-xd2b.google.com (unknown [2607:f8b0:4864:20::d2b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aaeb0442-ea25-46b0-8d45-bb4f5f644f8f;
 Wed, 14 Oct 2020 17:53:52 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id 67so16824iob.8
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2020 10:53:52 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 v15sm67765ile.37.2020.10.14.10.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 10:53:51 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=x6PD=DV=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kSkyH-00060V-ER
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 17:53:53 +0000
X-Inumbo-ID: aaeb0442-ea25-46b0-8d45-bb4f5f644f8f
Received: from mail-io1-xd2b.google.com (unknown [2607:f8b0:4864:20::d2b])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id aaeb0442-ea25-46b0-8d45-bb4f5f644f8f;
	Wed, 14 Oct 2020 17:53:52 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id 67so16824iob.8
        for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2020 10:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9VhKl5FefWluZOToOnttrb98bLhg6tznaGTvKOR1WyM=;
        b=LG38mpaEoTV3xmy9S+QxjaWHOFTAY40ftlyU0IYGVHB9VtZgunbOT4b7+0t1C5T/EG
         0K/xX3UGeFbtMaIaaUMcDJPwbrJa44CMtFBH7HQwj32Kb5q7UppzuMTRdu8z+SZYXjFA
         PJ4Hw8bx+hbBQN68dgzyNRS6WRMAmLQynrOhBd8bvU5I3WtPesoBslSTB3jYYGO6jWAl
         rCEMC7IdqsHuI0fO8ML8nHdP22EXBUYdmj5R0h6M66pECLDPcPY2EnMSdeQzFb/rXPE5
         XDkuRe2mxM4/p9Tvg2PunJju+QPcb8PtUcEjYhyJ3bsGJ+af/CgeLPyNFnul+AHDJEYb
         GDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9VhKl5FefWluZOToOnttrb98bLhg6tznaGTvKOR1WyM=;
        b=a55Ke1h1aBzwKDpzSYbh5OK3+V299GShIemgydU/darBKZjYxRQfPzWQPgz+yUV4RA
         Pe++jcds4NKbXUncGiyp0yDIpYU3TT1adVAfKoPQ4pzewBcqTbxzajsTBU0kAsfXLJ8p
         UNO0tlpbr7VksF9oQ5qV5CCfIdPsbaI5MKuBWRCpRbotv4eGx0Cr6mEHIIHnacQ1MG4R
         bYorduKIb9VSam0QHQRyYEVUd3XW3N3wxNK1ByWfOd1mSRbaeYeIkt6fDEOBDoA6tEGg
         bHWy9nkVW/eD5vi4iG+9hj1xFtQY7NYK5t009swSzA3DCNeI/bR/m/m0XdKRs22W5PWI
         G1IA==
X-Gm-Message-State: AOAM532Gtkq5U9XN/E5TLw1H9xbWYZW7GWtbjW9WX1UTjBcmvALXQ9zh
	S1B8hSvkFFHuh6Jh2AJz2TQ=
X-Google-Smtp-Source: ABdhPJw39voKKffSwqBpceAiKDbV1Rgd5kVKGzEV/A5CvZiPsXSMIKxOhx3sM5EaQ4yg9t4Akr+CZw==
X-Received: by 2002:a6b:144e:: with SMTP id 75mr422228iou.39.1602698032271;
        Wed, 14 Oct 2020 10:53:52 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
        by smtp.gmail.com with ESMTPSA id v15sm67765ile.37.2020.10.14.10.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 10:53:51 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Remove Xen PVH dependency on PCI
Date: Wed, 14 Oct 2020 13:53:39 -0400
Message-Id: <20201014175342.152712-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A Xen PVH domain doesn't have a PCI bus or devices, so it doesn't need
PCI support built in.  Currently, XEN_PVH depends on XEN_PVHVM which
depends on PCI.

The first patch introduces XEN_PVHVM_GUEST as a toplevel item and
changes XEN_PVHVM to a hidden variable.  This allows XEN_PVH to depend
on XEN_PVHVM without PCI while XEN_PVHVM_GUEST depends on PCI.

The second patch moves XEN_512GB to clean up the option nesting.

Jason Andryuk (2):
  xen: Remove Xen PVH/PVHVM dependency on PCI
  xen: Kconfig: nest Xen guest options

 arch/x86/xen/Kconfig | 38 ++++++++++++++++++++++----------------
 drivers/xen/Makefile |  2 +-
 2 files changed, 23 insertions(+), 17 deletions(-)

-- 
2.26.2


