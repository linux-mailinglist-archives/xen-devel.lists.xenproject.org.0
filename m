Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E36128230
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 19:27:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiMx0-0005NY-3y; Fri, 20 Dec 2019 18:24:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ryrQ=2K=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iiMwz-0005NO-Cp
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 18:24:33 +0000
X-Inumbo-ID: f7399639-2355-11ea-93c3-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7399639-2355-11ea-93c3-12813bfff9fa;
 Fri, 20 Dec 2019 18:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576866273;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=x26euF9+XmnzNIqza2rzHiV/gG0oMsk+HyL7PWE2UKw=;
 b=Ah6PR1i0mJpecCLwzPja2t8cC2H6yzXI5KFiwbKiCDFOaDuCC7XiO0YX
 c+2RPmFA1SDzU6yN5FRUBMBYM8WH7NuCk34+CkQd37cstOyCVresVdHOJ
 W/Plbv+WlU20Dj6VHGfDS+cX8YckBiy0tDNrhY1hIxtfOyRPNXIjiMXhE k=;
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
IronPort-SDR: N0KMJVT+YfG/3kRWodhvjwU6x3Wek+vRyu2qD+qsyxqa7Kg2lj2knOx7fRJZn7/F7OzXx3N/8+
 Y5LRlKbqsTy4dJ2zpLYf9cJvozZ79Ls18dG/0eGFXSdwTO+yP7ic1T2YFX2p0zwNfiJoxYp/Bz
 epEjctIYfWEWc4kC/d4CbO2DPzQ4RwUXwyozZ4PwRYqC4ISx5lrbUBPYUxrHEKpBRLoUq8OmDL
 l9Zjw1HTyUctmNNnR5wK7tG7ZkU0KnHVKeduSOLickcip4n65KcHeHUgEL0/ioygZ6rkE1NQfJ
 224=
X-SBRS: 2.7
X-MesageID: 10157090
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,336,1571716800"; d="scan'208";a="10157090"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24061.4572.799452.523703@mariner.uk.xensource.com>
Date: Fri, 20 Dec 2019 18:24:28 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20191220173502.15615-1-andrew.cooper3@citrix.com>
References: <20191220173502.15615-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] libxc/migration: Drop unimplemneted domain
 types
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0hdIGxpYnhjL21pZ3JhdGlvbjogRHJvcCB1bmlt
cGxlbW5ldGVkIGRvbWFpbiB0eXBlcyIpOgo+IHg4NiBQVkggaXMgY29tcGxldGVseSBvYnNvbGV0
ZSAtIGl0IHdhcyBpbnRlbmRlZCBmb3IgbGVnYWN5IFBWSCBiZWZvcmUgdGhhdAo+IGlkZWEgd2Fz
IGFiYW5kb25lZC4gIFRoZXJlIHdhcyBhbiBSRkMgc2VyaWVzIGZvciBBUk0gaW4gMjAxNSwgYnV0
IHRoZXJlIGlzCj4gcGxlbnR5IG9mIG91dHN0YW5kaW5nIHdvcmsgd2hpY2ggaGFzbid0IGJlZW4g
ZG9uZSB5ZXQuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuICBOZXcgdHlwZXMgY2FuIGJlIChy
ZSlpbnRyb2R1Y2VkIHdpdGggdGhlIGNvZGUgd2hpY2gKPiBhY3R1YWxseSBpbXBsZW1lbnRzIHRo
ZW0uCi4uLgo+IC0gICAgICAgICAgICAweDAwMDM6IHg4NiBQVkguCj4gLQo+IC0gICAgICAgICAg
ICAweDAwMDQ6IEFSTS4KPiAtCj4gLSAgICAgICAgICAgIDB4MDAwNSAtIDB4RkZGRkZGRkY6IFJl
c2VydmVkLgo+ICsgICAgICAgICAgICAweDAwMDMgLSAweEZGRkZGRkZGOiBSZXNlcnZlZC4KClRo
aXMgaXMgcmVjbGFpbWluZyB0aG9zZSBudW1iZXJzLiAgQ291bGQgdGhlcmUgYmUgYW55IHNvZnR3
YXJlIHdoaWNoCnVzZXMgdGhlbSA/ICBFZywgbWF5YmUgc29tZW9uZSBwdXQgdGhlIFJGQyBzZXJp
ZXMgaW50byBwcm9kdWN0aW9uID8KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
