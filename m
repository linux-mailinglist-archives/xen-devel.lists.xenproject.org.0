Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B61AFA83
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 12:35:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7zvs-0000Lb-RE; Wed, 11 Sep 2019 10:33:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AiaO=XG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1i7zvr-0000Ks-AR
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 10:33:03 +0000
X-Inumbo-ID: 793ed45c-d47f-11e9-a337-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 793ed45c-d47f-11e9-a337-bc764e2007e4;
 Wed, 11 Sep 2019 10:32:37 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id r134so16000689lff.12
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2019 03:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Pe9dvRwPhdT31/9Du9G7/kjBTUkLjLa2MmB2iXYgZwg=;
 b=NyaNagQ/0rkjRnn2FpInVnjY6JHRRjh3OlJ2NA6KLGo0THcH9KEsNCS3XJoEetGs3i
 jHeXHwXYN0mmcEAV/e8k7MQV+Bs9uJjxCR5E4KAnqFn5vIMeb007oQ/PTa9smFPDExi/
 MkmA1Rqp7Dx3a4mXaaYwRr5ZoIpVXkwx9ds/4J3FsgxzPXM0afijlkND4+1wbzorl2R2
 3Bs44QgGvJuFNT1yy2nEk50e/DfTPaX9jmVifXshFJQ8KsqKdyoo8r9uqFJq+qjuxdba
 0CnEbXapbcmEFt5KmYl8ycUTI5UtFUWwoMHMqPHxjSUR8OWa3wjI3s1b5RS45HFW6Xp4
 stsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Pe9dvRwPhdT31/9Du9G7/kjBTUkLjLa2MmB2iXYgZwg=;
 b=sIWJkYr30bDQ6M1ZHY2modvncPAGBOgF+SvdXuyqwRdksu9TnnSgr1tAduBXKK/3YS
 fPoNWPVanoK3QmEgZysDQzh50RhHXv+LNXuNcAURXKwsYW3tGdh3oBRriBptk/RQur3X
 7sA2nhMP8ZbKMzkfOiXFwNYrzEhxYyTBtg712q+lTqAG6Ap/Fr5O6VCI6TRoLraNoo0P
 uOKLlretouJ5i/li7KEpv+G7wW1Ck01D79vU7zNzI5ePiH6uktbdkn9X64kZDLzzDa2I
 sUwXF2iiY1EZw8P7yWFUh71vVjXA+/2dhu/pMnZ+P6fopGYl/yOYpLjEBzT7eIRBElEP
 DaEA==
X-Gm-Message-State: APjAAAWleSZdA6A1UFRA+bZvVJDwyfyDASiv5dF7Kng9uzAS3DyGObFN
 lJyIto2oJDbxP6AudOfQFdtBpI+4l0k=
X-Google-Smtp-Source: APXvYqxjejrhFx/4g2irDO7w4Gg156RQ5cKIophC9kg0Yr2AE0r6OpyXiLm4oNq1tXRpJjIv/+EvCQ==
X-Received: by 2002:ac2:4adb:: with SMTP id m27mr5227384lfp.1.1568197956313;
 Wed, 11 Sep 2019 03:32:36 -0700 (PDT)
