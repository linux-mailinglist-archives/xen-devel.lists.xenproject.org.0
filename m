Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BCB360B52
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 16:03:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111195.212633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX2aw-0004rb-Kv; Thu, 15 Apr 2021 14:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111195.212633; Thu, 15 Apr 2021 14:03:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX2aw-0004rD-HT; Thu, 15 Apr 2021 14:03:46 +0000
Received: by outflank-mailman (input) for mailman id 111195;
 Thu, 15 Apr 2021 14:03:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DGSX=JM=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1lX2av-0004r0-Kz
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 14:03:45 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1cb40a3b-6727-4ad1-bb69-744614a44f0d;
 Thu, 15 Apr 2021 14:03:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2902261153;
 Thu, 15 Apr 2021 14:03:44 +0000 (UTC)
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
X-Inumbo-ID: 1cb40a3b-6727-4ad1-bb69-744614a44f0d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618495424;
	bh=qYgds9DkMKnk9aiJ+ZaUFK/fxoVRJ+jGB3McwoldzKE=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=h0IaIMNGbgEr3p1Gm048RchdIWCemZ42yteCgU4aLmWVTnV0NSUp408DEgjQd8kke
	 uxpDFVC9PPfiIyF8UlJJZ2weH8cn9qoESSXYichnbYNAHhJOCYqsLNVrgDKz5Q+F/4
	 YxtSQWsG4zwrRHUEXfCuJjryeFu3gBXaFqIQUQqo=
Subject: Patch "xen/events: fix setting irq affinity" has been added to the 4.9-stable tree
To: boris.ostrovsky@oracle.com,gregkh@linuxfoundation.org,jgross@suse.com,sstabellini@kernel.org,xen-devel@lists.xenproject.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 15 Apr 2021 16:03:34 +0200
In-Reply-To: <20210412062845.13946-1-jgross@suse.com>
Message-ID: <161849541422621@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    xen/events: fix setting irq affinity

to the 4.9-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     xen-events-fix-setting-irq-affinity.patch
and it can be found in the queue-4.9 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From jgross@suse.com  Thu Apr 15 15:56:08 2021
From: Juergen Gross <jgross@suse.com>
Date: Mon, 12 Apr 2021 08:28:45 +0200
Subject: xen/events: fix setting irq affinity
To: stable@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <20210412062845.13946-1-jgross@suse.com>

From: Juergen Gross <jgross@suse.com>

The backport of upstream patch 25da4618af240fbec61 ("xen/events: don't
unmask an event channel when an eoi is pending") introduced a
regression for stable kernels 5.10 and older: setting IRQ affinity for
IRQs related to interdomain events would no longer work, as moving the
IRQ to its new cpu was not included in the irq_ack callback for those
events.

Fix that by adding the needed call.

Note that kernels 5.11 and later don't need the explicit moving of the
IRQ to the target cpu in the irq_ack callback, due to a rework of the
affinity setting in kernel 5.11.

Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/xen/events/events_base.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -1780,7 +1780,7 @@ static void lateeoi_ack_dynirq(struct ir
 
 	if (VALID_EVTCHN(evtchn)) {
 		do_mask(info, EVT_MASK_REASON_EOI_PENDING);
-		event_handler_exit(info);
+		ack_dynirq(data);
 	}
 }
 
@@ -1791,7 +1791,7 @@ static void lateeoi_mask_ack_dynirq(stru
 
 	if (VALID_EVTCHN(evtchn)) {
 		do_mask(info, EVT_MASK_REASON_EXPLICIT);
-		event_handler_exit(info);
+		ack_dynirq(data);
 	}
 }
 


Patches currently in stable-queue which might be from jgross@suse.com are

queue-4.9/xen-events-fix-setting-irq-affinity.patch

