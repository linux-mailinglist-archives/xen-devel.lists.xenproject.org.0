Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB702EB792
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 02:23:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62269.110193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwxWx-0000Fo-Q3; Wed, 06 Jan 2021 01:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62269.110193; Wed, 06 Jan 2021 01:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwxWx-0000FP-MV; Wed, 06 Jan 2021 01:22:31 +0000
Received: by outflank-mailman (input) for mailman id 62269;
 Wed, 06 Jan 2021 01:22:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HzCB=GJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kwxWv-0000FK-Vu
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 01:22:30 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3195ee13-9dc7-4003-b0b0-5de5b3497aa4;
 Wed, 06 Jan 2021 01:22:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA7F522D01;
 Wed,  6 Jan 2021 01:22:26 +0000 (UTC)
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
X-Inumbo-ID: 3195ee13-9dc7-4003-b0b0-5de5b3497aa4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1609896148;
	bh=LmMTYmBqPY0K6oPEpjjLQJ3p6yofaa0trm4PgL2Q/0Y=;
	h=Date:From:To:cc:Subject:From;
	b=ba2KMyQvJYeHWuwDlmEY/VlA3T1a1JCTqOOIobScEDZXEfb6inWLZrzudhtB8ZJUs
	 2O+gTWXgnELlz9+kfYQFrcarXRWH8tsibCQ7hh8JBvv3QRNLUHuA/dugEpH2von4bA
	 8V7bGbIzDXYuVlo+55bxaQjglvgs6MmYTg/pSQ3IHRAmwzhL46PTR+oEaNRANT7Ooo
	 kjUIrfVaj6iVNPGxrQ0IYFOyngFblBhEsi4f4S+x/6dGL7PR/Mej9mfvWD1msuCnuQ
	 29aKkPE2FCL36DYhCI7qyIHmphF3N5uep8j6uMjmZg2yqMvsUyKEubkGvt/wC3RZal
	 XMKVsnb2ZzA7Q==
Date: Tue, 5 Jan 2021 17:22:26 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org, Andrew.Cooper3@citrix.com, amc96@cam.ac.uk
cc: sstabellini@kernel.org, Tamas K Lengyel <tamas.k.lengyel@gmail.com>, 
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
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Ian Jackson <Ian.Jackson@citrix.com>, Rian Quinn <rianquinn@gmail.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <George.Dunlap@citrix.com>, 
    David Woodhouse <dwmw@amazon.co.uk>, Amit Shah <amit@infradead.org>, 
    Varad Gautam <varadgautam@gmail.com>, Brian Woods <brian.woods@xilinx.com>, 
    Robert Townley <rob.townley@gmail.com>, 
    Bobby Eshleman <bobby.eshleman@gmail.com>, 
    Corey Minyard <cminyard@mvista.com>, 
    Olivier Lambert <olivier.lambert@vates.fr>, 
    Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
    Ash Wilding <ash.j.wilding@gmail.com>, Rahul Singh <Rahul.Singh@arm.com>, 
    =?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>, 
    Brendan Kerrigan <brendank310@gmail.com>, 
    "Thierry Laurion (Insurgo)" <insurgo@riseup.net>, 
    George Dunlap <George.Dunlap@citrix.com>
Subject: [ANNOUNCE] Xen Community Call on Jan 7 at 16:00 UTC
Message-ID: <alpine.DEB.2.21.2101051656010.6548@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

Thursday Jan 7 at 4PM UK time / 8AM California time we are going to have
a Xen Community Call.

You are welcome to suggest agenda items by replying to this email or by
adding them to this page: https://cryptpad.fr/pad/#/2/pad/edit/OPN55rXaOncupuWuHxtddzWJ/
I prepopulated the page with items marked as "NOT COVERED" from the Dec
3 call.

We are going to use Zoom for the next call. Call details appended to
this email. Please note that it is possible join a Zoom call by phone
and/or from just your browser on Linux and other OSes (no need to
install the Zoom app).

Cheers,

Stefano


Topic: Xen Community Call Jan 7
Time: Jan 7, 2021 08:00 AM Pacific Time (US and Canada)

Join Zoom Meeting
https://xilinx.zoom.us/j/98731406986

Meeting ID: 987 3140 6986
One tap mobile
+16699006833,,98731406986# US (San Jose)

Meeting ID: 987 3140 6986
Find your local number: https://xilinx.zoom.us/u/abGKcwnDOO

