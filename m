Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1C6B5436
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 19:29:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAHFt-0007yx-EY; Tue, 17 Sep 2019 17:27:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAHFr-0007ym-Rp
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 17:27:07 +0000
X-Inumbo-ID: 5f2e8ecc-d970-11e9-b299-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f2e8ecc-d970-11e9-b299-bc764e2007e4;
 Tue, 17 Sep 2019 17:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568741228;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=DGpBXJuLIT1bzn/ZD3fAnfhh9FROWo+vbeJ5t8xxPFA=;
 b=eY507w/1fbiNGeOXaQil3jouMsjbccN40n9TmPSgeiZiAqaVbNt4KwUZ
 DAcJNQ/yxFh0xb16VxE7ga45OvT1XhdgEBfSNFIhZ1uxKzpI5eOYQWus6
 tNAFuBLVz1QjTce9YJS58WQwOI5X5L9Gq22ek6a26J1QNnlhLDQkfXt3Q o=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: O5H1SEZcZn8rfudt++HqYGvE/QwIf8snjSqFn59GvbunArRZHK+LRVaiVKwMlGlEL05N+Dn7YS
 qMWx0AS9cnADzterbMWS0PmED6qA5Py2L+yJntXS/l/new3g9gMpdYWaTMImwrKQAkfnE3C/UY
 VCRAKkPxPjdRLwcutW8/+70yaf6Ywx72YnndAcdVrMNU3ShJAYtitnKt5D9GCqqYP1uaa4NbwH
 G01cAIxPrgkmvLzXW5/w3SZgGa2JCkcAcD6HcLh6cnBxyyviKjcEcB55PhZkxVVXGmySjCZeOI
 0kg=
X-SBRS: 2.7
X-MesageID: 5684115
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5684115"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.5991.916797.261320@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 18:27:03 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190802153606.32061-31-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-31-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 30/35] libxl_pci: Use ev_qmp for pci_remove
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
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDMwLzM1XSBsaWJ4bF9wY2k6IFVzZSBldl9x
bXAgZm9yIHBjaV9yZW1vdmUiKToKPiBUaGlzIHBhdGNoIGFsc28gcmVwbGFjZXMgdGhlIHVzZSBv
Zgo+IGxpYnhsX193YWl0X2Zvcl9kZXZpY2VfbW9kZWxfZGVwcmVjYXRlZCgpIGJ5IGl0cyBlcXVp
dmFsZW50Cj4gd2l0aG91dCB0aGUgbmVlZCBmb3IgYSB0aHJlYWQuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gLS0tCj4gCj4g
Tm90ZXM6Cj4gICAgIEluIGRvX3BjaV9yZW1vdmUsIGluc3RlYWQgb2YgdXNpbmcgYSBwb2xsIGxv
b3AgeyBldl90aW1lciA7IHF1ZXJ5LXBjaSB9LAo+ICAgICBpdCBjb3VsZCBiZSBwb3NzaWJsZSB0
byBsaXN0ZW4gdG8gZXZlbnRzIHNlbnQgYnkgUUVNVSB2aWEgUU1QOyBpbiBvcmRlcgo+ICAgICB0
byB3YWl0IGZvciB0aGUgcGFzc3Rocm91Z2ggcGNpIGRldmljZSB0byBiZSByZW1vdmVkIGZyb20g
UUVNVS4KPiAgICAgKHBvc3NpYmxlIGltcHJvdmVtZW50KQoKQ2FuIHlvdSBwbGVhc2UgbW92ZSB0
aGlzIGludG8gYSBjb21tZW50IGluIHRoZSBjb2RlID8KCldpdGggdGhhdCBjaGFuZ2UgbWFkZToK
CkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KClRoYW5r
cywKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
