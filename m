Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E52F16114B
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 12:43:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3elV-0000tf-Uz; Mon, 17 Feb 2020 11:40:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sxmF=4F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j3elU-0000ta-8M
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 11:40:40 +0000
X-Inumbo-ID: 51c22d20-517a-11ea-bfd3-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51c22d20-517a-11ea-bfd3-12813bfff9fa;
 Mon, 17 Feb 2020 11:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581939640;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=AaqgVpaOHNYyuPoFJt25+zoUcEmZjMiC+y387kIFtpE=;
 b=iIYZ6RzQlpDJ27qHJoCyc8+YfhXELnk29yTurU89dUFby3dMiH4+N/2t
 KVxRnaZ4Ov3BteTLFoM+vo4oYQ1uwL900BOa617PtYcVR7h+7A1mfReOA
 Az3GMDVQ9LJeKKNeGJ76Sqv+xd3SF0l1K8MFoyerX8UnfuKYOZY8He82D 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: l+C3C8+DBy7u8SCYmk7eCLJ5wlPCMu4/KSboikkhNQ/3JoL5Glu+Gxnd9qJh4Zd9QE9rDu5VBv
 rA3FXoMXMg6Sht3fRZ2S6Dp0T202X3hmS2wlaZPENeyxzPKYyxM/O7L4MDSIC86U693AT5+7tZ
 uHy3XXlC2FsZyIzRnEr1MUjYJG9WrTsAG9UADqTR7P+HGUR013fCs6GDGprjyDQr0QYkfqS0nW
 SBIFPEBH1i/IEfhGxBWUp3zIkNNj5mk/FFgrTHh6IJkQP2pGkt9RuHWcogmL4wryjJIZxSAfC8
 CRQ=
X-SBRS: 2.7
X-MesageID: 12734734
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,452,1574139600"; d="scan'208";a="12734734"
Date: Mon, 17 Feb 2020 12:40:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200217114031.GF4679@Air-de-Roger>
References: <20200214123430.4942-1-liuwe@microsoft.com>
 <20200214123430.4942-3-liuwe@microsoft.com>
 <b27c6b19151b412aaa2dc33366e71ae7@EX13D32EUC003.ant.amazon.com>
 <20200217113441.c7q2uclargvrleyo@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217113441.c7q2uclargvrleyo@debian>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 2/3] x86/hyperv: skeleton for L0 assisted
 TLB flush
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>, "Durrant,
 Paul" <pdurrant@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMTE6MzQ6NDFBTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBGcmksIEZlYiAxNCwgMjAyMCBhdCAwNDo1NTo0NFBNICswMDAwLCBEdXJyYW50LCBQYXVs
