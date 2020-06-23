Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2880F2046A7
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 03:20:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnXcD-0002e0-Ij; Tue, 23 Jun 2020 01:20:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pvsx=AE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jnXcC-0002dq-HX
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 01:20:44 +0000
X-Inumbo-ID: c232a7c8-b4ef-11ea-8496-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c232a7c8-b4ef-11ea-8496-bc764e2007e4;
 Tue, 23 Jun 2020 01:20:44 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0596F20675;
 Tue, 23 Jun 2020 01:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592875243;
 bh=wcXgJbJlUk8bITf2CCrZAFYv+RTmBjCLBeNZ0Mjjr1A=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=P/7pAL/yZr8dYQ000cFXro1hRptCvQ//z1CZ0wvZ7Fya81RQWR68KmqAk/gfRbdFV
 JEtg10HadkzageiEQRdmG+bOym7WIlXqTvxqGPQ4z4tSFPyoXxi+neE7F+gLGJxHQp
 QJyxuhhoJi5PvfW+glbV+hf9wQ6AsVyeUkczs8a4=
Date: Mon, 22 Jun 2020 18:20:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: UEFI support in ARM DomUs
In-Reply-To: <1a44c645-8c9a-93ce-8466-35c87eb4fca5@xen.org>
Message-ID: <alpine.DEB.2.21.2006221419200.8121@sstabellini-ThinkPad-T480s>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
 <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
 <d6b39cd7-eeaa-f82b-df62-051f9f715968@epam.com>
 <54dcfce1-c401-0581-8620-dc8790209a87@xen.org>
 <alpine.DEB.2.21.2006181444460.14005@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1NtCr1MM7oUBUH3hgc8SL_K9jERy+NQ6pLzxNpGPpXzw@mail.gmail.com>
 <alpine.DEB.2.21.2006191020110.12730@sstabellini-ThinkPad-T480s>
 <c5905f40-6d0a-358f-35e4-239e88ace7d8@epam.com>
 <94bfe57c-c1be-62b4-3799-b90415264487@xen.org>
 <4ece84cf-dd68-6eb4-a0e2-e9008d264ba5@epam.com>
 <1a44c645-8c9a-93ce-8466-35c87eb4fca5@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Juergen Gross <jgross@suse.com>, Peng Fan <peng.fan@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 22 Jun 2020, Julien Grall wrote:
> > > > For the first part (__XEN_INTERFACE_VERSION__) I think we can provide it
> > > > via
> > > > 
> > > > CFLAGS or something. This can also be done for the location of Xen
> > > > headers.
> > > 
> > > __XEN_INTERFACE_VERSION__ should work through the CFLAGS. An alternative
> > > would be to allow the user to specify through the Kconfig.
> > 
> > You mean specifying via Kconfig something like "0x00040d00"?
> 
> Possibly yes.
> 
> > 
> > And what about the headers? How will we provide their location if we decide
> > not to include those
> > 
> > in the tree?
> 
> I would do through Kconfig as well.

If we specify the external location of the Xen headers via Kconfig, it
seems to me that we should be able to detect the interface version
automatically from any Makefile as part of the build. No need to ask the
user.

However, if Oleksandr is thinking of using the Xen headers for the
hypercalls definitions, then I think we might not need external headers
at all because that is a stable interface, as Julien wrote. We could
just define our own few headers for just what you need like Linux does.

If you can do that, I think it would be better because we decouple the
UBoot build from the Xen build completely. We don't even need the Xen
tree checked out to build UBoot. It would be a huge advantage because it
makes it far easier to build-test changes for others in the community
that don't know about Xen and also it becomes far easier to integrate
into any build system.

