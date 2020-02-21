Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ED4167AC2
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 11:25:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j55RH-0007GB-0P; Fri, 21 Feb 2020 10:21:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nwZw=4J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j55RF-0007G6-QD
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 10:21:41 +0000
X-Inumbo-ID: f2e48768-5493-11ea-861b-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2e48768-5493-11ea-861b-12813bfff9fa;
 Fri, 21 Feb 2020 10:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582280500;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=szw5kUCBwfMR4Umcye1UsaTnnWME1Rw3d5ErMmAgp5Q=;
 b=H7slmdIbdR0cjoXvT8uDo/X6KgfWwqmZR+jgSLFB/GV7MJoB8UUtC2h1
 dET46Cj4M72SXIgMsKfydEFjAWo8rW7p3+MeYhaGGfOUU5JpbssslE3Z0
 i7u7Fch8Gd3gRuVmRiycBdvPsDRAifE0BYVAlbDzGX+ZqkGwRrbPhzUFv 4=;
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
IronPort-SDR: QEFBJckE/MYkvO2flXPlpJQt4Otkt0cu31Hi8oseCOIldyuYhI4sG/WgtjoU3dqM8aobRm4cza
 BxgWJnLKK6ZDvkNxA2rHcJKaR9vO6P7KJs3kG9lY1MfghynCwXfmNppiLeicgubrKuiqo1Fp/3
 pT0BMg+orHucSFRXhRTwIVHLS35iD+RLBJkiXqk4tRcaujIhh9XTXNUi/k+EbebNfX3kzbj8BJ
 L/ofjVQpTcO38wip8DTDbTm9fbWxG9KrnTUIm30Odti4icb8IAzr0zDY/JpPQYsftQMCxbG/61
 qk0=
X-SBRS: 2.7
X-MesageID: 12791624
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,467,1574139600"; d="scan'208";a="12791624"
Date: Fri, 21 Feb 2020 11:21:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <20200221102130.GW4679@Air-de-Roger>
References: <20200218091611.GN4679@Air-de-Roger>
 <20200219180424.GA17584@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200220083904.GI4679@Air-de-Roger>
 <f986b845491b47cc8469d88e2e65e2a7@EX13D32EUC003.ant.amazon.com>
 <20200220154507.GO4679@Air-de-Roger>
 <c9662397256a4568a5cc7d70a84940e5@EX13D32EUC003.ant.amazon.com>
 <20200220164839.GR4679@Air-de-Roger>
 <e42fa35800f04b6f953e4af87f2c1a02@EX13D32EUC003.ant.amazon.com>
 <20200221092219.GU4679@Air-de-Roger>
 <5ddf980a3fba4fb39571184e688cefc5@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5ddf980a3fba4fb39571184e688cefc5@EX13D32EUC003.ant.amazon.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [RFC PATCH v3 06/12] xen-blkfront: add callbacks
 for PM suspend and hibernation
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
Cc: "Valentin, Eduardo" <eduval@amazon.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "hpa@zytor.com" <hpa@zytor.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "fllinden@amaozn.com" <fllinden@amaozn.com>, "x86@kernel.org" <x86@kernel.org>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Singh,
 Balbir" <sblbir@amazon.com>, "len.brown@intel.com" <len.brown@intel.com>,
 "jgross@suse.com" <jgross@suse.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "Agarwal,
 Anchal" <anchalag@amazon.com>, "bp@alien8.de" <bp@alien8.de>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "axboe@kernel.dk" <axboe@kernel.dk>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "Kamata,
 Munehisa" <kamatam@amazon.com>, "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMDk6NTY6NTRBTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IFNlbnQ6IDIxIEZlYnJ1YXJ5IDIwMjAg
