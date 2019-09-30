Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4182DC1C4D
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 09:48:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEqMP-0007Hp-No; Mon, 30 Sep 2019 07:44:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lumL=XZ=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1iEqMO-0007Hk-FV
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 07:44:44 +0000
X-Inumbo-ID: 2a9cac76-e356-11e9-97fb-bc764e2007e4
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by localhost (Halon) with ESMTPS
 id 2a9cac76-e356-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 07:44:43 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8U7i9bK157904;
 Mon, 30 Sep 2019 07:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2019-08-05;
 bh=E1+AZyCgUqnQ9IKyi0G2G7XawCcrfnF8283UFDFFdrk=;
 b=qdV6WffL8Rwfaz7N3i/T/9eJYQa6GILhkNP9fZ/+zhSt/+g+M6YaV+4MjdXw5xaYS5sy
 z9dZyhhViOxvCSQf0MhCU0BEINo8bHjFiXMNykVtuD8LC3WTQpoKLGSMhi2TUPgROIn3
 jEP4COMyPS5Ze5dWdjbODKNlx/tE/TA5Sy5Es8MTQLWLqlX0tR8jpwuDTHx5W7zLXTK9
 NnAkJbLCjfF4/m5H9IwYQhOnuOlNgvmsbtsOywyt7+wxbe5Wsvvf3dWIzUHrkSjFBAur
 hNpKxMGxK6+FqYQYzhAzf2Li+1nKwVwzAUuuP9EbWSZURPmSTsC8V+PT08Y9Wge1eRqZ wQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2v9xxud1b8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Sep 2019 07:44:35 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8U7iR5J152532;
 Mon, 30 Sep 2019 07:44:34 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2vayqwd0uk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Sep 2019 07:44:33 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8U7i6Ql003170;
 Mon, 30 Sep 2019 07:44:06 GMT
