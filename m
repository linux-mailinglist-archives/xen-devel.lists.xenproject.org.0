Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBDD14C8C7
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 11:34:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwkcf-0005iI-Dd; Wed, 29 Jan 2020 10:31:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yA0q=3S=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iwkcd-0005iC-T3
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 10:30:59 +0000
X-Inumbo-ID: 70132696-4282-11ea-886c-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70132696-4282-11ea-886c-12813bfff9fa;
 Wed, 29 Jan 2020 10:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580293858;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mKquKd8Haln6d/Y+jmxZ6PMXfBz1L/SmNEsuqZz8Rqk=;
 b=CENAqroFB+1lgicrGHsg4mUITu3zjwjB+Z18N+9R64icUjNL0CSA/3zy
 i8Dj9mi/UkR5k40FEK0F644ZFLr55nZNp0mTDC7pT7FmNJUrHrExkMEM+
 OYbK4UpcPlKdcHUuwjnFOwIFLKGB/OgZcaAcQB0fRsSX1b6vUNf+F+XLm w=;
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
IronPort-SDR: 0oiDpGE+FzdwaJgCHTFT6W5lcAVk6FqaqC3aZeqdrbN0RBroOqSQb6ubaBQ9cLkGN15mhBHAHz
 PQDK3LnCWi65OUA2XDTt9FkcvYcaZS7KqzADcL5I7DtHwNbjF9PAPVQCXnJ1HaNmiImbc6DE0P
 OD0kyIWaGX7txto8PG7xairLRfKIzgWUsADMhQHdOA6C3DTx3CgHh1mvuf+Hg6Fu+ikYkQWFTk
 18NcWc8tv/yTEh2mWb+pRmckFV7v4ztvxTEI7UDbRFRIJRnM1eortgP5eTVWsrHbUJTJY5NffU
 6so=
X-SBRS: 2.7
X-MesageID: 11975802
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,377,1574139600"; d="scan'208";a="11975802"
Date: Wed, 29 Jan 2020 11:30:50 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Varad Gautam <vrd@amazon.de>
Message-ID: <20200129103050.GV57924@desktop-tdan49n.eng.citrite.net>
References: <1580290087-20636-1-git-send-email-vrd@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1580290087-20636-1-git-send-email-vrd@amazon.de>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3] x86: irq: Do not BUG_ON multiple unbind
 calls for shared pirqs
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
Cc: xen-devel@lists.xenproject.org, Julien
 Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpUaGFua3MgZm9yIHRoZSBwYXRjaCEgTmV4dCB0aW1lIGNvdWxkIHlvdSBwbGVhc2Ug
