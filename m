Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6FsCGxTRKWotdwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 23:03:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0794D66CF17
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 23:03:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UTYynPg6;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from list by lists.xenproject.org with outflank-mailman.1334770.1597572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXQ3s-0001hi-0s; Wed, 10 Jun 2026 21:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334770.1597572; Wed, 10 Jun 2026 21:02:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXQ3r-0001ff-UU; Wed, 10 Jun 2026 21:02:07 +0000
Received: by outflank-mailman (input) for mailman id 1334770;
 Wed, 10 Jun 2026 21:02:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wXQ3q-0001fT-Gf
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 21:02:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXQ3p-00Aa9r-DV
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 23:02:05 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a29d0af-2eae-0a2a0a5409dd-0a2a4508b3ae-18
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 23:02:05 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a29d0cc-63b5-0a2a45080019-ac6904fec698-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 23:02:05 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8885F601FC;
 Wed, 10 Jun 2026 21:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E65B91F00893;
 Wed, 10 Jun 2026 21:02:02 +0000 (UTC)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781125323;
	bh=7LvkrGPlvKUxxAcZ5C5MrkJVWLDXbW3opvnSMnwIiP0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=UTYynPg6PLWHEU1ekhceF+Cc/T+QM5kRxL3P/cIF2TJz8j75DDlNzlaDjZYUT7Q92
	 944strVjM3OKMQyr4Nk6EDRlTGFidm2zeTg9NHNnkg0dsB96dhCHRpeJ/WrYnP+KCy
	 hGU0Sah1fWJuAGfLHC+MkGPMy7qnKHGbBsusK9yP7GH/yAr4bG4aPoOggM3Pd55gdT
	 ztIOQ8SoYKPuy7fQLk/ZCzSUsF+TM+ESHCr2Z8K9RJ5FhGDfP+Et/FrCwv79BHD1Xb
	 X4dWld8qYBOGj+l5xGv7823xCO8zNH8Cufa6rptGgzMp9nUm7p9RaNFfoKBBPsjP8M
	 BBQ1vZNjJRNkA==
Date: Wed, 10 Jun 2026 14:02:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@vates.tech>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 1/4] CI: Fixes to containerize
In-Reply-To: <1781083314.8631fc262581453bbf619ec5b2062170.19eb0d69a94000701b@vates.tech>
Message-ID: <alpine.DEB.2.22.394.2606101401560.368315@ubuntu-linux-20-04-desktop>
References: <20260609173102.2908514-1-andrew.cooper3@citrix.com> <20260609173102.2908514-2-andrew.cooper3@citrix.com> <1781083314.8631fc262581453bbf619ec5b2062170.19eb0d69a94000701b@vates.tech>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-c1860d/1781125325-BF171DB1-36271340/0/0
X-purgate-type: clean
X-purgate-size: 341
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,lists.xenproject.org,kernel.org,amd.com,cardoe.com,invisiblethingslab.com,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0794D66CF17

On Wed, 10 Jun 2026, Anthony PERARD wrote:
> On Tue, Jun 09, 2026 at 06:30:59PM +0100, Andrew Cooper wrote:
> > These were missed from prior changes.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

