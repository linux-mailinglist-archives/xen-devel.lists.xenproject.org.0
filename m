Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E4BB33CC
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 05:48:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9hyH-0004bC-Ot; Mon, 16 Sep 2019 03:46:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LZJa=XL=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1i9hyG-0004b6-HM
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 03:46:36 +0000
X-Inumbo-ID: 94756318-d834-11e9-95d5-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94756318-d834-11e9-95d5-12813bfff9fa;
 Mon, 16 Sep 2019 03:46:35 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8G3hwwY088447;
 Mon, 16 Sep 2019 03:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2019-08-05;
 bh=vNyavF+kNZ2EentgkgqouBtUF5BzDxaCPrvgmTdCd9I=;
 b=EJ8AcB/CxPBGTcQoc8+e3QHx1tEnOtacfeXDsolfGqcNSw1+KYAIKekDctVymWYSHGgp
 nzo3mTPbLGBD25bGkQLamylSxDEwsDYIrdxVxMclkBe6mVaivW1p+babRcE7edhYCz01
 iyRJuIAGxjhgAAic9BOkK3RoBMpRkKJlPUrdK18cBHSWVbIiBknnLuTdw1/MmU1SLAv1
 ZbT8wFLNbZ4knovVYzL8ytn1S9i1KvMX40ddRi33MS+dIf1poZwL7XoDwaMnZC/aAdYI
 LM1yX/jg9zuqZleZ49OplYdJoS6MISONMWFLCqcelqx37Tf7iembWDCD0nI827hGSwB+ 5g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2v0ruqcrqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Sep 2019 03:46:26 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8G3hs2A195467;
 Mon, 16 Sep 2019 03:46:26 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2v0nb3tekb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Sep 2019 03:46:26 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x8G3kOHS018384;
 Mon, 16 Sep 2019 03:46:25 GMT
