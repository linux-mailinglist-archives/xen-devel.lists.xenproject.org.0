Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 745EC3B978
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 18:33:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haN9z-0000a0-R8; Mon, 10 Jun 2019 16:28:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CttF=UJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1haN9y-0000Zv-Qa
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 16:28:38 +0000
X-Inumbo-ID: cc2f7da2-8b9c-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cc2f7da2-8b9c-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 16:28:37 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nTGTnh8+3PSuwKsFnYIkmxkAzE8BsgxS23YrJMTpBcM3tAB1bO/KkEfG7hFjydv15iwz2zpVgB
 I5/HhxCr6/rXWCXDoxbgcFMMGfcBIQYEeA4NnlilUTTpigtwlp3i1yYVdL6WEN+h2gt5/8WXIA
 tNzgaCjPwreCZZ1QlFGRDFelxNDLqyQdjZUJ6qE44HMSMCYrbfZDtp1uNxDjoLi9++z7ysdmtZ
 imp3DtCJGYq1P1dgupNmacD/ACFmVgAehEHoGzEdNp3DWAXGRpusyEGbZ4vzTeKifP55Xnppw1
 rls=
X-SBRS: 2.7
X-MesageID: 1538594
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,575,1557201600"; 
   d="scan'208";a="1538594"
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5CE68CD30200007800231B01@prv1-mh.provo.novell.com>
 <5CE68F830200007800231B3B@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <483c4bbc-4915-48a3-9295-4d5a2bf6a02e@citrix.com>
