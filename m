Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D02508B0FEB
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 18:35:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711538.1111557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzfa0-0003dC-5l; Wed, 24 Apr 2024 16:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711538.1111557; Wed, 24 Apr 2024 16:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzfa0-0003bX-2w; Wed, 24 Apr 2024 16:34:44 +0000
Received: by outflank-mailman (input) for mailman id 711538;
 Wed, 24 Apr 2024 16:34:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uOBX=L5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rzfZx-0003bR-VY
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 16:34:42 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a5de96e-0258-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 18:34:39 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1713976472126342.6328747529942;
 Wed, 24 Apr 2024 09:34:32 -0700 (PDT)
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
X-Inumbo-ID: 8a5de96e-0258-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; t=1713976473; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eNsob4rW0SfZeFFTrSle+feUY831NvO2dFcissAnEKYVio7SEWNN24q+KKofb4Z+xC4YwRGaJ31gKCroCBoei3vyZsjZCuKAEAUDXeC9hHbJkTScxFZYvoKdrEoOYmNUgfm4s/UcTXCl9pT1rE7QtV2iW1Dn+AJ3A582mCvGZsE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1713976473; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mGke6Axzj9j0KUa0Xd8sbOsXw2gsdueKvQSyoMxUjz8=; 
	b=gg6JBNN5l2ODVDjvkaIOMK3WUFJfrbK7rPq01KQnn5hr2q6jkMHxUoQHb1O0IK303+WEmrHnpdfEDgjZJ5nLwvxcMnPsXSgM6eVCcG2b3c+A2lsCLLns3vBKHgeX0DMdV7KHOru+NBITNo+j6GkS0m62kLQy2KF+KKwiOCyav98=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1713976473;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=mGke6Axzj9j0KUa0Xd8sbOsXw2gsdueKvQSyoMxUjz8=;
	b=vD9neVuwcngr8Tgpb7OMVH2p6eva/eKpNH/RhA9cWWzKSECzh1naMkNtKSv/NWQy
	rHnuyMLrwyYB5BLbuN8JLgJDYGShl2egr/kmI+VojzUHYG1FIglTvPDGzZl96IFFOPs
	Db3L9Uxa41oHnLeBqrQm1tQMfk8rznqz5QNkh6rA=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 0/8] Clean up of gzip decompressor
Date: Wed, 24 Apr 2024 12:34:14 -0400
Message-Id: <20240424163422.23276-1-dpsmith@apertussolutions.com>
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

Changes in v3:
- patch "xen/gzip: Drop huffman code table tracking" was merged
- patch "xen/gzip: Remove custom memory allocator" was merged
- patch "xen/gzip: Drop unused define checks" was merged
- move of the decompressor state into struct was broken up to ease review
- expanded macros that were either only used once or obsfucated the logic
- adjusted variable types as needed to be more appropriate for their usage

Changes in v2:
- patch "xen/gzip: Colocate gunzip code files" was merged
- dropped ifdef chunks that are never enabled
- addressed formatting changes missed in v1
- replaced custom memory allocator with xalloc_bytes()
- renamed gzip_data to gzip_state
- moved gzip_state to being dynamically allocated
- changed crc table to the explicit size of uint32_t 
- instead of moving huffman tracking into state, dropped altogether


Daniel P. Smith (8):
  gzip: clean up comments and fix code alignment
  gzip: refactor and expand macros
  gzip: refactor the gunzip window into common state
  gzip: move window pointer into gunzip state
  gzip: move input buffer handling into gunzip state
  gzip: move output buffer into gunzip state
  gzip: move bitbuffer into gunzip state
  gzip: move crc state into gunzip state

 xen/common/gzip/gunzip.c  |  84 ++--
 xen/common/gzip/inflate.c | 948 +++++++++++++++++++-------------------
 2 files changed, 516 insertions(+), 516 deletions(-)

-- 
2.30.2


