Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55681295C3C
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 11:49:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10308.27398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVXDi-0004Xp-Kn; Thu, 22 Oct 2020 09:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10308.27398; Thu, 22 Oct 2020 09:49:18 +0000
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
	id 1kVXDi-0004XH-HF; Thu, 22 Oct 2020 09:49:18 +0000
Received: by outflank-mailman (input) for mailman id 10308;
 Thu, 22 Oct 2020 09:49:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dfvK=D5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kVXDg-0004UF-QW
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 09:49:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05c960fd-bc91-47e3-97bb-11cfa3823f0f;
 Thu, 22 Oct 2020 09:49:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 000A5AE2B;
 Thu, 22 Oct 2020 09:49:10 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dfvK=D5=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kVXDg-0004UF-QW
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 09:49:16 +0000
X-Inumbo-ID: 05c960fd-bc91-47e3-97bb-11cfa3823f0f
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 05c960fd-bc91-47e3-97bb-11cfa3823f0f;
	Thu, 22 Oct 2020 09:49:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603360151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YVuxwJ3hyt25tYMDo7KA9FGUbENDEaFuW9/mMP2hjWY=;
	b=XdZFpfUX5Q4edukPRqbno2sAVNX/9lStsFCY0SbUMIZdMDeuyPiBXOXTtEtl5tfur0ohB+
	v75te7c9mliV8OqxcIfKDJgE5Igkrfgo8YRH5iJ8yl5l20L8mN4rIR4CY6qW1Sv+fYvd/3
	q+PdCKHsYamkNp0VFS8CEvO750kZgLQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 000A5AE2B;
	Thu, 22 Oct 2020 09:49:10 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 4/5] xen/events: unmask a fifo event channel only if it was masked
Date: Thu, 22 Oct 2020 11:49:06 +0200
Message-Id: <20201022094907.28560-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201022094907.28560-1-jgross@suse.com>
References: <20201022094907.28560-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unmasking an event channel with fifo events channels being used can
require a hypercall to be made, so try to avoid that by checking
whether the event channel was really masked.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
V2:
- move test for already unmasked into loop (Jan Beulich)
---
 drivers/xen/events/events_fifo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/xen/events/events_fifo.c b/drivers/xen/events/events_fifo.c
index 243e7b6d7b96..b234f1766810 100644
--- a/drivers/xen/events/events_fifo.c
+++ b/drivers/xen/events/events_fifo.c
@@ -237,6 +237,9 @@ static bool clear_masked_cond(volatile event_word_t *word)
 	w = *word;
 
 	do {
+		if (!(w & (1 << EVTCHN_FIFO_MASKED)))
+			return true;
+
 		if (w & (1 << EVTCHN_FIFO_PENDING))
 			return false;
 
-- 
2.26.2


