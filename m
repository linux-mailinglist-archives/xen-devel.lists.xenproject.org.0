Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zLKwAlbRKWpEdwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 23:04:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A0666CF23
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 23:04:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WucHnUPe;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from list by lists.xenproject.org with outflank-mailman.1334782.1597590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXQ5t-0002ky-Lq; Wed, 10 Jun 2026 21:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334782.1597590; Wed, 10 Jun 2026 21:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXQ5t-0002ip-J3; Wed, 10 Jun 2026 21:04:13 +0000
Received: by outflank-mailman (input) for mailman id 1334782;
 Wed, 10 Jun 2026 21:04:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wXQ5s-0002ii-Ep
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 21:04:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXQ5r-001VYZ-Rw
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 23:04:11 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a29d132-e002-0a2a0a5209dd-0a2a450b8900-16
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 23:04:11 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a29d14a-212f-0a2a450b0019-ac6904fece6c-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 23:04:11 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 23F9760204;
 Wed, 10 Jun 2026 21:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D65D1F00893;
 Wed, 10 Jun 2026 21:04:09 +0000 (UTC)
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
	s=k20260515; t=1781125449;
	bh=eWYlmtbf08A6xzk6/b7Q6309rsJrqAUC94pZOr+jZl0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=WucHnUPeH8CKf0zRAnt45lMEmGmfYQ+2Lwk2NjZpXQnUDF6TceoGNf8j2dt8X5AzR
	 t6OFO9oZDBDZXD2M0EXRCnJLVI4OTuB9A1nPPAMR4kqI1a2TaqwK0KNSJxrM8tmRAR
	 llVSPvAJ57DGl2TkP4R0f4O/6ivas+rnN/Sr6/wfXPrAVrG3tXw2+rXCTFpP3hzGNG
	 W0JtsP1K+7lsDEEOQPCjFOYGsl443HIq75sPbN5pd6wCsXlEhhkuy7uL9EJmJ1+faz
	 dP8ZCUaESv0u2JIsn5gn7F3cPlApR23ALgQnrCSUZWOjiRRNl0caJUSK7ewp9j3HZl
	 iFiNGuZM2Qz+g==
Date: Wed, 10 Jun 2026 14:04:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 4/4] CI: Rework the archlinux container
In-Reply-To: <5c397f5b-cd5a-4218-92b5-074e52be5f11@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2606101403450.368315@ubuntu-linux-20-04-desktop>
References: <20260609173102.2908514-1-andrew.cooper3@citrix.com> <20260609173102.2908514-5-andrew.cooper3@citrix.com> <1781091028.8631fc262581453bbf619ec5b2062170.19eb14c4ec6000701b@vates.tech> <45a5e1d6-0262-448f-a415-d7b1b3135d87@citrix.com>
 <5c397f5b-cd5a-4218-92b5-074e52be5f11@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-42698a/1781125451-18D67F3B-A0B0FF15/0/0
X-purgate-type: clean
X-purgate-size: 1057
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vates.tech,lists.xenproject.org,kernel.org,amd.com,cardoe.com,citrix.com,invisiblethingslab.com,gmail.com];
	TO_DN_ALL(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9A0666CF23

On Wed, 10 Jun 2026, Andrew Cooper wrote:
> On 10/06/2026 12:38 pm, Andrew Cooper wrote:
> > On 10/06/2026 12:30 pm, Anthony PERARD wrote:
> >> On Tue, Jun 09, 2026 at 06:31:02PM +0100, Andrew Cooper wrote:
> >>> --- a/automation/build/archlinux/current.dockerfile
> >>> -    && yes | pacman -S --clean --clean
> >>> +++ b/automation/build/archlinux/current-x86_64.dockerfile
> >>> +    pacman -S --clean --clean
> >> The "yes |" is needed, otherwise the files aren't removed from the
> >> caches.
> >>
> >> I've only got, without:
> >>     :: Do you want to remove ALL files from cache? [y/N] :: Do you want to remove unused repositories? [Y/n]
> >> and no messages about the files been cleaned.
> >>
> >> I tried --noconfirm, but seems to just get the default response, so
> >> nothing is removed.
> > Lovely :(
> >
> >> With "yes|", I drop from 1.32 GB to 1.26 GB on my machine.
> 
> Gitlab says that the "yes |" alone shrunk the resulting container from
> 427MB to 380MB, so a substantial saving.

Nice!

Consider my acked-by

