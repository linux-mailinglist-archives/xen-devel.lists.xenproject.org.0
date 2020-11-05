Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D3E2A82C3
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 16:55:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19891.45373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kahbo-0005i9-K4; Thu, 05 Nov 2020 15:55:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19891.45373; Thu, 05 Nov 2020 15:55:32 +0000
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
	id 1kahbo-0005hk-Gl; Thu, 05 Nov 2020 15:55:32 +0000
Received: by outflank-mailman (input) for mailman id 19891;
 Thu, 05 Nov 2020 15:55:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N0uV=EL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kahbn-0005hf-6J
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 15:55:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34be8d1a-bfad-4516-ad4f-a210cd72ef13;
 Thu, 05 Nov 2020 15:55:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 38A9CAFD0;
 Thu,  5 Nov 2020 15:55:28 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=N0uV=EL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kahbn-0005hf-6J
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 15:55:31 +0000
X-Inumbo-ID: 34be8d1a-bfad-4516-ad4f-a210cd72ef13
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 34be8d1a-bfad-4516-ad4f-a210cd72ef13;
	Thu, 05 Nov 2020 15:55:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604591728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MYdxot3OwZOi0x0Jjwp1g2jZlQ7iqjA0dOj9aslvivg=;
	b=UetZGdAFKqhOSyq+exNQgpd8MYRvlBcVBhy8UkrYZVPkcJ7Xj63NhNA5gUGUvGLKZN0KRP
	8UI509CVPFnFZGuf7QEWmc41kPF22G85wDI7klGGocmhd45xuRIKPFmjMwfebg0Qd+nw+a
	mXIr/y7mLCjkbOzmZ4N9sXil5RJdkFc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 38A9CAFD0;
	Thu,  5 Nov 2020 15:55:28 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] gnttab: don't allocate status frame tracking array when
 "gnttab=max_ver:1"
Message-ID: <a484cc88-f41d-5d38-d098-4eda297569a1@suse.com>
Date: Thu, 5 Nov 2020 16:55:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This array can be large when many grant frames are permitted; avoid
allocating it when it's not going to be used anyway. Do so indirectly
though, by making grant_to_status_frames() return zero in this case.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -446,11 +446,14 @@ static inline void active_entry_release(
 
 static inline unsigned int grant_to_status_frames(unsigned int grant_frames)
 {
+    if ( opt_gnttab_max_version < 2 )
+        return 0;
     return DIV_ROUND_UP(grant_frames * GRANT_PER_PAGE, GRANT_STATUS_PER_PAGE);
 }
 
 static inline unsigned int status_to_grant_frames(unsigned int status_frames)
 {
+    ASSERT(opt_gnttab_max_version >= 2);
     return DIV_ROUND_UP(status_frames * GRANT_STATUS_PER_PAGE, GRANT_PER_PAGE);
 }
 

