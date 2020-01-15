Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B95513CC7D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 19:47:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irne9-0001Nv-Nh; Wed, 15 Jan 2020 18:44:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aRIg=3E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1irne8-0001No-ES
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 18:44:04 +0000
X-Inumbo-ID: ff0d5680-37c6-11ea-85e7-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff0d5680-37c6-11ea-85e7-12813bfff9fa;
 Wed, 15 Jan 2020 18:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579113841;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=j+Vgup7TUE5JAvNuqV9YyGYViXEb4Evk8gRJBMBVyfk=;
 b=RgFH7E/fUjWYe276e7ORta2hVjTu2llJu099aHJXj/DuPfPEUDjnyFiX
 7s/tT3Ok8jhLYEOVYdR0PKSv/P8xKDi1YxUhbauTgA5+Y2NEiMyvKqz8C
 7KMsf3Xa/ZRvW2vRF4HALn6lbZfgagApkZfTkwv4IVRGM1pCYk87QIbw3 w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LVfohU+1lebfLGXvanskDlv422PSlTq26MSE+XtDGprmfP/gSdF+816+iW73VXTQk8T6q4bjn/
 V/mtpq9KJp84O/HInk9WcorobU4y35zWSutM62yfcHHsSgPOGp1wvTR5aROrA/qTG5ZOAm6byc
 GfKveJX2JTMZFdU9gcPxiFY+pcwV8xg8envVKCkHG1yslGG+1Mi2qGUWzmz9sX/srmGiJQlUB+
 RdbpJzswPOfv2htMRggDXF0tQ/IoZWdg6CZ+oIvAvw2feze0Wmomkubg5zD3YSXg+tqGbJLM1X
 pCE=
X-SBRS: 2.7
X-MesageID: 11555051
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,323,1574139600"; d="scan'208";a="11555051"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 15 Jan 2020 18:43:58 +0000
Message-ID: <20200115184358.21131-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] ARM/boot: Don't poison 'current' during early
 boot
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBsb2dpYyB3YXMgaW5oZXJpdGVkIGZyb20geDg2ICh3aGljaCB3YXMgdXBkYXRlZCBzZXZl
cmFsIHRpbWVzIHNpbmNlKS4KVW5saWtlIHg4NiAoYXQgdGhlIHRpbWUpIGhvd2V2ZXIsIHdoaWxl
IE5VTEwgaXNuJ3QgbWFwcGVkIGluIEFSTSwgMHhmZmZmZjAwMAppcywgbWFraW5nIHRoaXMgYWN0
aXZlbHkgZGFuZ2Vyb3VzLgoKRHJvcCB0aGUgbG9naWMgZW50aXJlbHksIGFuZCBsZWF2ZSAnY3Vy
cmVudCcgYXMgTlVMTCBkdXJpbmcgZWFybHkgYm9vdC4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz4KQ0M6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4K
LS0tCiB4ZW4vYXJjaC9hcm0vc2V0dXAuYyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc2V0dXAuYyBiL3hlbi9hcmNoL2Fy
bS9zZXR1cC5jCmluZGV4IDNjODk5Y2Q0YTAuLjlkZDM3MzhkNDQgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL2FybS9zZXR1cC5jCisrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCkBAIC03OTgsOSArNzk4
LDYgQEAgdm9pZCBfX2luaXQgc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgYm9vdF9waHlzX29mZnNl
dCwKICAgICBwZXJjcHVfaW5pdF9hcmVhcygpOwogICAgIHNldF9wcm9jZXNzb3JfaWQoMCk7IC8q
IG5lZWRlZCBlYXJseSwgZm9yIHNtcF9wcm9jZXNzb3JfaWQoKSAqLwogCi0gICAgc2V0X2N1cnJl
bnQoKHN0cnVjdCB2Y3B1ICopMHhmZmZmZjAwMCk7IC8qIGRlYnVnIHNhbml0eSAqLwotICAgIGlk
bGVfdmNwdVswXSA9IGN1cnJlbnQ7Ci0KICAgICBzZXR1cF92aXJ0dWFsX3JlZ2lvbnMoTlVMTCwg
TlVMTCk7CiAgICAgLyogSW5pdGlhbGl6ZSB0cmFwcyBlYXJseSBhbGxvdyB1cyB0byBnZXQgYmFj
a3RyYWNlIHdoZW4gYW4gZXJyb3Igb2NjdXJyZWQgKi8KICAgICBpbml0X3RyYXBzKCk7Ci0tIAoy
LjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
