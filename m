Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9274E167919
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 10:13:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j54KB-0008Ko-Ks; Fri, 21 Feb 2020 09:10:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nwZw=4J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j54KA-0008Kj-1L
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 09:10:18 +0000
X-Inumbo-ID: f9dd1666-5489-11ea-8600-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9dd1666-5489-11ea-8600-12813bfff9fa;
 Fri, 21 Feb 2020 09:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582276217;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lHCIJnU5IEJGJAoIsaWMHKytw/XE6e1bKXyxWbV/c2c=;
 b=Qfu5q85mcwRydazDpWxnFNDiZ5+MOM3R+fxTCxCjflC+pCZ4ajOR2pG9
 MVLJY1KEXZC/L5UCx68Mq/x/BvhsiX5DjpPIOsthvuUzVk0790Mdwuuzu
 qqJLhHzyOPeWzwvpaR64TYDKiEv7vmJ+Y7XpZrPu01C3Ss2Py9n3oIgze E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lOVzvRssof5EBLLWtOsuJYdV7uaKlNoxGteBiwB/4dBtJBIhfMp2CQCU4MBOxPlgmJMkNoeCj4
 DqjlRdfxG+n0785cuIaEUe8NwBfq4bFkPDiMSqx1I6M2RJpcnsXQMFJlv+LmRAYaDcpIh15y2B
 z1psPbZKWEB8mVdNRZZ3omLgdBF1xvcJS0OwPHm4yi9ksHTjFf/nUrfkkNEYNV2Qr6gajs0YLA
 EsV7glPkm+WSu+yLmULvU5rrj7b1KsC2cyNsP3yzWuFrpEPp+iGkovuz4gyuEmBn8Za6mlQ+dT
 1x0=
