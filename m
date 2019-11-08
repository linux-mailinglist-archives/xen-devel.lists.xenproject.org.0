Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60048F53CF
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 19:52:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT9LW-0008IO-5D; Fri, 08 Nov 2019 18:50:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4xER=ZA=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iT9LU-0008GY-6n
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 18:50:56 +0000
X-Inumbo-ID: a3fd4a46-0258-11ea-a1d6-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3fd4a46-0258-11ea-a1d6-12813bfff9fa;
 Fri, 08 Nov 2019 18:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573239032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=qrzJQmhahvfTPp0hZEvrj2AQz58PZWeWCNZzq89a/eE=;
 b=U19+1uD48oixmUo54iumRcLBE+z4c1oRdjYWG6OaTvjPkWfGdgbeBJF3
 AS+kjuuZqUIx4WHUfh4mcWckg+7EGZipzaI+VP+dzTH2IpJaUvpzwVGvR
 0gVlhE41FnHyDrw6UT0DlYkwQaTaHrAb3k0zhNnUGe+VoTsoFT9h7YmGK c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: V6SjVUiFAjnPPeuqeZoOhSWB15rHrzTKWgEy9zJv0aWlkzL4lkreCnGPpI0RfsLF5hDFmIv5BH
 N9X6WE8hYigpWHP0fI9NnESA2ciL6YIBpveP7ZpeOp8DUepwRlAmQ1rwLA4Wgl86WguS7DORik
 Qub4SP3RZS7yTOiKYSHShno3ENJ+ir2U9K7djibtcyJKAf2bCZMIFlfonb9piPqtQ1W3qoR7U4
 NahEhY6cw30cxFAZDZBzFVV1MnWB0CWcHlO8m4ZIbcaPRTh6iiRa7j51UI1EbKezhk0to3Gbpa
 rG4=
X-SBRS: 2.7
X-MesageID: 8482905
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,282,1569297600"; 
   d="scan'208";a="8482905"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 8 Nov 2019 18:49:56 +0000
Message-ID: <20191108185001.3319-9-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
References: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 08/13] sg-report-host-history: Write
 cache entries
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V3JpdGUgdGhlICUkanIgY29udGVudHMgb3V0IGluIGEgZmFpcmx5IHRlcnNlIGZvcm1hdC4gIFdl
IHN0dWZmIGl0CmludG8gYSBwYXJzZWFibGUgU0dNTC9YTUwgY29tbWVudCBpbiB0aGUgb3V0cHV0
IEhUTUwuCgpOb3RoaW5nIG1ha2VzIHVzZSBvZiB0aGlzIHlldCAtIHBhcnNpbmcgaXQgYmFjayBp
biB3aWxsIGNvbWUgbGF0ZXIuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4KLS0tCiBzZy1yZXBvcnQtaG9zdC1oaXN0b3J5IHwgMjMgKysrKysr
KysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvc2ctcmVwb3J0LWhvc3QtaGlzdG9yeSBiL3NnLXJlcG9ydC1ob3N0LWhpc3RvcnkK
aW5kZXggODc2N2IyNWQuLjMzNWVmYTFjIDEwMDc1NQotLS0gYS9zZy1yZXBvcnQtaG9zdC1oaXN0
b3J5CisrKyBiL3NnLXJlcG9ydC1ob3N0LWhpc3RvcnkKQEAgLTI0Niw2ICsyNDYsMjcgQEAgRU5E
CiAJcHVzaCBAcm93cywgeyAlJGpyLCAlJGVuZGVkcm93IH07CiAgICAgfQogCisgICAgbXkgJHdy
aXRlX2NhY2hlX2VudHJ5ID0gc3ViIHsKKwlteSAoJGpyKSA9IEBfOworICAgICAgICBwcmludCBI
ICI8IS0tIG9zc3Rlc3QtcmVwb3J0LXJldXNlYWJsZSI7CisJbXkgJHdoYXNoID0gc3ViIHsKKwkg
ICAgbXkgKCRoKSA9IEBfOworCSAgICBmb3JlYWNoIG15ICRrIChzb3J0IGtleXMgJSRoKSB7CisJ
CW5leHQgaWYgJGsgPX4gbS9eXCUvOworCQkkXyA9ICRoLT57JGt9OworCQlze1teLSs9L346O18u
LFx3XX17IHNwcmludGYgIiUlJTAyeCIsIG9yZCAkJiB9Z2U7CisJCXByaW50ZiBIICIgJXM9JXMi
LCAkaywgJF87CisJICAgIH0KKwl9OworCSR3aGFzaC0+KCRqcik7CisJZm9yZWFjaCBteSAkaGsg
KHNvcnQga2V5cyAlJGpyKSB7CisJICAgIG5leHQgdW5sZXNzICRoayA9fiBtL15cJS87CisJICAg
IHByaW50IEggIiAkJyI7CisJICAgICR3aGFzaC0+KCRqci0+eyRoa30pOworCX0KKwlwcmludCBI
ICIgLS0+XG4iOworICAgIH07CisKICAgICBAcm93cyA9IHNvcnQgeyAkYi0+e2ZpbmlzaGVkfSA8
PT4gJGEtPntmaW5pc2hlZH0gfSBAcm93czsKICAgICAkI3Jvd3MgPSAkbGltaXQtMSBpZiBAcm93
cyA+ICRsaW1pdDsKIApAQCAtMzM4LDYgKzM1OSw4IEBAIEVORAogICAgICAgICBwcmludCBIICI8
dGQ+IiBpZiAhJGFueV9wb3dlcjsKIAlwcmludCBIICI8L3RkPlxuIjsKIAorCSR3cml0ZV9jYWNo
ZV9lbnRyeS0+KCRqcik7CisKIAlwcmludCBIICI8L3RyPlxuXG4iOwogCSRhbHRlcm5hdGUgXj0g
MTsKICAgICB9Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
