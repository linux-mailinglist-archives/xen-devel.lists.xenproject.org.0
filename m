Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D38B5356
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 18:48:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAGce-0007Bd-Av; Tue, 17 Sep 2019 16:46:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAGcd-0007BH-45
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 16:46:35 +0000
X-Inumbo-ID: b512ffc2-d96a-11e9-978d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b512ffc2-d96a-11e9-978d-bc764e2007e4;
 Tue, 17 Sep 2019 16:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568738794;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=832LvwtYzCfga0bimt+C5G5YGPZrg7F0kx9f1Q68tpQ=;
 b=SJLHA/ollf3/snV89U2DWvuC86zr3A32/Ar0iHqkL6Ki6K+11K2Ah8mM
 0hNAEBWuduzWQi7i4BvP6LlBogXwS4vmKCB7wmdXUeZL2Vu83mGz53xPQ
 Vwmc1sfs9ppMtqYNmcWx8XT1+5tvuCPYP6PWQt8qrh9vqcl+uxJB9FLSQ o=;
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
IronPort-SDR: J9jgcnNTTXsO9zVzuLbjlVtrChWayrYqsfrxybRhjeFimZme1BaJwmxLlcsFtMIdgvzh/hy7WW
 xprPtUjWKPpBMSXPJSfLrdDsVQhTfBGZcDpf9wd+YIPzrLhGkooEIWikgWFILV6qbhnLXW1Pdy
 E06wKDxU5qwKynapDp+nLuS7lRNz/dLgBHygPt88RvPYg8imfW4IHotWbsDuLDn7JhBWNiTI0m
 facGckT6NFv8p6W06IrWKu7vUaKOHPuYUm1RMXNznGE8nrFpi2L6BtjjtC7+WLWUVxisgU4fAF
 6DU=
X-SBRS: 2.7
X-MesageID: 5681948
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5681948"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.3559.110505.409796@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 17:46:31 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190614112444.29980-16-anthony.perard@citrix.com>
References: <20190614112444.29980-1-anthony.perard@citrix.com>
 <20190614112444.29980-16-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 15/15] libxl_usb: Use usbctrl instead of
 usbctrlinfo
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDE1LzE1XSBsaWJ4bF91c2I6IFVzZSB1c2Jj
dHJsIGluc3RlYWQgb2YgdXNiY3RybGluZm8iKToKPiBUaGUgZnVuY3Rpb25zIHRoYXQgY2FsbHMg
dXNiY3RybF9nZXRpbmZvKCkgb25seSBuZWVkcyBpbmZvcm1hdGlvbiB0aGF0Cj4gY2FuIGJlIGZv
dW5kIGluIGEgYGxpYnhsX2RldmljZV91c2JjdHJsJy4gU28gYXZvaWQgY2FsbGluZwo+IGxpYnhs
X2RldmljZV91c2JjdHJsX2dldGluZm8gYW5kIGNhbGwgbGlieGxfZGV2aWRfdG9fZGV2aWNlX3Vz
YmN0cmwKPiBpbnN0ZWFkLiAobGlieGxfZGV2aWNlX3VzYmN0cmxfZ2V0aW5mbyBuZWVkcyBhIGBs
aWJ4bF9kZXZpY2VfdXNiY3RybCcKPiBhbnl3YXkuKQoKQWNrZWQtYnk6IElhbiBKYWNrc29uIDxp
YW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
