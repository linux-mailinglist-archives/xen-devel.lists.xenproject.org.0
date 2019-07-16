Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AE56B55A
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 06:25:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnbSv-0003Dz-Hu; Wed, 17 Jul 2019 04:22:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SQlR=VO=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hnbSu-0003Du-Fd
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 04:22:52 +0000
X-Inumbo-ID: 87eb1d50-a84a-11e9-bb5d-6fda1888d4ae
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87eb1d50-a84a-11e9-bb5d-6fda1888d4ae;
 Wed, 17 Jul 2019 04:22:47 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6H4Iv6n044565;
 Wed, 17 Jul 2019 04:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=eSrV5dBwkmZsMu4Ka82lD86iRkWsEW2KmhC9kjHylA0=;
 b=m1YoS9ABJu0MkSSMKND2HhentO2puo9i3adQ39MoHdTaPa8Uq3HOy93opOyiW7jBaImk
 TYp3BTPEfKgDntjYPUy38ygBTg8GHvmZE1neY2dMgJDrCWr2QcXFP34Pa8XybrH5M+g5
 IhIYCUscLxgVS8FiNytVlitipXERdMOb7qE85iNFCexuAcUEL9guXKb1ePOc98buv4pZ
 y7Uet2+XlDOFDP3kQmxEYCmDn8toGbhVSnPnIai4gZFe4Jbd1WX9s50FeIlR83CLSFrk
 yywxhJRRvfMhrsDxyzL8ixsTuupLIlKVW3GnPvho2RbFamr7wEDzyc4pXY/6OgneEymY eA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2tq78pr1c8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Jul 2019 04:22:35 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6H4IFZI096659;
 Wed, 17 Jul 2019 04:22:34 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2tsctwqsjy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Jul 2019 04:22:34 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x6H4MXWe014705;
 Wed, 17 Jul 2019 04:22:33 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 17 Jul 2019 04:22:32 +0000
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 16 Jul 2019 12:26:09 +0800
Message-Id: <1563251169-30740-2-git-send-email-zhenzhong.duan@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1563251169-30740-1-git-send-email-zhenzhong.duan@oracle.com>
References: <1563251169-30740-1-git-send-email-zhenzhong.duan@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9320
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907170052
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9320
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907170052
Subject: [Xen-devel] [PATCH v8 5/5] x86/xen: Add "nopv" support for HVM guest
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
Cc: jgross@suse.com, sstabellini@kernel.org, x86@kernel.org,
 Zhenzhong Duan <zhenzhong.duan@oracle.com>, mingo@redhat.com, bp@alien8.de,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UFZIIGd1ZXN0IG5lZWRzIFBWIGV4dGVudGlvbnMgdG8gd29yaywgc28gIm5vcHYiIHBhcmFtZXRl
