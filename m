Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC667B22A7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 16:53:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8muv-0005Us-Ge; Fri, 13 Sep 2019 14:51:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=g+tJ=XI=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1i8muu-0005Uc-DS
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 14:51:20 +0000
X-Inumbo-ID: ea028ffa-d635-11e9-978d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea028ffa-d635-11e9-978d-bc764e2007e4;
 Fri, 13 Sep 2019 14:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568386266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0dgQPbTWjI6SwMzyC59lA5IDiOJiBrPsrvs1zX2XlKE=;
 b=JKbGcEW3my7JlqprIRuVcv9Vi9hqJo4UoL2h1u2YiLDjFjk9iPOH+s6a
 2cqsbVf4aoicNwJT+wavXBEmDG3GCHe+oHYY1Ys68Zb3cH7QppU+WgYva
 h8ytXtNVWv8ZJJkERZVBtgNXfqsgtWRJy2CHnV5y3l2Qgv0T+T5nMbqUp k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fvXAh7vfsFBYYx1H2SUTubk8+N9uU775f/lCrfgTcHdbuAv7+PqStRzuACH/445eASrBRcD9+u
 fV5fsmNVu812Mt+KoTolZCm+6MdE14faMFCRTY+Ffrsz356q2Fs6fmJuPRnR6htTemMfoYhrJe
 DIMYhg9c97TxBKuLAoCn0bIx89Dc73hG5EaleRX+1PuVg4K7N7m5T78BuyIjBnFbRRGCO/appB
 XIqMoWxJZQGYE0gREuK7I0hMk/nUAo1575xNGeFSilN0Z9bGnQXU0X5S+EgPX8y8N6Pg93ymG3
 EL4=
X-SBRS: 2.7
X-MesageID: 5595142
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,501,1559534400"; 
   d="scan'208";a="5595142"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Fri, 13 Sep 2019 15:50:51 +0100
