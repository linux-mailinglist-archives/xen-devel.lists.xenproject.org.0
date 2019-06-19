Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 847224B6A4
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 13:05:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdYN7-0002GO-9V; Wed, 19 Jun 2019 11:03:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XeE9=US=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hdYN6-0002G2-6B
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 11:03:20 +0000
X-Inumbo-ID: d6c7aa8a-9281-11e9-8b9e-e730fca96a68
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6c7aa8a-9281-11e9-8b9e-e730fca96a68;
 Wed, 19 Jun 2019 11:03:16 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: s3qYwPVAMhcqeCgfOHZXYkt2NTaHr+nc17sDNxcEnWQhYueJMlb8eJOpH0BFy0fM4aSPZYOgxZ
 NGHjQfWvKpfCdyuPXvPuU5UvThqHhAD9hirUFGbnseGdwwJSAHGT/26aUgz9MAjYZcuIhC+C2c
 JGpx47nMTbnUehUGiur7gy+01jqovJzo/cmzxUXbtO0CC1oU7sfRwuFqOG+qWTquXwux+uAS/i
 v8oIDvzbAeq2m6fZCWWHUpOHUAXoO16G9KTsB9+Eu79WsZ3L6xkvM/tjyNAHYTzZWqtBP45EU0
 I38=
X-SBRS: 2.7
X-MesageID: 1941203
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,392,1557201600"; 
   d="scan'208";a="1941203"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 19 Jun 2019 13:02:49 +0200
Message-ID: <20190619110250.18881-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190619110250.18881-1-roger.pau@citrix.com>
References: <20190619110250.18881-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/4] x86/linker: add a reloc section to ELF
 binary
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWYgdGhlIGh5cGVydmlzb3IgaGFzIGJlZW4gYnVpbHQgd2l0aCBFRkkgc3VwcG9ydCAoaWU6IG11
bHRpYm9vdDIpLgpUaGlzIGFsbG93cyB0byBwb3NpdGlvbiB0aGUgLnJlbG9jIHNlY3Rpb24gY29y
cmVjdGx5IGluIHRoZSBvdXRwdXQKYmluYXJ5LCBvciBlbHNlIHRoZSBsaW5rZXIgbWlnaHQgcGxh
Y2UgLnJlbG9jIGJlZm9yZSB0aGUgLnRleHQKc2VjdGlvbi4KCk5vdGUgdGhhdCB0aGUgLnJlbG9j
IHNlY3Rpb24gaXMgbW92ZWQgYmVmb3JlIC5ic3MgZm9yIHR3byByZWFzb25zOiBpbgpvcmRlciBm
b3IgdGhlIHJlc3VsdGluZyBiaW5hcnkgdG8gbm90IGNvbnRhaW4gYW55IHNlY3Rpb24gd2l0aCBk
YXRhCmFmdGVyIC5ic3MsIHNvIHRoYXQgdGhlIGZpbGUgc2l6ZSBjYW4gYmUgc21hbGxlciB0aGFu
IHRoZSBsb2FkZWQKbWVtb3J5IHNpemUsIGFuZCBiZWNhdXNlIHRoZSBkYXRhIGl0IGNvbnRhaW5z
IGlzIHJlYWQtb25seSwgc28gaXQKYmVsb25ncyB3aXRoIHRoZSBvdGhlciBzZWN0aW9ucyBjb250
YWluaW5nIHJlYWQtb25seSBkYXRhLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IFdl
aSBMaXUgPHdsQHhlbi5vcmc+Ci0tLQogeGVuL2FyY2gveDg2L3hlbi5sZHMuUyB8IDEyICsrKysr
KysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TIGIveGVuL2FyY2gveDg2L3hlbi5s
ZHMuUwppbmRleCA5OGE5OTQ0NGMyLi44MjEwM2VmMWRhIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94
ODYveGVuLmxkcy5TCisrKyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKQEAgLTE3NSw2ICsxNzUs
MTQgQEAgU0VDVElPTlMKICAgfSA6dGV4dAogI2VuZGlmCiAjZW5kaWYKKworI2lmZGVmIFhFTl9C
VUlMRF9FRkkKKyAgLiA9IEFMSUdOKDQpOworICBERUNMX1NFQ1RJT04oLnJlbG9jKSB7CisgICAg
KigucmVsb2MpCisgIH0gOnRleHQKKyNlbmRpZgorCiAgIF9lcm9kYXRhID0gLjsKIAogICAuID0g
QUxJR04oU0VDVElPTl9BTElHTik7CkBAIC0yOTcsMTAgKzMwNSw2IEBAIFNFQ1RJT05TCiAgIF9f
Mk1fcndkYXRhX2VuZCA9IC47CiAKICNpZmRlZiBFRkkKLSAgLiA9IEFMSUdOKDQpOwotICBERUNM
X1NFQ1RJT04oLnJlbG9jKSB7Ci0gICAgKigucmVsb2MpCi0gIH0gOnRleHQKICAgLyogVHJpY2sg
dGhlIGxpbmtlciBpbnRvIHNldHRpbmcgdGhlIGltYWdlIHNpemUgdG8gZXhhY3RseSAxNk1iLiAq
LwogICAuID0gQUxJR04oX19zZWN0aW9uX2FsaWdubWVudF9fKTsKICAgREVDTF9TRUNUSU9OKC5w
YWQpIHsKLS0gCjIuMjAuMSAoQXBwbGUgR2l0LTExNykKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
