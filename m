Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED97167CCE
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 12:53:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j56pv-0000F3-Gq; Fri, 21 Feb 2020 11:51:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nwZw=4J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j56pt-0000Es-Ks
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 11:51:13 +0000
X-Inumbo-ID: 74f323ca-54a0-11ea-aa99-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74f323ca-54a0-11ea-aa99-bc764e2007e4;
 Fri, 21 Feb 2020 11:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582285872;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rkTHwapBz7ayghLmZpskUOnKPxyODDcUxzL7ge8Xcgw=;
 b=OZLTIKh1todi/eF9m5Zuw3e9FZEB208cvD/izr6fF51TJPS2N0TSYqR4
 6Ap5YuK1xxh7K19MUlsOXe4oNWYUWCoqTG1Wx0Q1yqjdhxWGXldm55R3G
 KiNjwjVU3w7qy4AllGqLyTaLsITZY3VdlftLBuZo8vrRaw3FpH1v/N+4V 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Iy6vkmYvTTmAxcv0sDnk287OqaApR945+t3bbH8+KbvqO+kHUjaYPybqDsL2Uz3ckkNdz7m7Ij
 Y/kSARbsrffvGwZ0DdF9joLHQxzx+xK9WlQ/XDSamvWxHYxvaUCzUm0cfcLxehNY2mp7FjoWjT
 D4xjlWsuciis2JlVC9Q0xgZJzdXhb7ZyOnQTX4w+09xcbPdlJMXCastv+6vAPcXH/ReEzapMJk
 MexwEdNGylwcSepie7bUtm+7uwAyQBY4nMkkPM9+s4Fdfth/Af4mJg7YaOlCyON2+hTYr7itc9
 ax0=
X-SBRS: 2.7
X-MesageID: 13435837
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,468,1574139600"; d="scan'208";a="13435837"
Date: Fri, 21 Feb 2020 12:51:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <20200221115103.GY4679@Air-de-Roger>
References: <20200220083904.GI4679@Air-de-Roger>
 <f986b845491b47cc8469d88e2e65e2a7@EX13D32EUC003.ant.amazon.com>
 <20200220154507.GO4679@Air-de-Roger>
 <c9662397256a4568a5cc7d70a84940e5@EX13D32EUC003.ant.amazon.com>
 <20200220164839.GR4679@Air-de-Roger>
 <e42fa35800f04b6f953e4af87f2c1a02@EX13D32EUC003.ant.amazon.com>
 <20200221092219.GU4679@Air-de-Roger>
 <5ddf980a3fba4fb39571184e688cefc5@EX13D32EUC003.ant.amazon.com>
 <20200221102130.GW4679@Air-de-Roger>
 <66a211bae1de4be9861ef8393607d1b3@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <66a211bae1de4be9861ef8393607d1b3@EX13D32EUC003.ant.amazon.com>
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