MDk6MjIKPiA+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+Cj4gPiBD
YzogQWdhcndhbCwgQW5jaGFsIDxhbmNoYWxhZ0BhbWF6b24uY29tPjsgVmFsZW50aW4sIEVkdWFy
ZG8KPiA+IDxlZHV2YWxAYW1hem9uLmNvbT47IGxlbi5icm93bkBpbnRlbC5jb207IHBldGVyekBp
bmZyYWRlYWQub3JnOwo+ID4gYmVuaEBrZXJuZWwuY3Jhc2hpbmcub3JnOyB4ODZAa2VybmVsLm9y
ZzsgbGludXgtbW1Aa3ZhY2sub3JnOwo+ID4gcGF2ZWxAdWN3LmN6OyBocGFAenl0b3IuY29tOyB0
Z2x4QGxpbnV0cm9uaXguZGU7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7Cj4gPiBmbGxpbmRlbkBh
bWFvem4uY29tOyBLYW1hdGEsIE11bmVoaXNhIDxrYW1hdGFtQGFtYXpvbi5jb20+Owo+ID4gbWlu
Z29AcmVkaGF0LmNvbTsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBTaW5naCwgQmFs
YmlyCj4gPiA8c2JsYmlyQGFtYXpvbi5jb20+OyBheGJvZUBrZXJuZWwuZGs7IGtvbnJhZC53aWxr
QG9yYWNsZS5jb207Cj4gPiBicEBhbGllbjguZGU7IGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29t
OyBqZ3Jvc3NAc3VzZS5jb207Cj4gPiBuZXRkZXZAdmdlci5rZXJuZWwub3JnOyBsaW51eC1wbUB2
Z2VyLmtlcm5lbC5vcmc7IHJqd0Byand5c29ja2kubmV0Owo+ID4gbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZzsgdmt1em5ldHNAcmVkaGF0LmNvbTsgZGF2ZW1AZGF2ZW1sb2Z0Lm5ldDsKPiA+
IFdvb2Rob3VzZSwgRGF2aWQgPGR3bXdAYW1hem9uLmNvLnVrPgo+ID4gU3ViamVjdDogUmU6IFtY
ZW4tZGV2ZWxdIFtSRkMgUEFUQ0ggdjMgMDYvMTJdIHhlbi1ibGtmcm9udDogYWRkIGNhbGxiYWNr
cwo+ID4gZm9yIFBNIHN1c3BlbmQgYW5kIGhpYmVybmF0aW9uCj4gPiAKPiA+IE9uIFRodSwgRmVi
IDIwLCAyMDIwIGF0IDA1OjAxOjUyUE0gKzAwMDAsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4gPiA+
ID4gPiBIb3BlZnVsbHkgd2hhdCBJIHNhaWQgYWJvdmUgaWxsdXN0cmF0ZXMgd2h5IGl0IG1heSBu
b3QgYmUgMTAwJQo+ID4gY29tbW9uLgo+ID4gPiA+Cj4gPiA+ID4gWWVzLCB0aGF0J3MgZmluZS4g
SSBkb24ndCBleHBlY3QgaXQgdG8gYmUgMTAwJSBjb21tb24gKGFzIEkgZ3Vlc3MKPiA+ID4gPiB0
aGF0IHRoZSBob29rcyB3aWxsIGhhdmUgZGlmZmVyZW50IHByb3RvdHlwZXMpLCBidXQgSSBleHBl
Y3QKPiA+ID4gPiB0aGF0IHJvdXRpbmVzIGNhbiBiZSBzaGFyZWQsIGFuZCB0aGF0IHRoZSBhcHBy
b2FjaCB0YWtlbiBjYW4gYmUgdGhlCj4gPiA+ID4gc2FtZS4KPiA+ID4gPgo+ID4gPiA+IEZvciBl
eGFtcGxlIG9uZSBuZWNlc3NhcnkgZGlmZmVyZW5jZSB3aWxsIGJlIHRoYXQgeGVuYnVzIGluaXRp
YXRlZAo+ID4gPiA+IHN1c3BlbmQgd29uJ3QgY2xvc2UgdGhlIFBWIGNvbm5lY3Rpb24sIGluIGNh
c2Ugc3VzcGVuc2lvbiBmYWlscy4gT24gUE0KPiA+ID4gPiBzdXNwZW5kIHlvdSBzZWVtIHRvIGFs
d2F5cyBjbG9zZSB0aGUgY29ubmVjdGlvbiBiZWZvcmVoYW5kLCBzbyB5b3UKPiA+ID4gPiB3aWxs
IGFsd2F5cyBoYXZlIHRvIHJlLW5lZ290aWF0ZSBvbiByZXN1bWUgZXZlbiBpZiBzdXNwZW5zaW9u
IGZhaWxlZC4KPiA+ID4gPgo+ID4gPiA+IFdoYXQgSSdtIG1vc3RseSB3b3JyaWVkIGFib3V0IGlz
IHRoZSBkaWZmZXJlbnQgYXBwcm9hY2ggdG8gcmluZwo+ID4gPiA+IGRyYWluaW5nLiBJZTogZWl0
aGVyIHhlbmJ1cyBpcyBjaGFuZ2VkIHRvIGZyZWV6ZSB0aGUgcXVldWVzIGFuZCBkcmFpbgo+ID4g
PiA+IHRoZSBzaGFyZWQgcmluZ3MsIG9yIFBNIHVzZXMgdGhlIGFscmVhZHkgZXhpc3RpbmcgbG9n
aWMgb2Ygbm90Cj4gPiA+ID4gZmx1c2hpbmcgdGhlIHJpbmdzIGFuIHJlLWlzc3VpbmcgaW4tZmxp
Z2h0IHJlcXVlc3RzIG9uIHJlc3VtZS4KPiA+ID4gPgo+ID4gPgo+ID4gPiBZZXMsIHRoYXQncyBu
ZWVkcyBjb25zaWRlcmF0aW9uLiBJIGRvbuKAmXQgdGhpbmsgdGhlIHNhbWUgc2VtYW50aWMgY2Fu
IGJlCj4gPiBzdWl0YWJsZSBmb3IgYm90aC4gRS5nLiBpbiBhIHhlbi1zdXNwZW5kIHdlIG5lZWQg
dG8gZnJlZXplIHdpdGggYXMgbGl0dGxlCj4gPiBwcm9jZXNzaW5nIGFzIHBvc3NpYmxlIHRvIGF2
b2lkIGRpcnR5aW5nIFJBTSBsYXRlIGluIHRoZSBtaWdyYXRpb24gY3ljbGUsCj4gPiBhbmQgd2Ug
a25vdyB0aGF0IGluLWZsaWdodCBkYXRhIGNhbiB3YWl0LiBCdXQgaW4gYSB0cmFuc2l0aW9uIHRv
IFM0IHdlCj4gPiBuZWVkIHRvIG1ha2Ugc3VyZSB0aGF0IGF0IGxlYXN0IGFsbCB0aGUgaW4tZmxp
Z2h0IGJsa2lmIHJlcXVlc3RzIGdldAo+ID4gY29tcGxldGVkLCBzaW5jZSB0aGV5IHByb2JhYmx5
IGNvbnRhaW4gYml0cyBvZiB0aGUgZ3Vlc3QncyBtZW1vcnkgaW1hZ2UKPiA+IGFuZCB0aGF0J3Mg
bm90IGdvaW5nIHRvIGdldCBzYXZlZCBhbnkgb3RoZXIgd2F5Lgo+ID4gCj4gPiBUaGFua3MsIHRo
YXQgbWFrZXMgc2Vuc2UgYW5kIHNvbWV0aGluZyBhbG9uZyB0aGlzIGxpbmVzIHNob3VsZCBiZQo+
ID4gYWRkZWQgdG8gdGhlIGNvbW1pdCBtZXNzYWdlIElNTy4KPiA+IAo+ID4gV29uZGVyaW5nIGFi
b3V0IFM0LCBzaG91bGRuJ3Qgd2UgZXhwZWN0IHRoZSBxdWV1ZXMgdG8gYWxyZWFkeSBiZQo+ID4g
ZW1wdHk/IEFzIGFueSBzdWJzeXN0ZW0gdGhhdCB3YW50ZWQgdG8gc3RvcmUgc29tZXRoaW5nIHRv
IGRpc2sgc2hvdWxkCj4gPiBtYWtlIHN1cmUgcmVxdWVzdHMgaGF2ZSBiZWVuIHN1Y2Nlc3NmdWxs
eSBjb21wbGV0ZWQgYmVmb3JlCj4gPiBzdXNwZW5kaW5nLgo+IAo+IFdoYXQgYWJvdXQgd3JpdGlu
ZyB0aGUgc3VzcGVuZCBpbWFnZSBpdHNlbGY/IE5vcm1hbCBmaWxlc3lzdGVtIEkvTwo+IHdpbGwg
aGF2ZSBiZWVuIGZsdXNoZWQgb2YgY291cnNlLCBidXQgd2hhdGV2ZXIgdmVzdGlnaWFsIGtlcm5l
bAo+IGFjdHVhbGx5IHdyaXRlcyBvdXQgdGhlIGhpYmVybmF0aW9uIGZpbGUgbWF5IHdlbGwgZXhw
ZWN0IGEgZmluYWwKPiBEMC0+RDMgb24gdGhlIHN0b3JhZ2UgZGV2aWNlIHRvIGNhdXNlIGEgZmx1
c2guCgpIbSwgSSBoYXZlIG5vIGlkZWEgcmVhbGx5LiBJIHRoaW5rIHdoYXRldmVyIHdyaXRlcyB0
byB0aGUgZGlzayBiZWZvcmUKc3VzcGVuZCBzaG91bGQgYWN0dWFsbHkgbWFrZSBzdXJlIHJlcXVl
c3RzIGhhdmUgY29tcGxldGVkLCBidXQgd2hhdAp5b3Ugc3VnZ2VzdCBtaWdodCBhbHNvIGJlIGEg
cG9zc2liaWxpdHkuCgpDYW4geW91IGZpZ3VyZSBvdXQgd2hldGhlciB0aGVyZSBhcmUgcmVxdWVz
dHMgb24gdGhlIHJpbmcgb3IgaW4gdGhlCnF1ZXVlIGJlZm9yZSBzdXNwZW5kaW5nPwoKPiBBZ2Fp
biwgSSBkb24ndCBrbm93IHRoZSBzcGVjaWZpY3MgZm9yIExpbnV4IChhbmQgV2luZG93cyBhY3R1
YWxseQo+IHVzZXMgYW4gaW5jYXJuYXRpb24gb2YgdGhlIGNyYXNoIGtlcm5lbCB0byBkbyB0aGUg
am9iLCB3aGljaCBicmluZ3MKPiB3aXRoIGl0IGEgd2hvbGUgb3RoZXIgc2V0IG9mIGNvbXBsZXhp
dHkgYXMgZmFyIGFzIFBWIGRyaXZlcnMgZ28pLgoKVGhhdCBzZWVtcyBleHRyZW1lbHkgY29tcGxl
eCwgSSdtIHN1cmUgdGhlcmUncyBhIHJlYXNvbiBmb3IgaXQgOikuCgpUaGFua3MsIFJvZ2VyLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
