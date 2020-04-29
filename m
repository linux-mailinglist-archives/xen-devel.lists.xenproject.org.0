Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 198A41BDCC2
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 14:56:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTmGN-0004ha-4l; Wed, 29 Apr 2020 12:56:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/uTc=6N=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jTmGL-0004hV-Co
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 12:56:29 +0000
X-Inumbo-ID: d6e2baa2-8a18-11ea-ae69-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6e2baa2-8a18-11ea-ae69-bc764e2007e4;
 Wed, 29 Apr 2020 12:56:28 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id g13so2382298wrb.8
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2020 05:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=xdsgoWXumKd5PBD8fAL20/Hh07hdmUgSfJ8ZmCCGikw=;
 b=HPLWJqvFFNQ5DjEe2HHgWA1st14oyE9VJz7ym5OIoA2MAMNk5ACj9tra/96/GHeotE
 An3VmN9ouRIGU69IcyGYHHG8Xi1xtZZlGWKYOWamTTAT0rqZqkcbkFffoifefvOn7xaf
 Fvqk/bUnBqdX3pbu7OyyRd6rM8itrzFbl4CyLiIKBSup6IjbCCBMyT7o+eFj5ltCTFTy
 U/dcl+Az2v981qYIo+sriqqlSg03v147TXW7+HeLUjOeX7Z8rfL9iqTBQZktu71elJId
 G70GL79sICNrhay0uS1ejB+OOKTNZ24UleDssOQPsH+3zDzlNDyj4XALawnLEdXOmXgn
 2iPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=xdsgoWXumKd5PBD8fAL20/Hh07hdmUgSfJ8ZmCCGikw=;
 b=MfTdhB2qZvlfLwhhPD7gR982qx+XnKXubNaTtTNgdMSfevz6qCVFQJz7B9EffFFyWc
 MGIedhR0IjJyFr9MJv4UDZouhkRWaJuTIDzY0fZkJCirpuxJByAcd8esGqNfm0ju9wZz
 IsGWys51CL92WWxLiv01hzgDvxVYrh9D+lCl46CfkKfcO92yKE3Bi7wnwgghLDyZYW0J
 pXo1UaN0Ui0qIyTxlMzVfpDSVECIhOHJICQmfzSjXeiENKn8QbZzYZ4TGgfYi3jPy4pv
 gtFYCx1Z5JiuosAZ17MPUTiMDWlEDFM09MyWATJnKhVwDH1H3X33p7aLFaCUTlN8lGZY
 Yy6g==
X-Gm-Message-State: AGi0PuaWF/aKqXTlQwLI/JepZuszicQlZAerKIUlmmjWzyLC/f76xF83
 Sh78/er1mnKflfjWhaQUuug=
X-Google-Smtp-Source: APiQypLyVordswB8gLPg0rRFuxldP65DGiHcAgq2gwivzldHpn2I8ahk8Lo/eBuqi7xY+Q+LiDuY1w==
X-Received: by 2002:adf:ee91:: with SMTP id b17mr39157104wro.109.1588164987260; 
 Wed, 29 Apr 2020 05:56:27 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id v1sm30936382wrv.19.2020.04.29.05.56.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Apr 2020 05:56:26 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Igor Druzhinin'" <igor.druzhinin@citrix.com>,
 =?UTF-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
 "'Julien Grall'" <julien@xen.org>,
 "'Julien Grall'" <julien.grall.oss@gmail.com>
References: <20200428155144.8253-1-jgross@suse.com>
 <CAJ=z9a0WfWQs+UJ-t4Kt6PGGdNnA2kMeK5p8bNnDT_eFcpDiiQ@mail.gmail.com>
 <d1c41bd7-676e-c50a-416d-c62efcbdd41d@suse.com>
 <76ed29d6-e2fc-cd48-6de7-e0032daaa2e9@xen.org>
 <3fd79cb1-e18f-1987-69ff-94f1bd15c66f@citrix.com>
 <3dcbe001-c66c-13a6-7a28-ef24b05eefa0@suse.com>
 <c07e5106-d8de-f6a7-e406-b25ee9ff6d49@citrix.com>
 <f80aff47-8617-8f59-0d34-bf0385128b62@suse.com>
 <a23c3d72-f5c8-5c3f-2c2f-5a9ca1065d1f@citrix.com>
In-Reply-To: <a23c3d72-f5c8-5c3f-2c2f-5a9ca1065d1f@citrix.com>
Subject: RE: [PATCH] tools/xenstore: don't store domU's mfn of ring page in
 xensotred
Date: Wed, 29 Apr 2020 13:56:24 +0100
Message-ID: <000001d61e25$97f86530$c7e92f90$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQI5DSqNP/4D/SMDjCtgzueaLTX80QC4bkXHAbDXqJ8CsNUfVQLT/QPPATMMdVoBnbvEPwMR4MQ0ANMkKK2nVRCVUA==
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
Cc: 'xen-devel' <xen-devel@lists.xenproject.org>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Wei Liu' <wl@xen.org>,
 andrew.cooper3@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> Sent: 29 April 2020 13:50
