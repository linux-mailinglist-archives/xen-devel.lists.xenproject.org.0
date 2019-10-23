Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC57E2102
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 18:51:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNJob-0007Ps-HZ; Wed, 23 Oct 2019 16:48:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TICx=YQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iNJoa-0007PX-EJ
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 16:48:52 +0000
X-Inumbo-ID: f87304b8-f5b4-11e9-8aca-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f87304b8-f5b4-11e9-8aca-bc764e2007e4;
 Wed, 23 Oct 2019 16:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571849322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y0FIGjiDgCfrCtvVDl/alvj9oiarFxRbWo4lLPMs7go=;
 b=bhPRlh2NIp7GKhDiRSaNdkBVMbo0W6/f4kXvue5VUTrIjbKxX3zMeYIM
 H6v2j/Lr5jV12wUUjU+1bx8jEyGJ9nJljXfL4DVBn/CCVt1cxmVMzB7Cg
 hdZe804AWcJ6o8WJ8reKDPYcEsthVTxSYfI17lPR56oz8cV1MP2/FCsrd c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yKiBPdXyuu/vc7oB8ss7mW29PQ7Ayo/226IZUNZjpy1IlrGh/hamTc4s2R+AsgYH2alAn9c+CP
 FAIUt5QsmIIoAuETD8fG//zlq1oX9ots8e9VLlajhwr+cGaK3GnU1+eyOTKw1ad86nMdlIbfLE
 9dKmSkkvSyP2zK8hu0/OboBSaDO7RPx7Ghqf1sWawfd96v+NkYGB73+rLfHCSNMUKcLBXAEsVX
 UdxxcoIcWwp3TgsXTYGmHYVhDcvTmSSV6ZuIKtzy5mdfnDKl26vqWqGc3AbnOFsmqG6wiZeptF
 rxo=