IHdyb3RlOgo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPiBGcm9tOiBXZWkg
TGl1IDx3ZWkubGl1LnhlbkBnbWFpbC5jb20+IE9uIEJlaGFsZiBPZiBXZWkgTGl1Cj4gPiA+IFNl
bnQ6IDE0IEZlYnJ1YXJ5IDIwMjAgMTM6MzQKPiA+ID4gVG86IFhlbiBEZXZlbG9wbWVudCBMaXN0
IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+Cj4gPiA+IENjOiBNaWNoYWVsIEtlbGxl
eSA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT47IER1cnJhbnQsIFBhdWwKPiA+ID4gPHBkdXJyYW50
QGFtYXpvbi5jby51az47IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+OyBXZWkgTGl1Cj4g
PiA+IDx3bEB4ZW4ub3JnPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgQW5kcmV3
IENvb3Blcgo+ID4gPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4gPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMi8zXSB4
ODYvaHlwZXJ2OiBza2VsZXRvbiBmb3IgTDAgYXNzaXN0ZWQgVExCIGZsdXNoCj4gPiA+IAo+ID4g
PiBJbXBsZW1lbnQgYSBiYXNpYyBob29rIGZvciBMMCBhc3Npc3RlZCBUTEIgZmx1c2guIFRoZSBo
b29rIG5lZWRzIHRvCj4gPiA+IGNoZWNrIGlmIHByZXJlcXVpc2l0ZXMgYXJlIG1ldC4gSWYgdGhl
eSBhcmUgbm90IG1ldCwgaXQgcmV0dXJucyBhbiBlcnJvcgo+ID4gPiBudW1iZXIgdG8gZmFsbCBi
YWNrIHRvIG5hdGl2ZSBmbHVzaGVzLgo+ID4gPiAKPiA+ID4gSW50cm9kdWNlIGEgbmV3IHZhcmlh
YmxlIHRvIGluZGljYXRlIGlmIGh5cGVyY2FsbCBwYWdlIGlzIHJlYWR5Lgo+ID4gPiAKPiA+ID4g
U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KPiA+ID4gLS0tCj4g
PiA+ICB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L01ha2VmaWxlICB8ICAxICsKPiA+ID4gIHhl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgIHwgMTcgKysrKysrKysrKysrCj4gPiA+
ICB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaCB8ICA0ICsrKwo+ID4gPiAgeGVu
L2FyY2gveDg2L2d1ZXN0L2h5cGVydi90bGIuYyAgICAgfCA0MSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ID4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspCj4gPiA+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi90bGIuYwo+ID4g
PiAKPiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUK
PiA+ID4gYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L01ha2VmaWxlCj4gPiA+IGluZGV4IDY4
MTcwMTA5YTkuLjE4OTAyYzMzZTkgMTAwNjQ0Cj4gPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVz
dC9oeXBlcnYvTWFrZWZpbGUKPiA+ID4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9N
YWtlZmlsZQo+ID4gPiBAQCAtMSArMSwyIEBACj4gPiA+ICBvYmoteSArPSBoeXBlcnYubwo+ID4g
PiArb2JqLXkgKz0gdGxiLm8KPiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9o
eXBlcnYvaHlwZXJ2LmMKPiA+ID4gYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5j
Cj4gPiA+IGluZGV4IDcwZjRjZDVhZTAuLmY5ZDFmMTFhZTMgMTAwNjQ0Cj4gPiA+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiA+ID4gKysrIGIveGVuL2FyY2gveDg2
L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+ID4gPiBAQCAtMzMsNiArMzMsOCBAQCBERUZJTkVfUEVS
X0NQVV9SRUFEX01PU1RMWSh2b2lkICosIGh2X2lucHV0X3BhZ2UpOwo+ID4gPiAgREVGSU5FX1BF
Ul9DUFVfUkVBRF9NT1NUTFkodm9pZCAqLCBodl92cF9hc3Npc3QpOwo+ID4gPiAgREVGSU5FX1BF
Ul9DUFVfUkVBRF9NT1NUTFkodW5zaWduZWQgaW50LCBodl92cF9pbmRleCk7Cj4gPiA+IAo+ID4g
PiArc3RhdGljIGJvb2wgX19yZWFkX21vc3RseSBodl9oY2FsbF9wYWdlX3JlYWR5Owo+ID4gPiAr
Cj4gPiA+ICBzdGF0aWMgdWludDY0X3QgZ2VuZXJhdGVfZ3Vlc3RfaWQodm9pZCkKPiA+ID4gIHsK
PiA+ID4gICAgICB1bmlvbiBodl9ndWVzdF9vc19pZCBpZCA9IHt9Owo+ID4gPiBAQCAtMTE5LDYg
KzEyMSw4IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9oeXBlcmNhbGxfcGFnZSh2b2lkKQo+
ID4gPiAgICAgIEJVR19PTighaHlwZXJjYWxsX21zci5lbmFibGUpOwo+ID4gPiAKPiA+ID4gICAg
ICBzZXRfZml4bWFwX3goRklYX1hfSFlQRVJWX0hDQUxMLCBtZm4gPDwgUEFHRV9TSElGVCk7Cj4g
PiAKPiA+IFNob3VsZG4ndCB0aGlzIGhhdmUgYXQgbGVhc3QgYSBjb21waWxlciBiYXJyaWVyIGhl
cmU/Cj4gPiAKPiAKPiBPSy4gSSB3aWxsIGFkZCBhIHdyaXRlIGJhcnJpZXIgaGVyZS4KCkhtLCBz
aG91bGRuJ3Qgc3VjaCBiYXJyaWVyIGJlIHBhcnQgb2Ygc2V0X2ZpeG1hcF94IGl0c2VsZj8KCk5v
dGUgdGhhdCBtYXBfcGFnZXNfdG9feGVuIGFscmVhZHkgcGVyZm9ybXMgYXRvbWljIHdyaXRlcy4K
ClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
