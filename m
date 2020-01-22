Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 856BF144B10
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 06:16:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu8L7-00056c-8y; Wed, 22 Jan 2020 05:14:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gwqu=3L=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1iu5K9-00066g-4j
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 02:00:53 +0000
X-Inumbo-ID: fc63cb50-3cba-11ea-aecd-bc764e2007e4
Received: from mail-yw1-xc41.google.com (unknown [2607:f8b0:4864:20::c41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc63cb50-3cba-11ea-aecd-bc764e2007e4;
 Wed, 22 Jan 2020 02:00:38 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id 10so2495911ywv.5
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 18:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SaWxfqJm41og76Jm8+3U0jfqiLqBbAIVCGxH45ZlXVE=;
 b=DqogCYDGO7HOA7o00P5BDVsVGvegQSD5WVxKJZYPUuuEmgjzIJz3H0TCVK+keK3ZzE
 wwWFN56Uts9hlpjKzESUphReFBZRB6Mhru5pdPivWp11IinKXJRGZbUGGjlznIM3QVcS
 vtbt2Gt/VyMf+6w95O+edtJMmP0c+GGypUl7dOF/Bk54Ots5HpLxzNG3dQaXbaptsmL2
 TUX5ErMK2eR1Vw6AJUpn2zDyLn/D5d3m8hoYIzw1C19LPk4DGRrgiglJetJZrHM2rJMZ
 XMq77AB8OlsO5spvnkGdAxMc8m7GAon5YxGoFebqPEusJbC0SaHzBAINKHMPpsTjRFZi
 Q73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SaWxfqJm41og76Jm8+3U0jfqiLqBbAIVCGxH45ZlXVE=;
 b=HRmR19Axt+uAM/r+JNyQH1Ozjbd64R+CEVPdAWvlgIruHKDzIgO1V0pGGuRw4DNQOX
 r+n1Nvs7eXCfS+nwl5/qChNI7UVallm5pQFyyaKrtlNZXoBIITxU6pDvLLB8kv8tIpQY
 g51nshXJBwf4hgGN+ZHVIm86ud+d2GFuBCJsxNtUK69Q9ta31aeQBC/x/J3cAW5ZGsPS
 2JGDRfyYKANtT47l4okqaBofh99UbvvIA3r8mwU3X9Zc9PZKKbPhxEr8lpZHOlfesJ3r
 IYZDlhfkQKwosIoxWFds8xzGkq8awFf8JhOOa3r4JZ91avP8Abks8UKNZjCLoh6AsP8u
 Ou5g==
X-Gm-Message-State: APjAAAVC5jYZnROCkEGGQvjYClpjkqJECfajxBBGy7n+N/iXREs7Htod
 aC3wJO/u3fkNnufFnD99PJJXDqjjqLIgjA==
X-Google-Smtp-Source: APXvYqwI4dO/6vXrjh2FJiTrFN0JiKfKeVXlZCVjXDH+J4MZdxnZVsVMah/rpXTf0ZgQWC6hOc1PKw==
X-Received: by 2002:a81:4f56:: with SMTP id d83mr5506611ywb.39.1579658437784; 
 Tue, 21 Jan 2020 18:00:37 -0800 (PST)
Received: from bobbye-pc.knology.net ([216.186.244.35])
 by smtp.gmail.com with ESMTPSA id q185sm17504248ywh.61.2020.01.21.18.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 18:00:37 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 Jan 2020 19:58:45 -0600
Message-Id: <ceb608b4e5c5ffc75e5787c57cd3f671efb77879.1579615303.git.bobbyeshleman@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579615303.git.bobbyeshleman@gmail.com>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Jan 2020 05:14:01 +0000
Subject: [Xen-devel] [RFC XEN PATCH 06/23] riscv: Add riscv to tools/libxc
 header files
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
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Dan Robertson <dan@dlrobertson.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgoKU2lnbmVk
LW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgotLS0K
IHRvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oIHwgIDcgKysrKysKIHRvb2xzL2xpYnhjL3hj
X2NvcmUuaCAgICAgICAgIHwgIDIgKysKIHRvb2xzL2xpYnhjL3hjX2NvcmVfcmlzY3YuaCAgIHwg
NTcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwg
NjYgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2xpYnhjL3hjX2NvcmVf
cmlzY3YuaAoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oIGIvdG9v
bHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmgKaW5kZXggNzVmMTkxYWUzYS4uNGNiZTM1YmIyYiAx
MDA2NDQKLS0tIGEvdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmgKKysrIGIvdG9vbHMvbGli
eGMvaW5jbHVkZS94ZW5jdHJsLmgKQEAgLTgzLDYgKzgzLDEzIEBACiAjZGVmaW5lIHhlbl9tYigp
ICAgYXNtIHZvbGF0aWxlICgiZG1iIHN5IiA6IDogOiAibWVtb3J5IikKICNkZWZpbmUgeGVuX3Jt
YigpICBhc20gdm9sYXRpbGUgKCJkbWIgc3kiIDogOiA6ICJtZW1vcnkiKQogI2RlZmluZSB4ZW5f
d21iKCkgIGFzbSB2b2xhdGlsZSAoImRtYiBzeSIgOiA6IDogIm1lbW9yeSIpCisjZWxpZiBkZWZp
bmVkKF9fcmlzY3YpCisjZGVmaW5lIFJJU0NWX0ZFTkNFKHAsIHMpIFwKKyAgX19hc21fXyBfX3Zv
bGF0aWxlX18gKCJmZW5jZSAiICNwICIsIiAjcyA6IDogOiAibWVtb3J5IikKKworI2RlZmluZSB4
ZW5fbWIoKSAgUklTQ1ZfRkVOQ0UocncscncpCisjZGVmaW5lIHhlbl9ybWIoKSBSSVNDVl9GRU5D
RShyLHIpCisjZGVmaW5lIHhlbl93bWIoKSBSSVNDVl9GRU5DRSh3LHcpCiAjZWxzZQogI2Vycm9y
ICJEZWZpbmUgYmFycmllcnMiCiAjZW5kaWYKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhjL3hjX2Nv
cmUuaCBiL3Rvb2xzL2xpYnhjL3hjX2NvcmUuaAppbmRleCBlZDdlZDUzY2E1Li43YmFiYTNlNGJk
IDEwMDY0NAotLS0gYS90b29scy9saWJ4Yy94Y19jb3JlLmgKKysrIGIvdG9vbHMvbGlieGMveGNf
Y29yZS5oCkBAIC0xNTUsNiArMTU1LDggQEAgaW50IHhjX2NvcmVfYXJjaF9nZXRfc2NyYXRjaF9n
cGZuKHhjX2ludGVyZmFjZSAqeGNoLCB1aW50MzJfdCBkb21pZCwKICMgaW5jbHVkZSAieGNfY29y
ZV94ODYuaCIKICNlbGlmIGRlZmluZWQgKF9fYXJtX18pIHx8IGRlZmluZWQoX19hYXJjaDY0X18p
CiAjIGluY2x1ZGUgInhjX2NvcmVfYXJtLmgiCisjZWxpZiBkZWZpbmVkKF9fcmlzY3YpCisjIGlu
Y2x1ZGUgInhjX2NvcmVfcmlzY3YuaCIKICNlbHNlCiAjIGVycm9yICJ1bnN1cHBvcnRlZCBhcmNo
aXRlY3R1cmUiCiAjZW5kaWYKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhjL3hjX2NvcmVfcmlzY3Yu
aCBiL3Rvb2xzL2xpYnhjL3hjX2NvcmVfcmlzY3YuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwLi4zNTMwMjA1NzZlCi0tLSAvZGV2L251bGwKKysrIGIvdG9vbHMvbGlieGMv
eGNfY29yZV9yaXNjdi5oCkBAIC0wLDAgKzEsNTcgQEAKKy8qCisgKiBUaGlzIGxpYnJhcnkgaXMg
ZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCisgKiBtb2RpZnkg
aXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwgUHVibGljCisgKiBM
aWNlbnNlIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRo
ZXIKKyAqIHZlcnNpb24gMi4xIG9mIHRoZSBMaWNlbnNlLCBvciAoYXQgeW91ciBvcHRpb24pIGFu
eSBsYXRlciB2ZXJzaW9uLgorICoKKyAqIFRoaXMgbGlicmFyeSBpcyBkaXN0cmlidXRlZCBpbiB0
aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorICogYnV0IFdJVEhPVVQgQU5ZIFdBUlJB
TlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKKyAqIE1FUkNIQU5UQUJJ
TElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUgR05VCisg
KiBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorICoKKyAq
IFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJh
bCBQdWJsaWMKKyAqIExpY2Vuc2UgYWxvbmcgd2l0aCB0aGlzIGxpYnJhcnk7IElmIG5vdCwgc2Vl
IDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KKyAqCisgKi8KKworI2lmbmRlZiBYQ19D
T1JFX1JJU0NWX0gKKyNkZWZpbmUgWENfQ09SRV9SSVNDVl9ICisKKyNkZWZpbmUgRUxGX0FSQ0hf
REFUQSAgICAgICAgICAgRUxGREFUQTJMU0IKKyNkZWZpbmUgRUxGX0FSQ0hfTUFDSElORSAgICAg
ICAgRU1fUklTQ1YKKworc3RydWN0IHhjX2NvcmVfYXJjaF9jb250ZXh0IHsKKyAgICAvKiBub3Ro
aW5nICovCit9OworCisjZGVmaW5lIHhjX2NvcmVfYXJjaF9jb250ZXh0X2luaXQoYXJjaF9jdHh0
KSAgICAgICAgICAgIGRvIHt9IHdoaWxlICgwKQorI2RlZmluZSB4Y19jb3JlX2FyY2hfY29udGV4
dF9mcmVlKGFyY2hfY3R4dCkgICAgICAgICAgICBkbyB7fSB3aGlsZSAoMCkKKyNkZWZpbmUgeGNf
Y29yZV9hcmNoX2NvbnRleHRfZ2V0KGFyY2hfY3R4dCwgY3R4dCwgeGNoLCBkb21pZCkgXAorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICgwKQorI2RlZmluZSB4Y19jb3JlX2FyY2hfY29udGV4dF9kdW1wKHhjaCwgYXJjaF9jdHh0
LCBhcmdzLCBkdW1wX3J0bikgICAgKDApCisKK2ludAoreGNfY29yZV9hcmNoX2dwZm5fbWF5X3By
ZXNlbnQoc3RydWN0IHhjX2NvcmVfYXJjaF9jb250ZXh0ICphcmNoX2N0eHQsCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHBmbik7CitzdGF0aWMgaW5saW5lIGlu
dAoreGNfY29yZV9hcmNoX2NvbnRleHRfZ2V0X3NoZHIoeGNfaW50ZXJmYWNlICp4Y2gsCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgeGNfY29yZV9hcmNoX2NvbnRleHQgKmFy
Y2hfY3R4dCwgCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgeGNfY29yZV9z
ZWN0aW9uX2hlYWRlcnMgKnNoZWFkZXJzLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IHhjX2NvcmVfc3RydGFiICpzdHJ0YWIsCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1aW50NjRfdCAqZmlsZXN6LCB1aW50NjRfdCBvZmZzZXQpCit7CisgICAgKmZpbGVzeiA9
IDA7CisgICAgcmV0dXJuIDA7Cit9CisKKyNlbmRpZiAvKiBYQ19DT1JFX1JJU0NWX0ggKi8KKwor
LyoKKyAqIExvY2FsIHZhcmlhYmxlczoKKyAqIG1vZGU6IEMKKyAqIGMtZmlsZS1zdHlsZTogIkJT
RCIKKyAqIGMtYmFzaWMtb2Zmc2V0OiA0CisgKiB0YWItd2lkdGg6IDQKKyAqIGluZGVudC10YWJz
LW1vZGU6IG5pbAorICogRW5kOgorICovCi0tIAoyLjI1LjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
