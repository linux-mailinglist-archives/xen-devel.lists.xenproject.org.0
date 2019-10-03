Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90915CADEB
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 20:15:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iG5aQ-0000uq-Sc; Thu, 03 Oct 2019 18:12:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WycG=X4=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1iG5aO-0000ul-VA
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 18:12:21 +0000
X-Inumbo-ID: 56470168-e609-11e9-9730-12813bfff9fa
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56470168-e609-11e9-9730-12813bfff9fa;
 Thu, 03 Oct 2019 18:12:19 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x93HsYMW089402;
 Thu, 3 Oct 2019 18:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2019-08-05; bh=bs57jL07nzAKqfhU6u+MUrWsx1PltL4Qn+aLCBDHeOE=;
 b=XxAq3iVAqPyJHd22CISPSL1FT5sD9yclaDy2qGzbWLn2FKLaYO3orGq48o4jUYx26bi0
 rwldv7VsCbThyxzi/aINlUpFALi3NGFLvJKb9dCJjHhkrzz44iCmCYDQngxbhA3WeAXE
 VO5x4N0QBn79AsRnz2yQXr1PQvA0L79mNNEur36yPLaeNRlm64q1SE9sf5Nrmz6YgGBM
 qW57b1hVKowS00UpHoea7j4aaMndKQJfOPuHtZI8ABg/fTxjhrsIpsVMrsOT19mENk7i
 QY/kxMF4qZuBXIh+kwP+uVbu4kF5M+lLsD4KGdWpa68aQ+pVmQ3gtVjorHNPJ4OuEXGf WQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2v9xxv658v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Oct 2019 18:12:14 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x93Hwdqr074410;
 Thu, 3 Oct 2019 18:12:13 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2vcx72wd3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Oct 2019 18:12:13 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x93ICCXt013176;
 Thu, 3 Oct 2019 18:12:12 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 03 Oct 2019 11:12:12 -0700
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Date: Thu,  3 Oct 2019 14:12:03 -0400
Message-Id: <20191003181203.22405-1-boris.ostrovsky@oracle.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9399
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910030151
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9399
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910030151
Subject: [Xen-devel] [PATCH v2] x86/xen: Return from panic notifier
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
Cc: jgross@suse.com, jbeulich@suse.com, james@dingwall.me.uk
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
bC4KCk5ldmVydGhlbGVzcywgd2Ugd2lsbCBwcm92aWRlIHhlbl9sZWdhY3lfY3Jhc2ggYm9vdCBv
cHRpb24gdGhhdCB3aWxsCnByZXNlcnZlIG9yaWdpbmFsIGJlaGF2aW9yIGR1cmluZyBjcmFzaC4g
VGhpcyBvcHRpb24gY291bGQgYmUgdXNlZCwKZm9yIGV4YW1wbGUsIGlmIHJ1bm5pbmcga2VybmVs
IGR1bXBlciAod2hpY2ggaGFwcGVucyBhZnRlciBwYW5pYwpub3RpZmllcnMpIGlzIHVuZGVzaXJh
YmxlLgoKUmVwb3J0ZWQtYnk6IEphbWVzIERpbmd3YWxsIDxqYW1lc0BkaW5nd2FsbC5tZS51az4K
U2lnbmVkLW9mZi1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNv
bT4KLS0tCgp2MjogQWRkZWQgeGVuX2xlZ2FjeV9jcmFzaCBib290IG9wdGlvbiB0byBwcmVzZXJ2
ZSBjdXJyZW50IGJlaGF2aW91ci4gTXkKZWFybGllciBzdWdnZXN0aW9uIHRvIGNyZWF0ZSBhbiBl
eHRlcm5hbCBkdW1wZXIgKGZvciBYZW4gdG9vbHN0YWNrKQpoYWQgc29tZSBjb3JuZXIgY2FzZXMg
YW5kIGRlYWxpbmcgd2l0aCB0aGVtIHdhcyBiZWNvbWluZyB0b28gbXVjaCBsb2dpYwpmb3IgbXkg
dGFzdGUuCgoKIC4uLi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgICAgICAgICB8
ICA0ICsrKwogYXJjaC94ODYveGVuL2VubGlnaHRlbi5jICAgICAgICAgICAgICAgICAgICAgIHwg
MjggKysrKysrKysrKysrKysrKystLQogMiBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUv
a2VybmVsLXBhcmFtZXRlcnMudHh0IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwt
cGFyYW1ldGVycy50eHQKaW5kZXggNGMxOTcxOTYwYWZhLi41ZWEwMDVjOWUyZDYgMTAwNjQ0Ci0t
LSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0CisrKyBi
L0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0CkBAIC01MjY3
LDYgKzUyNjcsMTAgQEAKIAkJCQl0aGUgdW5wbHVnIHByb3RvY29sCiAJCQluZXZlciAtLSBkbyBu
b3QgdW5wbHVnIGV2ZW4gaWYgdmVyc2lvbiBjaGVjayBzdWNjZWVkcwogCisJeGVuX2xlZ2FjeV9j
cmFzaAlbWDg2LFhFTl0KKwkJCUNyYXNoIGZyb20gWGVuIHBhbmljIG5vdGlmaWVyLCB3aXRob3V0
IGV4ZWN1dGluZyBsYXRlCisJCQlwYW5pYygpIGNvZGUgc3VjaCBhcyBkdW1waW5nIGhhbmRsZXIu
CisKIAl4ZW5fbm9wdnNwaW4JW1g4NixYRU5dCiAJCQlEaXNhYmxlcyB0aGUgdGlja2V0bG9jayBz
bG93cGF0aCB1c2luZyBYZW4gUFYKIAkJCW9wdGltaXphdGlvbnMuCmRpZmYgLS1naXQgYS9hcmNo
L3g4Ni94ZW4vZW5saWdodGVuLmMgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuLmMKaW5kZXggNzUw
ZjQ2YWQwMThhLi4yMDViMTE3NjA4NGYgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0
ZW4uYworKysgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuLmMKQEAgLTI2OSwxOSArMjY5LDQxIEBA
IHZvaWQgeGVuX3JlYm9vdChpbnQgcmVhc29uKQogCQlCVUcoKTsKIH0KIAorc3RhdGljIGludCBy
ZWJvb3RfcmVhc29uID0gU0hVVERPV05fcmVib290Oworc3RhdGljIGJvb2wgeGVuX2xlZ2FjeV9j
cmFzaDsKIHZvaWQgeGVuX2VtZXJnZW5jeV9yZXN0YXJ0KHZvaWQpCiB7Ci0JeGVuX3JlYm9vdChT
SFVURE9XTl9yZWJvb3QpOworCXhlbl9yZWJvb3QocmVib290X3JlYXNvbik7CiB9CiAKIHN0YXRp
YyBpbnQKIHhlbl9wYW5pY19ldmVudChzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKnRoaXMsIHVuc2ln
bmVkIGxvbmcgZXZlbnQsIHZvaWQgKnB0cikKIHsKLQlpZiAoIWtleGVjX2NyYXNoX2xvYWRlZCgp
KQotCQl4ZW5fcmVib290KFNIVVRET1dOX2NyYXNoKTsKKwlpZiAoIWtleGVjX2NyYXNoX2xvYWRl
ZCgpKSB7CisJCWlmICh4ZW5fbGVnYWN5X2NyYXNoKQorCQkJeGVuX3JlYm9vdChTSFVURE9XTl9j
cmFzaCk7CisKKwkJcmVib290X3JlYXNvbiA9IFNIVVRET1dOX2NyYXNoOworCisJCS8qCisJCSAq
IElmIHBhbmljX3RpbWVvdXQ9PTAgdGhlbiB3ZSBhcmUgc3VwcG9zZWQgdG8gd2FpdCBmb3JldmVy
LgorCQkgKiBIb3dldmVyLCB0byBwcmVzZXJ2ZSBvcmlnaW5hbCBkb20wIGJlaGF2aW9yIHdlIGhh
dmUgdG8gZHJvcAorCQkgKiBpbnRvIGh5cGVydmlzb3IuIChkb21VIGJlaGF2aW9yIGlzIGNvbnRy
b2xsZWQgYnkgaXRzCisJCSAqIGNvbmZpZyBmaWxlKQorCQkgKi8KKwkJaWYgKHBhbmljX3RpbWVv
dXQgPT0gMCkKKwkJCXBhbmljX3RpbWVvdXQgPSAtMTsKKwl9CiAJcmV0dXJuIE5PVElGWV9ET05F
OwogfQogCitzdGF0aWMgaW50IF9faW5pdCBwYXJzZV94ZW5fbGVnYWN5X2NyYXNoKGNoYXIgKmFy
ZykKK3sKKwl4ZW5fbGVnYWN5X2NyYXNoID0gdHJ1ZTsKKwlyZXR1cm4gMDsKK30KK2Vhcmx5X3Bh
cmFtKCJ4ZW5fbGVnYWN5X2NyYXNoIiwgcGFyc2VfeGVuX2xlZ2FjeV9jcmFzaCk7CisKIHN0YXRp
YyBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgeGVuX3BhbmljX2Jsb2NrID0gewogCS5ub3RpZmllcl9j
YWxsID0geGVuX3BhbmljX2V2ZW50LAogCS5wcmlvcml0eSA9IElOVF9NSU4KLS0gCjIuMTcuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