> To: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>; Julien Grall =
<julien@xen.org>; Julien Grall
> <julien.grall.oss@gmail.com>
> Cc: xen-devel <xen-devel@lists.xenproject.org>; Ian Jackson =
<ian.jackson@eu.citrix.com>; Wei Liu
> <wl@xen.org>; andrew.cooper3@citrix.com; Paul Durrant <paul@xen.org>
> Subject: Re: [PATCH] tools/xenstore: don't store domU's mfn of ring =
page in xensotred
>=20
> On 29/04/2020 13:29, J=C3=BCrgen Gro=C3=9F wrote:
> > On 29.04.20 13:04, Igor Druzhinin wrote:
> >> On 29/04/2020 11:49, J=C3=BCrgen Gro=C3=9F wrote:
> >>> On 29.04.20 12:39, Igor Druzhinin wrote:
> >>>> On 29/04/2020 10:22, Julien Grall wrote:
> >>>>> Hi Juergen,
> >>>>>
> >>>>> On 29/04/2020 06:51, J=C3=BCrgen Gro=C3=9F wrote:
> >>>>>>
> >>>>>> Recreating the event channel would be fine, but I don't see why =
it
> >>>>>> would ever be needed. And XS_INTRODUCE is called only at domain =
creation
> >>>>>> time today, so there is obviously no need for repeating this =
call.
> >>>>>>
> >>>>>> Maybe the idea was to do this after sending a XS_RESUME =
command, which
> >>>>>> isn't used anywhere in Xen and is another part of Xenstore =
which doesn't
> >>>>>> make any sense today.
> >>>>>
> >>>>> Commit f6cc37ea8ac71385b60507c034519f304da75f4c =
"tools/oxenstored: port XS_INTRODUCE evtchn
> rebind function from cxenstored" added the exact same behavior in the =
OCaml XenStored last year.
> >>>>>
> >>>>> This was introduced 12 years after C XenStored, so surely =
someone think this is useful. We
> should check why this was introduced in OCaml XenStored (I have CCed =
the author of the patch).
> >>>>>
> >>>>> If we still think this is not useful, then you should add an =
explanation in the commit message
> why the two implementations diverge and possibly update the spec.
> >>>>
> >>>> Thanks for CC, Julien.
> >>>>
> >>>> We indeed already use this functionality in our toolstack for =
guest kdump
> >>>> functions. It's not possible in XAPI to adopt libxl model where =
almost everything
> >>>> is restarted for a domain entering kdump, so we have to use this =
message to
> >>>> rebind xenstore evtchn after soft reset without shutting down =
backends and
> >>>> recreating the whole subtree (frontends reconnect fine after =
that).
> >>>>
> >>>> We obviously only require it for now to be present in oxenstored =
only.
> >>>> Please don't remove this functionality if possible.
> >>>
> >>> If I read handling in libxl correctly, in the soft reset case =
XS_RELEASE
> >>> is issued before doing another XS_INTRODUCE. XS_RELEASE will =
result in
> >>> xenstored throwing away its related struct domain, so XS_INTRODUCE =
will
> >>> be possible again.
> >>
> >>  From what I remember it was not possible to keep xenstored data =
for a domain
> >> and at the same time perform release-introduce cycle (at least in =
oxenstored).
> >> It also involved firing @releaseDomain which caused havoc in other =
part of
> >> the toolstack.
> >
> > Wei, Ian, can you please tell me where I'm wrong?
> >
> > A soft reset should restart the domain in a clean state. AFAIK libxl =
is
> > handling that by doing kind of in-place save-restore, including =
calling
> > xs_release_domain() and later xs_introduce_domain(). This should =
result
> > in xenstored throwing away all state it has regarding the domain and
> > then restarting with a new (internal) domain instance.
> >
> > Is XAPI doing soft reset differently? Why should there be a need for
> > keeping xenstored data across a soft reset?
>=20
> Yes, XAPI is doing soft reset differently from libxl. You need to keep =
xenstore
> data to at least keep backends working without the need to =
reinitialize them
> before entering kdump kernel. We do the same thing while entering =
crash kernel
> in Windows after BSOD (CC Paul as he recommended this approach).

IIRC I recommended not involving Xen or the toolstack in entering the =
crash kernel... they don't need to know. Windows quite happily enters =
its crash kernel, rebuilds its Xen interfaces and re-attaches to PV =
backends without any external intervention.

  Paul

> There are other reasons to not reset xenstore data.
>=20
> I considered XS_INTRODUCE functionality to be part of xenstored ABI =
and we built
> a lot of infrastructure on top of that. So I don't think it could be =
easily removed now.
>=20
> Igor


