Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8E6318D8E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 15:45:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83958.157241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lADCT-0004zj-Ja; Thu, 11 Feb 2021 14:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83958.157241; Thu, 11 Feb 2021 14:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lADCT-0004zK-GQ; Thu, 11 Feb 2021 14:44:09 +0000
Received: by outflank-mailman (input) for mailman id 83958;
 Thu, 11 Feb 2021 14:44:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lADCR-0004zF-TX
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 14:44:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lADCR-0005nA-P9
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 14:44:07 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lADCR-000473-NH
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 14:44:07 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lADCO-00039V-Dw; Thu, 11 Feb 2021 14:44:04 +0000
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
	bh=HSkH/Ptzv6CviWAvhuwGxWB2qevinfnBevEHYAMj8aA=; b=Lte1iNSwQ3B8zjYaru6P/6cbgz
	MrMERC9h2FUb1JV4bL7YZDWD8QEuMv1USg2JbfFEbN/JhgdXMT+xE0fZLUQkFnStUSJRL3QAZ5YjH
	FUqnU/K/3DnqiJUFertVAHJqCxlSja/wuIjQyVvJFMuZFYAYvv38duQ+X7HD8t9th+Lk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24613.17076.160988.839468@mariner.uk.xensource.com>
Date: Thu, 11 Feb 2021 14:44:04 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Jan Beulich <jbeulich@suse.com>
Subject: Re: Stable library ABI compatibility checking
In-Reply-To: <22a01569-1ea0-bb87-eda1-1450d0229cf7@citrix.com>
References: <22a01569-1ea0-bb87-eda1-1450d0229cf7@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Stable library ABI compatibility checking"):
> What I propose is tweaking the library build to write out
> lib$FOO.so.$X.$Y-$(ARCH).abi.dump files.

+1

>   A pristine set of these should be put somewhere on xenbits, and a
> task put on the release technicians checklist for future releases.

I would rather shrink that checklist than grow it.  It's too full of
crazy manual steps as-is.  When we have the relevant changes in
xen.git I will see about making a cron job.

> To make the pristine set, I need to retrofit the tooling to 4.14 and
> ideally 4.13.  This is in contravention to our normal policy of not
> backporting features, but I think, being optional build-time-only
> tooling, it is worthy of an exception considering the gains we get
> (specifically - to be able to check for ABI breakages on these branches
> in OSSTest).  Backporting to 4.12 and older is far more invasive, due to
> it being before the library build systems were common'd.

I'm comfortable with the backports assuming that code review of the
makefile changes can persuade me that there is no change to the
default behaviour.

Ian.