Date: Mon, 10 Jun 2019 17:28:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5CE68F830200007800231B3B@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 3/5] x86/AMD: make C-state handling
 independent of Dom0
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
Cc: Wei Liu <wei.liu2@citrix.com>, Brian Woods <brian.woods@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMvMDUvMjAxOSAxMzoxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQXQgbGVhc3QgZm9yIG1v
cmUgcmVjZW50IENQVXMsIGZvbGxvd2luZyB3aGF0IEJLREcgLyBQUFIgc3VnZ2VzdCBmb3IgdGhl
Cj4gQklPUyB0byBzdXJmYWNlIHZpYSBBQ1BJIHdlIGNhbiBtYWtlIG91cnNlbHZlcyBpbmRlcGVu
ZGVudCBvZiBEb20wCj4gdXBsb2FkaW5nIHJlc3BlY3RpdmUgZGF0YS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAtLS0KPiBUQkQ6IENhbiB3ZSBz
ZXQgbG9jYWxfYXBpY190aW1lcl9jMl9vayB0byB0cnVlPyBJIGNhbid0IHNlZW0gdG8gZmluZCBh
bnkKPiAgICAgIHN0YXRlbWVudCBpbiB0aGUgQktERyAvIFBQUiBhcyB0byB3aGV0aGVyIHRoZSBM
QVBJQyB0aW1lciBjb250aW51ZXMKPiAgICAgIHJ1bm5pbmcgaW4gQ0M2LgoKVGhpcyBvdWdodCB0
byBiZSBlYXN5IHRvIGRldGVybWluZS7CoCBHaXZlbiB0aGUgZGVzY3JpcHRpb24gb2YgQ0M2CmZs
dXNoaW5nIHRoZSBjYWNoZSBhbmQgcG93ZXIgZ2F0aW5nIHRoZSBjb3JlLCBJJ2Qgc2F5IHRoZXJl
IGlzIGEKcmVhc29uYWJsZSBjaGFuY2UgdGhhdCB0aGUgTEFQSUMgdGltZXIgc3RvcHMgaW4gQ0M2
LgoKPiBUQkQ6IFdlIG1heSB3YW50IHRvIHZlcmlmeSB0aGF0IEhMVCBpbmRlZWQgaXMgY29uZmln
dXJlZCB0byBlbnRlciBDQzYuCgpJIGNhbid0IGFjdHVhbGx5IHNwb3QgYW55dGhpbmcgd2hpY2gg
dGFsa3MgYWJvdXQgSExUIGRpcmVjdGx5LsKgIFRoZQpjbG9zZXN0IEkgY2FuIHBvc3QgaXMgQ0ZP
SCAoY2FjaGUgZmx1c2ggb24gaGFsdCkgd2hpY2ggaXMgYW4KYXV0by10cmFuc2l0aW9uIGZyb20g
Q0MxIHRvIENDNiBhZnRlciBhIHNwZWNpZmljIHRpbWVvdXQsIGJ1dCB0aGUKd29yZGluZyBzdWdn
ZXN0cyB0aGF0IG13YWl0IHdvdWxkIGFsc28gdGFrZSB0aGlzIHBhdGguCgo+IFRCRDogQnJpYW4n
cyBzZXJpZXMgc3BlY2lmaWVzIC50YXJnZXRfcmVzaWRlbmN5IGFzIDEwMDAgZm9yIENDNjsgbWF5
Cj4gICAgICB3YW50IHRvIGRvIHNvIGhlcmUgYXMgd2VsbC4gUXVlc3Rpb24gdGhlbiBpcyB3aGV0
aGVyIHRoaXMgdmFsdWUgaXMKPiAgICAgIGFsc28gc3VpdGFibGUgZm9yIHRoZSBvbGRlciBmYW1p
bGllcy4KCldlbGwgLSB0aGUgUFBSIGRvZXMgc2F5IDQwMC4KCj4gVEJEOiBJIGd1ZXNzIHdlIGNv
dWxkIGV4dGVuZCB0aGlzIHRvIGZhbWlsaWVzIG9sZGVyIHRoZW4gRmFtMTUgYXMgd2VsbC4KPgo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdV9pZGxlLmMKPiArKysgYi94ZW4vYXJjaC94ODYv
YWNwaS9jcHVfaWRsZS5jCj4gQEAgLTEyODMsNiArMTI4OCw5OCBAQCBsb25nIHNldF9jeF9wbWlu
Zm8odWludDMyX3QgYWNwaV9pZCwgc3RyCj4gICAgICByZXR1cm4gMDsKPiAgfQo+ICAKPiArc3Rh
dGljIHZvaWQgYW1kX2NwdWlkbGVfaW5pdChzdHJ1Y3QgYWNwaV9wcm9jZXNzb3JfcG93ZXIgKnBv
d2VyKQo+ICt7Cj4gKyAgICB1bnNpZ25lZCBpbnQgaSwgbnIgPSAwOwo+ICsgICAgY29uc3Qgc3Ry
dWN0IGNwdWluZm9feDg2ICpjID0gJmN1cnJlbnRfY3B1X2RhdGE7Cj4gKyAgICBjb25zdCB1bnNp
Z25lZCBpbnQgZWN4X3JlcSA9IENQVUlENV9FQ1hfRVhURU5TSU9OU19TVVBQT1JURUQgfAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBDUFVJRDVfRUNYX0lOVEVSUlVQVF9CUkVB
SzsKPiArICAgIGNvbnN0IHN0cnVjdCBhY3BpX3Byb2Nlc3Nvcl9jeCAqY3ggPSBOVUxMOwo+ICsg
ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBhY3BpX3Byb2Nlc3Nvcl9jeCBmYW0xN1tdID0gewo+ICsg
ICAgICAgIHsKPiArICAgICAgICAgICAgLnR5cGUgPSBBQ1BJX1NUQVRFX0MxLAo+ICsgICAgICAg
ICAgICAuZW50cnlfbWV0aG9kID0gQUNQSV9DU1RBVEVfRU1fRkZILAo+ICsgICAgICAgICAgICAu
YWRkcmVzcyA9IDAsCj4gKyAgICAgICAgICAgIC5sYXRlbmN5ID0gMSwKPiArICAgICAgICB9LAo+
ICsgICAgICAgIHsKPiArICAgICAgICAgICAgLnR5cGUgPSBBQ1BJX1NUQVRFX0MyLAo+ICsgICAg
ICAgICAgICAuZW50cnlfbWV0aG9kID0gQUNQSV9DU1RBVEVfRU1fSEFMVCwKPiArICAgICAgICAg
ICAgLmxhdGVuY3kgPSA0MDAsCj4gKyAgICAgICAgfSwKPiArICAgIH07Cj4gKwo+ICsgICAgaWYg
KCBwbV9pZGxlX3NhdmUgJiYgcG1faWRsZSAhPSBhY3BpX3Byb2Nlc3Nvcl9pZGxlICkKPiArICAg
ICAgICByZXR1cm47Cj4gKwo+ICsgICAgaWYgKCB2ZW5kb3Jfb3ZlcnJpZGUgPCAwICkKPiArICAg
ICAgICByZXR1cm47Cj4gKwo+ICsgICAgc3dpdGNoICggYy0+eDg2ICkKPiArICAgIHsKPiArICAg
IGNhc2UgMHgxNzoKCldpdGggSHlnb24gaW4gdGhlIG1peCwgdGhpcyBzaG91bGQgYmUgZXhwYW5k
ZWQgdG8gRmFtMThoLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
