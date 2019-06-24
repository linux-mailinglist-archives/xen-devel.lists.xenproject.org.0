Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA4F54E3C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 14:04:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfk7e-0005lT-6r; Tue, 25 Jun 2019 12:00:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8O1u=UY=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hfk7c-0005lO-PA
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 12:00:24 +0000
X-Inumbo-ID: cf6db2a6-9740-11e9-8980-bc764e045a96
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cf6db2a6-9740-11e9-8980-bc764e045a96;
 Tue, 25 Jun 2019 12:00:22 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5PBwx2x027209;
 Tue, 25 Jun 2019 12:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=IfwgKDnZi80buyiIPP86pHwWHIBnfojOW5Jty8tpEL8=;
 b=LbeNXZ028pNRVclBDTAhimcCvZP0x6jpoQoSNq3CtxBAwvZOqzDV6x2tqbj0gEguQZiW
 TZ3iK8fRJtTi6Er1ZDuJlbAt/uUpLKR1S/E3q2U2ReujVxUMTDTEEtr68mBnXNCILIfy
 LTdi8XWoSvfcnQ/cARthiW/9+Z8+80ouMvbmJQRS3RvpUirhVfZAeTqKnO0U6sQmZxLk
 5TH7T+dWN5VYdNOJ9Dtg4/Zz4uJulIl3XqgHMAoojpTYon8+QXBLi8WRAPm/bCHZeWFI
 CZ8p9y6vfsmhbxcW/hgvhZgNwqOlOXBa0/LSKFrV81NfT+UPbI6VJuejdo/MmDPUnw5n iA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2t9brt3x5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 12:00:00 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5PBxPw1002189;
 Tue, 25 Jun 2019 12:00:00 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2tat7c6q7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 12:00:00 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5PBxw0s012082;
 Tue, 25 Jun 2019 11:59:58 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 25 Jun 2019 04:59:57 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 24 Jun 2019 20:02:55 +0800
