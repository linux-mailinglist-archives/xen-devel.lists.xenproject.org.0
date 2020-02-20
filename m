Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF7D166260
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 17:24:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4ob0-0008DY-NX; Thu, 20 Feb 2020 16:22:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FovI=4I=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j4ob0-0008DS-5i
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 16:22:38 +0000
X-Inumbo-ID: 34f3b239-53fd-11ea-8561-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34f3b239-53fd-11ea-8561-12813bfff9fa;
 Thu, 20 Feb 2020 16:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582215757;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=8wycRmkADOZw6RZpUgBwpb6PLqI9stm2WZGeEPqilEQ=;
 b=OQRI3JREToI1MWoD454xrvJc2z47Femk3bwQt7zmIXaU4TnHfD9+FjtL
 dQn4lOEICDlCjeRy59lJH9lS8lTWS4XzvqDrbcR/TZn48g+HoCby+EVU0
 +p5Cp2s4TVYkVyS1fiTF1VQVgApzboiU163sxvDNnJ9cSs1rV86dKQ3xV M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3EjGZDsCSv7EUf49wwuLR6JFVxnistCNhIa29aJq7+1Ri4dUbdh3s19fO+M5+dMg5j5FAOAfSi
 B+HODyDXTgna7Q5TgAptFzBZ9kYEWJA3F+9euxO8UVin5BPIzP+0zAYoOjQSmzT8j5k8Vs0CZF
 aMLmZMZzz2cNk4KJKn54fFAqhnQx6ByYOza1YDclywd707g+/BsPYtnTa1OkGe78ACnPu15Ggb
 OKqBE4K7JtMFcRbkPn6T0DwoGdR6VNZimkFu+Ec6bTvkpKSIa5EWgQgqHSlIv1e1bCSrTq/mPz
 rNY=
X-SBRS: 2.7
X-MesageID: 12769933
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,464,1574139600"; d="scan'208";a="12769933"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24142.45641.743692.859399@mariner.uk.xensource.com>
Date: Thu, 20 Feb 2020 16:22:33 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20200219093754.2924-4-pdurrant@amazon.com>
References: <20200219093754.2924-1-pdurrant@amazon.com>
 <20200219093754.2924-4-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v6 3/6] public/xen.h: add a definition for a
 'valid domid' mask
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCB2NiAzLzZdIHB1YmxpYy94ZW4uaDogYWRkIGEg
ZGVmaW5pdGlvbiBmb3IgYSAndmFsaWQgZG9taWQnIG1hc2siKToKPiBBIHN1YnNlcXVlbnQgcGF0
Y2ggd2lsbCBtb2RpZnkgbGlieGwgdG8gYWxsb3cgc2VsZWN0aW9uIG9mIGEgcmFuZG9tIGRvbWlk
Cj4gdmFsdWUgd2hlbiBjcmVhdGluZyBkb21haW5zLiBWYWxpZCB2YWx1ZXMgYXJlIGxpbWl0ZWQg
dG8gYSB3aWR0aCBvZiAxNSBiaXRzLAo+IHNvIGFkZCBhbiBhcHByb3ByaWF0ZSBtYXNrIGRlZmlu
aXRpb24gdG8gdGhlIHB1YmxpYyBoZWFkZXIuCgpUaGlzIGlzIGZpbmUgYnkgbWUgYnV0IEkgd29u
ZGVyIGlmIGh5cGVydmlzb3IgbWFpbnRhaW5lcnMgd291bGQgbGlrZQptb3JlIHJhdGlvbmFsZS4K
CkluIHRoZSBjb252ZXJzYXRpb24gd2hlcmUgSSBhc2tlZCB5b3UgdG8gc3BsaXQgdGhpcyBvdXQg
SSB3cm90ZToKCj4gPiAgIFRoaXMgaXMgdXNlZnVsIGZvciBwcm9ncmFtcyB3aGljaCBuZWVkIHRv
IFtleHBsYW5hdGlvbl0sCj4gPiAgIGluY2x1ZGluZyBmb3IgZXhhbXBsZSwgbGlieGwsIHdoaWNo
IGlzIGdvaW5nIHRvIHdhbnQgdG8KPiA+ICAgcmFuZG9tbHkgZ2VuZXJhdGUgZG9taWRzLgo+ID4g
Cj4gPiBNYXliZSBpdCBuZWVkcyBzb21lIGV4cGxhbmF0aW9uIG9mIHdoeSB0aGlzIGJlbG9uZ3Mg
aW4gdGhlIFhlbgo+ID4gcHVibGljIGhlYWRlcnMgcmF0aGVyIHRoYW4gaW4gc29tZSBoZWFkZXIg
YXZhaWxhYmxlIHRvIGxpYnhjLAo+ID4gbGlieGwgYW5kIG90aGVyIHRvb2xzIHN0dWZmID8KCllv
dXIgY29tbWl0IG1lc3NhZ2Ugc2VlbXMgdG8gbWUgdG8gZXhwbGFpbiB0aGUgZm9ybWVyIGJ1dCBu
b3QgdGhlCmxhdHRlci4gIEkgZG9uJ3Qga25vdyBpZiBoeXBlcnZpc29yIG1haW50YWluZXJzIHdh
bnQgdGhlIGxhdHRlci4KCkFueXdheSwKClJldmlld2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KClRoYW5rcywKSWFuLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
