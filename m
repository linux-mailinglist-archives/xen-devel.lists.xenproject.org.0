Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE87A2CDDF1
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 19:45:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43919.78826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kktaa-0006xu-Nj; Thu, 03 Dec 2020 18:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43919.78826; Thu, 03 Dec 2020 18:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kktaa-0006xV-KG; Thu, 03 Dec 2020 18:44:24 +0000
Received: by outflank-mailman (input) for mailman id 43919;
 Thu, 03 Dec 2020 18:44:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oiWT=FH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kktaZ-0006xP-6a
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 18:44:23 +0000
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55cfa44d-51dd-40bc-baf0-71aab0d69465;
 Thu, 03 Dec 2020 18:44:22 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id p8so2934501wrx.5
 for <xen-devel@lists.xenproject.org>; Thu, 03 Dec 2020 10:44:22 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-145.range86-183.btcentralplus.com.
 [86.183.162.145])
 by smtp.gmail.com with ESMTPSA id l8sm428251wro.46.2020.12.03.10.44.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Dec 2020 10:44:21 -0800 (PST)
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
X-Inumbo-ID: 55cfa44d-51dd-40bc-baf0-71aab0d69465
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=6QEq0OQR2ej4DNaJ8dsHWczskzh0/w/6V75OIxZkJX4=;
        b=VaImNiGqfXBDh21Vg8qGs1mxqHsKF6RKzgPMhpnU0jhP0Qj6Vh3V/NBCKJxa0PKPGd
         m5YdB48lXrTXI5bLHCSD/YCJK9YWPPSjQPeraIhguO46n8MqI6TSnAoWTOrFLvIsqQSj
         9rcwpC4u83fbVpRBPNtZRSemLeDYUX+qY1BPnzBY97kiOUSzeGqATEVXXNF16qd1qycw
         zQn7UmvhoL2lgHSpAPL1/ylper5OpAJk42OUMU3ypuwc5uKg/G9PepTVUHZ/LQR1qaxI
         yMOgKW/qbStUNV4mDrpn+JMgpyqNpg1RXuMcouiGX2KHbGKQ4QQIrsONCBDwUjQNz5hD
         l+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=6QEq0OQR2ej4DNaJ8dsHWczskzh0/w/6V75OIxZkJX4=;
        b=WNSJxMr9MXC5Fq8SE7wEdww3Fr0HkDWNiStfr1sJh6TT73n92W2IE3NXBl0LVejQYl
         9nw6AJLAqlvJPIMmf7ms7F+BvZwoNd/dhrNPYLbot396aEOlmOz2msF7Unfz5XO2zsLg
         Efm/vuq4RsNgpEKAV5m6Q6M5Nwl1zoPz/g/3PUE0c0CKZrJhq2fujWoXc5vx1xdd8bbb
         awJS/opa3v5omSLJ5qLof4g1GsTGE81N580oaGZhfxZAGXWQt9i9mfcV67AcH7Y8h3Ck
         L9XV5UIiQWi/fn0JsBmebLdIL4q/p9uUguoAqMK8WEpKZhQLrjy6MA9Zq9dmWzS+jNHW
         sZKQ==
X-Gm-Message-State: AOAM530AouSvqj4r5zxxJvMrMc67Qkk04SW5yScLr7GmQJhF3rAX7xl3
	AQu3HoYgtvfzd7PBH3gUHVs=
X-Google-Smtp-Source: ABdhPJzFhiagCCPdnRzly3I5duj+YsIIWOdAL2IWbqxM/WD/GOgehy+EcL+6fslEpBmTslorOwMIzw==
X-Received: by 2002:a5d:444c:: with SMTP id x12mr656073wrr.6.1607021061686;
        Thu, 03 Dec 2020 10:44:21 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: =?utf-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
	"'Jan Beulich'" <jbeulich@suse.com>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'Eslam Elnikety'" <elnikety@amazon.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Anthony PERARD'" <anthony.perard@citrix.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Christian Lindig'" <christian.lindig@citrix.com>,
	"'David Scott'" <dave@recoil.org>,
	"'Volodymyr Babchuk'" <Volodymyr_Babchuk@epam.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20201203124159.3688-1-paul@xen.org> <20201203124159.3688-2-paul@xen.org> <fea91a65-1d7c-cd46-81a2-9a6bcb690ed1@suse.com> <00ee01d6c98b$507af1c0$f170d540$@xen.org> <8a4a2027-0df3-aee2-537a-3d2814b329ec@suse.com> <00f601d6c996$ce3908d0$6aab1a70$@xen.org> <d72cde2c-24ac-e1f5-b1e3-b746faf41406@suse.com>
In-Reply-To: <d72cde2c-24ac-e1f5-b1e3-b746faf41406@suse.com>
Subject: RE: [PATCH v5 1/4] domctl: introduce a new domain create flag, XEN_DOMCTL_CDF_evtchn_fifo, ...
Date: Thu, 3 Dec 2020 18:44:19 -0000
Message-ID: <010201d6c9a4$50194060$f04bc120$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJzrCHAX/gquRkO4g65wfjgQBytUAJ7xs67Aj6rtzQCSqguWAI8ixj/AoRsg/ABh9SJBahBgCNw

> -----Original Message-----
[snip]
> >>>>
> >>>> All of the hunks above point out a scalability issue if we were =
to
> >>>> follow this route for even just a fair part of new sub-ops, and I
> >>>> suppose you've noticed this with the next patch presumably =
touching
> >>>> all the same places again.
> >>>
> >>> Indeed. This solution works for now but is probably not what we =
want in the long run. Same goes
> for
> >> the current way we control viridian features via an HVM param. It =
is good enough for now IMO since
> >> domctl is not a stable interface. Any ideas about how we might =
implement a better interface in the
> >> longer term?
> >>
> >> While it has other downsides, J=C3=BCrgen's proposal doesn't have =
any
> >> similar scalability issue afaics. Another possible model would
> >> seem to be to key new hypercalls to hypervisor CPUID leaf bits,
> >> and derive their availability from a guest's CPUID policy. Of
> >> course this won't work when needing to retrofit guarding like
> >> you want to do here.
> >>
> >
> > Ok, I'll take a look hypfs as an immediate solution, if that's =
preferred.
>=20
> Paul, if you'd like me to add a few patches to my series doing the =
basic
> framework (per-domain nodes, interfaces for setting struct domain =
fields
> via hypfs), I can do that. You could then concentrate on the tools =
side.
>=20

That would be very helpful. Thanks Juergen.

  Paul


