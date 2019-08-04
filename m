Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A6B80F66
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 01:32:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huPwW-0001ZJ-HK; Sun, 04 Aug 2019 23:29:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E3+P=WA=oracle.com=calum.mackay@srs-us1.protection.inumbo.net>)
 id 1huPwV-0001ZB-B0
 for xen-devel@lists.xenproject.org; Sun, 04 Aug 2019 23:29:35 +0000
X-Inumbo-ID: b72c8a96-b70f-11e9-8980-bc764e045a96
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b72c8a96-b70f-11e9-8980-bc764e045a96;
 Sun, 04 Aug 2019 23:29:33 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x74NNpc9062157;
 Sun, 4 Aug 2019 23:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=cc : subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=Xv/Xmfe6YA+uiUXCTMOrvz+2cmMCgKpadUjchsyGSqE=;
 b=Q8jHS5LyGioVRXkw2sEGxpCJ0g6RThcXNJNhQ+zIt1yN9QAbG9oidwXBknqGefI/Gzo9
 By4AgfVTCnBhziiCIa41vp2Km7uJGUaiXbbnEbFOGJu/tindREq8cqQoMC9pE39KJmFC
 pbJGax0NRp2J6BU7Wqa2MYOikJcTOlvo6BuaJMMnG/rkz+mFpRP2aBj29SOQtqfHNiyp
 Oiqh3Pja48Hg208XzAKVGnWgaY0bM8E6Jd5XgoYoeEDXsXo8GsiLTw4ZRpe3pTL5xLes
 aQ1Owfq77tOFIMZ2lazrtAcx+SAXXLqcnJIeXpem2RoPun+jIzPsLiAZSgR10i43pZcT 6Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2u527pc4c4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 04 Aug 2019 23:28:16 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x74NRrau079768;
 Sun, 4 Aug 2019 23:28:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 2u50abah84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 04 Aug 2019 23:28:16 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x74NSFYX079993;
 Sun, 4 Aug 2019 23:28:15 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2u50abah81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 04 Aug 2019 23:28:15 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x74NSAcc031730;
 Sun, 4 Aug 2019 23:28:10 GMT
Received: from mbp2018.cdmnet.org (/82.27.120.181)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 04 Aug 2019 16:28:10 -0700
To: John Hubbard <jhubbard@nvidia.com>, john.hubbard@gmail.com,
 Andrew Morton <akpm@linux-foundation.org>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802022005.5117-32-jhubbard@nvidia.com>
 <1738cb1e-15d8-0bbe-5362-341664f6efc8@oracle.com>
 <db136399-ed87-56ea-bd6e-e5d29b145eda@nvidia.com>
From: Calum Mackay <calum.mackay@oracle.com>
Organization: Oracle
Message-ID: <03a81556-98a7-7edb-5989-b799ec99a072@oracle.com>
Date: Mon, 5 Aug 2019 00:28:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:70.0)
 Gecko/20100101 Thunderbird/70.0a1
