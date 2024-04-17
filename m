Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3EB8A8618
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 16:38:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707553.1105577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx6Pn-0004xr-Kc; Wed, 17 Apr 2024 14:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707553.1105577; Wed, 17 Apr 2024 14:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx6Pn-0004wB-HS; Wed, 17 Apr 2024 14:37:35 +0000
Received: by outflank-mailman (input) for mailman id 707553;
 Wed, 17 Apr 2024 14:37:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNGY=LW=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rx6Pl-0004w5-Jm
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 14:37:33 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0471b6b7-fcc8-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 16:37:30 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1713364644831580.568075550855;
 Wed, 17 Apr 2024 07:37:24 -0700 (PDT)
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
X-Inumbo-ID: 0471b6b7-fcc8-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; t=1713364646; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WqD+dNN7rxzjSMA9/bHq1K3WapfKlMpfPv2js4TnnP6KWGDzIad2iIJBE25ABGgPRmMwI2PZ2jNrDbdUDSt3PGNNCVZlQgHxa6EI+kPZ7z4GI3NzTVpk2+kRHZl4CmnMW7rHSBGEirVtxdKueDFKWhVkkbOEAXbt7pRHDsB6Uyo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1713364646; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=isDImK+xjqFzHXUtxh7Tjizo+scqnKrEO7sLVU22BRg=; 
	b=JT1am32JB/ZS+Ozkj3QiVXuq5U1sqENuLCQ3d5ZyXt8d0XYaw1AdwI+bYeW96SOUGMjS0kgx5PQcUZdSC1mmYeq1/jJ2yxdtpMb+RuPXrp9G3e45aChztAPmZt4vITnziPZUCKZ1/FE3ittvrEpjPKbUIOEo0QldY8WqxjoTH9U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1713364646;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=isDImK+xjqFzHXUtxh7Tjizo+scqnKrEO7sLVU22BRg=;
	b=gr+KwnsZOomzS3qBmus4kaU9nE+ASbtEkSIR0u4b5rDC5EoE7Xt/darRLQzDiMX+
	VGKr116VtHhYulXMI09WaScyP3JMUAGimNt4GwVnjfpvObSkcI3biB55IHGVi/QcHxr
	VB1h786rOLG2nHcCAsimMDQAh+8//2ABYxrG8Q6A=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/6]  Clean up of gzip decompressor
Date: Wed, 17 Apr 2024 10:37:10 -0400
Message-Id: <20240417143716.27189-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

An issue ran into by hyperlaunch was the need to use the gzip decompressor
multiple times. The current implementation fails when reused due to tainting of
decompressor state from a previous usage. This series seeks to colocate the
gzip unit files under a single directory similar to the other decompression
algorithms.  To enable the refactoring of the state tracking, the code is then
cleaned up in line with Xen coding style.

Changes in v2:
- patch "xen/gzip: Colocate gunzip code files" was merged
- dropped ifdef chunks that are never enabled
- addressed formatting changes missed in v1
- replaced custom memory allocator with xalloc_bytes()
- renamed gzip_data to gzip_state
- moved gzip_state to being dynamically allocated
- changed crc table to the explicit size of uint32_t 
- instead of moving huffman tracking into state, dropped altogether

Daniel P. Smith (6):
  gzip: drop unused define checks
  gzip: clean up comments and fix code alignment
  gzip: remove custom memory allocator
  gzip: refactor state tracking
  gzip: move crc state into consilidated gzip state
  gzip: drop huffman code table tracking

 xen/common/gzip/gunzip.c  |  87 ++--
 xen/common/gzip/inflate.c | 974 ++++++++++++++++++--------------------
 2 files changed, 501 insertions(+), 560 deletions(-)

-- 
2.30.2


