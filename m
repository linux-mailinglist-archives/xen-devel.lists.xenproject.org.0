Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B37F11EDFF
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 23:50:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iftjP-00039P-6W; Fri, 13 Dec 2019 22:48:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QQqQ=2D=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iftjN-00039G-Qn
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 22:48:17 +0000
X-Inumbo-ID: a6b375c2-1dfa-11ea-9024-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a6b375c2-1dfa-11ea-9024-12813bfff9fa;
 Fri, 13 Dec 2019 22:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576277296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=GL+f2nCbKc2Xgo48QJHzrfoquRwqoJDWkZDJ+YnYajk=;
 b=LrXUQW1WB5tvYki2eyJ/3GYxYZGjz1m4jiDOopf+0iicZnNhR/cyrVue
 nqLKIJo1i0dUkBx3UiIpW5Np+XOVdZRJDMda07Pm0zf0cKSg0OZDSRi3A
 fnBwA5g/U9N2FNfzJrBt6Fsy/ChkMMdimoL5O8c9zm18+NvTAGzfs7WoM g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QjRDI5Jd0cVmArNUc9d43OJIrdgbTE0PVdXl4UWfG/YveUAH8lFGuDwXfF2oYkEHA8iKQj/eFb
 1R3TyBzqKpZfAp3JiA8GDOIrrV73wbiM2/KmqIvP0+JZBwpG19dLhBsbMDzMocFwQAe83lUbQt
 RQzL1+a4SHecs6vxQaI4jyr8VI7KDSrcQrmjLtR1uOkGlDHU8jQC2mhFHfY553hcq+tvcQkFOQ
 eKfo3yi6CS3Yx3R14BHQp7Ad9yB7ot8H+hyv9PBFlAechTE0AAcaGbz18cn2kk9DRQUT0enGWa
 qB4=
X-SBRS: 2.7
X-MesageID: 10241746
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,311,1571716800"; d="scan'208";a="10241746"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 13 Dec 2019 22:48:02 +0000
Message-ID: <1576277282-6590-3-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576277282-6590-1-git-send-email-igor.druzhinin@citrix.com>
References: <1576277282-6590-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] x86/time: update vtsc_last with cmpxchg and
 drop vtsc_lock
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

