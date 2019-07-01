Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 724885C8B2
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 07:19:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiBA7-00011I-3s; Tue, 02 Jul 2019 05:17:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=is1s=U7=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hiBA5-00010s-Uw
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 05:17:01 +0000
X-Inumbo-ID: 9c0353ca-9c88-11e9-8c01-bfb3e5f79678
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c0353ca-9c88-11e9-8c01-bfb3e5f79678;
 Tue, 02 Jul 2019 05:16:56 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x625DU14121657;
 Tue, 2 Jul 2019 05:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=tv0WJqGhMWgASy2cp0R54zmW/Tss6rl3pT32IAc9TR4=;
 b=qYEu6cN1GXX7s0m/j5aKzZvT3q16k3u+PUXTz8CjQ75JjsvIt0mbqp3A9GH7JTKijzPi
 XlnX9McKf0fd86J9xobJIig6rHQu4TnGbjlfCFCDejRi1GInnTFSVHGf15271mzcdvku
 zZH7v0mosIQ+AvnbSlzWKHUen7idYAo9BlKimwmp6UslrNNMnAdpJJOAxbX5fMQ1T8Bz
 0uim0DgpGFVN01MyWTj/RbbT7kOhoP3FREB3wIH+ZDW4sNjcuMNr86aStaG+p72W7oE2
 qSJB9H5FRSfoj/tXkwaSPVgCyOzKGuwyvM0hRLNbDl1xz6/c4viW/RYLjK++Bqx6tb2F 8A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2te61e13wy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jul 2019 05:16:43 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x625CSsE040339;
 Tue, 2 Jul 2019 05:16:43 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2tebbjhuc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jul 2019 05:16:43 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x625GgOR010599;
 Tue, 2 Jul 2019 05:16:42 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 01 Jul 2019 22:16:42 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Mon,  1 Jul 2019 13:19:56 +0800
