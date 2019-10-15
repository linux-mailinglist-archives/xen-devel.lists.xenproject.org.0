Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 152ABD7A07
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 17:42:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKOvV-000629-My; Tue, 15 Oct 2019 15:39:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JiiH=YI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iKOvT-000624-Iy
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 15:39:55 +0000
X-Inumbo-ID: 087729ec-ef62-11e9-a531-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 087729ec-ef62-11e9-a531-bc764e2007e4;
 Tue, 15 Oct 2019 15:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571153994;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=R32hbmo6QJmWsKHZzHqVB10ZTVphNLA5BnwZ8eaKB5E=;
 b=OdjwwCC59TK2m0H1S8/WwbdK5N/IizF3FIiOR/Fya9D80IJkR6KNT7kl
 M+gUPzWnKLiSVRNWPTztJN5sDEjUSzgYcm8mY0mzm1eutcoKifx/cJ5gH
 V3qsr+wbcv7LwPQA9gbIxKx5LezUO/ouHqbvsuA/q0sBR0EizuJ036MzB s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pYjprVLlCz9+zU+8pRaJS2FpkP/wqBeNvQSyXQ8TTOFeuwaPHzHfjwGA/a47z2NxJvGA2eTo/x
 pFtHzS1FF6QdCauBFGBW+brg1lOkfWNEI9b1kEYDAdwIjnEnjUUwk9oOuGSKhwXvlFb4JKC75s
 kJtP66ddvBNkbpEeRW07jYuarTRMg8pmfAEei/Gt3jhYP4E+/uf3mp05UoF4w18YUO6hgu/vGw
 ZXT3/ZusYEjAEq3Y5zT5RWGXHpHOFQqkUDf/PglSEf3kbwjHGMpKV6zxnAvF0zCZlrVq4Pi7OJ
 lf4=
X-SBRS: 2.7
X-MesageID: 7188775
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,300,1566878400"; 
   d="scan'208";a="7188775"
