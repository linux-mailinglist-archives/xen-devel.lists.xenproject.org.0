Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B254B5347
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 18:46:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAGZV-0006Ly-HP; Tue, 17 Sep 2019 16:43:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAGZT-0006LI-CJ
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 16:43:19 +0000
X-Inumbo-ID: 40633bf7-d96a-11e9-961b-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40633bf7-d96a-11e9-961b-12813bfff9fa;
 Tue, 17 Sep 2019 16:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568738598;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=g0m9Iv2KjC7pqMBW7DvzEgRbmpVTxxW4rkH/lLSIxR4=;
 b=SnF5ykhbnpXrY44h8+ZzaiDVH6R2q5Xbwy6bgRZ5EjnXwZiskuJ+Pwsc
 G9paWHapTaHaffOarijc6rAldjblgE/leLRzUxHrzrWuLVcuSxrA9OW0Z
 55DmyXwxd6dBlyhZpmJDeWO484lFlzhv/FMnwOa7sYwb36DIWVQBD3PBA Q=;
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
IronPort-SDR: voFdhdp4KHxqn0h5KjrLEBfmV1FxqR+hvuBYiog8LmSDY8aAl7GY1fZoE1WLLsfMHkBmfo+D2O
 gNh/NaDVX2d43kYcSlZUvxtOAI+Q8dCQysljNCag//43IyDdGdGIq/SFvKF5OA2pgtZyJj2cqL
 yQOoad54IIp4hKQhJTMbPyPLqIxbZ0PB2Ib1jne9FulZBOyRwkSW8qXb+75VrS6LJwf0yF1hyi
 isbCpdjPOIrtLAIaxbnwyA6rTT3W+GH0oyM0C+N5DW7pgT6sSNUWjTHAJnKxrT2ESiLW01xm6s
 qng=
X-SBRS: 2.7
X-MesageID: 5681762
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5681762"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.3363.332589.978939@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 17:43:15 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190614112444.29980-11-anthony.perard@citrix.com>
References: <20190614112444.29980-1-anthony.perard@citrix.com>
 <20190614112444.29980-11-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 10/15] libxl_usb: Use proper domid value,
 from libxl__device
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDEwLzE1XSBsaWJ4bF91c2I6IFVzZSBwcm9w
ZXIgZG9taWQgdmFsdWUsIGZyb20gbGlieGxfX2RldmljZSIpOgo+IGFvLT5kb21pZCBpc24ndCBh
IHJlbGlhYmxlIHdheSBvZiBnZXR0aW5nIGEgZG9taWQsIGl0IG1pZ2h0IG5vdCBiZSBzZXQKPiAo
dGhpcyBpc24ndCB0aGUgY2FzZSBoZXJlKS4gVGhlIHJpZ2h0IGRvbWlkIHZhbHVlIGNhbiBiZSBm
b3VuZCBpbiB0aGUKPiBsaWJ4bF9fZGV2aWNlICh3aGljaCBpcyB0aGUgZGV2aWNlIHdlIHdhbnQg
dG8gcmVtb3ZlKSBhdHRhY2hlZCB0bwo+IGxpYnhsX19hb19kZXZpY2UuCgpBY2tlZC1ieTogSWFu
IEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
