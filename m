Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 567CF12E9CB
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 19:14:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in4ww-0003NW-QM; Thu, 02 Jan 2020 18:11:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h/dY=2X=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1in4wv-0003Ml-4n
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 18:11:57 +0000
X-Inumbo-ID: 5c3c8d26-2d8b-11ea-a3ab-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c3c8d26-2d8b-11ea-a3ab-12813bfff9fa;
 Thu, 02 Jan 2020 18:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577988716;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=/53FpydU8dBPD3/6VliKxFqi83Wdtm1o/xr8p9UjJPU=;
 b=dpe+PTBX/XPFtz9MvILsp9Rww6Hu1JWVCb5Ze/xVZzTOzbEn8xKY4vLo
 zlj7DhvrZ9tjuWUUbcE3a7sF0ilFAdKYy+agdJ1cvdAjhv3v9VTN5oP2G
 liK+ewCxkW2NaGdCV2JLrWXt94vPettGVpQKxIHH7Wg7IRMuEpJ+FXkzS 4=;
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
IronPort-SDR: el2vXq0wjdwvy10/fR+wVid9wzNVdr5FCxpnz87Qv1mzrsEzwMU8ViQ/glmmsvF/T4lfrSZ5zR
 rrGklJbVa79HpuJihUD/iQZVn1vEY8/ze8fwI1VO5bVoyORURIX7vBb1gGX3aaxqfzki73Ulvw
 6+yI7mwLtajVVp688sH70ZgwIc6r8kNtbx2R7UTMv0IU7wPdnrktWjIQnUMMIi34j7OxmKR61U
 REjc9vnL67aD/HehCAIcfJD0YAwF8fBeqs3BM895YHpL+cfwPjB9wXrP2ShORGVj3UYTxKmcLt
 sIA=
X-SBRS: 2.7
X-MesageID: 10816731
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,387,1571716800"; d="scan'208";a="10816731"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 2 Jan 2020 18:11:46 +0000
Message-ID: <20200102181146.26429-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] tools/xl/xl_cmdtable.c: Fix a simple typo.
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
Cc: Chad Dougherty <crd@acm.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQ2hhZCBEb3VnaGVydHkgPGNyZEBhY20ub3JnPgoKU2lnbmVkLW9mZi1ieTogQ2hhZCBE
b3VnaGVydHkgPGNyZEBhY20ub3JnPgotLS0KIHRvb2xzL3hsL3hsX2NtZHRhYmxlLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS90b29scy94bC94bF9jbWR0YWJsZS5jIGIvdG9vbHMveGwveGxfY21kdGFibGUuYwppbmRl
eCA1YmFhNjAyM2FhLi4zYjMwMmIyZjIwIDEwMDY0NAotLS0gYS90b29scy94bC94bF9jbWR0YWJs
ZS5jCisrKyBiL3Rvb2xzL3hsL3hsX2NtZHRhYmxlLmMKQEAgLTUwMiw3ICs1MDIsNyBAQCBzdHJ1
Y3QgY21kX3NwZWMgY21kX3RhYmxlW10gPSB7CiAgICAgfSwKICAgICB7ICJsb2FkcG9saWN5IiwK
ICAgICAgICZtYWluX2xvYWRwb2xpY3ksIDAsIDEsCi0gICAgICAiTG9hZHMgYSBuZXcgcG9saWN5
IGludCB0aGUgRmxhc2sgWGVuIHNlY3VyaXR5IG1vZHVsZSIsCisgICAgICAiTG9hZHMgYSBuZXcg
cG9saWN5IGludG8gdGhlIEZsYXNrIFhlbiBzZWN1cml0eSBtb2R1bGUiLAogICAgICAgIjxwb2xp
Y3kgZmlsZT4iLAogICAgIH0sCiAjaWZuZGVmIExJQlhMX0hBVkVfTk9fU1VTUEVORF9SRVNVTUUK
LS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
