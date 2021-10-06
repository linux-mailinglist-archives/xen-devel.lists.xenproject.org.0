Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5F8423C7D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 13:18:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202802.357825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY4wR-0000Hh-0v; Wed, 06 Oct 2021 11:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202802.357825; Wed, 06 Oct 2021 11:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY4wQ-0000Ek-Sq; Wed, 06 Oct 2021 11:18:30 +0000
Received: by outflank-mailman (input) for mailman id 202802;
 Wed, 06 Oct 2021 11:18:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mY4wP-0000EU-E2
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 11:18:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mY4wP-0001sM-BR
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 11:18:29 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mY4wP-0000Cg-AM
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 11:18:29 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mY4wN-0003E7-FM; Wed, 06 Oct 2021 12:18:27 +0100
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
	bh=Oh+Fc/4UGHzNC0C2oafvMPiCWQoBsDdskEOy2qOCf3o=; b=us5d2acbaLmfN3ut/QhXxu8tXm
	JcuexbQc9jGbQeCHXgAi6NQrnbhZ2bE8uz4CY+3hkcKrAS5Z0NkPsT/7jM2HRq3JSLm98zyqJ7dZy
	rOylxgCqa3E610IqiNmGLBJqUIFdbEa8gkDC8YAcyCMI+W8sVfZtdI9j93/VZFRQbUYY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24925.34307.187952.463474@mariner.uk.xensource.com>
Date: Wed, 6 Oct 2021 12:18:27 +0100
To: xen-devel@lists.xenproject.org
Cc: committers@xenproject.org
Subject: Re: Xen 4.16 development update
In-Reply-To: <24913.54299.590779.955301@mariner.uk.xensource.com>
References: <24913.54299.590779.955301@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

I wrote:
> Planned release schedule for Xen 4.16 (recap):
> 
>   Friday 24th September   PASSED        Last posting date
> 
>     Patches adding new features should be posted to the mailing list
>     by this cate, although perhaps not in their final version.
>     (3 weeks)
> 
>   Friday 15th October                   Feature freeze
>  
>     Patches adding new features should be committed by this date.
>     Straightforward bugfixes may continue to be accepted by
>     maintainers.

As previously noted, we have had a lack of review bandwidth which
means this release will be light on content.  We discussed but
rejected the possibility of extending the release (beyond Christmas,
to some time in January/February).

Under the circumstances, and considering some external constraints, I
am considering trying to *compress* the release schedule by
approximately one week.  The feature freeze data would remain the same
- we need to give people as much time to get things reviewed and into
tree as we can, but I think we can probably cut a week off the freeze.

That would look roughly like this:

>   Friday 15th October                   Feature freeze

      (2 weeks)

    Friday 29th October **tentatve**      Code freeze

      Bugfixes only, all changes to be approved by the Release Manager,
      on the basis of a (progressively stricter[*]) risk assessment.
      (2 weeks)

    Friday 12th November **tentative**    Hard code freeze [*]

      Bugfixes for serious bugs (including regressions), and low-risk
      fixes only.
      (0.5 weeks)

    Tuesday 16th November **tentative**   Branch off staging-4.16

      xen-unstable open again - with caveats to avoid release disruption.
      (1.5 weeks)

    Friday 26th November **tentative**    Final commits (docs/prep only)
    Week of 29th November **tentative**   Release
      (probably Tuesday or Wednesday)

Ian.

