Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6F07CD00
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 21:40:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsuPm-0007fs-9Y; Wed, 31 Jul 2019 19:37:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=92Dq=V4=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1hsuPl-0007ew-10
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 19:37:33 +0000
X-Inumbo-ID: a358f9c1-b3ca-11e9-8980-bc764e045a96
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a358f9c1-b3ca-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 19:37:31 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d23so67768906qto.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2019 12:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bWeGjHnQ3B2Zy7HrzqslGjZ9jATGw5qo06ZyY8ztsY4=;
 b=XkEHy3ZMb/OsF0BDzEq+J6LDM3nrubyDQ8NdTxlFdQLjPGD4ty3aeE0YuQeOh/BYMG
 HhGWltAE/o/QlJRdDiwG5I0aPcupPbPMvYDdmWk+N7ysmv7e/tCpRyTLODzG2kIp9xk5
 Y3hkhuftInLjtsObvtLVtBL3lJAUtyFPPF8knk6ZBZxTiPJ7gEVbEw0gwjcIHnV0F72/
 NAwPeXY1pOXKepB5fIppWmiLUQSvkrA4kHC0MRtqbVJy0dQJGiDNo0Vf7gtKNsmw5OLQ
 5nYn4q6BHUBlMKsxCdwJKI/7dZToE8RAIUbPV7+O09U8GuKQjHGM8r9+/ju1Kn6R3Xhr
 /zhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bWeGjHnQ3B2Zy7HrzqslGjZ9jATGw5qo06ZyY8ztsY4=;
 b=LyT5SFHel+Q3FqWlblRKdMeQIgjzXqYEQTjBAo9sR2OSnjNKBor7mvyKFNOstlp60g
 nAFbmX0iz0gT0gYvXyZeuxYyf6nYPFMKvPhAsWwLOc7JV1xsg1Y9m4a6HSIoBbk3pjJj
 O9Eyc+3XbQZYg8yHp48GWLQimxjMq4kjf9nlVouB7XxmEj0uMAoSX8+46y2V+ehz85T8
 pIruYNt03I1+rzNdB0O8bvC9hnTvFOul/MIXPkZj8xx4btUPCUnioc+jJfQ0KK5ZRwIT
 etmTDd/cEXJcuYjrp44zgFv/Hilu9l4SBNusftVB0PUU/9lzSCgVkovoBWta+USHIkpR
 /gzQ==
X-Gm-Message-State: APjAAAXz0Q6sGh31Ox8o2O+KEU6bfEbd9eVBm6FFHEhPkL6hJh8RNqox
 iS83tA/oBWjLvbmFJIjP88ha7MXBz6bKEXEwi0xRCQ==
X-Google-Smtp-Source: APXvYqyKmz+SOyR0tzjs8ollK0U04+IfROG15SY9Sgeg5CCy8nwhHDMsgk41iXxT1rEoDaUbvWvQbjbWAnABfRMG6kQ=
X-Received: by 2002:aed:3bb5:: with SMTP id r50mr83423416qte.89.1564601851327; 
 Wed, 31 Jul 2019 12:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy9g-QFHTXhpHK6=xDFiBDj4LpnJ=cXj405MMmA1rJaOUg@mail.gmail.com>
 <20190722143953.tkcmv5bb72sdlkql@Air-de-Roger>
 <9f11fd0b6be14ea5a8efbb809df74cc9@AMSPEX02CL03.citrite.net>
 <20190722152152.dvhs4riw2w67rvih@Air-de-Roger>
 <CAMmSBy-P9+00XfK6k2OYqFHNONcxeGuu0V=Qk4peFDC=KOUogA@mail.gmail.com>
 <b5ba8315-ce59-85e6-5bfc-1db4c239eb1c@citrix.com>
 <CAMmSBy-S7nMg-V5DUzV2L2RmK0TnFt+9=C8gE=0FuUOQK3kjQQ@mail.gmail.com>
 <f2d4b51f-b2b1-abad-8040-ad5de26f5b5b@citrix.com>
 <CAMmSBy909uERFmH9=pMqpZkr=Bb7-TVMZiFRarvzV57+=QcK8w@mail.gmail.com>
 <bf7515bb-3c4c-59e1-557a-d3f0106c5609@citrix.com>
 <CAMmSBy_Jh_NHTn_VYkNL8FxcnfMkpiq94E+XqNK9wJWm7tH0pw@mail.gmail.com>
 <81416abc-e5f5-76de-a34a-87412e125e64@citrix.com>
 <CAMmSBy8kJbt8wdJ2u+nO+FXphtNrdikOeKtMJ6tu45hDv8OeQQ@mail.gmail.com>
 <4646f3e8-6291-7d98-2550-8ab207ac675e@suse.com>
 <CAMmSBy9LTN8LjLGyfTO9g80OdP4ew0ZHj1GGFfAkt5oAKEHPKA@mail.gmail.com>
 <52afea81-33d3-7120-af72-2987bb634f08@suse.com>
 <f161e7b4-38a2-c3a3-4a04-167c3631db8c@citrix.com>
 <b7d2ee89-9a75-424d-a1c5-78e0a60b9479@suse.com>
