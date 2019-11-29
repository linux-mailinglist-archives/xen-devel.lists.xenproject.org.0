Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C0510D7B2
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 16:11:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iahsO-0007Up-7l; Fri, 29 Nov 2019 15:08:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YUI4=ZV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iahsM-0007Uh-Ly
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 15:08:06 +0000
X-Inumbo-ID: 0b3909eb-12ba-11ea-a3e7-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b3909eb-12ba-11ea-a3e7-12813bfff9fa;
 Fri, 29 Nov 2019 15:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575040085;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ho3w6fMZjQMUAdMfY9OmFcWJIQUD8dpZ768y2Og+acw=;
 b=HolJ9iGS7WZs4rN6xLzGGsZHqvPPITgZEuxp4PE7hgdIc40SN2YpUh9/
 NTFqtA3yRl6lCF8ODeZ17a0UBBYEMsl6ZwA8+7e26N+jdkoD/8th+/hRa
 oDhPoiJmYfmBDbjgacFWCatKBDv+mjhDiwaNkporQCsKkMlSCAk1bx6Yl Y=;
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
IronPort-SDR: uo7ZQ6Lhm9qvElxVUxtjDCKkJouk31rqD+rniiFpA7qeDLbFelo86ONL8Ao+T2vpe7Q5KKvu3N
 MHj2KGcYc+pYAmemTK88J6d6U4NiRU6LiCvGxnuArztHn/OZSyMyTF1YrFr2EFWNKkB2KaUZ52
 xqsDgt3eZArNqBtFUy/LH7j+kTQUevajZMOxXOrQSTm2XtIv6G74/ANKHwA3IHWHnwlYCptasq
 AjOT0aicg377FQ4uVE0v6D+5FeLxp1D+lWSyJZypSwTwpCRMouYa/Nk3wMA5KFlcFrThzFKuxE
 6Sk=
X-SBRS: 2.7
X-MesageID: 9402212
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="9402212"
Date: Fri, 29 Nov 2019 16:07:57 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: "Durrant, Paul" <pdurrant@amazon.com>
Message-ID: <20191129150757.GA980@Air-de-Roger>
References: <20191129134306.2738-1-pdurrant@amazon.com>
 <20191129134306.2738-3-pdurrant@amazon.com>
 <20191129150006.GZ980@Air-de-Roger>
 <f06bf1967bdf43ca9b218f9b5c5202a6@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f06bf1967bdf43ca9b218f9b5c5202a6@EX13D32EUC003.ant.amazon.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 2/2] block/xen-blkback: allow module to
 be cleanly unloaded
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
Cc: Juergen Gross <jgross@suse.com>, Jens Axboe <axboe@kernel.dk>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 boris.ostrovsky@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMDM6MDI6MzdQTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IFNlbnQ6IDI5IE5vdmVtYmVyIDIwMTkg
MTU6MDAKPiA+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY29tPgo+ID4gQ2M6
IGxpbnV4LWJsb2NrQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
ZzsgeGVuLQo+ID4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEtvbnJhZCBSemVzenV0ZWsg
V2lsawo+ID4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBKZW5zIEF4Ym9lIDxheGJvZUBrZXJu
ZWwuZGs+Cj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvMl0gYmxvY2sveGVuLWJsa2JhY2s6
IGFsbG93IG1vZHVsZSB0byBiZSBjbGVhbmx5Cj4gPiB1bmxvYWRlZAo+ID4gCj4gPiBPbiBGcmks
IE5vdiAyOSwgMjAxOSBhdCAwMTo0MzowNlBNICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4g
PiA+IEFkZCBhIG1vZHVsZV9leGl0KCkgdG8gcGVyZm9ybSB0aGUgbmVjZXNzYXJ5IGNsZWFuLXVw
Lgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpv
bi5jb20+Cj4gPiAKPiA+IExHVE06Cj4gPiAKPiA+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IAo+IAo+IFRoYW5rcy4KPiAKPiA+IEFGQUlD
VCB3ZSBzaG91bGQgbWFrZSBzdXJlIHRoaXMgaXMgbm90IGNvbW1pdHRlZCBiZWZvcmUgcGF0Y2gg
MSwgb3IKPiA+IGVsc2UgeW91IGNvdWxkIHVubG9hZCBhIGJsa2JhY2sgbW9kdWxlIHRoYXQncyBz
dGlsbCBpbiB1c2U/Cj4gPiAKPiAKPiBZZXMsIHRoYXQncyBjb3JyZWN0LgoKR2l2ZW4gdGhpcyBp
cyBhIHZlcnkgc21hbGwgY2hhbmdlLCBhbmQgbm90IHJlYWxseSBibG9jayByZWxhdGVkIEkKdGhp
bmsgaXQgd291bGQgYmUgYmV0dGVyIGZvciBib3RoIHBhdGNoZXMgdG8gYmUgY29tbWl0dGVkIGZy
b20gdGhlIFhlbgp0cmVlLCBpZiBKZW5zLCBKdWVyZ2VuIGFuZCBCb3JpcyBhZ3JlZS4KClRoYW5r
cywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
