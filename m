Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 549FB32528B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 16:39:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89834.169612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFIjJ-0008D2-0V; Thu, 25 Feb 2021 15:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89834.169612; Thu, 25 Feb 2021 15:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFIjI-0008Cd-T8; Thu, 25 Feb 2021 15:39:04 +0000
Received: by outflank-mailman (input) for mailman id 89834;
 Thu, 25 Feb 2021 15:39:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qWJX=H3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFIjH-0008CY-6O
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 15:39:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 914c8315-89fc-43ad-b121-3e50c5700f24;
 Thu, 25 Feb 2021 15:39:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 20A1BB10B;
 Thu, 25 Feb 2021 15:39:01 +0000 (UTC)
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
X-Inumbo-ID: 914c8315-89fc-43ad-b121-3e50c5700f24
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614267541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NFd034RDEJYXcq9r3tELC5CypWrYDcd0d0knOZGlyxM=;
	b=XgbQ5MYSf2y5OQAreaPj8wbV/1arB81ci6OiZNQSw0iecmcn9PeJAz3pxsL+lARSo7YFil
	FFLJYih+iUjnSrwCloncsniCXHAee0dIo8SgjzscYwdffwufiCiPBmbI5y8vuQWuYLhWUl
	+WdMBDaNIfKT8sciziRQSdpj+YQekDk=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xen-netback: use local var in xenvif_tx_check_gop() instead
 of re-calculating
To: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Message-ID: <6604dec2-4460-3339-f797-e5f8a7df848f@suse.com>
Date: Thu, 25 Feb 2021 16:39:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

shinfo already holds the result of skb_shinfo(skb) at this point - no
need to re-invoke the construct even twice.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/drivers/net/xen-netback/netback.c
+++ b/drivers/net/xen-netback/netback.c
@@ -557,8 +557,8 @@ check_frags:
 	}
 
 	if (skb_has_frag_list(skb) && !first_shinfo) {
-		first_shinfo = skb_shinfo(skb);
-		shinfo = skb_shinfo(skb_shinfo(skb)->frag_list);
+		first_shinfo = shinfo;
+		shinfo = skb_shinfo(shinfo->frag_list);
 		nr_frags = shinfo->nr_frags;
 
 		goto check_frags;