Message-Id: <1561377779-28036-4-git-send-email-zhenzhong.duan@oracle.com>
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
Subject: [Xen-devel] [PATCH v2 3/7] x86: Add nopv parameter to disable PV
 extensions
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
 Jan Kiszka <jan.kiszka@siemens.com>,
 Zhenzhong Duan <zhenzhong.duan@oracle.com>, mingo@kernel.org,
 Ingo Molnar <mingo@redhat.com>, bp@alien8.de, hpa@zytor.com,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 srinivas.eeda@oracle.com, tglx@linutronix.de
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gdmlydHVhbGl6YXRpb24gZW52aXJvbm1lbnQsIFBWIGV4dGVuc2lvbnMgKGRyaXZlcnMsIGlu
dGVycnVwdHMsCnRpbWVycywgZXRjKSBhcmUgZW5hYmxlZCBpbiB0aGUgbWFqb3JpdHkgb2YgdXNl
IGNhc2VzIHdoaWNoIGlzIHRoZQpiZXN0IG9wdGlvbi4KCkhvd2V2ZXIsIGluIHNvbWUgY2FzZXMg
KGtleGVjIG5vdCBmdWxseSB3b3JraW5nLCBiZW5jaG1hcmtpbmcpCndlIHdhbnQgdG8gZGlzYWJs
ZSBQViBleHRlbnNpb25zLiBBcyBzdWNoIGludHJvZHVjZSB0aGUKJ25vcHYnIHBhcmFtZXRlciB0
aGF0IHdpbGwgZG8gaXQuCgpUaGVyZSBhcmUgZ3Vlc3QgdHlwZXMgd2hpY2gganVzdCB3b24ndCB3
b3JrIHdpdGhvdXQgUFYgZXh0ZW5zaW9ucywKbGlrZSBYZW4gUFYsIFhlbiBQVkggYW5kIGphaWxo
b3VzZS4gYWRkIGEgImlnbm9yZV9ub3B2IiBtZW1iZXIgdG8Kc3RydWN0IGh5cGVydmlzb3JfeDg2
IHNldCB0byB0cnVlIGZvciB0aG9zZSBndWVzdCB0eXBlcyBhbmQgY2FsbAp0aGUgZGV0ZWN0IGZ1
bmN0aW9ucyBvbmx5IGlmIG5vcHYgaXMgZmFsc2Ugb3IgaWdub3JlX25vcHYgaXMgdHJ1ZS4KClRo
ZXJlIGlzIGFscmVhZHkgJ3hlbl9ub3B2JyBwYXJhbWV0ZXIgZm9yIFhFTiBwbGF0Zm9ybSBidXQg
bm90IGZvcgpvdGhlcnMuICd4ZW5fbm9wdicgY2FuIHRoZW4gYmUgcmVtb3ZlZCB3aXRoIHRoaXMg
Y2hhbmdlLgoKU3VnZ2VzdGVkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+ClNp
Z25lZC1vZmYtYnk6IFpoZW56aG9uZyBEdWFuIDx6aGVuemhvbmcuZHVhbkBvcmFjbGUuY29tPgpD
YzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNjOiBJbmdvIE1vbG5hciA8
bWluZ29AcmVkaGF0LmNvbT4KQ2M6IEJvcmlzbGF2IFBldGtvdiA8YnBAYWxpZW44LmRlPgpDYzog
SmFuIEtpc3prYSA8amFuLmtpc3prYUBzaWVtZW5zLmNvbT4KQ2M6IEJvcmlzIE9zdHJvdnNreSA8
Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKLS0t
CiBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCB8ICA1ICsr
KysrCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9oeXBlcnZpc29yLmggICAgICAgICAgICAgICB8ICAz
ICsrKwogYXJjaC94ODYva2VybmVsL2NwdS9oeXBlcnZpc29yLmMgICAgICAgICAgICAgICAgfCAx
MSArKysrKysrKysrKwogYXJjaC94ODYva2VybmVsL2phaWxob3VzZS5jICAgICAgICAgICAgICAg
ICAgICAgfCAgMSArCiBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMgICAgICAgICAgICAgICAg
ICAgICB8ICAxICsKIDUgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0IGIvRG9j
dW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKaW5kZXggMTM4ZjY2
Ni4uMjFlMDhhZiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwt
cGFyYW1ldGVycy50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFy
YW1ldGVycy50eHQKQEAgLTUyNjgsNiArNTI2OCwxMSBAQAogCQkJaW1wcm92ZSB0aW1lciByZXNv
bHV0aW9uIGF0IHRoZSBleHBlbnNlIG9mIHByb2Nlc3NpbmcKIAkJCW1vcmUgdGltZXIgaW50ZXJy
dXB0cy4KIAorCW5vcHY9CQlbWDg2LFhFTixLVk0sSFlQRVJfVixWTVdBUkVdCisJCQlEaXNhYmxl
cyB0aGUgUFYgb3B0aW1pemF0aW9ucyBmb3JjaW5nIHRoZSBndWVzdCB0byBydW4KKwkJCWFzIGdl
bmVyaWMgZ3Vlc3Qgd2l0aCBubyBQViBkcml2ZXJzLiBDdXJyZW50bHkgc3VwcG9ydAorCQkJWEVO
IEhWTSwgS1ZNLCBIWVBFUl9WIGFuZCBWTVdBUkUgZ3Vlc3QuCisKIAl4aXJjMnBzX2NzPQlbTkVU
LFBDTUNJQV0KIAkJCUZvcm1hdDoKIAkJCTxpcnE+LDxpcnFfbWFzaz4sPGlvPiw8ZnVsbF9kdXBs
ZXg+LDxkb19zb3VuZD4sPGxvY2t1cF9oYWNrPlssPGlycTI+Wyw8aXJxMz5bLDxpcnE0Pl1dXQpk
aWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vaHlwZXJ2aXNvci5oIGIvYXJjaC94ODYv
aW5jbHVkZS9hc20vaHlwZXJ2aXNvci5oCmluZGV4IDhjNWFhYmEuLmQ3NWQyZWEgMTAwNjQ0Ci0t
LSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2h5cGVydmlzb3IuaAorKysgYi9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS9oeXBlcnZpc29yLmgKQEAgLTUyLDYgKzUyLDkgQEAgc3RydWN0IGh5cGVydmlzb3Jf
eDg2IHsKIAogCS8qIHJ1bnRpbWUgY2FsbGJhY2tzICovCiAJc3RydWN0IHg4Nl9oeXBlcl9ydW50
aW1lIHJ1bnRpbWU7CisKKwkvKiBpZ25vcmUgbm9wdiBwYXJhbWV0ZXIgKi8KKwlib29sIGlnbm9y
ZV9ub3B2OwogfTsKIAogZXh0ZXJuIGVudW0geDg2X2h5cGVydmlzb3JfdHlwZSB4ODZfaHlwZXJf
dHlwZTsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9jcHUvaHlwZXJ2aXNvci5jIGIvYXJj
aC94ODYva2VybmVsL2NwdS9oeXBlcnZpc29yLmMKaW5kZXggNDc5Y2E0Ny4uMzM3ZmYwNyAxMDA2
NDQKLS0tIGEvYXJjaC94ODYva2VybmVsL2NwdS9oeXBlcnZpc29yLmMKKysrIGIvYXJjaC94ODYv
a2VybmVsL2NwdS9oeXBlcnZpc29yLmMKQEAgLTU0LDYgKzU0LDE0IEBACiBlbnVtIHg4Nl9oeXBl
cnZpc29yX3R5cGUgeDg2X2h5cGVyX3R5cGU7CiBFWFBPUlRfU1lNQk9MKHg4Nl9oeXBlcl90eXBl
KTsKIAorYm9vbCBfX2luaXRkYXRhIG5vcHY7CitzdGF0aWMgX19pbml0IGludCBwYXJzZV9ub3B2
KGNoYXIgKmFyZykKK3sKKwlub3B2ID0gdHJ1ZTsKKwlyZXR1cm4gMDsKK30KK2Vhcmx5X3BhcmFt
KCJub3B2IiwgcGFyc2Vfbm9wdik7CisKIHN0YXRpYyBpbmxpbmUgY29uc3Qgc3RydWN0IGh5cGVy
dmlzb3JfeDg2ICogX19pbml0CiBkZXRlY3RfaHlwZXJ2aXNvcl92ZW5kb3Iodm9pZCkKIHsKQEAg
LTYxLDYgKzY5LDkgQEAKIAl1aW50MzJfdCBwcmksIG1heF9wcmkgPSAwOwogCiAJZm9yIChwID0g
aHlwZXJ2aXNvcnM7IHAgPCBoeXBlcnZpc29ycyArIEFSUkFZX1NJWkUoaHlwZXJ2aXNvcnMpOyBw
KyspIHsKKwkJaWYgKHVubGlrZWx5KG5vcHYpICYmICEoKnApLT5pZ25vcmVfbm9wdikKKwkJCWNv
bnRpbnVlOworCiAJCXByaSA9ICgqcCktPmRldGVjdCgpOwogCQlpZiAocHJpID4gbWF4X3ByaSkg
ewogCQkJbWF4X3ByaSA9IHByaTsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9qYWlsaG91
c2UuYyBiL2FyY2gveDg2L2tlcm5lbC9qYWlsaG91c2UuYwppbmRleCBkOTZkNTYzLi44ODAzMjlm
IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rZXJuZWwvamFpbGhvdXNlLmMKKysrIGIvYXJjaC94ODYv
a2VybmVsL2phaWxob3VzZS5jCkBAIC0yMTcsNCArMjE3LDUgQEAgc3RhdGljIGJvb2wgX19pbml0
IGphaWxob3VzZV94MmFwaWNfYXZhaWxhYmxlKHZvaWQpCiAJLmRldGVjdAkJCT0gamFpbGhvdXNl
X2RldGVjdCwKIAkuaW5pdC5pbml0X3BsYXRmb3JtCT0gamFpbGhvdXNlX2luaXRfcGxhdGZvcm0s
CiAJLmluaXQueDJhcGljX2F2YWlsYWJsZQk9IGphaWxob3VzZV94MmFwaWNfYXZhaWxhYmxlLAor
CS5pZ25vcmVfbm9wdgkJPSB0cnVlLAogfTsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9lbmxp
Z2h0ZW5fcHYuYyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwppbmRleCA0NzIyYmEyLi41
ZDE2ODI0IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMKKysrIGIvYXJj
aC94ODYveGVuL2VubGlnaHRlbl9wdi5jCkBAIC0xNDYzLDQgKzE0NjMsNSBAQCBzdGF0aWMgdWlu
dDMyX3QgX19pbml0IHhlbl9wbGF0Zm9ybV9wdih2b2lkKQogCS5kZXRlY3QgICAgICAgICAgICAg
ICAgID0geGVuX3BsYXRmb3JtX3B2LAogCS50eXBlCQkJPSBYODZfSFlQRVJfWEVOX1BWLAogCS5y
dW50aW1lLnBpbl92Y3B1ICAgICAgID0geGVuX3Bpbl92Y3B1LAorCS5pZ25vcmVfbm9wdgkJPSB0
cnVlLAogfTsKLS0gCjEuOC4zLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
