Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F395BE1D86
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 16:00:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNH9Z-0004gP-8s; Wed, 23 Oct 2019 13:58:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xo40=YQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iNH9X-0004gB-T3
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 13:58:19 +0000
X-Inumbo-ID: 2904bbad-f59d-11e9-947f-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2904bbad-f59d-11e9-947f-12813bfff9fa;
 Wed, 23 Oct 2019 13:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571839096;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jX/kgFmobe5dzr/6/7Ul/Yf4aYGtQ4icBKv6F5BY814=;
 b=CWIMTU3aiot9EXrr5cwcJ8Z8G9QaqHkdX7UehBguwoaKtgUtFHYgXZ/u
 jrAdyIGEhYnp+Unv/ehyfaNlhFHdDbNWPCqy4Kmp0QTRVTdd/K0g2sLa6
 m8CSnOrH9PIkS9uYQEQNetB1pHasQY5BxujFsnkxKjEuCu9aYySFmiAZx Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TBbo1A6HA6Mw+AUkD4hA8WGNT0bnujUPwkoLPpGk30HJW1D4epUk76tWCoUy/WclKw8GZVjM6T
 Ff1fHzOBtKB+fxQNUYVX0HT2yeoDBUeeVLUnWI1HlINl6/FhOqIAAP0DNTP68Vkv7jmDucpNn6
 m/vwQ0FO/3UXgtQWkTeoUOQyaPuCPdl+16M/pM8DfUcnT3l9MUqxfnOUET0fW4Stq7LLeACiuP
 1b+wjJ6sd+vFMzD6F1mdC3zbFYLOZIx293ysjpKtkzEpb5JXpqiF+R5xmKAqpWBw6DohW5+Q/I
 VKA=
X-SBRS: 2.7
X-MesageID: 7627975
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7627975"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 14:58:06 +0100
Message-ID: <20191023135812.21348-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191023135812.21348-1-andrew.cooper3@citrix.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 1/7] x86/nospec: Two trivial fixes
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGluY2x1ZGUgb2YgYXNtL2NwdWlkLmggaW4gc3BlY19jdHJsLmMgd2FzIGFuIGFydGVmYWN0
IG9mIGFuIG9sZGVyIHZlcnNpb24Kb2YgYy9zIDM4NjBkNTUzNGRmLCBhbmQgaXMgbm90IHVzZWQg
aW4gaXRzIGN1cnJlbnQgaW5jYXJuYXRpb24uCgpGaXggYSB0eXBvIGluIGEgY29tbWVudC4KClNp
Z25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0t
LQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVu
Lm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDQzogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKdjM6CiAqIE5ldwotLS0KIHhlbi9hcmNoL3g4
Ni9zcGVjX2N0cmwuYyAgICAgfCAxIC0KIHhlbi9pbmNsdWRlL2FzbS14ODYvbm9zcGVjLmggfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zcGVjX2N0cmwuYyBiL3hlbi9hcmNoL3g4Ni9zcGVjX2N0
cmwuYwppbmRleCA3MzFkNWE3NjdiLi5lZTU0MzlhMzcxIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94
ODYvc3BlY19jdHJsLmMKKysrIGIveGVuL2FyY2gveDg2L3NwZWNfY3RybC5jCkBAIC0yMSw3ICsy
MSw2IEBACiAjaW5jbHVkZSA8eGVuL2xpYi5oPgogI2luY2x1ZGUgPHhlbi93YXJuaW5nLmg+CiAK
LSNpbmNsdWRlIDxhc20vY3B1aWQuaD4KICNpbmNsdWRlIDxhc20vbWljcm9jb2RlLmg+CiAjaW5j
bHVkZSA8YXNtL21zci5oPgogI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4KZGlmZiAtLWdpdCBh
L3hlbi9pbmNsdWRlL2FzbS14ODYvbm9zcGVjLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L25vc3Bl
Yy5oCmluZGV4IDJhYTQ3YjM0NTUuLjQyN2I1ZmY5ZGYgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRl
L2FzbS14ODYvbm9zcGVjLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ub3NwZWMuaApAQCAt
MTUsNyArMTUsNyBAQCBzdGF0aWMgYWx3YXlzX2lubGluZSBib29sIGJhcnJpZXJfbm9zcGVjX3Ry
dWUodm9pZCkKICAgICByZXR1cm4gdHJ1ZTsKIH0KIAotLyogQWxsb3cgdG8gcHJvdGVjdCBldmFs
dWF0aW9uIG9mIGNvbmRpdGlvbmFzbCB3aXRoIHJlc3BlY3QgdG8gc3BlY3VsYXRpb24gKi8KKy8q
IEFsbG93IHRvIHByb3RlY3QgZXZhbHVhdGlvbiBvZiBjb25kaXRpb25hbHMgd2l0aCByZXNwZWN0
IHRvIHNwZWN1bGF0aW9uICovCiBzdGF0aWMgYWx3YXlzX2lubGluZSBib29sIGV2YWx1YXRlX25v
c3BlYyhib29sIGNvbmRpdGlvbikKIHsKICAgICByZXR1cm4gY29uZGl0aW9uID8gYmFycmllcl9u
b3NwZWNfdHJ1ZSgpIDogIWJhcnJpZXJfbm9zcGVjX3RydWUoKTsKLS0gCjIuMTEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
