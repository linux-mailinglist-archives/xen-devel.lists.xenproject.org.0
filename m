Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B80A76C3D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 17:00:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr1ft-0007dh-0w; Fri, 26 Jul 2019 14:58:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yHJP=VX=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hr1fr-0007dc-WA
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 14:58:24 +0000
X-Inumbo-ID: d00d7b79-afb5-11e9-8980-bc764e045a96
Received: from mail-io1-xd44.google.com (unknown [2607:f8b0:4864:20::d44])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d00d7b79-afb5-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 14:58:22 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id o9so1768675iom.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 07:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CgiiMtLsjQwV+8f9NdpQ6WvKtMS/nKuzuR4OPPXL0d8=;
 b=RQXSIWHu5zSvk/Wm6ZZe9qmLcSWxZqscv+fIc4J9RmeyEILn4U/dg3Ohcc2yOrihDT
 52zNz2HUSRkVyA0CBQU5V/j5l08w3xKzUerOuzt1xB7uqq9kT/66TJs4HrmyOb0+KoXH
 GGv3PCB8Zi7Y54OGLnnig0rpF0OTeN50bNMFPGmSKgBN5wkoFyalZKeC9qAcy7djMYUx
 27K2ygx5CfndJ4xmK4Uu96DAmKquXwk5vIpcISgToDv3zYVvkkqTEIvoWInr14R+J5C8
 CmeaNabkNFqiQDMWUUOEHylT1U1+m/a4zYbChBy5ncgOUfWE/6ENwxKiNvuT0Ejq0dbZ
 GDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CgiiMtLsjQwV+8f9NdpQ6WvKtMS/nKuzuR4OPPXL0d8=;
 b=bSjUm/6BiF+lPIEWIbQfl4M3xdyFeixpgZSQk0eNojzMp5P58c/yWHaPtNGgmI6lfi
 gC7w7u0sBFlBTnfRJm14L0CxwD6JJOxkg0wbpxfkcQIo8hn0KhGYBnB9omTxydbAvLyN
 pE5aKty/vCjHzPMAlChXNXLguz5NMcdW5QbQ72ZbNsQcm89qDG5cS1pdJj77d9asuBC2
 EQBukmeLVCbGC8KlBOGuAt1JHOB1YRcTFf0qRhaL3Q6wkIxBKsqNSUF1Ni1aQBRhMCSr
 KISrtSqMgC43WglJowqW3fM9ydTFyPlwihnjYFjnSw8ybA557e14b6tjDiTcHa14Z3Zl
 u4qw==
X-Gm-Message-State: APjAAAW6vYz5rUFaEqXepYZcY81wn3275WTQeUfYaxdoiY/jimnQa15F
 t3gtdaOoZvJ0cpJUpF5sYQpr9Sd83VGtT7SZ67k=
X-Google-Smtp-Source: APXvYqzB1zefZEeJhkZQWQQdJeiyWCwbBn5J5I9WXHbP3Rr24DAioOhizlul7DiLGXBZFirAaAYmLmcbQ2vK9AMFg1k=
X-Received: by 2002:a6b:8b8b:: with SMTP id
 n133mr13689001iod.183.1564153101784; 
 Fri, 26 Jul 2019 07:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CABfawhnk+_ssU1xEzN6O+_JkH4jT2NguP30VRpkNKzc7xoKeXw@mail.gmail.com>
 <d60c933e-7f30-191c-2d75-4558223ef3e4@arm.com>
In-Reply-To: <d60c933e-7f30-191c-2d75-4558223ef3e4@arm.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Fri, 26 Jul 2019 17:58:10 +0300
Message-ID: <CAOcoXZYA4oC+ZXkfS4CQVs6JhkR+pAONgyg1ZfWzo+Q=GcAWQA@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMTE6MzcgQU0gSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3Jh
bGxAYXJtLmNvbT4gd3JvdGU6Cj4KPiBIaSBUYW1hcywKPgo+IE9uIDE4LzA3LzIwMTkgMTg6MjIs
IFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+PiAgICAgLSBMaW5lIDEzOTogVGhlIHsgYXJlIGNv
bW1vbmx5IG9uIHRoZSBzYW1lIGxpbmUgYXMgc3RydWN0IG9yIGRlZmluaXRpb24uCj4gPgo+ID4g
QWNjb3JkaW5nIHRvIENPRElOR19TVFlMRSB0aGF0J3Mgbm90IGhvdyBpdCBzaG91bGQgYmUuCj4K
PiBJIGd1ZXNzIHlvdSByZWZlciB0byB0aGUgc2VjdGlvbiAiQnJhY2luZyIuIElmIHNvLCBJIHRo
aW5rIHdlIGRvbid0IGZvbGxvdyB0aGUKPiBDT0RJTkdfU1RZTEUgZm9yIHN0cnVjdCBvciBkZWZp
bml0aW9uLgo+Cj4gSSBoYXZlIHRvIGFkbWl0IHRoYXQgZm9yIHRoaXMgY2FzZSwgSSBhbHdheXMg
aGF2ZSB0byBsb29rIGF0IG90aGVyIHVzYWdlIGluIHRoZQo+IGNvZGUgYmVjYXVzZSBJIHRlbmQg
dG8gcHV0IHRoZSB7IG9uIGEgbmV3bGluZS4KPgo+IEkgd2FzIGdvaW5nIHRvIHNheSB0aGF0IHRo
ZXJlIG1heSBiZSBzb21lIGNhc2VzIHdoZXJlIGl0IG1ha2VzIHNlbnNlIHRvIGtlZXAgewo+IG9u
IHRoZSBzYW1lIGxpbmUuIEZvciBpbnN0YW5jZToKPgo+ICAgICB7IGEsIGIsIGMsIGQgfSwKPiAg
ICAgeyBlLCBmLCBnLCBoIH0sCj4KCkFsbCB0aGUgcnVsZXMgc2hvdWxkIGJlIHN0YXRlZCBpbiBD
T0RJTkdfU1RZTEUgZXhwbGljaXRseS4KSW4gb3RoZXIgY2FzZXMsIGl0IGNhbm5vdCBiZSBhdXRv
bWF0ZWQgd2l0aCBmdXR1cmUgcHJvdmVzIHdoeSBpdCB3b3Jrcwp0aGlzIG9yIHRoYXQgd2F5LgoK
VGhhbmtzCgo+IEJ1dCBpdCBsb29rcyBsaWtlIGFzdHlsZSBpcyBhbGxvd2luZyBpdCAoc2VlIGxp
bmUgMjQ3NTkpLgo+Cj4gQ2hlZXJzLAo+Cj4gLS0KPiBKdWxpZW4gR3JhbGwKPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxp
bmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
