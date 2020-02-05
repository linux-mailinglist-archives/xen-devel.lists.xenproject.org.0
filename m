Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E45E15280F
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 10:12:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izGhM-0005rO-7d; Wed, 05 Feb 2020 09:10:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HwEA=3Z=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1izGhK-0005rJ-0W
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 09:10:14 +0000
X-Inumbo-ID: 50ee796c-47f7-11ea-90a8-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50ee796c-47f7-11ea-90a8-12813bfff9fa;
 Wed, 05 Feb 2020 09:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580893813;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eGJpkIz7ewDBXD/IH62pM9qIu/TnZF4vTxYf5SOArw8=;
 b=O59TuihyRwihR6xK8Ow/2K2MlDhrATxjChCNEH2iz683LEAIsukQ2BsB
 asPLfKegWkykElh1HBFcU8LW0+vJe4L83n9Fs+5ABasufBhAZ2gi/geJg
 wpUtLuyCgwZk5DFxu6t9dvvTAJczTPnhid73IEmASjgutOYRaEPtUkH/C Y=;
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
IronPort-SDR: jDEkc3SsOPZ58zp5aCidO5v66I/JWj51h6GcE8+lNTV5Bu0vsqOqbRBgPeRqTvLU+gdCgF+hN5
 V6dnCwuyzaDDbJKpDu5ZS947AllOyaobFuo8k8xKR/DIphkaIzyUXDSEBRLW34G1Q/MDi+QoZy
 Dmq+l2zwl6aNAj7QJBOUno67DaoS/I6l9X+FatPB/cozM2YsGb/9GhY6PgZr0kr5RKXCY2Z60u
 GLur2htgfl+gtc+4jgu43ORVnf5DhGxh8qUNxykFAELMcALK/bwaVuhp3kFSPblF+6BEva2GnE
 YO8=
X-SBRS: 2.7
X-MesageID: 12404478
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,405,1574139600"; d="scan'208";a="12404478"
Date: Wed, 5 Feb 2020 10:09:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <20200205090949.GO4679@Air-de-Roger>
References: <1580852977-23866-1-git-send-email-igor.druzhinin@citrix.com>
 <1580852977-23866-3-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1580852977-23866-3-git-send-email-igor.druzhinin@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 2/2] x86/time: report correct frequency
 of Xen PV clocksource
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, jbeulich@suse.com,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMDQsIDIwMjAgYXQgMDk6NDk6MzdQTSArMDAwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gVGhlIHZhbHVlIG9mIHRoZSBjb3VudGVyIHJlcHJlc2VudHMgdGhlIG51bWJlciBv
ZiBuYW5vc2Vjb25kcwo+IHNpbmNlIGhvc3QgYm9vdC4gVGhhdCBtZWFucyB0aGUgY29ycmVjdCBm
cmVxdWVuY3kgaXMgYWx3YXlzIDFHSHouCj4gCj4gVGhpcyBpbmNvbnNpc3RlbmN5IGNhdXNlZCB0
aW1lIHRvIGdvIHNsb3dlciBpbiBQViBzaGltIG9uIG1vc3QKPiBwbGF0Zm9ybXMuCj4gCj4gU2ln
bmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+CgpS
ZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFu
a3MhCgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvdGltZS5jIHwgNSArKy0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvdGltZS5jIGIveGVuL2FyY2gveDg2L3RpbWUuYwo+IGluZGV4IDdlN2E2MmUu
LjI2ZjliYWQgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L3RpbWUuYwo+ICsrKyBiL3hlbi9h
cmNoL3g4Ni90aW1lLmMKPiBAQCAtNTg3LDkgKzU4Nyw3IEBAIHN0YXRpYyBpbnQ2NF90IF9faW5p
dCBpbml0X3hlbl90aW1lcihzdHJ1Y3QgcGxhdGZvcm1fdGltZXNvdXJjZSAqcHRzKQo+ICAgICAg
aWYgKCAheGVuX2d1ZXN0ICkKPiAgICAgICAgICByZXR1cm4gMDsKPiAgCj4gLSAgICBwdHMtPmZy
ZXF1ZW5jeSA9IHhlbl90aW1lcl9jcHVfZnJlcXVlbmN5KCk7Cj4gLQo+IC0gICAgcmV0dXJuIHB0
cy0+ZnJlcXVlbmN5Owo+ICsgICAgcmV0dXJuIHhlbl90aW1lcl9jcHVfZnJlcXVlbmN5KCk7Cj4g
IH0KPiAgCj4gIHN0YXRpYyBhbHdheXNfaW5saW5lIHVpbnQ2NF90IHJlYWRfY3ljbGUoY29uc3Qg
c3RydWN0IHZjcHVfdGltZV9pbmZvICppbmZvLAo+IEBAIC02NDMsNiArNjQxLDcgQEAgc3RhdGlj
IHN0cnVjdCBwbGF0Zm9ybV90aW1lc291cmNlIF9faW5pdGRhdGEgcGx0X3hlbl90aW1lciA9Cj4g
IHsKPiAgICAgIC5pZCA9ICJ4ZW4iLAo+ICAgICAgLm5hbWUgPSAiWEVOIFBWIENMT0NLIiwKPiAr
ICAgIC5mcmVxdWVuY3kgPSAxMDAwMDAwMDAwVUxMLAoKSSB0aGluayB5b3UgY2FuIGRyb3AgdGhl
IHR5cGUgbGl0ZXJhbCBoZXJlPwoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
