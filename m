Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6567A1184FA
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 11:26:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieceW-00084c-HO; Tue, 10 Dec 2019 10:22:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=czbI=2A=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ieceU-00084X-4W
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 10:21:58 +0000
X-Inumbo-ID: e4848cd6-1b36-11ea-8915-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4848cd6-1b36-11ea-8915-12813bfff9fa;
 Tue, 10 Dec 2019 10:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575973317;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4PhE0mOGPD1zWZASbQ5CWdp3IZVaRYiYD5CdAezDIzg=;
 b=EebQ1jgiepeEgkAhPB1OXJjmDCAqe5oarwxgCPAkX9gFRup0fr9bUy5v
 XGfZFw1i+P7ME171ocHatDwqpFLUmP4w+1x9u5HeLmCQxFv/7EhAYTdUN
 WY7mGAJGqI4n90gxG5FrCg1mtAlav782SckEslFwTJVJTJ7s8BW6eB1Zq g=;
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
IronPort-SDR: J/Qwc1MLS8uzoplHZItR93vbDIMgnz3emkOpUjrWj9JL23ADQcoIho4tYn5tjdu3JFCBTJ+W8O
 plARZAwoIRJqT0bZ0j1l8NTrKDrhwiDWjQocq8hGJMx6uguvE+U2nXB0bJDEFxebBkMyT/IHKy
 vW2udoFw/dOZ73cpw1J3BTTq1J0jnFgFkBlE4Ml+e85k/r5MyvH8pHxgNzxGIy9dDsek/H23Ax
 TdqTP9EV1nylxtyI3d5TOYZiKYwVR5shwFf9FQxGQE2H79Dppbs5/4u8cj676sEe2NXZwNFvyV
 2vs=
X-SBRS: 2.7
X-MesageID: 9447992
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,299,1571716800"; 
   d="scan'208";a="9447992"
Date: Tue, 10 Dec 2019 11:21:49 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: SeongJae Park <sj38.park@gmail.com>
Message-ID: <20191210102023.GF980@Air-de-Roger>
References: <20191210080628.5264-1-sjpark@amazon.de>
 <20191210080628.5264-2-sjpark@amazon.de>
 <20191210101635.GD980@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210101635.GD980@Air-de-Roger>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v5 1/2] xenbus/backend: Add memory pressure
 handler callback
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
Cc: axboe@kernel.dk, sjpark@amazon.com, konrad.wilk@oracle.com,
 pdurrant@amazon.com, SeongJae Park <sjpark@amazon.de>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMTAsIDIwMTkgYXQgMTE6MTY6MzVBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUdWUsIERlYyAxMCwgMjAxOSBhdCAwODowNjoyN0FNICswMDAwLCBTZW9u
Z0phZSBQYXJrIHdyb3RlOgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUveGVuL3hlbmJ1cy5oIGIv
aW5jbHVkZS94ZW4veGVuYnVzLmgKPiA+IGluZGV4IDg2OWM4MTZkNWY4Yy4uY2RiMDc1ZTQxODJm
IDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS94ZW4veGVuYnVzLmgKPiA+ICsrKyBiL2luY2x1ZGUv
eGVuL3hlbmJ1cy5oCj4gPiBAQCAtMTA0LDYgKzEwNCw3IEBAIHN0cnVjdCB4ZW5idXNfZHJpdmVy
IHsKPiA+ICAJc3RydWN0IGRldmljZV9kcml2ZXIgZHJpdmVyOwo+ID4gIAlpbnQgKCpyZWFkX290
aGVyZW5kX2RldGFpbHMpKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYpOwo+ID4gIAlpbnQgKCpp
c19yZWFkeSkoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldik7Cj4gPiArCXVuc2lnbmVkICgqcmVj
bGFpbSkoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldik7Cj4gCj4gLi4uIGhlbmNlIEkgd29uZGVy
IHdoeSBpdCdzIHJldHVybmluZyBhbiB1bnNpZ25lZCB3aGVuIGl0J3MganVzdAo+IGlnbm9yZWQu
Cj4gCj4gSU1PIGl0IHNob3VsZCByZXR1cm4gYW4gaW50IHRvIHNpZ25hbCBlcnJvcnMsIGFuZCB0
aGUgcmV0dXJuIHNob3VsZCBiZQo+IGlnbm9yZWQuCgpNZWFudCB0byB3cml0ZSAnc2hvdWxkbid0
IGJlIGlnbm9yZWQnIHNvcnJ5LgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
