Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4F72C0811
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 14:15:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34245.65152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khBgX-00068N-Jr; Mon, 23 Nov 2020 13:15:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34245.65152; Mon, 23 Nov 2020 13:15:13 +0000
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
	id 1khBgX-00067z-Gd; Mon, 23 Nov 2020 13:15:13 +0000
Received: by outflank-mailman (input) for mailman id 34245;
 Mon, 23 Nov 2020 13:15:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khBgV-00067e-53
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:15:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a519533-cd01-4a1c-98a4-41afd169b46e;
 Mon, 23 Nov 2020 13:15:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A19B6AF16;
 Mon, 23 Nov 2020 13:15:09 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khBgV-00067e-53
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:15:11 +0000
X-Inumbo-ID: 4a519533-cd01-4a1c-98a4-41afd169b46e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4a519533-cd01-4a1c-98a4-41afd169b46e;
	Mon, 23 Nov 2020 13:15:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606137309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=STV/VFDycICb3sCl4qYDaDzw0LD/V4afIeeRpkzJDFg=;
	b=ihSX8z9trpD6NXkBPAkTnI3mf4ZpNO4txDGsE/Imf5s3WcEo9j+CvRbChyRnRLqsPlrWnc
	hWEOKLTT6q6VgbuhC+mvwDXzL6zEetW58XYpqRgXrarmoNTsTdigewmt3sOtsU50tghF/Z
	DyiJzqtng6Db2njxg91v379bazxWGFM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A19B6AF16;
	Mon, 23 Nov 2020 13:15:09 +0000 (UTC)
Subject: [PATCH v2 3/3] ns16550: drop stray "#ifdef CONFIG_HAS_PCI"
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Rahul Singh <Rahul.Singh@arm.com>
References: <96115b2b-c104-e566-2368-6a2439d2c988@suse.com>
Message-ID: <c5cf7b83-9948-dd87-dfe0-40d36df0db70@suse.com>
Date: Mon, 23 Nov 2020 14:15:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <96115b2b-c104-e566-2368-6a2439d2c988@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There's no point wrapping the function invocation when
- the function body is already suitably wrapped,
- the function itself is unconditionally available.

Reported-by: Julien Grall <julien@xen.org>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -662,9 +662,7 @@ static int __init check_existence(struct
     return 1; /* Everything is MMIO */
 #endif
 
-#ifdef CONFIG_HAS_PCI
     pci_serial_early_init(uart);
-#endif
 
     /*
      * Do a simple existence test first; if we fail this,


