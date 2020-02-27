Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1741721DF
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 16:11:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7Kll-00043D-Aw; Thu, 27 Feb 2020 15:08:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3dSL=4P=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j7Klk-000438-2w
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 15:08:08 +0000
X-Inumbo-ID: f3a6545e-5972-11ea-9c17-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3a6545e-5972-11ea-9c17-bc764e2007e4;
 Thu, 27 Feb 2020 15:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582816084;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ld91e1WWvmWU+oketD34Z9E+syGwIs9lDllEUncJgRg=;
 b=gndiyJbBjurEQqSa0fD3fJ1RwHrKQTP+1kPW2KW3QXr7gcFGPOjQmMlT
 h6CF/vSKi4Gv1DqqZANOsLeMmOwVZF9n7l8SeYu8dSqlQb8393hzsW4oa
 yKf6Vwi1d+uwK6KVaQZc/Aj/CoptfwTauPppO9J4gEzti5HDBjzYIgfz1 s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: M3XXxZsj0U1DiIjdRW/hkPBCP7/spxl1GqSBywEdRQ3aflIenYpttLgvGIS0UVrACNODMmdoUr
 cjfvpqZipaE0lpMcmVF76rj9qV7nfJmpr4R+pa703VgZrhGHPr0CIstszyQPLTJOI+Q9Kk72TP
 jsKVPzDOVWBkklI4Rg00kgZOCvrnXWm+D/ebt+b15PIRdqRHkgJInzJSwqgNT3VViWY2biLvs2
 TWhRWn1ksq1gEYB0ykPEaQwTzrzaFAVUMMZcuWmJVO6c4aUGhKg7ZzBiKMIV+WCYPy7jPyWqdN
 OHI=
X-SBRS: 2.7
X-MesageID: 13541786
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,492,1574139600"; d="scan'208";a="13541786"
Date: Thu, 27 Feb 2020 16:07:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200227150757.GR24458@Air-de-Roger.citrite.net>
References: <640545a6-689a-6ba9-4978-a83183df2e1b@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <640545a6-689a-6ba9-4978-a83183df2e1b@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] AMD/IOMMU: correct handling when XT's
 prereq features are unavailable
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMjcsIDIwMjAgYXQgMDM6MzQ6NDhQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gV2Ugc2hvdWxkIG5laXRoZXIgY2F1c2UgSU9NTVUgaW5pdGlhbGl6YXRpb24gYXMgYSB3
aG9sZSB0byBmYWlsIGluIHRoaXMKPiBjYXNlICh3ZSBzaG91bGQgc3RpbGwgYmUgYWJsZSB0byBi
cmluZyB1cCB0aGUgc3lzdGVtIGluIG5vbi14MkFQSUMgb3IKPiB4MkFQSUMgcGh5c2ljYWwgbW9k
ZSksIG5vciBzaG91bGQgdGhlIHJlbWFpbmRlciBvZiB0aGUgZnVuY3Rpb24gYmUKPiBza2lwcGVk
IChhcyB0aGUgbWFpbiBwYXJ0IG9mIGl0IHdvbid0IGdldCBlbnRlcmVkIGEgMm5kIHRpbWUpIGlu
IHN1Y2ggYW4KPiBldmVudC4gSXQgaXMgbWVyZWx5IG5lY2Vzc2FyeSBmb3IgdGhlIGZ1bmN0aW9u
IHRvIGluZGljYXRlIHRvIHRoZSBjYWxsZXIKPiAoaW92X3N1cHBvcnRzX3h0KCkpIHRoYXQgc2V0
dXAgZmFpbGVkIGFzIGZhciBhcyB4MkFQSUMgaXMgY29uY2VybmVkLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiAtLS0gYS94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvYW1kL2lvbW11X2luaXQuYwo+IEBAIC0xMzY0LDYgKzEzNjQsNyBAQCBzdGF0aWMgaW50
IF9faW5pdCBhbWRfaW9tbXVfcHJlcGFyZV9vbmUoCj4gIGludCBfX2luaXQgYW1kX2lvbW11X3By
ZXBhcmUoYm9vbCB4dCkKPiAgewo+ICAgICAgc3RydWN0IGFtZF9pb21tdSAqaW9tbXU7Cj4gKyAg
ICBib29sIG5vX3h0ID0gZmFsc2U7Cj4gICAgICBpbnQgcmMgPSAtRU5PREVWOwo+ICAKPiAgICAg
IEJVR19PTiggIWlvbW11X2ZvdW5kKCkgKTsKPiBAQCAtMTQwMCw5ICsxNDAxLDggQEAgaW50IF9f
aW5pdCBhbWRfaW9tbXVfcHJlcGFyZShib29sIHh0KQo+ICAgICAgICAgIGlmICggcmMgKQo+ICAg
ICAgICAgICAgICBnb3RvIGVycm9yX291dDsKPiAgCj4gLSAgICAgICAgcmMgPSAtRU5PREVWOwo+
IC0gICAgICAgIGlmICggeHQgJiYgKCFpb21tdS0+ZmVhdHVyZXMuZmxkcy5nYV9zdXAgfHwgIWlv
bW11LT5mZWF0dXJlcy5mbGRzLnh0X3N1cCkgKQo+IC0gICAgICAgICAgICBnb3RvIGVycm9yX291
dDsKPiArICAgICAgICBpZiAoICFpb21tdS0+ZmVhdHVyZXMuZmxkcy5nYV9zdXAgfHwgIWlvbW11
LT5mZWF0dXJlcy5mbGRzLnh0X3N1cCApCj4gKyAgICAgICAgICAgIG5vX3h0ID0gdHJ1ZTsKCkRv
bid0IHlvdSBuZWVkIHRvIGFsc28gYWRqdXN0IHRoZSB1c2FnZSBvZiB4dCBpbiB0aGUKZm9yX2Vh
Y2hfYW1kX2lvbW11IGxvb3AgYmVsb3csIHNvIHRoYXQgdGhlIGNvbnRyb2wgcmVnaXN0ZXJzIGZp
ZWxkcwpnZXQgaW5pdGlhbGl6ZWQgcHJvcGVybHk/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
