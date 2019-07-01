Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DEE5C8B8
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 07:21:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiBC8-0001TK-21; Tue, 02 Jul 2019 05:19:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=is1s=U7=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hiBC6-0001TC-Rr
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 05:19:06 +0000
X-Inumbo-ID: e892d47c-9c88-11e9-8944-77c2be46251d
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e892d47c-9c88-11e9-8944-77c2be46251d;
 Tue, 02 Jul 2019 05:19:04 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x625IrkD133671;
 Tue, 2 Jul 2019 05:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=vqXCEfmZ5gQlOnpRYRTKWKl8oRG3faoP4WDFQ3/Z1bA=;
 b=y00R8cDBVawlt1rd9K/zEIkNa9LT9SrPzZqYsjBuqUker5GpmuTglloBjzkz9GBx2GU4
 8SYGMvKdvLy7XMgqOoHvtMPqRsF/YUN8jIrSIZ7OVI/pFxIGJSwpAIPaOUMfNiNrI8J5
 pzbs/XIBvGidT0LwvQHBLw402cPfCMe+MYI/dDPeMb3LRUKvUbteq9+AWk2egXnGpc2z
 hhH6EPZkSzEw3C/VVLzfe7aZiDj6LCb8mtlz1085R8Crq4ao1SNwJU708yDHrIdeFbSx
 Wcu5hh9b2xNseAoz3rEK4zGH7gD0N/J0C4zVEcUGnFqvCY31YxtpCVi+rAxUBzibYybV DQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2te61ps3vw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jul 2019 05:18:53 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x625Ccs1019349;
 Tue, 2 Jul 2019 05:16:52 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2tebku1uf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jul 2019 05:16:52 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x625Gp9D010788;
 Tue, 2 Jul 2019 05:16:51 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 01 Jul 2019 22:16:51 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Mon,  1 Jul 2019 13:19:59 +0800
Message-Id: <1561958399-28906-6-git-send-email-zhenzhong.duan@oracle.com>
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
 definitions=main-1907020059
Subject: [Xen-devel] [PATCH v4 5/5] xen: Add 'xen_nopv' parameter back for
 backward compatibility
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

TWFwICd4ZW5fbm9wdicgdG8gJ25vcHYnIGFuZCBtYXJrICd4ZW5fbm9wdicgb2Jzb2xldGUgaW4K
a2VybmVsLXBhcmFtZXRlcnMudHh0CgpTaWduZWQtb2ZmLWJ5OiBaaGVuemhvbmcgRHVhbiA8emhl
bnpob25nLmR1YW5Ab3JhY2xlLmNvbT4KQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92
c2t5QG9yYWNsZS5jb20+CkNjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkNjOiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBUaG9tYXMgR2xl
aXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KQ2M6IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQu
Y29tPgpDYzogQm9yaXNsYXYgUGV0a292IDxicEBhbGllbjguZGU+Ci0tLQogRG9jdW1lbnRhdGlv
bi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgfCA2ICsrKysrKwogYXJjaC94ODYv
eGVuL2VubGlnaHRlbl9odm0uYyAgICAgICAgICAgICAgICAgICAgfCA3ICsrKysrKysKIDIgZmls
ZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
YWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1n
dWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKaW5kZXggZDVjM2RjYy4uMzRlYjMyMyAxMDA2NDQK
LS0tIGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKKysr
IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKQEAgLTUy
NjQsNiArNTI2NCwxMiBAQAogCQkJaW1wcm92ZSB0aW1lciByZXNvbHV0aW9uIGF0IHRoZSBleHBl
bnNlIG9mIHByb2Nlc3NpbmcKIAkJCW1vcmUgdGltZXIgaW50ZXJydXB0cy4KIAorCXhlbl9ub3B2
CVtYODZdCisJCQlEaXNhYmxlcyB0aGUgUFYgb3B0aW1pemF0aW9ucyBmb3JjaW5nIHRoZSBIVk0g
Z3Vlc3QgdG8KKwkJCXJ1biBhcyBnZW5lcmljIEhWTSBndWVzdCB3aXRoIG5vIFBWIGRyaXZlcnMu
CisJCQlUaGlzIG9wdGlvbiBpcyBvYnNvbGV0ZWQgYnkgdGhlICJub3B2IiBvcHRpb24sIHdoaWNo
CisJCQloYXMgZXF1aXZhbGVudCBlZmZlY3QgZm9yIFhFTiBwbGF0Zm9ybS4KKwogCW5vcHY9CQlb
WDg2LFhFTixLVk0sSFlQRVJfVixWTVdBUkVdCiAJCQlEaXNhYmxlcyB0aGUgUFYgb3B0aW1pemF0
aW9ucyBmb3JjaW5nIHRoZSBndWVzdCB0byBydW4KIAkJCWFzIGdlbmVyaWMgZ3Vlc3Qgd2l0aCBu
byBQViBkcml2ZXJzLiBDdXJyZW50bHkgc3VwcG9ydApkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVu
L2VubGlnaHRlbl9odm0uYyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMKaW5kZXggMzQw
ZGZmOC4uNWNkZDYwOCAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0uYwor
KysgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jCkBAIC0yMTEsNiArMjExLDEzIEBAIHN0
YXRpYyB2b2lkIF9faW5pdCB4ZW5faHZtX2d1ZXN0X2luaXQodm9pZCkKICNlbmRpZgogfQogCitz
dGF0aWMgX19pbml0IGludCB4ZW5fcGFyc2Vfbm9wdihjaGFyICphcmcpCit7CisJbm9wdiA9IHRy
dWU7CisJcmV0dXJuIDA7Cit9CitlYXJseV9wYXJhbSgieGVuX25vcHYiLCB4ZW5fcGFyc2Vfbm9w
dik7CisKIGJvb2wgX19pbml0IHhlbl9odm1fbmVlZF9sYXBpYyh2b2lkKQogewogCWlmICh4ZW5f
cHZfZG9tYWluKCkpCi0tIAoxLjguMy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
