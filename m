Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1832AFE258
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 17:10:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVe8x-0002aX-Dj; Fri, 15 Nov 2019 16:08:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ISM0=ZH=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iVe8w-0002aR-15
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 16:08:18 +0000
X-Inumbo-ID: 22557a1c-07c2-11ea-9631-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22557a1c-07c2-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 16:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573834098;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=5E2xpMBk+FiwPQaKMbpl5HoEW8JQBuGFGraz1lh5WfQ=;
 b=FdD5fE46tbJ9roDhcf0G4WBytVr+JLoP+oVPlCWtoaxBvZBzBlAXkV2f
 c8zQT0lrd2VI6iIwkdOHumGJDANE/vp64u37ZJt9cIHlJWs/EvQV8lHct
 f9nfBlIa2GCBZiJVoxchiUN+WaLAFzDE6h7DoOLXGAMxPeBd0xj/KozDe 8=;
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
IronPort-SDR: pdX7MD1pe6g3j0AN/pC92FXjf3L1He7vJNXFUVkWZj9SZftMIOcmVv9fvUC0y7VFQSHOmoYo+n
 ZVyAWtlzd98enn3NhaG7/G1VyPf4RiYoWeCrpi9zqyt5TtHwRPST9Ohvf3hLdjjlUJhpWVY447
 k2fbVGCVkr0TY08HksDAeJZ/awE1EmxHfFTZ3h2Zaqx8mdEKkpjdb3BYSFMM6WtXAgM+idrS2K
 jD22pssYPhdVgGconJE2AO4cgXrOjrEd13PhjIU2MNxNXbj0IWG+LuDIzFYwPZ/YAVkUoUcNAg
 HRM=
X-SBRS: 2.7
X-MesageID: 8506093
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; 
   d="scan'208";a="8506093"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24014.52590.48069.805185@mariner.uk.xensource.com>
Date: Fri, 15 Nov 2019 16:08:14 +0000
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191030180704.261320-4-anthony.perard@citrix.com>
References: <20191030180704.261320-1-anthony.perard@citrix.com>
 <20191030180704.261320-4-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 3/6] libxl: Rename
 ev_devlock to ev_slowlock
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
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1hFTiBQQVRDSCBmb3ItNC4xMyB2MiAzLzZdIGxpYnhs
OiBSZW5hbWUgZXZfZGV2bG9jayB0byBldl9zbG93bG9jayIpOgo+IFdlIGFyZSBnb2luZyB0byBp
bnRyb2R1Y2UgYSBkaWZmZXJlbnQgbG9jayBiYXNlZCBvbiB0aGUgc2FtZQo+IGltcGxlbWVudGF0
aW9uIGFzIHRoZSBldl9kZXZsb2NrIGJ1dCB3aXRoIGEgZGlmZmVyZW50IHBhdGguIFRoZQo+IGRp
ZmZlcmVudCBzbG93bG9jayB3aWxsIGJlIGRpZmZlcmVudGlhdGVkIGJ5IGNhbGxpbmcgZGlmZmVy
ZW50IF9pbml0KCkKPiBmdW5jdGlvbnMuCj4gCj4gU28gd2UgcmVuYW1lIGxpYnhsX19ldl9kZXZs
b2NrIHRvIGxpYl9fZXZfc2xvd2xvY2ssIGJ1dCBrZWVwCj4gbGlieGxfX2V2X2RldmxvY2tfaW5p
dCgpLgo+IAo+IFNvbWUgbG9nIG1lc3NhZ2VzIHByb2R1Y2VkIGV2X3Nsb3dsb2NrIGFyZSBjaGFu
Z2VkIHRvIHByaW50IHRoZQo+IG5hbWUgb2YgdGhlIGxvY2sgZmlsZSAodXNlcmRhdGFfdXNlcmlk
KS4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
