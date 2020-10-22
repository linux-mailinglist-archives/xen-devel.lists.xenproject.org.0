Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB9E295974
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 09:42:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10201.27073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVVF6-0006Wh-PX; Thu, 22 Oct 2020 07:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10201.27073; Thu, 22 Oct 2020 07:42:36 +0000
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
	id 1kVVF6-0006Vq-Kp; Thu, 22 Oct 2020 07:42:36 +0000
Received: by outflank-mailman (input) for mailman id 10201;
 Thu, 22 Oct 2020 07:42:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dfvK=D5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kVVF4-0006JP-Ry
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 07:42:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3ad582b-766e-4735-9d13-9a084aa73deb;
 Thu, 22 Oct 2020 07:42:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3E5C2B1A3;
 Thu, 22 Oct 2020 07:42:26 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dfvK=D5=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kVVF4-0006JP-Ry
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 07:42:34 +0000
X-Inumbo-ID: c3ad582b-766e-4735-9d13-9a084aa73deb
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c3ad582b-766e-4735-9d13-9a084aa73deb;
	Thu, 22 Oct 2020 07:42:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603352546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xSsu2Z5Xpwi6tRqum0tsNqNsbAp7L8TAp9ugr1gvsVI=;
	b=atQVgRElJPObBm4D7xYVyo/SuLwtBvhCQM9dSvPAK4KyHUJGtLTLR/ibBuL5cHA1w1q9BD
	TsaPzGWVrDRKrB/bssKNhDFnxlZJ5vs6T7Z0NsBy06HFiVay+eoJpwM7REhV/VPwOYQbl7
	rhiGlLE8UurIByn89SWD+6pLMzqgBUk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3E5C2B1A3;
	Thu, 22 Oct 2020 07:42:26 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 4/5] xen/events: unmask a fifo event channel only if it was masked
Date: Thu, 22 Oct 2020 09:42:13 +0200
Message-Id: <20201022074214.21693-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201022074214.21693-1-jgross@suse.com>
References: <20201022074214.21693-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unmasking an event channel with fifo events channels being used can
require a hypercall to be made, so try to avoid that by checking
whether the event channel was really masked.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/events/events_fifo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/xen/events/events_fifo.c b/drivers/xen/events/events_fifo.c
index 243e7b6d7b96..f60c5a9ec833 100644
--- a/drivers/xen/events/events_fifo.c
+++ b/drivers/xen/events/events_fifo.c
@@ -236,6 +236,9 @@ static bool clear_masked_cond(volatile event_word_t *word)
 
 	w = *word;
 
+	if (!(w & (1 << EVTCHN_FIFO_MASKED)))
+		return true;
+
 	do {
 		if (w & (1 << EVTCHN_FIFO_PENDING))
 			return false;
-- 
2.26.2


