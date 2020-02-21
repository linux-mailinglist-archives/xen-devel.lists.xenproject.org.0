Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 800D6167953
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 10:25:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j54W1-00016y-MA; Fri, 21 Feb 2020 09:22:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nwZw=4J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j54W0-00016p-5Y
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 09:22:32 +0000
X-Inumbo-ID: af8bf59e-548b-11ea-8601-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af8bf59e-548b-11ea-8601-12813bfff9fa;
 Fri, 21 Feb 2020 09:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582276951;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1o0dm0wP/9Dz9LlBZ6U1xeJE27JCYBLNrNyaJmSV7RA=;
 b=b3BtJcXnCTrKbZu1QPxUfuBURUTlKRoW89C4fuG1o2hR75pfVM97XVev
 0fXRX6+sSZmAKt70NLjADrv0gLPbkPld187ADrqXV9De1de9GfaOqaqu+
 1DFySRDVz8w5M7cTfXdkI/PRQnJIAIDcRQpctqErVl/ZJEYKryhVeAX+T Y=;
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
IronPort-SDR: 2naM2fLXRcIEz8ci/DVJT0B1w7DqJ7CFF6pH3dGfAg8IDJnxKdg4pAIVGMLNM76zeD8JWQiYPu
 aCowGjUBDV4/+Jj8d2GFJ4juB5ltAKhgt2ZeugZnWy0t88xKRc5q2rSJI1SB5tCEG1FWZ5nlZw
 0XpRIC+ckYLXsDK6/kM0cf6X8gOnCHMrrpTTVSe0V89LPhDLMpjyrXTuK2k0XFmXbmtzAWf1Tw
 ayuQD7J/bhQRq21Khs7UiVOkrPP/IlfRq6ASzfvfe513kMpID3AZbDw7cSKFXRHGtJyy5X4TFQ
 hfE=
X-SBRS: 2.7
X-MesageID: 13431188
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,467,1574139600"; d="scan'208";a="13431188"
Date: Fri, 21 Feb 2020 10:22:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <20200221092219.GU4679@Air-de-Roger>
References: <20200217100509.GE4679@Air-de-Roger>
 <20200217230553.GA8100@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200218091611.GN4679@Air-de-Roger>
 <20200219180424.GA17584@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200220083904.GI4679@Air-de-Roger>
 <f986b845491b47cc8469d88e2e65e2a7@EX13D32EUC003.ant.amazon.com>
 <20200220154507.GO4679@Air-de-Roger>
 <c9662397256a4568a5cc7d70a84940e5@EX13D32EUC003.ant.amazon.com>
 <20200220164839.GR4679@Air-de-Roger>
 <e42fa35800f04b6f953e4af87f2c1a02@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e42fa35800f04b6f953e4af87f2c1a02@EX13D32EUC003.ant.amazon.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDU6MDE6NTJQTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+ID4gSG9wZWZ1bGx5IHdoYXQgSSBzYWlkIGFib3ZlIGlsbHVzdHJhdGVzIHdoeSBp
