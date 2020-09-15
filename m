Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C3A26A6D8
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 16:10:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIBev-00049L-G9; Tue, 15 Sep 2020 14:10:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2OlW=CY=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kIBes-00048m-QT
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 14:10:11 +0000
X-Inumbo-ID: 65b78b2c-0603-4ec2-9f3f-1bcf3b239a39
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65b78b2c-0603-4ec2-9f3f-1bcf3b239a39;
 Tue, 15 Sep 2020 14:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From; bh=8eub7ryrRDuvkRXA+jDgZFqQhOukSnlVAdyG2KExWiY=; b=Num1f4
 AoAMXHe1iCgc36YPuLKQiNAMIlnIB7F3ZNXTEyA86L5je8urNWA/IIwRMwJfrXkBANi+LxCQs5aDB
 t/iz5JLv5eZXrUQkcmwQYPE6K0Sgpw2ruTS5Fl5t5tBvhHmtYomuuBS5ZXPrpLLGuuJRrDjTxzZTj
 596okQ+ASTE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kIBer-0003nL-LC; Tue, 15 Sep 2020 14:10:09 +0000
Received: from host86-176-94-160.range86-176.btcentralplus.com
 ([86.176.94.160] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kIBer-0001rP-CF; Tue, 15 Sep 2020 14:10:09 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>
Subject: [PATCH v2 0/2] fix 'xl block-detach'
Date: Tue, 15 Sep 2020 15:10:05 +0100
Message-Id: <20200915141007.25965-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

This series makes it behave as the documentation states it should

Paul Durrant (2):
  libxl: provide a mechanism to define a device 'safe remove'
    function...
  xl: implement documented '--force' option for block-detach

 docs/man/xl.1.pod.in         |  4 ++--
 tools/libxl/libxl.h          | 33 +++++++++++++++++++++++++--------
 tools/libxl/libxl_device.c   |  9 +++++----
 tools/libxl/libxl_disk.c     |  4 +++-
 tools/libxl/libxl_domain.c   |  2 +-
 tools/libxl/libxl_internal.h | 30 +++++++++++++++++++++++-------
 tools/xl/xl_block.c          | 21 ++++++++++++++++-----
 tools/xl/xl_cmdtable.c       |  3 ++-
 8 files changed, 77 insertions(+), 29 deletions(-)

-- 
2.20.1


