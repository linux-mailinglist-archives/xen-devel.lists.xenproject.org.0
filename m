Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AD926BF94
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 10:43:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIT2D-0002BO-3x; Wed, 16 Sep 2020 08:43:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B7lL=CZ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kIT2B-0002BJ-Gl
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 08:43:23 +0000
X-Inumbo-ID: 5154801d-a1d4-41f5-8daf-bfe8ba603060
Received: from mail-wm1-x336.google.com (unknown [2a00:1450:4864:20::336])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5154801d-a1d4-41f5-8daf-bfe8ba603060;
 Wed, 16 Sep 2020 08:43:22 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id k18so2055358wmj.5
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2020 01:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=Oa4ktbibWpVpEa+2KTDfcdJ8jrXIUhVZLG6egDiHRjI=;
 b=rIgfh9fyuoe41J4yMQwTMjHIFQaABCdia7L6DH2rPtjRA5l0nEgla8gTLKcVjFB4ws
 bhpS54eWLrnspmJT3VJaX1fqAf1yBRlrBSWJdIFBkVy9J3iL7keJecEUSQD7YWnP0xkZ
 qRFVZejZq2nhoQgsyKjboB3fEqtXuoZ8L3bIKUH1pldKc3/5+IencNkZxJDgYnMPfpmZ
 MY6NnwZbWfZtwqjqBzuRgnECq4IUfaWppbSy2HPt91L7Iqzrp89q+rmzOg5P/CnpLu7F
 b9QTDsLQBtAY4WKi+ICveF5qoy4REuvhOiZI++p6N/AD6kNUgdXdW0rUu6jv5lxPhhcP
 JzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=Oa4ktbibWpVpEa+2KTDfcdJ8jrXIUhVZLG6egDiHRjI=;
 b=MKWe/7+nlfgoZxrogSqSmVpFm4JvCY23jpiI9qg++Vdyb8xVb7c4dxD80XtFUXE9iE
 bgP0J8ITMjtIihjfrJ2WAbWvFLBwpENoktCVW0Lt69dpwrySHAA1EkjVZKNPSifHPASj
 ZDxjSzvN6U7wiqxhB6Dx5iXMEKmWtMDLgj3f4/k0MXxs4dvq2cdTX0pLFdsEQxDoUzUL
 jNTsinXPPsZtc7/BRnT9npk6MXba0Icx61LwuUGOec/XawVaN8evsgkV3FqpqyvIWT5B
 JpHQo6aAGSxuIYKgWdR6UqcHfVcWsjOpOE47jfAZkIiz0yb8Jpdrh16yaB/Mtqs6EsOJ
 eWmg==
X-Gm-Message-State: AOAM533SRyFfYjBvTlgDvmhf+JMsDhmQB6GAJ1laCxNoB+JkhujG980W
 UQvrVdruCrOrt7KQ0W1rycA=
X-Google-Smtp-Source: ABdhPJxyMghGCH84QRqAykMWUi1eYHEYT0zFaVNJLipSBjtsSi/yteH9o6a3GLs1fyLMEMmWTStGSA==
X-Received: by 2002:a1c:28a:: with SMTP id 132mr1114517wmc.144.1600245801650; 
 Wed, 16 Sep 2020 01:43:21 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id i6sm34431829wra.1.2020.09.16.01.43.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Sep 2020 01:43:21 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>, "'Jan Beulich'" <jbeulich@suse.com>,
 "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>
Cc: <xen-devel@lists.xenproject.org>,
 "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>,
 "'Volodymyr Babchuk'" <Volodymyr_Babchuk@epam.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>, "'Wei Liu'" <wl@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 "'Julien Grall'" <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-12-git-send-email-olekstysh@gmail.com>
 <93cc6603-44f2-1ceb-997d-cbc51c3ba2c3@suse.com>
 <002801d68c01$44756ad0$cd604070$@xen.org>
 <63e51f84-c3ee-a894-5ea2-40cd3b6e26dc@xen.org>
In-Reply-To: <63e51f84-c3ee-a894-5ea2-40cd3b6e26dc@xen.org>
Subject: RE: [PATCH V1 11/16] xen/ioreq: Introduce
 hvm_domain_has_ioreq_server()
Date: Wed, 16 Sep 2020 09:43:20 +0100
Message-ID: <002901d68c05$6e7e89c0$4b7b9d40$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIQ4beZ3sUmYihKXwfoVgy4BRIJGwFWABUoAe1Op8cBcRHsnAHEIOscqMKC/gA=
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
> From: Julien Grall <julien@xen.org>
> Sent: 16 September 2020 09:39
> To: paul@xen.org; 'Jan Beulich' <jbeulich@suse.com>; 'Oleksandr =
Tyshchenko' <olekstysh@gmail.com>
> Cc: xen-devel@lists.xenproject.org; 'Oleksandr Tyshchenko' =
<oleksandr_tyshchenko@epam.com>; 'Stefano
> Stabellini' <sstabellini@kernel.org>; 'Volodymyr Babchuk' =
<Volodymyr_Babchuk@epam.com>; 'Andrew
> Cooper' <andrew.cooper3@citrix.com>; 'Wei Liu' <wl@xen.org>; 'Roger =
Pau Monn=C3=A9' <roger.pau@citrix.com>;
> 'Julien Grall' <julien.grall@arm.com>
> Subject: Re: [PATCH V1 11/16] xen/ioreq: Introduce =
hvm_domain_has_ioreq_server()
>=20
>=20
>=20
> On 16/09/2020 09:13, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 16 September 2020 09:05
> >> To: Oleksandr Tyshchenko <olekstysh@gmail.com>; Paul Durrant =
<paul@xen.org>
> >> Cc: xen-devel@lists.xenproject.org; Oleksandr Tyshchenko =
<oleksandr_tyshchenko@epam.com>; Stefano
> >> Stabellini <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; =
Volodymyr Babchuk
> >> <Volodymyr_Babchuk@epam.com>; Andrew Cooper =
<andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>;
> Roger
> >> Pau Monn=C3=A9 <roger.pau@citrix.com>; Julien Grall =
<julien.grall@arm.com>
> >> Subject: Re: [PATCH V1 11/16] xen/ioreq: Introduce =
hvm_domain_has_ioreq_server()
> >>
> >> On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
> >>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >>>
> >>> This patch introduces a helper the main purpose of which is to =
check
> >>> if a domain is using IOREQ server(s).
> >>>
> >>> On Arm the benefit is to avoid calling handle_hvm_io_completion()
> >>> (which implies iterating over all possible IOREQ servers anyway)
> >>> on every return in leave_hypervisor_to_guest() if there is no =
active
> >>> servers for the particular domain.
> >>>
> >
> > Is this really worth it? The limit on the number of ioreq serves is =
small... just 8.
>=20
> When I suggested this, I failed to realize there was only 8 IOREQ
> servers available. However, I would not be surprised if this increase
> long term as we want to use

If that happens then we'll probably want to move (back to) a list rather =
than an array...

>=20
> > I doubt you'd be able measure the difference.
> Bear in mind that entry/exit to the hypervisor is pretty "cheap" on =
Arm
> compare to x86. So we want to avoid doing extra work if it is not =
necessary.
>=20

... which will seamlessly deal with this issue.

  Paul

> Cheers,
>=20
> --
> Julien Grall


