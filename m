Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C00D9AE6CBD
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 18:46:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023990.1400071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU6n6-00043I-0B; Tue, 24 Jun 2025 16:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023990.1400071; Tue, 24 Jun 2025 16:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU6n5-00040V-Tc; Tue, 24 Jun 2025 16:46:35 +0000
Received: by outflank-mailman (input) for mailman id 1023990;
 Tue, 24 Jun 2025 16:46:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L371=ZH=bounce.vates.tech=bounce-md_30504962.685ad667.v1-0507621ca80f40ce8c63b7ec82219b8d@srs-se1.protection.inumbo.net>)
 id 1uU6n5-00040P-8x
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 16:46:35 +0000
Received: from mail134-21.atl141.mandrillapp.com
 (mail134-21.atl141.mandrillapp.com [198.2.134.21])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8933281-511a-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 18:46:33 +0200 (CEST)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-21.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4bRW7C4KDWz1XMfdq
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 16:46:31 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 0507621ca80f40ce8c63b7ec82219b8d; Tue, 24 Jun 2025 16:46:31 +0000
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
X-Inumbo-ID: c8933281-511a-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1750783591; x=1751053591;
	bh=utlhzJJl5garRAOCZabEjFWcBAsz0PPqqW4UKkCMth0=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ZBOi1pfELwJ4xvdgVWseQlyN9OeAWO/XAECT6JzAK0XTcyMLL2fJ2V5HMi+gawCl7
	 NPlG3M3i19zImSd2irlaIqNdrOZQRzlldb3wHpbGLkv7HF0H64GE9oHwm7A4Lidtgd
	 E7kF3yCHTijtUVMfkCepP7Qs3nHtlwQzFYvkdyNsWqnf8hYynFlUrnJgZKxuDfI3mP
	 uLEfJY1Ic/FQMj4JHgTGOEPZE2vJpT9v8VNMsOejI0lF6yDhJGTkhKkB/PQ+ee4RSs
	 9Fo6a7BfaRc8C6vnicZNlX48DfyDkKtmP6u3NqLQNImv1TgPodcsr962PbCKcjyjnG
	 YiNQ3va7GdV3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1750783591; x=1751044091; i=teddy.astie@vates.tech;
	bh=utlhzJJl5garRAOCZabEjFWcBAsz0PPqqW4UKkCMth0=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=G7kGrDctVfeI5afiYHBDXctzA1AZAQa9Awn8QClkMZo625USzY9fZzwBXQl6gACCJ
	 /T8w6yXQivwNiWDfJP/fKiyhOzYZZ4lj24xMCwiERVBA88oluBs5dce8IavajRd7Tx
	 oQDlGfvgduu54kUR7CImqJqNY0bDzCHDeX6KQGviay3/2c4ZDlvBtZ6/kNQwV5pPJr
	 KoL/I7Mqi/HQQzDOGa0WDEJsRUXb9k7HzxaRRuhKaVdoOFX2G0U2vtVhcV7/VE8YV+
	 bvZqbmhIyDaQepcIYW9+6TMFWjyu7PJ72Y/kxbe1Q6Ji/ioFXFlQBqTuwIjJ+rJNMK
	 aY5qDSaB5BntA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20xenstore=20-=20Suggestion=20of=20batching=20watch=20events?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1750783590303
Message-Id: <6516c9bf-204d-45f6-9e24-e63150d3f354@vates.tech>
To: "Andriy Sultanov" <sultanovandriy@gmail.com>, xen-devel@lists.xenproject.org
Cc: "=?utf-8?Q?J=C3=BCrgen=20Gro=C3=9F?=" <jgross@suse.com>, "=?utf-8?Q?Edwin=20T=C3=B6r=C3=B6k?=" <edwin.torok@cloud.com>, ngoc-tu.dinh@vates.tech, "Christian Lindig" <christian.lindig@citrix.com>
References: <47b7f870-e1d9-44c9-b8ea-5b9028843963@gmail.com>
In-Reply-To: <47b7f870-e1d9-44c9-b8ea-5b9028843963@gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.0507621ca80f40ce8c63b7ec82219b8d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250624:md
Date: Tue, 24 Jun 2025 16:46:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Le 24/06/2025 =C3=A0 16:53, Andriy Sultanov a =C3=A9crit=C2=A0:
> Currently, as far as I am aware, the ability of xenstore clients to 
> properly
> handle and detect batch updates is somewhat lacking. Transactions are not
> directly visible to the clients watching a particular directory - they wi=
ll
> receive a lot of individual watch_event's once the transaction is 
> committed,
> without any indication when such updates are going to end.
> 
> Clients such as xenopsd from the xapi toolstack are reliant on xenstore t=
o
> track their managed domains, and a flood of individual updates most often
> results in a flood of events raised from xenopsd to xapi (There are
> consolidation mechanisms implemented there, with updates getting merged
> together, but if xapi picks up update events from the queue quickly 
> enough, it
> will only get more update events later)
> 
> The need for batching is fairly evident from the fact that XenServer's 
> Windows
> PV drivers, for example, adopted an ad-hoc "batch" optimization (not 
> documented
> anywhere, of course), where some sequence of writes is followed by a 
> write of
> the value "1" to "data/updated". This used to be honoured by xapi, which 
> would
> not consider the guest agent update done until it received notice of such=
 a
> "batch ended" update, but it caused xapi to miss updates that were not 
> followed
> by such a write, so xapi now ignores this ad-hoc batching. One could 
> imagine
> many workarounds here (for example, some sort of a mechanism where xenops=
d
> stalls an update for a second to see if any more related updates show up 
> and
> only then notifies xapi of it, with obvious trade-offs), but IMO it 
> could be
> worth considering making this easier on the xenstore side for different
> use-cases.
> 
> Suggestion:
> WATCH_EVENT's req_id and tx_id are currently 0. Could it be possible, for
> example, to modify this such that watch events coming as a result of a
> transaction commit (a "batch") have tx_id of the corresponding transactio=
n
> and req_id of, say, 2 if it's the last such watch event of a batch and 1
> otherwise? Old clients would still ignore these values, but it would allo=
w
> some others to detect if an update is part of a logical batch that 
> doesn't end
> until its last event.
> 

I find this a bit problematic as it adds assumption on a well-behaving 
xenstored. What happens if you receive WATCH_EVENTs with only 1 (and no 
2) ? Should the xenstore client assume that a WATCH_EVENT with 2 may 
come at some point (lingering some arbitrary time), or still process it 
in a singular way (like currently) ?

Without changing the protocol itself, we can improve the situation at 
the xenstored/client level.

xenstore being architecturally a ring buffer (and a socket when 
communicating directly with Dom0), we can batch multiples WATCH_EVENT in 
a atomic way (up to ring size with ring buffer). In a way where the 
client will be able to process multiple WATCH_EVENT without eventually 
stalling.

(with ring buffer : write multiples xs_wire messages and only then 
update ring index and raise event channel)

In userland, this could take the form as xenstored pushing multiples 
messages through a single send(), so the client would be able to perform 
all the recv() at once.

> Is this beyond the scope of what xenstored wants to do? From a first 
> glance,
> this does not seem to introduce obvious unwanted information leaks 
> either, but
> I could be wrong. I would love to hear if this is something that could be
> interesting to others and if this could be considered at all.
> 
> Thank you!
> 
> 
> 



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



