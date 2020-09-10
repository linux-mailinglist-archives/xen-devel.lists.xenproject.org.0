Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 747C926453B
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 13:14:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGKWe-0002ES-Vy; Thu, 10 Sep 2020 11:14:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0EwZ=CT=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kGKWd-0002EN-B5
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 11:13:59 +0000
X-Inumbo-ID: d27e6e09-e0ac-40ff-a30f-f795388f72e0
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d27e6e09-e0ac-40ff-a30f-f795388f72e0;
 Thu, 10 Sep 2020 11:13:58 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id z4so6276023wrr.4
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 04:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=hNOMCCprA6TP7+JN+C1ss0iUQsISTqef9bU+Y7PY3po=;
 b=H+YdVU7cBtQ0miEHnQeBog0qZUTN/RJoVNTBDA0731PNPSik3FiFVqx7HyMdWDl5pN
 MPKaceyyM6VKlMGAsbuU9SYxHVxZAIOsxFV3ctlBEM1EgL1j8YlqVwlyaWQqr1zT+7gu
 va70yfGXHgGjPcplzFNcshrajBcnD2sW3HYS9uAU62INjR+9pCh0k7WDe3kvLeA5tvgy
 /SYSu4cTE+ZYYmgkIoXJOF7YgnZ75DDUKpE6FmYowxsZkyWzu0V0eFP5WDtumI5XQyX7
 Hw1hKom9a3g2FAlleYZgAhI3PYOq9TLhhbuYIsjCO6DwwbF3fQtxt9GOmuM5JtshTHll
 gWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=hNOMCCprA6TP7+JN+C1ss0iUQsISTqef9bU+Y7PY3po=;
 b=sGcyI938rSEFEnLBqN0l6Kpf6+gATA5NCMeeVnxKM5k4iJEgmUQ7wxc5VdO07QS3YK
 3oT/57aVqT/I4NHRkxmjztGhdrlxbUplONA2zTnn3Ic8+08kSEtyRGW5xulGo/Hcz1W4
 C710fKYdj3lpP217hjzpvzFDWb7JAN48Wq8d57zIIVVI1jL3OH7j210IDnnhQakDDc3A
 o13Ou3F7O+BVvpAsRp91tNqyjxNgELnfIEeV3hQlRXwDX6CrqJABRrkHYjBsz2hq1P2e
 w09lac2PqZSPnlJIw1l460G6/9pnYIpkRZzS88RUS4Eu86OxzKnY3v/I2Ct8f876pjOw
 QAKw==
X-Gm-Message-State: AOAM5305xA1sXq4LEqvf90lxvPaa6Y+pnXXa1YW+a44EY9ZqYvipaX4R
 9LM5jnGfe6of5Hm3r2tciLU=
X-Google-Smtp-Source: ABdhPJxZq6MbZZWIkp+Z+dhbdD6MpSRqEYPa4FT2Kr8ElDkoqBiRbHHPzaCMsbBn+NhRH1CqbJa7LA==
X-Received: by 2002:a5d:46c5:: with SMTP id g5mr8829673wrs.416.1599736437347; 
 Thu, 10 Sep 2020 04:13:57 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id a15sm9466591wrn.3.2020.09.10.04.13.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Sep 2020 04:13:56 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Cc: "'Jan Beulich'" <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>, "'Wei Liu'" <wl@xen.org>
References: <20200909145058.72066-1-roger.pau@citrix.com>
 <c865b08b-b2cc-eb86-0780-34492ffa9187@suse.com>
 <20200910103455.GV753@Air-de-Roger> <002901d68760$93a6a330$baf3e990$@xen.org>
 <20200910110400.GX753@Air-de-Roger>
In-Reply-To: <20200910110400.GX753@Air-de-Roger>
Subject: RE: [PATCH] x86/hvm: don't treat MMIO pages as special ones regarding
 cache attributes