X-SBRS: 2.7
X-MesageID: 12810283
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,467,1574139600"; d="scan'208";a="12810283"
Date: Fri, 21 Feb 2020 10:10:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200221091005.GT4679@Air-de-Roger>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <83d48223-21eb-be54-985c-085449661892@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] rwlock: allow recursive read locking
 when already locked in write mode
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDc6MjA6MDZQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpLAo+IAo+IE9uIDIwLzAyLzIwMjAgMTc6MzEsIFJvZ2VyIFBhdSBNb25uZSB3cm90
ZToKPiA+IEFsbG93IGEgQ1BVIGFscmVhZHkgaG9sZGluZyB0aGUgbG9jayBpbiB3cml0ZSBtb2Rl
IHRvIGFsc28gbG9jayBpdCBpbgo+ID4gcmVhZCBtb2RlLiBUaGVyZSdzIG5vIGhhcm0gaW4gYWxs
b3dpbmcgcmVhZCBsb2NraW5nIGEgcndsb2NrIHRoYXQncwo+ID4gYWxyZWFkeSBvd25lZCBieSB0
aGUgY2FsbGVyIChpZTogQ1BVKSBpbiB3cml0ZSBtb2RlLiBBbGxvd2luZyBzdWNoCj4gPiBhY2Nl
c3NlcyBpcyByZXF1aXJlZCBhdCBsZWFzdCBmb3IgdGhlIENQVSBtYXBzIHVzZS1jYXNlLgo+ID4g
Cj4gPiBJbiBvcmRlciB0byBkbyB0aGlzIHJlc2VydmUgMTRiaXRzIG9mIHRoZSBsb2NrLCB0aGlz
IGFsbG93cyB0byBzdXBwb3J0Cj4gPiB1cCB0byAxNjM4NCBDUFVzLiBBbHNvIHJlZHVjZSB0aGUg
d3JpdGUgbG9jayBtYXNrIHRvIDIgYml0czogb25lIHRvCj4gPiBzaWduYWwgdGhlcmUgYXJlIHBl
bmRpbmcgd3JpdGVycyB3YWl0aW5nIG9uIHRoZSBsb2NrIGFuZCB0aGUgb3RoZXIgdG8KPiA+IHNp
Z25hbCB0aGUgbG9jayBpcyBvd25lZCBpbiB3cml0ZSBtb2RlLiBOb3RlIHRoZSB3cml0ZSByZWxh
dGVkIGRhdGEKPiA+IGlzIHVzaW5nIDE2Yml0cywgdGhpcyBpcyBkb25lIGluIG9yZGVyIHRvIGJl
IGFibGUgdG8gY2xlYXIgaXQgKGFuZAo+ID4gdGh1cyByZWxlYXNlIHRoZSBsb2NrKSB1c2luZyBh
IDE2Yml0IGF0b21pYyB3cml0ZS4KPiA+IAo+ID4gVGhpcyByZWR1Y2VzIHRoZSBtYXhpbXVtIG51
bWJlciBvZiBjb25jdXJyZW50IHJlYWRlcnMgZnJvbSAxNjc3NzIxNiB0bwo+ID4gNjU1MzYsIEkg
dGhpbmsgdGhpcyBzaG91bGQgc3RpbGwgYmUgZW5vdWdoLCBvciBlbHNlIHRoZSBsb2NrIGZpZWxk
Cj4gPiBjYW4gYmUgZXhwYW5kZWQgZnJvbSAzMiB0byA2NGJpdHMgaWYgYWxsIGFyY2hpdGVjdHVy
ZXMgc3VwcG9ydCBhdG9taWMKPiA+IG9wZXJhdGlvbnMgb24gNjRiaXQgaW50ZWdlcnMuCj4gCj4g
RldJVywgYXJtMzIgaXMgYWJsZSB0byBzdXBwb3J0IGF0b21pYyBvcGVyYXRpb25zIG9uIDY0LWJp
dCBpbnRlZ2Vycy4KPiAKPiA+ICAgc3RhdGljIGlubGluZSB2b2lkIF93cml0ZV91bmxvY2socnds
b2NrX3QgKmxvY2spCj4gPiAgIHsKPiA+IC0gICAgLyoKPiA+IC0gICAgICogSWYgdGhlIHdyaXRl
ciBmaWVsZCBpcyBhdG9taWMsIGl0IGNhbiBiZSBjbGVhcmVkIGRpcmVjdGx5Lgo+ID4gLSAgICAg
KiBPdGhlcndpc2UsIGFuIGF0b21pYyBzdWJ0cmFjdGlvbiB3aWxsIGJlIHVzZWQgdG8gY2xlYXIg
aXQuCj4gPiAtICAgICAqLwo+ID4gLSAgICBhdG9taWNfc3ViKF9RV19MT0NLRUQsICZsb2NrLT5j
bnRzKTsKPiA+ICsgICAgLyogU2luY2UgdGhlIHdyaXRlciBmaWVsZCBpcyBhdG9taWMsIGl0IGNh
biBiZSBjbGVhcmVkIGRpcmVjdGx5LiAqLwo+ID4gKyAgICBBU1NFUlQoX2lzX3dyaXRlX2xvY2tl
ZF9ieV9tZShhdG9taWNfcmVhZCgmbG9jay0+Y250cykpKTsKPiA+ICsgICAgQlVJTERfQlVHX09O
KF9RUl9TSElGVCAhPSAxNik7Cj4gPiArICAgIHdyaXRlX2F0b21pYygodWludDE2X3QgKikmbG9j
ay0+Y250cywgMCk7Cj4gCj4gSSB0aGluayB0aGlzIGlzIGFuIGFidXNlIHRvIGNhc3QgYW4gYXRv
bWljX3QoKSBkaXJlY3RseSBpbnRvIGEgdWludDE2X3QuIFlvdQo+IHdvdWxkIGF0IGxlYXN0IHdh
bnQgdG8gdXNlICZsb2NrLT5jbnRzLmNvdW50ZXIgaGVyZS4KClN1cmUsIEkgd2FzIHdvbmRlcmlu
ZyBhYm91dCB0aGlzIG15c2VsZi4KCldpbGwgd2FpdCBmb3IgbW9yZSBjb21tZW50cywgbm90IHN1
cmUgd2hldGhlciB0aGlzIGNhbiBiZSBmaXhlZCB1cG9uCmNvbW1pdCBpZiB0aGVyZSBhcmUgbm8g
b3RoZXIgaXNzdWVzLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
