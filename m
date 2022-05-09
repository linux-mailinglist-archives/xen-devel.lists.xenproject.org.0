Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1E652058F
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 21:56:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324789.547007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no9U8-00039Y-5u; Mon, 09 May 2022 19:56:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324789.547007; Mon, 09 May 2022 19:56:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no9U8-00036U-2c; Mon, 09 May 2022 19:56:00 +0000
Received: by outflank-mailman (input) for mailman id 324789;
 Mon, 09 May 2022 19:55:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6vu7=VR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1no9U7-00036O-1g
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 19:55:59 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0aebb477-cfd2-11ec-8fc4-03012f2f19d4;
 Mon, 09 May 2022 21:55:57 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BC8A5B81910;
 Mon,  9 May 2022 19:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A57C385B6;
 Mon,  9 May 2022 19:55:55 +0000 (UTC)
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
X-Inumbo-ID: 0aebb477-cfd2-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652126155;
	bh=QQ+jFJnnwU/YpFNYAZy9a4tFzWXxCZoOFUz0yvOs7Mw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jVReeMSfptLqD+pTxnkqIIhwHDUXMC/sJGQ424+hkAfZuvOuUnVgf7Tk6Eah4UAij
	 KbjpUcinVQaJNklFhN2LW0n5PM9THc6vSYdI2VuOiQ6d5TNNR7JM6FunxoKvuSWnPI
	 C5IRa4GlRX7hFc84CfIs0p5JIAAx+BwmycR2OEcmk2irfMMuR7M5+tkvv5BOPhksC9
	 4q+ERT/Rx7gY1QUY+Z0qrXhyzYX6d2UeVqpGw8Y6DUlX8q4ymk0xU/zflxNesyJ9zx
	 zjnoe5yycl0hQWQ21mjxq3lkr1tGeDXGAZcT739HBUIXb+uzX6k6fk4z/CqMS/IJEm
	 csDEe4BffJ9BQ==
Date: Mon, 9 May 2022 12:55:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    "julien@xen.org" <julien@xen.org>, 
    "roger.pau@citrix.com" <roger.pau@citrix.com>, 
    "george.dunlap@citrix.com" <george.dunlap@citrix.com>, 
    "Artem_Mygaiev@epam.com" <Artem_Mygaiev@epam.com>, 
    "roberto.bagnara@bugseng.com" <roberto.bagnara@bugseng.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: ECLAIR Xen x86 results and progress
In-Reply-To: <3F6B0F2E-0CF6-4C60-A803-DD8A5EAF0DFB@arm.com>
Message-ID: <alpine.DEB.2.22.394.2205091231570.43560@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205060919400.43560@ubuntu-linux-20-04-desktop> <3F6B0F2E-0CF6-4C60-A803-DD8A5EAF0DFB@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 May 2022, Bertrand Marquis wrote:
> > On 6 May 2022, at 17:31, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > Hi all,
> > 
> > Roberto kindly provided the ECLAIR x86 results:
> > 
> > https://eclairit.com:8443/job/XEN/Target=X86_64,agent=public/lastSuccessfulBuild/eclair/
> > 
> > Click on "See ECLAIR in action", then you can select "Show 100 entries"
> > and see all the results in one page. As an example MC3R1.R1.3
> > corresponds to Rule 1.3 in the spreadsheet.
> > 
> > 
> > If you are OK with this, I would like to aim at a follow-up meeting on
> > Tue May 17 at the same time (8AM California / 4PM UK). If the date/time
> > doesn't work, I'll run another Doodle poll.
> 
> Works for me.

Actually, to make sure more people are able to attend, I would like to
suggest May 19 8AM California / 4PM UK / 5PM Europe (which is the same
slot typically used by the Xen Community Call). Please let me know if
that works or if it is a problem.


> > By then, I am hoping that the group has already gone through the first
> > 20 rules in the list, up until Rule 8.10. Is that reasonable for all of
> > you?
> 
> I completed that part of the table this morning (up to 8.14), it took me 30 minutes.

Thank you! I did so as well in about the same amount of time.

I think I should provide a clarification on a couple of rules that are
not clear from the examples.


# Rule 5.4 "Macro identifiers shall be distinct"

This one is about the length of the Macro itself. C90 requires the first
31 characters to be different, while C99 requires the first 63
characteres to be different.

So the problem is the following:

#define this_macro_is_way_way_way_too_long
#define this_macro_is_way_way_way_too_loooong

I don't think we have any violations.


# Rule 8.6 " An identifier with external linkage shall have exactly one external definition"

This one is meant to catch cases where there are 2 definitions for 1
declaration:

header.h:
extern int hello;

file1.c:
int hello;

file2:
int hello;

There was a question on whether having 1 declaration with no definitions
would be OK, so only the following:

header.h:
extern int hello;

for instance because file1.c has been removed from the build due to a
kconfig. Reading MISRA, I don't think it is a violation of Rule 8.6.
Roberto please correct me if I am wrong.


Cheers,

Stefano

