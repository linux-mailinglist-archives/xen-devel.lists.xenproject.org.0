Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 287A92C4173
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 14:57:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37797.70318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khvI1-0001Fg-2h; Wed, 25 Nov 2020 13:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37797.70318; Wed, 25 Nov 2020 13:56:57 +0000
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
	id 1khvI0-0001FH-Vb; Wed, 25 Nov 2020 13:56:56 +0000
Received: by outflank-mailman (input) for mailman id 37797;
 Wed, 25 Nov 2020 13:56:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1khvHz-0001FC-Bn
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 13:56:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1khvHy-0008TS-Gh
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 13:56:54 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1khvHy-0002UR-Fk
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 13:56:54 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1khvHw-0001JZ-MT; Wed, 25 Nov 2020 13:56:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <iwj@xenproject.org>)
	id 1khvHz-0001FC-Bn
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 13:56:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Subject:References:In-Reply-To:CC:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=BIqso6EQUrm2U0mBVjcvavC/rZFxt/cV7qMCIT3KhzQ=; b=xL4EmwVS/0+UAXVSpPRNqrknkf
	zwwjf6vUwzp6+3g+9A+IRwvmGBAEYQ/Phl+PebmprjVFKIiIyI9BBIEEbGlOxQftjVEFG7huTsFyk
	IlMsiTgiP6rKiVcZQwRznns+dmOL8RgMC6VFqIWog4TKeuIUbf0wNGC37ty8Mzuo9WyU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <iwj@xenproject.org>)
	id 1khvHy-0008TS-Gh
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 13:56:54 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <iwj@xenproject.org>)
	id 1khvHy-0002UR-Fk
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 13:56:54 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
	(envelope-from <iwj@xenproject.org>)
	id 1khvHw-0001JZ-MT; Wed, 25 Nov 2020 13:56:52 +0000
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24510.25252.447028.364012@mariner.uk.xensource.com>
Date: Wed, 25 Nov 2020 13:56:52 +0000
To: xen-devel@lists.xenproject.org
CC: committers@xenproject.org,
    George Dunlap <George.Dunlap@citrix.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
    Paul Durrant <xadimgnik@gmail.com>,
    Wei Liu <wl@xen.org>
In-Reply-To: <24510.24778.433048.477008@mariner.uk.xensource.com>
References: <24510.24778.433048.477008@mariner.uk.xensource.com>
Subject: Xen 4.15: Proposed release schedule

(resending because the first one had corrupted email headers;
 please reply to this one and not the previous one)

Hi.  I've done a little bit of consultation with previous release
managers, and reviewed various list archives and calendars.  These
consultations seemed to suggest some folklore that wasn't captured in
our process doc - hence the proposed patch, below.

I would like to tentatively propose the following schedule and
policies for Xen 4.15.

If you have opinions, please comment as soon as you can so that we can
have an open dialogue.  Comments must be submitted at the very latest
by 1700 UTC on Wednesday the 2nd of December.

Having never done this before, I am particularly interested in
comments from previous release managers.

** DRAFT **

  Friday 8th January    Last posting date

    Patches adding new features should be posted to the mailing list
    by this cate, although perhaps not in their final version.

  Friday 22nd January   Feature freeze
 
    Patches adding new features should be committed by this date.
    Straightforward bugfixes may continue to be accepted by
    maintainers.

  Friday 12th February **tentatve**   Code freeze

    Bugfixes only, all changes to be approved by the Release Manager.

  Week of 12th March **tentative**   Release
    (probably Tuesday or Wednesday)

Any patches containing substantial refactoring are to treated as
new features, even if they intent is to fix bugs.

Freeze exceptions will not be routine, but may be granted in
exceptional cases for small changes on the basis of risk assessment.
Large series will not get exceptions.  Contributors *must not* rely on
getting, or expect, a freeze exception.

Chinese New Year falls around the 11th-19th of February this year.  In
my plan above, that falls within the hard code freeze period.  If we
don't manage to get the tree to an acceptable quality level by the
tentative codefreeze and release dates above, these dates will slip.

I have not yet started tracking "big ticket" items, and bugs.  I
expect to start doing that starting after Christmas.  NB the primary
responsibility for driving a feature's progress to meet the release
schedule, lies with the feature's proponents.

If as a feature proponent you feel your feature is at risk and there
is something the Xen Project could do to help, please consult me or
the Community Manager.  In such situations please reach out earlier
rather than later.

** END OF DRAFT **

Thanks,
Ian.

>From b34f4ddace0b8d76d8c340a46288a2db79c99460 Mon Sep 17 00:00:00 2001
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Date: Wed, 25 Nov 2020 13:22:08 +0000
Subject: [PATCH] xen-release-management doc: More info on schedule
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This documents our practice, established in 2018
  https://lists.xen.org/archives/html/xen-devel/2018-07/msg02240.html
et seq

CC: Jürgen Groß <jgross@suse.com>
CC: Paul Durrant <xadimgnik@gmail.com>
CC: Wei Liu <wl@xen.org>
Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 docs/process/xen-release-management.pandoc | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/docs/process/xen-release-management.pandoc b/docs/process/xen-release-management.pandoc
index e1aa1eda8f..a5d70fed67 100644
--- a/docs/process/xen-release-management.pandoc
+++ b/docs/process/xen-release-management.pandoc
@@ -15,8 +15,10 @@ that they can have an idea what to expect from the Release Manager.
 
 # Xen release cycle
 
-The Xen hypervisor project now releases every 8 months. The actual release date
-depends on a lot of factors.
+The Xen hypervisor project now releases every 8 months.  We aim to
+release in the first half of March/July/November.  These dates have
+been chosen to avoid major holidays and cultural events; if one
+release slips, ideally the previous release cycle would be shortened.
 
 We can roughly divide one release into two periods. The development period
 and the freeze period. The former is 6 months long and the latter is about 2
@@ -33,6 +35,12 @@ During freeze period, the tree is closed for new features. Only bug fixes are
 accepted. This period can be shorter or longer than 2 months. If it ends up
 longer than 2 months, it eats into the next development period.
 
+The precise release schedule depends on a lot of factors and needs to
+be set afresh by the Release Manager in each release cycle.  When the
+release is in March, particular consideration should be given to the
+Chinese New Year holidaty which will then typically occur curing the
+freeze, so the freeze should probably be extended to compensate.
+
 # The different roles in a Xen release
 
 ## Release Manager
-- 
2.20.1


