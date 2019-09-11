Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4600CAFA78
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 12:34:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7zvT-00007Z-Sx; Wed, 11 Sep 2019 10:32:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AiaO=XG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1i7zvS-00007G-AS
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 10:32:38 +0000
X-Inumbo-ID: 74df8a82-d47f-11e9-b299-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74df8a82-d47f-11e9-b299-bc764e2007e4;
 Wed, 11 Sep 2019 10:32:30 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id w67so16009003lff.4
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2019 03:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aqXFQn3KxWtsIDGkNKwWIgnyKzS5VXO95uQ8ju2Spbk=;
 b=Q/90VE4ZsQYdXaQZj0SMpAOryuSI4oLF014698oCBwgip3cEhFWFwdgsHd2Z5hP2Af
 5s0EbjXov/zOjTok7I7AMBfPe9OyiuNt+pWBnb9AXea0L92tiMW+nO9pNCcr4ZPtq2f+
 Z0fdxxeLEWsPNvTQNe8xnMz1JMa/1UU+M0Lso3czkFew5EO1ajQr6RkH76tRjrnfaT+u
 AmW8SzEkCNyMZJtkPsJn4W4T0EUwILs+I6AeiOSzIY3DwX+npRDWD0q5/ZxcLDlMxRay
 164vu7VAwvPEqImM+vus132RB7w4Fsjy+Te7LwOwWVCH+tDSM1FxoeNIKysP+WjNtic9
 N7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aqXFQn3KxWtsIDGkNKwWIgnyKzS5VXO95uQ8ju2Spbk=;
 b=j6c18ILiyX5zKU43/wSGRIKnQbjbzY+6nICPG+DmLvTbIxmocZ5Hp8xZhPp9nlUmWx
 Nf01AjSWNou7snkF3CJweKVqZhv++qSKxMKIiZMdchql75Ijw9SkiRcLLqJYda30J5bA
 gRzjR27AxYrqImu3PMmJrWKrNN1gYh0ouqaSOS3FEXrqMgr6e8y+Qj3kYqWQT8CELOwG
 kormlF5S1CjkW8TWjJmjFtJZdCo0qOJ9rhG/BNwP5eUtbOChRg0SzvPasIkOXF9WTrQY
 0nf4ntuTmv75cEMTp97HvcjaD3mN9nvBfAoNFZPOUzQZmV+efSUnucMpUgZHGi+IarCm
 gl3A==
X-Gm-Message-State: APjAAAUNWZSQaRkV/5HbhQ1aIZFWHIt2sqzpHomdzN47rMyDwsOwc2U9
 J9Jjea0F6wrXwS5dx6WlCc2rlfPde38=
X-Google-Smtp-Source: APXvYqxwhq4bqGgpmK+m18qIu6USIpEwLeSuAJRw7jtd6RNL/NRsYXdybm/xkxz6mT9NmS7BUwRXJA==
X-Received: by 2002:a05:6512:6c:: with SMTP id
 i12mr23753466lfo.40.1568197948968; 
 Wed, 11 Sep 2019 03:32:28 -0700 (PDT)
