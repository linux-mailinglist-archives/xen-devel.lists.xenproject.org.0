Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 999CF66C27
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2019 14:08:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hluJt-0003GS-Ra; Fri, 12 Jul 2019 12:06:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vyeD=VJ=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hluJr-0003Fv-T0
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2019 12:06:31 +0000
X-Inumbo-ID: 7bae9fcc-a49d-11e9-a336-3b0491518641
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7bae9fcc-a49d-11e9-a336-3b0491518641;
 Fri, 12 Jul 2019 12:06:30 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6CC3rCI193467;
 Fri, 12 Jul 2019 12:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=GnDNkS4LsM8yVEL9aAyB/fPBX18ezyafmslh/QcfNf0=;
 b=Eu7o9s7kk21lH33SUye2XpeJt4sEtbKJ/fXDLGZvLgaRbZge6oJ3bEgOOEt0fc0KwLCa
 Bz9JL9t4fRXlU2IbRT0p4c4oSLzLN+5fFXoz61lT8Qx/hrgnA7q9LOEL2jQwUf3K7lMJ
 9Cuu968ASOjqygPbg9W/wuAkngR+mguvoG+JcRkrdhoFKCU+1cC04YlIh5uFIgarmOFI
 lqcvWxfkP/WlDg7W1QvhQzvjD6JFwUi7gLXqE4KznuK5W46jDcznExOuabN0qWeLhZ05
 2AWK5Z59w/P6XVlSwlwyhGvO5upRKuHlMVAvUHvhkNnSL78p+WD7/rTFTu1s8mTGNZRS dg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2tjk2u5ase-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 12:06:14 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6CC3SwE048154;
 Fri, 12 Jul 2019 12:04:14 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2tn1j23ypk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 12:04:14 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x6CC4DoP015905;
 Fri, 12 Jul 2019 12:04:13 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 12 Jul 2019 04:58:42 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 11 Jul 2019 20:02:12 +0800