Received: from linux.cn.oracle.com (/10.182.69.106)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 30 Sep 2019 00:44:05 -0700
From: Dongli Zhang <dongli.zhang@oracle.com>
To: xen-devel@lists.xenproject.org, netdev@vger.kernel.org
Date: Mon, 30 Sep 2019 15:44:29 +0800
Message-Id: <1569829469-16143-1-git-send-email-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.7.4
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9395
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=882
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909300082
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9395
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=964 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909300083
Subject: [Xen-devel] [PATCH 1/1] xen-netfront: do not use ~0U as error
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
cnJvciBoYW5kbGluZyIpLgoKVGhpcyBwYXRjaCB1c2VzIGFuIGV4dHJhIGFyZ3VtZW50IHRvIGhl
bHAgcmV0dXJuIGlmIHRoZXJlIGlzIGVycm9yIGluCnhlbm5ldF9maWxsX2ZyYWdzKCkuCgpGaXhl
czogYWQ0ZjE1ZGMyYzcwICgieGVuL25ldGZyb250OiBkb24ndCBidWcgaW4gY2FzZSBvZiB0b28g
bWFueSBmcmFncyIpClNpZ25lZC1vZmYtYnk6IERvbmdsaSBaaGFuZyA8ZG9uZ2xpLnpoYW5nQG9y
YWNsZS5jb20+Ci0tLQogZHJpdmVycy9uZXQveGVuLW5ldGZyb250LmMgfCAxMiArKysrKysrKyst
LS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9uZXQveGVuLW5ldGZyb250LmMgYi9kcml2ZXJzL25ldC94ZW4tbmV0
ZnJvbnQuYwppbmRleCBlMTRlYzc1Li5jMmExZTA5IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC94
ZW4tbmV0ZnJvbnQuYworKysgYi9kcml2ZXJzL25ldC94ZW4tbmV0ZnJvbnQuYwpAQCAtODg5LDEx
ICs4ODksMTQgQEAgc3RhdGljIGludCB4ZW5uZXRfc2V0X3NrYl9nc28oc3RydWN0IHNrX2J1ZmYg
KnNrYiwKIAogc3RhdGljIFJJTkdfSURYIHhlbm5ldF9maWxsX2ZyYWdzKHN0cnVjdCBuZXRmcm9u
dF9xdWV1ZSAqcXVldWUsCiAJCQkJICBzdHJ1Y3Qgc2tfYnVmZiAqc2tiLAotCQkJCSAgc3RydWN0
IHNrX2J1ZmZfaGVhZCAqbGlzdCkKKwkJCQkgIHN0cnVjdCBza19idWZmX2hlYWQgKmxpc3QsCisJ
CQkJICBpbnQgKmVycm5vKQogewogCVJJTkdfSURYIGNvbnMgPSBxdWV1ZS0+cngucnNwX2NvbnM7
CiAJc3RydWN0IHNrX2J1ZmYgKm5za2I7CiAKKwkqZXJybm8gPSAwOworCiAJd2hpbGUgKChuc2ti
ID0gX19za2JfZGVxdWV1ZShsaXN0KSkpIHsKIAkJc3RydWN0IHhlbl9uZXRpZl9yeF9yZXNwb25z
ZSAqcnggPQogCQkJUklOR19HRVRfUkVTUE9OU0UoJnF1ZXVlLT5yeCwgKytjb25zKTsKQEAgLTkw
OCw2ICs5MTEsNyBAQCBzdGF0aWMgUklOR19JRFggeGVubmV0X2ZpbGxfZnJhZ3Moc3RydWN0IG5l
dGZyb250X3F1ZXVlICpxdWV1ZSwKIAkJaWYgKHVubGlrZWx5KHNrYl9zaGluZm8oc2tiKS0+bnJf
ZnJhZ3MgPj0gTUFYX1NLQl9GUkFHUykpIHsKIAkJCXF1ZXVlLT5yeC5yc3BfY29ucyA9ICsrY29u
cyArIHNrYl9xdWV1ZV9sZW4obGlzdCk7CiAJCQlrZnJlZV9za2IobnNrYik7CisJCQkqZXJybm8g
PSAtRU5PRU5UOwogCQkJcmV0dXJuIH4wVTsKIAkJfQogCkBAIC0xMDA5LDYgKzEwMTMsOCBAQCBz
dGF0aWMgaW50IHhlbm5ldF9wb2xsKHN0cnVjdCBuYXBpX3N0cnVjdCAqbmFwaSwgaW50IGJ1ZGdl
dCkKIAlpID0gcXVldWUtPnJ4LnJzcF9jb25zOwogCXdvcmtfZG9uZSA9IDA7CiAJd2hpbGUgKChp
ICE9IHJwKSAmJiAod29ya19kb25lIDwgYnVkZ2V0KSkgeworCQlpbnQgZXJybm87CisKIAkJbWVt
Y3B5KHJ4LCBSSU5HX0dFVF9SRVNQT05TRSgmcXVldWUtPnJ4LCBpKSwgc2l6ZW9mKCpyeCkpOwog
CQltZW1zZXQoZXh0cmFzLCAwLCBzaXplb2YocmluZm8uZXh0cmFzKSk7CiAKQEAgLTEwNDUsOCAr
MTA1MSw4IEBAIHN0YXRpYyBpbnQgeGVubmV0X3BvbGwoc3RydWN0IG5hcGlfc3RydWN0ICpuYXBp
LCBpbnQgYnVkZ2V0KQogCQlza2ItPmRhdGFfbGVuID0gcngtPnN0YXR1czsKIAkJc2tiLT5sZW4g
Kz0gcngtPnN0YXR1czsKIAotCQlpID0geGVubmV0X2ZpbGxfZnJhZ3MocXVldWUsIHNrYiwgJnRt
cHEpOwotCQlpZiAodW5saWtlbHkoaSA9PSB+MFUpKQorCQlpID0geGVubmV0X2ZpbGxfZnJhZ3Mo
cXVldWUsIHNrYiwgJnRtcHEsICZlcnJubyk7CisJCWlmICh1bmxpa2VseShlcnJubyA9PSAtRU5P
RU5UKSkKIAkJCWdvdG8gZXJyOwogCiAJCWlmIChyeC0+ZmxhZ3MgJiBYRU5fTkVUUlhGX2NzdW1f
YmxhbmspCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
