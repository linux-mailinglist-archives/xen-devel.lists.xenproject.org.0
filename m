Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B34C44E8D75
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 07:09:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295269.502441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYhcQ-0004rm-Nn; Mon, 28 Mar 2022 05:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295269.502441; Mon, 28 Mar 2022 05:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYhcQ-0004ok-K5; Mon, 28 Mar 2022 05:08:42 +0000
Received: by outflank-mailman (input) for mailman id 295269;
 Mon, 28 Mar 2022 01:45:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lS2L=UH=mindrot.org=djm@srs-se1.protection.inumbo.net>)
 id 1nYeS9-0007Zt-Ec
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 01:45:53 +0000
Received: from train.compute.dc.uq.edu.au (train.compute.dc.uq.edu.au
 [130.102.189.35]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c60c5b48-ae38-11ec-8fbc-03012f2f19d4;
 Mon, 28 Mar 2022 03:45:47 +0200 (CEST)
Received: from smtp2.compute.dc.uq.edu.au (smtp2.compute.dc.uq.edu.au
 [10.208.138.89])
 by train.compute.dc.uq.edu.au (8.14.5/8.14.5) with ESMTP id 22S1jPYE031729;
 Mon, 28 Mar 2022 11:45:25 +1000
Received: from mailhub.eait.uq.edu.au (holly.eait.uq.edu.au [130.102.79.58])
 by smtp2.compute.dc.uq.edu.au (8.14.5/8.14.5) with ESMTP id 22S1jPJD058946
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 11:45:25 +1000
Received: from haru.mindrot.org (haru.mindrot.org [130.102.96.5])
 by mailhub.eait.uq.edu.au (8.15.1/8.15.1) with ESMTP id 22S1jOvY010008;
 Mon, 28 Mar 2022 11:45:24 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by haru.mindrot.org (OpenSMTPD) with ESMTP id 4e5c4c60;
 Mon, 28 Mar 2022 12:45:24 +1100 (AEDT)
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
X-Inumbo-ID: c60c5b48-ae38-11ec-8fbc-03012f2f19d4
Date: Mon, 28 Mar 2022 12:45:24 +1100 (AEDT)
From: Damien Miller <djm@mindrot.org>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
cc: =?ISO-8859-15?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
        =?ISO-8859-15?Q?Marek_Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
        Xen developer discussion <xen-devel@lists.xenproject.org>,
        OpenBSD technical mailing list <tech@openbsd.org>
Subject: Re: Security support status of xnf(4) and xbf(4)
In-Reply-To: <Yj3qW/y20htoSvuK@itl-email>
Message-ID: <37a4b6-cd56-1993-be2-b5522b9aa4d7@mindrot.org>
References: <Yj3qW/y20htoSvuK@itl-email>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0-1208726423-1648431924=:13027"
X-Scanned-By: MIMEDefang 2.73 on UQ Mailhub on 130.102.189.35
X-Scanned-By: MIMEDefang 2.75 on 130.102.79.58
X-UQ-FilterTime: 1648431926

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-1208726423-1648431924=:13027
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Fri, 25 Mar 2022, Demi Marie Obenour wrote:

> Linux’s netfront and blkfront drivers recently had a security
> vulnerability (XSA-396) that allowed a malicious backend to potentially
> compromise them.  In follow-up audits, I found that OpenBSD’s xnf(4)
> currently trusts the backend domain.  I reported this privately to Theo
> de Raadt, who indicated that OpenBSD does not consider this to be a
> security concern.
> 
> This is obviously a valid position for the OpenBSD project to take, but
> it is surprising to some (such as myself) from the broader Xen
> ecosystem.  Standard practice in the Xen world is that bugs in frontends
> that allow a malicious backend to cause mischief *are* considered
> security bugs unless there is explicit documentation to the contrary.
> As such, I believe this deserves to be noted in xnf(4) and xbf(4)’s man
> pages.  If the OpenBSD project agrees, I am willing to write a patch,
> but I have no experience with mandoc so it might take a few tries.

Hang on, what is a "malicious backend" in this context? Is it something
other than the Xen Hypervisor? If not, then it seems not to be a useful
attack model, as the hypervisor typically has near-complete access to
guests' memory and CPU state.

-d
--0-1208726423-1648431924=:13027--