Received: from aanisov-work.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id w27sm4585275ljd.55.2019.09.11.03.32.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 11 Sep 2019 03:32:28 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 11 Sep 2019 13:32:15 +0300
Message-Id: <1568197942-15374-3-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568197942-15374-1-git-send-email-andrii.anisov@gmail.com>
References: <1568197942-15374-1-git-send-email-andrii.anisov@gmail.com>
Subject: [Xen-devel] [RFC 2/9] sysctl: extend XEN_SYSCTL_getcpuinfo interface
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCkV4dGVuZCBYRU5f
U1lTQ1RMX2dldGNwdWluZm8gaW50ZXJmYWNlIHdpdGggdGltaW5nIGluZm9ybWF0aW9uCnByb3Zp
ZGVkIGJ5IGludHJvZHVjZWQgdGltZSBhY2NvdW50aW5nIGluZnJhc3RydWN0dXJlLgoKU2lnbmVk
LW9mZi1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KLS0tCiB4ZW4v
Y29tbW9uL3NjaGVkdWxlLmMgICAgICAgfCAzMyArKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0KIHhlbi9jb21tb24vc3lzY3RsLmMgICAgICAgICB8ICA0ICsrKysKIHhlbi9pbmNsdWRl
L3B1YmxpYy9zeXNjdGwuaCB8ICA0ICsrKysKIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oICAgICB8
ICA0ICsrKysKIDQgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMgYi94ZW4vY29tbW9uL3NjaGVk
dWxlLmMKaW5kZXggNmRkNjYwMy4uMjAwNzAzNCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hl
ZHVsZS5jCisrKyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwpAQCAtMjA4LDEzICsyMDgsMzYgQEAg
dm9pZCB2Y3B1X3J1bnN0YXRlX2dldChzdHJ1Y3QgdmNwdSAqdiwgc3RydWN0IHZjcHVfcnVuc3Rh
dGVfaW5mbyAqcnVuc3RhdGUpCiAKIHVpbnQ2NF90IGdldF9jcHVfaWRsZV90aW1lKHVuc2lnbmVk
IGludCBjcHUpCiB7Ci0gICAgc3RydWN0IHZjcHVfcnVuc3RhdGVfaW5mbyBzdGF0ZSA9IHsgMCB9
OwotICAgIHN0cnVjdCB2Y3B1ICp2ID0gaWRsZV92Y3B1W2NwdV07CisgICAgc3RydWN0IHRhY2Mg
KnRhY2MgPSAmcGVyX2NwdSh0YWNjLCBjcHUpOwogCi0gICAgaWYgKCBjcHVfb25saW5lKGNwdSkg
JiYgdiApCi0gICAgICAgIHZjcHVfcnVuc3RhdGVfZ2V0KHYsICZzdGF0ZSk7CisgICAgcmV0dXJu
IHRhY2MtPnN0YXRlX3RpbWVbVEFDQ19JRExFXTsKK30KKwordWludDY0X3QgZ2V0X2NwdV9ndWVz
dF90aW1lKHVuc2lnbmVkIGludCBjcHUpCit7CisgICAgc3RydWN0IHRhY2MgKnRhY2MgPSAmcGVy
X2NwdSh0YWNjLCBjcHUpOworCisgICAgcmV0dXJuIHRhY2MtPnN0YXRlX3RpbWVbVEFDQ19HVUVT
VF07Cit9CisKK3VpbnQ2NF90IGdldF9jcHVfaHlwX3RpbWUodW5zaWduZWQgaW50IGNwdSkKK3sK
KyAgICBzdHJ1Y3QgdGFjYyAqdGFjYyA9ICZwZXJfY3B1KHRhY2MsIGNwdSk7CisKKyAgICByZXR1
cm4gdGFjYy0+c3RhdGVfdGltZVtUQUNDX0hZUF07Cit9CisKK3VpbnQ2NF90IGdldF9jcHVfaXJx
X3RpbWUodW5zaWduZWQgaW50IGNwdSkKK3sKKyAgICBzdHJ1Y3QgdGFjYyAqdGFjYyA9ICZwZXJf
Y3B1KHRhY2MsIGNwdSk7CisKKyAgICByZXR1cm4gdGFjYy0+c3RhdGVfdGltZVtUQUNDX0lSUV07
Cit9Cit1aW50NjRfdCBnZXRfY3B1X2dzeW5jX3RpbWUodW5zaWduZWQgaW50IGNwdSkKK3sKKyAg
ICBzdHJ1Y3QgdGFjYyAqdGFjYyA9ICZwZXJfY3B1KHRhY2MsIGNwdSk7CiAKLSAgICByZXR1cm4g
c3RhdGUudGltZVtSVU5TVEFURV9ydW5uaW5nXTsKKyAgICByZXR1cm4gdGFjYy0+c3RhdGVfdGlt
ZVtUQUNDX0dTWU5DXTsKIH0KIAogLyoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc3lzY3RsLmMg
Yi94ZW4vY29tbW9uL3N5c2N0bC5jCmluZGV4IDkyYjRlYTAuLmI2MzA4M2MgMTAwNjQ0Ci0tLSBh
L3hlbi9jb21tb24vc3lzY3RsLmMKKysrIGIveGVuL2NvbW1vbi9zeXNjdGwuYwpAQCAtMTUyLDYg
KzE1MiwxMCBAQCBsb25nIGRvX3N5c2N0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9zeXNj
dGxfdCkgdV9zeXNjdGwpCiAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgbnJfY3B1czsgaSsrICkK
ICAgICAgICAgewogICAgICAgICAgICAgY3B1aW5mby5pZGxldGltZSA9IGdldF9jcHVfaWRsZV90
aW1lKGkpOworICAgICAgICAgICAgY3B1aW5mby5ndWVzdHRpbWUgPSBnZXRfY3B1X2d1ZXN0X3Rp
bWUoaSk7CisgICAgICAgICAgICBjcHVpbmZvLmh5cHRpbWUgPSBnZXRfY3B1X2h5cF90aW1lKGkp
OworICAgICAgICAgICAgY3B1aW5mby5nc3luY3RpbWUgPSBnZXRfY3B1X2dzeW5jX3RpbWUoaSk7
CisgICAgICAgICAgICBjcHVpbmZvLmlycXRpbWUgPSBnZXRfY3B1X2lycV90aW1lKGkpOwogCiAg
ICAgICAgICAgICBpZiAoIGNvcHlfdG9fZ3Vlc3Rfb2Zmc2V0KG9wLT51LmdldGNwdWluZm8uaW5m
bywgaSwgJmNwdWluZm8sIDEpICkKICAgICAgICAgICAgICAgICBnb3RvIG91dDsKZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNj
dGwuaAppbmRleCA1NDAxZjljLi5jZGFkYTFmIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9wdWJs
aWMvc3lzY3RsLmgKKysrIGIveGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oCkBAIC0xNjgsNiAr
MTY4LDEwIEBAIHN0cnVjdCB4ZW5fc3lzY3RsX2RlYnVnX2tleXMgewogLyogWEVOX1NZU0NUTF9n
ZXRjcHVpbmZvICovCiBzdHJ1Y3QgeGVuX3N5c2N0bF9jcHVpbmZvIHsKICAgICB1aW50NjRfYWxp
Z25lZF90IGlkbGV0aW1lOworICAgIHVpbnQ2NF9hbGlnbmVkX3QgaHlwdGltZTsKKyAgICB1aW50
NjRfYWxpZ25lZF90IGd1ZXN0dGltZTsKKyAgICB1aW50NjRfYWxpZ25lZF90IGlycXRpbWU7Cisg
ICAgdWludDY0X2FsaWduZWRfdCBnc3luY3RpbWU7CiB9OwogdHlwZWRlZiBzdHJ1Y3QgeGVuX3N5
c2N0bF9jcHVpbmZvIHhlbl9zeXNjdGxfY3B1aW5mb190OwogREVGSU5FX1hFTl9HVUVTVF9IQU5E
TEUoeGVuX3N5c2N0bF9jcHVpbmZvX3QpOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3Nj
aGVkLmggYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAppbmRleCAwNGE4NzI0Li44MTY3NjA4IDEw
MDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4v
c2NoZWQuaApAQCAtODc2LDYgKzg3NiwxMCBAQCB2b2lkIHJlc3RvcmVfdmNwdV9hZmZpbml0eShz
dHJ1Y3QgZG9tYWluICpkKTsKIAogdm9pZCB2Y3B1X3J1bnN0YXRlX2dldChzdHJ1Y3QgdmNwdSAq
diwgc3RydWN0IHZjcHVfcnVuc3RhdGVfaW5mbyAqcnVuc3RhdGUpOwogdWludDY0X3QgZ2V0X2Nw
dV9pZGxlX3RpbWUodW5zaWduZWQgaW50IGNwdSk7Cit1aW50NjRfdCBnZXRfY3B1X2h5cF90aW1l
KHVuc2lnbmVkIGludCBjcHUpOwordWludDY0X3QgZ2V0X2NwdV9ndWVzdF90aW1lKHVuc2lnbmVk
IGludCBjcHUpOwordWludDY0X3QgZ2V0X2NwdV9nc3luY190aW1lKHVuc2lnbmVkIGludCBjcHUp
OwordWludDY0X3QgZ2V0X2NwdV9pcnFfdGltZSh1bnNpZ25lZCBpbnQgY3B1KTsKIAogLyoKICAq
IFVzZWQgYnkgaWRsZSBsb29wIHRvIGRlY2lkZSB3aGV0aGVyIHRoZXJlIGlzIHdvcmsgdG8gZG86
Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