X-SBRS: 2.7
X-MesageID: 7778031
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7778031"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 17:48:21 +0100
Message-ID: <20191023164837.2700240-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023164837.2700240-1-anthony.perard@citrix.com>
References: <20191023164837.2700240-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC XEN PATCH 07/23] xen,
 Kbuild: Handle obj-bin-y and %.init.o objects
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
Cc: Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U1BFQ0lBTF9EQVRBX1NFQ1RJT05TIGlzIHB1dCBpbiBLYnVpbGQuaW5jbHVkZSBzbyBpdCBjYW4g
YmUgdXNlIGluCmtidWlsZCBtYWtlZmlsZXMuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFS
RCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCiB4ZW4vc2NyaXB0cy9LYnVpbGQuaW5j
bHVkZSB8IDEwICsrKysrKysrKysKIHhlbi9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkIHwgMjQgKysr
KysrKysrKysrKysrKysrKysrKysrCiB4ZW4vc2NyaXB0cy9NYWtlZmlsZS5saWIgICB8ICA3ICsr
KysrKysKIDMgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hl
bi9zY3JpcHRzL0tidWlsZC5pbmNsdWRlIGIveGVuL3NjcmlwdHMvS2J1aWxkLmluY2x1ZGUKaW5k
ZXggNGIwNDMyZTA5NWFlLi42Zjk1YTI1MTlmM2MgMTAwNjQ0Ci0tLSBhL3hlbi9zY3JpcHRzL0ti
dWlsZC5pbmNsdWRlCisrKyBiL3hlbi9zY3JpcHRzL0tidWlsZC5pbmNsdWRlCkBAIC0zMjYsNiAr
MzI2LDE2IEBAIGVuZGVmCiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKKyMgRm9yIGJ1aWxk
aW5nICUuaW5pdC5vIGZpbGVzLCBjYW4gYmUgdXNlZCBpbiBrYnVpbGQgbWFrZWZpbGVzCitTUEVD
SUFMX0RBVEFfU0VDVElPTlMgOj0gcm9kYXRhICQoZm9yZWFjaCBhLDEgMiA0IDggMTYsIFwKKwkJ
CQkJICAgICQoZm9yZWFjaCB3LDEgMiA0LCBcCisJCQkJCQkJcm9kYXRhLnN0ciQodykuJChhKSkg
XAorCQkJCQkgICAgcm9kYXRhLmNzdCQoYSkpIFwKKwkJCSAkKGZvcmVhY2ggcixyZWwgcmVsLnJv
LGRhdGEuJChyKS5sb2NhbCkKKworIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworCisKICMgZGVsZXRl
IHBhcnRpYWxseSB1cGRhdGVkIChpLmUuIGNvcnJ1cHRlZCkgZmlsZXMgb24gZXJyb3IKIC5ERUxF
VEVfT05fRVJST1I6CiAKZGlmZiAtLWdpdCBhL3hlbi9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkIGIv
eGVuL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQKaW5kZXggZGQ5NzJkNWI1ZWRiLi42OGI1MDRjOWJk
YzUgMTAwNjQ0Ci0tLSBhL3hlbi9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkCisrKyBiL3hlbi9zY3Jp
cHRzL01ha2VmaWxlLmJ1aWxkCkBAIC0zODQsNiArMzg0LDMwIEBAICQob2JqKS8lLm86ICQoc3Jj
KS8lLlMgJChvYmp0b29sX2RlcCkgRk9SQ0UKIHRhcmdldHMgKz0gJChmaWx0ZXItb3V0ICQoc3Vi
ZGlyLW9iai15KSwgJChyZWFsLW9iai15KSkgJChyZWFsLW9iai1tKSAkKGxpYi15KQogdGFyZ2V0
cyArPSAkKGV4dHJhLXkpICQoTUFLRUNNREdPQUxTKSAkKGFsd2F5cykKIAorIyAlLmluaXQubyBv
YmplY3RzCisjIC0tLS0tLS0tLS0tLS0tLS0KKworcXVpZXRfY21kX29ial9pbml0X28gPSBJTklU
X09CSiAkQAorZGVmaW5lIGNtZF9vYmpfaW5pdF9vCisJc2V0IC1lOyBcCisJJChPQkpEVU1QKSAt
aCAkPCB8IHNlZCAtbiAnL1swLTldL3tzLDAwKiwwLGc7cDt9JyB8IHdoaWxlIHJlYWQgaWR4IG5h
bWUgc3ogcmVzdDsgZG8gXAorCQljYXNlICIkJG5hbWUiIGluIFwKKwkJLioubG9jYWwpIDs7IFwK
KwkJLnRleHR8LnRleHQuKnwuZGF0YXwuZGF0YS4qfC5ic3MpIFwKKwkJCXRlc3QgJCRzeiAhPSAw
IHx8IGNvbnRpbnVlOyBcCisJCQllY2hvICJFcnJvcjogc2l6ZSBvZiAkPDokJG5hbWUgaXMgMHgk
JHN6IiA+JjI7IFwKKwkJCWV4aXQgJCQoZXhwciAkJGlkeCArIDEpOzsgXAorCQllc2FjOyBcCisJ
ZG9uZTsgXAorCSQoT0JKQ09QWSkgJChmb3JlYWNoIHMsJChTUEVDSUFMX0RBVEFfU0VDVElPTlMp
LC0tcmVuYW1lLXNlY3Rpb24gLiQocyk9LmluaXQuJChzKSkgJDwgJEAKK2VuZGVmCisKKyQob2Jq
KS8lLmluaXQubzogJChvYmopLyUubyBGT1JDRQorCSQoY2FsbCBpZl9jaGFuZ2VkLG9ial9pbml0
X28pCisKKyMgQWRkIGludGVybWVkaWF0ZXMgZmlsZXMgaW50byB0YWdldHMKK3RhcmdldHMgKz0g
JChwYXRzdWJzdCAlLmluaXQubywlLm8sJChmaWx0ZXIgJS5pbml0Lm8sJCh0YXJnZXRzKSkpCisK
ICMgTGlua2VyIHNjcmlwdHMgcHJlcHJvY2Vzc29yICgubGRzLlMgLT4gLmxkcykKICMgLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCiBxdWlldF9jbWRfY3BwX2xkc19TID0gTERTICAgICAkQApkaWZmIC0tZ2l0
IGEveGVuL3NjcmlwdHMvTWFrZWZpbGUubGliIGIveGVuL3NjcmlwdHMvTWFrZWZpbGUubGliCmlu
ZGV4IGI3NDYxOTliN2Y2Yi4uZTAyMmYwNTM0OTRlIDEwMDY0NAotLS0gYS94ZW4vc2NyaXB0cy9N
YWtlZmlsZS5saWIKKysrIGIveGVuL3NjcmlwdHMvTWFrZWZpbGUubGliCkBAIC0xNiw2ICsxNiwx
MCBAQCBLQlVJTERfQ0ZMQUdTICs9ICQoc3ViZGlyLWNjZmxhZ3MteSkKICMgb25seSBidWlsZCB0
aGUgY29tcGlsZWQtaW4gdmVyc2lvbgogb2JqLW0gOj0gJChmaWx0ZXItb3V0ICQob2JqLXkpLCQo
b2JqLW0pKQogCisjIEZvciBhIG5vbi1MVE8gYnVpbGQsIGJ1bmRsZSBvYmotYmluIHRhcmdldHMg
aW4gd2l0aCB0aGUgbm9ybWFsIG9ianMuCitvYmoteSArPSAkKG9iai1iaW4teSkKK29iai1iaW4t
eSA6PQorCiAjIExpYnJhcmllcyBhcmUgYWx3YXlzIGNvbGxlY3RlZCBpbiBvbmUgbGliIGZpbGUu
CiAjIEZpbHRlciBvdXQgb2JqZWN0cyBhbHJlYWR5IGJ1aWx0LWluCiBsaWIteSA6PSAkKGZpbHRl
ci1vdXQgJChvYmoteSksICQoc29ydCAkKGxpYi15KSAkKGxpYi1tKSkpCkBAIC0xMDgsNiArMTEy
LDkgQEAgbmFtZS1maXggPSAkKHNxdW90ZSkkKHF1b3RlKSQoc3Vic3QgJChjb21tYSksXywkKHN1
YnN0IC0sXywkMSkpJChxdW90ZSkkKHNxdW90ZSkKIGJhc2VuYW1lX2ZsYWdzID0gLURLQlVJTERf
QkFTRU5BTUU9JChjYWxsIG5hbWUtZml4LCQoYmFzZXRhcmdldCkpCiBtb2RuYW1lX2ZsYWdzICA9
IC1ES0JVSUxEX01PRE5BTUU9JChjYWxsIG5hbWUtZml4LCQobW9kbmFtZSkpCiAKKyMgU2VlIGNv
bW1lbnQgYWJvdXQgSU5JVF9TRUNUSU9OU19PTkxZIGluIGluY2x1ZGUveGVuL2NvbXBpbGVyLmgK
KyQoZmlsdGVyICUuaW5pdC5vLCQocmVhbC1vYmoteSkgJChleHRyYS15KSk6IGNjZmxhZ3MteSAr
PSAtRElOSVRfU0VDVElPTlNfT05MWQorCiBvcmlnX2NfZmxhZ3MgICA9ICQoS0JVSUxEX0NQUEZM
QUdTKSAkKEtCVUlMRF9DRkxBR1MpIFwKICAgICAgICAgICAgICAgICAgJChjY2ZsYWdzLXkpICQo
Q0ZMQUdTXyQoYmFzZXRhcmdldCkubykKIF9jX2ZsYWdzICAgICAgID0gJChmaWx0ZXItb3V0ICQo
Q0ZMQUdTX1JFTU9WRV8kKGJhc2V0YXJnZXQpLm8pLCAkKG9yaWdfY19mbGFncykpCi0tIApBbnRo
b255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
