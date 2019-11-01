Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A98BBEC99C
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2019 21:28:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQdTx-0000gw-7Q; Fri, 01 Nov 2019 20:25:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6PC9=YZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iQdTv-0000gQ-5h
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2019 20:25:15 +0000
X-Inumbo-ID: b3d6591c-fce5-11e9-b7a7-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3d6591c-fce5-11e9-b7a7-bc764e2007e4;
 Fri, 01 Nov 2019 20:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572639911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Okn84ErsaYuprTiAxl1jSTbyrrFVMHsnkGQTaGrgZsY=;
 b=SDAiLyU90xfHC1atqyxjI9UTYDt9CEnxXzUBoprQXLLfLWPnx0it27xx
 +hpUXKxFgVW14VCOxGnaayq0VzVKg/XiBg7CiYnPxmQ0qDDSnWWpuBXYW
 FySp0eJntvjFv4wpc1RCL1dQ9PBdlI5bvcP2pmzLh/+PhNfoY/0iaCuG9 E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Fp22Y6DKn1x/VNnWpVeiEpCS5Fgwxio9tIJ4A2GyLEiromNyl7VTmiPaSGb4S2qYFaKucfs9vW
 hHr9Iiu09Qw8JG7/rBVzBZNbm5LBn1C7XYYfiB7rgB4eWrulPGX05Nt33pFOzGNhzHDO0W+xUW
 Xt88NYSgJocJmlcLC6ZumbwcVXY5270n2KDSUx67ATzzD/18fDr+aj2h5maObKVxJKZV4nVR7q
 rz4wycx5ynIgl4zYu+tglwqBkLAjDk1LZqx4n2bYcbbTmKDH5IAwfrI4WOernIxxw8SUSC4sTB
 C2s=
X-SBRS: 2.7
X-MesageID: 7746114
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,256,1569297600"; 
   d="scan'208";a="7746114"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 1 Nov 2019 20:25:01 +0000