T24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMTA6MzM6NDJBTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IFNlbnQ6IDIxIEZlYnJ1YXJ5IDIwMjAg
MTA6MjIKPiA+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+Cj4gPiBD
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
cwo+ID4gZm9yIFBNIHN1c3BlbmQgYW5kIGhpYmVybmF0aW9uCj4gPiAKPiA+IE9uIEZyaSwgRmVi
IDIxLCAyMDIwIGF0IDA5OjU2OjU0QU0gKzAwMDAsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4gPiA+
ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+ID4gPiBGcm9tOiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+ID4gPiBTZW50OiAyMSBGZWJydWFyeSAyMDIw
IDA5OjIyCj4gPiA+ID4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4K
PiA+ID4gPiBDYzogQWdhcndhbCwgQW5jaGFsIDxhbmNoYWxhZ0BhbWF6b24uY29tPjsgVmFsZW50
aW4sIEVkdWFyZG8KPiA+ID4gPiA8ZWR1dmFsQGFtYXpvbi5jb20+OyBsZW4uYnJvd25AaW50ZWwu
Y29tOyBwZXRlcnpAaW5mcmFkZWFkLm9yZzsKPiA+ID4gPiBiZW5oQGtlcm5lbC5jcmFzaGluZy5v
cmc7IHg4NkBrZXJuZWwub3JnOyBsaW51eC1tbUBrdmFjay5vcmc7Cj4gPiA+ID4gcGF2ZWxAdWN3
LmN6OyBocGFAenl0b3IuY29tOyB0Z2x4QGxpbnV0cm9uaXguZGU7Cj4gPiBzc3RhYmVsbGluaUBr
ZXJuZWwub3JnOwo+ID4gPiA+IGZsbGluZGVuQGFtYW96bi5jb207IEthbWF0YSwgTXVuZWhpc2Eg
PGthbWF0YW1AYW1hem9uLmNvbT47Cj4gPiA+ID4gbWluZ29AcmVkaGF0LmNvbTsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnOyBTaW5naCwgQmFsYmlyCj4gPiA+ID4gPHNibGJpckBhbWF6
b24uY29tPjsgYXhib2VAa2VybmVsLmRrOyBrb25yYWQud2lsa0BvcmFjbGUuY29tOwo+ID4gPiA+
IGJwQGFsaWVuOC5kZTsgYm9yaXMub3N0cm92c2t5QG9yYWNsZS5jb207IGpncm9zc0BzdXNlLmNv
bTsKPiA+ID4gPiBuZXRkZXZAdmdlci5rZXJuZWwub3JnOyBsaW51eC1wbUB2Z2VyLmtlcm5lbC5v
cmc7IHJqd0Byand5c29ja2kubmV0Owo+ID4gPiA+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IHZrdXpuZXRzQHJlZGhhdC5jb207Cj4gPiBkYXZlbUBkYXZlbWxvZnQubmV0Owo+ID4gPiA+
IFdvb2Rob3VzZSwgRGF2aWQgPGR3bXdAYW1hem9uLmNvLnVrPgo+ID4gPiA+IFN1YmplY3Q6IFJl
OiBbWGVuLWRldmVsXSBbUkZDIFBBVENIIHYzIDA2LzEyXSB4ZW4tYmxrZnJvbnQ6IGFkZAo+ID4g
Y2FsbGJhY2tzCj4gPiA+ID4gZm9yIFBNIHN1c3BlbmQgYW5kIGhpYmVybmF0aW9uCj4gPiA+ID4K
PiA+ID4gPiBPbiBUaHUsIEZlYiAyMCwgMjAyMCBhdCAwNTowMTo1MlBNICswMDAwLCBEdXJyYW50
LCBQYXVsIHdyb3RlOgo+ID4gPiA+ID4gPiA+IEhvcGVmdWxseSB3aGF0IEkgc2FpZCBhYm92ZSBp
bGx1c3RyYXRlcyB3aHkgaXQgbWF5IG5vdCBiZSAxMDAlCj4gPiA+ID4gY29tbW9uLgo+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiBZZXMsIHRoYXQncyBmaW5lLiBJIGRvbid0IGV4cGVjdCBpdCB0byBi
ZSAxMDAlIGNvbW1vbiAoYXMgSSBndWVzcwo+ID4gPiA+ID4gPiB0aGF0IHRoZSBob29rcyB3aWxs
IGhhdmUgZGlmZmVyZW50IHByb3RvdHlwZXMpLCBidXQgSSBleHBlY3QKPiA+ID4gPiA+ID4gdGhh
dCByb3V0aW5lcyBjYW4gYmUgc2hhcmVkLCBhbmQgdGhhdCB0aGUgYXBwcm9hY2ggdGFrZW4gY2Fu
IGJlCj4gPiB0aGUKPiA+ID4gPiA+ID4gc2FtZS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gRm9y
IGV4YW1wbGUgb25lIG5lY2Vzc2FyeSBkaWZmZXJlbmNlIHdpbGwgYmUgdGhhdCB4ZW5idXMgaW5p
dGlhdGVkCj4gPiA+ID4gPiA+IHN1c3BlbmQgd29uJ3QgY2xvc2UgdGhlIFBWIGNvbm5lY3Rpb24s
IGluIGNhc2Ugc3VzcGVuc2lvbiBmYWlscy4KPiA+IE9uIFBNCj4gPiA+ID4gPiA+IHN1c3BlbmQg
eW91IHNlZW0gdG8gYWx3YXlzIGNsb3NlIHRoZSBjb25uZWN0aW9uIGJlZm9yZWhhbmQsIHNvIHlv
dQo+ID4gPiA+ID4gPiB3aWxsIGFsd2F5cyBoYXZlIHRvIHJlLW5lZ290aWF0ZSBvbiByZXN1bWUg
ZXZlbiBpZiBzdXNwZW5zaW9uCj4gPiBmYWlsZWQuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFdo
YXQgSSdtIG1vc3RseSB3b3JyaWVkIGFib3V0IGlzIHRoZSBkaWZmZXJlbnQgYXBwcm9hY2ggdG8g
cmluZwo+ID4gPiA+ID4gPiBkcmFpbmluZy4gSWU6IGVpdGhlciB4ZW5idXMgaXMgY2hhbmdlZCB0
byBmcmVlemUgdGhlIHF1ZXVlcyBhbmQKPiA+IGRyYWluCj4gPiA+ID4gPiA+IHRoZSBzaGFyZWQg
cmluZ3MsIG9yIFBNIHVzZXMgdGhlIGFscmVhZHkgZXhpc3RpbmcgbG9naWMgb2Ygbm90Cj4gPiA+
ID4gPiA+IGZsdXNoaW5nIHRoZSByaW5ncyBhbiByZS1pc3N1aW5nIGluLWZsaWdodCByZXF1ZXN0
cyBvbiByZXN1bWUuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gWWVzLCB0aGF0J3Mg
bmVlZHMgY29uc2lkZXJhdGlvbi4gSSBkb27igJl0IHRoaW5rIHRoZSBzYW1lIHNlbWFudGljIGNh
bgo+ID4gYmUKPiA+ID4gPiBzdWl0YWJsZSBmb3IgYm90aC4gRS5nLiBpbiBhIHhlbi1zdXNwZW5k
IHdlIG5lZWQgdG8gZnJlZXplIHdpdGggYXMKPiA+IGxpdHRsZQo+ID4gPiA+IHByb2Nlc3Npbmcg
YXMgcG9zc2libGUgdG8gYXZvaWQgZGlydHlpbmcgUkFNIGxhdGUgaW4gdGhlIG1pZ3JhdGlvbgo+
ID4gY3ljbGUsCj4gPiA+ID4gYW5kIHdlIGtub3cgdGhhdCBpbi1mbGlnaHQgZGF0YSBjYW4gd2Fp
dC4gQnV0IGluIGEgdHJhbnNpdGlvbiB0byBTNCB3ZQo+ID4gPiA+IG5lZWQgdG8gbWFrZSBzdXJl
IHRoYXQgYXQgbGVhc3QgYWxsIHRoZSBpbi1mbGlnaHQgYmxraWYgcmVxdWVzdHMgZ2V0Cj4gPiA+
ID4gY29tcGxldGVkLCBzaW5jZSB0aGV5IHByb2JhYmx5IGNvbnRhaW4gYml0cyBvZiB0aGUgZ3Vl
c3QncyBtZW1vcnkKPiA+IGltYWdlCj4gPiA+ID4gYW5kIHRoYXQncyBub3QgZ29pbmcgdG8gZ2V0
IHNhdmVkIGFueSBvdGhlciB3YXkuCj4gPiA+ID4KPiA+ID4gPiBUaGFua3MsIHRoYXQgbWFrZXMg
c2Vuc2UgYW5kIHNvbWV0aGluZyBhbG9uZyB0aGlzIGxpbmVzIHNob3VsZCBiZQo+ID4gPiA+IGFk
ZGVkIHRvIHRoZSBjb21taXQgbWVzc2FnZSBJTU8uCj4gPiA+ID4KPiA+ID4gPiBXb25kZXJpbmcg
YWJvdXQgUzQsIHNob3VsZG4ndCB3ZSBleHBlY3QgdGhlIHF1ZXVlcyB0byBhbHJlYWR5IGJlCj4g
PiA+ID4gZW1wdHk/IEFzIGFueSBzdWJzeXN0ZW0gdGhhdCB3YW50ZWQgdG8gc3RvcmUgc29tZXRo
aW5nIHRvIGRpc2sgc2hvdWxkCj4gPiA+ID4gbWFrZSBzdXJlIHJlcXVlc3RzIGhhdmUgYmVlbiBz
dWNjZXNzZnVsbHkgY29tcGxldGVkIGJlZm9yZQo+ID4gPiA+IHN1c3BlbmRpbmcuCj4gPiA+Cj4g
PiA+IFdoYXQgYWJvdXQgd3JpdGluZyB0aGUgc3VzcGVuZCBpbWFnZSBpdHNlbGY/IE5vcm1hbCBm
aWxlc3lzdGVtIEkvTwo+ID4gPiB3aWxsIGhhdmUgYmVlbiBmbHVzaGVkIG9mIGNvdXJzZSwgYnV0
IHdoYXRldmVyIHZlc3RpZ2lhbCBrZXJuZWwKPiA+ID4gYWN0dWFsbHkgd3JpdGVzIG91dCB0aGUg
aGliZXJuYXRpb24gZmlsZSBtYXkgd2VsbCBleHBlY3QgYSBmaW5hbAo+ID4gPiBEMC0+RDMgb24g
dGhlIHN0b3JhZ2UgZGV2aWNlIHRvIGNhdXNlIGEgZmx1c2guCj4gPiAKPiA+IEhtLCBJIGhhdmUg
bm8gaWRlYSByZWFsbHkuIEkgdGhpbmsgd2hhdGV2ZXIgd3JpdGVzIHRvIHRoZSBkaXNrIGJlZm9y
ZQo+ID4gc3VzcGVuZCBzaG91bGQgYWN0dWFsbHkgbWFrZSBzdXJlIHJlcXVlc3RzIGhhdmUgY29t
cGxldGVkLCBidXQgd2hhdAo+ID4geW91IHN1Z2dlc3QgbWlnaHQgYWxzbyBiZSBhIHBvc3NpYmls
aXR5Lgo+ID4gCj4gPiBDYW4geW91IGZpZ3VyZSBvdXQgd2hldGhlciB0aGVyZSBhcmUgcmVxdWVz
dHMgb24gdGhlIHJpbmcgb3IgaW4gdGhlCj4gPiBxdWV1ZSBiZWZvcmUgc3VzcGVuZGluZz8KPiAK
PiBXZWxsIHRoZXJlJ3MgY2xlYXJseSBwZW5kaW5nIHN0dWZmIGluIHRoZSByaW5nIGlmIHJzcF9w
cm9kICE9IHJlcV9wcm9kIDotKQoKUmlnaHQsIEkgYXNzdW1lIHRoZXJlJ3Mgbm8gZG9jdW1lbnQg
dGhhdCBzdGF0ZXMgd2hhdCdzIHRoZSBleHBlY3RlZApzdGF0ZSBmb3IgcXVldWVzICZjIHdoZW4g
c3dpdGNoaW5nIFBNIHN0YXRlcywgc28gd2UgaGF2ZSB0byBhc3N1bWUKdGhhdCB0aGVyZSBtaWdo
dCBiZSBpbi1mbGlnaHQgcmVxdWVzdHMgb24gdGhlIHJpbmcgYW5kIGluIHRoZSBkcml2ZXIKcXVl
dWVzLgoKPiBBcyBmb3IgaW50ZXJuYWwgcXVldWVzLCBJIGRvbid0IGtub3cgaG93IGJsa2Zyb250
IG1hbmFnZXMgdGhhdCAob3Igd2hldGhlciBpdCBoYXMgYW55IHBlbmRpbmcgd29yayBxdWV1ZSBh
dCBhbGwpLgoKVGhlcmUgYXJlIG5vIGludGVybmFsIHF1ZXVlcywganVzdCB0aGUgZ2VuZXJpYyBv
bmVzIGZyb20gYmxrX21xIHdoaWNoCmV2ZXJ5IGJsb2NrIGRldmljZSBoYXMgSUlSQy4KClRoYW5r
cywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
