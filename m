Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C4A9AC9B
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 12:11:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i16ST-0003P5-Sn; Fri, 23 Aug 2019 10:06:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SWQP=WT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i16SS-0003P0-5n
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 10:06:12 +0000
X-Inumbo-ID: a0e3061f-c58d-11e9-ade4-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0e3061f-c58d-11e9-ade4-12813bfff9fa;
 Fri, 23 Aug 2019 10:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566554771;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8qaYKYm11YmzwuJOELp6UynPG/5SRoeE10YdbvsvMQA=;
 b=JXN6ab04T2lMShVeDjolsoQ9gt0GXrDX24VFhZdhCIup3wx7TARTq13r
 yun+Qe8GgXruvgKFEba++/5OnEKBeYoUCsPtuVs0pC49YxOKXoTwyBQk1
 LQ4TusVrgLTSzZxhdFVBT0IaDMpf6F9mubb2edv+yrSS8z7CpZTOVL21J Y=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: O403kqXG6HQlePwPSxKG/U3wSwqk34+h4fVvYSFr91ybWI5vGgfvKqKbEclUQLBKwR60Fh9Qqw
 EFJTEGy6LlVynL/A4MSxwX1sBA0HC3VmjXHG4Y2do23WVjZObKMuo6VUJ8ejk/eT4zEEf14Cod
 x01CJzbt+S6srzZkDBROV5C2TbRif88x8/MRUWXBvPvutLYxhtl8ZMbRCan2yLDcYIz7peBVzu
 UEqkkr7FnDl+TJNPryYal/x1fTKECVZK1tqVHvXHvUh4MFH8tU2SVc9XOnsgE7dAMS35ahoufe
 MEY=
X-SBRS: 2.7
X-MesageID: 4847247
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,420,1559534400"; 
   d="scan'208";a="4847247"
Date: Fri, 23 Aug 2019 12:05:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190823100557.3lgs7ndxaq7bdldk@Air-de-Roger>
References: <20190816172001.3905-1-paul.durrant@citrix.com>
 <20190816172001.3905-3-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816172001.3905-3-paul.durrant@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v6 02/10] x86/hvm/domain: remove the
 'hap_enabled' flag
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDY6MTk6NTNQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoZSBoYXBfZW5hYmxlZCgpIG1hY3JvIGNhbiBkZXRlcm1pbmUgd2hldGhlciB0aGUg
ZmVhdHVyZSBpcyBhdmFpbGFibGUKPiB1c2luZyB0aGUgZG9tYWluICdvcHRpb25zJzsgdGhlcmUg
aXMgbm8gbmVlZCBmb3IgYSBzZXBhcmF0ZSBmbGFnLgo+IAo+IE5PVEU6IEZ1cnRoZXJtb3JlLCBi
eSBleHRlbmRpbmcgc2FuaXRpemlpbmcgb2YgdGhlIGRvbWFpbiAnb3B0aW9ucycsIHRoZQo+ICAg
ICAgIG1hY3JvIGNhbiBiZSB0cmFuc2Zvcm1lZCBpbnRvIGFuIGlubGluZSBmdW5jdGlvbiBhbmQg
cmUtbG9jYXRlZCB0bwo+ICAgICAgIHhlbi9zY2hlZC5oLiBUaGlzIGFsc28gbWFrZXMgaGFwX2Vu
YWJsZWQoKSBjb21tb24sIHRodXMgYWxsb3dpbmcKPiAgICAgICByZW1vdmFsIG9mIGFuIHVnbHkg
aWZkZWYgQ09ORklHX1g4NiBmcm9tIHRoZSBjb21tb24gaW9tbXUgY29kZS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKUmV2aWV3ZWQt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLCBSb2dl
ci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
