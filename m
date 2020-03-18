Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCBB18987F
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 10:50:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEVIN-0005mf-Uo; Wed, 18 Mar 2020 09:47:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/RwZ=5D=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jEVIM-0005mW-C6
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 09:47:26 +0000
X-Inumbo-ID: 78f56d36-68fd-11ea-a6c1-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78f56d36-68fd-11ea-a6c1-bc764e2007e4;
 Wed, 18 Mar 2020 09:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584524847;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pFwuZr3oqoQguSkG6sWBvKiFA8w9YoFvYUAFHz8s9VA=;
 b=GeqU1uY6fFzuc4IRYUL0cMiaKmEl+ydvP97AtwB2Iy5zX9WrBUYoHkAv
 wqZkvQU5zeGYwY4sPZf9CIvrqpCunyj7aF4VLd2St8pQPa3aiYCmC8wz+
 Ve2AZUrrIyvIZHg5RZi/6p6Yn+uPuhleZNsw/8wvXwKjwvk/IWLlYd7yg o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QJmaKY0Ybp54aN7BFVOiGKaWn8yYeMJL2XomL4d22KAUwaH1QjHct46J1w15WAHgO9cj2YZVoW
 w1Y0GNexKTi6drqwAGNcQTQU8nIYBjYiBj4zuP0FxHUp4NZY+jn2qtoFvuTE/mHirj3L4vFbHe
 Pz+gJUkdoueE8+359zfv/tU0JF1Xuu11/eHgp/BeOnfsKvFlHGsde/djywJyuNMXph9PDzQz9/
 6j1O4W31/4jzMMi849Psi5azKdDQQsIGDhHT3U9crZ9FLhIvrdN/eeqw/UkCij3RUsdDcupJ78
 dc0=
X-SBRS: 2.7
X-MesageID: 14381668
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,566,1574139600"; d="scan'208";a="14381668"
Date: Wed, 18 Mar 2020 10:47:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <20200318094712.GO24458@Air-de-Roger.citrite.net>
References: <1584395264-22913-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1584395264-22913-1-git-send-email-igor.druzhinin@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/shim: fix ballooning up the guest
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
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 jbeulich@suse.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXIgMTYsIDIwMjAgYXQgMDk6NDc6NDRQTSArMDAwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gYXJncy5wcmVlbXB0ZWQgYXMgbWVhbmluZ2xlc3MgaGVyZSBhbmQgZG9lc24ndCBz
aG93IGlmIHRoZSBoeXBlcmNhbGwKICAgICAgICAgICAgICAgICBeIGlzICAgICAgICAgICAgICAg
IF4gYXMgaXQgZG9lc24ndCBzaWduYWwgd2hldGhlciB0aGUgaHlwZXJjYWxsIC4uLgo+IHdhcyBw
cmVlbXB0ZWQgYmVmb3JlLiBVc2Ugc3RhcnRfZXh0ZW50IGluc3RlYWQgd2hpY2ggaXMgY29ycmVj
dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0
cml4LmNvbT4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KCkZXSVcsIEkgYWdyZWUgd2l0aCB0aGUgY2hhbmdlIHRvIHRoZSBjb21tZW50IHJlcXVl
c3RlZCBieSBKYW4sIEkgdGhpbmsKdGhpcyBjYW4gYWxsIGJlIGRvbmUgd2hpbGUgY29tbWl0dGlu
Zy4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
