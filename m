Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E50E10D7A4
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 16:08:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iahp7-0006be-O7; Fri, 29 Nov 2019 15:04:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1wlA=ZV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iahp6-0006bJ-Nn
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 15:04:44 +0000
X-Inumbo-ID: 864af0a4-12b9-11ea-83b8-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 864af0a4-12b9-11ea-83b8-bc764e2007e4;
 Fri, 29 Nov 2019 15:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575039862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=81acVEORuMv/8XGZ17bQ9iMt1XIm+9TtW+j7xzPM8qc=;
 b=Fi9a8Qf8TT1YHlG7sfmmkl67DiDwrolz61PeBeD82NK4AR82VlPAZhdK
 hzDrl+h+FbAPI0vxipESpQWi9AUOx7FKLXhL+bplD7BsIJ3uMdIcmb7DZ
 yqgETvLFd/vrjwKKlAHTcj+aVgWj6bmMlxlE+RjnAUtarms3QHiw28IXV 8=;
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
IronPort-SDR: N5tySMWnfNcc37qzCb2uq7vrR8gLgjbyjwox6N52MNJ908LjoB0YR6TIsbv5hY9elBFI9uyofT
 11Hhe0IozAI/QsBqGfLtZFs/Zv2WKAkAoQN5+6QaSYDl+rJUoDm8OHFjuo8aVkg0O+jEUm0Zjn
 QAXAqCry6h9pMrPNvJkTyDJI8OJXJkxwXU2gzh7+MV+Z5z/CH+Pq2o+8ywiKLVmR80DgFyF2x2
 ztlhBfW/nleIMJhIMGJobHsSTjRlTHUUOSIStfEU/uGzXs/O9e//j5BoJJvu1g1qnpSuQebLCR
 dls=
X-SBRS: 2.7
X-MesageID: 9402076
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="9402076"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 29 Nov 2019 15:04:11 +0000
Message-ID: <20191129150416.4944-5-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191129150416.4944-1-ian.jackson@eu.citrix.com>
References: <20191129150416.4944-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 4/9] release technician checklist: Reformat
 Config.mk changes
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T25lIHBlciBsaW5lIGlzIGEgbG90IGVhc2llciB0byByZWFkLgoKU2lnbmVkLW9mZi1ieTogSWFu
IEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogZG9jcy9wcm9jZXNzL3Jl
bGVhc2UtdGVjaG5pY2lhbi1jaGVja2xpc3QudHh0IHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RvY3MvcHJvY2Vz
cy9yZWxlYXNlLXRlY2huaWNpYW4tY2hlY2tsaXN0LnR4dCBiL2RvY3MvcHJvY2Vzcy9yZWxlYXNl
LXRlY2huaWNpYW4tY2hlY2tsaXN0LnR4dAppbmRleCA1ZGQ4NWRiYzQwLi5lYmYzMzhjOWQ0IDEw
MDY0NAotLS0gYS9kb2NzL3Byb2Nlc3MvcmVsZWFzZS10ZWNobmljaWFuLWNoZWNrbGlzdC50eHQK
KysrIGIvZG9jcy9wcm9jZXNzL3JlbGVhc2UtdGVjaG5pY2lhbi1jaGVja2xpc3QudHh0CkBAIC00
OSw3ICs0OSwxMCBAQCB0PVJFTEVBU0UtJHIKICogY29uc2lkZXIgYnVtcGluZyBzb25hbWVzIG9m
IHNobGlicwogCiAqIGNoYW5nZSB4ZW4tdW5zdGFibGUgUkVBRE1FIChzaG91bGQgc2F5ICJYZW4g
NC41IiBpbiByZWxlYXNlcyBhbmQgb24gc3RhYmxlIGJyYW5jaGVzLCAiWGVuIDQuNS11bnN0YWJs
ZSIgb24gdW5zdGFibGUpCi0qIGNoYW5nZSB4ZW4tdW5zdGFibGUgQ29uZmlnLm1rIChRRU1VX1VQ
U1RSRUFNX1JFVklTSU9OLCBRRU1VX1RSQURJVElPTkFMX1JFVklTSU9OLCBNSU5JT1NfVVBTVFJF
QU1fUkVWSVNJT04pCisqIGNoYW5nZSB4ZW4tdW5zdGFibGUgQ29uZmlnLm1rCisjICAgUUVNVV9V
UFNUUkVBTV9SRVZJU0lPTiwKKyMgICBRRU1VX1RSQURJVElPTkFMX1JFVklTSU9OCisjICAgTUlO
SU9TX1VQU1RSRUFNX1JFVklTSU9OCiAqIGNoYW5nZSBTVVBQT1JULm1kIGhlYWRpbmcgdmVyc2lv
biBudW1iZXI7IC11bnN0YWJsZSBvciAtcmMgdGFnCiAqICAgICAoZW1wdHkgaW4gc3RhYmxlIGJy
YW5jaGVzIGFmdGVyIC4wIHJlbGVhc2UpLgogKiAgICAgaW5zZXJ0IGNvcnJlY3QgdmVyc2lvbiBu
dW1iZXIgaW4gcmVsZWFzZS1ub3RlcyBsaW5rCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
