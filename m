Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 627F2E8F80
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 19:48:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPWUT-0006y7-Vk; Tue, 29 Oct 2019 18:45:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BagA=YW=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iPWUS-0006xx-Cr
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 18:45:12 +0000
X-Inumbo-ID: 3c70dbf6-fa7c-11e9-9517-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c70dbf6-fa7c-11e9-9517-12813bfff9fa;
 Tue, 29 Oct 2019 18:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572374711;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=I55YSXA7pjQoZcHHJGLGy0fccawAb9U0zTGV/c/3EMo=;
 b=LPbZ8O/ol0aGNEcuijmkFeyrdFTzo2Yjq9bRtFiFKg4wuVqGjwvqIGH7
 /IzRD/c+Y5KdXaoXnTd+XeZcNk/Srrx5DgOYZQxo0UmGsYnBpemLFPgss
 lehuPXuS9S1AfRfjKQzqZNVZyvXm3T/BUEseeH/BhfxCmqq/idDmk/hv5 o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mUI4n6lV02+GmiOxnjyv0ezXc8TbizuGEvransg1IWAF/Oyms0sArIu9qrP17KuUzxm+1F55t1
 RqzVH8IO6a8KP2JMR9wqEgekpT5gN+nIf4+1ApSD46475LVLxqtA5LaMnuGI4sGYUAa4z1rfIK
 9VMQkKQ9nlLankyFNK71qa5yAuGqEbFHYbqMb7t5nY7frxBLBiZ+WaKDrKBeIQ2UcD1uGFeGJ7
 aFn0YROXwFWtJu+hE2HRMUlhdHSDuepM0ymSV2vhQ2ShyYxjfVlKhxpegDKNirHK/oU94MX7nM
 z1Y=
X-SBRS: 2.7
X-MesageID: 7902339
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,244,1569297600"; 
   d="scan'208";a="7902339"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23992.34990.952195.433864@mariner.uk.xensource.com>
Date: Tue, 29 Oct 2019 18:45:02 +0000
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
In-Reply-To: <bbcb318a-0774-ba98-6f83-49f0ee1c6598@citrix.com>
References: <20191029175720.7354-1-ian.jackson@eu.citrix.com>
 <bbcb318a-0774-ba98-6f83-49f0ee1c6598@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] tools/configure: Honour
 XEN_COMPILE_ARCH and _TARGET_ for shim
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Olaf Hering <olaf@aepfle.de>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1hFTiBQQVRDSCBmb3ItNC4x
M10gdG9vbHMvY29uZmlndXJlOiBIb25vdXIgWEVOX0NPTVBJTEVfQVJDSCBhbmQgX1RBUkdFVF8g
Zm9yIHNoaW0iKToKPiBPbiAyOS8xMC8yMDE5IDE3OjU3LCBJYW4gSmFja3NvbiB3cm90ZToKPiA+
IFRoZSBwdnNoaW0gY2FuIG9ubHkgYmUgYnVpbHQgNjQtYml0IGJlY2F1c2UgdGhlIGh5cGVydmlz
b3IgaXMgb25seQo+ID4gNjQtYml0IG5vd2FkYXlzLiAgVGhlIGh5cGVydmlzb3IgYnVpbGQgc3Vw
cG9ydHMgWEVOX0NPTVBJTEVfQVJDSCBhbmQKPiA+IFhFTl9UQVJHRVRfQVJDSCB3aGljaCBvdmVy
cmlkZSB0aGUgaW5mb3JtYXRpb24gZnJvbSB1bmFtZS4gIFRoZSBwdnNoaW0KPiA+IGJ1aWxkIHJ1
bnMgb3V0IG9mIHRoZSB0b29scy8gZGlyZWN0b3J5IGJ1dCBjYWxscyB0aGUgaHlwZXJ2aXNvciBi
dWlsZAo+ID4gc3lzdGVtLgo+ID4KPiA+IElmIG9uZSBydW5zIGluIGEgTGludXggMzItYml0IHVz
ZXJsYW5kIHdpdGggYSA2NC1iaXQga2VybmVsLCBvbmUgdXNlZAo+ID4gdG8gYmUgYWJsZSB0byBz
ZXQgWEVOX0NPTVBJTEVfQVJDSC4gIEJ1dCBub3dhZGF5cyB0aGlzIGRvZXMgbm90IHdvcmsuCj4g
Cj4gVGhpcyBsb29rcyB0byBiZSBhIGJ1Z2ZpeCB0byA4ODQ1MTU1YzgzMWM1OWU4NjdlZTNkZDMx
ZWU2M2UwY2M2YzdkY2YyID8KPiAKPiBJbiBwYXJ0aWN1bGFyLCB0aGlzIGRlbGV0ZWQgdGhlIGxv
Z2ljIHRvIG9ubHkgYnVpbGQgdGhlIHNoaW0gZm9yCj4gWEVOX1RBUkdFVF9BUkNIICE9IHg4Nl8z
Mi4KClllcy4gIEkgaGF2ZSBhZGRlZCBhIG5vdGUgYWJvdXQgdGhhdCB0byB0aGUgY29tbWl0IG1l
c3NhZ2UgKHN0ZWFsaW5nCnlvdXIgdGV4dCwgdGhhbmtzKSBhbmQgbm93IEkgYW0gQ0NpbmcgdGhl
IGF1dGhvciBhbmQgcmVxdWVzdGVyIG9mIHRoYXQKY29tbWl0LCBmb3IgZm9ybSdzIHNha2UuCgpU
aGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