dCBtYXkgbm90IGJlIDEwMCUgY29tbW9uLgo+ID4gCj4gPiBZZXMsIHRoYXQncyBmaW5lLiBJIGRv
bid0IGV4cGVjdCBpdCB0byBiZSAxMDAlIGNvbW1vbiAoYXMgSSBndWVzcwo+ID4gdGhhdCB0aGUg
aG9va3Mgd2lsbCBoYXZlIGRpZmZlcmVudCBwcm90b3R5cGVzKSwgYnV0IEkgZXhwZWN0Cj4gPiB0
aGF0IHJvdXRpbmVzIGNhbiBiZSBzaGFyZWQsIGFuZCB0aGF0IHRoZSBhcHByb2FjaCB0YWtlbiBj
YW4gYmUgdGhlCj4gPiBzYW1lLgo+ID4gCj4gPiBGb3IgZXhhbXBsZSBvbmUgbmVjZXNzYXJ5IGRp
ZmZlcmVuY2Ugd2lsbCBiZSB0aGF0IHhlbmJ1cyBpbml0aWF0ZWQKPiA+IHN1c3BlbmQgd29uJ3Qg
Y2xvc2UgdGhlIFBWIGNvbm5lY3Rpb24sIGluIGNhc2Ugc3VzcGVuc2lvbiBmYWlscy4gT24gUE0K
PiA+IHN1c3BlbmQgeW91IHNlZW0gdG8gYWx3YXlzIGNsb3NlIHRoZSBjb25uZWN0aW9uIGJlZm9y
ZWhhbmQsIHNvIHlvdQo+ID4gd2lsbCBhbHdheXMgaGF2ZSB0byByZS1uZWdvdGlhdGUgb24gcmVz
dW1lIGV2ZW4gaWYgc3VzcGVuc2lvbiBmYWlsZWQuCj4gPiAKPiA+IFdoYXQgSSdtIG1vc3RseSB3
b3JyaWVkIGFib3V0IGlzIHRoZSBkaWZmZXJlbnQgYXBwcm9hY2ggdG8gcmluZwo+ID4gZHJhaW5p
bmcuIEllOiBlaXRoZXIgeGVuYnVzIGlzIGNoYW5nZWQgdG8gZnJlZXplIHRoZSBxdWV1ZXMgYW5k
IGRyYWluCj4gPiB0aGUgc2hhcmVkIHJpbmdzLCBvciBQTSB1c2VzIHRoZSBhbHJlYWR5IGV4aXN0
aW5nIGxvZ2ljIG9mIG5vdAo+ID4gZmx1c2hpbmcgdGhlIHJpbmdzIGFuIHJlLWlzc3VpbmcgaW4t
ZmxpZ2h0IHJlcXVlc3RzIG9uIHJlc3VtZS4KPiA+IAo+IAo+IFllcywgdGhhdCdzIG5lZWRzIGNv
bnNpZGVyYXRpb24uIEkgZG9u4oCZdCB0aGluayB0aGUgc2FtZSBzZW1hbnRpYyBjYW4gYmUgc3Vp
dGFibGUgZm9yIGJvdGguIEUuZy4gaW4gYSB4ZW4tc3VzcGVuZCB3ZSBuZWVkIHRvIGZyZWV6ZSB3
aXRoIGFzIGxpdHRsZSBwcm9jZXNzaW5nIGFzIHBvc3NpYmxlIHRvIGF2b2lkIGRpcnR5aW5nIFJB
TSBsYXRlIGluIHRoZSBtaWdyYXRpb24gY3ljbGUsIGFuZCB3ZSBrbm93IHRoYXQgaW4tZmxpZ2h0
IGRhdGEgY2FuIHdhaXQuIEJ1dCBpbiBhIHRyYW5zaXRpb24gdG8gUzQgd2UgbmVlZCB0byBtYWtl
IHN1cmUgdGhhdCBhdCBsZWFzdCBhbGwgdGhlIGluLWZsaWdodCBibGtpZiByZXF1ZXN0cyBnZXQg
Y29tcGxldGVkLCBzaW5jZSB0aGV5IHByb2JhYmx5IGNvbnRhaW4gYml0cyBvZiB0aGUgZ3Vlc3Qn
cyBtZW1vcnkgaW1hZ2UgYW5kIHRoYXQncyBub3QgZ29pbmcgdG8gZ2V0IHNhdmVkIGFueSBvdGhl
ciB3YXkuCgpUaGFua3MsIHRoYXQgbWFrZXMgc2Vuc2UgYW5kIHNvbWV0aGluZyBhbG9uZyB0aGlz
IGxpbmVzIHNob3VsZCBiZQphZGRlZCB0byB0aGUgY29tbWl0IG1lc3NhZ2UgSU1PLgoKV29uZGVy
aW5nIGFib3V0IFM0LCBzaG91bGRuJ3Qgd2UgZXhwZWN0IHRoZSBxdWV1ZXMgdG8gYWxyZWFkeSBi
ZQplbXB0eT8gQXMgYW55IHN1YnN5c3RlbSB0aGF0IHdhbnRlZCB0byBzdG9yZSBzb21ldGhpbmcg
dG8gZGlzayBzaG91bGQKbWFrZSBzdXJlIHJlcXVlc3RzIGhhdmUgYmVlbiBzdWNjZXNzZnVsbHkg
Y29tcGxldGVkIGJlZm9yZQpzdXNwZW5kaW5nLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