Date: Thu, 10 Sep 2020 12:13:55 +0100
Message-ID: <002a01d68763$79c67690$6d5363b0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHf/Df7LZfQ9Xm/eSTBd3e0hnXIhAJAqh6dAQmHGeUBN70MDwHbph0WqRvhucA=
Content-Language: en-gb
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Sent: 10 September 2020 12:06
> To: paul@xen.org
> Cc: 'Jan Beulich' <jbeulich@suse.com>; xen-devel@lists.xenproject.org; =
'Andrew Cooper'
> <andrew.cooper3@citrix.com>; 'Wei Liu' <wl@xen.org>
> Subject: Re: [PATCH] x86/hvm: don't treat MMIO pages as special ones =
regarding cache attributes
>=20
> On Thu, Sep 10, 2020 at 11:53:10AM +0100, Paul Durrant wrote:
> > > -----Original Message-----
> > > From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > > Sent: 10 September 2020 11:35
> > > To: Jan Beulich <jbeulich@suse.com>
> > > Cc: xen-devel@lists.xenproject.org; Andrew Cooper =
<andrew.cooper3@citrix.com>; Wei Liu
> <wl@xen.org>;
> > > Paul Durrant <paul@xen.org>
> > > Subject: Re: [PATCH] x86/hvm: don't treat MMIO pages as special =
ones regarding cache attributes
> > >
> > > On Thu, Sep 10, 2020 at 11:27:49AM +0200, Jan Beulich wrote:
> > > > On 09.09.2020 16:50, Roger Pau Monne wrote:
> > > > > MMIO regions below the maximum address on the memory map can =
have a
> > > > > backing page struct that's shared with dom_io (see x86
> > > > > arch_init_memory and it's usage of share_xen_page_with_guest), =
and
> > > > > thus also fulfill the is_special_page check because the page =
has the
> > > > > Xen heap bit set.
> > > > >
> > > > > This is incorrect for MMIO regions when is_special_page is =
used by
> > > > > epte_get_entry_emt, as it will force direct MMIO regions =
mapped into
> > > > > the guest p2m to have the cache attributes set to write-back.
> > > > >
> > > > > Add an extra check in epte_get_entry_emt in order to detect =
pages
> > > > > shared with dom_io (ie: MMIO regions) and don't force them to
> > > > > write-back cache type on that case.
> > > >
> > > > Did you consider the alternative of not marking those pages as =
Xen
> > > > heap ones? In particular when looking at it from this angle I
> > > > consider it at least odd for non-RAM (or more precisely =
non-heap)
> > > > pages to get marked this way.
> > >
> > > I wasn't sure whether this could cause issues in other places of =
the
> > > code that would rely on this fact and such change seemed more =
risky
> > > IMO.
> > >
> > > > And I can't currently see anything
> > > > requiring them to be marked as such - them being owned by DomIO =
is
> > > > all that's needed as it seems.
> > >
> > > Should those pages then simply be assigned to dom_io and set the
> > > appropriate flags (PGC_allocated | 1), or should
> > > share_xen_page_with_guest be modified to not set the PGC_xen_heap
> > > flag?
> > >
> > > I see that such addition was done in a2b4b8c2041, but I'm afraid I
> > > don't fully understand why share_xen_page_with_guest needs to mark
> > > pages as Xen heap.
> > >
> >
> > In general they are not marked Xen heap then they will be considered =
domheap and will go through the
> normal free-ing path on domain destruction. Of course this doesn't =
apply for a system domain that
> never gets destroyed.
>=20
> Hm, OK, the original commit (a2b4b8c2041) mentions that marking them
> as Xen heap is done to signal that the virtual address for those is
> not needed (and not available?).
>=20
> For the MMIO regions I'm not sure it matters much, since those are not
> assigned to the domain, but just mapped into it. The MMIO regions are
> not shared with the domain accessing them, but rather with dom_io.
>=20
> It's still not clear to me what option would be better: modify
> share_xen_page_with_guest to not mark pages as Xen heap, or implement
> something different to assign MMIO pages to dom_io without setting
> the Xen heap flag.

Would using map_mmio_regions() work?

  Paul

>=20
> Thanks, Roger.