Message-ID: <20191101202502.31750-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191101202502.31750-1-andrew.cooper3@citrix.com>
References: <20191101202502.31750-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/3] x86/boot: Cache cpu_has_hypervisor very
 early on boot
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgY2FjaGUgTG9uZyBNb2RlIGFuZCBObyBFeGVjdXRlIGVhcmx5IG9uIGJvb3QsIHNvIHRha2Ug
dGhlIG9wcG9ydHVuaXR5IHRvCmNhY2hlIEhZUEVSVklTT1IgZWFybHkgYXMgd2VsbC4KClJlcGxh
Y2Ugb3BlbmNvZGVkIGVhcmx5IGFjY2VzcyB0byB0aGUgZmVhdHVyZSBiaXQuCgpTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEph
biBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkND
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IFNlcmdleSBEeWFz
bGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvYXBpYy5jICAgICAgICAgfCAyICstCiB4ZW4vYXJj
aC94ODYvYm9vdC9oZWFkLlMgICAgfCA0ICsrKysKIHhlbi9hcmNoL3g4Ni9lZmkvZWZpLWJvb3Qu
aCB8IDYgKysrKy0tCiB4ZW4vYXJjaC94ODYvZ3Vlc3QveGVuLmMgICAgfCA2ICstLS0tLQogeGVu
L2FyY2gveDg2L21tLmMgICAgICAgICAgIHwgMyArLS0KIDUgZmlsZXMgY2hhbmdlZCwgMTEgaW5z
ZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2Fw
aWMuYyBiL3hlbi9hcmNoL3g4Ni9hcGljLmMKaW5kZXggYTVmN2IwNWQ1YS4uYThlZTE4NjM2ZiAx
MDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2FwaWMuYworKysgYi94ZW4vYXJjaC94ODYvYXBpYy5j
CkBAIC0xMTU2LDcgKzExNTYsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgY2hlY2tfZGVhZGxpbmVf
ZXJyYXRhKHZvaWQpCiAgICAgY29uc3Qgc3RydWN0IHg4Nl9jcHVfaWQgKm07CiAgICAgdW5zaWdu
ZWQgaW50IHJldjsKIAotICAgIGlmICggYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX0hZUEVSVklT
T1IpICkKKyAgICBpZiAoIGNwdV9oYXNfaHlwZXJ2aXNvciApCiAgICAgICAgIHJldHVybjsKIAog
ICAgIG0gPSB4ODZfbWF0Y2hfY3B1KGRlYWRsaW5lX21hdGNoKTsKZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9ib290L2hlYWQuUyBiL3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUwppbmRleCA3NzMw
OWUzYzgyLi44ZDBmZmJkMWIwIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMK
KysrIGIveGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TCkBAIC02MzAsNiArNjMwLDEwIEBAIHRyYW1w
b2xpbmVfc2V0dXA6CiAKIDE6CiAgICAgICAgIC8qIEludGVycm9nYXRlIENQVSBleHRlbmRlZCBm
ZWF0dXJlcyB2aWEgQ1BVSUQuICovCisgICAgICAgIG1vdiAgICAgJDEsICVlYXgKKyAgICAgICAg
Y3B1aWQKKyAgICAgICAgbW92ICAgICAlZWN4LCBzeW1fZnMoYm9vdF9jcHVfZGF0YSkgKyBDUFVJ
TkZPX0ZFQVRVUkVfT0ZGU0VUKFg4Nl9GRUFUVVJFX0hZUEVSVklTT1IpCisKICAgICAgICAgbW92
ICAgICAkMHg4MDAwMDAwMCwlZWF4CiAgICAgICAgIGNwdWlkCiAgICAgICAgIHNobGQgICAgJDE2
LCVlYXgsJWVjeApkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2VmaS9lZmktYm9vdC5oIGIveGVu
L2FyY2gveDg2L2VmaS9lZmktYm9vdC5oCmluZGV4IGNkZTE5M2E3NzEuLjIzMjk3MmVlZGYgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9lZmkvZWZpLWJvb3QuaAorKysgYi94ZW4vYXJjaC94ODYv
ZWZpL2VmaS1ib290LmgKQEAgLTYzNywxMSArNjM3LDEzIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBl
ZmlfYXJjaF9oYW5kbGVfbW9kdWxlKHN0cnVjdCBmaWxlICpmaWxlLCBjb25zdCBDSEFSMTYgKm5h
bWUsCiBzdGF0aWMgdm9pZCBfX2luaXQgZWZpX2FyY2hfY3B1KHZvaWQpCiB7CiAgICAgdWludDMy
X3QgZWF4ID0gY3B1aWRfZWF4KDB4ODAwMDAwMDApOworICAgIHVpbnQzMl90ICpjYXBzID0gYm9v
dF9jcHVfZGF0YS54ODZfY2FwYWJpbGl0eTsKKworICAgIGNhcHNbY3B1ZmVhdF93b3JkKFg4Nl9G
RUFUVVJFX0hZUEVSVklTT1IpXSA9IGNwdWlkX2VjeCgxKTsKIAogICAgIGlmICggKGVheCA+PiAx
NikgPT0gMHg4MDAwICYmIGVheCA+IDB4ODAwMDAwMDAgKQogICAgIHsKLSAgICAgICAgYm9vdF9j
cHVfZGF0YS54ODZfY2FwYWJpbGl0eVtjcHVmZWF0X3dvcmQoWDg2X0ZFQVRVUkVfU1lTQ0FMTCld
Ci0gICAgICAgICAgICA9IGNwdWlkX2VkeCgweDgwMDAwMDAxKTsKKyAgICAgICAgY2Fwc1tjcHVm
ZWF0X3dvcmQoWDg2X0ZFQVRVUkVfU1lTQ0FMTCldID0gY3B1aWRfZWR4KDB4ODAwMDAwMDEpOwog
CiAgICAgICAgIGlmICggY3B1X2hhc19ueCApCiAgICAgICAgICAgICB0cmFtcG9saW5lX2VmZXIg
fD0gRUZFUl9OWDsKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4uYyBiL3hlbi9h
cmNoL3g4Ni9ndWVzdC94ZW4uYwppbmRleCA3YjdhNWJhZGFiLi5hMzI5ZTdjODg2IDEwMDY0NAot
LS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuLmMKKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L3hl
bi5jCkBAIC02OSwxMSArNjksNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZmluZF94ZW5fbGVhdmVz
KHZvaWQpCiAKIHZvaWQgX19pbml0IHByb2JlX2h5cGVydmlzb3Iodm9pZCkKIHsKLSAgICBpZiAo
IHhlbl9ndWVzdCApCi0gICAgICAgIHJldHVybjsKLQotICAgIC8qIFRvbyBlYXJseSB0byB1c2Ug
Y3B1X2hhc19oeXBlcnZpc29yICovCi0gICAgaWYgKCAhKGNwdWlkX2VjeCgxKSAmIGNwdWZlYXRf
bWFzayhYODZfRkVBVFVSRV9IWVBFUlZJU09SKSkgKQorICAgIGlmICggeGVuX2d1ZXN0IHx8ICFj
cHVfaGFzX2h5cGVydmlzb3IgKQogICAgICAgICByZXR1cm47CiAKICAgICBmaW5kX3hlbl9sZWF2
ZXMoKTsKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMK
aW5kZXggNTdmMjI3NzVhYy4uYmQ4MTgyZjQwZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21t
LmMKKysrIGIveGVuL2FyY2gveDg2L21tLmMKQEAgLTYxMTIsOCArNjExMiw3IEBAIGNvbnN0IHN0
cnVjdCBwbGF0Zm9ybV9iYWRfcGFnZSAqX19pbml0IGdldF9wbGF0Zm9ybV9iYWRwYWdlcyh1bnNp
Z25lZCBpbnQgKmFycmF5CiAgICAgY2FzZSAweDAwMDUwNmUwOiAvKiBlcnJhdGEgU0tMMTY3IC8g
U0tXMTU5ICovCiAgICAgY2FzZSAweDAwMDgwNmUwOiAvKiBlcnJhdHVtIEtCTD8/PyAqLwogICAg
IGNhc2UgMHgwMDA5MDZlMDogLyogZXJyYXRhIEtCTD8/PyAvIEtCVzExNCAvIENGVzEwMyAqLwot
ICAgICAgICAqYXJyYXlfc2l6ZSA9IChjcHVpZF9lYXgoMCkgPj0gNyAmJgotICAgICAgICAgICAg
ICAgICAgICAgICAhKGNwdWlkX2VjeCgxKSAmIGNwdWZlYXRfbWFzayhYODZfRkVBVFVSRV9IWVBF
UlZJU09SKSkgJiYKKyAgICAgICAgKmFycmF5X3NpemUgPSAoY3B1aWRfZWF4KDApID49IDcgJiYg
IWNwdV9oYXNfaHlwZXJ2aXNvciAmJgogICAgICAgICAgICAgICAgICAgICAgICAoY3B1aWRfY291
bnRfZWJ4KDcsIDApICYgY3B1ZmVhdF9tYXNrKFg4Nl9GRUFUVVJFX0hMRSkpKTsKICAgICAgICAg
cmV0dXJuICZobGVfYmFkX3BhZ2U7CiAgICAgfQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
