Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3C6CFB22
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 15:16:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHpJz-0001iQ-9h; Tue, 08 Oct 2019 13:14:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pQDQ=YB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iHpJy-0001iL-6B
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 13:14:34 +0000
X-Inumbo-ID: 916399d8-e9cd-11e9-97ce-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 916399d8-e9cd-11e9-97ce-12813bfff9fa;
 Tue, 08 Oct 2019 13:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570540474;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sfcDUj4IPg9pC8f3ZIbiEqXzopBFki7ajbnqfNaRZPE=;
 b=AIIpO8gDlngA6VYIojO9Kk80foMrih/7T/O/VtyH3I8CsAq1oWr87Q1w
 M264FYZCPq4LBUKRivXZsFv/I2wFkOtZ8VQdPb/724dq6ZZ1hoNieWNfk
 qCqxlmjSppSJU3yp2nBGoCEmPnAasD+wEYMEjVoN/gcrelekgIpmxNTB4 k=;
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
IronPort-SDR: ftRRPaAf4dLRrO/sWsl7/zuVT2DIQZ8M7/ubLXKQRR9s0UVTY8dyVLhC/aUkDfIuqM8g0L3rmr
 XH/G/Thg1LxIdERkhcNA0Uf8oIQ3ibV0mh9pMdEHX//xnjZ7ZNoQXax04OV87R84zSVVNvofm+
 b6Y4zWV6z1N/T+bWtsmhuY0X6MBizEpA6P6RZvMU7NUTY7yP7+WBMjNMI2920oafRSH+DGZ5Eh
 V2dLOyZLlHl+jVLC7AVSQ8ELRq8W3pf7u4OaSYLrRJDpxPmd8SGcv9gpZvNJyrJGGhLDrOSEIE
 ToU=
X-SBRS: 2.7
X-MesageID: 6602696
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,270,1566878400"; 
   d="scan'208";a="6602696"
Date: Tue, 8 Oct 2019 15:14:25 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191008131425.GE66437@Air-de-Roger>
References: <20191002104935.60245-1-roger.pau@citrix.com>
 <c5dc7c62-ea14-7930-8f2d-62e20984da60@suse.com>
 <20191008092344.GB66437@Air-de-Roger>
 <1a8d42d4-a456-ad55-d063-6099a7b735e8@suse.com>
 <20191008110901.GC66437@Air-de-Roger>
 <9ea4ba56-ffd6-0b4a-47d0-cfac5291d49b@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9ea4ba56-ffd6-0b4a-47d0-cfac5291d49b@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] pci: clear host_maskall field on assign
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
Cc: xen-devel@lists.xenproject.org, Stanislav Spassov <stanspas@amazon.de>,
 Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMDgsIDIwMTkgYXQgMDE6Mjg6NDlQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDguMTAuMjAxOSAxMzowOSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBH
aXZlbiB0aGF0IGFzIHlvdSBjb3JyZWN0bHkgcG9pbnQgb3V0IG1hc2thbGwgaXMgdW5zZXQgYWZ0
ZXIgZGV2aWNlCj4gPiByZXNldCwgSSBmZWVsIHRoYXQgb3B0aW9uIDQgaXMgdGhlIGJlc3Qgb25l
IHNpbmNlIGl0IG1hdGNoZXMgdGhlIHN0YXRlCj4gPiBvZiB0aGUgaGFyZHdhcmUgYWZ0ZXIgcmVz
ZXQuCj4gCj4gUmlnaHQsIHRoYXQncyB0aGUgdmFyaWFudCBjb21pbmcgY2xvc2VzdCB0byB3aGF0
IGhhcmR3YXJlIHN0YXRlCj4gb3VnaHQgdG8gYmUgYXQgdGhhdCBwb2ludC4gV2UnZCBuZWVkIHRv
IGRvdWJsZSBjaGVjayB0aGF0IHRoZQo+IHBlci1lbnRyeSBtYXNrIGJpdHMgYXJlIGFsbCBzZXQg
YXQgdGhhdCBwb2ludC4KCkknbSBub3Qgc2F5aW5nIHN1Y2ggY2hlY2sgaXMgbm90IHdvcnRoIGRv
aW5nLCBidXQgd2h5IGRvIGl0IGluIHRoaXMKY2FzZSBidXQgbm90IHdoZW4gYWxzbyBjbGVhcmlu
ZyB0aGUgbWFza2FsbCAoaW4gbXNpeF9jYXBhYmlsaXR5X2luaXQpCndoZW4gY2FsbGVkIGZyb20g
cHJlcGFyZV9tc2l4PwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
