Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDEBF7381
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 13:02:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iU8LI-00055G-5s; Mon, 11 Nov 2019 11:58:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VDtj=ZD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iU8LG-000557-Iz
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 11:58:46 +0000
X-Inumbo-ID: 9cc656fe-047a-11ea-a20c-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9cc656fe-047a-11ea-a20c-12813bfff9fa;
 Mon, 11 Nov 2019 11:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573473526;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8yJ/+bHpmKCVr5QObajcP+FJP2gwQ6IRUZ+vk13rTzg=;
 b=ScY8c8OiA8PY/+PT47/56qPF1vaTZbGFluIHQgytJEuCNVMiYZBx5ekw
 F4dyq667PJv9P5rmHBsK8LM0PBeLc8YBtUOHnPBIlrLShjxEO3Szv+TAa
 BMacNaEalJHTVN2ZwMtVb9jZlol+QccVoo0OFDKVnwDTyzlvH4fwe5kCU w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +R0fsxYr/y1ozi0b83Mox8MD0HBCL3E22pT2F63OpWiDsNe//DCIZeBEF0UrowhlQJnn8ZvyY3
 1ihT7L2Uo5lPrD7M/P1bjKbHzIHqoID4qaPu5bbZ38duz2tszyE18WMIc3waJjQy/B3QGspl0H
 +0DDuuFI2Lhhit1vrey9+oXMZvO0+NVwNsf88i/iLWrCQ2rn1UX5VUIr3YO4NFRM/S8Ow4ilZ0
 vwFRbI51gxjY3sTeincS+iG4Qiy6rHL7UcneaOXKaTL+CIdGeNRwYBvbxI3l3udS6V5CGmi6SO
 E0o=
X-SBRS: 2.7
X-MesageID: 8244999
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,292,1569297600"; 
   d="scan'208";a="8244999"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 11 Nov 2019 11:58:34 +0000
