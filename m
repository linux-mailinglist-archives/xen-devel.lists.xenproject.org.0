Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC09A5C8B7
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 07:20:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiBAA-00012Z-EG; Tue, 02 Jul 2019 05:17:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=is1s=U7=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hiBA8-00011r-5n
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 05:17:04 +0000
X-Inumbo-ID: 9d6861f6-9c88-11e9-8713-ab1a8d047537
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d6861f6-9c88-11e9-8713-ab1a8d047537;
 Tue, 02 Jul 2019 05:16:58 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x625F8mS131069;
 Tue, 2 Jul 2019 05:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=EFSmZR+aQfjnbpTqhm/zuPPtTY2fNuao7fBCYCnO2FA=;
 b=JiBXcM/nBdWreFF1r561875O89x9rICsQrwdJFWJnE2YbA+7E1b6arNH18k5NYmr2rr8
 wBfsEdtcmks/oNOXRJWJ6vB5/ev6783Au6Cru+9f6IielStLTvl99eRIaVVWUIF87Xgx
 3Clu585huEI9bXexO/B9NSiCduN45GlyUX274E4f5Xm6IIctAhJT7sxujEKDvVikEmTM
 TnNbYX2HSz4SF9XQK5Fk6LFWOLDrLjbWRKW6XvoCLew0K2f5H19zQ76o8mP+CFC9aONB
 vMW3/f8kGkFe5wtmrStuye3Wn6PoIAuMbSKIoOd9JDLolBJl9yp3v6kcjU/y/YlvK5l5 ZA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2te61ps3q3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jul 2019 05:16:46 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x625CS1Z183825;
 Tue, 2 Jul 2019 05:16:46 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2tebqg9n04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jul 2019 05:16:46 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x625GjPC006425;
 Tue, 2 Jul 2019 05:16:45 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 01 Jul 2019 22:16:44 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Mon,  1 Jul 2019 13:19:57 +0800
Message-Id: <1561958399-28906-4-git-send-email-zhenzhong.duan@oracle.com>
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
Subject: [Xen-devel] [PATCH v4 3/5] Revert "xen: Introduce 'xen_nopv' to
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
Cc: jgross@suse.com, sstabellini@kernel.org,
 Zhenzhong Duan <zhenzhong.duan@oracle.com>, mingo@redhat.com, bp@alien8.de,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyByZXZlcnRzIGNvbW1pdCA4ZDY5M2I5MTFiYjljNTcwMDljMjRjYjE3NzJkMjA1Yjg0Yzc5
ODVjLgoKSW5zdGVhZCB3ZSB1c2UgYW4gdW5pZmllZCBwYXJhbWV0ZXIgJ25vcHYnIGZvciBhbGwg
dGhlIGh5cGVydmlzb3IKcGxhdGZvcm1zLgoKU2lnbmVkLW9mZi1ieTogWmhlbnpob25nIER1YW4g
PHpoZW56aG9uZy5kdWFuQG9yYWNsZS5jb20+ClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+CkNjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFj
bGUuY29tPgpDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpDYzogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogVGhvbWFzIEdsZWl4bmVyIDx0
Z2x4QGxpbnV0cm9uaXguZGU+CkNjOiBJbmdvIE1vbG5hciA8bWluZ29AcmVkaGF0LmNvbT4KQ2M6
IEJvcmlzbGF2IFBldGtvdiA8YnBAYWxpZW44LmRlPgotLS0KIERvY3VtZW50YXRpb24vYWRtaW4t
Z3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0IHwgIDQgLS0tLQogYXJjaC94ODYveGVuL2VubGln
aHRlbl9odm0uYyAgICAgICAgICAgICAgICAgICAgfCAxMiArLS0tLS0tLS0tLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0IGIvRG9jdW1lbnRh
dGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKaW5kZXggMjFlMDhhZi4uZDVj
M2RjYyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1l
dGVycy50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVy
cy50eHQKQEAgLTUyNTEsMTAgKzUyNTEsNiBAQAogCQkJRGlzYWJsZXMgdGhlIHRpY2tldGxvY2sg
c2xvd3BhdGggdXNpbmcgWGVuIFBWCiAJCQlvcHRpbWl6YXRpb25zLgogCi0JeGVuX25vcHYJW1g4
Nl0KLQkJCURpc2FibGVzIHRoZSBQViBvcHRpbWl6YXRpb25zIGZvcmNpbmcgdGhlIEhWTSBndWVz
dCB0bwotCQkJcnVuIGFzIGdlbmVyaWMgSFZNIGd1ZXN0IHdpdGggbm8gUFYgZHJpdmVycy4KLQog
CXhlbl9zY3J1Yl9wYWdlcz0JW1hFTl0KIAkJCUJvb2xlYW4gb3B0aW9uIHRvIGNvbnRyb2wgc2Ny
dWJiaW5nIHBhZ2VzIGJlZm9yZSBnaXZpbmcgdGhlbSBiYWNrCiAJCQl0byBYZW4sIGZvciB1c2Ug
Ynkgb3RoZXIgZG9tYWlucy4gQ2FuIGJlIGFsc28gY2hhbmdlZCBhdCBydW50aW1lCmRpZmYgLS1n
aXQgYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jIGIvYXJjaC94ODYveGVuL2VubGlnaHRl
bl9odm0uYwppbmRleCBhYzQ5NDNjLi43ZmNiNGVhIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni94ZW4v
ZW5saWdodGVuX2h2bS5jCisrKyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMKQEAgLTIx
MCwxOCArMjEwLDggQEAgc3RhdGljIHZvaWQgX19pbml0IHhlbl9odm1fZ3Vlc3RfaW5pdCh2b2lk
KQogI2VuZGlmCiB9CiAKLXN0YXRpYyBib29sIHhlbl9ub3B2Owotc3RhdGljIF9faW5pdCBpbnQg
eGVuX3BhcnNlX25vcHYoY2hhciAqYXJnKQotewotICAgICAgIHhlbl9ub3B2ID0gdHJ1ZTsKLSAg
ICAgICByZXR1cm4gMDsKLX0KLWVhcmx5X3BhcmFtKCJ4ZW5fbm9wdiIsIHhlbl9wYXJzZV9ub3B2
KTsKLQogYm9vbCBfX2luaXQgeGVuX2h2bV9uZWVkX2xhcGljKHZvaWQpCiB7Ci0JaWYgKHhlbl9u
b3B2KQotCQlyZXR1cm4gZmFsc2U7CiAJaWYgKHhlbl9wdl9kb21haW4oKSkKIAkJcmV0dXJuIGZh
bHNlOwogCWlmICgheGVuX2h2bV9kb21haW4oKSkKQEAgLTIzMyw3ICsyMjMsNyBAQCBib29sIF9f
aW5pdCB4ZW5faHZtX25lZWRfbGFwaWModm9pZCkKIAogc3RhdGljIHVpbnQzMl90IF9faW5pdCB4
ZW5fcGxhdGZvcm1faHZtKHZvaWQpCiB7Ci0JaWYgKHhlbl9wdl9kb21haW4oKSB8fCB4ZW5fbm9w
dikKKwlpZiAoeGVuX3B2X2RvbWFpbigpKQogCQlyZXR1cm4gMDsKIAogCXJldHVybiB4ZW5fY3B1
aWRfYmFzZSgpOwotLSAKMS44LjMuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
