Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB47151D87
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 16:42:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz0JZ-00037K-PQ; Tue, 04 Feb 2020 15:40:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I1tw=3Y=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iz0JY-000372-C1
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 15:40:36 +0000
X-Inumbo-ID: acf66244-4764-11ea-8f8e-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id acf66244-4764-11ea-8f8e-12813bfff9fa;
 Tue, 04 Feb 2020 15:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580830831;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=73Jw+oAeyfGy7O7wiCCbk0PYWAgVMSfgNN2w6d71k0c=;
 b=I+L0NToX4hjGyjY3ulsu7lD2kvMf1o2l5PIKR5tnogwt8PaOztgnpum8
 s4POCvnEi/iZs8TgznKjslo0yqKrQEop+cS71y9RlJOeHqHNXo6niAZ3y
 okjPUMksqS+X4CMYyv6QgOceuDPPK/kdizSycI4ex3LnnDRNAC0mjcduU g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KvgxjoDCIz+3G5npuWHtW8eNMyhn9gVOjbG6wF+Tlddz1NKOLIOy/g/SO1PDC5PMBajgUFogyR
 Q6svIRyL4JYg+wj8fnxpkUxaISIJ4+8rQRKJu15Zmo06thjpAE8qfbZptYXEyx6xANZ3sgNXtS
 X2EndHiIuN6OBfsFmhKACDtC/N0RGc/UMsC6slc5tOsbbCfPUqArzOrleAHZpuoSnBLeWwRfHy
 2HfQJ0qislR8FMoaS1vxlanOfvBUFPpCZz/11luNz7kmm04RjAvSiU5wAsiRcVUTBsuQI6MkEN
 Q8I=
X-SBRS: 2.7
X-MesageID: 12295793
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,402,1574139600"; d="scan'208";a="12295793"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 4 Feb 2020 15:40:24 +0000
Message-ID: <1580830825-18767-2-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580830825-18767-1-git-send-email-igor.druzhinin@citrix.com>
References: <1580830825-18767-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] x86/shim: suspend and resume platform time
 correctly
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
Cc: andrew.cooper3@citrix.com, Igor Druzhinin <igor.druzhinin@citrix.com>,
 wl@xen.org, jbeulich@suse.com, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2ltaWxhcmx5IHRvIFMzLCBwbGF0Zm9ybSB0aW1lIG5lZWRzIHRvIGJlIHNhdmVkIG9uIGd1ZXN0
