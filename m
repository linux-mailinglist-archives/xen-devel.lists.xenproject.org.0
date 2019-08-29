Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6757FA15DE
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 12:24:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3HYP-0004qT-Rl; Thu, 29 Aug 2019 10:21:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8sxS=WZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i3HYO-0004q2-F4
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 10:21:20 +0000
X-Inumbo-ID: bdd57faa-ca46-11e9-ae64-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdd57faa-ca46-11e9-ae64-12813bfff9fa;
 Thu, 29 Aug 2019 10:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567074080;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2x0TrNo1MrClAZi9Vy9lsOF3ifDgTFCPZA+AI6zP9E8=;
 b=d2vJptSa3kvf0205bMJPB4nlB4FSk8OunU3jfaEk5rhEJ4V62atjeYXZ
 RvW/AB0Mp9Ckg0V36XRmJgSDBv3pmhVsHqi4shs6JxwKzvrSpi9YF8jg9
 F+i1fwrX2Ghqvu06/RUp/OfRCkk2Ay6yd3YmRfaa1Og17OS62AesFY2+M c=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OMlBB/0ZPBZ8es9T0O74s06LuYSCJ9wVR/XObwthcFtuz0OksDzGm9jxmMxJjlMW+oSdXcdKeL
 J+nZkMvQq9MATosF/BXcrnMNsnkVkfUheQiypk4qUnDolg2nhPTgfj3ap2hWRSEP+XkdDrCW77
 W4hbM/bn/HPIPHrpg7h/1Oq2tmOsuYk4LpEw2lJNG2X1ZnIIrOZ6TAli+bTWkModBpV7TKwRvh
 3rU7kF4TA0/u9RvxfI3PJCV2F6VmaF4HelVDLQF8hQJMewAZsvoXQMfBBDLBpPQWNqBbtkY5A8
 Ad4=
X-SBRS: 2.7
X-MesageID: 4885444
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,442,1559534400"; 
   d="scan'208";a="4885444"
Date: Thu, 29 Aug 2019 12:21:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Chao Gao <chao.gao@intel.com>
Message-ID: <20190829102059.bk4l7itydj73d3ua@Air-de-Roger>
References: <1567069347-22841-1-git-send-email-chao.gao@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1567069347-22841-1-git-send-email-chao.gao@intel.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [RFC Patch] xen/pt: Emulate FLR capability
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org,
 Paul Durrant <paul.durrant@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMDU6MDI6MjdQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gQ3VycmVudGx5LCBmb3IgYSBIVk0gb24gWGVuLCBubyByZXNldCBtZXRob2QgaXMgdmlydHVh
bGl6ZWQuIFNvIGluIGEgVk0ncwo+IHBlcnNwZWN0aXZlLCBhc3NpZ25lZCBkZXZpY2VzIGNhbm5v
dCBiZSByZXNldC4gQnV0IHNvbWUgZGV2aWNlcyByZWx5IG9uIFBDSQo+IHJlc2V0IHRvIHJlY292
ZXIgZnJvbSBoYXJkd2FyZSBoYW5ncy4gV2hlbiBiZWluZyBhc3NpZ25lZCB0byBhIFZNLCB0aG9z
ZQo+IGRldmljZXMgY2Fubm90IGJlIHJlc2V0IGFuZCB3b24ndCB3b3JrIGFueSBsb25nZXIgaWYg
YSBoYXJkd2FyZSBoYW5nIG9jY3Vycy4KPiBXZSBoYXZlIHRvIHJlYm9vdCBWTSB0byB0cmlnZ2Vy
IFBDSSByZXNldCBvbiBob3N0IHRvIHJlY292ZXIgdGhlIGRldmljZS4KPgo+IFRoaXMgcGF0Y2gg
ZXhwb3NlcyBGTFIgY2FwYWJpbGl0eSB0byBWTXMgaWYgdGhlIGFzc2lnbmVkIGRldmljZSBjYW4g
YmUgcmVzZXQgb24KPiBob3N0LiBXaGVuIFZNIGluaXRpYXRlcyBhbiBGTFIgdG8gYSBkZXZpY2Us
IHFlbXUgY2xlYW5zIHVwIHRoZSBkZXZpY2Ugc3RhdGUsCj4gKGluY2x1ZGluZyBkaXNhYmxpbmcg
b2YgaW50eCBhbmQvb3IgTVNJIGFuZCB1bm1hcHBpbmcgQkFScyBmcm9tIGd1ZXN0LCBkZWxldGlu
Zwo+IGVtdWxhdGVkIHJlZ2lzdGVycyksIHRoZW4gaW5pdGlhdGUgUENJIHJlc2V0IHRocm91Z2gg
J3Jlc2V0JyBrbm9iIHVuZGVyIHRoZQo+IGRldmljZSdzIHN5c2ZzLCBmaW5hbGx5IGluaXRpYWxp
emUgdGhlIGRldmljZSBhZ2Fpbi4KCkkgdGhpbmsgeW91IGxpa2VseSBuZWVkIHRvIGRlYXNzaWdu
IHRoZSBkZXZpY2UgZnJvbSB0aGUgVk0sIHBlcmZvcm0KdGhlIHJlc2V0LCBhbmQgdGhlbiBhc3Np
Z24gdGhlIGRldmljZSBhZ2Fpbiwgc28gdGhhdCB0aGVyZSdzIG5vIFhlbgppbnRlcm5hbCBzdGF0
ZSBjYXJyaWVkIG92ZXIgcHJpb3IgdG8gdGhlIHJlc2V0PwoKVGhhbmtzLCBSb2dlci4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
