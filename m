Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3028A1892
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 17:25:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703998.1100075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruwJ1-0001rg-Cl; Thu, 11 Apr 2024 15:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703998.1100075; Thu, 11 Apr 2024 15:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruwJ1-0001pP-94; Thu, 11 Apr 2024 15:25:39 +0000
Received: by outflank-mailman (input) for mailman id 703998;
 Thu, 11 Apr 2024 15:25:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jyOp=LQ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ruwIz-0001Lt-Rl
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 15:25:37 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd8e272b-f817-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 17:25:35 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1712849127754598.9550868019217;
 Thu, 11 Apr 2024 08:25:27 -0700 (PDT)
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
X-Inumbo-ID: bd8e272b-f817-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; t=1712849130; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fnzqQ2LoEx1ehz8bNykrsmhdsNIa7uAg6qZQx8nEtEAuDkwydu+wEh5FGmch8D6pP+8R0ZfQgC/Rf6p39MoHm3EI2AxnfM+hTbaVbl0OPT9Ufx1iSq0DKaFgIY05W6GfKYpwKvjMz9fwXEJbRIWFUZDVVuJKcbCZ8+VZI3gaokM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1712849130; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VWwVf1+eBCnfe5TG053/5wkNSqTRJgj9CDOPhhAc5gw=; 
	b=aC3BQdEypK4FVlvbeY+TrjF/XZhaoZI0z6Hy5Z8h5HfUKfVqYsyQizp+6e3rZHAVlFNiuSm+ofySLa8R/T2C7mj3iz60Vid8Dm71Kl3M6Bu1raucQ6IwyiWXTXdXTeO1SdofDokrxgfY5eIoQd+JQdmxwPzApMuHXjbLUHby5Nw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1712849130;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=VWwVf1+eBCnfe5TG053/5wkNSqTRJgj9CDOPhhAc5gw=;
	b=BlYVLKf+jkUEfadEBDdjNXLcDbfYJC2V5GKfP1wys60+X+5rmqHkNKzq976S7z79
	2mbF6Bz3OZIwa/U7ziMFwq/J701HejKx+Egtv2J+u3ulH2aLOy6tyTVaW3bsVGFeiEy
	sXxkge/HdL/flcG4fEPHrQphO6d8WaU1afyg0XMs=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/5] Clean up of gzip decompressor
Date: Thu, 11 Apr 2024 11:25:13 -0400
Message-Id: <20240411152518.2995-1-dpsmith@apertussolutions.com>
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

Daniel P. Smith (5):
  gzip: colocate gunzip code files
  gzip: clean up comments and fix code alignment
  gzip: refactor state tracking
  gzip: move crc state into consilidated gzip state
  gzip: move huffman code table tracking into gzip state

 xen/common/Makefile             |   2 +-
 xen/common/gzip/Makefile        |   1 +
 xen/common/{ => gzip}/gunzip.c  |  73 ++-
 xen/common/{ => gzip}/inflate.c | 912 ++++++++++++++++----------------
 4 files changed, 504 insertions(+), 484 deletions(-)
 create mode 100644 xen/common/gzip/Makefile
 rename xen/common/{ => gzip}/gunzip.c (64%)
 rename xen/common/{ => gzip}/inflate.c (57%)

-- 
2.30.2