Received: from linux.cn.oracle.com (/10.182.69.106)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 15 Sep 2019 20:46:24 -0700
From: Dongli Zhang <dongli.zhang@oracle.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 16 Sep 2019 11:46:59 +0800
Message-Id: <1568605619-22219-1-git-send-email-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.7.4
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9381
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909160038
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9381
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909160039
Subject: [Xen-devel] [PATCH 1/1] xen-netfront: do not assume sk_buff_head
 list is empty in error handling
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
Cc: jgross@suse.com, sstabellini@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, davem@davemloft.net
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBza2Jfc2hpbmZvKHNrYikgaXMgbm90IGFibGUgdG8gY2FjaGUgZXh0cmEgZnJhZ21lbnQg
KHRoYXQgaXMsCnNrYl9zaGluZm8oc2tiKS0+bnJfZnJhZ3MgPj0gTUFYX1NLQl9GUkFHUyksIHhl
bm5ldF9maWxsX2ZyYWdzKCkgYXNzdW1lcwp0aGUgc2tfYnVmZl9oZWFkIGxpc3QgaXMgYWxyZWFk
eSBlbXB0eS4gQXMgYSByZXN1bHQsIGNvbnMgaXMgaW5jcmVhc2VkIG9ubHkKYnkgMSBhbmQgcmV0
dXJucyB0byBlcnJvciBoYW5kbGluZyBwYXRoIGluIHhlbm5ldF9wb2xsKCkuCgpIb3dldmVyLCBp
ZiB0aGUgc2tfYnVmZl9oZWFkIGxpc3QgaXMgbm90IGVtcHR5LCBxdWV1ZS0+cngucnNwX2NvbnMg
bWF5IGJlCnNldCBpbmNvcnJlY3RseS4gVGhhdCBpcywgcXVldWUtPnJ4LnJzcF9jb25zIHdvdWxk
IHBvaW50IHRvIHRoZSByeCByaW5nCmJ1ZmZlciBlbnRyaWVzIHdob3NlIHF1ZXVlLT5yeF9za2Jz
W2ldIGFuZCBxdWV1ZS0+Z3JhbnRfcnhfcmVmW2ldIGFyZQphbHJlYWR5IGNsZWFyZWQgdG8gTlVM
TC4gVGhpcyBsZWFkcyB0byBOVUxMIHBvaW50ZXIgYWNjZXNzIGluIHRoZSBuZXh0Cml0ZXJhdGlv
biB0byBwcm9jZXNzIHJ4IHJpbmcgYnVmZmVyIGVudHJpZXMuCgpCZWxvdyBpcyBob3cgeGVubmV0
X3BvbGwoKSBkb2VzIGVycm9yIGhhbmRsaW5nLiBBbGwgcmVtYWluaW5nIGVudHJpZXMgaW4KdG1w
cSBhcmUgYWNjb3VudGVkIHRvIHF1ZXVlLT5yeC5yc3BfY29ucyB3aXRob3V0IGFzc3VtaW5nIGhv
dyBtYW55Cm91dHN0YW5kaW5nIHNrYnMgYXJlIHJlbWFpbmVkIGluIHRoZSBsaXN0LgoKIDk4NSBz
dGF0aWMgaW50IHhlbm5ldF9wb2xsKHN0cnVjdCBuYXBpX3N0cnVjdCAqbmFwaSwgaW50IGJ1ZGdl
dCkKLi4uIC4uLgoxMDMyICAgICAgICAgICBpZiAodW5saWtlbHkoeGVubmV0X3NldF9za2JfZ3Nv
KHNrYiwgZ3NvKSkpIHsKMTAzMyAgICAgICAgICAgICAgICAgICBfX3NrYl9xdWV1ZV9oZWFkKCZ0
bXBxLCBza2IpOwoxMDM0ICAgICAgICAgICAgICAgICAgIHF1ZXVlLT5yeC5yc3BfY29ucyArPSBz
a2JfcXVldWVfbGVuKCZ0bXBxKTsKMTAzNSAgICAgICAgICAgICAgICAgICBnb3RvIGVycjsKMTAz
NiAgICAgICAgICAgfQoKSXQgaXMgYmV0dGVyIHRvIGFsd2F5cyBoYXZlIHRoZSBlcnJvciBoYW5k
bGluZyBpbiB0aGUgc2FtZSB3YXkuCgpGaXhlczogYWQ0ZjE1ZGMyYzcwICgieGVuL25ldGZyb250
OiBkb24ndCBidWcgaW4gY2FzZSBvZiB0b28gbWFueSBmcmFncyIpClNpZ25lZC1vZmYtYnk6IERv
bmdsaSBaaGFuZyA8ZG9uZ2xpLnpoYW5nQG9yYWNsZS5jb20+Ci0tLQogZHJpdmVycy9uZXQveGVu
LW5ldGZyb250LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC94ZW4tbmV0ZnJvbnQuYyBiL2RyaXZl
cnMvbmV0L3hlbi1uZXRmcm9udC5jCmluZGV4IDhkMzM5NzAuLjVmNTcyMmIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jCisrKyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRmcm9u
dC5jCkBAIC05MDYsNyArOTA2LDcgQEAgc3RhdGljIFJJTkdfSURYIHhlbm5ldF9maWxsX2ZyYWdz
KHN0cnVjdCBuZXRmcm9udF9xdWV1ZSAqcXVldWUsCiAJCQlfX3Bza2JfcHVsbF90YWlsKHNrYiwg
cHVsbF90byAtIHNrYl9oZWFkbGVuKHNrYikpOwogCQl9CiAJCWlmICh1bmxpa2VseShza2Jfc2hp
bmZvKHNrYiktPm5yX2ZyYWdzID49IE1BWF9TS0JfRlJBR1MpKSB7Ci0JCQlxdWV1ZS0+cngucnNw
X2NvbnMgPSArK2NvbnM7CisJCQlxdWV1ZS0+cngucnNwX2NvbnMgPSArK2NvbnMgKyBza2JfcXVl
dWVfbGVuKGxpc3QpOwogCQkJa2ZyZWVfc2tiKG5za2IpOwogCQkJcmV0dXJuIH4wVTsKIAkJfQot
LSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
