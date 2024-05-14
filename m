Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A838C4A59
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 02:10:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721095.1124234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6fjM-0007Ef-2o; Tue, 14 May 2024 00:09:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721095.1124234; Tue, 14 May 2024 00:09:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6fjL-0007D9-WD; Tue, 14 May 2024 00:09:20 +0000
Received: by outflank-mailman (input) for mailman id 721095;
 Tue, 14 May 2024 00:09:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o5lq=MR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s6fjJ-0007D1-Oy
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 00:09:17 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31d0078e-1186-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 02:09:15 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 492A0CE0D8B;
 Tue, 14 May 2024 00:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D52C113CC;
 Tue, 14 May 2024 00:09:07 +0000 (UTC)
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
X-Inumbo-ID: 31d0078e-1186-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715645349;
	bh=GWvmPigmSaXMoOQcMreKkRqhCcCxEac0yoFGbdxfUfM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UtBZ7Y9/pJZiybBO2iqLxZlvvLDeyBhC+kLneBUDClP+tK6j6LAGOJLTrNIJo6TWR
	 LcdT557aktQvQ3WTmOhn9xcFbdaCrJJr8/YHkGT63FN6Ghg+Y/eu1N1owIcpMy7lWv
	 bL+mNi8oTqWa1UNdbYsVxWcm537Mb+IETcz0UlAWEIwC61/V/XUxzIWUfaPd15tqAu
	 k/xn/d14TX/sldHco+ceEAWqFnZ589q6iABuam1uMXz6ACd4CB5ducrPOp5I9GLWNd
	 0h2V2kpZcHtsTCnC84vYUjnCcxLhNAqfpjUj8hLm1unDHIzlIVCfmsc/bX9nWvZtdS
	 06prqIm1xCsOQ==
Date: Mon, 13 May 2024 17:09:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, roger.pau@citrix.com, 
    bertrand.marquis@arm.com, michal.orzel@amd.com
Subject: Re: [PATCH] fix Rule 10.2 violation
In-Reply-To: <0625f4f2-daaa-4867-8c39-f8e9ce939ca0@xen.org>
Message-ID: <alpine.DEB.2.22.394.2405131706450.2544314@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405101634500.2544314@ubuntu-linux-20-04-desktop> <0625f4f2-daaa-4867-8c39-f8e9ce939ca0@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 May 2024, Julien Grall wrote:
> Hi Stefano,
> 
> title: Is this the only violation we have in Xen? If so, then please add the
> subsystem in the title.

The only remaining violations are about the use of the "toupper" macro.
Bugseng is recommending to add a cast to fix those or deviate toupper.


> On 11/05/2024 00:37, Stefano Stabellini wrote:
> > Change opt_conswitch to char to fix a violation of Rule 10.2.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > index 2c363d9c1d..3a3a97bcbe 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -49,7 +49,7 @@ string_param("console", opt_console);
> >   /* Char 1: CTRL+<char1> is used to switch console input between Xen and
> > DOM0 */
> >   /* Char 2: If this character is 'x', then do not auto-switch to DOM0 when
> > it */
> >   /*         boots. Any other value, or omitting the char, enables
> > auto-switch */
> > -static unsigned char __read_mostly opt_conswitch[3] = "a";
> > +static char __read_mostly opt_conswitch[3] = "a";
> 
> Looking at the rest of the code, we have:
> 
> #define switch_code (opt_conswitch[0] - 'a' + 1)
> 
> Can you confirm whether this is not somehow adding a new violation?

No, this patch is to fix a violation exactly there.