dHJ5IHRvIHJlcGx5IHRvIHRoZQpwcmV2aW91cyBxdWVzdGlvbnMgYmVmb3JlIHNlbmRpbmcgYSBu
ZXcgdmVyc2lvbjoKCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94
ZW4tZGV2ZWwvMjAxOS0wNy9tc2cwMDI1Ny5odG1sCgpPbiBXZWQsIEphbiAyOSwgMjAyMCBhdCAx
MDoyODowN0FNICswMTAwLCBWYXJhZCBHYXV0YW0gd3JvdGU6Cj4gWEVOX0RPTUNUTF9kZXN0cm95
ZG9tYWluIGNyZWF0ZXMgYSBjb250aW51YXRpb24gaWYgZG9tYWluX2tpbGwgLUVSRVNUQVJUUy4K
PiBJbiB0aGF0IHNjZW5hcmlvLCBpdCBpcyBwb3NzaWJsZSB0byByZWNlaXZlIG11bHRpcGxlIF9w
aXJxX2d1ZXN0X3VuYmluZAo+IGNhbGxzIGZvciB0aGUgc2FtZSBwaXJxIGZyb20gZG9tYWluX2tp
bGwsIGlmIHRoZSBwaXJxIGhhcyBub3QgeWV0IGJlZW4KPiByZW1vdmVkIGZyb20gdGhlIGRvbWFp
bidzIHBpcnFfdHJlZSwgYXM6Cj4gICBkb21haW5fa2lsbCgpCj4gICAgIC0+IGRvbWFpbl9yZWxp
bnF1aXNoX3Jlc291cmNlcygpCj4gICAgICAgLT4gcGNpX3JlbGVhc2VfZGV2aWNlcygpCj4gICAg
ICAgICAtPiBwY2lfY2xlYW5fZHBjaV9pcnEoKQo+ICAgICAgICAgICAtPiBwaXJxX2d1ZXN0X3Vu
YmluZCgpCj4gICAgICAgICAgICAgLT4gX19waXJxX2d1ZXN0X3VuYmluZCgpCj4gCj4gRm9yIGEg
c2hhcmVkIHBpcnEgKG5yX2d1ZXN0cyA+IDEpLCB0aGUgZmlyc3QgY2FsbCB3b3VsZCB6YXAgdGhl
IGN1cnJlbnQKPiBkb21haW4gZnJvbSB0aGUgcGlycSdzIGd1ZXN0c1tdIGxpc3QsIGJ1dCB0aGUg
YWN0aW9uIGhhbmRsZXIgaXMgbmV2ZXIgZnJlZWQKPiBhcyB0aGVyZSBhcmUgb3RoZXIgZ3Vlc3Rz
IHVzaW5nIHRoaXMgcGlycS4gQXMgYSByZXN1bHQsIG9uIHRoZSBzZWNvbmQgY2FsbCwKPiBfX3Bp
cnFfZ3Vlc3RfdW5iaW5kIHNlYXJjaGVzIGZvciB0aGUgY3VycmVudCBkb21haW4gd2hpY2ggaGFz
IGJlZW4gcmVtb3ZlZAo+IGZyb20gdGhlIGd1ZXN0c1tdIGxpc3QsIGFuZCBoaXRzIGEgQlVHX09O
Lgo+IAo+IE1ha2UgX19waXJxX2d1ZXN0X3VuYmluZCBzYWZlIHRvIGJlIGNhbGxlZCBtdWx0aXBs
ZSB0aW1lcyBieSBsZXR0aW5nIHhlbgo+IGNvbnRpbnVlIGlmIGEgc2hhcmVkIHBpcnEgaGFzIGFs
cmVhZHkgYmVlbiB1bmJvdW5kIGZyb20gdGhpcyBndWVzdC4gVGhlCj4gUElSUSB3aWxsIGJlIGNs
ZWFuZWQgdXAgZnJvbSB0aGUgZG9tYWluJ3MgcGlycV90cmVlIGR1cmluZyB0aGUgZGVzdHJ1Y3Rp
b24KPiBpbiBjb21wbGV0ZV9kb21haW5fZGVzdHJveSBhbnl3YXlzLgoKU28gQUZBSUNUIHRoaXMg
aXMgYmVjYXVzZSBwdF9waXJxX3NvZnRpcnFfYWN0aXZlKCkgcmV0dXJucyB0cnVlIGluCnBjaV9j
bGVhbl9kcGNpX2lycSgpIGFuZCBoZW5jZSB0aGUgaXRlcmF0aW9uIGlzIHN0b3BwZWQgYW5kCmh2
bV9kb21haW5faXJxKGQpLT5kcGNpIGlzIG5vdCBzZXQgdG8gTlVMTC4KCldvdWxkIGl0IGJlIHBv
c3NpYmxlIHRvIGNsZWFuIHRoZSBhbHJlYWR5IHByb2Nlc3NlZCBJUlFzIGZyb20gdGhlCmRvbWFp
biBwaXJxX3RyZWU/CgpwY2lfY2xlYW5fZHBjaV9pcnEoKSBhbHJlYWR5IHNlZW1zIHRvIGZyZWUg
cGFydCBvZiB0aGlzIHN0cnVjdHVyZSwgYW5kCndvdWxkIGJlIG5pY2VyIElNTyBpZiB3ZSBkaWRu
J3QgbGVhdmUgY2xlYW5lZCB1cCBzdHVmZiBiZWhpbmQgb24KRVJFU1RBUlQuCgpUaGFua3MsIFJv
Z2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
