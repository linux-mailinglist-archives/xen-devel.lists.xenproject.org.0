Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC06AFAA2
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 12:42:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i802k-0001xU-3M; Wed, 11 Sep 2019 10:40:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bpM+=XG=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i802i-0001xL-LJ
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 10:40:08 +0000
X-Inumbo-ID: 846aa7e3-d480-11e9-ac28-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 846aa7e3-d480-11e9-ac28-12813bfff9fa;
 Wed, 11 Sep 2019 10:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568198408;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=keDhQkTQuwqHi8x46r/2KE32vuY9D6D7zoH2EoUGT3Y=;
 b=iIw+9D6kQFSnpmejv4flQPDD6qOunLCAXOscvyzf4WT/8fwiC0lwyFc8
 R3fty/gm5Bx7XK/Vf7C1hLpAd6R/J/CqvFG4LWgr+kwooyNpJrAJF5lwf
 yRgDiWhKUM1hDwxkxTiEFVtFm01gvtXKIArHqiIwYwwkOT3CaGYnTEI2g E=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Jykfh3PBR0eWLWEC0Uvj3kxJJBpHyt8oAcQPaILmFT7sRT3NnJim2PbHCY52O6ws8XMMvFyp6o
 vQQnDRw6GtyJ81N4uOqlJ79Vw4qNHu/h0ID4c+Z4zlxtElO8QWdmCnDeFVMvBMUi5P6xwT2r66
 0FSEMr6vMp2YqZXHhvQsUOeibpVmCst0xfN4nx+Hgc+oM4i+v+dbKklctD7aODOAUOL/Ijj5yx
 AjD4dPdb8JGj/kFl7y5LJB7BW41PCkwAO4CLGS6cFcmTfXbYHpINcW6ENQhlrK3JZnlB4DAIrW
 Czo=
X-SBRS: 2.7
X-MesageID: 5425223
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,493,1559534400"; 
   d="scan'208";a="5425223"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23928.52965.976467.722814@mariner.uk.xensource.com>
Date: Wed, 11 Sep 2019 11:39:33 +0100
To: Juergen Gross <jgross@suse.com>
In-Reply-To: <20190911060203.25202-1-jgross@suse.com>
References: <20190911060203.25202-1-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] tools: fix linking hypervisor includes to
 tools include directory
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

SnVlcmdlbiBHcm9zcyB3cml0ZXMgKCJbUEFUQ0hdIHRvb2xzOiBmaXggbGlua2luZyBoeXBlcnZp
c29yIGluY2x1ZGVzIHRvIHRvb2xzIGluY2x1ZGUgZGlyZWN0b3J5Iik6Cj4gQW4gaW5jcmVtZW50
YWwgYnVpbGQgb2YgdG9vbHMvaW5jbHVkZSB3b24ndCBwaWNrdXAgbmV3IGh5cGVydmlzb3IKPiBo
ZWFkZXJzIGluIHRvb2xzL2luY2x1ZGUveGVuLiBGaXggdGhhdC4KCkkgcGVyc29uYWxseSBJIHRo
aW5rIHRyeWluZyB0byBnZXQgdGhpcyBraW5kIG9mIHRoaW5nIHRvIHdvcmsgcHJvcGVybHkKd2l0
aCByZWN1cnNpdmUgbWFrZSBpcyB0b28gaGFyZCB0byBiZSB3b3J0aCB0cnlpbmcuICBCdXQgSSB3
b24ndCBzdGFuZAppbiB5b3VyIHdheS4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
