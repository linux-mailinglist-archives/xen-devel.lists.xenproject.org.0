Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 262B92ED3EA
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 17:06:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62962.111724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxXnD-0007RB-Uh; Thu, 07 Jan 2021 16:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62962.111724; Thu, 07 Jan 2021 16:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxXnD-0007Qo-Rg; Thu, 07 Jan 2021 16:05:43 +0000
Received: by outflank-mailman (input) for mailman id 62962;
 Thu, 07 Jan 2021 16:05:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yhhx=GK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kxXnB-0007Op-Ie
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 16:05:41 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a89a1663-3ebd-46ca-a1b5-5e3ce9051a13;
 Thu, 07 Jan 2021 16:05:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3CF9820857;
 Thu,  7 Jan 2021 16:05:38 +0000 (UTC)
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
X-Inumbo-ID: a89a1663-3ebd-46ca-a1b5-5e3ce9051a13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610035539;
	bh=EZ7pTzbofG8rxlB00YB614Nh+p6jN81tgIiCIZc5hZk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=P3INgpVggXqe1Yz0H0de06uwWPRPJAHoNGPWEVjC97qgBBIRyGc/4xjK9wTZg1vW9
	 K9hHyAdgUFcjlmIv0O/+hXUQiOIckpPTU2lgUfB747rq+uEXIOTx97rWIbCMkeC4Gx
	 MOoxNWxextFskmSmUZBJVX2Qhe67woxwNoAER3I+iFEj0h7C7Uulw3sZ8zMj8yp5ib
	 ufeZzDaFXu2QM/M8qEOZs7NdBOKh7hMQ3cYfPsJGf5W9IuuIFtVj7CRafaLE3r2vre
	 LdCHDnFZhk/H+LKI46hqkzVsAGYz3XYvbzS801qcBNg2JMfoUq+D+l8pwnZntSbKoV
	 ahY6e8fjyM2eg==
Date: Thu, 7 Jan 2021 08:05:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <Andrew.Cooper3@citrix.com>, 
    amc96@cam.ac.uk, Tamas K Lengyel <tamas.k.lengyel@gmail.com>, 
    "intel-xen@intel.com" <intel-xen@intel.com>, 
    "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, 
    Roger Pau Monne <roger.pau@citrix.com>, 
    Sergey Dyasli <sergey.dyasli@citrix.com>, 
    Christopher Clark <christopher.w.clark@gmail.com>, 
    Rich Persaud <persaur@gmail.com>, 
    Kevin Pearson <kevin.pearson@ortmanconsulting.com>, 
    Juergen Gross <jgross@suse.com>, 
    =?UTF-8?Q?Paul_Durrant=C2=A0?= <pdurrant@amazon.com>, 
    "Ji, John" <john.ji@intel.com>, 
    "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, 
    "robin.randhawa@arm.com" <robin.randhawa@arm.com>, 
    Artem Mygaiev <Artem_Mygaiev@epam.com>, 
    Matt Spencer <Matt.Spencer@arm.com>, 
    Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, 
    Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
    "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>, 
    Jarvis Roach <Jarvis.Roach@dornerworks.com>, 
    Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, 
    Julien Grall <julien@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>, 
    Rian Quinn <rianquinn@gmail.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <George.Dunlap@citrix.com>, 
    David Woodhouse <dwmw@amazon.co.uk>, Amit Shah <amit@infradead.org>, 
    Varad Gautam <varadgautam@gmail.com>, Brian Woods <brian.woods@xilinx.com>, 
    Robert Townley <rob.townley@gmail.com>, 
    Bobby Eshleman <bobby.eshleman@gmail.com>, 
    Corey Minyard <cminyard@mvista.com>, 
    Olivier Lambert <olivier.lambert@vates.fr>, Wei Liu <wl@xen.org>, 
    Ash Wilding <ash.j.wilding@gmail.com>, Rahul Singh <Rahul.Singh@arm.com>, 
    =?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>, 
    Brendan Kerrigan <brendank310@gmail.com>, 
    "Thierry Laurion (Insurgo)" <insurgo@riseup.net>, 
    George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [ANNOUNCE] Xen Community Call on Jan 7 at 16:00 UTC
In-Reply-To: <alpine.DEB.2.21.2101051656010.6548@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2101070805210.7075@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2101051656010.6548@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

This is the actual link:
https://cryptpad.fr/pad/#/2/pad/edit/QThHB2KRkqKJkyFrSkcwbBwE/

On Tue, 5 Jan 2021, Stefano Stabellini wrote:
> Hi all,
> 
> Thursday Jan 7 at 4PM UK time / 8AM California time we are going to have
> a Xen Community Call.
> 
> You are welcome to suggest agenda items by replying to this email or by
> adding them to this page: https://cryptpad.fr/pad/#/2/pad/edit/OPN55rXaOncupuWuHxtddzWJ/
> I prepopulated the page with items marked as "NOT COVERED" from the Dec
> 3 call.
> 
> We are going to use Zoom for the next call. Call details appended to
> this email. Please note that it is possible join a Zoom call by phone
> and/or from just your browser on Linux and other OSes (no need to
> install the Zoom app).
> 
> Cheers,
> 
> Stefano
> 
> 
> Topic: Xen Community Call Jan 7
> Time: Jan 7, 2021 08:00 AM Pacific Time (US and Canada)
> 
> Join Zoom Meeting
> https://xilinx.zoom.us/j/98731406986
> 
> Meeting ID: 987 3140 6986
> One tap mobile
> +16699006833,,98731406986# US (San Jose)
> 
> Meeting ID: 987 3140 6986
> Find your local number: https://xilinx.zoom.us/u/abGKcwnDOO
> 