Message-ID: <20191111115835.31285-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 1/2] all guest creation: Pause 10s to
 work around libxl/blkback races
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
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gMWQzYTk3YjA2ZDJjCiAgeGwgZ3Vlc3QgY3JlYXRpb246IFBhdXNlIDEwcyB0byB3b3JrIGFy
b3VuZCBsaWJ4bC9ibGtiYWNrIHJhY2VzCndlIGFkZGVkIGEgMTBzIGRlbGF5IHRvIHdvcmsgYXJv
dW5kIGEgcmFjZSBidWcgaW4gTGludXggYmxrYmFjay4KClRoaXMgd2FzIGludGVuZGVkIHRvIGJl
IHVzZWQgaW4gY29tYmluYXRpb24gd2l0aCBlYTY2MjZmN2VkZDkKICBndWVzdF9wcmVwYXJlX2Rp
c2s6IE9ubHkgZG8gdGhlIHVtb3VudCBpZiB3ZSBzZXQgYW4gZW52IHZhcgphZnRlciB3aGljaCBp
dCBpcyBvbmx5IHhsIHdoaWNoIGlzIHZ1bG5lcmFibGUgdG8gdGhpcyByYWNlLgpCdXQgdGhhdCBj
b21taXQgd2FzIHdyb25nLCBzbyB3ZSBtdXN0IHJldmVydCBpdC4gIEFmdGVyIHdlIGRvCnRoYXQg
dGhlIHNsZWVwIGluIHRoZSB4bCBkcml2ZXIgd2lsbCBjb21lIHRvbyBsYXRlLgoKU28sIG1vdmUg
dGhlIDEwcyBzbGVlcCBmcm9tIHRoZSBvc3N0ZXN0IHhsIGFuZCBsaWJ2aXJ0IGRyaXZlcnMgdG8g
dGhlCmdlbmVyYWwgZ3Vlc3QgcHJlcGFyYXRpb24gc3RlcCwgcmlnaHQgbmV4dCB0byB3aGVyZSB0
aGUgYWZmZWN0ZWQgbHYgaW4KdXNlIGNoZWNrIGlzLgoKVGhpcyBpcyBzdGlsbCBhIGJvZGdlLCB1
bmZvcnR1bmF0ZWx5LgoKQ0M6IErDvHJnZW4gR3Jvw58gPGpncm9zc0BzdXNlLmNvbT4KQ0M6IFdl
aSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0
cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJp
eC5jb20+Ci0tLQogT3NzdGVzdC9UZXN0U3VwcG9ydC5wbSAgICAgICB8IDIgKysKIE9zc3Rlc3Qv
VG9vbHN0YWNrL2xpYnZpcnQucG0gfCAxIC0KIE9zc3Rlc3QvVG9vbHN0YWNrL3hsLnBtICAgICAg
fCAxIC0KIDMgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0gYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0
LnBtCmluZGV4IDljOTllZTE3Li5mMmJhYTdjMiAxMDA2NDQKLS0tIGEvT3NzdGVzdC9UZXN0U3Vw
cG9ydC5wbQorKysgYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCkBAIC0xOTM4LDYgKzE5MzgsOCBA
QCBzdWIgZ3Vlc3RfY3JlYXRlX3BhdXNlZCAoJCkgewogc3ViIGd1ZXN0X3ByZXBhcmVfZGlzayAo
JCkgewogICAgIG15ICgkZ2hvKSA9IEBfOwogCisgICAgc2xlZXAoMTApOworCiAgICAgZ3Vlc3Rf
dW1vdW50X2x2KCRnaG8tPntIb3N0fSwgJGdobykKIAlpZiAkRU5WeydPU1NURVNUX0dVRVNUX0RJ
U0tfTU9VTlRfQ0xFQU5VUCd9OwogCmRpZmYgLS1naXQgYS9Pc3N0ZXN0L1Rvb2xzdGFjay9saWJ2
aXJ0LnBtIGIvT3NzdGVzdC9Ub29sc3RhY2svbGlidmlydC5wbQppbmRleCAyM2M3NmNjMC4uZTgx
N2Y1YjQgMTAwNjQ0Ci0tLSBhL09zc3Rlc3QvVG9vbHN0YWNrL2xpYnZpcnQucG0KKysrIGIvT3Nz
dGVzdC9Ub29sc3RhY2svbGlidmlydC5wbQpAQCAtNTUsNyArNTUsNiBAQCBzdWIgY3JlYXRlICgk
JCkgewogICAgIG15ICRsY2ZnID0gJGNmZzsKICAgICAkbGNmZyA9fiBzLC8sLSxnOwogICAgICRs
Y2ZnID0gaG9zdG5hbWVwYXRoKCRobykuIi0tJGxjZmciOwotICAgIHNsZWVwKDEwKTsKICAgICB0
YXJnZXRfY21kX3Jvb3QoJGhvLCAidmlyc2ggZG9teG1sLWZyb20tbmF0aXZlIHhlbi14bCAkY2Zn
ID4gJGNmZy54bWwiLCAzMCk7CiAgICAgdGFyZ2V0X2dldGZpbGVfcm9vdCgkaG8sNjAsIiRjZmcu
eG1sIiwgIiRzdGFzaC8kbGNmZyIpOwogICAgIHRhcmdldF9jbWRfcm9vdCgkaG8sICJ2aXJzaCBj
cmVhdGUgLS1maWxlICRjZmcueG1sIiwgMTAwKTsKZGlmZiAtLWdpdCBhL09zc3Rlc3QvVG9vbHN0
YWNrL3hsLnBtIGIvT3NzdGVzdC9Ub29sc3RhY2sveGwucG0KaW5kZXggNTE3YjBmNGQuLjg1OTcy
NzUzIDEwMDY0NAotLS0gYS9Pc3N0ZXN0L1Rvb2xzdGFjay94bC5wbQorKysgYi9Pc3N0ZXN0L1Rv
b2xzdGFjay94bC5wbQpAQCAtNDMsNyArNDMsNiBAQCBzdWIgZGVzdHJveSAoJCQpIHsKIHN1YiBf
Y3JlYXRlICgkJCQpIHsKICAgICBteSAoJHNlbGYsJGdobywkb3B0aW9ucykgPSBAXzsKICAgICBt
eSAkY2ZnID0gJGdoby0+e0NmZ1BhdGh9OwotICAgIHNsZWVwKDEwKTsKICAgICB0YXJnZXRfY21k
X3Jvb3QoJHNlbGYtPntIb3N0fSwKIAkJICAgICRzZWxmLT57X1ZlcmJvc2VDb21tYW5kfS4iIGNy
ZWF0ZSAkb3B0aW9ucyAkY2ZnIiwgMTAwKTsKIH0KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