Message-ID: <20190913145100.303433-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190913145100.303433-1-anthony.perard@citrix.com>
References: <20190913145100.303433-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 02/11] OvmfPkg/XenBusDxe: Have XenStoreFindWatch
 take a pointer
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmV3b3JrIFhlblN0b3JlRmluZFdhdGNoKCkgdG8gYmUgYWJsZSB0byBzZWFyY2ggZm9yIGEgcmVn
aXN0ZXJlZCB3YXRjaAp3aXRoIGEgcG9pbnRlciBpbnN0ZWFkIG9mIGEgc3RyaW5nLgoKUmVmOiBo
dHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTIxOTAKU2lnbmVk
LW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQog
T3ZtZlBrZy9YZW5CdXNEeGUvWGVuU3RvcmUuYyB8IDIwICsrKysrKysrKysrLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9Pdm1mUGtnL1hlbkJ1c0R4ZS9YZW5TdG9yZS5jIGIvT3ZtZlBrZy9YZW5CdXNEeGUvWGVu
U3RvcmUuYwppbmRleCA3MjUzZDhhZTM3Li43Mjc2NDFhMGZlIDEwMDY0NAotLS0gYS9Pdm1mUGtn
L1hlbkJ1c0R4ZS9YZW5TdG9yZS5jCisrKyBiL092bWZQa2cvWGVuQnVzRHhlL1hlblN0b3JlLmMK
QEAgLTI1MywxNCArMjUzLDEyIEBAIFNwbGl0ICgKIFNUQVRJQw0KIFhFTlNUT1JFX1dBVENIICoN
CiBYZW5TdG9yZUZpbmRXYXRjaCAoDQotICBJTiBDT05TVCBDSEFSOCAqVG9rZW4NCisgIElOIFZP
SUQgKlRva2VuDQogICApDQogew0KLSAgWEVOU1RPUkVfV0FUQ0ggKldhdGNoLCAqV2FudGVkV2F0
Y2g7DQorICBYRU5TVE9SRV9XQVRDSCAqV2F0Y2g7DQogICBMSVNUX0VOVFJZICpFbnRyeTsNCiAN
Ci0gIFdhbnRlZFdhdGNoID0gKFZPSUQgKikgQXNjaWlTdHJIZXhUb1VpbnRuIChUb2tlbik7DQot
DQogICBpZiAoSXNMaXN0RW1wdHkgKCZ4cy5SZWdpc3RlcmVkV2F0Y2hlcykpIHsNCiAgICAgcmV0
dXJuIE5VTEw7DQogICB9DQpAQCAtMjY4LDcgKzI2Niw3IEBAIFhlblN0b3JlRmluZFdhdGNoICgK
ICAgICAgICAhSXNOdWxsICgmeHMuUmVnaXN0ZXJlZFdhdGNoZXMsIEVudHJ5KTsNCiAgICAgICAg
RW50cnkgPSBHZXROZXh0Tm9kZSAoJnhzLlJlZ2lzdGVyZWRXYXRjaGVzLCBFbnRyeSkpIHsNCiAg
ICAgV2F0Y2ggPSBYRU5TVE9SRV9XQVRDSF9GUk9NX0xJTksgKEVudHJ5KTsNCi0gICAgaWYgKFdh
dGNoID09IFdhbnRlZFdhdGNoKQ0KKyAgICBpZiAoKFZPSUQgKikgV2F0Y2ggPT0gVG9rZW4pDQog
ICAgICAgcmV0dXJuIFdhdGNoOw0KICAgfQ0KIA0KQEAgLTYzMiwxMiArNjMwLDE2IEBAIFhlblN0
b3JlUHJvY2Vzc01lc3NhZ2UgKAogICBCb2R5W01lc3NhZ2UtPkhlYWRlci5sZW5dID0gJ1wwJzsN
CiANCiAgIGlmIChNZXNzYWdlLT5IZWFkZXIudHlwZSA9PSBYU19XQVRDSF9FVkVOVCkgew0KKyAg
ICBWT0lEICpDb252ZXJ0ZWRUb2tlbjsNCisNCiAgICAgTWVzc2FnZS0+dS5XYXRjaC5WZWN0b3Ig
PSBTcGxpdChCb2R5LCBNZXNzYWdlLT5IZWFkZXIubGVuLA0KICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICZNZXNzYWdlLT51LldhdGNoLlZlY3RvclNpemUpOw0KIA0KKyAgICBD
b252ZXJ0ZWRUb2tlbiA9DQorICAgICAgKFZPSUQgKikgQXNjaWlTdHJIZXhUb1VpbnRuIChNZXNz
YWdlLT51LldhdGNoLlZlY3RvcltYU19XQVRDSF9UT0tFTl0pOw0KKw0KICAgICBFZmlBY3F1aXJl
TG9jayAoJnhzLlJlZ2lzdGVyZWRXYXRjaGVzTG9jayk7DQotICAgIE1lc3NhZ2UtPnUuV2F0Y2gu
SGFuZGxlID0NCi0gICAgICBYZW5TdG9yZUZpbmRXYXRjaCAoTWVzc2FnZS0+dS5XYXRjaC5WZWN0
b3JbWFNfV0FUQ0hfVE9LRU5dKTsNCisgICAgTWVzc2FnZS0+dS5XYXRjaC5IYW5kbGUgPSBYZW5T
dG9yZUZpbmRXYXRjaCAoQ29udmVydGVkVG9rZW4pOw0KICAgICBERUJVRyAoKEVGSV9EX0lORk8s
ICJYZW5TdG9yZTogV2F0Y2ggZXZlbnQgJWFcbiIsDQogICAgICAgICAgICAgTWVzc2FnZS0+dS5X
YXRjaC5WZWN0b3JbWFNfV0FUQ0hfVE9LRU5dKSk7DQogICAgIGlmIChNZXNzYWdlLT51LldhdGNo
LkhhbmRsZSAhPSBOVUxMKSB7DQpAQCAtMTM4NCw4ICsxMzg2LDcgQEAgWGVuU3RvcmVVbnJlZ2lz
dGVyV2F0Y2ggKAogDQogICBBU1NFUlQgKFdhdGNoLT5TaWduYXR1cmUgPT0gWEVOU1RPUkVfV0FU
Q0hfU0lHTkFUVVJFKTsNCiANCi0gIEFzY2lpU1ByaW50IChUb2tlbiwgc2l6ZW9mIChUb2tlbiks
ICIlcCIsIChWT0lEICopIFdhdGNoKTsNCi0gIGlmIChYZW5TdG9yZUZpbmRXYXRjaCAoVG9rZW4p
ID09IE5VTEwpIHsNCisgIGlmIChYZW5TdG9yZUZpbmRXYXRjaCAoV2F0Y2gpID09IE5VTEwpIHsN
CiAgICAgcmV0dXJuOw0KICAgfQ0KIA0KQEAgLTEzOTMsNiArMTM5NCw3IEBAIFhlblN0b3JlVW5y
ZWdpc3RlcldhdGNoICgKICAgUmVtb3ZlRW50cnlMaXN0ICgmV2F0Y2gtPkxpbmspOw0KICAgRWZp
UmVsZWFzZUxvY2sgKCZ4cy5SZWdpc3RlcmVkV2F0Y2hlc0xvY2spOw0KIA0KKyAgQXNjaWlTUHJp
bnQgKFRva2VuLCBzaXplb2YgKFRva2VuKSwgIiVwIiwgKFZPSUQgKikgV2F0Y2gpOw0KICAgWGVu
U3RvcmVVbndhdGNoIChXYXRjaC0+Tm9kZSwgVG9rZW4pOw0KIA0KICAgLyogQ2FuY2VsIHBlbmRp
bmcgd2F0Y2ggZXZlbnRzLiAqLw0KLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