In-Reply-To: <b7d2ee89-9a75-424d-a1c5-78e0a60b9479@suse.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Wed, 31 Jul 2019 12:37:20 -0700
Message-ID: <CAMmSBy99R9vhGTkYd2T3Piw=wRhB+=05HSWBGA+dPSfz4a9dVQ@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: Juergen Gross <JGross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMjo0NiBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMzEuMDcuMjAxOSAxMDo1OCwgQW5kcmV3IENvb3BlciB3cm90
ZToKPiA+IE9uIDMxLzA3LzIwMTkgMDk6MzQsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+IE9uIDMw
LjA3LjIwMTkgMTk6NTYsIFJvbWFuIFNoYXBvc2huaWsgd3JvdGU6Cj4gPj4+IE9uIEZyaSwgSnVs
IDI2LCAyMDE5IGF0IDE6MDYgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90
ZToKPiA+Pj4+IE9uIDIzLjA3LjIwMTkgMjA6MjUsIFJvbWFuIFNoYXBvc2huaWsgd3JvdGU6Cj4g
Pj4+Pj4gSW50ZXJlc3RpbmdseSBlbm91Z2gsIGFkZGluZyBpb21tdV9pbmNsdXNpdmVfbWFwcGlu
Zz0xIEFORCBpb21tdT1kZWJ1Zwo+ID4+Pj4+IGJvb3RlZCB0aGUgc3lzdGVtIGp1c3QgZmluZS4K
PiA+Pj4+IEJ0dyAoSSd2ZSBub3RpY2VkIHRoaXMgb25seSBub3cpIC0gYXJlIHlvdSBzYXlpbmcg
d2l0aG91dCAiaW9tbXU9ZGVidWciCj4gPj4+PiB0aGUgYm94IGRvZXMgX25vdF8gYm9vdCBmaW5l
LCBkZXNwaXRlIHRoZSBvdGhlciBvcHRpb24/Cj4gPj4+IFllcy4gQnV0IGl0IG1hZGUgc2Vuc2Ug
dG8gbWUgc2luY2UgaW9tbXU9ZGVidWcgKGFzIHBlciB5b3VyCj4gPj4+IGV4cGxhbmF0aW9uKSBv
dmVyd2hlbG1zIHRoZSBDUFUgYW5kIEkgZ3Vlc3MgYWRkaW5nCj4gPj4+IGlvbW11X2luY2x1c2l2
ZV9tYXBwaW5nPTEgYXZvaWRzIHRoZSBjb2RlIHBhdGggdGhhdCBkb2VzIGl0Pwo+ID4+IEknbSBh
ZnJhaWQgSSBkb24ndCBmb2xsb3c6IE15IHF1ZXN0aW9uIHdhcyB3aGV0aGVyCj4gPj4gImlvbW11
X2luY2x1c2l2ZV9tYXBwaW5nPTEiIGFsb25lIHdvdWxkIG5vdCBhbGxvdyB0aGUgYm94IHRvIGJv
b3QuCj4gPj4gV2l0aG91dCAiaW9tbXU9ZGVidWciIHRoZXJlJ3Mgbm8gZXhjZXNzaXZlIGxvZ2dp
bmcgYWZhaWN0LCBubwo+ID4+IG1hdHRlciB3aGF0IG90aGVyIElPTU1VIG9wdGlvbnMgeW91IHVz
ZS4KPiA+Cj4gPiBXaXRob3V0IGluY2x1c2l2ZSBtYXBwaW5ncywgdGhlIHN5c3RlbSBib290cyBi
dXQgdGhlIHNjcmVlbiBpcyBqdW5rIGFuZAo+ID4gdGhlcmUgYXJlIERNQSBmYXVsdHMgYWxsIG92
ZXIgdGhlIHBsYWNlLiAgV2l0aCBpbmNsdXNpdmUgbWFwcGluZ3MsIGl0Cj4gPiBhbGwgIndvcmtz
IiBmaW5lLgo+ID4KPiA+IFdpdGggZGVidWcgZW5hYmxlZCwgdGhlIERNQSBmYXVsdHMgYXJlIHNw
YXQgb3V0IHRvIHRoZSBjb25zb2xlIGZvciBhCj4gPiBzaG9ydCB3aGlsZSwgdW50aWwgYW4gQVBJ
QyBlcnJvciBvY2N1cnMgYW5kIHRoZSBzeXN0ZW0gd2VkZ2VzIGNvbXBsZXRlbHkuCj4KPiBSaWdo
dCAtIHRoZSB2ZXJib3NpdHkgX3dpdGhfICJpb21tdT1kZWJ1ZyIgbWF5IGJlIGEgcHJvYmxlbS4g
SGVuY2UgbWUKPiB3b25kZXJpbmcgd2hldGhlciB0aGUgc3lzdGVtIGluZGVlZCB3b3VsZG4ndCBi
b290IF93aXRob3V0XyB0aGF0IG9wdGlvbi4KCldpdGhvdXQgaW9tbXU9ZGVidWcgKGFuZCBhbnkg
b3RoZXIgb3B0aW9uKSB0aGUgc2NyZWVuIGlzIGdhcmJsZWQuCgpUaGFua3MsClJvbWFuLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
