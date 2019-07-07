Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C017C61C36
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 11:15:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkPgm-0004UT-Is; Mon, 08 Jul 2019 09:12:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IuGq=VF=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hkPgk-0004UG-AB
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 09:11:58 +0000
X-Inumbo-ID: 6e1a6d9a-a160-11e9-817d-df0e91cad98a
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e1a6d9a-a160-11e9-817d-df0e91cad98a;
 Mon, 08 Jul 2019 09:11:55 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6899hhK152103;
 Mon, 8 Jul 2019 09:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=v1DgpfRJEzDrZLeF1PWs/KsiDG71M25IhxSiMAC4Vfs=;
 b=cmbeTjSiQMRMkxnf6WA2LqN9YKkbh/M6hGNnNNaH4y5hYlEASTeBSNt81XfWA9kPDhKL
 ikk6DEr4O42Yk3HROf+P+OcDXrGFAdNVWhPN/ogqHKii+Ud2lOzfygZjYICKaXnO5eot
 PuQm/lZ4eK/gCP+SCCTOoFTJrWUs0IpHnrc6P3CnZZQi/kODaeriuGLBH3HrGJNgeJl9
 d0msqftOe2zVV8Aynno+o2AheSzWCVWh2hw2/DYNHWbjyp/x/Cmnm7U3TOi5Mw80jbpc
 fsp3HQbrzRD3Sdw8J9DmJ32yWHu9lEcrGhqWV+pGRxwv4Pb3BCHpNctIpw9i5DOgb2Rl yA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2tjm9qd70b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Jul 2019 09:11:41 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6897v8R131753;
 Mon, 8 Jul 2019 09:11:41 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2tjjyk3snd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Jul 2019 09:11:40 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x689BdZL005130;
 Mon, 8 Jul 2019 09:11:39 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 08 Jul 2019 02:11:39 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Sun,  7 Jul 2019 17:15:08 +0800
