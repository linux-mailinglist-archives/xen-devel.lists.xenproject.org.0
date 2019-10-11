Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9796FD447D
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 17:35:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIwu0-0005qg-KS; Fri, 11 Oct 2019 15:32:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qGFj=YE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iIwtz-0005qb-45
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 15:32:23 +0000
X-Inumbo-ID: 515a4690-ec3c-11e9-8aca-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 515a4690-ec3c-11e9-8aca-bc764e2007e4;
 Fri, 11 Oct 2019 15:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570807943;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MK9xMu3JIt5AUbfSns3z4/txuakrMBSYAv6K/m09MdU=;
 b=JGTowJ+lrAPy+bg9R4v0KVbq54yqM+pcUq74atC6LN1gX2kwF9WKhKV3
 iswOouf1blrKQxp2U+N4/JYWkfv3wd1AL1uZtTIi/pNrjREOuFAw1qZy5
 WTokQfd2ZlPae6SlKJz0LsFtwY5psyjNkAm3lmaVHluq0ACsLHO/NBtPh c=;
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
IronPort-SDR: jcyUzyXRzeQzu0NZYlantRoh82D1EQj3eyew3T+Jq8Ru1o03wEYX2PFE3LLPkvtT8wjX9s0tvU
 VVdi1SfKOtzBtpT5s3b5CLam8NUMBgvLZ3n7q7dcfQBHFlyv5zk/MuiShV05NkD1wYfVu7JHgf
 EL6cZnHFEfhyacEM5ObG4qEqs/C1RTGPdvBin/U/CoKsaJdbbQ/fEdpkqxAtibRwATsyLqm861
 Om/DOvlIu7N3y4LdV7ROSsa3XaEGj5GilblCu+Fb2nQwfTPdEzG5bk3GpjEPurBpMIJ1bhr+NP
 jG8=
X-SBRS: 2.7
X-MesageID: 6775432
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,284,1566878400"; 
   d="scan'208";a="6775432"
Date: Fri, 11 Oct 2019 17:32:14 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20191011153214.GL1389@Air-de-Roger.citrite.net>
References: <20191008141024.10885-1-al1img@gmail.com>
 <20191008141024.10885-3-al1img@gmail.com>
 <23968.39583.655591.751635@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23968.39583.655591.751635@mariner.uk.xensource.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v1 2/2] libxl: add removing XS backend path
 for PV devices on domain destroy
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Grytsov <al1img@gmail.com>, Oleksandr
 Grytsov <oleksandr_grytsov@epam.com>, "wl@xen.org" <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMDQ6MDc6MTFQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gT2xla3NhbmRyIEdyeXRzb3Ygd3JpdGVzICgiW1BBVENIIHYxIDIvMl0gbGlieGw6IGFk
