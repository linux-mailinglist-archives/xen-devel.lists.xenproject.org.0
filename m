Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A23DC067F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 15:40:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDqRc-00079R-Fd; Fri, 27 Sep 2019 13:38:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fvvD=XW=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iDqRa-00079M-MO
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 13:37:58 +0000
X-Inumbo-ID: 040d23b4-e12c-11e9-9678-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id 040d23b4-e12c-11e9-9678-12813bfff9fa;
 Fri, 27 Sep 2019 13:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569591477;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=v9f6rei1Zdyc8ASzJccEh88Zo30H004gij6/DgtVEoQ=;
 b=Umjs5VjTydsISMo4UrRQ9G4zlCvJ39EoIouOSlXH5f7hPBAG/OzZJVDg
 mw9QKXMac10gOxv318qVH61eFwM6GJ/iBdORTTiWSgvvLxWE2MthaixJd
 t0YtYVxK2qN2GNppx7G7HaItGDnPLxsJuCTeVSois4xnocVs90m7jhq2D k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: q8g12lcJptioJYwzSPmad+aPtLxlQpUJHmhVTFBr0fnFGzjo7dMO26+eybIOliZKeHjFu+WXDE
 Dz8nMu1DNaBwoSkUzXPvZhoKuEIcORjZRSWys3PLPu0sPWWRzJJqDRsgSkI1zmSF7Ni8B7pWW6
 xPCWeFSm6VrMeryWds/FVmCYH0N65oOgII8huNYqkG6PGtoM027mudR6qJT0cJvzF31f34L/Cx
 U4bKlm9K197jE+tJ9JezkM0414Sp1qPxadnTnERvSa7JQXTShW2mNVZGrLIkPzXAXRg6O+bt1Z
 BTI=
X-SBRS: 2.7
X-MesageID: 6452837
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,555,1559534400"; 
   d="scan'208";a="6452837"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23950.4274.238406.524438@mariner.uk.xensource.com>
Date: Fri, 27 Sep 2019 14:37:54 +0100
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
In-Reply-To: <05b68d90-0fb9-6415-61f3-56881ca428c0@suse.com>
References: <20190927090048.28872-1-jgross@suse.com>
 <20190927090048.28872-2-jgross@suse.com>
 <23949.58956.637645.181431@mariner.uk.xensource.com>
 <05b68d90-0fb9-6415-61f3-56881ca428c0@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v1 1/6] docs: add feature document for Xen
 hypervisor sysfs-like support
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SsO8cmdlbiBHcm/DnyB3cml0ZXMgKCJSZTogW1BBVENIIHYxIDEvNl0gZG9jczogYWRkIGZlYXR1
cmUgZG9jdW1lbnQgZm9yIFhlbiBoeXBlcnZpc29yIHN5c2ZzLWxpa2Ugc3VwcG9ydCIpOgo+IE9u
IDI3LjA5LjE5IDEyOjM3LCBJYW4gSmFja3NvbiB3cm90ZToKPiA+IEkgZ3Vlc3MgdGhhdCBrZXlz
IHdpbGwgYmUgY2hvc2VuIGZyb20gc29tZSBsaW1pdGVkIHNhZmUgY2hhcmFjdGVyCj4gPiBzZXQg
PyAgV2hhdCBhYm91dCB2YWx1ZXMgPyAgTWlnaHQgd2UgY3JlYXRlIGEga2V5IHdob3NlIHZhbHVl
IGNvbnRhaW5zCj4gPiBiaW5hcnkgZGF0YSA/Cj4gCj4gSSdkIGdvIHdpdGggIlstQS1aYS16MC05
QF8uOigpXFtcXSMsO10qIiBmb3Iga2V5cwoKSSB0aGluayB0aGlzIGlzIEFTQ0lJIHByaW50aW5n
IGNoYXJhY3RlcnMgd2l0aCB0aGUgZXhjZXB0aW9uIG9mCiAgISAiIGAgJCAlIF4gJiAqID0gKyB7
IH0gJyB+IDwgPiAvIFwgfAoKSSBzdHJ1Z2dsZSB0byBmaW5kIGEgcHJpbmNpcGxlZCBleHBsYW5h
dGlvbiBmb3IgdGhpcyBwYXJ0aWN1bGFyCmV4Y2x1c2lvbiBzZXQgKGFwYXJ0IGZyb20gLyksIGNv
bnNpZGVyaW5nIHRoYXQgZm9sbG93aW5nIGFyZQppbmNsdWRlZDoKICAtIEAgXyAuIDogKCApIFsg
XSAjICwgOwoKQ291bGQgd2UgYm9ycm93IHNvbWUgZXhpc3RpbmcgcGVybWl0dGVkIGNoYXJhY3Rl
ciBzZXQgPyAgSWYgd2UgYXJlCnBlcm1pdHRpbmcgc2hlbGwgbWV0YWNoYXJhY3RlcnMgd2h5IG5v
dCBqdXN0IHBlcm1pdCBhbGwgcHJpbnRhYmxlCkFTQ0lJIGV4Y2VwdCAvID8KCj4gYW5kIEFTQ0lJ
IGZvciB2YWx1ZXMuCgpEbyB5b3UgbWVhbiAiYW55IDctYml0IGJ5dGUiLCBvciBvY3RldCB2YWx1
ZXMgMzItMTI2ICgweDIwLTB4N2UpCmluY2x1c2l2ZSwgb3Igc29tZXRoaW5nIGVsc2UgPwoKPiA+
IFdvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIGFkZCBhIHNjcmlwdCB0byB4ZW4uZ2l0IHdoaWNoIGxp
c3RzIHRoZQo+ID4geGVuaHlwZnMgYW5kIGNoZWNrcyB0aGF0IGFsbCB0aGUgcGF0aHMgYXJlIGRv
Y3VtZW50ZWQgPyAgV2UgY291bGQgYWRkCj4gPiBhIGZldyBjYWxscyB0byB0aGF0IHRvIG9zc3Rl
c3QuLi4KPiAKPiBJJ2QgZXhwZWN0IHNvbWUgcGFydHMgdG8gYmUgZGVzY3JpYmVkIHJhdGhlciBn
ZW5lcmljYWxseSAoYXMgY2FuIGJlIHNlZW4KPiBpbiBwYXRjaCA2IGZvciB0aGUgcnVudGltZSBw
YXJhbWV0ZXJzKS4gTWF5YmUgSSBzaG91bGQgYWRkIHRoZSBlbnRyaWVzCj4gd2l0aCB3aWxkY2Fy
ZHMgdGhlcmUuCgpUaGF0IHdvdWxkIGJlIG5pY2UuCgo+IE9UT0ggYWRkaW5nIHN1Y2ggYSBzY3Jp
cHQgY2FuIGVhc2lseSBiZSBkb25lIGxhdGVyLCBtYXliZSB3aXRoIHNvbWUKPiB0d2Vha3MgdG8g
dGhlIHBhdGggZG9jdW1lbnRhdGlvbi4KClN1cmUuICBIYXZpbmcgYXQgbGVhc3Qgc29tZSB1bml0
IHRlc3RzIG91Z2h0IHRvIGJlIG9uIHRoZSByb2FkbWFwIGZvcgpzdXBwb3J0ZWQgc3RhdHVzLCBi
dXQgaXQgZG9lc24ndCBuZWVkIHRvIGhhcHBlbiBub3cuCgpJYW4uCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
