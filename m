Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8921151ED0
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 17:59:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz1V0-0001fU-Po; Tue, 04 Feb 2020 16:56:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uGhi=3Y=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iz1Uz-0001fN-T9
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 16:56:29 +0000
X-Inumbo-ID: 4940de36-476f-11ea-8fc4-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4940de36-476f-11ea-8fc4-12813bfff9fa;
 Tue, 04 Feb 2020 16:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580835388;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7Z6/+AfNrzWSp0B9fwibBjYM7rtLRLIyWZBq+NZgu3I=;
 b=ZZ0v+dgOMy2fdb/nNA2bnS8wpkNeqS1t3NtRG+tdxt7KpHzbNsfRBXPh
 2Nw5fj9eQioucQc6EmOTL0DHgq7BTD5hT+BOfWiOT4+LiXZAQwQB4uOXP
 Prl4UHA1MKPZVI6dYp3O9qcf+bmZHVyJinJEIJhgyx0j3UfOK9mMhC8g4 Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +5UumUt6Yb7p/YufeQQPGyZkm+rIwWThDm+rvZs/RboU0dkyNc9AVfxshhw990Zag5eF9LxB9N
 f2Ptx9cRnIDRpaKFq6vjDLYVeLxVf/KkfgOuIxDXvUgh+i/ZkzgRQ9oMWNVItzUo/Vgh88myhs
 LmBTHpx0BVkXKtXhgaVY0bfdeowbfyUUg3gerja5or8lCxBj0vM8dWP+oa2oSm0fefHlrNT4DT
 usZ+AsVNzmOC9mqpkXOFkF3wdYhYGBeoHRr5ttlDuzjsN/0OqTYWkcmAE3sFJfEJUc9AaZFMw9
 /hY=
X-SBRS: 2.7
X-MesageID: 12546220
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,402,1574139600"; d="scan'208";a="12546220"
Date: Tue, 4 Feb 2020 17:56:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200204165621.GL4679@Air-de-Roger>
References: <20200204153704.15934-1-liuwe@microsoft.com>
 <20200204153704.15934-2-liuwe@microsoft.com>
 <20200204164805.nb5kqahvv7p6wfb3@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200204164805.nb5kqahvv7p6wfb3@debian>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v7 01/10] x86/hypervisor: make
 hypervisor_ap_setup return an error code
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMDQsIDIwMjAgYXQgMDQ6NDg6MDVQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUdWUsIEZlYiAwNCwgMjAyMCBhdCAwMzozNjo1NVBNICswMDAwLCBXZWkgTGl1IHdyb3Rl
Ogo+ID4gV2Ugd2FudCB0byBiZSBhYmxlIHRvIGhhbmRsZSBBUCBzZXR1cCBlcnJvciBpbiB0aGUg
dXBwZXIgbGF5ZXIuCj4gPiAKPiA+IEZvciBYZW4sIHJlbW92ZSBhbGwgcGFuaWMoKSBhbmQgQlVH
X09OKCkgaW4gaW5pdF9ldnRjaG4gYW5kCj4gPiBtYXBfdmNwdWluZm8uIE9ubHkgcGFuaWMvQlVH
X09OIHdoZW4gWGVuIGNhbid0IGZhaWwgZ3JhY2VmdWxseS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1i
eTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KPiA+IC0tLQo+IAo+IEJUVyBJIGRpc2Nv
dmVyIGFuIGlzc3VlOiBpbml0X2V2dGNobiBzZXRzIEhWTV9QQVJBTV9DQUxMQkFDS19JUlEgZXZl
cnkKPiB0aW1lIGl0IGlzIGNhbGxlZC4gVGhhdCdzIHVubmVjZXNzYXJ5IGZvciBBUHMuIFBlcmhh
cHMgaXQgd291bGQgYmUgYmVzdAo+IHRvIGJyZWFrIHRoYXQgZnVuY3Rpb24gaW50byB0d28sIG9u
ZSBmb3Igc2V0dGluZyBIVk1fUEFSQU1fQ0FMTEJBQ0tfSVJRLAo+IHRoZSBvdGhlciBmb3IgYWxs
b2NhdGluZyBhbmQgc2V0dGluZyBjYWxsYmFjay4gQlNQIG5lZWRzIHRvIGNhbGwgYm90aAo+IHdo
aWxlIEFQcyBvbmx5IG5lZWRzIHRvIGNhbGwgdGhlIGxhdHRlci4KCldlIGNvdWxkIGdhdGUgdGhl
IGNhbGwgdG8gSFZNT1Bfc2V0X3BhcmFtIG9uICFzbXBfcHJvY2Vzc29yX2lkKCksIHRoYXQKd2F5
IHRoZSBCU1Agd291bGQgYmUgdGhlIG9ubHkgb25lIHRvIHNldCBIVk1fUEFSQU1fQ0FMTEJBQ0tf
SVJRLiBJJ20Kbm90IHN1cmUgc3BsaXR0aW5nIHRoaXMgaW50byBhIHNlcGFyYXRlIGZ1bmN0aW9u
IGlzIHdvcnRoIGl0LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