Message-Id: <1561958399-28906-3-git-send-email-zhenzhong.duan@oracle.com>
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
Subject: [Xen-devel] [PATCH v4 2/5] x86: Add nopv parameter to disable PV
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
Cc: jgross@suse.com, sstabellini@kernel.org,
 Jan Kiszka <jan.kiszka@siemens.com>,
 Zhenzhong Duan <zhenzhong.duan@oracle.com>, mingo@redhat.com, bp@alien8.de,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de
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
Z25lZC1vZmYtYnk6IFpoZW56aG9uZyBEdWFuIDx6aGVuemhvbmcuZHVhbkBvcmFjbGUuY29tPgpS
ZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpDYzogVGhvbWFzIEds
ZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNjOiBJbmdvIE1vbG5hciA8bWluZ29AcmVkaGF0
LmNvbT4KQ2M6IEJvcmlzbGF2IFBldGtvdiA8YnBAYWxpZW44LmRlPgpDYzogSmFuIEtpc3prYSA8
amFuLmtpc3prYUBzaWVtZW5zLmNvbT4KQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92
c2t5QG9yYWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+Ci0tLQogRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50
eHQgfCAgNSArKysrKwogYXJjaC94ODYvaW5jbHVkZS9hc20vaHlwZXJ2aXNvci5oICAgICAgICAg
ICAgICAgfCAgMyArKysKIGFyY2gveDg2L2tlcm5lbC9jcHUvaHlwZXJ2aXNvci5jICAgICAgICAg
ICAgICAgIHwgMTEgKysrKysrKysrKysKIGFyY2gveDg2L2tlcm5lbC9qYWlsaG91c2UuYyAgICAg
ICAgICAgICAgICAgICAgIHwgIDEgKwogYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jICAgICAg
ICAgICAgICAgICAgICAgfCAgMSArCiA1IGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJz
LnR4dCBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0Cmlu
ZGV4IDEzOGY2NjYuLjIxZTA4YWYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3Vp
ZGUva2VybmVsLXBhcmFtZXRlcnMudHh0CisrKyBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUv
a2VybmVsLXBhcmFtZXRlcnMudHh0CkBAIC01MjY4LDYgKzUyNjgsMTEgQEAKIAkJCWltcHJvdmUg
dGltZXIgcmVzb2x1dGlvbiBhdCB0aGUgZXhwZW5zZSBvZiBwcm9jZXNzaW5nCiAJCQltb3JlIHRp
bWVyIGludGVycnVwdHMuCiAKKwlub3B2PQkJW1g4NixYRU4sS1ZNLEhZUEVSX1YsVk1XQVJFXQor
CQkJRGlzYWJsZXMgdGhlIFBWIG9wdGltaXphdGlvbnMgZm9yY2luZyB0aGUgZ3Vlc3QgdG8gcnVu
CisJCQlhcyBnZW5lcmljIGd1ZXN0IHdpdGggbm8gUFYgZHJpdmVycy4gQ3VycmVudGx5IHN1cHBv
cnQKKwkJCVhFTiBIVk0sIEtWTSwgSFlQRVJfViBhbmQgVk1XQVJFIGd1ZXN0LgorCiAJeGlyYzJw
c19jcz0JW05FVCxQQ01DSUFdCiAJCQlGb3JtYXQ6CiAJCQk8aXJxPiw8aXJxX21hc2s+LDxpbz4s
PGZ1bGxfZHVwbGV4Piw8ZG9fc291bmQ+LDxsb2NrdXBfaGFjaz5bLDxpcnEyPlssPGlycTM+Wyw8
aXJxND5dXV0KZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2h5cGVydmlzb3IuaCBi
L2FyY2gveDg2L2luY2x1ZGUvYXNtL2h5cGVydmlzb3IuaAppbmRleCA4YzVhYWJhLi5kNzVkMmVh
IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9oeXBlcnZpc29yLmgKKysrIGIvYXJj
aC94ODYvaW5jbHVkZS9hc20vaHlwZXJ2aXNvci5oCkBAIC01Miw2ICs1Miw5IEBAIHN0cnVjdCBo
eXBlcnZpc29yX3g4NiB7CiAKIAkvKiBydW50aW1lIGNhbGxiYWNrcyAqLwogCXN0cnVjdCB4ODZf
aHlwZXJfcnVudGltZSBydW50aW1lOworCisJLyogaWdub3JlIG5vcHYgcGFyYW1ldGVyICovCisJ
Ym9vbCBpZ25vcmVfbm9wdjsKIH07CiAKIGV4dGVybiBlbnVtIHg4Nl9oeXBlcnZpc29yX3R5cGUg
eDg2X2h5cGVyX3R5cGU7CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvY3B1L2h5cGVydmlz
b3IuYyBiL2FyY2gveDg2L2tlcm5lbC9jcHUvaHlwZXJ2aXNvci5jCmluZGV4IDQ3OWNhNDcuLjMz
N2ZmMDcgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2tlcm5lbC9jcHUvaHlwZXJ2aXNvci5jCisrKyBi
L2FyY2gveDg2L2tlcm5lbC9jcHUvaHlwZXJ2aXNvci5jCkBAIC01NCw2ICs1NCwxNCBAQAogZW51
bSB4ODZfaHlwZXJ2aXNvcl90eXBlIHg4Nl9oeXBlcl90eXBlOwogRVhQT1JUX1NZTUJPTCh4ODZf
aHlwZXJfdHlwZSk7CiAKK2Jvb2wgX19pbml0ZGF0YSBub3B2Oworc3RhdGljIF9faW5pdCBpbnQg
cGFyc2Vfbm9wdihjaGFyICphcmcpCit7CisJbm9wdiA9IHRydWU7CisJcmV0dXJuIDA7Cit9Citl
YXJseV9wYXJhbSgibm9wdiIsIHBhcnNlX25vcHYpOworCiBzdGF0aWMgaW5saW5lIGNvbnN0IHN0
cnVjdCBoeXBlcnZpc29yX3g4NiAqIF9faW5pdAogZGV0ZWN0X2h5cGVydmlzb3JfdmVuZG9yKHZv
aWQpCiB7CkBAIC02MSw2ICs2OSw5IEBACiAJdWludDMyX3QgcHJpLCBtYXhfcHJpID0gMDsKIAog
CWZvciAocCA9IGh5cGVydmlzb3JzOyBwIDwgaHlwZXJ2aXNvcnMgKyBBUlJBWV9TSVpFKGh5cGVy
dmlzb3JzKTsgcCsrKSB7CisJCWlmICh1bmxpa2VseShub3B2KSAmJiAhKCpwKS0+aWdub3JlX25v
cHYpCisJCQljb250aW51ZTsKKwogCQlwcmkgPSAoKnApLT5kZXRlY3QoKTsKIAkJaWYgKHByaSA+
IG1heF9wcmkpIHsKIAkJCW1heF9wcmkgPSBwcmk7CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJu
ZWwvamFpbGhvdXNlLmMgYi9hcmNoL3g4Ni9rZXJuZWwvamFpbGhvdXNlLmMKaW5kZXggZDk2ZDU2
My4uODgwMzI5ZiAxMDA2NDQKLS0tIGEvYXJjaC94ODYva2VybmVsL2phaWxob3VzZS5jCisrKyBi
L2FyY2gveDg2L2tlcm5lbC9qYWlsaG91c2UuYwpAQCAtMjE3LDQgKzIxNyw1IEBAIHN0YXRpYyBi
b29sIF9faW5pdCBqYWlsaG91c2VfeDJhcGljX2F2YWlsYWJsZSh2b2lkKQogCS5kZXRlY3QJCQk9
IGphaWxob3VzZV9kZXRlY3QsCiAJLmluaXQuaW5pdF9wbGF0Zm9ybQk9IGphaWxob3VzZV9pbml0
X3BsYXRmb3JtLAogCS5pbml0LngyYXBpY19hdmFpbGFibGUJPSBqYWlsaG91c2VfeDJhcGljX2F2
YWlsYWJsZSwKKwkuaWdub3JlX25vcHYJCT0gdHJ1ZSwKIH07CmRpZmYgLS1naXQgYS9hcmNoL3g4
Ni94ZW4vZW5saWdodGVuX3B2LmMgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMKaW5kZXgg
NDcyMmJhMi4uNWQxNjgyNCAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5j
CisrKyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwpAQCAtMTQ2Myw0ICsxNDYzLDUgQEAg
c3RhdGljIHVpbnQzMl90IF9faW5pdCB4ZW5fcGxhdGZvcm1fcHYodm9pZCkKIAkuZGV0ZWN0ICAg
ICAgICAgICAgICAgICA9IHhlbl9wbGF0Zm9ybV9wdiwKIAkudHlwZQkJCT0gWDg2X0hZUEVSX1hF
Tl9QViwKIAkucnVudGltZS5waW5fdmNwdSAgICAgICA9IHhlbl9waW5fdmNwdSwKKwkuaWdub3Jl
X25vcHYJCT0gdHJ1ZSwKIH07Ci0tIAoxLjguMy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
