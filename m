Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E41CB166379
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 17:51:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4p0O-0002Pc-20; Thu, 20 Feb 2020 16:48:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rOW3=4I=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j4p0M-0002PW-R6
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 16:48:50 +0000
X-Inumbo-ID: dd9c7c3c-5400-11ea-8562-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd9c7c3c-5400-11ea-8562-12813bfff9fa;
 Thu, 20 Feb 2020 16:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582217329;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bXLHsjHJlcKALrV/t0FOsbyYb0NM5JDeWeMd5J+IqEs=;
 b=TnO758kHHuWNIQben4Sj7Xy+pPF5tw2B5d6qqYEP4XoBo1Pat5KI7zFN
 ywUKXEkRYTDP5NKtjCkRPqGnXh0am3gXvVxELTyKowca5C3rHbl2fMhwO
 QP7aSCaET+tooxCWXgHnJsBq9CnGN8DGMmm/xLlUvMjZ1XuEPGD7gjPbx A=;
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
IronPort-SDR: AtNmaeOI/KPiKNAzF3WkeY3GtDkzuuQSQiqjhnBfavLAIAOQjUZfpVAGmAZeMyQ1/y+M/W/MhZ
 rTwBfhThzqxv2OUa8kotAWC3zsel0hBZlPR6Y2QDEvs7B0oWgrUmy2o/zJPUWbLWmmM7LxC/e3
 j6XbUC12D1wMfgS/J6jnVwBxE5tbo+eeRE6ianJaDUUHYlUfSjhXpUKqphkniiteWuB8BaNVLW
 yC+pEY9uoteYc54GvU2s9VLuJdP1fOQubi4Q5XzPjdx9AmqfKLeDRF44NvNmmQopcALDtBSiXF
 S7c=