ciBzaG91bGQgYmUKaWdub3JlZCBmb3IgUFZIIGJ1dCBub3QgZm9yIEhWTSBndWVzdC4KCklmIFBW
SCBndWVzdCBib290cyB1cCB2aWEgdGhlIFhlbi1QVkggYm9vdCBlbnRyeSwgeGVuX3B2aCBpcyBz
ZXQgZWFybHksCndlIGtub3cgaXQncyBQVkggZ3Vlc3QgYW5kIGlnbm9yZSAibm9wdiIgcGFyYW1l
dGVyIGRpcmVjdGx5LgoKSWYgUFZIIGd1ZXN0IGJvb3RzIHVwIHZpYSB0aGUgbm9ybWFsIGJvb3Qg
ZW50cnkgc2FtZSBhcyBIVk0gZ3Vlc3QsIGl0J3MKaGFyZCB0byBkaXN0aW5ndWlzaCBQVkggYW5k
IEhWTSBndWVzdCBhdCB0aGF0IHRpbWUuIEluIHRoaXMgY2FzZSwgd2UKaGF2ZSB0byBwYW5pYyBl
YXJseSBpZiBQVkggaXMgZGV0ZWN0ZWQgYW5kIG5vcHYgaXMgZW5hYmxlZCB0byBhdm9pZCBhCndv
cnNlIHNpdHVhdGlvbiBsYXRlci4KClJlbW92ZSBzdGF0aWMgZnJvbSBib29sX3g4Nl9pbml0X25v
b3AveDg2X29wX2ludF9ub29wIHNvIHRoZXkgY291bGQgYmUKdXNlZCBnbG9iYWxseS4gTW92ZSB4
ZW5fcGxhdGZvcm1faHZtKCkgYWZ0ZXIgeGVuX2h2bV9ndWVzdF9sYXRlX2luaXQoKQp0byBhdm9p
ZCBjb21waWxlIGVycm9yLgoKU2lnbmVkLW9mZi1ieTogWmhlbnpob25nIER1YW4gPHpoZW56aG9u
Zy5kdWFuQG9yYWNsZS5jb20+ClJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9z
dHJvdnNreUBvcmFjbGUuY29tPgpDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpD
YzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogVGhvbWFz
IEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNjOiBJbmdvIE1vbG5hciA8bWluZ29AcmVk
aGF0LmNvbT4KQ2M6IEJvcmlzbGF2IFBldGtvdiA8YnBAYWxpZW44LmRlPgotLS0KIGFyY2gveDg2
L2luY2x1ZGUvYXNtL3g4Nl9pbml0LmggfCAgMiArKwogYXJjaC94ODYva2VybmVsL3g4Nl9pbml0
LmMgICAgICB8ICA0ICsrLS0KIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMgICAgfCA0MyAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2Vk
LCAzOSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS94ODZfaW5pdC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20veDg2X2luaXQu
aAppbmRleCBiODVhN2M1Li5hYzA5MzQxIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS94ODZfaW5pdC5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3g4Nl9pbml0LmgKQEAgLTMw
MSw2ICszMDEsOCBAQCBzdHJ1Y3QgeDg2X2FwaWNfb3BzIHsKIGV4dGVybiB2b2lkIHg4Nl9lYXJs
eV9pbml0X3BsYXRmb3JtX3F1aXJrcyh2b2lkKTsKIGV4dGVybiB2b2lkIHg4Nl9pbml0X25vb3Ao
dm9pZCk7CiBleHRlcm4gdm9pZCB4ODZfaW5pdF91aW50X25vb3AodW5zaWduZWQgaW50IHVudXNl
ZCk7CitleHRlcm4gYm9vbCBib29sX3g4Nl9pbml0X25vb3Aodm9pZCk7CitleHRlcm4gdm9pZCB4
ODZfb3BfaW50X25vb3AoaW50IGNwdSk7CiBleHRlcm4gYm9vbCB4ODZfcG5wYmlvc19kaXNhYmxl
ZCh2b2lkKTsKIAogI2VuZGlmCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwveDg2X2luaXQu
YyBiL2FyY2gveDg2L2tlcm5lbC94ODZfaW5pdC5jCmluZGV4IDUwYTJiNDkuLjFiZWY2ODcgMTAw
NjQ0Ci0tLSBhL2FyY2gveDg2L2tlcm5lbC94ODZfaW5pdC5jCisrKyBiL2FyY2gveDg2L2tlcm5l
bC94ODZfaW5pdC5jCkBAIC0yOSw4ICsyOSw4IEBAIHZvaWQgeDg2X2luaXRfbm9vcCh2b2lkKSB7
IH0KIHZvaWQgX19pbml0IHg4Nl9pbml0X3VpbnRfbm9vcCh1bnNpZ25lZCBpbnQgdW51c2VkKSB7
IH0KIHN0YXRpYyBpbnQgX19pbml0IGlvbW11X2luaXRfbm9vcCh2b2lkKSB7IHJldHVybiAwOyB9
CiBzdGF0aWMgdm9pZCBpb21tdV9zaHV0ZG93bl9ub29wKHZvaWQpIHsgfQotc3RhdGljIGJvb2wg
X19pbml0IGJvb2xfeDg2X2luaXRfbm9vcCh2b2lkKSB7IHJldHVybiBmYWxzZTsgfQotc3RhdGlj
IHZvaWQgeDg2X29wX2ludF9ub29wKGludCBjcHUpIHsgfQorYm9vbCBfX2luaXQgYm9vbF94ODZf
aW5pdF9ub29wKHZvaWQpIHsgcmV0dXJuIGZhbHNlOyB9Cit2b2lkIHg4Nl9vcF9pbnRfbm9vcChp
bnQgY3B1KSB7IH0KIAogLyoKICAqIFRoZSBwbGF0Zm9ybSBzZXR1cCBmdW5jdGlvbnMgYXJlIHBy
ZXNldCB3aXRoIHRoZSBkZWZhdWx0IGZ1bmN0aW9ucwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVu
L2VubGlnaHRlbl9odm0uYyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMKaW5kZXggYjY3
MTk4My4uZTEzOGY3ZCAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0uYwor
KysgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jCkBAIC0yMzEsMTQgKzIzMSw2IEBAIGJv
b2wgX19pbml0IHhlbl9odm1fbmVlZF9sYXBpYyh2b2lkKQogCXJldHVybiB0cnVlOwogfQogCi1z
dGF0aWMgdWludDMyX3QgX19pbml0IHhlbl9wbGF0Zm9ybV9odm0odm9pZCkKLXsKLQlpZiAoeGVu
X3B2X2RvbWFpbigpKQotCQlyZXR1cm4gMDsKLQotCXJldHVybiB4ZW5fY3B1aWRfYmFzZSgpOwot
fQotCiBzdGF0aWMgX19pbml0IHZvaWQgeGVuX2h2bV9ndWVzdF9sYXRlX2luaXQodm9pZCkKIHsK
ICNpZmRlZiBDT05GSUdfWEVOX1BWSApAQCAtMjUwLDYgKzI0Miw5IEBAIHN0YXRpYyBfX2luaXQg
dm9pZCB4ZW5faHZtX2d1ZXN0X2xhdGVfaW5pdCh2b2lkKQogCS8qIFBWSCBkZXRlY3RlZC4gKi8K
IAl4ZW5fcHZoID0gdHJ1ZTsKIAorCWlmIChub3B2KQorCQlwYW5pYygiXCJub3B2XCIgYW5kIFwi
eGVuX25vcHZcIiBwYXJhbWV0ZXJzIGFyZSB1bnN1cHBvcnRlZCBpbiBQVkggZ3Vlc3QuIik7CisK
IAkvKiBNYWtlIHN1cmUgd2UgZG9uJ3QgZmFsbCBiYWNrIHRvIChkZWZhdWx0KSBBQ1BJX0lSUV9N
T0RFTF9QSUMuICovCiAJaWYgKCFucl9pb2FwaWNzICYmIGFjcGlfaXJxX21vZGVsID09IEFDUElf
SVJRX01PREVMX1BJQykKIAkJYWNwaV9pcnFfbW9kZWwgPSBBQ1BJX0lSUV9NT0RFTF9QTEFURk9S
TTsKQEAgLTI1OSw2ICsyNTQsMzcgQEAgc3RhdGljIF9faW5pdCB2b2lkIHhlbl9odm1fZ3Vlc3Rf
bGF0ZV9pbml0KHZvaWQpCiAjZW5kaWYKIH0KIAorc3RhdGljIHVpbnQzMl90IF9faW5pdCB4ZW5f
cGxhdGZvcm1faHZtKHZvaWQpCit7CisJdWludDMyX3QgeGVuX2RvbWFpbiA9IHhlbl9jcHVpZF9i
YXNlKCk7CisJc3RydWN0IHg4Nl9oeXBlcl9pbml0ICpoID0gJng4Nl9oeXBlcl94ZW5faHZtLmlu
aXQ7CisKKwlpZiAoeGVuX3B2X2RvbWFpbigpKQorCQlyZXR1cm4gMDsKKworCWlmICh4ZW5fcHZo
X2RvbWFpbigpICYmIG5vcHYpIHsKKwkJLyogR3Vlc3QgYm9vdGluZyB2aWEgdGhlIFhlbi1QVkgg
Ym9vdCBlbnRyeSBnb2VzIGhlcmUgKi8KKwkJcHJfaW5mbygiXCJub3B2XCIgcGFyYW1ldGVyIGlz
IGlnbm9yZWQgaW4gUFZIIGd1ZXN0XG4iKTsKKwkJbm9wdiA9IGZhbHNlOworCX0gZWxzZSBpZiAo
bm9wdiAmJiB4ZW5fZG9tYWluKSB7CisJCS8qCisJCSAqIEd1ZXN0IGJvb3RpbmcgdmlhIG5vcm1h
bCBib290IGVudHJ5IChsaWtlIHZpYSBncnViMikgZ29lcworCQkgKiBoZXJlLgorCQkgKgorCQkg
KiBVc2UgaW50ZXJmYWNlIGZ1bmN0aW9ucyBmb3IgYmFyZSBoYXJkd2FyZSBpZiBub3B2LAorCQkg
KiB4ZW5faHZtX2d1ZXN0X2xhdGVfaW5pdCBpcyBhbiBleGNlcHRpb24gYXMgd2UgbmVlZCB0bwor
CQkgKiBkZXRlY3QgUFZIIGFuZCBwYW5pYyB0aGVyZS4KKwkJICovCisJCWgtPmluaXRfcGxhdGZv
cm0gPSB4ODZfaW5pdF9ub29wOworCQloLT54MmFwaWNfYXZhaWxhYmxlID0gYm9vbF94ODZfaW5p
dF9ub29wOworCQloLT5pbml0X21lbV9tYXBwaW5nID0geDg2X2luaXRfbm9vcDsKKwkJaC0+aW5p
dF9hZnRlcl9ib290bWVtID0geDg2X2luaXRfbm9vcDsKKwkJaC0+Z3Vlc3RfbGF0ZV9pbml0ID0g
eGVuX2h2bV9ndWVzdF9sYXRlX2luaXQ7CisJCXg4Nl9oeXBlcl94ZW5faHZtLnJ1bnRpbWUucGlu
X3ZjcHUgPSB4ODZfb3BfaW50X25vb3A7CisJfQorCXJldHVybiB4ZW5fZG9tYWluOworfQorCiBz
dHJ1Y3QgaHlwZXJ2aXNvcl94ODYgeDg2X2h5cGVyX3hlbl9odm0gX19pbml0ZGF0YSA9IHsKIAku
bmFtZSAgICAgICAgICAgICAgICAgICA9ICJYZW4gSFZNIiwKIAkuZGV0ZWN0ICAgICAgICAgICAg
ICAgICA9IHhlbl9wbGF0Zm9ybV9odm0sCkBAIC0yNjgsNCArMjk0LDUgQEAgc3RydWN0IGh5cGVy
dmlzb3JfeDg2IHg4Nl9oeXBlcl94ZW5faHZtIF9faW5pdGRhdGEgPSB7CiAJLmluaXQuaW5pdF9t
ZW1fbWFwcGluZwk9IHhlbl9odm1faW5pdF9tZW1fbWFwcGluZywKIAkuaW5pdC5ndWVzdF9sYXRl
X2luaXQJPSB4ZW5faHZtX2d1ZXN0X2xhdGVfaW5pdCwKIAkucnVudGltZS5waW5fdmNwdSAgICAg
ICA9IHhlbl9waW5fdmNwdSwKKwkuaWdub3JlX25vcHYgICAgICAgICAgICA9IHRydWUsCiB9Owot
LSAKMS44LjMuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
