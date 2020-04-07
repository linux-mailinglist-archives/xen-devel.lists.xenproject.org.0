Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A831A0924
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 10:15:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLjNr-0002ID-94; Tue, 07 Apr 2020 08:14:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xamf=5X=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jLjNp-0002Hv-IT
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 08:14:57 +0000
X-Inumbo-ID: ddb39338-78a7-11ea-b4f4-bc764e2007e4
Received: from mail-ed1-x530.google.com (unknown [2a00:1450:4864:20::530])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ddb39338-78a7-11ea-b4f4-bc764e2007e4;
 Tue, 07 Apr 2020 08:14:56 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id i7so2953719edq.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2020 01:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=GvBGbEtL/o2TGRn5fzILkgJlVz9MkJoa+0PNtpzeMic=;
 b=cqN8ZO20v/NGIx4mmHckw7ZHF48JsKY1tdn/v27VTCOP3oXPB8gmca/nlR7GynKL+2
 z5tElnjoP4I0onP+z7pd27djQsC6Wn0LEH/smZdJtY7tM1VNCQF+xMjg2dWtKwYq3IEl
 cWjw0RmSHZHLIsuebvNbTdedukwKckCmGqtMQZUlO7K++Cp3n+DgtQNmvtrQY12kGbRA
 BmfArLLFp70wwLifH5ypE1qN1laS6ghss22KUzS5crIoEE/EyRsHKOp5ZmUc94E6/yYf
 B6JhxYO+thLG5wtziwiSqmstBqDhz6RKTPjA0kYqMX0qcnwzFKDQXDZbye0Vf/Mh2cpv
 JAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=GvBGbEtL/o2TGRn5fzILkgJlVz9MkJoa+0PNtpzeMic=;
 b=rk1Lc9NbrujTFlM4oXgHpJPN+ab7uedvnEkMjsGvZpoZ2SBSOIlaEn0qkb5oNqIG6O
 CJK8kiGA2lCQlPWWhqtSyC4YHjG+Jh8qWav8VymnX4kIJtL132+Nqzv/llbYXcedgzkP
 tp/wo7x3ZGTicA55bECWE2fjAp9XU4DJsoWD1QI9IofWoYEibHECiWKuOYUnmfCiMaY7
 BJthYlJXm0BjcpLJclEhw4Ty8v7RK5sQf2Dt8gKt3GDEPmVsb+Bk9DCLk5oSP9ppO+6A
 QefKR+7SvqdLrdfkKwnfqqKRdJ19q/PURg766cZK5k7/hX9zErp8fpc85epBlPUCKVKa
 YTUw==
X-Gm-Message-State: AGi0PuZrLGiublB/KmfU0Mmij9MD0STMAX2IdgXHbHeWSwsLvnOuGqgT
 nabB4W6WmnP6tmQzf4NrdUs=
X-Google-Smtp-Source: APiQypIaGCKeRfqPwa7UVJqF+K25P0xlHwvXuJp8eK2VtvR/AZiSDdJxvSHJf6tVDnKBOd9nIVz2ww==
X-Received: by 2002:a50:9ae4:: with SMTP id p91mr875810edb.114.1586247295824; 
 Tue, 07 Apr 2020 01:14:55 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id fi2sm25184ejb.25.2020.04.07.01.14.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Apr 2020 01:14:55 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
References: <f7b9e16e394e7e94700ed690f0c9fbd7ce7b5c74.1586195196.git.havanur@amazon.com>
 <001501d60cb0$f60e0660$e22a1320$@xen.org>
 <20200407080651.GZ28601@Air-de-Roger>
In-Reply-To: <20200407080651.GZ28601@Air-de-Roger>
Subject: RE: [XEN PATCH] hvmloader: Enable MMIO and I/O decode,
 after all resource allocation
Date: Tue, 7 Apr 2020 09:14:53 +0100
Message-ID: <001801d60cb4$9ed4c880$dc7e5980$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLv5qvTmuvbc0jpqBdZKffFHl7s5gIUTdiAAfeGA2+mGTxCoA==
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Jan Beulich' <jbeulich@suse.com>,
 'Harsha Shamsundara Havanur' <havanur@amazon.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Sent: 07 April 2020 09:07
> To: paul@xen.org
> Cc: 'Harsha Shamsundara Havanur' <havanur@amazon.com>; =
xen-devel@lists.xenproject.org; 'Wei Liu'
> <wl@xen.org>; 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'Ian =
Jackson' <ian.jackson@eu.citrix.com>;
> 'Jan Beulich' <jbeulich@suse.com>
> Subject: Re: [XEN PATCH] hvmloader: Enable MMIO and I/O decode, after =
all resource allocation
>=20
> On Tue, Apr 07, 2020 at 08:48:42AM +0100, Paul Durrant wrote:
> > > -----Original Message-----
> > > From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf =
Of Harsha Shamsundara Havanur
> > > Sent: 06 April 2020 18:47
> > > To: xen-devel@lists.xenproject.org
> > > Cc: Wei Liu <wl@xen.org>; Andrew Cooper =
<andrew.cooper3@citrix.com>; Ian Jackson
> > > <ian.jackson@eu.citrix.com>; Jan Beulich <jbeulich@suse.com>; =
Harsha Shamsundara Havanur
> > > <havanur@amazon.com>; Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > > Subject: [XEN PATCH] hvmloader: Enable MMIO and I/O decode, after =
all resource allocation
> > >
> > > It was observed that PCI MMIO and/or IO BARs were programmed with
> > > BUS master, memory and I/O decodes (bits 0,1 and 2 of PCI COMMAND
> > > register) enabled, during PCI setup phase. This resulted in
> > > spurious and premature bus transactions as soon as the lower bar =
of
> > > the 64 bit bar is programmed. It is highly recommended that BARs =
be
> > > programmed whilst decode bits are cleared to avoid spurious bus
> > > transactions.
> > >
> >
> > It's not so much spurious transactions that are the issue. I think =
"spurious and premature bus
> transactions" should be replaced with "incorrect mappings being =
created".
> >
> > I believe the PCI spec says all three bits should be clear after =
reset anyway, and BAR programming
> whilst decodes are enabled causes problems for emulators such as QEMU =
which need to create and destroy
> mappings between the gaddr being programming into the virtual BAR and =
the maddr programmed into the
> physical BAR.
> > Specifically the case we see is that a 64-bit memory BAR is =
programmed by writing the lower half and
> then the upper half. After the first write the BAR is mapped to an =
address under 4G that happens to
> contain RAM, which is displaced by the mapping. After the second write =
the BAR is re-mapped to the
> intended location but the RAM displaced by the other mapping is not =
restored. The OS then continues to
> boot and function until at some point it happens to try to use that =
RAM at which point it suffers a
> page fault and crashes. It was only by noticing that the faulting =
address lay within the transient BAR
> mapping that we figured out what was happening.
>=20
> In order to fix this isn't it enough to just disable memory and IO
> decodes, leaving bus mastering as it is?
>=20
> I assume there is (or was) some reason why bus master is enabled by
> hvmloader in the first place?
>=20

I admit it is a while since I went mining for the reason BME was being =
set but IIRC the commit that added the original code did not state why =
it was done.

In the past I have run with local hacks disabling it whilst playing with =
GPU pass-through and not noticed it causing any problems. There is an =
argument to say that hvmloader should perhaps leave it alone but there =
is no good reason I can think of why it ought to be enabling it.

  Paul

> Thanks, Roger.