MIME-Version: 1.0
In-Reply-To: <db136399-ed87-56ea-bd6e-e5d29b145eda@nvidia.com>
Content-Language: en-GB
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9339
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908040274
Subject: Re: [Xen-devel] [PATCH 31/34] nfs: convert put_page() to
 put_user_page*()
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 calum.mackay@oracle.com, devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Dan Williams <dan.j.williams@intel.com>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMDgvMjAxOSAyOjQxIGFtLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4gT24gOC8yLzE5IDY6
MjcgUE0sIENhbHVtIE1hY2theSB3cm90ZToKPj4gT24gMDIvMDgvMjAxOSAzOjIwIGFtLCBqb2hu
Lmh1YmJhcmRAZ21haWwuY29tIHdyb3RlOgo+IC4uLgo+PiBTaW5jZSBpdCdzIHN0YXRpYywgYW5k
IG9ubHkgY2FsbGVkIHR3aWNlLCBtaWdodCBpdCBiZSBiZXR0ZXIgdG8gY2hhbmdlIGl0cyB0d28g
Y2FsbGVycyBbbmZzX2RpcmVjdF97cmVhZCx3cml0ZX1fc2NoZWR1bGVfaW92ZWMoKV0gdG8gY2Fs
bCBwdXRfdXNlcl9wYWdlcygpIGRpcmVjdGx5LCBhbmQgcmVtb3ZlIG5mc19kaXJlY3RfcmVsZWFz
ZV9wYWdlcygpIGVudGlyZWx5Pwo+Pgo+PiB0aGFua3MsCj4+IGNhbHVtLgo+Pgo+Pgo+Pj4gIMKg
IMKgIHZvaWQgbmZzX2luaXRfY2luZm9fZnJvbV9kcmVxKHN0cnVjdCBuZnNfY29tbWl0X2luZm8g
KmNpbmZvLAo+Pj4KPiAgIAo+IEhpIENhbHVtLAo+IAo+IEFic29sdXRlbHkhIElzIGl0IE9LIHRv
IGFkZCB5b3VyIHJldmlld2VkLWJ5LCB3aXRoIHRoZSBmb2xsb3dpbmcgaW5jcmVtZW50YWwKPiBw
YXRjaCBtYWRlIHRvIHRoaXMgb25lPwoKVGhhbmtzIEpvaG47IGxvb2tzIGdvb2QuCgpSZXZpZXdl
ZC1ieTogQ2FsdW0gTWFja2F5IDxjYWx1bS5tYWNrYXlAb3JhY2xlLmNvbT4KCj4gCj4gZGlmZiAt
LWdpdCBhL2ZzL25mcy9kaXJlY3QuYyBiL2ZzL25mcy9kaXJlY3QuYwo+IGluZGV4IGIwMGI4OWRk
YTNjNS4uYzBjMWI5ZjJjMDY5IDEwMDY0NAo+IC0tLSBhL2ZzL25mcy9kaXJlY3QuYwo+ICsrKyBi
L2ZzL25mcy9kaXJlY3QuYwo+IEBAIC0yNzYsMTEgKzI3Niw2IEBAIHNzaXplX3QgbmZzX2RpcmVj
dF9JTyhzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAqaXRlcikKPiAgICAgICAg
ICByZXR1cm4gbmZzX2ZpbGVfZGlyZWN0X3dyaXRlKGlvY2IsIGl0ZXIpOwo+ICAgfQo+ICAgCj4g
LXN0YXRpYyB2b2lkIG5mc19kaXJlY3RfcmVsZWFzZV9wYWdlcyhzdHJ1Y3QgcGFnZSAqKnBhZ2Vz
LCB1bnNpZ25lZCBpbnQgbnBhZ2VzKQo+IC17Cj4gLSAgICAgICBwdXRfdXNlcl9wYWdlcyhwYWdl
cywgbnBhZ2VzKTsKPiAtfQo+IC0KPiAgIHZvaWQgbmZzX2luaXRfY2luZm9fZnJvbV9kcmVxKHN0
cnVjdCBuZnNfY29tbWl0X2luZm8gKmNpbmZvLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgbmZzX2RpcmVjdF9yZXEgKmRyZXEpCj4gICB7Cj4gQEAgLTUxMCw3ICs1MDUs
NyBAQCBzdGF0aWMgc3NpemVfdCBuZnNfZGlyZWN0X3JlYWRfc2NoZWR1bGVfaW92ZWMoc3RydWN0
IG5mc19kaXJlY3RfcmVxICpkcmVxLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICBwb3MgKz0g
cmVxX2xlbjsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgZHJlcS0+Ynl0ZXNfbGVmdCAtPSBy
ZXFfbGVuOwo+ICAgICAgICAgICAgICAgICAgfQo+IC0gICAgICAgICAgICAgICBuZnNfZGlyZWN0
X3JlbGVhc2VfcGFnZXMocGFnZXZlYywgbnBhZ2VzKTsKPiArICAgICAgICAgICAgICAgcHV0X3Vz
ZXJfcGFnZXMocGFnZXZlYywgbnBhZ2VzKTsKPiAgICAgICAgICAgICAgICAgIGt2ZnJlZShwYWdl
dmVjKTsKPiAgICAgICAgICAgICAgICAgIGlmIChyZXN1bHQgPCAwKQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICBicmVhazsKPiBAQCAtOTMzLDcgKzkyOCw3IEBAIHN0YXRpYyBzc2l6ZV90IG5m
c19kaXJlY3Rfd3JpdGVfc2NoZWR1bGVfaW92ZWMoc3RydWN0IG5mc19kaXJlY3RfcmVxICpkcmVx
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICBwb3MgKz0gcmVxX2xlbjsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgZHJlcS0+Ynl0ZXNfbGVmdCAtPSByZXFfbGVuOwo+ICAgICAgICAgICAg
ICAgICAgfQo+IC0gICAgICAgICAgICAgICBuZnNfZGlyZWN0X3JlbGVhc2VfcGFnZXMocGFnZXZl
YywgbnBhZ2VzKTsKPiArICAgICAgICAgICAgICAgcHV0X3VzZXJfcGFnZXMocGFnZXZlYywgbnBh
Z2VzKTsKPiAgICAgICAgICAgICAgICAgIGt2ZnJlZShwYWdldmVjKTsKPiAgICAgICAgICAgICAg
ICAgIGlmIChyZXN1bHQgPCAwKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiAK
PiAKPiAKPiB0aGFua3MsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
