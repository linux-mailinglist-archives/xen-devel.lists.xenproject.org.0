Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49E01429B8
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 12:42:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itVNg-0004Os-HC; Mon, 20 Jan 2020 11:38:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UWIx=3J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1itVNf-0004On-5u
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 11:38:07 +0000
X-Inumbo-ID: 5046b34d-3b79-11ea-b950-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5046b34d-3b79-11ea-b950-12813bfff9fa;
 Mon, 20 Jan 2020 11:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579520283;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pk8xGXkcHKBrRpE/CTpzb9Ixeb51MWei/xKOo8O3Dbo=;
 b=a40gegvLK34W1tvap2bb4QGr37NR0KEDVbfpD/CAIG/FKIPEIgOKkZqS
 Il5XMcSXWFv+/v3rA1DzBg57eKSQwHNllVlXwaVZXRyXHINT1U58g+w3J
 4FpBHitnE0KkIM0uw48sjjszlNa2VbpMF6INYUaTfjmcFipGXNRwKgFL6 A=;
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
IronPort-SDR: 15TUAWDgavKtbboKLhg/UwJsJFsCGMLhYmw6BA4UGsZ2zRsDus68AYatFjX8oIiZCed+SliN3q
 Y7X6zQFPa5oBpyndxf6jWZm8UcsaynBArCi8csiFBK1nmqfM1yogtBZojSBWbo4i5G4N0t+SzG
 EaAIFCNuXxqP9E0GKUXWPBDX12KFyzKQu5K48z3do2HXrFVOwtGymHr+DwTvcOpjoMLZTVbxp9
 EfNNjZbClUiMxxjgEm5n5ASjsnzzXC2t16uXa0S8v9etCNVs1fwaVxYl+j9A7fbEz+X9XXjPwm
 f+4=
X-SBRS: 2.7
X-MesageID: 11586969
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,341,1574139600"; d="scan'208";a="11586969"
Date: Mon, 20 Jan 2020 11:37:54 +0000
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200120113754.GX11756@Air-de-Roger>
References: <6f167053-38dc-19b5-a873-321d978e9a59@suse.com>
 <00519a57-b2e8-de51-4113-5d3949f0e31f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00519a57-b2e8-de51-4113-5d3949f0e31f@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 2/8] x86: move back clang no integrated
 assembler tests
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMDYsIDIwMjAgYXQgMDU6MzU6MTZQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhpcyBsYXJnZWx5IHJldmVydHMgZjE5YWYyZjExMzhlICgieDg2OiByZS1vcmRlciBj
bGFuZyBubyBpbnRlZ3JhdGVkCj4gYXNzZW1ibGVyIHRlc3RzIik6IE90aGVyIENGTEFHUyBzZXR1
cCB3b3VsZCBiZXR0ZXIgaGFwcGVuIGZpcnN0LCBpbiBjYXNlCj4gYW55IG9mIGl0IGFmZmVjdHMg
dGhlIGJlaGF2aW9yIG9mIHRoZSBpbnRlZ3JhdGVkIGFzc2VtYmxlci4gVGhlIGNvbW1lbnQKPiBh
ZGRpdGlvbiBvZiBjb3Vyc2UgZG9lc24ndCBnZXQgdW5kb25lLiBUaGUgb25seSByZW1haW5pbmcg
YXMtb3B0aW9uLWFkZAo+IGludm9jYXRpb24gZ2V0cyBtb3ZlZCBkb3duIGluIGFkZGl0aW9uLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmll
d2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5rcywg
Um9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
