Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E106C54E3A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 14:04:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfk7f-0005lu-QD; Tue, 25 Jun 2019 12:00:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8O1u=UY=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hfk7e-0005lY-7m
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 12:00:26 +0000
X-Inumbo-ID: cf745274-9740-11e9-8057-c7c0eb1ec826
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf745274-9740-11e9-8057-c7c0eb1ec826;
 Tue, 25 Jun 2019 12:00:22 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5PBwTDs034898;
 Tue, 25 Jun 2019 12:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=6klKICAt+a+KHWaEwnSq/964CSEq5H1pgE5tT5g7vdQ=;
 b=YdQfxpBKwEfWxikYjMknr/V/zwveF/HaI/kF2hIg4FLnuMIlt9gtV0D0vPr3sgCAHo+I
 PPlzin4Ws8tcfFdRucHkrtUxRqAbrOMwRxBSl7Tf9CASrpcgBrwSElGlqUDWvNwsJsZd
 RzdkyB49SOrB7oowtH7mx2hTzrEzZXQglGMJbEf6t+on4ZhwrfvdK88wmzYxvCb8FeOc
 7Bab0+JA4YxqNQTUuTke2lo2j7O4yg38pvqO2n1CeOIvOZxtAE2cWiOYG/MelfmGze43
 5X/GLj64bvgPZjkEZsRtsze5ia3ne1x9SK41C9CL1xg+tI/P0/EP9urZJboNkzcDU6YF pQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2t9cyqbubg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 12:00:03 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5PBwhAr130232;
 Tue, 25 Jun 2019 12:00:03 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2t9p6u515b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 12:00:02 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5PC01Tb012106;
 Tue, 25 Jun 2019 12:00:01 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 25 Jun 2019 05:00:01 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 24 Jun 2019 20:02:56 +0800
Message-Id: <1561377779-28036-5-git-send-email-zhenzhong.duan@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1561377779-28036-1-git-send-email-zhenzhong.duan@oracle.com>
References: <1561377779-28036-1-git-send-email-zhenzhong.duan@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9298
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906250097
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9298
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906250097
Subject: [Xen-devel] [PATCH v2 4/7] Revert "xen: Introduce 'xen_nopv' to
 disable PV extensions for HVM guests."
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
Cc: jgross@suse.com, sstabellini@kernel.org, peterz@infradead.org,
 Zhenzhong Duan <zhenzhong.duan@oracle.com>, mingo@kernel.org,
 Ingo Molnar <mingo@redhat.com>, bp@alien8.de, hpa@zytor.com,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 srinivas.eeda@oracle.com, tglx@linutronix.de
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyByZXZlcnRzIGNvbW1pdCA4ZDY5M2I5MTFiYjljNTcwMDljMjRjYjE3NzJkMjA1Yjg0Yzc5
ODVjLgoKSW5zdGVhZCB3ZSB1c2UgYW4gdW5pZmllZCBwYXJhbWV0ZXIgJ25vcHYnIGZvciBhbGwg
dGhlIGh5cGVydmlzb3IKcGxhdGZvcm1zLgoKU2lnbmVkLW9mZi1ieTogWmhlbnpob25nIER1YW4g
PHpoZW56aG9uZy5kdWFuQG9yYWNsZS5jb20+CkNjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9z
dHJvdnNreUBvcmFjbGUuY29tPgpDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpD
YzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogVGhvbWFz
IEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNjOiBJbmdvIE1vbG5hciA8bWluZ29AcmVk
aGF0LmNvbT4KQ2M6IEJvcmlzbGF2IFBldGtvdiA8YnBAYWxpZW44LmRlPgpDYzogeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCi0tLQogRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJu
ZWwtcGFyYW1ldGVycy50eHQgfCAgNCAtLS0tCiBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5j
ICAgICAgICAgICAgICAgICAgICB8IDEyICstLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgYi9Eb2N1bWVudGF0aW9uL2FkbWlu
LWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAppbmRleCAyMWUwOGFmLi5kNWMzZGNjIDEwMDY0
NAotLS0gYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAor
KysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dApAQCAt
NTI1MSwxMCArNTI1MSw2IEBACiAJCQlEaXNhYmxlcyB0aGUgdGlja2V0bG9jayBzbG93cGF0aCB1
c2luZyBYZW4gUFYKIAkJCW9wdGltaXphdGlvbnMuCiAKLQl4ZW5fbm9wdglbWDg2XQotCQkJRGlz
YWJsZXMgdGhlIFBWIG9wdGltaXphdGlvbnMgZm9yY2luZyB0aGUgSFZNIGd1ZXN0IHRvCi0JCQly
dW4gYXMgZ2VuZXJpYyBIVk0gZ3Vlc3Qgd2l0aCBubyBQViBkcml2ZXJzLgotCiAJeGVuX3NjcnVi
X3BhZ2VzPQlbWEVOXQogCQkJQm9vbGVhbiBvcHRpb24gdG8gY29udHJvbCBzY3J1YmJpbmcgcGFn
ZXMgYmVmb3JlIGdpdmluZyB0aGVtIGJhY2sKIAkJCXRvIFhlbiwgZm9yIHVzZSBieSBvdGhlciBk
b21haW5zLiBDYW4gYmUgYWxzbyBjaGFuZ2VkIGF0IHJ1bnRpbWUKZGlmZiAtLWdpdCBhL2FyY2gv
eDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jCmlu
ZGV4IGFjNDk0M2MuLjdmY2I0ZWEgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5f
aHZtLmMKKysrIGIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0uYwpAQCAtMjEwLDE4ICsyMTAs
OCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgeGVuX2h2bV9ndWVzdF9pbml0KHZvaWQpCiAjZW5kaWYK
IH0KIAotc3RhdGljIGJvb2wgeGVuX25vcHY7Ci1zdGF0aWMgX19pbml0IGludCB4ZW5fcGFyc2Vf
bm9wdihjaGFyICphcmcpCi17Ci0gICAgICAgeGVuX25vcHYgPSB0cnVlOwotICAgICAgIHJldHVy
biAwOwotfQotZWFybHlfcGFyYW0oInhlbl9ub3B2IiwgeGVuX3BhcnNlX25vcHYpOwotCiBib29s
IF9faW5pdCB4ZW5faHZtX25lZWRfbGFwaWModm9pZCkKIHsKLQlpZiAoeGVuX25vcHYpCi0JCXJl
dHVybiBmYWxzZTsKIAlpZiAoeGVuX3B2X2RvbWFpbigpKQogCQlyZXR1cm4gZmFsc2U7CiAJaWYg
KCF4ZW5faHZtX2RvbWFpbigpKQpAQCAtMjMzLDcgKzIyMyw3IEBAIGJvb2wgX19pbml0IHhlbl9o
dm1fbmVlZF9sYXBpYyh2b2lkKQogCiBzdGF0aWMgdWludDMyX3QgX19pbml0IHhlbl9wbGF0Zm9y
bV9odm0odm9pZCkKIHsKLQlpZiAoeGVuX3B2X2RvbWFpbigpIHx8IHhlbl9ub3B2KQorCWlmICh4
ZW5fcHZfZG9tYWluKCkpCiAJCXJldHVybiAwOwogCiAJcmV0dXJuIHhlbl9jcHVpZF9iYXNlKCk7
Ci0tIAoxLjguMy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
