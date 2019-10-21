Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C465CDEFE2
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 16:37:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMYkg-0008Sx-L7; Mon, 21 Oct 2019 14:33:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=miS7=YO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iMYkf-0008Ss-Gi
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 14:33:41 +0000
X-Inumbo-ID: c61600de-f40f-11e9-bbab-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c61600de-f40f-11e9-bbab-bc764e2007e4;
 Mon, 21 Oct 2019 14:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571668420;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jkknz/SOHhgXTfRjcj7PISabpjxuErAXf3IOLnHH6aM=;
 b=WVUjx7hYn0smtd2LhtEyuathhVLj1s7SJhNPSvYCoylxfYSwiNxQ3kjB
 U4iMUoAox3rhcdChW3xoXKfbQg9yVGGKXq3SzjMH3uBehPnNhZ5COFhb/
 +G2vywK1TLPnHQbGwkizSMOgwdh0/PgOQA6V1r/HPEEmJN6+QPEFcQgDy 0=;
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
IronPort-SDR: W3k/u59MrgZaeDOQu97PaRLmoan/syieritFghn2jpSnsb7BcSc9k8Ed4JM9bjTPurUruqwylD
 2OQpymr/TUSDzzNzRgo4bmYlXLD42FWOCTlFcGzOmO5CskA+Z4QooTPYqX76NgBMgdH86rUbR2
 emYoMaHVRFIAEoRxJFTwjenuKHjqN/wV1MvaknHIfk/IsI340FKIa6SenolrkuI2gA/RQrqjuA
 qbRfjWdozPqgH+DbxN8fd/uT+yBfhL5W2bE4E+2NSggHjb1xhU96v0LSnvj+v5FrSID28aV+8v
 fz8=
X-SBRS: 2.7
X-MesageID: 7204605
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,323,1566878400"; 
   d="scan'208";a="7204605"
Date: Mon, 21 Oct 2019 16:33:32 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20191021143332.GL17494@Air-de-Roger>
References: <20191021133215.26518-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191021133215.26518-1-ian.jackson@eu.citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [OSSTEST PATCH] guest_prepare_disk: Only do the
 umount if we set an env var
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDI6MzI6MTVQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gVGhpcyBjYWxsIHRvIGd1ZXN0X3Vtb3VudF9sdiBpcyBoZXJlIGZvciB0aGUgYmVuZWZp
dCBvZiBhZC1ob2MgcmVydW5zCj4gb2YgKGVnKSB0cy1ndWVzdC1zdGFydCB0aWR5IHVwIGFueSBh
ZC1ob2MgbWVzc2luZyBhYm91dCAoZWcgZnJvbQo+IGVhcmxpZXIgcnVucyBvZiB0cy1kZWJpYW4t
Zml4dXAgb3Igc29tZXRoaW5nKS4gIEl0IGlzIG5vdCBuZWVkZWQgaW4KPiBwcm9kdWN0aW9uIHJ1
bnMuCj4gCj4gU2VyZW5kaXBpdG91c2x5LCB0aGlzIG9zc3Rlc3QgY29kZSBkaXNjb3ZlcmVkIGEg
YnVnIGluIHRoZSBMaW51eAo+IGJsa2JhY2s6IHdoZW4gdGVhcmluZyBkb3duLCBpdCBzZXRzIHRo
ZSBiYWNrZW5kIHN0YXRlIHRvIDYgYmVmb3JlIGl0Cj4gaGFzIGNsb3NlZCB0aGUgdW5kZXJseWlu
ZyBibG9jayBkZXZpY2VzLiAgVGhpcyB1bHRpbWF0ZWx5IG1lYW5zIHRoYXQKPiBhZnRlciAieGwg
ZGVzdHJveSIgb3IgInhsIHNodXRkb3duIC13IiB0aGVyZSBpcyBhIHBlcmlvZCB3aGVuIHRoZQo+
IGd1ZXN0J3Mgb3BlbiBoYW5kbGUgb250byBpdHMgc3RvcmFnZSBpcyBzdGlsbCBvcGVuLiAgVGhp
cyBpcyB3cm9uZy4KPiAKPiBUaGlzIGRldGVjdGlvbiBkZXBlbmRzIG9uIHVzIHdpbm5pbmcgYSB0
cmlja3kgcmFjZS4gIFNvIGl0IHNob3dzIHVwIGluCj4gb3NzdGVzdCBhcyBhIHZlcnkgbG93IHBy
b2JhYmlsaXR5IGhlaXNlbmJ1Zy4gIFRoZSBidWcgaXMgY3VycmVudGx5IGluCj4gYWxsIHZlcnNp
b25zIG9mIExpbnV4IGFuZCBjYXVzaW5nIGEgYml0IG9mIGEgbnVpc2FuY2UuCj4gCj4gSXQgd291
bGQgYmUgYmVzdCB0byBhZGQgYSBwcm9wZXIgY2hlY2sgZm9yIHRoaXMgYnVnLiAgSG93ZXZlciwg
dGhpcyBpcwo+IHF1aXRlIGZpZGRseTogcmVhbGx5LCBpdCBvdWdodCB0byBiZSBkb25lIGFzIGNs
b3NlIHRvIHRoZSB4bCBjb21tYW5kCj4gY29tcGxldGlvbiBhcyBwb3NzaWJsZSwgaW4gdGhlIHNh
bWUgc3NoIGludm9jYXRpb24uICBUaGF0IHdvdWxkCj4gaW52b2x2ZSBhIGZhaXIgYml0IG9mIHBs
dW1iaW5nIGFuZCBhZC1ob2NlcnkuICBJIGRvbid0IHRoaW5rIHRoYXQKPiB3b3VsZCBiZSBwcm9w
b3J0aW9uYXRlIGZvciBzdWNoIGEgbG93LWltcGFjdCBidWcuCj4gCj4gU28gaW5zdGVhZCBpbiB0
aGlzIHBhdGNoIEkganVzdCBkaXNhYmxlIHRoaXMgY2xlYW51cCBjb2RlIGluIHRoZQo+IHRyb3Vi
bGVzb21lIGNhc2UsIHVubGVzcyBpdCBpcyBleHBsaWNpdGx5IHJlcXVlc3RlZCBieSB0aGUgdXNl
cgo+IHNldHRpbmcgT1NTVEVTVF9HVUVTVF9ESVNLX01PVU5UX0NMRUFOVVAgdG8gYSB0cnVlaXNo
IHZhbHVlLiAgKFRoaXMKPiB3b3VsZCBiZSByZWFzb25hYmx5IGNvbnZlbmllbnQgZm9yIHRoZSBh
ZC1ob2MgdGVzdGluZyB0aGF0IHRoaXMgY2FsbAo+IHNlcnZlcy4pCj4gCj4gVGhhbmtzIHRvIFJv
Z2VyIGZvciBkaWFnbm9zaW5nIHRoZSBMaW51eCBrZXJuZWwgYnVnLgo+IAo+IENDOiBSb2dlciBQ
YXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IENDOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jv
c3NAc3VzZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1
LmNpdHJpeC5jb20+CgpUaGFua3M6CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
