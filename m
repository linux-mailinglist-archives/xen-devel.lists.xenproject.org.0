Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F50178E7F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 11:37:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9RMS-0007Jy-JY; Wed, 04 Mar 2020 10:34:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Mvz=4V=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j9RMR-0007Js-HR
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 10:34:43 +0000
X-Inumbo-ID: c2195fcc-5e03-11ea-a37e-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2195fcc-5e03-11ea-a37e-12813bfff9fa;
 Wed, 04 Mar 2020 10:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583318083;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=stxrvW3FSJ6H9jh7vdpK0vQPRrDLFMWHqzs6iWTmlYg=;
 b=GAGqoxoduNL+PgX09foYHHWhfFRDhCKtLgPQWVYiFs0A15+9zhHgAui8
 VBW1HrhWYlGNpWCE7X5SPmi9Mly18roEg3LbV+LaYL0Hwj+yA3x71KeIW
 8ax1jA3A8ippy1Kb6d5GWrZI+1HNK1K4Tvk4ZbdHKKkTCX8i8ZXRpE3NX c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: W7wXKnpZQqc/5c/Y3ReK/Z0A5lyjBGWWi02/NWimr0Adt+ig9f148bTGjooCDl6/UkAA5ckJHC
 EQOaUkjVS9CNiG4UIAfLUxS7LSzt+5W/8r8Xo2J/xAZK0N5grNH81nlhjJQyn//m+ogsImgTw1
 73qN/SDtujmkQzuBRAuY0vWrdL3tcE+hy2ThEFm94knfqgW9vnk/KuGiWffD/6dxsgCNDEt8Bn
 tzYQQFxlbx+Du9CkiLk0AlTiLcvGY3hJsvSHiIssGf4HMgxs7yPxCxh4jUMpJCFha4U4el6ECE
 e14=
X-SBRS: 2.7
X-MesageID: 13366605
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,513,1574139600"; d="scan'208";a="13366605"
Date: Wed, 4 Mar 2020 11:34:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200304103435.GS24458@Air-de-Roger.citrite.net>
References: <20200304102523.52454-1-roger.pau@citrix.com>
 <a8ae8dd4-5104-4108-0e5a-849c50fc270a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8ae8dd4-5104-4108-0e5a-849c50fc270a@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3] x86/dom0: improve PVH initrd and
 metadata placement
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXIgMDQsIDIwMjAgYXQgMTE6MzE6MjNBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDQuMDMuMjAyMCAxMToyNSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gRG9u
J3QgYXNzdW1lIHRoZXJlJ3MgZ29pbmcgdG8gYmUgZW5vdWdoIHNwYWNlIGF0IHRoZSB0YWlsIG9m
IHRoZQo+ID4gbG9hZGVkIGtlcm5lbCBhbmQgaW5zdGVhZCB0cnkgdG8gZmluZCBhIHN1aXRhYmxl
IG1lbW9yeSBhcmVhIHdoZXJlIHRoZQo+ID4gaW5pdHJkIGFuZCBtZXRhZGF0YSBjYW4gYmUgbG9h
ZGVkLgo+ID4gCj4gPiBSZXBvcnRlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgo+IAo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4gcHJlZmVyYWJseSB3aXRoLCBhcyBBbmRyZXcgc3VnZ2VzdGVkLCAuLi4KPiAKPiA+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jCj4gPiArKysgYi94ZW4vYXJjaC94
ODYvaHZtL2RvbTBfYnVpbGQuYwo+ID4gQEAgLTQ5MCw2ICs0OTAsNDUgQEAgc3RhdGljIGludCBf
X2luaXQgcHZoX3BvcHVsYXRlX3AybShzdHJ1Y3QgZG9tYWluICpkKQo+ID4gICN1bmRlZiBNQjFf
UEFHRVMKPiA+ICB9Cj4gPiAgCj4gPiArc3RhdGljIHBhZGRyX3QgZmluZF9tZW1vcnkoY29uc3Qg
c3RydWN0IGRvbWFpbiAqZCwgY29uc3Qgc3RydWN0IGVsZl9iaW5hcnkgKmVsZiwKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzaXplX3Qgc2l6ZSkKPiA+ICt7Cj4gPiArICAgIHBhZGRy
X3Qga2VybmVsX3N0YXJ0ID0gKHBhZGRyX3QpZWxmLT5kZXN0X2Jhc2UgJiBQQUdFX01BU0s7Cj4g
PiArICAgIHBhZGRyX3Qga2VybmVsX2VuZCA9IFJPVU5EVVAoKHBhZGRyX3QpZWxmLT5kZXN0X2Jh
c2UgKyBlbGYtPmRlc3Rfc2l6ZSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBQQUdFX1NJWkUpOwo+ID4gKyAgICB1bnNpZ25lZCBpbnQgaTsKPiA+ICsKPiA+ICsgICAgLyoK
PiA+ICsgICAgICogVGhlIG1lbW9yeSBtYXAgaXMgc29ydGVkIGFuZCBhbGwgUkFNIHJlZ2lvbnMg
c3RhcnRzIGFuZCBzaXplcyBhcmUKPiA+ICsgICAgICogYWxpZ25lZCB0byBwYWdlIGJvdW5kYXJp
ZXMuCj4gPiArICAgICAqLwo+ID4gKyAgICBmb3IgKCBpID0gMDsgaSA8IGQtPmFyY2gubnJfZTgy
MDsgaSsrICkKPiA+ICsgICAgewo+ID4gKyAgICAgICAgcGFkZHJfdCBzdGFydCwgZW5kID0gZC0+
YXJjaC5lODIwW2ldLmFkZHIgKyBkLT5hcmNoLmU4MjBbaV0uc2l6ZTsKPiA+ICsKPiA+ICsgICAg
ICAgIC8qIERvbid0IHVzZSBtZW1vcnkgYmVsb3cgMU1CLCBhcyBpdCBjb3VsZCBvdmVyd3JpdGUg
dGhlIEJEQS9FQkRBLiAqLwo+IAo+IC4uLiBJQkZUIGFkZGVkIGhlcmUgKEknbSBub3Qgd29ycmll
ZCBzbyBtdWNoIGFib3V0IHdoZXRoZXIgQkRBIHJlbWFpbnMKPiBoZXJlIG9yIGdldHMgZHJvcHBl
ZCkuIFRoaXMgY291bGQgb2YgY291cnNlIGJlIGRvbmUgd2hpbGUgY29tbWl0dGluZy4KClN1cmUs
IHRoYW5rcy4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
