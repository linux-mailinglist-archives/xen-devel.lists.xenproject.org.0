Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4846372F25
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 19:47:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122648.231348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldz8k-0005Vh-Ch; Tue, 04 May 2021 17:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122648.231348; Tue, 04 May 2021 17:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldz8k-0005VI-9g; Tue, 04 May 2021 17:47:22 +0000
Received: by outflank-mailman (input) for mailman id 122648;
 Tue, 04 May 2021 17:47:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c7IS=J7=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1ldz8j-0005VC-0k
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 17:47:21 +0000
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b795809-35b4-40da-9382-d2fe0a56d345;
 Tue, 04 May 2021 17:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id B66EE1E8;
 Tue,  4 May 2021 19:47:18 +0200 (CEST)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h1G5CTwCoOK3; Tue,  4 May 2021 19:47:18 +0200 (CEST)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 1BE7490;
 Tue,  4 May 2021 19:47:18 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1ldz8f-00GPn2-9z; Tue, 04 May 2021 19:47:17 +0200
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
X-Inumbo-ID: 0b795809-35b4-40da-9382-d2fe0a56d345
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 4 May 2021 19:47:17 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
Subject: Re: [PATCH 9/9] vtpmmgr: Support GetRandom passthrough on TPM 2.0
Message-ID: <20210504174717.yzvqyc37twoitlns@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Andryuk <jandryuk@gmail.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
References: <20210504124842.220445-1-jandryuk@gmail.com>
 <20210504124842.220445-10-jandryuk@gmail.com>
 <20210504133332.pt56xjrxvbnz2htd@begin>
 <CAKf6xpuS_FoWpkBxMEudJsOwfKG96f8_Vd8p6tcU5C1f01PT6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKf6xpuS_FoWpkBxMEudJsOwfKG96f8_Vd8p6tcU5C1f01PT6Q@mail.gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: B66EE1E8
X-Spamd-Result: default: False [-2.50 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 TO_DN_ALL(0.00)[];
	 FREEMAIL_TO(0.00)[gmail.com];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[];
	 BAYES_HAM(-3.00)[100.00%]

Jason Andryuk, le mar. 04 mai 2021 13:23:57 -0400, a ecrit:
> > > @@ -842,6 +889,7 @@ TPM_RESULT vtpmmgr_handle_cmd(
> > >               switch(ord) {
> > >               case TPM_ORD_GetRandom:
> > >                       vtpmloginfo(VTPM_LOG_VTPM, "Passthrough: TPM_GetRandom\n");
> > > +                     return vtpmmgr_handle_getrandom(opaque, tpmcmd);
> > >                       break;
> >
> > Drop the break, then. I would say also move (or drop) the log, like the
> > other cases.
> 
> Will drop the break.  I would just leave the log since it matches the
> other cases in this case statement.

Mmm, right these are all pass-through cases so better log them the same.

Samuel