Message-Id: <1562490908-17882-5-git-send-email-zhenzhong.duan@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1562490908-17882-1-git-send-email-zhenzhong.duan@oracle.com>
References: <1562490908-17882-1-git-send-email-zhenzhong.duan@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9311
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907080120
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9311
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907080121
Subject: [Xen-devel] [PATCH v6 4/4] x86/xen: Add "nopv" support for HVM guest
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
OC5kZT4KLS0tCiBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jIHwgMzIgKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMg
Yi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jCmluZGV4IDE3NTZjZjcuLjdlMWM3NWYgMTAw
NjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMKKysrIGIvYXJjaC94ODYveGVu
L2VubGlnaHRlbl9odm0uYwpAQCAtMjMxLDE0ICsyMzEsNiBAQCBib29sIF9faW5pdCB4ZW5faHZt
X25lZWRfbGFwaWModm9pZCkKIAlyZXR1cm4gdHJ1ZTsKIH0KIAotc3RhdGljIHVpbnQzMl90IF9f
aW5pdCB4ZW5fcGxhdGZvcm1faHZtKHZvaWQpCi17Ci0JaWYgKHhlbl9wdl9kb21haW4oKSkKLQkJ
cmV0dXJuIDA7Ci0KLQlyZXR1cm4geGVuX2NwdWlkX2Jhc2UoKTsKLX0KLQogc3RhdGljIF9faW5p
dCB2b2lkIHhlbl9odm1fZ3Vlc3RfbGF0ZV9pbml0KHZvaWQpCiB7CiAjaWZkZWYgQ09ORklHX1hF
Tl9QVkgKQEAgLTI1MCw2ICsyNDIsOSBAQCBzdGF0aWMgX19pbml0IHZvaWQgeGVuX2h2bV9ndWVz
dF9sYXRlX2luaXQodm9pZCkKIAkvKiBQVkggZGV0ZWN0ZWQuICovCiAJeGVuX3B2aCA9IHRydWU7
CiAKKwlpZiAobm9wdikKKwkJcGFuaWMoIlwibm9wdlwiIGFuZCBcInhlbl9ub3B2XCIgcGFyYW1l
dGVycyBhcmUgdW5zdXBwb3J0ZWQgaW4gUFZIIGd1ZXN0LiIpOworCiAJLyogTWFrZSBzdXJlIHdl
IGRvbid0IGZhbGwgYmFjayB0byAoZGVmYXVsdCkgQUNQSV9JUlFfTU9ERUxfUElDLiAqLwogCWlm
ICghbnJfaW9hcGljcyAmJiBhY3BpX2lycV9tb2RlbCA9PSBBQ1BJX0lSUV9NT0RFTF9QSUMpCiAJ
CWFjcGlfaXJxX21vZGVsID0gQUNQSV9JUlFfTU9ERUxfUExBVEZPUk07CkBAIC0yNTksNiArMjU0
LDI2IEBAIHN0YXRpYyBfX2luaXQgdm9pZCB4ZW5faHZtX2d1ZXN0X2xhdGVfaW5pdCh2b2lkKQog
I2VuZGlmCiB9CiAKK3N0YXRpYyB1aW50MzJfdCBfX2luaXQgeGVuX3BsYXRmb3JtX2h2bSh2b2lk
KQoreworCWlmICh4ZW5fcHZfZG9tYWluKCkpCisJCXJldHVybiAwOworCisJaWYgKHhlbl9wdmhf
ZG9tYWluKCkgJiYgbm9wdikgeworCQkvKiBHdWVzdCBib290aW5nIHZpYSB0aGUgWGVuLVBWSCBi
b290IGVudHJ5IGdvZXMgaGVyZSAqLworCQlwcl9pbmZvKCJcIm5vcHZcIiBwYXJhbWV0ZXIgaXMg
aWdub3JlZCBpbiBQVkggZ3Vlc3RcbiIpOworCQlub3B2ID0gZmFsc2U7CisJfSBlbHNlIGlmIChu
b3B2KSB7CisJCS8qCisJCSAqIEd1ZXN0IGJvb3RpbmcgdmlhIG5vcm1hbCBib290IGVudHJ5IChs
aWtlIHZpYSBncnViMikgZ29lcworCQkgKiBoZXJlLgorCQkgKi8KKwkJeDg2X2luaXQuaHlwZXIu
Z3Vlc3RfbGF0ZV9pbml0ID0geGVuX2h2bV9ndWVzdF9sYXRlX2luaXQ7CisJCXJldHVybiAwOwor
CX0KKwlyZXR1cm4geGVuX2NwdWlkX2Jhc2UoKTsKK30KKwogY29uc3QgX19pbml0Y29uc3Qgc3Ry
dWN0IGh5cGVydmlzb3JfeDg2IHg4Nl9oeXBlcl94ZW5faHZtID0gewogCS5uYW1lICAgICAgICAg
ICAgICAgICAgID0gIlhlbiBIVk0iLAogCS5kZXRlY3QgICAgICAgICAgICAgICAgID0geGVuX3Bs
YXRmb3JtX2h2bSwKQEAgLTI2OCw0ICsyODMsNSBAQCBzdGF0aWMgX19pbml0IHZvaWQgeGVuX2h2
bV9ndWVzdF9sYXRlX2luaXQodm9pZCkKIAkuaW5pdC5pbml0X21lbV9tYXBwaW5nCT0geGVuX2h2
bV9pbml0X21lbV9tYXBwaW5nLAogCS5pbml0Lmd1ZXN0X2xhdGVfaW5pdAk9IHhlbl9odm1fZ3Vl
c3RfbGF0ZV9pbml0LAogCS5ydW50aW1lLnBpbl92Y3B1ICAgICAgID0geGVuX3Bpbl92Y3B1LAor
CS5pZ25vcmVfbm9wdiAgICAgICAgICAgID0gdHJ1ZSwKIH07Ci0tIAoxLjguMy4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