X-SBRS: 2.7
X-MesageID: 12749991
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,465,1574139600"; d="scan'208";a="12749991"
Date: Thu, 20 Feb 2020 17:48:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <20200220164839.GR4679@Air-de-Roger>
References: <cover.1581721799.git.anchalag@amazon.com>
 <890c404c585d7790514527f0c021056a7be6e748.1581721799.git.anchalag@amazon.com>
 <20200217100509.GE4679@Air-de-Roger>
 <20200217230553.GA8100@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200218091611.GN4679@Air-de-Roger>
 <20200219180424.GA17584@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200220083904.GI4679@Air-de-Roger>
 <f986b845491b47cc8469d88e2e65e2a7@EX13D32EUC003.ant.amazon.com>
 <20200220154507.GO4679@Air-de-Roger>
 <c9662397256a4568a5cc7d70a84940e5@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c9662397256a4568a5cc7d70a84940e5@EX13D32EUC003.ant.amazon.com>
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

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDQ6MjM6MTNQTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IFNlbnQ6IDIwIEZlYnJ1YXJ5IDIwMjAg
MTU6NDUKPiA+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+Cj4gPiBD
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
IDIwLCAyMDIwIGF0IDA4OjU0OjM2QU0gKzAwMDAsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4gPiA+
ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+ID4gPiBGcm9tOiBYZW4tZGV2ZWwgPHhl
bi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YKPiA+ID4g
PiBSb2dlciBQYXUgTW9ubsOpCj4gPiA+ID4gU2VudDogMjAgRmVicnVhcnkgMjAyMCAwODozOQo+
ID4gPiA+IFRvOiBBZ2Fyd2FsLCBBbmNoYWwgPGFuY2hhbGFnQGFtYXpvbi5jb20+Cj4gPiA+ID4g
Q2M6IFZhbGVudGluLCBFZHVhcmRvIDxlZHV2YWxAYW1hem9uLmNvbT47IGxlbi5icm93bkBpbnRl
bC5jb207Cj4gPiA+ID4gcGV0ZXJ6QGluZnJhZGVhZC5vcmc7IGJlbmhAa2VybmVsLmNyYXNoaW5n
Lm9yZzsgeDg2QGtlcm5lbC5vcmc7IGxpbnV4LQo+ID4gPiA+IG1tQGt2YWNrLm9yZzsgcGF2ZWxA
dWN3LmN6OyBocGFAenl0b3IuY29tOyB0Z2x4QGxpbnV0cm9uaXguZGU7Cj4gPiA+ID4gc3N0YWJl
bGxpbmlAa2VybmVsLm9yZzsgZmxsaW5kZW5AYW1hb3puLmNvbTsgS2FtYXRhLCBNdW5laGlzYQo+
ID4gPiA+IDxrYW1hdGFtQGFtYXpvbi5jb20+OyBtaW5nb0ByZWRoYXQuY29tOyB4ZW4tCj4gPiBk
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsKPiA+ID4gPiBTaW5naCwgQmFsYmlyIDxzYmxiaXJA
YW1hem9uLmNvbT47IGF4Ym9lQGtlcm5lbC5kazsKPiA+ID4gPiBrb25yYWQud2lsa0BvcmFjbGUu
Y29tOyBicEBhbGllbjguZGU7IGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tOwo+ID4gPiA+IGpn
cm9zc0BzdXNlLmNvbTsgbmV0ZGV2QHZnZXIua2VybmVsLm9yZzsgbGludXgtcG1Admdlci5rZXJu
ZWwub3JnOwo+ID4gPiA+IHJqd0Byand5c29ja2kubmV0OyBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnOyB2a3V6bmV0c0ByZWRoYXQuY29tOwo+ID4gPiA+IGRhdmVtQGRhdmVtbG9mdC5uZXQ7
IFdvb2Rob3VzZSwgRGF2aWQgPGR3bXdAYW1hem9uLmNvLnVrPgo+ID4gPiA+IFN1YmplY3Q6IFJl
OiBbWGVuLWRldmVsXSBbUkZDIFBBVENIIHYzIDA2LzEyXSB4ZW4tYmxrZnJvbnQ6IGFkZAo+ID4g
Y2FsbGJhY2tzCj4gPiA+ID4gZm9yIFBNIHN1c3BlbmQgYW5kIGhpYmVybmF0aW9uCj4gPiA+ID4K
PiA+ID4gPiBUaGFua3MgZm9yIHRoaXMgd29yaywgcGxlYXNlIHNlZSBiZWxvdy4KPiA+ID4gPgo+
ID4gPiA+IE9uIFdlZCwgRmViIDE5LCAyMDIwIGF0IDA2OjA0OjI0UE0gKzAwMDAsIEFuY2hhbCBB
Z2Fyd2FsIHdyb3RlOgo+ID4gPiA+ID4gT24gVHVlLCBGZWIgMTgsIDIwMjAgYXQgMTA6MTY6MTFB
TSArMDEwMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gPiA+ID4gT24gTW9uLCBGZWIg
MTcsIDIwMjAgYXQgMTE6MDU6NTNQTSArMDAwMCwgQW5jaGFsIEFnYXJ3YWwgd3JvdGU6Cj4gPiA+
ID4gPiA+ID4gT24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMTE6MDU6MDlBTSArMDEwMCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gPiA+ID4gPiA+IE9uIEZyaSwgRmViIDE0LCAyMDIwIGF0
IDExOjI1OjM0UE0gKzAwMDAsIEFuY2hhbCBBZ2Fyd2FsCj4gPiB3cm90ZToKPiA+ID4gPiA+ID4g
PiBRdWllc2NpbmcgdGhlIHF1ZXVlIHNlZW1lZCBhIGJldHRlciBvcHRpb24gaGVyZSBhcyB3ZSB3
YW50IHRvCj4gPiBtYWtlCj4gPiA+ID4gc3VyZSBvbmdvaW5nCj4gPiA+ID4gPiA+ID4gcmVxdWVz
dHMgZGlzcGF0Y2hlcyBhcmUgdG90YWxseSBkcmFpbmVkLgo+ID4gPiA+ID4gPiA+IEkgc2hvdWxk
IGFjY2VwdCB0aGF0IHNvbWUgb2YgdGhlc2Ugbm90aW9uIGlzIGJvcnJvd2VkIGZyb20gaG93Cj4g
PiBudm1lCj4gPiA+ID4gZnJlZXplL3VuZnJlZXplCj4gPiA+ID4gPiA+ID4gaXMgZG9uZSBhbHRo
b3VnaCBpdHMgbm90IGFwcGxlIHRvIGFwcGxlIGNvbXBhcmlzb24uCj4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+IFRoYXQncyBmaW5lLCBidXQgSSB3b3VsZCBzdGlsbCBsaWtlIHRvIHJlcXVlc3RzIHRo
YXQgeW91IHVzZSB0aGUKPiA+IHNhbWUKPiA+ID4gPiA+ID4gbG9naWMgKGFzIG11Y2ggYXMgcG9z
c2libGUpIGZvciBib3RoIHRoZSBYZW4gYW5kIHRoZSBQTSBpbml0aWF0ZWQKPiA+ID4gPiA+ID4g
c3VzcGVuc2lvbi4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gU28geW91IGVpdGhlciBhcHBseSB0
aGlzIGZyZWV6ZS91bmZyZWV6ZSB0byB0aGUgWGVuIHN1c3BlbnNpb24KPiA+IChhbmQKPiA+ID4g
PiA+ID4gZHJvcCB0aGUgcmUtaXNzdWluZyBvZiByZXF1ZXN0cyBvbiByZXN1bWUpIG9yIGFkYXB0
IHRoZSBzYW1lCj4gPiBhcHByb2FjaAo+ID4gPiA+ID4gPiBhcyB0aGUgWGVuIGluaXRpYXRlZCBz
dXNwZW5zaW9uLiBLZWVwaW5nIHR3byBjb21wbGV0ZWx5IGRpZmZlcmVudAo+ID4gPiA+ID4gPiBh
cHByb2FjaGVzIHRvIHN1c3BlbnNpb24gLyByZXN1bWUgb24gYmxrZnJvbnQgaXMgbm90IHN1aXRh
YmxlIGxvbmcKPiA+ID4gPiA+ID4gdGVybS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+IEkgYWdyZWUg
d2l0aCB5b3Ugb24gb3ZlcmhhdWwgb2YgeGVuIHN1c3BlbmQvcmVzdW1lIHdydCBibGtmcm9udCBp
cyBhCj4gPiA+ID4gZ29vZAo+ID4gPiA+ID4gaWRlYSBob3dldmVyLCBJTU8gdGhhdCBpcyBhIHdv
cmsgZm9yIGZ1dHVyZSBhbmQgdGhpcyBwYXRjaCBzZXJpZXMKPiA+IHNob3VsZAo+ID4gPiA+ID4g
bm90IGJlIGJsb2NrZWQgZm9yIGl0LiBXaGF0IGRvIHlvdSB0aGluaz8KPiA+ID4gPgo+ID4gPiA+
IEl0J3Mgbm90IHNvIG11Y2ggdGhhdCBJIHRoaW5rIGFuIG92ZXJoYXVsIG9mIHN1c3BlbmQvcmVz
dW1lIGluCj4gPiA+ID4gYmxrZnJvbnQgaXMgbmVlZGVkLCBpdCdzIGp1c3QgdGhhdCBJIGRvbid0
IHdhbnQgdG8gaGF2ZSB0d28gY29tcGxldGVseQo+ID4gPiA+IGRpZmZlcmVudCBzdXNwZW5kL3Jl
c3VtZSBwYXRocyBpbnNpZGUgYmxrZnJvbnQuCj4gPiA+ID4KPiA+ID4gPiBTbyBmcm9tIG15IFBv
ViBJIHRoaW5rIHRoZSByaWdodCBzb2x1dGlvbiBpcyB0byBlaXRoZXIgdXNlIHRoZSBzYW1lCj4g
PiA+ID4gY29kZSAoYXMgbXVjaCBhcyBwb3NzaWJsZSkgYXMgaXQncyBjdXJyZW50bHkgdXNlZCBi
eSBYZW4gaW5pdGlhdGVkCj4gPiA+ID4gc3VzcGVuZC9yZXN1bWUsIG9yIHRvIGFsc28gc3dpdGNo
IFhlbiBpbml0aWF0ZWQgc3VzcGVuc2lvbiB0byB1c2UgdGhlCj4gPiA+ID4gbmV3bHkgaW50cm9k
dWNlZCBjb2RlLgo+ID4gPiA+Cj4gPiA+ID4gSGF2aW5nIHR3byBkaWZmZXJlbnQgYXBwcm9hY2hl
cyB0byBzdXNwZW5kL3Jlc3VtZSBpbiB0aGUgc2FtZSBkcml2ZXIKPiA+ID4gPiBpcyBhIHJlY2lw
ZSBmb3IgZGlzYXN0ZXIgSU1POiBpdCBhZGRzIGNvbXBsZXhpdHkgYnkgZm9yY2luZyBkZXZlbG9w
ZXJzCj4gPiA+ID4gdG8gdGFrZSBpbnRvIGFjY291bnQgdHdvIGRpZmZlcmVudCBzdXNwZW5kL3Jl
c3VtZSBhcHByb2FjaGVzIHdoZW4KPiA+ID4gPiB0aGVyZSdzIG5vIG5lZWQgZm9yIGl0Lgo+ID4g
Pgo+ID4gPiBJIGRpc2FncmVlLiBTMyBvciBTNCBzdXNwZW5kL3Jlc3VtZSAob3IgcGVyaGFwcyB3
ZSBzaG91bGQgY2FsbCB0aGVtCj4gPiBwb3dlciBzdGF0ZSB0cmFuc2l0aW9ucyB0byBhdm9pZCBj
b25mdXNpb24pIGFyZSBxdWl0ZSBkaWZmZXJlbnQgZnJvbSBYZW4KPiA+IHN1c3BlbmQvcmVzdW1l
Lgo+ID4gPiBQb3dlciBzdGF0ZSB0cmFuc2l0aW9ucyBvdWdodCB0byBiZSwgYW5kIGluZGVlZCBh
cmUsIHZpc2libGUgdG8gdGhlCj4gPiBzb2Z0d2FyZSBydW5uaW5nIGluc2lkZSB0aGUgZ3Vlc3Qu
IEFwcGxpY2F0aW9ucywgYXMgd2VsbCBhcyBkcml2ZXJzLCBjYW4KPiA+IHJlY2VpdmUgbm90aWZp
Y2F0aW9uIGFuZCB0YWtlIHdoYXRldmVyIGFjdGlvbiB0aGV5IGRlZW0gYXBwcm9wcmlhdGUuCj4g
PiA+IFhlbiBzdXNwZW5kL3Jlc3VtZSBPVE9IIGlzIHVzZWQgd2hlbiBhIGd1ZXN0IGlzIG1pZ3Jh
dGVkIGFuZCB0aGUgY29kZQo+ID4gc2hvdWxkIGdvIHRvIGFsbCBsZW5ndGhzIHBvc3NpYmxlIHRv
IG1ha2UgYW55IHNvZnR3YXJlIHJ1bm5pbmcgaW5zaWRlIHRoZQo+ID4gZ3Vlc3QgKG90aGVyIHRo
YW4gWGVuIHNwZWNpZmljIGVubGlnaHRlbmVkIGNvZGUsIHN1Y2ggYXMgUFYgZHJpdmVycykKPiA+
IGNvbXBsZXRlbHkgdW5hd2FyZSB0aGF0IGFueXRoaW5nIGhhcyBhY3R1YWxseSBoYXBwZW5lZC4K
PiA+IAo+ID4gU28gZnJvbSB3aGF0IHlvdSBzYXkgYWJvdmUgUE0gc3RhdGUgdHJhbnNpdGlvbnMg
YXJlIG5vdGlmaWVkIHRvIGFsbAo+ID4gZHJpdmVycywgYW5kIFhlbiBzdXNwZW5kL3Jlc3VtZSBp
cyBvbmx5IG5vdGlmaWVkIHRvIFBWIGRyaXZlcnMsIGFuZAo+ID4gaGVyZSB3ZSBhcmUgc3BlYWtp
bmcgYWJvdXQgYmxrZnJvbnQgd2hpY2ggaXMgYSBQViBkcml2ZXIsIGFuZCBzaG91bGQKPiA+IGdl
dCBub3RpZmllZCBpbiBib3RoIGNhc2VzLiBTbyBJJ20gdW5zdXJlIHdoeSB0aGUgc2FtZSAob3Ig
YXQgbGVhc3QKPiA+IHZlcnkgc2ltaWxhcikgYXBwcm9hY2ggY2FuJ3QgYmUgdXNlZCBpbiBib3Ro
IGNhc2VzLgo+ID4gCj4gPiBUaGUgc3VzcGVuZC9yZXN1bWUgYXBwcm9hY2ggcHJvcG9zZWQgYnkg
dGhpcyBwYXRjaCBpcyBjb21wbGV0ZWx5Cj4gPiBkaWZmZXJlbnQgdGhhbiB0aGUgb25lIHVzZWQg
YnkgYSB4ZW5idXMgaW5pdGlhdGVkIHN1c3BlbmQvcmVzdW1lLCBhbmQKPiA+IEkgZG9uJ3Qgc2Vl
IGEgdGVjaG5pY2FsIHJlYXNvbiB0aGF0IHdhcnJhbnRzIHRoaXMgZGlmZmVyZW5jZS4KPiA+Cj4g
Cj4gV2l0aGluIGFuIGluZGl2aWR1YWwgUFYgZHJpdmVyIGl0IG1heSB3ZWxsIGJlIG9rIHRvIHVz
ZSBjb21tb24gbWVjaGFuaXNtcyBmb3IgY29ubmVjdGluZyB0byB0aGUgYmFja2VuZCBidXQgaXNz
dWVzIHdpbGwgYXJpc2UgaWYgYW55IHN1YnNlcXVlbnQgYWN0aW9uIGlzIHZpc2libGUgdG8gdGhl
IGd1ZXN0LiBFLmcuIGEgbmV0d29yayBmcm9udGVuZCBuZWVkcyB0byBpc3N1ZSBncmF0dWl0b3Vz
IEFSUHMgd2l0aG91dCBhbnl0aGluZyBlbHNlIGluIHRoZSBuZXR3b3JrIHN0YWNrIChvciBtb25p
dG9yaW5nIHRoZSBuZXR3b3JrIHN0YWNrKSBrbm93aW5nIHRoYXQgaXQgaGFzIGhhcHBlbmVkLiAK
PiAgCj4gPiBJJ20gbm90IHNheWluZyB0aGF0IHRoZSBhcHByb2FjaCB1c2VkIGhlcmUgaXMgd3Jv
bmcsIGl0J3MganVzdCB0aGF0IEkKPiA+IGRvbid0IHNlZSB0aGUgcG9pbnQgaW4gaGF2aW5nIHR3
byBkaWZmZXJlbnQgd2F5cyB0byBkbyBzdXNwZW5kL3Jlc3VtZQo+ID4gaW4gdGhlIHNhbWUgZHJp
dmVyLCB1bmxlc3MgdGhlcmUncyBhIHRlY2huaWNhbCByZWFzb24gZm9yIGl0LCB3aGljaCBJCj4g
PiBkb24ndCB0aGluayBoYXMgYmVlbiBwcm92aWRlZC4KPiAKPiBUaGUgdGVjaG5pY2FsIGp1c3Rp
ZmljYXRpb24gaXMgdGhhdCB0aGUgZHJpdmVyIG5lZWRzIHRvIGtub3cgd2hhdCBraW5kIG9mIHN1
c3BlbmQgb3IgcmVzdW1lIGl0IGlzIGRvaW5nLCBzbyB0aGF0IGl0IGRvZXNuJ3QgZG8gdGhlIHdy
b25nIHRoaW5nLiBUaGVyZSBtYXkgYWxzbyBiZSBkaWZmZXJlbmNlcyBpbiB0aGUgc3RhdGUgb2Yg
dGhlIHN5c3RlbSBlLmcuIGluIFdpbmRvd3MsIGF0IGxlYXN0IHNvbWUgb2YgdGhlIHJlc3VtZS1m
cm9tLXhlbi1zdXNwZW5kIGNvZGUgcnVucyB3aXRoIGludGVycnVwdHMgZGlzYWJsZWQgKHdoaWNo
IGlzIG5lY2Vzc2FyeSB0byBtYWtlIHN1cmUgZW5vdWdoIHN0YXRlIGlzIHJlc3RvcmVkIGJlZm9y
ZSB0aGluZ3MgYmVjb21lIHZpc2libGUgdG8gb3RoZXIga2VybmVsIGNvZGUpLgo+IAo+ID4gCj4g
PiBJIHdvdWxkIGJlIGZpbmUgd2l0aCBzd2l0Y2hpbmcgeGVuYnVzIGluaXRpYXRlZCBzdXNwZW5k
L3Jlc3VtZSB0byBhbHNvCj4gPiB1c2UgdGhlIGFwcHJvYWNoIHByb3Bvc2VkIGhlcmU6IGZyZWV6
ZSB0aGUgcXVldWVzIGFuZCBkcmFpbiB0aGUgc2hhcmVkCj4gPiByaW5ncyBiZWZvcmUgc3VzcGVu
ZGluZy4KPiA+IAo+IAo+IEkgdGhpbmsgYWJzdHJhY3RpbmcgYXdheSBhdCB0aGUgeGVuYnVzIGxl
dmVsIHRvIHNvbWUgZGVncmVlIGlzIHByb2JhYmx5IGZlYXNpYmxlLCBidXQgc29tZSBzb3J0IG9m
IGZsYWcgc2hvdWxkIGJlIHBhc3NlZCB0byB0aGUgaW5kaXZpZHVhbCBkcml2ZXJzIHNvIHRoZXkg
a25vdyB3aGF0IGNpcmN1bXN0YW5jZXMgdGhleSBhcmUgb3BlcmF0aW5nIHVuZGVyLgo+IAo+ID4g
PiBTbywgd2hpbHN0IGl0IG1heSBiZSBwb3NzaWJsZSB0byB1c2UgY29tbW9uIHJvdXRpbmVzIHRv
LCBmb3IgZXhhbXBsZSwKPiA+IHJlLWVzdGFibGlzaCBQViBmcm9udGVuZC9iYWNrZW5kIGNvbW11
bmljYXRpb24sIFBWIGZyb250ZW5kIGNvZGUgc2hvdWxkIGJlCj4gPiBhY3V0ZWx5IGF3YXJlIG9m
IHRoZSBjaXJjdW1zdGFuY2VzIHRoZXkgYXJlIG9wZXJhdGluZyBpbi4gSSBjYW4gY2l0ZQo+ID4g
ZXhhbXBsZSBjb2RlIGluIHRoZSBXaW5kb3dzIFBWIGRyaXZlciwgd2hpY2ggaGF2ZSBzdXBwb3J0
ZWQgZ3Vlc3QgUzMvUzQKPiA+IHBvd2VyIHN0YXRlIHRyYW5zaXRpb25zIHNpbmNlIGRheSAxLgo+
ID4gCj4gPiBIbSwgcGxlYXNlIGJlYXIgd2l0aCBtZSwgYXMgSSdtIG5vdCBzdXJlIEkgZnVsbHkg
dW5kZXJzdGFuZC4gV2h5IGlzbid0Cj4gPiB0aGUgY3VycmVudCBzdXNwZW5kL3Jlc3VtZSBsb2dp
YyBzdWl0YWJsZSBmb3IgUE0gdHJhbnNpdGlvbnM/Cj4gPiAKPiAKPiBJIGRvbuKAmXQga25vdyB0
aGUgZGV0YWlscyBmb3IgTGludXggYnV0IGl0IG1heSB3ZWxsIGJlIHRvIGRvIHdpdGggYXNzdW1w
dGlvbnMgbWFkZSBhYm91dCB0aGUgc3lzdGVtIGUuZy4gdGhlIGFiaWxpdHkgdG8gYmxvY2sgd2Fp
dGluZyBmb3Igc29tZXRoaW5nIHRvIGhhcHBlbiBvbiBhbm90aGVyIENQVSAod2hpY2ggbWF5IGhh
dmUgYWxyZWFkeSBiZWVuIHF1aWVzY2VkIGluIGEgUE0gY29udGV4dCkuCj4gCj4gPiBBcyBzYWlk
IGFib3ZlLCBJJ20gaGFwcHkgdG8gc3dpdGNoIHhlbmJ1cyBpbml0aWF0ZWQgc3VzcGVuZC9yZXN1
bWUgdG8KPiA+IHVzZSB0aGUgbG9naWMgaW4gdGhpcyBwYXRjaCwgYnV0IHVubGVzcyB0aGVyZSdz
IGEgdGVjaG5pY2FsIHJlYXNvbiBmb3IKPiA+IGl0IEkgZG9uJ3Qgc2VlIHdoeSBibGtmcm9udCBz
aG91bGQgaGF2ZSB0d28gY29tcGxldGVseSBkaWZmZXJlbnQKPiA+IGFwcHJvYWNoZXMgdG8gc3Vz
cGVuZC9yZXN1bWUgZGVwZW5kaW5nIG9uIHdoZXRoZXIgaXQncyBhIFBNIG9yIGEKPiA+IHhlbmJ1
cyBzdGF0ZSBjaGFuZ2UuCj4gPiAKPiAKPiBIb3BlZnVsbHkgd2hhdCBJIHNhaWQgYWJvdmUgaWxs
dXN0cmF0ZXMgd2h5IGl0IG1heSBub3QgYmUgMTAwJSBjb21tb24uCgpZZXMsIHRoYXQncyBmaW5l
LiBJIGRvbid0IGV4cGVjdCBpdCB0byBiZSAxMDAlIGNvbW1vbiAoYXMgSSBndWVzcwp0aGF0IHRo
ZSBob29rcyB3aWxsIGhhdmUgZGlmZmVyZW50IHByb3RvdHlwZXMpLCBidXQgSSBleHBlY3QKdGhh
dCByb3V0aW5lcyBjYW4gYmUgc2hhcmVkLCBhbmQgdGhhdCB0aGUgYXBwcm9hY2ggdGFrZW4gY2Fu
IGJlIHRoZQpzYW1lLgoKRm9yIGV4YW1wbGUgb25lIG5lY2Vzc2FyeSBkaWZmZXJlbmNlIHdpbGwg
YmUgdGhhdCB4ZW5idXMgaW5pdGlhdGVkCnN1c3BlbmQgd29uJ3QgY2xvc2UgdGhlIFBWIGNvbm5l
Y3Rpb24sIGluIGNhc2Ugc3VzcGVuc2lvbiBmYWlscy4gT24gUE0Kc3VzcGVuZCB5b3Ugc2VlbSB0
byBhbHdheXMgY2xvc2UgdGhlIGNvbm5lY3Rpb24gYmVmb3JlaGFuZCwgc28geW91CndpbGwgYWx3
YXlzIGhhdmUgdG8gcmUtbmVnb3RpYXRlIG9uIHJlc3VtZSBldmVuIGlmIHN1c3BlbnNpb24gZmFp
bGVkLgoKV2hhdCBJJ20gbW9zdGx5IHdvcnJpZWQgYWJvdXQgaXMgdGhlIGRpZmZlcmVudCBhcHBy
b2FjaCB0byByaW5nCmRyYWluaW5nLiBJZTogZWl0aGVyIHhlbmJ1cyBpcyBjaGFuZ2VkIHRvIGZy
ZWV6ZSB0aGUgcXVldWVzIGFuZCBkcmFpbgp0aGUgc2hhcmVkIHJpbmdzLCBvciBQTSB1c2VzIHRo
ZSBhbHJlYWR5IGV4aXN0aW5nIGxvZ2ljIG9mIG5vdApmbHVzaGluZyB0aGUgcmluZ3MgYW4gcmUt
aXNzdWluZyBpbi1mbGlnaHQgcmVxdWVzdHMgb24gcmVzdW1lLgoKVGhhbmtzLCBSb2dlci4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
