Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AB955B98E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 14:38:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356570.584796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5nza-00074i-1L; Mon, 27 Jun 2022 12:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356570.584796; Mon, 27 Jun 2022 12:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5nzZ-0006xi-U2; Mon, 27 Jun 2022 12:37:25 +0000
Received: by outflank-mailman (input) for mailman id 356570;
 Mon, 27 Jun 2022 12:37:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o5nzY-0006uV-JV
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 12:37:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o5nzY-0002wl-Gr; Mon, 27 Jun 2022 12:37:24 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o5nzY-0007Ql-8U; Mon, 27 Jun 2022 12:37:24 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=w7gSoXXb34865U21Be1Dz8VUMwYroXFPxp1CGLJXARQ=; b=tEEu3IRfqsl4LeTJgPhUjaaFHy
	57AeI0XGFwjlSBXt8yplYdBLiTcvQt0ogJYRrH84tPd+Z2re7iCsbEpQ7zDwjGM/64MS5sy7PcKgj
	tgSiaZ2uA723Xz2JuutsAm5Br4ztvi9Xt8Ie495kpfqmPtQAYc8FnmeoS8N/QkPQHYow=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	Julien Grall <jgrall@amazon.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 1/2] public/io: xs_wire: Document that EINVAL should always be first in xsd_errors
Date: Mon, 27 Jun 2022 13:36:34 +0100
Message-Id: <20220627123635.3416-2-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220627123635.3416-1-julien@xen.org>
References: <20220627123635.3416-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Some tools (e.g. xenstored) always expect EINVAL to be first in xsd_errors.

Document it so, one doesn't add a new entry before hand by mistake.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----

I have tried to add a BUILD_BUG_ON() but GCC complained that the value
was not a constant. I couldn't figure out a way to make GCC happy.

Changes in v2:
    - New patch
---
 xen/include/public/io/xs_wire.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/include/public/io/xs_wire.h b/xen/include/public/io/xs_wire.h
index c1ec7c73e3b1..dd4c9c9b972d 100644
--- a/xen/include/public/io/xs_wire.h
+++ b/xen/include/public/io/xs_wire.h
@@ -76,6 +76,7 @@ static struct xsd_errors xsd_errors[]
 __attribute__((unused))
 #endif
     = {
+    /* /!\ Some users (e.g. xenstored) expect EINVAL to be the first entry. */
     XSD_ERROR(EINVAL),
     XSD_ERROR(EACCES),
     XSD_ERROR(EEXIST),
-- 
2.32.0


