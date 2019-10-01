Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB673C367D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 15:58:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFIdq-0006Vt-Nm; Tue, 01 Oct 2019 13:56:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LEtS=X2=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1iFIdp-0006Vo-Bq
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 13:56:37 +0000
X-Inumbo-ID: 488c5e0e-e453-11e9-96fe-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by localhost (Halon) with ESMTPS
 id 488c5e0e-e453-11e9-96fe-12813bfff9fa;
 Tue, 01 Oct 2019 13:56:36 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x91DiVIs069498;
 Tue, 1 Oct 2019 13:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2019-08-05;
 bh=9GWeqhJnT5PGkazNzMmgVhKC+DkKpsNOs2T2q3VSXac=;
 b=YQ9au5zrbo5ogpT38yZosjjBdTHx3lvFjGT7Jr6XFzkxCpLXFQOoyF9og7t6J7v18n2u
 8mkyXJpxHWgj3DF8LmyF14FN5B2/PE5RiFiyZbZeY+v64dyTRNvMxvAQ54Eg8yO1DmO0
 j+d83AnWQFcM5XyK0c3GrLTdSmo3KXL0cMGM3Ahr9nCm6tDoYHXPP545TXCTURQH0Qas
 5csgLO3K/EDUD15D0ctQklBzF7R32Og/2PBggtrmMIzcvM4Rjirt47o6yVJWtuMxWI+4
 LsH1cpmqvvZpCmGKtUmfq2Fa7fRj4+0b/1rXU2oOwiA4zji6sF6363ueSoD7gLZOuP65 FQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2va05rp0hx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Oct 2019 13:56:26 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x91DheEB025460;
 Tue, 1 Oct 2019 13:56:26 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 2vbmpymbq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Oct 2019 13:56:26 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x91DuOvF026286;
 Tue, 1 Oct 2019 13:56:24 GMT
Received: from linux.cn.oracle.com (/10.182.69.106)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 01 Oct 2019 06:56:23 -0700
From: Dongli Zhang <dongli.zhang@oracle.com>
To: xen-devel@lists.xenproject.org, netdev@vger.kernel.org
Date: Tue,  1 Oct 2019 21:56:41 +0800
Message-Id: <1569938201-23620-1-git-send-email-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.7.4
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9396
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=963
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910010125
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9396
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910010125
Subject: [Xen-devel] [PATCH v2 1/1] xen-netfront: do not use ~0U as error
 return value for xennet_fill_frags()
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
Cc: jgross@suse.com, sstabellini@kernel.org, joe.jin@oracle.com,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, davem@davemloft.net
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

