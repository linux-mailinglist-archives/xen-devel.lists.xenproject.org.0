Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 299CFCBEEC
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 17:19:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGPKg-0001SS-KP; Fri, 04 Oct 2019 15:17:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lQ+Z=X5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iGPKe-0001Rd-Vo
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 15:17:25 +0000
X-Inumbo-ID: 0b1329eb-e6ba-11e9-975c-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b1329eb-e6ba-11e9-975c-12813bfff9fa;
 Fri, 04 Oct 2019 15:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570202234;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=HRB5b7geXl0cLryQ01TGg4wgRxl1O1KItPxzaHTS6Ls=;
 b=Qo7PykfTjyDVM6mEX0oK0BS+hvhpzcA2Y8IrnLq2Xj6G96upRba96gsn
 8LEsg7IFhUHTbQDAT78ojf3jpyEoaFdoxhZCBw8RHkY2hGYkFk3PHdhUm
 VjjhZACaJWUBkmbUROse3Go5XacCa0jmQl/VEwkxt6PU7I8DfRy4GQwdX E=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3kOk2xwCB4FGemIvcnINEKaDg8/UWtPMXLOPrHtmuKrTkJygbe5oBiHzK+Q0rM5K+ciyqxjcui
 nXqcssJTpf3VCWYONox512KX8kNMjo3RQBufcG+AoPCM+OwxQ7oRbI6xvjpJpqyhlo7gEmdhF2
 1caUD9cQwBpt73VR8WACgCoISAZRN+pNMy/Lszoxkg4sIT/Iuv6uwe02sdKwwpf0oUgAt5NUAI
 JHJcVpZ/xxfsoLSh91qN3/pTfPbVd/x+ogRjUsmyEYaXaRCaSgENC0DgD4Bj+uAWKigk6nVsIW
 gf0=
X-SBRS: 2.7
X-MesageID: 6779129
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,256,1566878400"; 
   d="scan'208";a="6779129"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 4 Oct 2019 16:17:03 +0100
Message-ID: <20191004151707.24844-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191004151707.24844-1-ian.jackson@eu.citrix.com>
References: <20191004151707.24844-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 2/6] xl: Pass libxl_domain_config
 to freemem(), instead of b_info
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgYXJlIGdvaW5nIHRvIGNoYW5nZSB0aGUgbGlieGwgQVBJIGluIGEgbW9tZW50IGFuZCB0aGlz
IGNoYW5nZSB3aWxsCm1ha2UgaXQgc2ltcGxlci4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRvb2xzL3hsL3hsX3ZtY29udHJvbC5j
IHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMveGwveGxfdm1jb250cm9sLmMgYi90b29scy94bC94bF92
bWNvbnRyb2wuYwppbmRleCBiMjA1ODJlMTViLi5kMzNjNmIzOGM5IDEwMDY0NAotLS0gYS90b29s
cy94bC94bF92bWNvbnRyb2wuYworKysgYi90b29scy94bC94bF92bWNvbnRyb2wuYwpAQCAtMzE0
LDcgKzMxNCw3IEBAIHN0YXRpYyBpbnQgZG9tYWluX3dhaXRfZXZlbnQodWludDMyX3QgZG9taWQs
IGxpYnhsX2V2ZW50ICoqZXZlbnRfcikKICAqIFJldHVybnMgdHJ1ZSBpbiBjYXNlIHRoZXJlIGlz
IGFscmVhZHksIG9yIHdlIG1hbmFnZSB0byBmcmVlIGl0LCBlbm91Z2gKICAqIG1lbW9yeSwgYnV0
IGFsc28gaWYgYXV0b2JhbGxvb24gaXMgZmFsc2UuCiAgKi8KLXN0YXRpYyBib29sIGZyZWVtZW0o
dWludDMyX3QgZG9taWQsIGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvICpiX2luZm8pCitzdGF0aWMg
Ym9vbCBmcmVlbWVtKHVpbnQzMl90IGRvbWlkLCBsaWJ4bF9kb21haW5fY29uZmlnICpkX2NvbmZp
ZykKIHsKICAgICBpbnQgcmMsIHJldHJpZXMgPSAzOwogICAgIHVpbnQ2NF90IG5lZWRfbWVta2Is
IGZyZWVfbWVta2I7CkBAIC0zMjIsNyArMzIyLDcgQEAgc3RhdGljIGJvb2wgZnJlZW1lbSh1aW50
MzJfdCBkb21pZCwgbGlieGxfZG9tYWluX2J1aWxkX2luZm8gKmJfaW5mbykKICAgICBpZiAoIWF1
dG9iYWxsb29uKQogICAgICAgICByZXR1cm4gdHJ1ZTsKIAotICAgIHJjID0gbGlieGxfZG9tYWlu
X25lZWRfbWVtb3J5KGN0eCwgYl9pbmZvLCAmbmVlZF9tZW1rYik7CisgICAgcmMgPSBsaWJ4bF9k
b21haW5fbmVlZF9tZW1vcnkoY3R4LCAmZF9jb25maWctPmJfaW5mbywgJm5lZWRfbWVta2IpOwog
ICAgIGlmIChyYyA8IDApCiAgICAgICAgIHJldHVybiBmYWxzZTsKIApAQCAtODc5LDcgKzg3OSw3
IEBAIHN0YXJ0OgogICAgICAgICBnb3RvIGVycm9yX291dDsKIAogICAgIGlmIChkb21pZF9zb2Z0
X3Jlc2V0ID09IElOVkFMSURfRE9NSUQpIHsKLSAgICAgICAgaWYgKCFmcmVlbWVtKGRvbWlkLCAm
ZF9jb25maWcuYl9pbmZvKSkgeworICAgICAgICBpZiAoIWZyZWVtZW0oZG9taWQsICZkX2NvbmZp
ZykpIHsKICAgICAgICAgICAgIGZwcmludGYoc3RkZXJyLCAiZmFpbGVkIHRvIGZyZWUgbWVtb3J5
IGZvciB0aGUgZG9tYWluXG4iKTsKICAgICAgICAgICAgIHJldCA9IEVSUk9SX0ZBSUw7CiAgICAg
ICAgICAgICBnb3RvIGVycm9yX291dDsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
