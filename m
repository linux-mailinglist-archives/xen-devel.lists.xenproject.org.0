Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3E397571
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 10:56:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0MM5-0007Xn-BB; Wed, 21 Aug 2019 08:52:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SZvr=WR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i0MM3-0007Xi-VA
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 08:52:31 +0000
X-Inumbo-ID: fc547486-c3f0-11e9-adc2-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc547486-c3f0-11e9-adc2-12813bfff9fa;
 Wed, 21 Aug 2019 08:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566377540;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dk4pbUlm8MOmNuQxg5Z76zYPRgj4gHqTZDDOgIb6Usk=;
 b=hnYZnnAEOZlS24OCdBb7wlHxGu16mUudrjepg0i5ttFw0N0RWVCfQA8d
 KsU30+V/wcg6UK16IGt6t133Bng6x/b3aKD01ocpPNSp6jb/DiuQi9pgH
 B4nWBTGn5H+lPKxSYzauSoIWSrAyz+H8z9CBc9OiTjFIPEobDkfr3iary E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Dk06DfaTNne5N/ObLsuQCxZA1seY75L7VYF0o+l2e89aAKeMGyKTCY75SjKWvJYpGWKl9S5ynI
 oe2xWgp5EYwh9siPMHf5Ivo9hYqz4aXvZ4O7ZK5SPUBOjKd2AFS7Ccj1qwBXAYKI/o5OE3p/D8
 L7qZOefey1aIm1hk4EOA1aN/dSdxtZePpvgHm7hBEeTbN7VeJ17iwejYkB6L8AvKhsWbV9XIxi
 dpXxMmUce1SXpc7biaOP1fiDf8VI/bEwkqcASD624BC8lgW80hGlQPkevhkvKQ02w8qAqUSZCa
 4ng=
X-SBRS: 2.7
X-MesageID: 4698577
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,412,1559534400"; 
   d="scan'208";a="4698577"
Date: Wed, 21 Aug 2019 10:52:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190821085210.kjx53rseieu2uc5k@Air-de-Roger>
References: <20190821082258.36549-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190821082258.36549-1-paul.durrant@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] viridian: make
 viridian_time_domain_freeze() safe to call...
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMDk6MjI6NThBTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IC4uLm9uIGEgcGFydGlhbGx5IGRlc3Ryb3llZCBkb21haW4uCj4gCj4gdmlyaWRpYW5f
dGltZV9kb21haW5fZnJlZXplKCkgYW5kIHZpcmlkaWFuX3RpbWVfdmNwdV9mcmVlemUoKSByZWx5
Cj4gKHJlc3BlY3RpdmVseSkgb24gdGhlIGR5bmFtaWNhbGx5IGFsbG9jYXRlZCBwZXItZG9tYWlu
IGFuZCBwZXItdmNwdSB2aXJpZGlhbgo+IGFyZWFzIFsxXSwgd2hpY2ggYXJlIGZyZWVkIGR1cmlu
ZyBkb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKS4KPiBCZWNhdXNlIGFyY2hfZG9tYWluX3Bh
dXNlKCkgY2FuIGNhbGwgdmlyaWRpYW5fZG9tYWluX3RpbWVfZnJlZXplKCkgdGhpcwo+IGNhbiBs
ZWFkIHRvIGhvc3QgY3Jhc2hlcyBpZiBlLmcuIGEgWEVOX0RPTUNUTF9wYXVzZWRvbWFpbiBpcyBp
c3N1ZWQgYWZ0ZXIKPiBkb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKSBoYXMgcnVuLgo+IAo+
IFRvIHByZXZlbnQgc3VjaCBjcmFzaGVzLCB0aGlzIHBhdGNoIGFkZHMgYSBjaGVjayBvZiBpc19k
eWluZyBpbnRvCj4gdmlyaWRpYW5fdGltZV9kb21haW5fZnJlZXplKCksIGFuZCB2aXJpZGlhbl90
aW1lX2RvbWFpbl90aGF3KCkgd2hpY2ggaXMKPiBzaW1pbGFybHkgdnVsbmVyYWJsZSB0byBpbmRp
cmVjdGlvbiBpbnRvIGZyZWVkIG1lbW9yeS4KPiAKPiBOT1RFOiBUaGUgcGF0Y2ggYWxzbyBtYWtl
cyB2aXJpZGlhbl90aW1lX3ZjcHVfZnJlZXplL3RoYXcoKSBzdGF0aWMsIHNpbmNlCj4gICAgICAg
dGhleSBoYXZlIG5vIGNhbGxlcnMgb3V0c2lkZSBvZiB0aGUgc2FtZSBzb3VyY2UgbW9kdWxlLgo+
IAo+IFsxXSBTZWUgY29tbWl0IGU3YTliNWU3MmYyNiAidmlyaWRpYW46IHNlcGFyYXRlbHkgYWxs
b2NhdGUgZG9tYWluIGFuZCB2Y3B1Cj4gICAgIHN0cnVjdHVyZXMiLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpOb3RlIHlvdSBjb3VsZCBh
bHNvIGRyb3AgdGhlIHZpcmlkaWFuXyBwcmVmaXggdG8gdGhlIG5vdyBzdGF0aWMKZnVuY3Rpb25z
LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
