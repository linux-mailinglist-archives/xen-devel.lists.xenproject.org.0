Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E315C8B4
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 07:19:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiBA6-000111-Nq; Tue, 02 Jul 2019 05:17:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=is1s=U7=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hiBA5-00010k-CS
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 05:17:01 +0000
X-Inumbo-ID: 9e82ba70-9c88-11e9-8980-bc764e045a96
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9e82ba70-9c88-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 05:17:00 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x625E0KA027382;
 Tue, 2 Jul 2019 05:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=PSXRRg+VqoghiPb6E2wfzVIl4GDaBdiY849ddx84T70=;
 b=KCO74WUDMFNqwAhCHjMv+kB1KYRsNuITJY2cJrIb5/4foS0vepIgEuJsimbH8epQ+0cf
 /FlXpp6Ws79NJhwbGNIPTgw97i6eKZ1NexF/Sg7Sbki3tNX1g1RTntt42DvCWphalVtL
 4xmZKmgMbkGJ1oXZLZYGyv/XqPvFuchrydyQZrO3qfdseqSB6cFSRlnUkF5B7E9Py8GK
 4Ly7pm83E4KXS8i5zhRYZfmtqk3VLeqCJ5TMnxnXEcyeWNjlO3BbEPvB3mXb3u/HQ2ZM
 lsujjZimW/cNQOCaYB7tLvvER40QwZ3enznKTIoft0741+yhEmWPu8aW8y/gfcNECn86 tw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2te5tbh4pp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jul 2019 05:16:49 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x625CTHN183960;
 Tue, 2 Jul 2019 05:16:49 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2tebqg9n0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jul 2019 05:16:48 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x625Gleb006454;
 Tue, 2 Jul 2019 05:16:48 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 01 Jul 2019 22:16:47 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Mon,  1 Jul 2019 13:19:58 +0800
Message-Id: <1561958399-28906-5-git-send-email-zhenzhong.duan@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1561958399-28906-1-git-send-email-zhenzhong.duan@oracle.com>
References: <1561958399-28906-1-git-send-email-zhenzhong.duan@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9305
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907020057
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9305
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907020058
Subject: [Xen-devel] [PATCH v4 4/5] x86/xen: Add 'nopv' support for HVM guest
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

