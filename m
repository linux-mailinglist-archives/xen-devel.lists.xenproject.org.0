Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BFF14BDAC
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 17:27:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwTf8-0006qi-ND; Tue, 28 Jan 2020 16:24:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XXmC=3R=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1iwTf7-0006qd-G2
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 16:24:25 +0000
X-Inumbo-ID: a50cb7b0-41ea-11ea-872c-12813bfff9fa
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a50cb7b0-41ea-11ea-872c-12813bfff9fa;
 Tue, 28 Jan 2020 16:24:24 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00SGEEiZ038187;
 Tue, 28 Jan 2020 16:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=corp-2019-08-05;
 bh=ZWdf7sG5Xw7ejFplB1oAzj7ALcivlmGZ3sLaK7nXF7U=;
 b=XTLx96RMtWLPWR1Mfszf621kniFGf/Svj9QHnW5RD6RJ7lB0a7ZGc+1Xo6jePDsHv1bO
 MKzaVgXId9G6x4Nk7cFzT1emmIW9o6sQc6P8JdctbvGjo5ADSfKjdyN6B6HfhwIqcGgz
 NoJUTckWMlXNDuFcNWXBNjFeCVc6dJa5KyxV8aFgdb+9iBueBZtj5cKN/i8Z8Ny8gBTG
 RwFZvhSMahTCPAIxSPEbgJIm2LHkCwritMQ/AKIiGjecv83+F6yX7NgBVgcYrBdSy5+z
 awR+9RorLo7dj+fcjbSEmk9gnYnt/U4l8Wcbf2AO6Ig62/pGi4I66X5I2n9oQR1TW5M8 jg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2xrd3u7eet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jan 2020 16:24:20 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00SGEKaq191045;
 Tue, 28 Jan 2020 16:24:19 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2xta8j2tyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jan 2020 16:24:19 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00SGOG3B026765;
 Tue, 28 Jan 2020 16:24:17 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 28 Jan 2020 08:24:16 -0800
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 28 Jan 2020 11:24:19 -0500
Message-Id: <1580228659-6086-1-git-send-email-boris.ostrovsky@oracle.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9514
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001280126
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9514
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001280126
Subject: [Xen-devel] [PATCH] xen/gntdev: Do not use mm notifiers with
 autotranslating guests
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
Cc: jgross@suse.com, jgg@mellanox.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, ilpo.jarvinen@cs.helsinki.fi
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IGQzZWViMWQ3N2M1ZCAoInhlbi9nbnRkZXY6IHVzZSBtbXVfaW50ZXJ2YWxfbm90aWZp
ZXJfaW5zZXJ0IikKbWlzc2VkIGEgdGVzdCBmb3IgdXNlX3B0ZW1vZCB3aGVuIGNhbGxpbmcgbW11
X2ludGVydmFsX3JlYWRfYmVnaW4oKS4gRml4CnRoYXQuCgpGaXhlczogZDNlZWIxZDc3YzVkICgi
eGVuL2dudGRldjogdXNlIG1tdV9pbnRlcnZhbF9ub3RpZmllcl9pbnNlcnQiKQpDQzogc3RhYmxl
QHZnZXIua2VybmVsLm9yZyAjIDUuNQpSZXBvcnRlZC1ieTogSWxwbyBKw6RydmluZW4gPGlscG8u
amFydmluZW5AY3MuaGVsc2lua2kuZmk+ClRlc3RlZC1ieTogSWxwbyBKw6RydmluZW4gPGlscG8u
amFydmluZW5AY3MuaGVsc2lua2kuZmk+ClNpZ25lZC1vZmYtYnk6IEJvcmlzIE9zdHJvdnNreSA8
Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+Ci0tLQogZHJpdmVycy94ZW4vZ250ZGV2LmMgfCAy
NCArKysrKysrKysrKystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9nbnRkZXYuYyBi
L2RyaXZlcnMveGVuL2dudGRldi5jCmluZGV4IDRmYzgzZTNmNWFkMy4uMDI1ODQxNWNhMGIyIDEw
MDY0NAotLS0gYS9kcml2ZXJzL3hlbi9nbnRkZXYuYworKysgYi9kcml2ZXJzL3hlbi9nbnRkZXYu
YwpAQCAtMTAwNiwxOSArMTAwNiwxOSBAQCBzdGF0aWMgaW50IGdudGRldl9tbWFwKHN0cnVjdCBm
aWxlICpmbGlwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKIAl9CiAJbXV0ZXhfdW5sb2Nr
KCZwcml2LT5sb2NrKTsKIAotCS8qCi0JICogZ250ZGV2IHRha2VzIHRoZSBhZGRyZXNzIG9mIHRo
ZSBQVEUgaW4gZmluZF9ncmFudF9wdGVzKCkgYW5kIHBhc3NlcwotCSAqIGl0IHRvIHRoZSBoeXBl
cnZpc29yIGluIGdudGRldl9tYXBfZ3JhbnRfcGFnZXMoKS4gVGhlIHB1cnBvc2Ugb2YKLQkgKiB0
aGUgbm90aWZpZXIgaXMgdG8gcHJldmVudCB0aGUgaHlwZXJ2aXNvciBwb2ludGVyIHRvIHRoZSBQ
VEUgZnJvbQotCSAqIGdvaW5nIHN0YWxlLgotCSAqCi0JICogU2luY2UgdGhpcyB2bWEncyBtYXBw
aW5ncyBjYW4ndCBiZSB0b3VjaGVkIHdpdGhvdXQgdGhlIG1tYXBfc2VtLAotCSAqIGFuZCB3ZSBh
cmUgaG9sZGluZyBpdCBub3csIHRoZXJlIGlzIG5vIG5lZWQgZm9yIHRoZSBub3RpZmllcl9yYW5n
ZQotCSAqIGxvY2tpbmcgcGF0dGVybi4KLQkgKi8KLQltbXVfaW50ZXJ2YWxfcmVhZF9iZWdpbigm
bWFwLT5ub3RpZmllcik7Ci0KIAlpZiAodXNlX3B0ZW1vZCkgeworCQkvKgorCQkgKiBnbnRkZXYg
dGFrZXMgdGhlIGFkZHJlc3Mgb2YgdGhlIFBURSBpbiBmaW5kX2dyYW50X3B0ZXMoKSBhbmQKKwkJ
ICogcGFzc2VzIGl0IHRvIHRoZSBoeXBlcnZpc29yIGluIGdudGRldl9tYXBfZ3JhbnRfcGFnZXMo
KS4gVGhlCisJCSAqIHB1cnBvc2Ugb2YgdGhlIG5vdGlmaWVyIGlzIHRvIHByZXZlbnQgdGhlIGh5
cGVydmlzb3IgcG9pbnRlcgorCQkgKiB0byB0aGUgUFRFIGZyb20gZ29pbmcgc3RhbGUuCisJCSAq
CisJCSAqIFNpbmNlIHRoaXMgdm1hJ3MgbWFwcGluZ3MgY2FuJ3QgYmUgdG91Y2hlZCB3aXRob3V0
IHRoZQorCQkgKiBtbWFwX3NlbSwgYW5kIHdlIGFyZSBob2xkaW5nIGl0IG5vdywgdGhlcmUgaXMg
bm8gbmVlZCBmb3IKKwkJICogdGhlIG5vdGlmaWVyX3JhbmdlIGxvY2tpbmcgcGF0dGVybi4KKwkJ
ICovCisJCW1tdV9pbnRlcnZhbF9yZWFkX2JlZ2luKCZtYXAtPm5vdGlmaWVyKTsKKwogCQltYXAt
PnBhZ2VzX3ZtX3N0YXJ0ID0gdm1hLT52bV9zdGFydDsKIAkJZXJyID0gYXBwbHlfdG9fcGFnZV9y
YW5nZSh2bWEtPnZtX21tLCB2bWEtPnZtX3N0YXJ0LAogCQkJCQkgIHZtYS0+dm1fZW5kIC0gdm1h
LT52bV9zdGFydCwKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
