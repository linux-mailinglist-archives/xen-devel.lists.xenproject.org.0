Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B15F234480
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 13:24:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1T9N-0004aj-SP; Fri, 31 Jul 2020 11:24:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fae6=BK=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k1T9M-0004ac-BH
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 11:24:32 +0000
X-Inumbo-ID: 6723048c-d320-11ea-8e24-bc764e2007e4
Received: from mail-wr1-x430.google.com (unknown [2a00:1450:4864:20::430])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6723048c-d320-11ea-8e24-bc764e2007e4;
 Fri, 31 Jul 2020 11:24:31 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id f1so27113626wro.2
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2020 04:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=GTbWCKy6JNu5/qi4072qGPDLgB/3dhBRBvdUoHZqR+o=;
 b=NJJWFgbVvJwFX/R661qppiZ5bBCV5SqVIcsPYNWhf0ZhKxCJ6BOFz0qzpwE8bkYdny
 Qe92qZqoMqDrZxvtXmTDGxB1e7Xc+dCVOVZ42ns1nxp3G0LAiA2hDMyQIgv6ViNCBGnx
 Ns2uYOV15c3V+BDYnBOZ99S6hRMRdg3J1Ka9w6BiurNq1XKc67PDS2o48HjQ3YPkclKX
 kf8uFURZg681gWkF3uUHtkxHbnQmch1I+06x2htvj4Be5rsTELmzPh04gNaONi0PWQ52
 Htwc3rvZOB5bggEHQERTx3tczkrxwoqiTx6vDqBT2EpmG1wHahlsuHjQGbzC1nIXHzC9
 bhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=GTbWCKy6JNu5/qi4072qGPDLgB/3dhBRBvdUoHZqR+o=;
 b=kDQlI+K6DymOuAJNspVtcRzvdj+XH7P0yDSQynCyACPz8MIxfIUPOCmUjzH5lolKbm
 YjVAaHvuOl4fzinzN6RmR7W+VPId8rhgwWtFF1JVh4BUQgZG3cQkefU3gXibpEbUOIkO
 6hQSu7oxsr7XHWjXaccbsM7pT04QypiB7wkzPEVrmo0XM47y4KrgoJmBE4Whe6NZw9oi
 hezypl4hEaKhPoEORTS6qGWgf/YbIWZgRCp3oWflZvpOVKL5PDF0N+PIUP4Gz5h1yixX
 9YWt6kWhsuT0p1KkhfRM/L0TaFAoGuEUzArKHZikl5E4vWBWmhiqN1zaMO+CdIgRYOCS
 5iWg==
X-Gm-Message-State: AOAM533BqYiVq14v/Ofbs6wX8o76pP8OwLh7BTUgLeXRWf0EYcvcfUN8
 TYjYiYTyQfLLRd58U1WZ2No=
X-Google-Smtp-Source: ABdhPJwQ4xrLakLXFsIFwQvrfm4gr44Yi6VlcPFlFRaPYwMhk1TP/wHA2+8NgHUnU+rYROHVPRaAEw==
X-Received: by 2002:a5d:4d87:: with SMTP id b7mr3375732wru.170.1596194670802; 
 Fri, 31 Jul 2020 04:24:30 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id x11sm12757822wrl.28.2020.07.31.04.24.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 Jul 2020 04:24:30 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20200731104644.20906-1-paul@xen.org>
 <dba8c4c4-dfdd-9935-2d59-7bcee7615361@citrix.com>
In-Reply-To: <dba8c4c4-dfdd-9935-2d59-7bcee7615361@citrix.com>
Subject: RE: [PATCH] x86/hvm: set 'ipat' in EPT for special pages
Date: Fri, 31 Jul 2020 12:19:17 +0100
Message-ID: <003b01d6672c$6e8ffb40$4baff1c0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLI7tFygWYJCZY9nQSqDpuxgiPp+AIVoClxpyvNmOA=
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
Cc: 'Paul Durrant' <pdurrant@amazon.com>, 'Wei Liu' <wl@xen.org>,
 'Jan Beulich' <jbeulich@suse.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 31 July 2020 12:21
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>; Jan Beulich =
<jbeulich@suse.com>; Wei Liu <wl@xen.org>; Roger
> Pau Monn=C3=A9 <roger.pau@citrix.com>
> Subject: Re: [PATCH] x86/hvm: set 'ipat' in EPT for special pages
>=20
> On 31/07/2020 11:46, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > All non-MMIO ranges (i.e those not mapping real device MMIO regions) =
that
> > map valid MFNs are normally marked MTRR_TYPE_WRBACK and 'ipat' is =
set. Hence
> > when PV drivers running in a guest populate the BAR space of the Xen =
Platform
> > PCI Device with pages such as the Shared Info page or Grant Table =
pages,
> > accesses to these pages will be cachable.
> >
> > However, should IOMMU mappings be enabled be enabled for the guest =
then these
> > accesses become uncachable. This has a substantial negative effect =
on I/O
> > throughput of PV devices. Arguably PV drivers should bot be using =
BAR space to
> > host the Shared Info and Grant Table pages but it is currently =
commonplace for
> > them to do this and so this problem needs mitigation. Hence this =
patch makes
> > sure the 'ipat' bit is set for any special page regardless of where =
in GFN
> > space it is mapped.
> >
> > NOTE: Clearly this mitigation only applies to Intel EPT. It is not =
obvious
> >       that there is any similar mitigation possible for AMD NPT. =
Downstreams
> >       such as Citrix XenServer have been carrying a patch similar to =
this for
> >       several releases though.
>=20
> =
https://github.com/xenserver/xen.pg/blob/XS-8.2.x/master/xen-override-cac=
hing-cp-26562.patch
>=20
> (Yay for internal ticket references escaping into the wild.)
>=20

:-)

>=20
> However, it is very important to be aware that this is just papering
> over the problem, and it will cease to function as soon as we get =
MKTME
> support.  When we hit that point, iPAT cannot be used, as it will =
cause
> data corruption in guests.
>=20
> The only correct way to fix this is to not (mis)use BAR space for RAM
> mappings.
>=20

Oh yes, t
his is only a mitigation. I believe Roger is working on a mechanism for =
guests to query for non-populated RAM space, which would be suitable for =
use by PV drivers.

  Paul

> ~Andrew


