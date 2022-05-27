Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA80535A44
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 09:24:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337814.562528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuUKp-0003xi-2u; Fri, 27 May 2022 07:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337814.562528; Fri, 27 May 2022 07:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuUKo-0003nC-VE; Fri, 27 May 2022 07:24:34 +0000
Received: by outflank-mailman (input) for mailman id 337814;
 Fri, 27 May 2022 07:24:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTKn=WD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nuUKn-0003UV-TP
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 07:24:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c4e4fb1-dd8e-11ec-bd2c-47488cf2e6aa;
 Fri, 27 May 2022 09:24:30 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 216D721A82;
 Fri, 27 May 2022 07:24:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DD257139C4;
 Fri, 27 May 2022 07:24:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ONqkNK18kGJLIgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 27 May 2022 07:24:29 +0000
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
X-Inumbo-ID: 0c4e4fb1-dd8e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1653636270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k6QNfdHoQpClTtcFyNorgKp8JNEjHOV3+KrUm17Tu6g=;
	b=D9GSqwx0VyC/4JZtvww3XF3dFTWmEL6cxsGI9xzMNMYJ0t2qpehEw9/csEaWr7S/ow79XU
	NGGsgFWUlz/CQyQlZZqQj99aH9vKSkcqtYgnnTmNTrWSwshJScV8ZDCYugq/Abt9EuIcBr
	rf56Sb2c4Jm/jP9Xe/uuCL06NVJ8Kmk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/4] tools/xenstore: modify feature bit specification in xenstore-ring.txt
Date: Fri, 27 May 2022 09:24:24 +0200
Message-Id: <20220527072427.20327-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220527072427.20327-1-jgross@suse.com>
References: <20220527072427.20327-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of specifying the feature bits in xenstore-ring.txt as a mask
value use bit numbers. This will make the specification easier to read
when adding more features.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch (triggered by Julien Grall)
---
 docs/misc/xenstore-ring.txt | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/docs/misc/xenstore-ring.txt b/docs/misc/xenstore-ring.txt
index f3d6ca4264..2792d13530 100644
--- a/docs/misc/xenstore-ring.txt
+++ b/docs/misc/xenstore-ring.txt
@@ -62,12 +62,13 @@ the server feature bitmap. The server features are offered to the guest;
 it is up to the guest whether to use them or not. The guest should ignore
 any unknown feature bits.
 
-The following features are defined:
+The following features are defined (bit number 0 is equivalent to a mask
+value of 1):
 
-Mask    Description
+Bit     Description
 -----------------------------------------------------------------
-1       Ring reconnection (see the ring reconnection feature below)
-2       Connection error indicator (see connection error feature below)
+0       Ring reconnection (see the ring reconnection feature below)
+1       Connection error indicator (see connection error feature below)
 
 The "Connection state" field is used to request a ring close and reconnect.
 The "Connection state" field only contains valid data if the server has
-- 
2.35.3


