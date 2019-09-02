Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 891B7A5BA9
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 19:06:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4piW-0002Xh-N9; Mon, 02 Sep 2019 17:02:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1c4v=W5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i4piW-0002Xc-1s
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 17:02:12 +0000
X-Inumbo-ID: 6670b69a-cda3-11e9-aea4-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6670b69a-cda3-11e9-aea4-12813bfff9fa;
 Mon, 02 Sep 2019 17:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567443731;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=Z2FS/vw5diqsSDK5jS3AiVR5z/ICCocUZW6YDjDmijA=;
 b=OineXqIX8xV2dtpgOXe1oSqMPDuDP7eEyE4stIcSvwWH5A3MDgaMhIY1
 vEsP6hZQhuHMC3xaYij0PGVT4dbQ0NNQntPYFEbmPiV4qibOoK21sn4Fj
 XuKqk5ghN5ZaEfQczlMYcMeO1FxSXJeYpQDq1aKDdvhxYDRq382TEFDZM 8=;
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
IronPort-SDR: ug9xyGst+dVelxH2D/cQhvvBIupkXoSrK8cUPWHjY7nrNPybtayN3/bAe5aDhd1/IKnTKYevDN
 JWiBIB8QbdKE7cv2ViEAtJFuzCbbW6j9foa34t9XXApgg7eMmb902CgCd76g7yLAm6w7WITJjr
 DfQPvoLSsjHF5rih7RPqiXf//gieCuMOdOF4JBKoSIJ2A5I3Ttw3DLk3tbjETRzj4sFI6pUuLs
 r0IYvdQJTZfuyI/rGVmDdOXmjz1C+VG9nQIwDXZGeg88BRjhe+1lDbG73aV5/2+D/zfb+G2UOH
 eNQ=
X-SBRS: 2.7
X-MesageID: 5246651
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,459,1559534400"; 
   d="scan'208";a="5246651"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23917.19185.916935.665115@mariner.uk.xensource.com>
Date: Mon, 2 Sep 2019 18:01:37 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20190902164148.28977-2-andrew.cooper3@citrix.com>
References: <20190902164148.28977-1-andrew.cooper3@citrix.com>
 <20190902164148.28977-2-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 1/2] tools/shim: Fix race condition creating
 linkfarm.stamp
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
Cc: Wei Liu <wl@xen.org>, George
 Dunlap <George.Dunlap@citrix.com>, Sander Eikelenboom <linux@eikelenboom.it>,
 Jan
 Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggMS8yXSB0b29scy9zaGltOiBGaXggcmFjZSBj
b25kaXRpb24gY3JlYXRpbmcgbGlua2Zhcm0uc3RhbXAiKToKPiBJbiB0aGUgY2FzZSB0aGUgd2hp
bGUgbG9vcCBnZXRzIGludGVycnVwdGVkLCB0aGUgdGFyZ2V0IG11c24ndCBhcHBlYXIgYXMKPiB1
cC10by1kYXRlLiAgVGhlIG1vdiAkWC50bXAgJFggbXVzdCBiZSB0aGUgbGFzdCBhY3Rpb24gb2Yg
dGhlIHJ1bGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0
cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
