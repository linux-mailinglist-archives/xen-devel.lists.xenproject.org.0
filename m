Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67833B5355
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 18:47:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAGbD-0006oq-9a; Tue, 17 Sep 2019 16:45:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAGbB-0006oW-LH
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 16:45:05 +0000
X-Inumbo-ID: 710164cd-d96a-11e9-961b-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 710164cd-d96a-11e9-961b-12813bfff9fa;
 Tue, 17 Sep 2019 16:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568738680;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=4uEbNrOClCm6Qk0jIH44nIYMV6TxnWg6AOXL9FgIfO0=;
 b=ThiHCnh4rPtaLrHA08cFcgKEw2syJ4/M0jwYQhlxFIweL4xGyz1Ackzr
 Ozm8WFmsh2PgOZ9D/PQa28dZH6sPTGztbBfDwDkqZXplPl0B8dz7PKWLb
 npPB4gmQS/1+OZV6/OrVH6yPebQIR4mfXHCSK8CC6KVNaPjvP27xnYc68 M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /yGi6cv1cks6fhcVr1XbPCqez5rOtXB++FhoejUatXkmSLNFnxOyNANvSm46dVApaUjHp9a2DI
 S/y0EIYYxZEF+7aY0VGfeg+sKGdCIAeKNsQA9dXk+hCy2eHgRUlA4bGpwLejhu4h/+vZYEAMTk
 ttyrAxuaX0gPUlT1UoSphUDq6/xxfnnoLVZAN+02+QrYaM/sS8ymGYUCEGo3bCHIBkJQGIz37I
 lCR8FzdqspvBLMKDacMOlAhZOwva5KWlcPHR4BBaDXc0KBGY3iDjAND1c3+jSuBdNXDB3TSBY0
 yNs=
X-SBRS: 2.7
X-MesageID: 5935444
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5935444"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.3440.78675.224084@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 17:44:32 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190614112444.29980-13-anthony.perard@citrix.com>
References: <20190614112444.29980-1-anthony.perard@citrix.com>
 <20190614112444.29980-13-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 12/15] libxl_usb: Fix
 libxl_device_usbctrl_getinfo
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDEyLzE1XSBsaWJ4bF91c2I6IEZpeCBsaWJ4
bF9kZXZpY2VfdXNiY3RybF9nZXRpbmZvIik6Cj4gYHVzYmN0cmwnIGlzIG1vZGlmaWVkIGluIHRo
aXMgZnVuY3Rpb24gd2hpY2ggZG9lc24ndCBzZWVtcyB0byBiZQo+IGludGVuZGVkLCBhbmQgdXNi
Y3RybGluZm8uYmFja2VuZF9pZCB3YXMgbmV2ZXIgbW9kaWZpZWQuCj4gCj4gVGFrZSB0aGlzIG9w
cG9ydHVuaXR5IHRvIGNvbnNpZnkgdGhlIGFyZ3VtZW50IGB1c2JjdHJsJyBpbiBsaWJ4bCBBUEkK
PiB0byBhdm9pZCBzaW1pbGFyIG1pc3Rha2UuCgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5q
YWNrc29uQGV1LmNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
