Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB64D77347
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 23:12:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr7Sb-0001Pg-Tz; Fri, 26 Jul 2019 21:09:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOBC=VX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hr7Sa-0001PG-68
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 21:09:04 +0000
X-Inumbo-ID: 958944ea-afe9-11e9-9a6a-bf56f8ed891f
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 958944ea-afe9-11e9-9a6a-bf56f8ed891f;
 Fri, 26 Jul 2019 21:08:58 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: dHzP8NI7TRlgccmHeDRAroNjZ1OH8ViuzLIQsgJEkZvz3Qv1zQAnEqifUxz2CmqDJy1mZJlu1Q
 f8ir+zR2of+2UmP1ge63imVn/Z1YnGoQOwz/H/aXbZ5FtKBsXD7yr/sKwTt7GSrgkzij30kiSI
 hCm6Wlg60UfJp2PhR46PheBWv850l4XemE8g3RVzH32/BG2yuqw2hCKp4aLy0+6ljfIvjYAlB1
 SHYoeH0hMh3CenD3X/jnHGS9xv/Uhy5nNbwENmow27lnX3X9gqOSQ6lrTzQwrqNnQAOtgh1dzI
 VRA=
X-SBRS: 2.7
X-MesageID: 3613655
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,312,1559534400"; 
   d="scan'208";a="3613655"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 26 Jul 2019 22:08:51 +0100
Message-ID: <20190726210854.6408-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190726210854.6408-1-andrew.cooper3@citrix.com>
References: <20190726210854.6408-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/4] arm/percpu: Move {get,
 set}_processor_id() into smp.h
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
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rm9yIGNsZWFudXAgcHVycG9zZXMsIGl0IGlzIG5lY2Vzc2FyeSBmb3IgYXNtL3BlcmNwdS5oIHRv
IG5vdCB1c2UKREVDTEFSRV9QRVJfQ1BVKCkgaXRzZWxmLiAgYXNtL3NtcC5oIGlzIGFyZ3VhYmx5
IGEgYmV0dGVyIHBsYWNlIGZvciBpdCB0bwpsaXZlIGFueXdheS4KClNpZ25lZC1vZmYtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDQzogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4KQ0M6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1
a0BlcGFtLmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS9hc20tYXJtL3BlcmNwdS5oIHwgNiAtLS0tLS0K
IHhlbi9pbmNsdWRlL2FzbS1hcm0vc21wLmggICAgfCA4ICsrKysrKysrCiAyIGZpbGVzIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5j
bHVkZS9hc20tYXJtL3BlcmNwdS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9wZXJjcHUuaAppbmRl
eCAyNjQxMjBiMTkyLi41Y2U4MWExNzA3IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJt
L3BlcmNwdS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vcGVyY3B1LmgKQEAgLTI1LDEyICsy
NSw2IEBAIHZvaWQgcGVyY3B1X2luaXRfYXJlYXModm9pZCk7CiAKICNkZWZpbmUgREVDTEFSRV9Q
RVJfQ1BVKHR5cGUsIG5hbWUpIGV4dGVybiBfX3R5cGVvZl9fKHR5cGUpIHBlcl9jcHVfXyMjbmFt
ZQogCi1ERUNMQVJFX1BFUl9DUFUodW5zaWduZWQgaW50LCBjcHVfaWQpOwotI2RlZmluZSBnZXRf
cHJvY2Vzc29yX2lkKCkgICAgKHRoaXNfY3B1KGNwdV9pZCkpCi0jZGVmaW5lIHNldF9wcm9jZXNz
b3JfaWQoaWQpICBkbyB7ICAgICAgICAgICAgICAgICAgICAgIFwKLSAgICBXUklURV9TWVNSRUco
X19wZXJfY3B1X29mZnNldFtpZF0sIFRQSURSX0VMMik7ICAgICAgXAotICAgIHRoaXNfY3B1KGNw
dV9pZCkgPSAoaWQpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCi19IHdoaWxlKDApCiAj
ZW5kaWYKIAogI2VuZGlmIC8qIF9fQVJNX1BFUkNQVV9IX18gKi8KZGlmZiAtLWdpdCBhL3hlbi9p
bmNsdWRlL2FzbS1hcm0vc21wLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL3NtcC5oCmluZGV4IGZk
YmNlZmEyNDEuLjdkNGVkZmEwYTAgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vc21w
LmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9zbXAuaApAQCAtNywxMSArNywxOSBAQAogI2lu
Y2x1ZGUgPGFzbS9jdXJyZW50Lmg+CiAjZW5kaWYKIAorREVDTEFSRV9QRVJfQ1BVKHVuc2lnbmVk
IGludCwgY3B1X2lkKTsKIERFQ0xBUkVfUEVSX0NQVShjcHVtYXNrX3Zhcl90LCBjcHVfc2libGlu
Z19tYXNrKTsKIERFQ0xBUkVfUEVSX0NQVShjcHVtYXNrX3Zhcl90LCBjcHVfY29yZV9tYXNrKTsK
IAogI2RlZmluZSBjcHVfaXNfb2ZmbGluZShjcHUpIHVubGlrZWx5KCFjcHVfb25saW5lKGNwdSkp
CiAKKyNkZWZpbmUgZ2V0X3Byb2Nlc3Nvcl9pZCgpICAgICB0aGlzX2NwdShjcHVfaWQpCisjZGVm
aW5lIHNldF9wcm9jZXNzb3JfaWQoaWQpICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKK2Rv
IHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAor
ICAgIFdSSVRFX1NZU1JFRyhfX3Blcl9jcHVfb2Zmc2V0WyhpZCldLCBUUElEUl9FTDIpOyAgICBc
CisgICAgdGhpc19jcHUoY3B1X2lkKSA9IChpZCk7ICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKK30gd2hpbGUgKCAwICkKKwogI2RlZmluZSByYXdfc21wX3Byb2Nlc3Nvcl9pZCgpIChnZXRf
cHJvY2Vzc29yX2lkKCkpCiAKIC8qCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
