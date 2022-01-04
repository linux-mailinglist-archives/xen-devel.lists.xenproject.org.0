Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE609484703
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 18:32:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253374.434517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4nef-00072x-Tb; Tue, 04 Jan 2022 17:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253374.434517; Tue, 04 Jan 2022 17:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4nef-00070E-QG; Tue, 04 Jan 2022 17:31:25 +0000
Received: by outflank-mailman (input) for mailman id 253374;
 Tue, 04 Jan 2022 17:31:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P9eR=RU=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1n4nee-000708-BY
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 17:31:24 +0000
Received: from MTA-13-4.privateemail.com (mta-13-4.privateemail.com
 [198.54.127.109]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21c8e589-6d84-11ec-9ce5-af14b9085ebd;
 Tue, 04 Jan 2022 18:31:22 +0100 (CET)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
 by mta-13.privateemail.com (Postfix) with ESMTP id 5A26D18000AC
 for <xen-devel@lists.xenproject.org>; Tue,  4 Jan 2022 12:31:20 -0500 (EST)
Received: from mail-yb1-f169.google.com (unknown [10.20.151.160])
 by mta-13.privateemail.com (Postfix) with ESMTPA id 32D1B18000A4
 for <xen-devel@lists.xenproject.org>; Tue,  4 Jan 2022 12:31:20 -0500 (EST)
Received: by mail-yb1-f169.google.com with SMTP id d1so89580393ybh.6
 for <xen-devel@lists.xenproject.org>; Tue, 04 Jan 2022 09:31:20 -0800 (PST)
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
X-Inumbo-ID: 21c8e589-6d84-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1641317480;
	bh=4whWPdijVv7TvEQER3Tm5YUZ5jjZx9Ah72SnrV6OAuY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bgcwnqLlt1/We0YmMz3cKtdlcJGPctfTk1gMfSUh+EvBoTLJOuA3sDifoi3lXKD81
	 O1fnTXk4Tq3ppfA20xbZ7zckY0visBmS0mtQv8lRH6PM/9VhT+HWU/5cquMgLIaaGO
	 Aw2UHlKA9nLbptr/esiPv258A4y0oJ1LhMug9jR8XaObIaIQ+M1z8L5jVaaIlih952
	 UXmlLdTOITlEEl49kBpo5dNYysdCh4dtrTgBireA0VWRWP/iKAyHkFYIQVk1xIMuVs
	 ZJ3xa4fHS9/ka2SQ4KXFPCz5/x0B7NQF2l1M4TVvuSdE/HBvh9ePyaONSsOQAh0KD+
	 PvD5Ma5+Xt7qg==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1641317480;
	bh=4whWPdijVv7TvEQER3Tm5YUZ5jjZx9Ah72SnrV6OAuY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bgcwnqLlt1/We0YmMz3cKtdlcJGPctfTk1gMfSUh+EvBoTLJOuA3sDifoi3lXKD81
	 O1fnTXk4Tq3ppfA20xbZ7zckY0visBmS0mtQv8lRH6PM/9VhT+HWU/5cquMgLIaaGO
	 Aw2UHlKA9nLbptr/esiPv258A4y0oJ1LhMug9jR8XaObIaIQ+M1z8L5jVaaIlih952
	 UXmlLdTOITlEEl49kBpo5dNYysdCh4dtrTgBireA0VWRWP/iKAyHkFYIQVk1xIMuVs
	 ZJ3xa4fHS9/ka2SQ4KXFPCz5/x0B7NQF2l1M4TVvuSdE/HBvh9ePyaONSsOQAh0KD+
	 PvD5Ma5+Xt7qg==
X-Gm-Message-State: AOAM531XvJZC1/akiEXr6LIK7QvCMnKB7HSnf49T5UJ88vnuf6g76Ifv
	WBLihACOPMsGyjndO+5eeDfzF+vCenNjSqGv+2k=
X-Google-Smtp-Source: ABdhPJy6KRp1h4ukPdLiasu4BqRQED7bO9tujymRktF1ewj5ppc1/9evcTQ3DSyOQ6FaYO2jTfKoSYBVlC+h+Z65wmw=
X-Received: by 2002:a25:7382:: with SMTP id o124mr47083364ybc.128.1641317479417;
 Tue, 04 Jan 2022 09:31:19 -0800 (PST)
MIME-Version: 1.0
References: <e9257e96-ede9-2809-9a77-fd4dc206badc@suse.com>
 <2e5c460b-9123-bfc3-d5c8-0922f7b2e667@suse.com> <CABfawhmo8Rrhu985cr2z2hEXrikD6c1CQSNvv+PbmFy+mUS_XQ@mail.gmail.com>
 <6a30f0ed-c431-89e6-b91f-0f4d3ac92309@suse.com>
In-Reply-To: <6a30f0ed-c431-89e6-b91f-0f4d3ac92309@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 4 Jan 2022 12:30:43 -0500
X-Gmail-Original-Message-ID: <CABfawh=hpdEeA47h7FA1EeDOa+zxYAo3Gu1RqzHoy17j-Kw0_w@mail.gmail.com>
Message-ID: <CABfawh=hpdEeA47h7FA1EeDOa+zxYAo3Gu1RqzHoy17j-Kw0_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] x86/altp2m: p2m_altp2m_get_or_propagate() should
 honor present page order
To: Jan Beulich <JBeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Jan 4, 2022 at 11:14 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 04.01.2022 16:00, Tamas K Lengyel wrote:
> > On Tue, Jan 4, 2022 at 4:48 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> Prior to XSA-304 the only caller merely happened to not use any further
> >> the order value that it passes into the function. Already then this was
> >> a latent issue: The function really should, in the "get" case, hand back
> >> the order the underlying mapping actually uses (or actually the smaller
> >> of the two), such that (going forward) there wouldn't be any action on
> >> unrelated mappings (in particular ones which did already diverge from
> >> the host P2M).
> >>
> >> Similarly in the "propagate" case only the smaller of the two orders
> >> should actually get used for creating the new entry, again to avoid
> >> altering mappings which did already diverge from the host P2M.
> >
> > I don't really understand the reason why you want to return the
> > page_order from the altp2m here. The only check that uses the
> > page_order following is the super-page shattering check for XSA-304
> > but that's done on the hostp2m. So you would want to know what the
> > page_order is on the hosp2m, not the altp2m, no?
>
> From what I see I would say the XSA-304 action is on the altp2m,
> not the host one - the p2m_set_entry() invocation passes "p2m",
> which gets set immediately prior to the call to
> p2m_altp2m_get_or_propagate(). This is also what gets passed into
> the function. It's the host p2m only when !altp2m_active(currd).

Oh, yea, I see. OK, makes sense.

Reviewed-by: Tamas K Lengyel <tamas@tklengyel.com>

>
> > In either case, in all the setups we use altp2m we never use any
> > superpages, the recommendation is to boot with hap_1gb=0 hap_2mb=0. I
> > never trusted the complexity of superpage shattering and its
> > implementation in Xen as it is very hard to follow.
>
> Hmm, interesting. If you're aware of bugs there, would you mind
> letting us know the details? There shouldn't be a need to use
> command line options to make altp2m actually work. If there's an
> incompatibility, and if we can't get that fixed, perhaps use of
> superpages would want suppressing when altp2m gets enabled for a
> guest? Right now, without this being enforced (nor spelled out
> anywhere in, say, a code comment), I don't think we should make
> assumptions like this. Hence the patch.

I don't know of any bugs, it's just the complexity of page-shattering
always had a "smell", thus I opted to recommend superpages being
always disabled. With the added complexity of altp2m it's even more so
the case.

Tamas

