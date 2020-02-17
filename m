Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D23416125A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 13:51:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3fqO-0008Rk-BK; Mon, 17 Feb 2020 12:49:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sxmF=4F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j3fqM-0008Ra-IT
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 12:49:46 +0000
X-Inumbo-ID: f9740968-5183-11ea-ade5-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9740968-5183-11ea-ade5-bc764e2007e4;
 Mon, 17 Feb 2020 12:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581943785;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Q0Ua8Udjh8Qvvc8P/LnUoreAZvrvU5I1tPwAvIzWFhQ=;
 b=QJLebVogZLbbJicHQ66iRYh591QGAj2WgTFrI8xyhsVXRsvoLSAYbKEU
 P4bAfmj4QhR0F6Ppuw7ysLXxmLtMsLftHXCAB4HIyiRDv/qL1cqpLjxJp
 XuW4bBHdtwynt4mt4RYzgpxVeupwklxollsycKVVpBv85h3dh1fs6MJoa E=;
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
IronPort-SDR: u9/7VN0M5K31iKNDJkznujPtov1vpXcCG9GA5Xi8X0IS8IUNbhfD41OK1qVukz9IBdtYEAaEkw
 ZfUD/KzHLbgKR46NjeYkhjKy34jua6+a4OgnPm0FprRQ8CZg4i1hWUGJPW9Ve1EsJcP/3v7CjJ
 cj3wFq2SeuzlgGAZgIWjKpg012UGZ+bzPbOPuhJJr9M2+nMrg+2//wY8zTYGDhQtBNIJvXLMGT
 o/4V2AjZUwizBWtShgc336sby14eYdbKwvnsS0n49Q1Z2e41soDkuJDBXa/UiqKpxAMKPurNOV
 R3A=
X-SBRS: 2.7
X-MesageID: 12994743
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,452,1574139600"; d="scan'208";a="12994743"
Date: Mon, 17 Feb 2020 13:49:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20200217124937.GK4679@Air-de-Roger>
References: <20200217072006.20211-1-jgross@suse.com>
 <20200217072006.20211-3-jgross@suse.com>
 <0e8018be-7551-9bdf-fc6a-fb388579ff18@xen.org>
 <4f29d05c-db7d-c1da-2fd9-8eed7dcdc587@suse.com>
 <20200217121704.GJ4679@Air-de-Roger>
 <ac1cc737-3fd2-a184-1df1-ce7279b23067@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ac1cc737-3fd2-a184-1df1-ce7279b23067@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/2] xen/rcu: don't use stop_machine_run()
 for rcu_barrier()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMDE6MzI6NTlQTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAxNy4wMi4yMCAxMzoxNywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IE1vbiwgRmViIDE3LCAyMDIwIGF0IDAxOjExOjU5UE0gKzAxMDAsIErDvHJnZW4gR3Jvw58gd3Jv
