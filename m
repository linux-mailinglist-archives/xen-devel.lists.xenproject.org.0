Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF3414BF33
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 19:09:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwVE5-0000Uv-Ok; Tue, 28 Jan 2020 18:04:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SXoc=3R=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iwVE4-0000Uq-98
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 18:04:36 +0000
X-Inumbo-ID: a3eb573e-41f8-11ea-8752-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3eb573e-41f8-11ea-8752-12813bfff9fa;
 Tue, 28 Jan 2020 18:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580234675;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=8wyXNrP7fSTTiVfzAa/FfG0w0pczxJgw4PLTGdVaeeI=;
 b=Eizl7M52TLjevnemooKFr7XcsD2ApeTWuvwMqyExO1h/HBnbG9uM9Frp
 V15xv5A/EO6AHCauOqMYJWvSKqTjKShrXt0SfFW3Bwx6MUG0wjVDdrd7Q
 9bSJ8KIWa8YX2pAkFofPUjakjLYNcbM4AnFUVdVBLsBLI/nMOD1Az3b5s E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RsvpHXTGR22TjFq2UCvXbRGds3w4oi+0I59UJslfiyPHPplmL6fZAokyfETZ4BOv6u6nO1Dxeo
 /t/k8EfxnZy55kmk+7FoKteCEqbvpqYrshpCypvgG0RhhkvFaZ4Cu1eCAPa3R4w3E/cA6pRymU
 dKq7Q0MZkx69OJcdLBRg1Jem8dVF3nacW0yxHM3mqqF4br+OQAUXAwEnHPxqMjTc/eKNwh99q/
 OuTu4SMhhmOoOwU/lfXodks7L0O5NVteWUiLoaAAFk8a8dd9ch7nAtnP9mVCep04Vq2PN41fFC
 y48=
X-SBRS: 2.7
X-MesageID: 11744615
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,374,1574139600"; d="scan'208";a="11744615"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24112.30639.148322.390708@mariner.uk.xensource.com>
Date: Tue, 28 Jan 2020 18:04:31 +0000
To: Wei Liu <wl@xen.org>
In-Reply-To: <20200128142623.jtofd5qdu33yiyb4@debian>
References: <20200128062107.14334-1-jgross@suse.com>
 <20200128142623.jtofd5qdu33yiyb4@debian>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2] docs: document CONTROL command of
 xenstore protocol
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2VpIExpdSB3cml0ZXMgKCJSZTogW1BBVENIIHYyXSBkb2NzOiBkb2N1bWVudCBDT05UUk9MIGNv
bW1hbmQgb2YgeGVuc3RvcmUgcHJvdG9jb2wiKToKPiBPbiBUdWUsIEphbiAyOCwgMjAyMCBhdCAw
NzoyMTowN0FNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+ID4gVGhlIENPTlRST0wgY29t
bWFuZCAoZm9ybWVyIERFQlVHIGNvbW1hbmQpIGlzbid0IHNwZWNpZmllZCBpbiB0aGUKPiA+IHhl
bnN0b3JlIHByb3RvY29sIGRvYy4gQWRkIGl0Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gCj4gQWNrZWQtYnk6IFdlaSBMaXUgPHdsQHhl
bi5vcmc+Cj4gQmFja3BvcnQ6IDQuOSsKCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4KCkFuZCBhcHBsaWVkLCB0aGFua3MuCgpJYW4uCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