IHN1c3BlbmQKYW5kIHJlc3RvcmVkIG9uIHJlc3VtZSByZXNwZWN0aXZlbHkuIFRoaXMgc2hvdWxk
IGFjY291bnQgZm9yIGV4cGVjdGVkCmp1bXBzIGluIFBWIGNsb2NrIGNvdW50ZXIgdmFsdWUgYWZ0
ZXIgcmVzdW1lLiB0aW1lX3N1c3BlbmQvcmVzdW1lKCkKYXJlIHNhZmUgdG8gdXNlIGluIFBWSCBz
ZXR0aW5nIGFzIGlzIHNpbmNlIGFueSBleGlzdGluZyBvcGVyYXRpb25zCndpdGggUElUIHRoYXQg
dGhleSBkbyB3b3VsZCBzaW1wbHkgYmUgaWdub3JlZCB0aGVyZS4KCkFkZGl0aW9uYWxseSwgYWRk
IHJlc3VtZSBjYWxsYmFjayBmb3IgWGVuIFBWIGNsb2Nrc291cmNlIHRvIGF2b2lkCml0cyBicmVh
a2FnZSBvbiBtaWdyYXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5k
cnV6aGluaW5AY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvcHYvc2hpbS5jIHwgIDcgKysr
KysrLQogeGVuL2FyY2gveDg2L3RpbWUuYyAgICB8IDEyICsrKysrKysrKy0tLQogMiBmaWxlcyBj
aGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9wdi9zaGltLmMgYi94ZW4vYXJjaC94ODYvcHYvc2hpbS5jCmluZGV4IDdhODk4
ZmQuLjZiMjZlYWEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9wdi9zaGltLmMKKysrIGIveGVu
L2FyY2gveDg2L3B2L3NoaW0uYwpAQCAtMzI1LDkgKzMyNSwxMyBAQCBpbnQgcHZfc2hpbV9zaHV0
ZG93bih1aW50OF90IHJlYXNvbikKICAgICAgICAgaWYgKCB2ICE9IGN1cnJlbnQgKQogICAgICAg
ICAgICAgdmNwdV9wYXVzZV9ieV9zeXN0ZW1jb250cm9sbGVyKHYpOwogCisgICAgLyogUHJlcGFy
ZSB0aW1la2VlcGluZyBjb2RlIHRvIHN1c3BlbmQuKi8KKyAgICB0aW1lX3N1c3BlbmQoKTsKKwog
ICAgIHJjID0geGVuX2h5cGVyY2FsbF9zaHV0ZG93bihTSFVURE9XTl9zdXNwZW5kKTsKICAgICBp
ZiAoIHJjICkKICAgICB7CisgICAgICAgIHRpbWVfcmVzdW1lKCk7CiAgICAgICAgIGZvcl9lYWNo
X3ZjcHUgKCBkLCB2ICkKICAgICAgICAgICAgIGlmICggdiAhPSBjdXJyZW50ICkKICAgICAgICAg
ICAgICAgICB2Y3B1X3VucGF1c2VfYnlfc3lzdGVtY29udHJvbGxlcih2KTsKQEAgLTMzNSw4ICsz
MzksOSBAQCBpbnQgcHZfc2hpbV9zaHV0ZG93bih1aW50OF90IHJlYXNvbikKICAgICAgICAgcmV0
dXJuIHJjOwogICAgIH0KIAotICAgIC8qIFJlc3VtZSB0aGUgc2hpbSBpdHNlbGYgZmlyc3QuICov
CisgICAgLyogUmVzdW1lIHRoZSBzaGltIGl0c2VsZiBhbmQgdGltZWtlZXBpbmcgZmlyc3QuICov
CiAgICAgaHlwZXJ2aXNvcl9yZXN1bWUoKTsKKyAgICB0aW1lX3Jlc3VtZSgpOwogCiAgICAgLyoK
ICAgICAgKiBBVE0gdGhlcmUncyBub3RoaW5nIFhlbiBjYW4gZG8gaWYgdGhlIGNvbnNvbGUvc3Rv
cmUgcGZuIGNoYW5nZXMsCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvdGltZS5jIGIveGVuL2Fy
Y2gveDg2L3RpbWUuYwppbmRleCBmNmIyNmY4Li43ZTdhNjJlIDEwMDY0NAotLS0gYS94ZW4vYXJj
aC94ODYvdGltZS5jCisrKyBiL3hlbi9hcmNoL3g4Ni90aW1lLmMKQEAgLTU2NSw2ICs1NjUsNyBA
QCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX3RpbWVzb3VyY2UgX19pbml0ZGF0YSBwbHRfdHNjID0K
ICAqCiAgKiBYZW4gY2xvY2sgc291cmNlIGlzIGEgdmFyaWFudCBvZiBUU0Mgc291cmNlLgogICov
CitzdGF0aWMgdWludDY0X3QgeGVuX3RpbWVyX2xhc3Q7CiAKIHN0YXRpYyB1aW50NjRfdCB4ZW5f
dGltZXJfY3B1X2ZyZXF1ZW5jeSh2b2lkKQogewpAQCAtNjEwLDcgKzYxMSw2IEBAIHN0YXRpYyB1
aW50NjRfdCByZWFkX3hlbl90aW1lcih2b2lkKQogICAgIHVpbnQzMl90IHZlcnNpb247CiAgICAg
dWludDY0X3QgcmV0OwogICAgIHVpbnQ2NF90IGxhc3Q7Ci0gICAgc3RhdGljIHVpbnQ2NF90IGxh
c3RfdmFsdWU7CiAKICAgICBkbyB7CiAgICAgICAgIHZlcnNpb24gPSBpbmZvLT52ZXJzaW9uICYg
fjE7CkBAIC02MjYsMjAgKzYyNiwyNiBAQCBzdGF0aWMgdWludDY0X3QgcmVhZF94ZW5fdGltZXIo
dm9pZCkKIAogICAgIC8qIE1haW50YWluIGEgbW9ub3RvbmljIGdsb2JhbCB2YWx1ZSAqLwogICAg
IGRvIHsKLSAgICAgICAgbGFzdCA9IHJlYWRfYXRvbWljKCZsYXN0X3ZhbHVlKTsKKyAgICAgICAg
bGFzdCA9IHJlYWRfYXRvbWljKCZ4ZW5fdGltZXJfbGFzdCk7CiAgICAgICAgIGlmICggcmV0IDwg
bGFzdCApCiAgICAgICAgICAgICByZXR1cm4gbGFzdDsKLSAgICB9IHdoaWxlICggdW5saWtlbHko
Y21weGNoZygmbGFzdF92YWx1ZSwgbGFzdCwgcmV0KSAhPSBsYXN0KSApOworICAgIH0gd2hpbGUg
KCB1bmxpa2VseShjbXB4Y2hnKCZ4ZW5fdGltZXJfbGFzdCwgbGFzdCwgcmV0KSAhPSBsYXN0KSAp
OwogCiAgICAgcmV0dXJuIHJldDsKIH0KIAorc3RhdGljIHZvaWQgcmVzdW1lX3hlbl90aW1lcihz
dHJ1Y3QgcGxhdGZvcm1fdGltZXNvdXJjZSAqcHRzKQoreworICAgIHdyaXRlX2F0b21pYygmeGVu
X3RpbWVyX2xhc3QsIDApOworfQorCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX3RpbWVzb3VyY2Ug
X19pbml0ZGF0YSBwbHRfeGVuX3RpbWVyID0KIHsKICAgICAuaWQgPSAieGVuIiwKICAgICAubmFt
ZSA9ICJYRU4gUFYgQ0xPQ0siLAogICAgIC5yZWFkX2NvdW50ZXIgPSByZWFkX3hlbl90aW1lciwK
ICAgICAuaW5pdCA9IGluaXRfeGVuX3RpbWVyLAorICAgIC5yZXN1bWUgPSByZXN1bWVfeGVuX3Rp
bWVyLAogICAgIC5jb3VudGVyX2JpdHMgPSA2MywKIH07CiAjZW5kaWYKLS0gCjIuNy40CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
