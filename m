Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A619106FC8
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 12:17:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY6ti-0002hB-As; Fri, 22 Nov 2019 11:14:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mZ44=ZO=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iY6th-0002h5-Da
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 11:14:45 +0000
X-Inumbo-ID: 4948adc2-0d19-11ea-9631-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4948adc2-0d19-11ea-9631-bc764e2007e4;
 Fri, 22 Nov 2019 11:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574421285;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=zp4S6lT4F3c+FwDtepLQ+FhGbZEjUNiCJZFk8fEwq/I=;
 b=WeMIdY0YkkGxkc+f5ViZFB+VLX1OG/AMXaSW9ycbFfSmSWhs46l2zZQ5
 zxhZMafen3aRV1bL2a0+3ahiTnLrTBFItB6KeaZHPiTEpHp/8S5ljIcb3
 qLHh+n4F7JQilXw3he7GM+0EETiJgJnU/OlAk6q19u2TyaJ74JnANax4n 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KJrUsNZjWyrl/5l6md8/vfEx5hamo02OQB86uTUdvwrR/V0MGhdBKmttqsVHoC4TMAdoL0AOIl
 WVKx7HH5CbIIPQH21OsPwl+3QIkXBYOtGpr4GnufF9GEdGRpwQifvhMOerNW3K7BugayWh33yJ
 rG1tjE2bR6MGF4Q7EptHfwBYOEO/qWhIeuhgU7YnPLVHkit92GtfgqPdR8Hfd9twUg3XpCbbDA
 FAhfXZXV/l/1PJ66AsYaixLkLT56ulcnBHuQ1RnbI84TOI9GmEZ5TUg6eujVR90KZJuy3XqRgQ
 Usg=
X-SBRS: 2.7
X-MesageID: 8698825
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,229,1571716800"; 
   d="scan'208";a="8698825"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24023.49953.218810.697415@mariner.uk.xensource.com>
Date: Fri, 22 Nov 2019 11:14:41 +0000
To: Oleksandr Grytsov <al1img@gmail.com>
In-Reply-To: <20191121181300.6497-3-al1img@gmail.com>
References: <20191121181300.6497-1-al1img@gmail.com>
 <20191121181300.6497-3-al1img@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 2/3] libxl: rename VKB backend type
 "linux" to "pv"
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>, "wl@xen.org" <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T2xla3NhbmRyIEdyeXRzb3Ygd3JpdGVzICgiW1BBVENIIHYyIDIvM10gbGlieGw6IHJlbmFtZSBW
S0IgYmFja2VuZCB0eXBlICJsaW51eCIgdG8gInB2IiIpOgo+IEZyb206IE9sZWtzYW5kciBHcnl0
c292IDxvbGVrc2FuZHJfZ3J5dHNvdkBlcGFtLmNvbT4KPiAKPiBUaGVyZSBhcmUgdHdvIGtpbmQg
b2YgVktCIGJhY2tlbmRzOiBRRU1VIGFuZCB1c2VyIHNwYWNlIFBWIGJhY2tlbmQuCj4gRm9yIFBW
IGJhY2tlbmQgImxpbnV4IiBlbnVtIGlzIHVzZWQgYnV0IHRoaXMgbmFtZSBpcyBjb25mdXNlZC4g
UmVuYW1lCj4gImxpbnV4IiBlbnVtIHRvICJwdiIgYXMgaXQgYmV0dGVyIG1hdGNoZXMgdXNlciBz
cGFjZSBQViBiYWNrZW5kLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBHcnl0c292IDxv
bGVrc2FuZHJfZ3J5dHNvdkBlcGFtLmNvbT4KClJlcXVlc3RlZC1ieTogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4KClRoYW5rcy4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