Message-Id: <1562846532-32152-6-git-send-email-zhenzhong.duan@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1562846532-32152-1-git-send-email-zhenzhong.duan@oracle.com>
References: <1562846532-32152-1-git-send-email-zhenzhong.duan@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9315
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907120132
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9315
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907120132
Subject: [Xen-devel] [PATCH v7 5/5] x86/xen: Add "nopv" support for HVM guest
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
Cc: jgross@suse.com, sstabellini@kernel.org,
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
cnNlIHNpdHVhdGlvbiBsYXRlci4KCk1vdmUgeGVuX3BsYXRmb3JtX2h2bSgpIGFmdGVyIHhlbl9o
dm1fZ3Vlc3RfbGF0ZV9pbml0KCkgdG8gYXZvaWQgY29tcGlsZQplcnJvci4KClNpZ25lZC1vZmYt
Ynk6IFpoZW56aG9uZyBEdWFuIDx6aGVuemhvbmcuZHVhbkBvcmFjbGUuY29tPgpDYzogQm9yaXMg
T3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KQ2M6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4KQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgpDYzogSW5n
byBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+CkNjOiBCb3Jpc2xhdiBQZXRrb3YgPGJwQGFsaWVu
OC5kZT4KLS0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS94ODZfaW5pdC5oIHwgIDIgKysKIGFyY2gv
eDg2L2tlcm5lbC94ODZfaW5pdC5jICAgICAgfCAgNCArKy0tCiBhcmNoL3g4Ni94ZW4vZW5saWdo
dGVuX2h2bS5jICAgIHwgNDUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0KIDMgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20veDg2X2luaXQuaCBiL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL3g4Nl9pbml0LmgKaW5kZXggYjg1YTdjNS4uYWMwOTM0MSAxMDA2NDQKLS0tIGEv
YXJjaC94ODYvaW5jbHVkZS9hc20veDg2X2luaXQuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS94ODZfaW5pdC5oCkBAIC0zMDEsNiArMzAxLDggQEAgc3RydWN0IHg4Nl9hcGljX29wcyB7CiBl
eHRlcm4gdm9pZCB4ODZfZWFybHlfaW5pdF9wbGF0Zm9ybV9xdWlya3Modm9pZCk7CiBleHRlcm4g
dm9pZCB4ODZfaW5pdF9ub29wKHZvaWQpOwogZXh0ZXJuIHZvaWQgeDg2X2luaXRfdWludF9ub29w
KHVuc2lnbmVkIGludCB1bnVzZWQpOworZXh0ZXJuIGJvb2wgYm9vbF94ODZfaW5pdF9ub29wKHZv
aWQpOworZXh0ZXJuIHZvaWQgeDg2X29wX2ludF9ub29wKGludCBjcHUpOwogZXh0ZXJuIGJvb2wg
eDg2X3BucGJpb3NfZGlzYWJsZWQodm9pZCk7CiAKICNlbmRpZgpkaWZmIC0tZ2l0IGEvYXJjaC94
ODYva2VybmVsL3g4Nl9pbml0LmMgYi9hcmNoL3g4Ni9rZXJuZWwveDg2X2luaXQuYwppbmRleCA1
MGEyYjQ5Li4xYmVmNjg3IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rZXJuZWwveDg2X2luaXQuYwor
KysgYi9hcmNoL3g4Ni9rZXJuZWwveDg2X2luaXQuYwpAQCAtMjksOCArMjksOCBAQCB2b2lkIHg4
Nl9pbml0X25vb3Aodm9pZCkgeyB9CiB2b2lkIF9faW5pdCB4ODZfaW5pdF91aW50X25vb3AodW5z
aWduZWQgaW50IHVudXNlZCkgeyB9CiBzdGF0aWMgaW50IF9faW5pdCBpb21tdV9pbml0X25vb3Ao
dm9pZCkgeyByZXR1cm4gMDsgfQogc3RhdGljIHZvaWQgaW9tbXVfc2h1dGRvd25fbm9vcCh2b2lk
KSB7IH0KLXN0YXRpYyBib29sIF9faW5pdCBib29sX3g4Nl9pbml0X25vb3Aodm9pZCkgeyByZXR1
cm4gZmFsc2U7IH0KLXN0YXRpYyB2b2lkIHg4Nl9vcF9pbnRfbm9vcChpbnQgY3B1KSB7IH0KK2Jv
b2wgX19pbml0IGJvb2xfeDg2X2luaXRfbm9vcCh2b2lkKSB7IHJldHVybiBmYWxzZTsgfQordm9p
ZCB4ODZfb3BfaW50X25vb3AoaW50IGNwdSkgeyB9CiAKIC8qCiAgKiBUaGUgcGxhdGZvcm0gc2V0
dXAgZnVuY3Rpb25zIGFyZSBwcmVzZXQgd2l0aCB0aGUgZGVmYXVsdCBmdW5jdGlvbnMKZGlmZiAt
LWdpdCBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMgYi9hcmNoL3g4Ni94ZW4vZW5saWdo
dGVuX2h2bS5jCmluZGV4IDE3NTZjZjcuLmUxMzhmN2QgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hl
bi9lbmxpZ2h0ZW5faHZtLmMKKysrIGIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0uYwpAQCAt
MjMxLDE0ICsyMzEsNiBAQCBib29sIF9faW5pdCB4ZW5faHZtX25lZWRfbGFwaWModm9pZCkKIAly
ZXR1cm4gdHJ1ZTsKIH0KIAotc3RhdGljIHVpbnQzMl90IF9faW5pdCB4ZW5fcGxhdGZvcm1faHZt
KHZvaWQpCi17Ci0JaWYgKHhlbl9wdl9kb21haW4oKSkKLQkJcmV0dXJuIDA7Ci0KLQlyZXR1cm4g
eGVuX2NwdWlkX2Jhc2UoKTsKLX0KLQogc3RhdGljIF9faW5pdCB2b2lkIHhlbl9odm1fZ3Vlc3Rf
bGF0ZV9pbml0KHZvaWQpCiB7CiAjaWZkZWYgQ09ORklHX1hFTl9QVkgKQEAgLTI1MCw2ICsyNDIs
OSBAQCBzdGF0aWMgX19pbml0IHZvaWQgeGVuX2h2bV9ndWVzdF9sYXRlX2luaXQodm9pZCkKIAkv
KiBQVkggZGV0ZWN0ZWQuICovCiAJeGVuX3B2aCA9IHRydWU7CiAKKwlpZiAobm9wdikKKwkJcGFu
aWMoIlwibm9wdlwiIGFuZCBcInhlbl9ub3B2XCIgcGFyYW1ldGVycyBhcmUgdW5zdXBwb3J0ZWQg
aW4gUFZIIGd1ZXN0LiIpOworCiAJLyogTWFrZSBzdXJlIHdlIGRvbid0IGZhbGwgYmFjayB0byAo
ZGVmYXVsdCkgQUNQSV9JUlFfTU9ERUxfUElDLiAqLwogCWlmICghbnJfaW9hcGljcyAmJiBhY3Bp
X2lycV9tb2RlbCA9PSBBQ1BJX0lSUV9NT0RFTF9QSUMpCiAJCWFjcGlfaXJxX21vZGVsID0gQUNQ
SV9JUlFfTU9ERUxfUExBVEZPUk07CkBAIC0yNTksNyArMjU0LDM4IEBAIHN0YXRpYyBfX2luaXQg
dm9pZCB4ZW5faHZtX2d1ZXN0X2xhdGVfaW5pdCh2b2lkKQogI2VuZGlmCiB9CiAKLWNvbnN0IF9f
aW5pdGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX3g4NiB4ODZfaHlwZXJfeGVuX2h2bSA9IHsKK3N0
YXRpYyB1aW50MzJfdCBfX2luaXQgeGVuX3BsYXRmb3JtX2h2bSh2b2lkKQoreworCXVpbnQzMl90
IHhlbl9kb21haW4gPSB4ZW5fY3B1aWRfYmFzZSgpOworCXN0cnVjdCB4ODZfaHlwZXJfaW5pdCAq
aCA9ICZ4ODZfaHlwZXJfeGVuX2h2bS5pbml0OworCisJaWYgKHhlbl9wdl9kb21haW4oKSkKKwkJ
cmV0dXJuIDA7CisKKwlpZiAoeGVuX3B2aF9kb21haW4oKSAmJiBub3B2KSB7CisJCS8qIEd1ZXN0
IGJvb3RpbmcgdmlhIHRoZSBYZW4tUFZIIGJvb3QgZW50cnkgZ29lcyBoZXJlICovCisJCXByX2lu
Zm8oIlwibm9wdlwiIHBhcmFtZXRlciBpcyBpZ25vcmVkIGluIFBWSCBndWVzdFxuIik7CisJCW5v
cHYgPSBmYWxzZTsKKwl9IGVsc2UgaWYgKG5vcHYgJiYgeGVuX2RvbWFpbikgeworCQkvKgorCQkg
KiBHdWVzdCBib290aW5nIHZpYSBub3JtYWwgYm9vdCBlbnRyeSAobGlrZSB2aWEgZ3J1YjIpIGdv
ZXMKKwkJICogaGVyZS4KKwkJICoKKwkJICogVXNlIGludGVyZmFjZSBmdW5jdGlvbnMgZm9yIGJh
cmUgaGFyZHdhcmUgaWYgbm9wdiwKKwkJICogeGVuX2h2bV9ndWVzdF9sYXRlX2luaXQgaXMgYW4g
ZXhjZXB0aW9uIGFzIHdlIG5lZWQgdG8KKwkJICogZGV0ZWN0IFBWSCBhbmQgcGFuaWMgdGhlcmUu
CisJCSAqLworCQloLT5pbml0X3BsYXRmb3JtID0geDg2X2luaXRfbm9vcDsKKwkJaC0+eDJhcGlj
X2F2YWlsYWJsZSA9IGJvb2xfeDg2X2luaXRfbm9vcDsKKwkJaC0+aW5pdF9tZW1fbWFwcGluZyA9
IHg4Nl9pbml0X25vb3A7CisJCWgtPmluaXRfYWZ0ZXJfYm9vdG1lbSA9IHg4Nl9pbml0X25vb3A7
CisJCWgtPmd1ZXN0X2xhdGVfaW5pdCA9IHhlbl9odm1fZ3Vlc3RfbGF0ZV9pbml0OworCQl4ODZf
aHlwZXJfeGVuX2h2bS5ydW50aW1lLnBpbl92Y3B1ID0geDg2X29wX2ludF9ub29wOworCX0KKwly
ZXR1cm4geGVuX2RvbWFpbjsKK30KKworc3RydWN0IGh5cGVydmlzb3JfeDg2IHg4Nl9oeXBlcl94
ZW5faHZtIF9faW5pdGRhdGEgPSB7CiAJLm5hbWUgICAgICAgICAgICAgICAgICAgPSAiWGVuIEhW
TSIsCiAJLmRldGVjdCAgICAgICAgICAgICAgICAgPSB4ZW5fcGxhdGZvcm1faHZtLAogCS50eXBl
CQkJPSBYODZfSFlQRVJfWEVOX0hWTSwKQEAgLTI2OCw0ICsyOTQsNSBAQCBzdGF0aWMgX19pbml0
IHZvaWQgeGVuX2h2bV9ndWVzdF9sYXRlX2luaXQodm9pZCkKIAkuaW5pdC5pbml0X21lbV9tYXBw
aW5nCT0geGVuX2h2bV9pbml0X21lbV9tYXBwaW5nLAogCS5pbml0Lmd1ZXN0X2xhdGVfaW5pdAk9
IHhlbl9odm1fZ3Vlc3RfbGF0ZV9pbml0LAogCS5ydW50aW1lLnBpbl92Y3B1ICAgICAgID0geGVu
X3Bpbl92Y3B1LAorCS5pZ25vcmVfbm9wdiAgICAgICAgICAgID0gdHJ1ZSwKIH07Ci0tIAoxLjgu
My4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
