Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C8D128328
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 21:22:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiOjv-0007wF-Ni; Fri, 20 Dec 2019 20:19:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j5qM=2K=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1iiOju-0007wA-L2
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 20:19:10 +0000
X-Inumbo-ID: faab5076-2365-11ea-9400-12813bfff9fa
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id faab5076-2365-11ea-9400-12813bfff9fa;
 Fri, 20 Dec 2019 20:19:09 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBKK9mnC029367;
 Fri, 20 Dec 2019 20:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=78/5pRVrS/xQ9Q918kbc+VPNmvkeRkIojMFyy73vKho=;
 b=RVciOZntcbeUBXh79QKv/qFELXA7fKq4qxCo/rLeqiwVeV1IRu6yokljZEPmiWxwbGHm
 my9TOXMqGp0sqewbYjLBuEplkftmX4QeNRJ1VYivaotbvkpJe1tivQsGXWSgwdQ6UpIW
 D85LprIt9nxu3wDrF8P3/FaIUf8AKdQW5QHsLnHgiHKJm/bsXUXVTKwXnqRKnZ1mJzyH
 yoqghbu02bM2HDZD1QUyDXW3jMDULe5OEBWbWxvuWpnpSkG3ynSRB0HLUQuOhJwqxzEN
 xXeded6yYn34sQGewi+KNdniixhIt+1iGnp617tk/C7JMsK6wliVvTdNj/BXpxx7aNQn HQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2x01kntrwv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Dec 2019 20:19:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBKKEFpK187050;
 Fri, 20 Dec 2019 20:17:04 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2x0bgp3w0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Dec 2019 20:17:04 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xBKKH1T8015905;
 Fri, 20 Dec 2019 20:17:02 GMT
Received: from konrads-mbp.lan (/209.6.36.129)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 20 Dec 2019 12:17:01 -0800
Date: Fri, 20 Dec 2019 15:16:55 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20191220201655.GA6226@konrads-mbp.lan>
References: <20191220182339.9094-1-wipawel@amazon.de>
 <504cdd44-a977-8dde-d9f3-4210dbc25aa0@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <504cdd44-a977-8dde-d9f3-4210dbc25aa0@xen.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9477
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912200152
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9477
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912200152
Subject: Re: [Xen-devel] [PATCH] livepatch: Fix typos and other errors in
 tests Makefile
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
Cc: Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMjAsIDIwMTkgYXQgMDc6MTU6MzNQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIFBhd2VsLAo+IAo+IFRoYW5rIHlvdSBmb3IgZml4aW5nIHRoZSBidWlsZC4KPiAK
PiBPbiAyMC8xMi8yMDE5IDE4OjIzLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiA+IFRo
ZXJlIHdhcyBhIGJ1bmNoIG9mIHR5cG9zIChzL2FjdGlvbnMvYWN0aW9uLykgYXMgd2VsbCBhcyBv
bmUgbWlzc2luZwo+ID4gY29uZmlnLmggdGFyZ2V0IGRlcGVuZGVuY3kuIEFsc28sIHhlbl9leHBl
Y3RhdGlvbiB0YXJnZXQgaGFzCj4gPiB1bm5lY2Vzc2FyeSBjeWNsZSBkZXBlbmRlbmN5Lgo+IAo+
IEkgd291bGQgc3VnZ2VzdCB0byBtZW50aW9uIHdoaWNoIGNvbW1pdCB5b3VyIGFyZSBmaXhpbmcu
IEkgZ3Vlc3MgdGhlcmUgYXJlCj4gbXVsdGlwbGUgb25lcywgYnV0IHdlIGNvdWxkIGp1c3QgbWVu
dGlvbiB0aGUgbWVyZ2UgKGl0IGlzIGF0IGxlYXN0IHVzZWZ1bAo+IGZvciBzb21ldGhpbmchKS4K
PiAKPiBJIGd1ZXNzIHRoaXMgY291bGQgYmUgZml4ZWQgb24gY29tbWl0Lgo+IAo+ID4gCj4gPiBT
aWduZWQtb2ZmLWJ5OiBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+Cj4g
Cj4gVGVzdGVkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgoKClJldmlld2VkLWJ5
OiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CgpCdXQgSSBz
ZWUgaXQgaXMgYWxyZWFkeSBjaGVja2VkIGluLiBUaGFuayB5b3UgZm9yIGZpeGluZyB0aGF0IQo+
IAo+IENoZWVycywKPiAKPiAtLSAKPiBKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