Received: from aanisov-work.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id w27sm4585275ljd.55.2019.09.11.03.32.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 11 Sep 2019 03:32:35 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 11 Sep 2019 13:32:20 +0300
Message-Id: <1568197942-15374-8-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568197942-15374-1-git-send-email-andrii.anisov@gmail.com>
References: <1568197942-15374-1-git-send-email-andrii.anisov@gmail.com>
Subject: [Xen-devel] [RFC 7/9] tacc: Introduce a locked interface for guest
 time
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KClRoZSBsb2NrZWQg
aW50ZXJmYWNlIHRvIGFjcXVpcmUgZ3Vlc3QgdGltZSBieSBzY2hlZHVsaW5nIGNvZGUKaXMgaW50
cm9kdWNlZC4gSXQgY2FuIGJlIHVzZWQgYnkgc2NoZWR1bGVycyB3aGF0IGRvIHJlcXVpcmUKZ3Vl
c3QgdGltZSBmcm9tIGEgZGlmZmVyZW50IHBjcHUgdG8gdGFrZSBzY2hlZHVsaW5nIGRlY2lzc2lv
bi4KClNpZ25lZC1vZmYtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+
Ci0tLQogeGVuL2NvbW1vbi9LY29uZmlnICAgICAgfCAgMyArKysKIHhlbi9jb21tb24vc2NoZWR1
bGUuYyAgIHwgNDQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
IHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIHwgMTEgKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdl
ZCwgNTggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vS2NvbmZpZyBiL3hl
bi9jb21tb24vS2NvbmZpZwppbmRleCAxNjgyOWY2Li5jMTc0OGRkIDEwMDY0NAotLS0gYS94ZW4v
Y29tbW9uL0tjb25maWcKKysrIGIveGVuL2NvbW1vbi9LY29uZmlnCkBAIC0yMjEsNiArMjIxLDkg
QEAgY29uZmlnIEFSR08KIG1lbnUgIlNjaGVkdWxlcnMiCiAJdmlzaWJsZSBpZiBFWFBFUlQgPSAi
eSIKIAorY29uZmlnIFRBQ0NfTkVFRFNfTE9DSworCWJvb2wKKwogY29uZmlnIFNDSEVEX0NSRURJ
VAogCWJvb2wgIkNyZWRpdCBzY2hlZHVsZXIgc3VwcG9ydCIKIAlkZWZhdWx0IHkKZGlmZiAtLWdp
dCBhL3hlbi9jb21tb24vc2NoZWR1bGUuYyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwppbmRleCA2
MmRmNzdlLi45OGI3MzlmIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMKKysrIGIv
eGVuL2NvbW1vbi9zY2hlZHVsZS5jCkBAIC0xNTYyLDYgKzE1NjIsMTQgQEAgc3RhdGljIHZvaWQg
c2NoZWR1bGUodm9pZCkKICAgICBjb250ZXh0X3N3aXRjaChwcmV2LCBuZXh0KTsKIH0KIAorI2lm
ZGVmIENPTkZJR19UQUNDX05FRURTX0xPQ0sKKyNkZWZpbmUgICAgIHRhY2NfbG9jayh0YWNjKSBz
cGluX2xvY2soJnRhY2MtPnRhY2NfbG9jaykKKyNkZWZpbmUgICAgIHRhY2NfdW5sb2NrKHRhY2Mp
IHNwaW5fdW5sb2NrKCZ0YWNjLT50YWNjX2xvY2spCisjZWxzZQorI2RlZmluZSAgICAgdGFjY19s
b2NrKHRhY2MpCisjZGVmaW5lICAgICB0YWNjX3VubG9jayh0YWNjKQorI2VuZGlmCisKIERFRklO
RV9QRVJfQ1BVKHN0cnVjdCB0YWNjLCB0YWNjKTsKIAogc3RhdGljIHZvaWQgdGFjY19zdGF0ZV9j
aGFuZ2UoZW51bSBUQUNDX1NUQVRFUyBuZXdfc3RhdGUpCkBAIC0xNTcxLDYgKzE1NzksNyBAQCBz
dGF0aWMgdm9pZCB0YWNjX3N0YXRlX2NoYW5nZShlbnVtIFRBQ0NfU1RBVEVTIG5ld19zdGF0ZSkK
ICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwogCiAgICAgbG9jYWxfaXJxX3NhdmUoZmxhZ3MpOwor
ICAgIHRhY2NfbG9jayh0YWNjKTsKIAogICAgIG5vdyA9IE5PVygpOwogICAgIGRlbHRhID0gbm93
IC0gdGFjYy0+c3RhdGVfZW50cnlfdGltZTsKQEAgLTE1ODQsNiArMTU5Myw3IEBAIHN0YXRpYyB2
b2lkIHRhY2Nfc3RhdGVfY2hhbmdlKGVudW0gVEFDQ19TVEFURVMgbmV3X3N0YXRlKQogICAgIHRh
Y2MtPnN0YXRlID0gbmV3X3N0YXRlOwogICAgIHRhY2MtPnN0YXRlX2VudHJ5X3RpbWUgPSBub3c7
CiAKKyAgICB0YWNjX3VubG9jayh0YWNjKTsKICAgICBsb2NhbF9pcnFfcmVzdG9yZShmbGFncyk7
CiB9CiAKQEAgLTE2MjEsNyArMTYzMSw5IEBAIHZvaWQgdGFjY19pcnFfZW50ZXIoaW50IHBsYWNl
KQogCiAgICAgaWYgKCB0YWNjLT5pcnFfY250ID09IDAgKQogICAgIHsKKyAgICAgICAgdGFjY19s
b2NrKHRhY2MpOwogICAgICAgICB0YWNjLT5pcnFfZW50ZXJfdGltZSA9IE5PVygpOworICAgICAg
ICB0YWNjX3VubG9jayh0YWNjKTsKICAgICB9CiAKICAgICB0YWNjLT5pcnFfY250Kys7CkBAIC0x
NjM2LDggKzE2NDgsMTAgQEAgdm9pZCB0YWNjX2lycV9leGl0KGludCBwbGFjZSkKICAgICBBU1NF
UlQodGFjYy0+aXJxX2NudCA+IDApOwogICAgIGlmICggdGFjYy0+aXJxX2NudCA9PSAxICkKICAg
ICB7CisgICAgICAgIHRhY2NfbG9jayh0YWNjKTsKICAgICAgICAgdGFjYy0+aXJxX3RpbWUgPSBO
T1coKSAtIHRhY2MtPmlycV9lbnRlcl90aW1lOwogICAgICAgICB0YWNjLT5pcnFfZW50ZXJfdGlt
ZSA9IDA7CisgICAgICAgIHRhY2NfdW5sb2NrKHRhY2MpOwogICAgIH0KIAogICAgIHRhY2MtPmly
cV9jbnQtLTsKQEAgLTE2NTMsNiArMTY2NywzNiBAQCBzX3RpbWVfdCB0YWNjX2dldF9ndWVzdF90
aW1lKHN0cnVjdCB0YWNjICp0YWNjKQogICAgIHJldHVybiBndWVzdF90aW1lOwogfQogCisjaWZk
ZWYgQ09ORklHX1RBQ0NfTkVFRFNfTE9DSworc190aW1lX3QgdGFjY19nZXRfZ3Vlc3RfdGltZV9j
cHUoaW50IGNwdSkKK3sKKyAgICBzdHJ1Y3QgdGFjYyogdGFjYyA9ICZwZXJfY3B1KHRhY2MsIGNw
dSk7CisgICAgc190aW1lX3QgZ3Vlc3RfdGltZTsKKyAgICBzX3RpbWVfdCBub3c7CisKKyAgICB0
YWNjX2xvY2sodGFjYyk7CisKKyAgICBub3cgPSBOT1coKTsKKyAgICBndWVzdF90aW1lID0gdGFj
Y19nZXRfZ3Vlc3RfdGltZSh0YWNjKTsKKyAgICBpZiAodGFjYy0+c3RhdGUgPT0gVEFDQ19HVUVT
VCB8fCB0YWNjLT5zdGF0ZSA9PSBUQUNDX0dTWU5DKQorICAgIHsKKyAgICAgICAgZ3Vlc3RfdGlt
ZSArPSBOT1coKSAtIHRhY2MtPnN0YXRlX2VudHJ5X3RpbWU7CisgICAgfQorCisgICAgaWYgKHRh
Y2MtPmlycV9lbnRlcl90aW1lKQorICAgIHsKKyAgICAgICAgZ3Vlc3RfdGltZSAtPSBOT1coKSAt
IHRhY2MtPmlycV9lbnRlcl90aW1lOworICAgIH0KKworICAgIGd1ZXN0X3RpbWUgLT0gdGFjYy0+
aXJxX3RpbWU7CisKKyAgICB0YWNjX3VubG9jayh0YWNjKTsKKworICAgIHJldHVybiBndWVzdF90
aW1lOworfQorI2VuZGlmCisKKwogdm9pZCBjb250ZXh0X3NhdmVkKHN0cnVjdCB2Y3B1ICpwcmV2
KQogewogICAgIC8qIENsZWFyIHJ1bm5pbmcgZmxhZyAvYWZ0ZXIvIHdyaXRpbmcgY29udGV4dCB0
byBtZW1vcnkuICovCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9p
bmNsdWRlL3hlbi9zY2hlZC5oCmluZGV4IDViNDE4MDUuLmE2NDlkMWYgMTAwNjQ0Ci0tLSBhL3hl
bi9pbmNsdWRlL3hlbi9zY2hlZC5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCkBAIC0x
MDI4LDYgKzEwMjgsOSBAQCBzdHJ1Y3QgdGFjYwogICAgIHNfdGltZV90IGlycV9lbnRlcl90aW1l
OwogICAgIHNfdGltZV90IGlycV90aW1lOwogICAgIGludCBpcnFfY250OworI2lmZGVmIENPTkZJ
R19UQUNDX05FRURTX0xPQ0sKKyAgICBzcGlubG9ja190IHRhY2NfbG9jazsKKyNlbmRpZgogfTsK
IAogREVDTEFSRV9QRVJfQ1BVKHN0cnVjdCB0YWNjLCB0YWNjKTsKQEAgLTEwNDEsNiArMTA0NCwx
NCBAQCBpbmxpbmUgc190aW1lX3QgdGFjY19nZXRfZ3Vlc3RfdGltZV9kZWx0YSh2b2lkKQogICAg
IHJldHVybiB0YWNjX2dldF9ndWVzdF90aW1lKCZ0aGlzX2NwdSh0YWNjKSkgLSBjdXJyZW50LT5w
Y3B1X2d1ZXN0X3RpbWU7CiB9CiAKKyNpZmRlZiBDT05GSUdfVEFDQ19ORUVEU19MT0NLCitzX3Rp
bWVfdCB0YWNjX2dldF9ndWVzdF90aW1lX2NwdShpbnQgY3B1KTsKK2lubGluZSBzX3RpbWVfdCB0
YWNjX2dldF9ndWVzdF90aW1lX2RlbHRhX3ZjcHUoc3RydWN0IHZjcHUqIHZjcHUpCit7CisgICAg
cmV0dXJuIHRhY2NfZ2V0X2d1ZXN0X3RpbWVfY3B1KHZjcHUtPnByb2Nlc3NvcikgLSB2Y3B1LT5w
Y3B1X2d1ZXN0X3RpbWU7Cit9CisjZW5kaWYKKwogI2VuZGlmIC8qIF9fU0NIRURfSF9fICovCiAK
IC8qCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