Tm93IHRoYXQgdnRzY19sYXN0IGlzIHRoZSBvbmx5IGVudGl0eSBwcm90ZWN0ZWQgYnkgdnRzY19s
b2NrIHdlIGNhbgpzaW1wbHkgdXBkYXRlIGl0IHVzaW5nIGEgc2luZ2xlIGF0b21pYyBvcGVyYXRp
b24gYW5kIGRyb3AgdGhlIHNwaW5sb2NrCmVudGlyZWx5LiBUaGlzIGlzIGV4dHJlbWVseSBpbXBv
cnRhbnQgZm9yIHRoZSBjYXNlIG9mIHJ1bm5pbmcgbmVzdGVkCihlLmcuIHNoaW0gaW5zdGFuY2Ug
d2l0aCBsb3RzIG9mIHZDUFVzIGFzc2lnbmVkKSBzaW5jZSBpZiBwcmVlbXB0aW9uCmhhcHBlbnMg
c29tZXdoZXJlIGluc2lkZSB0aGUgY3JpdGljYWwgc2VjdGlvbiB0aGF0IHdvdWxkIGltbWVkaWF0
ZWx5Cm1lYW4gdGhhdCBvdGhlciB2Q1BVIHN0b3AgcHJvZ3Jlc3NpbmcgKGFuZCBwcm9iYWJseSBi
ZWluZyBwcmVlbXB0ZWQKYXMgd2VsbCkgd2FpdGluZyBmb3IgdGhlIHNwaW5sb2NrIHRvIGJlIGZy
ZWVkLgoKVGhpcyBmaXhlcyBjb25zdGFudCBzaGltIGd1ZXN0IGJvb3QgbG9ja3VwcyB3aXRoIH4z
MiB2Q1BVcyBpZiB0aGVyZSBpcwp2Q1BVIG92ZXJjb21taXQgcHJlc2VudCAod2hpY2ggaW5jcmVh
c2VzIHRoZSBsaWtlbGlob29kIG9mIHByZWVtcHRpb24pLgoKU2lnbmVkLW9mZi1ieTogSWdvciBE
cnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2Rv
bWFpbi5jICAgICAgICB8ICAxIC0KIHhlbi9hcmNoL3g4Ni90aW1lLmMgICAgICAgICAgfCAxNiAr
KysrKystLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5oIHwgIDEgLQogMyBm
aWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwppbmRleCBi
ZWQxOWZjLi45NDUzMWJlIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZG9tYWluLmMKKysrIGIv
eGVuL2FyY2gveDg2L2RvbWFpbi5jCkBAIC01MzksNyArNTM5LDYgQEAgaW50IGFyY2hfZG9tYWlu
X2NyZWF0ZShzdHJ1Y3QgZG9tYWluICpkLAogICAgIElOSVRfUEFHRV9MSVNUX0hFQUQoJmQtPmFy
Y2gucmVsbWVtX2xpc3QpOwogCiAgICAgc3Bpbl9sb2NrX2luaXQoJmQtPmFyY2guZTgyMF9sb2Nr
KTsKLSAgICBzcGluX2xvY2tfaW5pdCgmZC0+YXJjaC52dHNjX2xvY2spOwogCiAgICAgLyogTWlu
aW1hbCBpbml0aWFsaXNhdGlvbiBmb3IgdGhlIGlkbGUgZG9tYWluLiAqLwogICAgIGlmICggdW5s
aWtlbHkoaXNfaWRsZV9kb21haW4oZCkpICkKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni90aW1l
LmMgYi94ZW4vYXJjaC94ODYvdGltZS5jCmluZGV4IDIxNjE2OWEuLjIwMjQ0NmYgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni90aW1lLmMKKysrIGIveGVuL2FyY2gveDg2L3RpbWUuYwpAQCAtMjEz
MCwxOSArMjEzMCwxNSBAQCB1NjQgZ3RzY190b19ndGltZShzdHJ1Y3QgZG9tYWluICpkLCB1NjQg
dHNjKQogCiB1aW50NjRfdCBwdl9zb2Z0X3JkdHNjKGNvbnN0IHN0cnVjdCB2Y3B1ICp2LCBjb25z
dCBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKIHsKLSAgICBzX3RpbWVfdCBub3cgPSBnZXRf
c190aW1lKCk7CisgICAgc190aW1lX3Qgb2xkLCBuZXcsIG5vdyA9IGdldF9zX3RpbWUoKTsKICAg
ICBzdHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWluOwogCi0gICAgc3Bpbl9sb2NrKCZkLT5hcmNo
LnZ0c2NfbG9jayk7Ci0KLSAgICBpZiAoIChpbnQ2NF90KShub3cgLSBkLT5hcmNoLnZ0c2NfbGFz
dCkgPiAwICkKLSAgICAgICAgZC0+YXJjaC52dHNjX2xhc3QgPSBub3c7Ci0gICAgZWxzZQotICAg
ICAgICBub3cgPSArK2QtPmFyY2gudnRzY19sYXN0OwotCi0gICAgc3Bpbl91bmxvY2soJmQtPmFy
Y2gudnRzY19sb2NrKTsKKyAgICBkbyB7CisgICAgICAgIG9sZCA9IGQtPmFyY2gudnRzY19sYXN0
OworICAgICAgICBuZXcgPSAoaW50NjRfdCkobm93IC0gZC0+YXJjaC52dHNjX2xhc3QpID4gMCA/
IG5vdyA6IG9sZCArIDE7CisgICAgfSB3aGlsZSAoIGNtcHhjaGcoJmQtPmFyY2gudnRzY19sYXN0
LCBvbGQsIG5ldykgIT0gb2xkICk7CiAKLSAgICByZXR1cm4gZ3RpbWVfdG9fZ3RzYyhkLCBub3cp
OworICAgIHJldHVybiBndGltZV90b19ndHNjKGQsIG5ldyk7CiB9CiAKIGJvb2wgY2xvY2tzb3Vy
Y2VfaXNfdHNjKHZvaWQpCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5o
IGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9kb21haW4uaAppbmRleCAzNzgwMjg3Li5lNGRhMzczIDEw
MDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5oCisrKyBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvZG9tYWluLmgKQEAgLTM2NCw3ICszNjQsNiBAQCBzdHJ1Y3QgYXJjaF9kb21haW4K
ICAgICBpbnQgdHNjX21vZGU7ICAgICAgICAgICAgLyogc2VlIGluY2x1ZGUvYXNtLXg4Ni90aW1l
LmggKi8KICAgICBib29sX3QgdnRzYzsgICAgICAgICAgICAgLyogdHNjIGlzIGVtdWxhdGVkICht
YXkgY2hhbmdlIGFmdGVyIG1pZ3JhdGUpICovCiAgICAgc190aW1lX3QgdnRzY19sYXN0OyAgICAg
IC8qIHByZXZpb3VzIFRTQyB2YWx1ZSAoZ3VhcmFudGVlIG1vbm90b25pY2l0eSkgKi8KLSAgICBz
cGlubG9ja190IHZ0c2NfbG9jazsKICAgICB1aW50NjRfdCB2dHNjX29mZnNldDsgICAgLyogYWRq
dXN0bWVudCBmb3Igc2F2ZS9yZXN0b3JlL21pZ3JhdGUgKi8KICAgICB1aW50MzJfdCB0c2Nfa2h6
OyAgICAgICAgLyogY2FjaGVkIGd1ZXN0IGtoeiBmb3IgY2VydGFpbiBlbXVsYXRlZCBvcgogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoYXJkd2FyZSBUU0Mgc2NhbGluZyBjYXNlcyAq
LwotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
