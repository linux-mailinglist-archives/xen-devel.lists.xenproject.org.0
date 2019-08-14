Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E268CD67
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 10:00:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxo9w-0001JR-4f; Wed, 14 Aug 2019 07:57:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yzLY=WK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hxo9u-0001JL-GB
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 07:57:26 +0000
X-Inumbo-ID: 27306ada-be69-11e9-aac3-f7d465835479
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27306ada-be69-11e9-aac3-f7d465835479;
 Wed, 14 Aug 2019 07:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565769446;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3lLGqqm420oWoOAJpSqmtcIRAcDETiyymUwnLY3DUBQ=;
 b=NJpiZc4Jv4uAf/49UQdZl7A+IVDQ5Iwx85LuRFh9buM6u3uB+dcS5pSL
 7x38hpZGbYduGaRfuLTDUkqITSreBtcfc7vUPobH1CBvkhgYWAFKO/KiX
 UYUMCn0H2nuFxE8OUFv1PHNSxcGwvEDxSGMbvL57Yv84eF7MM3pXcHahK c=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +ajHC5n4QKve3Lj5thgRt/etOPoi03QxwQW5u0dHztfMc5gtcTFaZYDjPSWufDR1fzF6+X4oLB
 uZdfL1MxUsj9hCtyoVlioggkujWb+9SgK2s1KYIO1mfgJnI3PW8kHmagZaJG5MwCnjdzUIyaYc
 eJDtHNdYaue7RsAMMPZSdPddaQAk12nHpNnOgwBEH3tllR4wCjo7mu/RDHgF/zC2IDkhvRkdna
 OmpuegKu2cpwcukw3y5I2WZFwcjNyjFJgrNvjBSrJ/Aog3ExHR4BHEKELtAbtJVav/BkS9bRaI
 3Yg=
X-SBRS: 2.7
X-MesageID: 4241980
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,384,1559534400"; 
   d="scan'208";a="4241980"
Date: Wed, 14 Aug 2019 09:57:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190814075714.27r6dfoxg6lepk32@Air-de-Roger>
References: <20190513165321.464fdeaf.olaf@aepfle.de>
 <20190513152005.jojtolhh5wdguvg6@Air-de-Roger>
 <20190515121804.4e4a2c85.olaf@aepfle.de>
 <20190814075145.GA10492@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814075145.GA10492@aepfle.de>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] how to disable build of pv-shim?
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDk6NTE6NDVBTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gT24gV2VkLCBNYXkgMTUsIE9sYWYgSGVyaW5nIHdyb3RlOgo+IAo+ID4gQW0gTW9uLCAx
MyBNYXkgMjAxOSAxNzoyMDowNSArMDIwMAo+ID4gc2NocmllYiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT46Cj4gPiAKPiA+ID4gTGV0IG1lIGtub3cgaWYgdGhhdCB3b3Jr
cyBmb3IgeW91IGFuZCBJIHdpbGwgc3VibWl0IGl0IGZvcm1hbGx5Lgo+ID4gWWVzLCBpdCB3b3Jr
cyBmb3IgbWUuIFRoYW5rcy4KPiAKPiBEaWQgeW91IGhhdmUgYSBjaGFuY2UgdG8gc3VibWl0IGEg
Zml4IHRvIHN1cHBvcnQgJy0tZGlzYWJsZS1wdi1zaGltJz8KClllcywgaXQgd2FzIGNvbW1pdHRl
ZCBxdWl0ZSBzb21lIHRpbWUgYWdvLCBjaGVjayA4ODQ1MTU1YzgzMWM1OToKCmh0dHA6Ly94ZW5i
aXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1jb21taXQ7aD04ODQ1MTU1YzgzMWM1OWU4
NjdlZTNkZDMxZWU2M2UwY2M2YzdkY2YyCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
