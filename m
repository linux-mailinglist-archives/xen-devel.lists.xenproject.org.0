Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AC6189E58
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 15:54:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEa2F-0000qA-E2; Wed, 18 Mar 2020 14:51:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qhng=5D=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jEa2D-0000q5-Df
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 14:51:05 +0000
X-Inumbo-ID: e26d9a0c-6927-11ea-92cf-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e26d9a0c-6927-11ea-92cf-bc764e2007e4;
 Wed, 18 Mar 2020 14:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584543061;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=nWGME0rq9tjRTE6USyjxeJ9NXebaPNMAtnZq7uRPKlk=;
 b=g0OpEPkv3R34rkPuQbi/BrcMwrYPEgCYcRQd37GTd/6wvPOadchH02QZ
 jIq86t7UJOWygcJ5taMzFM2si7n49Y0H2jpAKbIj0aw4dmrAvwXNLR7y8
 /iHWLCe3XdnfcZC5KvRCQ9kHHVWXQcc/07Ik6aLwfWdcrWfVV3gmm/mww g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RVsqN5icg0wOUkZhqhKGWG/gDKetmyEt+I49XezCZ4MWKaq1sdaTDfLpyxtIGwZz+ZVBgCxFg/
 DADZVO7zXsCLOKK6FM8fjPZ9UQrTk3OL3vZpRGc/l+TE/9+A4BTgssR5S0NWDak/n9a1TVUeES
 W7MKiYwJUMI3+Enj8uKF1uX9stvfBh3tITiTC3LGH+MJB3af62erGRAEv3jKTwU1FaTqeSMnCr
 4Ix3jzQAiZUI3/O4Rh7R//oRI/kxwSzfsifF+n2DVEeOuIt9mumpT9eTMeT8yEWIyKPMxfOWIz
 Jro=
X-SBRS: 2.7
X-MesageID: 14848499
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,568,1574139600"; d="scan'208";a="14848499"
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <20200318141635.GW7869@mail-itl>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fa845540-fd8e-bc63-a3af-50673dede579@citrix.com>
Date: Wed, 18 Mar 2020 14:50:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200318141635.GW7869@mail-itl>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDMvMjAyMCAxNDoxNiwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+
IEhpLAo+Cj4gSW4gbXkgdGVzdCBzZXR1cCAoaW5zaWRlIEtWTSB3aXRoIG5lc3RlZCB2aXJ0IGVu
YWJsZWQpLCBJIHJhdGhlcgo+IGZyZXF1ZW50bHkgZ2V0IFhlbiBjcmFzaCBvbiByZXN1bWUgZnJv
bSBTMy4gRnVsbCBtZXNzYWdlIGJlbG93Lgo+Cj4gVGhpcyBpcyBYZW4gNC4xMy4wLCB3aXRoIHNv
bWUgcGF0Y2hlcywgaW5jbHVkaW5nICJzY2hlZDogZml4IHJlc3VtaW5nCj4gZnJvbSBTMyB3aXRo
IHNtdD0wIi4KPgo+IENvbnRyYXJ5IHRvIHRoZSBwcmV2aW91cyBpc3N1ZSwgdGhpcyBvbmUgZG9l
cyBub3QgaGFwcGVuIGFsd2F5cyAtIEkKPiB3b3VsZCBzYXkgaW4gYWJvdXQgNDAlIGNhc2VzIG9u
IHRoaXMgc2V0dXAsIGJ1dCB2ZXJ5IHJhcmVseSBvbiBwaHlzaWNhbAo+IHNldHVwLgo+Cj4gVGhp
cyBpcyBfd2l0aG91dF8gY29yZSBzY2hlZHVsaW5nIGVuYWJsZWQsIGFuZCBhbHNvIHdpdGggc210
PW9mZi4KPgo+IERvIHlvdSB0aGluayBpdCB3b3VsZCBiZSBhbnkgZGlmZmVyZW50IG9uIHhlbi11
bnN0YWJsZT8gSSBjYXQgdHJ5LCBidXQKPiBpdCBpc24ndCB0cml2aWFsIGluIHRoaXMgc2V0dXAs
IHNvIEknZCBhc2sgZmlyc3QuCj4KPgo+IChYRU4pIFhlbiBCVUcgYXQgc2NoZWRfY3JlZGl0Mi5j
OjM0NzQKPiAoWEVOKSAtLS0tWyBYZW4tNC4xMy4wICB4ODZfNjQgIGRlYnVnPW4gICBOb3QgdGFp
bnRlZCBdLS0tLQoKQW55IGNoYW5jZSB5b3UgY2FuIHJlcHJvZHVjZSB3aXRoIGEgZGVidWcgYnVp
bGQ/CgpUaGVyZSBpcyBhIGdvb2QgY2hhbmNlIHRoYXQgYW4gYXNzZXJ0aW9uIG1pZ2h0IGZpcmUg
ZWFybGllciB0aGFuIHRoaXMgQlVHKCkuCgp+QW5kcmV3CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