UFZIIGd1ZXN0IG5lZWRzIFBWIGV4dGVudGlvbnMgdG8gd29yaywgc28gJ25vcHYnIHBhcmFtZXRl
ciBzaG91bGQgYmUKaWdub3JlZCBmb3IgUFZIIGJ1dCBub3QgZm9yIEhWTSBndWVzdC4KCklmIFBW
SCBndWVzdCBib290cyB1cCB2aWEgdGhlIFhlbi1QVkggYm9vdCBlbnRyeSwgeGVuX3B2aCBpcyBz
ZXQgZWFybHksCndlIGtub3cgaXQncyBQVkggZ3Vlc3QgYW5kIGlnbm9yZSAnbm9wdicgcGFyYW1l
dGVyIGRpcmVjdGx5LgoKSWYgUFZIIGd1ZXN0IGJvb3RzIHVwIHZpYSB0aGUgbm9ybWFsIGJvb3Qg
ZW50cnkgc2FtZSBhcyBIVk0gZ3Vlc3QsIGl0J3MKaGFyZCB0byBkaXN0aW5ndWlzaCBQVkggYW5k
IEhWTSBndWVzdCBhdCB0aGF0IHRpbWUuCgpUbyBoYW5kbGUgdGhhdCBjYXNlLCBhZGQgYSBuZXcg
ZnVuY3Rpb24geGVuX2h2bV9ub3B2X2d1ZXN0X2xhdGVfaW5pdCgpCnRvIGRldGVjdCBQVkggYXQg
YSBsYXRlIHRpbWUgYW5kIHBhbmljIGl0c2VsZiBpZiAnbm9wdicgZW5hYmxlZCBmb3IgYQpQVkgg
Z3Vlc3QuCgpTaWduZWQtb2ZmLWJ5OiBaaGVuemhvbmcgRHVhbiA8emhlbnpob25nLmR1YW5Ab3Jh
Y2xlLmNvbT4KQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+
CkNjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGlu
dXRyb25peC5kZT4KQ2M6IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPgpDYzogQm9yaXNs
YXYgUGV0a292IDxicEBhbGllbjguZGU+Ci0tLQogYXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0u
YyB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI3IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jIGIv
YXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0uYwppbmRleCA3ZmNiNGVhLi4zNDBkZmY4IDEwMDY0
NAotLS0gYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jCisrKyBiL2FyY2gveDg2L3hlbi9l
bmxpZ2h0ZW5faHZtLmMKQEAgLTI1LDYgKzI1LDcgQEAKICNpbmNsdWRlICJtbXUuaCIKICNpbmNs
dWRlICJzbXAuaCIKIAorZXh0ZXJuIGJvb2wgbm9wdjsKIHN0YXRpYyB1bnNpZ25lZCBsb25nIHNo
YXJlZF9pbmZvX3BmbjsKIAogdm9pZCB4ZW5faHZtX2luaXRfc2hhcmVkX2luZm8odm9pZCkKQEAg
LTIyMSwxMSArMjIyLDM2IEBAIGJvb2wgX19pbml0IHhlbl9odm1fbmVlZF9sYXBpYyh2b2lkKQog
CXJldHVybiB0cnVlOwogfQogCitzdGF0aWMgX19pbml0IHZvaWQgeGVuX2h2bV9ub3B2X2d1ZXN0
X2xhdGVfaW5pdCh2b2lkKQoreworI2lmZGVmIENPTkZJR19YRU5fUFZICisJaWYgKHg4Nl9wbGF0
Zm9ybS5sZWdhY3kucnRjIHx8ICF4ODZfcGxhdGZvcm0ubGVnYWN5Lm5vX3ZnYSkKKwkJcmV0dXJu
OworCisJLyogUFZIIGRldGVjdGVkLiAqLworCXhlbl9wdmggPSB0cnVlOworCisJcGFuaWMoIm5v
cHYgcGFyYW1ldGVyIGlzbid0IHN1cHBvcnRlZCBpbiBQVkggZ3Vlc3QuIik7CisjZW5kaWYKK30K
KworCiBzdGF0aWMgdWludDMyX3QgX19pbml0IHhlbl9wbGF0Zm9ybV9odm0odm9pZCkKIHsKIAlp
ZiAoeGVuX3B2X2RvbWFpbigpKQogCQlyZXR1cm4gMDsKIAorCWlmICh4ZW5fcHZoX2RvbWFpbigp
ICYmIG5vcHYpIHsKKwkJLyogR3Vlc3QgYm9vdGluZyB2aWEgdGhlIFhlbi1QVkggYm9vdCBlbnRy
eSBnb2VzIGhlcmUgKi8KKwkJcHJfaW5mbygibm9wdiBwYXJhbWV0ZXIgaXMgaWdub3JlZCBpbiBQ
VkggZ3Vlc3RcbiIpOworCX0gZWxzZSBpZiAobm9wdikgeworCQkvKgorCQkgKiBHdWVzdCBib290
aW5nIHZpYSBub3JtYWwgYm9vdCBlbnRyeSAobGlrZSB2aWEgZ3J1YjIpIGdvZXMKKwkJICogaGVy
ZS4KKwkJICovCisJCXg4Nl9pbml0Lmh5cGVyLmd1ZXN0X2xhdGVfaW5pdCA9IHhlbl9odm1fbm9w
dl9ndWVzdF9sYXRlX2luaXQ7CisJCXJldHVybiAwOworCX0KIAlyZXR1cm4geGVuX2NwdWlkX2Jh
c2UoKTsKIH0KIApAQCAtMjU4LDQgKzI4NCw1IEBAIHN0YXRpYyBfX2luaXQgdm9pZCB4ZW5faHZt
X2d1ZXN0X2xhdGVfaW5pdCh2b2lkKQogCS5pbml0LmluaXRfbWVtX21hcHBpbmcJPSB4ZW5faHZt
X2luaXRfbWVtX21hcHBpbmcsCiAJLmluaXQuZ3Vlc3RfbGF0ZV9pbml0CT0geGVuX2h2bV9ndWVz
dF9sYXRlX2luaXQsCiAJLnJ1bnRpbWUucGluX3ZjcHUgICAgICAgPSB4ZW5fcGluX3ZjcHUsCisJ
Lmlnbm9yZV9ub3B2ICAgICAgICAgICAgPSB0cnVlLAogfTsKLS0gCjEuOC4zLjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