dGU6Cj4gPiA+IE9uIDE3LjAyLjIwIDEyOjQ5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+ID4g
SGkgSnVlcmdlbiwKPiA+ID4gPiAKPiA+ID4gPiBPbiAxNy8wMi8yMDIwIDA3OjIwLCBKdWVyZ2Vu
IEdyb3NzIHdyb3RlOgo+ID4gPiA+ID4gK3ZvaWQgcmN1X2JhcnJpZXIodm9pZCkKPiA+ID4gPiA+
ICDCoCB7Cj4gPiA+ID4gPiAtwqDCoMKgIGF0b21pY190IGNwdV9jb3VudCA9IEFUT01JQ19JTklU
KDApOwo+ID4gPiA+ID4gLcKgwqDCoCByZXR1cm4gc3RvcF9tYWNoaW5lX3J1bihyY3VfYmFycmll
cl9hY3Rpb24sICZjcHVfY291bnQsIE5SX0NQVVMpOwo+ID4gPiA+ID4gK8KgwqDCoCBpZiAoICFh
dG9taWNfY21weGNoZygmY3B1X2NvdW50LCAwLCBudW1fb25saW5lX2NwdXMoKSkgKQo+ID4gPiA+
IAo+ID4gPiA+IFdoYXQgZG9lcyBwcmV2ZW50IHRoZSBjcHVfb25saW5lX21hcCB0byBjaGFuZ2Ug
dW5kZXIgeW91ciBmZWV0Pwo+ID4gPiA+IFNob3VsZG4ndCB5b3UgZ3JhYiB0aGUgbG9jayB2aWEg
Z2V0X2NwdV9tYXBzKCk/Cj4gPiA+IAo+ID4gPiBPaCwgaW5kZWVkLgo+ID4gPiAKPiA+ID4gVGhp
cyBpbiB0dXJuIHdpbGwgcmVxdWlyZSBhIG1vZGlmaWNhdGlvbiBvZiB0aGUgbG9naWMgdG8gZGV0
ZWN0IHBhcmFsbGVsCj4gPiA+IGNhbGxzIG9uIG11bHRpcGxlIGNwdXMuCj4gPiAKPiA+IElmIHlv
dSBwaWNrIG15IHBhdGNoIHRvIHR1cm4gdGhhdCBpbnRvIGEgcncgbG9jayB5b3Ugc2hvdWxkbid0
IHdvcnJ5Cj4gPiBhYm91dCBwYXJhbGxlbCBjYWxscyBJIHRoaW5rLCBidXQgdGhlIGxvY2sgYWNx
dWlzaXRpb24gY2FuIHN0aWxsIGZhaWwKPiA+IGlmIHRoZXJlJ3MgYSBDUFUgcGx1Zy91bnBsdWcg
Z29pbmcgb246Cj4gPiAKPiA+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMv
aHRtbC94ZW4tZGV2ZWwvMjAyMC0wMi9tc2cwMDk0MC5odG1sCj4gCj4gVGhhbmtzLCBidXQgbGV0
dGluZyByY3VfYmFycmllcigpIGZhaWwgaXMgYSBubyBnbywgc28gSSBzdGlsbCBuZWVkIHRvCj4g
aGFuZGxlIHRoYXQgY2FzZSAoSSBtZWFuIHRoZSBjYXNlIGZhaWxpbmcgdG8gZ2V0IHRoZSBsb2Nr
KS4gQW5kIGhhbmRsaW5nCj4gb2YgcGFyYWxsZWwgY2FsbHMgaXMgbm90IG5lZWRlZCB0byBiZSBm
dW5jdGlvbmFsIGNvcnJlY3QsIGJ1dCB0byBhdm9pZAo+IG5vdCBuZWNlc3NhcnkgY3B1IHN5bmNo
cm9uaXphdGlvbiAoZWFjaCBwYXJhbGxlbCBjYWxsIGRldGVjdGVkIGNhbiBqdXN0Cj4gd2FpdCB1
bnRpbCB0aGUgbWFzdGVyIGhhcyBmaW5pc2hlZCBhbmQgdGhlbiByZXR1cm4pLgo+Cj4gQlRXIC0g
VGhlIHJlY3Vyc2l2ZSBzcGlubG9jayB0b2RheSB3b3VsZCBhbGxvdyBmb3IgZS5nLiByY3VfYmFy
cmllcigpIHRvCj4gYmUgY2FsbGVkIGluc2lkZSBhIENQVSBwbHVnL3VucGx1ZyBzZWN0aW9uLiBZ
b3VyIHJ3bG9jayBpcyByZW1vdmluZyB0aGF0Cj4gcG9zc2liaWxpdHkuIEFueSBjaGFuY2UgdGhh
dCBjb3VsZCBiZSBoYW5kbGVkPwoKV2hpbGUgdGhpcyBtaWdodCBiZSBpbnRlcmVzdGluZyBmb3Ig
dGhlIHJjdSBzdHVmZiwgaXQgY2VydGFpbmx5IGlzbid0CmZvciBvdGhlciBwaWVjZXMgYWxzbyBy
ZWx5aW5nIG9uIHRoZSBjcHUgbWFwcyBsb2NrLgoKSWU6IGdldF9jcHVfbWFwcyBtdXN0IGZhaWwg
d2hlbiBjYWxsZWQgYnkgc2VuZF9JUElfbWFzayBpZiB0aGVyZSdzIGEKQ1BVIHBsdWcvdW5wbHVn
IG9wZXJhdGlvbiBnb2luZyBvbiwgZXZlbiBpZiBpdCdzIG9uIHRoZSBzYW1lIHBDUFUKdGhhdCdz
IGhvbGRpbmcgdGhlIGxvY2sgaW4gd3JpdGUgbW9kZS4KCkkgZ3Vlc3MgeW91IGNvdWxkIGFkZCBh
IHBDUFUgdmFyaWFibGUgdG8gcmVjb3JkIHdoZXRoZXIgdGhlIGN1cnJlbnQKcENQVSBpcyBpbiB0
aGUgbWlkZGxlIG9mIGEgQ1BVIHBsdWcvdW5wbHVnIG9wZXJhdGlvbiAoYW5kIGhlbmNlIGhhcwp0
aGUgbWFwcyBsb2NrZWQgaW4gd3JpdGUgbW9kZSkgYW5kIGF2b2lkIHRha2luZyB0aGUgbG9jayBp
biB0aGF0IGNhc2U/CgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
