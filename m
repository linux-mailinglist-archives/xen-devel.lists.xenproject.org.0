Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D51F345FC9
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 14:37:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100693.192012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOhDb-00070y-Fb; Tue, 23 Mar 2021 13:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100693.192012; Tue, 23 Mar 2021 13:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOhDb-00070Y-Bb; Tue, 23 Mar 2021 13:37:11 +0000
Received: by outflank-mailman (input) for mailman id 100693;
 Tue, 23 Mar 2021 13:37:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOhDZ-00070M-MZ
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 13:37:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOhDZ-0007Fb-KY
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 13:37:09 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOhDZ-0001xy-IB
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 13:37:09 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lOhDU-00027d-VK; Tue, 23 Mar 2021 13:37:04 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=5wg9s2wOhu6IIp6KgyIMxJ/OPzSPZgHZv+ZPEXrYQFA=; b=IfEzEUnTfzp1yz8O4jDmyXn0br
	FZn05loBYZEEBl68EFHTDfda63byKmJRrqWw4N254OP9rOA8+ArSF8xGam0QZToKprxtDzVgAWGG2
	TKsO5TX9O85dl4QcjJ1Y128k5H1yftkslIkctmZ74wrkB4o78eOI0JqkiZH6MQ6A09l8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24665.61184.783407.462294@mariner.uk.xensource.com>
Date: Tue, 23 Mar 2021 13:37:04 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "Tian\, Kevin" <kevin.tian@intel.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 0/4][4.15?] VT-d: mostly S3 related corrections
In-Reply-To: <35150558-6a4a-d6bb-b51a-4e2bf37e5ae5@suse.com>
References: <c19fe2b5-b682-374c-d30f-83fb8b367286@suse.com>
	<MWHPR11MB1886A8DBD8B93A612A1B09958C649@MWHPR11MB1886.namprd11.prod.outlook.com>
	<35150558-6a4a-d6bb-b51a-4e2bf37e5ae5@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH 0/4][4.15?] VT-d: mostly S3 related corrections"):
> Thanks Kevin. Ian - what are your thoughts here towards 4.15?

I looked at these four patches.

In general I am not sure of the implications.  There are two important
sets of implications: (i) upside: what is the bug this fixes and how
severe is that bug *in its actual impact on users of Xen* (ii) what
possible problems might there be and how have we made sure that the
patch is right ?

I want look at this not from the point of view of technical details
but in terms of user impact.  User impact is harder to predict but it
is what we actually care about.

For one of the patches it seemed obvious to me that there was very
little downside risk and the upside is not corrupting something
(perhaps something important).

For the others, all I could see, besides the general statement that
these aren't regressions, there was a lot of intensive discussion in
the commit messages of the specific technical details.  Frankly, that
all went quite over my head.

I would be prepared to give a release ack for the others if I can be
convinced of satisfactory answers to my questions (i) and (ii).  For
an idea of what kind of answer I'm looking for, see the kind of thing
Roger has been putting in his 4.15-targeted patches.  The more complex
and to-me-impenetrable the underlying technical details the more
sceptical I will be :-).

I hope that makes sense.

Thanks,
Ian.

