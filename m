Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9AE3FC5A5
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 12:29:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175607.319845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL10u-0007vy-O1; Tue, 31 Aug 2021 10:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175607.319845; Tue, 31 Aug 2021 10:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL10u-0007t0-K9; Tue, 31 Aug 2021 10:29:08 +0000
Received: by outflank-mailman (input) for mailman id 175607;
 Tue, 31 Aug 2021 10:29:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mL10s-0007su-NW
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 10:29:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mL10s-0003Qk-Kb
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 10:29:06 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mL10s-0007yP-JQ
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 10:29:06 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mL10n-0004yj-LN; Tue, 31 Aug 2021 11:29:01 +0100
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
	bh=37UsOb1XHoPxYG9ArdJjELr2xXmueuwsjfJ3tYrYWlI=; b=pLg/kmYmvZQ0n69eBHuh3CpbSw
	f/Ybqaote7sqN6/20YVZFQfJgChm18d9x2himTFcZ3GyDIQwlYo5E6+fuHllJ6us6pIJkHXqCmT7C
	KIF59mzorVXXAH1R2DN5OIjMYPLjgal6Gnkca2IvZXWBHgLwljH1AU3yHVlehU242sVs=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24878.1133.402035.705283@mariner.uk.xensource.com>
Date: Tue, 31 Aug 2021 11:29:01 +0100
To: Jan Beulich <jbeulich@suse.com>
CC: security@xenproject.org,
    xen-devel@lists.xenproject.org
Subject: 4.13..4.15 testing suspended pending XSA-378 fixes
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

I had the following irc conversation with Jan.  I wanted to make a record
(in particular, to refer to from the stop files in osstest):

09:36 <jbeulich> Diziet: To give osstest some relief, and to also have fixes 
                 for the XSA-378 fallout have a faster path to an eventual push 
                 (provided they get reviewed / agreed upon), could you please
09:37 <jbeulich> - put the OVMF backport also on 4.11 (which ought to allow 
                 that branch to get a push)
09:37 <jbeulich> - suspend testing on 4.13-4.15 for the time being?
10:46 <@Diziet> jbeulich: I pushed the ovmf fix.  Let me look at the current 
                flights
10:50 <@Diziet> Your point about the XSA fallout fixes is that you would like 
                to have osstest testing putative fixes promptly ?
11:01 <jbeulich> Yes. With all the other branches also getting continuously 
                 tested, the latency for unstable flights to complete is quite 
                 high.
11:02 <jbeulich> And an initial set of fixes has been posted.
11:27 <@Diziet> Done.  I've cancelled one not-yet-started but doomed 4.14 
                flight too