ZCByZW1vdmluZyBYUyBiYWNrZW5kIHBhdGggZm9yIFBWIGRldmljZXMgb24gZG9tYWluIGRlc3Ry
b3kiKToKPiA+IEZyb206IE9sZWtzYW5kciBHcnl0c292IDxvbGVrc2FuZHJfZ3J5dHNvdkBlcGFt
LmNvbT4KPiA+IAo+ID4gQ3VycmVudGx5IGJhY2tlbmQgcGF0aCBpcyByZW1vdmUgZm9yIHNwZWNp
ZmljIGRldmljZXM6IFZCRCwgVklGLCBRRElTSy4KPiA+IFRoaXMgY29tbWl0IGFkZHMgcmVtb3Zp
bmcgYmFja2VuZCBwYXRoIGZvcjogVkRJU1BMLCBWU05ELCBWSU5QVVQuCj4gCj4gVGhhbmtzIGZv
ciB0aGlzIGFuZCB5b3VyIHByZXZpb3VzIHBhdGNoLgo+IAo+IFRoaXMgb25lIGxvb2tzIHRvIG1l
IGxpa2UgaXQgaXMgcHJvYmFibHkgY29ycmVjdC4gIEJ1dCBJIGhhdmUgbm90IGJlZW4KPiBhYmxl
IHRvIHVuZGVyc3RhbmQgd2h5IHRoaXMgY29kZSB3YXMgbGltaXRlZCB0byB2YmRzIGFuZCB2aWZz
IGJlZm9yZQo+IHNvIEkgYW0gaGVzaXRhbnQuCj4gCj4gU2VhcmNoaW5nIHRoZSBnaXQgaGlzdG9y
eSwgSSB0aGluayB0aGlzIGhhcyBiZWVuIGxpa2UgdGhpcyBzaW5jZQo+IGEwZWFhODZlNzUzNwo+
ICAibGlieGw6IGFkZCBkZXZpY2UgYmFja2VuZCBsaXN0ZW5lciBpbiBvcmRlciB0byBsYXVuY2gg
YmFja2VuZHMiCj4gYW5kIHN1YnNlcXVlbnQgY29tbWl0cyBoYXZlIGp1c3QgcmVvcmdhbmlzZWQg
dGhpbmdzIGJ1dCBub3QKPiBmdW5kYW1lbnRhbGx5IGNoYW5nZWQgdGhlbS4gIEkndmUgQ0MnZCBS
b2dlciB3aG8gd3JvdGUgdGhpcyBjb2RlLgoKV2hlbiB0aGlzIGNvZGUgd2FzIGFkZGVkIChkZXZk
KSB0aG9zZSB3aGVyZSB0aGUgb25seSBiYWNrZW5kcyBoYW5kbGVkCmJ5IGxpYnhsLiBWRElTUEws
IFZTTkQsIFZJTlBVVCBkaWRuJ3QgZXhpc3QgYXQgdGhhdCBwb2ludCwgc28gSSB0aGluawp0aGUg
aXNzdWUgaXMgdGhhdCB3aGVuIHN1cHBvcnQgZm9yIHRob3NlIHdhcyBhZGRlZCwgaXQgd2Fzbid0
IHByb3Blcmx5CndpcmVkIGludG8gZGV2ZC4KCj4gSSB0aGluazoKPiAKPiA+ICAgICAgc3dpdGNo
KGRkZXYtPmRldi0+YmFja2VuZF9raW5kKSB7Cj4gPiArICAgIGNhc2UgTElCWExfX0RFVklDRV9L
SU5EX1ZESVNQTDoKPiA+ICsgICAgY2FzZSBMSUJYTF9fREVWSUNFX0tJTkRfVlNORDoKPiA+ICsg
ICAgY2FzZSBMSUJYTF9fREVWSUNFX0tJTkRfVklOUFVUOgo+ID4gICAgICBjYXNlIExJQlhMX19E
RVZJQ0VfS0lORF9WQkQ6Cj4gPiAgICAgIGNhc2UgTElCWExfX0RFVklDRV9LSU5EX1ZJRjoKPiAK
PiBJZiB3ZSBkbyB3YW50IHRoaXMgdG8gaGFuZGxlICphbGwqIGtpbmRzIG9mIGRldmljZSwgbWF5
YmUgaXQgc2hvdWxkCj4gaGF2ZSBhIGZhbGxiYWNrIHRoYXQgYWJvcnRzLCBvciBzb21ldGhpbmcg
PyAgKEkgZG9uJ3QgdGhpbmsgaXQgaXMKPiBlYXN5IHRvIG1ha2UgaXQgYSBjb21waWxlIGVycm9y
IHRvIGZvcmdldCB0byBhZGQgYW4gZW50cnkgaGVyZSBidXQgaWYKPiB3ZSBjb3VsZCBkbyB0aGF0
IGl0IHdvdWxkIHByb2JhYmx5IGJlIGJlc3QuKQoKTWF5YmUgd2UgY291bGQgaGF2ZSBzb21lIGdl
bmVyaWMgaGFuZGxpbmcgZm9yIGV2ZXJ5dGhpbmcgIT0gcWRpc2s/CgpJSVJDIHFkaXNrIG5lZWRz
IHNwZWNpYWwgaGFuZGxpbmcgc28gdGhhdCBkZXZkIGNhbiBsYXVuY2ggYW5kIGRlc3Ryb3kKYSBR
RU1VIGluc3RhbmNlIHdoZW4gcmVxdWlyZWQsIGJ1dCBvdGhlciBiYWNrZW5kcyB0aGF0IHJ1biBp
biB0aGUKa2VybmVsIGRvbid0IG5lZWQgc3VjaCBoYW5kbGluZyBhbmQgY291bGQgbWF5YmUgc2hh
cmUgdGhlIHNhbWUgZ2VuZXJpYwpjb2RlIHBhdGguCgo+IEFsbCBvZiB0aGF0IGFzc3VtaW5nIHRo
YXQgdGhlIGJhc2ljIGlkZWEgaXMgcmlnaHQsIHdoaWNoIEkgd291bGQgbGlrZQo+IFJvZ2VyJ3Mg
b3BpbmlvbiBhYm91dC4KCkxvb2tpbmcgYXQgdGhlIHBhdGNoIGl0c2VsZiwgeW91IGFsc28gc2Vl
bSB0byBiZSBkb2luZyBzb21lIGNoYW5nZXMKcmVsYXRlZCB0byBudW1fdmJkcyBhbmQgbnVtX3Zp
ZnMsIGJ1dCB0aG9zZSBhcmUgbm90IG1lbnRpb25lZCBpbiB0aGUKY29tbWl0IG1lc3NhZ2UsIGlz
IHRoYXQgYSBzdHJheSBjaGFuZ2U/CgpJJ20gbm90IHNheWluZyBpdCdzIHdyb25nLCBpdCdzIGp1
c3QgdGhhdCBpdCBmZWVscyBsaWtlIGl0IGJlbG9uZ3MgaW4KYSBkaWZmZXJlbnQgcGF0Y2ggbWF5
YmUuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
