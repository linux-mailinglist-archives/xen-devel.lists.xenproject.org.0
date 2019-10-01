Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 463D2C38BF
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 17:19:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFJth-0006lV-43; Tue, 01 Oct 2019 15:17:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3N+/=X2=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1iFJtf-0006lK-D6
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 15:17:03 +0000
X-Inumbo-ID: 8537bf28-e45e-11e9-bf31-bc764e2007e4
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by localhost (Halon) with ESMTPS
 id 8537bf28-e45e-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 15:17:02 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x91FDk5A161443;
 Tue, 1 Oct 2019 15:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2019-08-05; bh=Cl6NTVoaJaSBxqb2QcFNk13Sq3UWtVzalNOzurAnyF4=;
 b=D7dJqcMa/TH7rlsI4YA3nfkLmOEGuG6OjIc4axgqDw1FHCIBmQKLWjEzTOjp/DFTx6Eo
 ctOxQPyKguGydMvx2zKFl0zRbaMfIlpYe94hAsmOI5K38kdVUKxnqzNqLkUJ0+N4t2NS
 w68m/FwI73QiBcv+Kb6Qr+AQUFmyl889nJrPfFUOVAS3KX4EjrAt6YCxeYYKtRD3V106
 wi8geTLcDENErs6iwAZKvI8P+pSTCZyAko1Cmg4Y1osISuXFo5vHwVkDIYZ5q4RYGMmV
 aPWMSXidqQyOYB459e0fzrcJhIl25hNhTbSaU88pQ1wmIKnnBeIM3KcHGpATsOnEXTUe Xw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2va05rpp81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Oct 2019 15:16:57 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x91FEL6J127106;
 Tue, 1 Oct 2019 15:16:57 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2vbmpysbdj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Oct 2019 15:16:56 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x91FGs8p010956;
 Tue, 1 Oct 2019 15:16:55 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 01 Oct 2019 08:16:54 -0700
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Date: Tue,  1 Oct 2019 11:16:33 -0400
Message-Id: <20191001151633.1659-1-boris.ostrovsky@oracle.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9397
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910010137
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9397
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910010137
Subject: [Xen-devel] [PATCH] x86/xen: Return from panic notifier
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
Cc: jgross@suse.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 james@dingwall.me.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudGx5IGV4ZWN1dGlvbiBvZiBwYW5pYygpIGNvbnRpbnVlcyB1bnRpbCBYZW4ncyBwYW5p
YyBub3RpZmllcgooeGVuX3BhbmljX2V2ZW50KCkpIGlzIGNhbGxlZCBhdCB3aGljaCBwb2ludCB3
ZSBtYWtlIGEgaHlwZXJjYWxsIHRoYXQKbmV2ZXIgcmV0dXJucy4KClRoaXMgbWVhbnMgdGhhdCBh
bnkgbm90aWZpZXIgdGhhdCBpcyBzdXBwb3NlZCB0byBiZSBjYWxsZWQgbGF0ZXIgYXMKd2VsbCBh
cyBzaWduaWZpY2FudCBwYXJ0IG9mIHBhbmljKCkgY29kZSAoc3VjaCBhcyBwc3RvcmUgd3JpdGVz
IGZyb20Ka21zZ19kdW1wKCkpIGlzIG5ldmVyIGV4ZWN1dGVkLgoKVGhlcmUgaXMgbm8gcmVhc29u
IGZvciB4ZW5fcGFuaWNfZXZlbnQoKSB0byBiZSB0aGlzIGxhc3QgcG9pbnQgaW4KZXhlY3V0aW9u
IHNpbmNlIHBhbmljKCkncyBlbWVyZ2VuY3lfcmVzdGFydCgpIHdpbGwgY2FsbCBpbnRvCnhlbl9l
bWVyZ2VuY3lfcmVzdGFydCgpIGZyb20gd2hlcmUgd2UgY2FuIHBlcmZvcm0gb3VyIGh5cGVyY2Fs
bC4KClJlcG9ydGVkLWJ5OiBKYW1lcyBEaW5nd2FsbCA8amFtZXNAZGluZ3dhbGwubWUudWs+ClNp
Z25lZC1vZmYtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+
Ci0tLQogYXJjaC94ODYveGVuL2VubGlnaHRlbi5jIHwgMTcgKysrKysrKysrKysrKystLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW4uYyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW4uYwpp
bmRleCA3NTBmNDZhZDAxOGEuLmZkNGY1OGNmNTFkYyAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVu
L2VubGlnaHRlbi5jCisrKyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW4uYwpAQCAtMjY5LDE2ICsy
NjksMjcgQEAgdm9pZCB4ZW5fcmVib290KGludCByZWFzb24pCiAJCUJVRygpOwogfQogCitzdGF0
aWMgaW50IHJlYm9vdF9yZWFzb24gPSBTSFVURE9XTl9yZWJvb3Q7CiB2b2lkIHhlbl9lbWVyZ2Vu
Y3lfcmVzdGFydCh2b2lkKQogewotCXhlbl9yZWJvb3QoU0hVVERPV05fcmVib290KTsKKwl4ZW5f
cmVib290KHJlYm9vdF9yZWFzb24pOwogfQogCiBzdGF0aWMgaW50CiB4ZW5fcGFuaWNfZXZlbnQo
c3RydWN0IG5vdGlmaWVyX2Jsb2NrICp0aGlzLCB1bnNpZ25lZCBsb25nIGV2ZW50LCB2b2lkICpw
dHIpCiB7Ci0JaWYgKCFrZXhlY19jcmFzaF9sb2FkZWQoKSkKLQkJeGVuX3JlYm9vdChTSFVURE9X
Tl9jcmFzaCk7CisJaWYgKCFrZXhlY19jcmFzaF9sb2FkZWQoKSkgeworCQlyZWJvb3RfcmVhc29u
ID0gU0hVVERPV05fY3Jhc2g7CisKKwkJLyoKKwkJICogSWYgcGFuaWNfdGltZW91dD09MCB0aGVu
IHdlIGFyZSBzdXBwb3NlZCB0byB3YWl0IGZvcmV2ZXIuCisJCSAqIEhvd2V2ZXIsIHRvIHByZXNl
cnZlIG9yaWdpbmFsIGRvbTAgYmVoYXZpb3Igd2UgaGF2ZSB0byBkcm9wCisJCSAqIGludG8gaHlw
ZXJ2aXNvci4gKGRvbVUgYmVoYXZpb3IgaXMgY29udHJvbGxlZCBieSBpdHMKKwkJICogY29uZmln
IGZpbGUpCisJCSAqLworCQlpZiAocGFuaWNfdGltZW91dCA9PSAwKQorCQkJcGFuaWNfdGltZW91
dCA9IC0xOworCX0KIAlyZXR1cm4gTk9USUZZX0RPTkU7CiB9CiAKLS0gCjIuMTcuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
