Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 466CFBDC82
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 12:59:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD4wZ-0004D2-TQ; Wed, 25 Sep 2019 10:54:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8ACI=XU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iD4wY-0004Cv-Jz
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 10:54:46 +0000
X-Inumbo-ID: e2b72e12-df82-11e9-bf31-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id e2b72e12-df82-11e9-bf31-bc764e2007e4;
 Wed, 25 Sep 2019 10:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569408886;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HEqJBeJzcPRpm/9m3nnFdusY8WdqKFx+/h3yPbP/VXM=;
 b=hV4j4ATgZ7Uu8ctLbJFk/qU5nxnnxb/jT+5I4cFbf8bHMuB6J3Cw029v
 O5AhTghhH4yz5NHunmNq4BZ990V3n1o+5ijyRB/lulikEOXDDb9loe4Lw
 DXdgZM8kFKe8tgJmg89m6HQg3E+Ae2LmaaARCQAYUK98I8yIJMKuPl9nf M=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: whOVf1pmL9uNAQGYnKUdNAjjHXW/nLFtsXBg3VkAVLtBbevieB5t9OZ6QxvGn6j2ZoA3JtMyc1
 T4Tc1Y7fv6MgiHKCLPGCQV0UfIVS4Krc3e+INtc4NNjxoWV3V1N4kKulXz2wv4v5Xq0odsZTnY
 c25V7ZLdamQU7D56KrRO0fsndL0ILuk06vl4Q6w0uQRcufH1dcVBIj523Gaj/wbq36iTPNcIwm
 2tJVN3aiyxx1GDwxv+5PW5ynTlfPuvrg6E0+d4QvRUpYce1rglAciDSj5aD3BMUYzMMMFZwmjA
 K4A=
X-SBRS: 2.7
X-MesageID: 6106118
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,547,1559534400"; 
   d="scan'208";a="6106118"
Date: Wed, 25 Sep 2019 12:54:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20190925105435.4lcr5bskdhumqmq2@Air-de-Roger>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <20190923100931.29670-9-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923100931.29670-9-liuwe@microsoft.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH for-next RFC 8/8] x86: be more verbose when
 running nested
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <liuwe@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>, Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMTE6MDk6MzFBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgo+IC0tLQo+ICB4
ZW4vYXJjaC94ODYvc2V0dXAuYyB8IDExICsrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
MSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jIGIv
eGVuL2FyY2gveDg2L3NldHVwLmMKPiBpbmRleCBkZWM2MGQwMzAxLi5iYmNjNWE1MDNkIDEwMDY0
NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4gKysrIGIveGVuL2FyY2gveDg2L3NldHVw
LmMKPiBAQCAtNzg5LDYgKzc4OSwxNyBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hl
bih1bnNpZ25lZCBsb25nIG1iaV9wKQo+ICAKPiAgICAgIHByaW50aygiWGVuIGltYWdlIGxvYWQg
YmFzZSBhZGRyZXNzOiAlI2x4XG4iLCB4ZW5fcGh5c19zdGFydCk7Cj4gIAo+ICsjaWZkZWYgQ09O
RklHX0dVRVNUCj4gKyNpZmRlZiBDT05GSUdfWEVOX0dVRVNUCj4gKyAgICBpZiAoIHhlbl9ndWVz
dCApCj4gKyAgICAgICAgcHJpbnRrKCJSdW5uaW5nIG9uIFhlbiBoeXBlcnZpc29yXG4iKTsKPiAr
I2VuZGlmCj4gKyNpZmRlZiBDT05GSUdfSFlQRVJWX0dVRVNUCj4gKyAgICBpZiAoIGh5cGVydl9n
dWVzdCApCj4gKyAgICAgICAgcHJpbnRrKCJSdW5uaW5nIG9uIEh5cGVyLVZcbiIpOwo+ICsjZW5k
aWYKPiArI2VuZGlmCgpVcmcsIHRoYXQncyBraW5kIG9mIHVnbHkuIFdoeSBub3QgaW50cm9kdWNl
IGEgaHlwZXJ2aXNvcl9uYW1lIGhlbHBlcgpvciBzb21lIHN1Y2g/CgpZb3UgY291bGQgZXZlbiBo
YXZlIGEgc3RydWN0dXJlIGxpa2U6CgpzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgewogICAgY29uc3Qg
Y2hhciAqbmFtZTsKICAgIGJvb2wgKCpwcm9iZSkodm9pZCk7CiAgICB2b2lkICgqc2V0dXApKHZv
aWQpOwogICAgLi4uCn0KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