eGVubmV0X2ZpbGxfZnJhZ3MoKSB1c2VzIH4wVSBhcyByZXR1cm4gdmFsdWUgd2hlbiB0aGUgc2tf
YnVmZiBpcyBub3QgYWJsZQp0byBjYWNoZSBleHRyYSBmcmFnbWVudHMuIFRoaXMgaXMgaW5jb3Jy
ZWN0IGJlY2F1c2UgdGhlIHJldHVybiB0eXBlIG9mCnhlbm5ldF9maWxsX2ZyYWdzKCkgaXMgUklO
R19JRFggYW5kIDB4ZmZmZmZmZmYgaXMgYW4gZXhwZWN0ZWQgdmFsdWUgZm9yCnJpbmcgYnVmZmVy
IGluZGV4LgoKSW4gdGhlIHNpdHVhdGlvbiB3aGVuIHRoZSByc3BfY29ucyBpcyBhcHByb2FjaGlu
ZyAweGZmZmZmZmZmLCB0aGUgcmV0dXJuCnZhbHVlIG9mIHhlbm5ldF9maWxsX2ZyYWdzKCkgbWF5
IGJlY29tZSAweGZmZmZmZmZmIHdoaWNoIHhlbm5ldF9wb2xsKCkgKHRoZQpjYWxsZXIpIHdvdWxk
IHJlZ2FyZCBhcyBlcnJvci4gQXMgYSByZXN1bHQsIHF1ZXVlLT5yeC5yc3BfY29ucyBpcyBzZXQK
aW5jb3JyZWN0bHkgYmVjYXVzZSBpdCBpcyB1cGRhdGVkIG9ubHkgd2hlbiB0aGVyZSBpcyBlcnJv
ci4gSWYgdGhlcmUgaXMgbm8KZXJyb3IsIHhlbm5ldF9wb2xsKCkgd291bGQgYmUgcmVzcG9uc2li
bGUgdG8gdXBkYXRlIHF1ZXVlLT5yeC5yc3BfY29ucy4KRmluYWxseSwgcXVldWUtPnJ4LnJzcF9j
b25zIHdvdWxkIHBvaW50IHRvIHRoZSByeCByaW5nIGJ1ZmZlciBlbnRyaWVzIHdob3NlCnF1ZXVl
LT5yeF9za2JzW2ldIGFuZCBxdWV1ZS0+Z3JhbnRfcnhfcmVmW2ldIGFyZSBhbHJlYWR5IGNsZWFy
ZWQgdG8gTlVMTC4KVGhpcyBsZWFkcyB0byBOVUxMIHBvaW50ZXIgYWNjZXNzIGluIHRoZSBuZXh0
IGl0ZXJhdGlvbiB0byBwcm9jZXNzIHJ4IHJpbmcKYnVmZmVyIGVudHJpZXMuCgpUaGUgc3ltcHRv
bSBpcyBzaW1pbGFyIHRvIHRoZSBvbmUgZml4ZWQgaW4KY29tbWl0IDAwYjM2ODUwMmQxOCAoInhl
bi1uZXRmcm9udDogZG8gbm90IGFzc3VtZSBza19idWZmX2hlYWQgbGlzdCBpcwplbXB0eSBpbiBl
cnJvciBoYW5kbGluZyIpLgoKVGhpcyBwYXRjaCBjaGFuZ2VzIHRoZSByZXR1cm4gdHlwZSBvZiB4
ZW5uZXRfZmlsbF9mcmFncygpIHRvIGluZGljYXRlCndoZXRoZXIgaXQgaXMgc3VjY2Vzc2Z1bCBv
ciBmYWlsZWQuIFRoZSBxdWV1ZS0+cngucnNwX2NvbnMgd2lsbCBiZQphbHdheXMgdXBkYXRlZCBp
bnNpZGUgdGhpcyBmdW5jdGlvbi4KCkZpeGVzOiBhZDRmMTVkYzJjNzAgKCJ4ZW4vbmV0ZnJvbnQ6
IGRvbid0IGJ1ZyBpbiBjYXNlIG9mIHRvbyBtYW55IGZyYWdzIikKU2lnbmVkLW9mZi1ieTogRG9u
Z2xpIFpoYW5nIDxkb25nbGkuemhhbmdAb3JhY2xlLmNvbT4KLS0tCkNoYW5nZWQgc2luY2UgdjE6
CiAgLSBBbHdheXMgdXBkYXRlIHF1ZXVlLT5yeC5yc3BfY29ucyBpbnNpZGUgeGVubmV0X2ZpbGxf
ZnJhZ3MoKSBzbyB3ZSBkbwogICAgbm90IG5lZWQgdG8gYWRkIGV4dHJhIGFyZ3VtZW50IHRvIHhl
bm5ldF9maWxsX2ZyYWdzKCkuCgogZHJpdmVycy9uZXQveGVuLW5ldGZyb250LmMgfCAxNyArKysr
KysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC94ZW4tbmV0ZnJvbnQuYyBiL2RyaXZlcnMv
bmV0L3hlbi1uZXRmcm9udC5jCmluZGV4IGUxNGVjNzUuLjQ4MmM2YzggMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jCisrKyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5j
CkBAIC04ODcsOSArODg3LDkgQEAgc3RhdGljIGludCB4ZW5uZXRfc2V0X3NrYl9nc28oc3RydWN0
IHNrX2J1ZmYgKnNrYiwKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIFJJTkdfSURYIHhlbm5ldF9m
aWxsX2ZyYWdzKHN0cnVjdCBuZXRmcm9udF9xdWV1ZSAqcXVldWUsCi0JCQkJICBzdHJ1Y3Qgc2tf
YnVmZiAqc2tiLAotCQkJCSAgc3RydWN0IHNrX2J1ZmZfaGVhZCAqbGlzdCkKK3N0YXRpYyBpbnQg
eGVubmV0X2ZpbGxfZnJhZ3Moc3RydWN0IG5ldGZyb250X3F1ZXVlICpxdWV1ZSwKKwkJCSAgICAg
c3RydWN0IHNrX2J1ZmYgKnNrYiwKKwkJCSAgICAgc3RydWN0IHNrX2J1ZmZfaGVhZCAqbGlzdCkK
IHsKIAlSSU5HX0lEWCBjb25zID0gcXVldWUtPnJ4LnJzcF9jb25zOwogCXN0cnVjdCBza19idWZm
ICpuc2tiOwpAQCAtOTA4LDcgKzkwOCw3IEBAIHN0YXRpYyBSSU5HX0lEWCB4ZW5uZXRfZmlsbF9m
cmFncyhzdHJ1Y3QgbmV0ZnJvbnRfcXVldWUgKnF1ZXVlLAogCQlpZiAodW5saWtlbHkoc2tiX3No
aW5mbyhza2IpLT5ucl9mcmFncyA+PSBNQVhfU0tCX0ZSQUdTKSkgewogCQkJcXVldWUtPnJ4LnJz
cF9jb25zID0gKytjb25zICsgc2tiX3F1ZXVlX2xlbihsaXN0KTsKIAkJCWtmcmVlX3NrYihuc2ti
KTsKLQkJCXJldHVybiB+MFU7CisJCQlyZXR1cm4gLUVOT0VOVDsKIAkJfQogCiAJCXNrYl9hZGRf
cnhfZnJhZyhza2IsIHNrYl9zaGluZm8oc2tiKS0+bnJfZnJhZ3MsCkBAIC05MTksNyArOTE5LDkg
QEAgc3RhdGljIFJJTkdfSURYIHhlbm5ldF9maWxsX2ZyYWdzKHN0cnVjdCBuZXRmcm9udF9xdWV1
ZSAqcXVldWUsCiAJCWtmcmVlX3NrYihuc2tiKTsKIAl9CiAKLQlyZXR1cm4gY29uczsKKwlxdWV1
ZS0+cngucnNwX2NvbnMgPSBjb25zOworCisJcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQgY2hl
Y2tzdW1fc2V0dXAoc3RydWN0IG5ldF9kZXZpY2UgKmRldiwgc3RydWN0IHNrX2J1ZmYgKnNrYikK
QEAgLTEwNDUsOCArMTA0Nyw3IEBAIHN0YXRpYyBpbnQgeGVubmV0X3BvbGwoc3RydWN0IG5hcGlf
c3RydWN0ICpuYXBpLCBpbnQgYnVkZ2V0KQogCQlza2ItPmRhdGFfbGVuID0gcngtPnN0YXR1czsK
IAkJc2tiLT5sZW4gKz0gcngtPnN0YXR1czsKIAotCQlpID0geGVubmV0X2ZpbGxfZnJhZ3MocXVl
dWUsIHNrYiwgJnRtcHEpOwotCQlpZiAodW5saWtlbHkoaSA9PSB+MFUpKQorCQlpZiAodW5saWtl
bHkoeGVubmV0X2ZpbGxfZnJhZ3MocXVldWUsIHNrYiwgJnRtcHEpKSkKIAkJCWdvdG8gZXJyOwog
CiAJCWlmIChyeC0+ZmxhZ3MgJiBYRU5fTkVUUlhGX2NzdW1fYmxhbmspCkBAIC0xMDU2LDcgKzEw
NTcsNyBAQCBzdGF0aWMgaW50IHhlbm5ldF9wb2xsKHN0cnVjdCBuYXBpX3N0cnVjdCAqbmFwaSwg
aW50IGJ1ZGdldCkKIAogCQlfX3NrYl9xdWV1ZV90YWlsKCZyeHEsIHNrYik7CiAKLQkJcXVldWUt
PnJ4LnJzcF9jb25zID0gKytpOworCQlpID0gKytxdWV1ZS0+cngucnNwX2NvbnM7CiAJCXdvcmtf
ZG9uZSsrOwogCX0KIAotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
