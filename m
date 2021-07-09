Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE2B3C2712
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 17:48:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153787.284127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1sjk-0006t1-9H; Fri, 09 Jul 2021 15:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153787.284127; Fri, 09 Jul 2021 15:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1sjk-0006qE-5M; Fri, 09 Jul 2021 15:48:20 +0000
Received: by outflank-mailman (input) for mailman id 153787;
 Fri, 09 Jul 2021 15:48:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m1sji-0006q5-D6
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 15:48:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m1sji-0003bR-AQ
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 15:48:18 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m1sji-0001Es-71
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 15:48:18 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1m1sje-0003vQ-Ib; Fri, 09 Jul 2021 16:48:14 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Subject:CC:To:Date:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=2RAimFeRdEiEA1Q05Krb6n6ep/OmQcSGnGcnN0xX9oU=; b=4KbEjJRnn5XRfR+Ur6/PRMZXEy
	S61zLlq7CxrEJLl1myrMDKMn2R+OQi2O5Wo+sLySXZgR6Njd0HbJ25fKAZZfC0YGCP13u9VQY9sJE
	4PNzGiQGbrGYjZwi0MxDVRcYW/KezKyKLDWpzf3sBJuCQTZ0Gs5AcSs1HJdDmNpXNwgE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24808.28606.387467.578829@mariner.uk.xensource.com>
Date: Fri, 9 Jul 2021 16:48:14 +0100
To: committers@xenproject.org
CC: xen-devel@lists.xenproject.org,
    Doug Goldstein <cardoe@cardoe.com>,
    Wei Liu <wl@xen.org>
Subject: gitlab merge request -> list patchbomb workflows
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

At Xen Summit we had another discussion about patch submission and
review workflows.

We agreed that it would be a nice idea to conduct another experiment
with gitlab MRs.  The previous experiment yielded negative results,
but we think we might be able to do better.

The shape of the experiment was roughly:

 * Some robot would convert a gitlab MR into a patchbomb and email
   it to the list.  (The From: line would be the MR submitter's
   gitlab profile email address.)

 * Patch review would be done in the usual way by email.  These emails
   would naturally end up in the MR submitter's mailbox.

 * We would initially conduct the experiment with internal submitters,
   and with short/simple patches.

Open questions that weren't answered at the time include:

 * How do we intend to track acked/reviewed status ?  I think
   patchwork can help with this, but if we keep the series simple
   perhaps this will be fine.

 * If a resubmission was needed, how would a v2 post be triggered ?
   I don't think we have a good answer to this.  I considered tha
   following possible ultimate possibilities:

     A. when you update the git branch after the v1 posting,
        the robot marks the MR as draft.  Repost happe ns when
        you mark the MR as ready for review

     B. the robot comments in the gitlab issue, and there is
        some @robot command to tell it to repost

   AFAICT there is no code anywhere that would do either of these.
   I suggest for now we do (B) manually with a human (probably, me)
   writing comments in the MR.

 * Who if anyone will fold acked-by/reviewed-by into commit messages

   We cannot sensibly ask someone using the gitlab MR UI to do this.
   Also avoiding this manual clerical work was one of the benefits we
   are hoping to achieve.

   I therefore suggest that we don't do this folding at all, and use
   patchwork's UI to review the status of a series.

Next steps:

I looked for a tool that would do the automatic patchbombing.  It
doesn't seem to exist.  For other reasons I now have a library that
can scan/inspect git{lab,hub} MRs.

For now I propose to write a simple tool which does the patchbomb, and
expect to run it by hand on our experimental MRs.

Comments?

Ian.