Date: Tue, 15 Oct 2019 17:39:47 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20191015153947.GA17494@Air-de-Roger>
References: <20191008141024.10885-1-al1img@gmail.com>
 <20191008141024.10885-3-al1img@gmail.com>
 <23968.39583.655591.751635@mariner.uk.xensource.com>
 <20191011153214.GL1389@Air-de-Roger.citrite.net>
 <23968.42484.127483.711098@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23968.42484.127483.711098@mariner.uk.xensource.com>
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

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMDQ6NTU6MzJQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gUm9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIlJlOiBbUEFUQ0ggdjEgMi8yXSBsaWJ4bDog
YWRkIHJlbW92aW5nIFhTIGJhY2tlbmQgcGF0aCBmb3IgUFYgZGV2aWNlcyBvbiBkb21haW4gZGVz
dHJveSIpOgo+ID4gV2hlbiB0aGlzIGNvZGUgd2FzIGFkZGVkIChkZXZkKSB0aG9zZSB3aGVyZSB0
aGUgb25seSBiYWNrZW5kcyBoYW5kbGVkCj4gPiBieSBsaWJ4bC4gVkRJU1BMLCBWU05ELCBWSU5Q
VVQgZGlkbid0IGV4aXN0IGF0IHRoYXQgcG9pbnQsIHNvIEkgdGhpbmsKPiA+IHRoZSBpc3N1ZSBp
cyB0aGF0IHdoZW4gc3VwcG9ydCBmb3IgdGhvc2Ugd2FzIGFkZGVkLCBpdCB3YXNuJ3QgcHJvcGVy
bHkKPiA+IHdpcmVkIGludG8gZGV2ZC4KPiA+IAo+ID4gPiBJIHRoaW5rOgo+ID4gPiAKPiA+ID4g
PiAgICAgIHN3aXRjaChkZGV2LT5kZXYtPmJhY2tlbmRfa2luZCkgewo+ID4gPiA+ICsgICAgY2Fz
ZSBMSUJYTF9fREVWSUNFX0tJTkRfVkRJU1BMOgo+ID4gPiA+ICsgICAgY2FzZSBMSUJYTF9fREVW
SUNFX0tJTkRfVlNORDoKPiA+ID4gPiArICAgIGNhc2UgTElCWExfX0RFVklDRV9LSU5EX1ZJTlBV
VDoKPiA+ID4gPiAgICAgIGNhc2UgTElCWExfX0RFVklDRV9LSU5EX1ZCRDoKPiA+ID4gPiAgICAg
IGNhc2UgTElCWExfX0RFVklDRV9LSU5EX1ZJRjoKPiA+ID4gCj4gPiA+IElmIHdlIGRvIHdhbnQg
dGhpcyB0byBoYW5kbGUgKmFsbCoga2luZHMgb2YgZGV2aWNlLCBtYXliZSBpdCBzaG91bGQKPiA+
ID4gaGF2ZSBhIGZhbGxiYWNrIHRoYXQgYWJvcnRzLCBvciBzb21ldGhpbmcgPyAgKEkgZG9uJ3Qg
dGhpbmsgaXQgaXMKPiA+ID4gZWFzeSB0byBtYWtlIGl0IGEgY29tcGlsZSBlcnJvciB0byBmb3Jn
ZXQgdG8gYWRkIGFuIGVudHJ5IGhlcmUgYnV0IGlmCj4gPiA+IHdlIGNvdWxkIGRvIHRoYXQgaXQg
d291bGQgcHJvYmFibHkgYmUgYmVzdC4pCj4gPiAKPiA+IE1heWJlIHdlIGNvdWxkIGhhdmUgc29t
ZSBnZW5lcmljIGhhbmRsaW5nIGZvciBldmVyeXRoaW5nICE9IHFkaXNrPwo+IAo+IFNvIG1ha2Ug
dGhhdCB0aGUgImRlZmF1bHQ6IiA/ICBUaGF0IHdvdWxkIGJlIGZpbmUgYnkgbWUuCgpJZiBwb3Nz
aWJsZSB5ZXMsIHRoYXQgd291bGQgYmUgbXkgcHJlZmVyZW5jZSwgYW5kIHdvdWxkIHByZXZlbnQg
aGF2aW5nCnRvIGFkZCBuZXcgZGV2aWNlIHR5cGVzIHRvIHRoaXMgc3dpdGNoIHVubGVzcyBzcGVj
aWFsIGhhbmRsaW5nIGlzCnJlcXVpcmVkLgoKPiAKPiA+IElJUkMgcWRpc2sgbmVlZHMgc3BlY2lh
bCBoYW5kbGluZyBzbyB0aGF0IGRldmQgY2FuIGxhdW5jaCBhbmQgZGVzdHJveQo+ID4gYSBRRU1V
IGluc3RhbmNlIHdoZW4gcmVxdWlyZWQsIGJ1dCBvdGhlciBiYWNrZW5kcyB0aGF0IHJ1biBpbiB0
aGUKPiA+IGtlcm5lbCBkb24ndCBuZWVkIHN1Y2ggaGFuZGxpbmcgYW5kIGNvdWxkIG1heWJlIHNo
YXJlIHRoZSBzYW1lIGdlbmVyaWMKPiA+IGNvZGUgcGF0aC4KPiAKPiBSaWdodC4KPiAKPiA+ID4g
QWxsIG9mIHRoYXQgYXNzdW1pbmcgdGhhdCB0aGUgYmFzaWMgaWRlYSBpcyByaWdodCwgd2hpY2gg
SSB3b3VsZCBsaWtlCj4gPiA+IFJvZ2VyJ3Mgb3BpbmlvbiBhYm91dC4KPiA+IAo+ID4gTG9va2lu
ZyBhdCB0aGUgcGF0Y2ggaXRzZWxmLCB5b3UgYWxzbyBzZWVtIHRvIGJlIGRvaW5nIHNvbWUgY2hh
bmdlcwo+ID4gcmVsYXRlZCB0byBudW1fdmJkcyBhbmQgbnVtX3ZpZnMsIGJ1dCB0aG9zZSBhcmUg
bm90IG1lbnRpb25lZCBpbiB0aGUKPiA+IGNvbW1pdCBtZXNzYWdlLCBpcyB0aGF0IGEgc3RyYXkg
Y2hhbmdlPwo+IAo+IE5vLCBJIGRvbid0IHRoaW5rIHNvLiAgVGhvc2UgdmFyaWFibGVzIGp1c3Qg
dGVsbCB1cyB3aGVuIHRoZSB0aGluZyBpcwo+IHRvcm4gZG93biBidXQgT2xla3NhbmRyJ3MgY29k
ZSBpcyBhYmxlIHRvIHVzZSB0aGUgZGV2aWNlcyBzbGlzdCBpdHNlbGYKPiBmb3IgdGhhdC4gIFBs
ZWFzZSBkbyBjaGVjayB0byBzZWUgaWYgeW91IGFncmVlLgoKWWVzLCB0aGF0J3MgZmluZS4gSSBk
b24ndCB0aGluayB0aG9zZSBjaGFuZ2VzIGFyZSB3cm9uZywgSSBqdXN0IHRoaW5rCnRoYXQgYXQg
bGVhc3QgdGhleSBzaG91bGQgYmUgbWVudGlvbmVkIGluIHRoZSBjb21taXQgbWVzc2FnZS4gSWU6
CiJ3aGlsZSB0aGVyZSByZW1vdmUgdGhlIG51bV92aWZzIGFuZCBudW1fdmJkcyBzaW5jZSB0aGV5
IGFyZSBub3QKbmVlZGVkIGFuZCB0aGUgc2FtZSBjYW4gYmUgYWNoaWV2ZWQgYnkgY2hlY2tpbmcg
dGhhdCB0aGUgZGV2aWNlIGxpc3QKaXMgZW1wdHkuIiBvciBzb21lIHN1Y2guCgpUaGFua3MsIFJv
Z2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
