Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UE4yL94aFmqEhgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 00:12:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B015DD1EA
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 00:12:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320244.1587614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wS00i-0002Sa-4s; Tue, 26 May 2026 22:12:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320244.1587614; Tue, 26 May 2026 22:12:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wS00i-0002Ps-1b; Tue, 26 May 2026 22:12:28 +0000
Received: by outflank-mailman (input) for mailman id 1320244;
 Tue, 26 May 2026 22:12:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wS00g-0002Pm-Mb
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 22:12:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wS00g-00Ap4y-0a
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 00:12:26 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a161aaa-5cb7-0a2a0a5109dd-0a2a450385b8-32
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 00:12:25 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a161ac8-672d-0a2a45030019-aceafc1f9f4a-3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 00:12:25 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id BBB5142AF1;
 Tue, 26 May 2026 22:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 589311F000E9;
 Tue, 26 May 2026 22:12:23 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779833543;
	bh=iuKse6yTZ1PX4RYR/GqhfYIdwzjQF1nQ6wec/X1mD+4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=lvLJYgVbKE0o2NDi9ZKDtQlDRK1YH/kwEsU8UKpqRvieXNvdakksqYnIWKW21lbmy
	 kX2ATZ9FyyTLesCXvXpetfjZ/C7MMohKX5uuboRmDufC90Aedu4IkxOHxY5i1LJfuq
	 SJumL2nxiWqzzokAAktVY3yimy6gobNvxlQI/R5Im/pvTSMb3Iw5MqJrUJHo1NEdRa
	 T9njIN5m+AIvr7S3DsmWDO+GutqLf2DbeCOaR+A4yG6qPgVGM/ZrrTFcMxdPxA4LD1
	 TpIJDk5QGYzlzH8iRbUvSodOvmi13k798rCUeMDAW1unb13vFviPNAlOTuccCUlKpW
	 TKRDDUPt+egTg==
Date: Tue, 26 May 2026 15:12:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stewart Hildebrand <stewart.hildebrand@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] vPCI: resolve MISRA R10.1 boolean arithmetic type
 violation
In-Reply-To: <984c91b8-3d2c-4431-bdf1-4a333ac341d1@suse.com>
Message-ID: <alpine.DEB.2.22.394.2605261508390.182011@ubuntu-linux-20-04-desktop>
References: <e23266191a366abe66d8104783d97578aa8734a4.1779428826.git.dmytro_prokopchuk1@epam.com> <984c91b8-3d2c-4431-bdf1-4a333ac341d1@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-33051d/1779833545-41F90938-2E7A2FA5/0/0
X-purgate-type: clean
X-purgate-size: 1947
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:dmytro_prokopchuk1@epam.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 69B015DD1EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 22 May 2026, Jan Beulich wrote:
> (extending Cc list)
> 
> On 22.05.2026 08:13, Dmytro Prokopchuk1 wrote:
> > --- a/xen/drivers/vpci/header.c
> > +++ b/xen/drivers/vpci/header.c
> > @@ -586,7 +586,7 @@ static void cf_check bar_write(
> >          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
> >              gprintk(XENLOG_WARNING,
> >                      "%pp: ignored BAR %zu write while mapped\n",
> > -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> > +                    &pdev->sbdf, bar - pdev->vpci->header.bars + (hi ? 1 : 0));
> >          return;
> >      }
> >  
> > @@ -647,7 +647,7 @@ static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,
> >          if ( guest_addr != bar->guest_addr )
> >              gprintk(XENLOG_WARNING,
> >                      "%pp: ignored guest BAR %zu write while mapped\n",
> > -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> > +                    &pdev->sbdf, bar - pdev->vpci->header.bars + (hi ? 1 : 0));
> >          return;
> >      }
> >      bar->guest_addr = guest_addr;
> 
> Well. If I'm not mistaken we had discussed situations like this (long ago).
> Imo the added verbosity gets in the way of readability. If we absolutely
> cannot or don't want to deviate such constructs (of which I expect we have
> more), then we ought to consider alternatives (like changing the variables'
> types in the case here).
> 
> As to deviating: rules.rst, according to my reading, says that &, |, ^, or
> shifts would be okay to use with a bool operand. What's wrong with also
> permitting this for other operators?

In my opinion, if we are going to treat bool as its own type, it makes
sense not to silently mix bools into arithmetic with int types. I also
do not find this patch less readable -- I actually find it more
readable, since it makes it more obvious that hi is a bool.


