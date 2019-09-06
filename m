Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DD5ABB41
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 16:44:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6FQc-0002mY-EE; Fri, 06 Sep 2019 14:41:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6vzo=XB=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1i6FQb-0002mP-C0
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 14:41:33 +0000
X-Inumbo-ID: 6b328a8a-d0b4-11e9-b76c-bc764e2007e4
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b328a8a-d0b4-11e9-b76c-bc764e2007e4;
 Fri, 06 Sep 2019 14:41:32 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x86Ed6m5079684;
 Fri, 6 Sep 2019 14:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=y8TtBHLyh9FaXB7YWA2oSVkXqqAPTbDmmbDnNI16F7o=;
 b=DOF557n5O1G3LePDNwr0JmO+vUm1GxrH6KN/LwtR3hkP3O/j3iy8egyMpJJWrEE044Ms
 63u4oumZ8oks/ZQRt7gfi0pK7vIAlULQAqYOtlGhhrRO2AZGGB3aE1kS0SNn+hXG9h2j
 0e2sQGNUvzrsaDZFQ6WFwgwhQrFW5urHG0xRcT9U5UnygFZRpuhg1toZ5VtMpqbhEJdX
 KtuV4y/6mgxs7wmro5Da451nB8UjHcp+oaXbc6Bq5IEq+BnYuuiB0W22oulaN3NFJ5sQ
 nCF9axdCfZyMG1fkwd20WASjft3Kw2kS6qExeFXgNQ6OKHyjfNOrCMLbrU9vRwOEetaz OQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2uus55048m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Sep 2019 14:41:20 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x86Ed28j110378;
 Fri, 6 Sep 2019 14:41:20 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2uum4h555m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Sep 2019 14:41:20 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x86EfIvV032549;
 Fri, 6 Sep 2019 14:41:18 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 06 Sep 2019 07:41:17 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id BD96F6A00C1; Fri,  6 Sep 2019 10:43:00 -0400 (EDT)
Date: Fri, 6 Sep 2019 10:43:00 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <20190906144300.GD7824@char.us.oracle.com>
References: <20190905113408.3104-1-hch@lst.de>
 <20190905113408.3104-10-hch@lst.de>
 <e4f9b393-2631-57cd-f42f-3581e75ab9a3@oracle.com>
 <20190906140123.GA9894@lst.de>
 <ca88e7b8-08ca-51b2-0c77-c828d92da0db@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca88e7b8-08ca-51b2-0c77-c828d92da0db@oracle.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9372
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=829
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909060155
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9372
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=893 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909060155
Subject: Re: [Xen-devel] [PATCH 09/11] swiotlb-xen: simplify cache
 maintainance
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMTA6MTk6MDFBTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+IE9uIDkvNi8xOSAxMDowMSBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4g
PiBPbiBGcmksIFNlcCAwNiwgMjAxOSBhdCAwOTo1MjoxMkFNIC0wNDAwLCBCb3JpcyBPc3Ryb3Zz
a3kgd3JvdGU6Cj4gPj4gV2UgbmVlZCBub3AgZGVmaW5pdGlvbnMgb2YgdGhlc2UgdHdvIGZvciB4
ODYuCj4gPj4KPiA+PiBFdmVyeXRoaW5nIGJ1aWxkcyBub3cgYnV0IHRoYXQncyBwcm9iYWJseSBi
ZWNhdXNlIHRoZSBjYWxscyBhcmUgdW5kZXIKPiA+PiAnaWYgKCFkZXZfaXNfZG1hX2NvaGVyZW50
KGRldikpJyB3aGljaCBpcyBhbHdheXMgZmFsc2Ugc28gY29tcGlsZXIKPiA+PiBvcHRpbWl6ZWQg
aXMgb3V0LiBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCByZWx5IG9uIHRoYXQuCj4gPiBUaGF0IGlz
IGhvdyBhIGxvdCBvZiB0aGUga2VybmVsIHdvcmtzLiAgUHJvdmlkZSBwcm90eXBlcyBvbmx5IGZv
ciBjb2RlCj4gPiB0aGF0IGlzIHNlbWFudGljYWxseSBjb21waWxlZCwgYnV0IGNhbid0IGV2ZXIg
YmUgY2FsbGVkIGR1ZSB0bwo+ID4gSVNfRU5BQkxFRCgpIGNoZWNrcy4gIEl0IHRvb2sgbWUgYSB3
aGlsZSB0byBnZXQgdXNlZCB0byBpdCwgYnV0IGl0Cj4gPiBhY3R1YWxseSBpcyBwcmV0dHkgbmlj
ZSBhcyB0aGUgbGlua2VyIGRvZXMgdGhlIHdvcmsgZm9yIHlvdSB0byBjaGVjawo+ID4gdGhhdCBp
dCByZWFsbHkgaXMgbmV2ZXIgY2FsbGVkLiAgTXVjaCBiZXR0ZXIgdGhhbiBzYXkgYSBCVUlMRF9C
VUdfT04oKS4KPiAKPiAKPiAod2l0aCBjb3JyZWN0ZWQgSnVlcmdlbidzIGVtYWlsKQo+IAo+IEkg
a25vdyBhYm91dCBJU19FTkFCTEVEKCkgYnV0IEkgZGlkbid0IHJlYWxpemUgdGhhdCB0aGlzIGlz
IGFsbG93ZWQgZm9yCj4gY29tcGlsZS10aW1lIGlubGluZXMgYW5kIHN1Y2ggYXMgd2VsbC4KPiAK
PiBBbnl3YXksIGZvciBub24tQVJNIGJpdHMKPiAKPiBSZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92
c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KCkFja2VkLWJ5OiBLb25yYWQgUnplc3p1
dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CgphcyB3ZWxsLgoKQWxiZWl0IGZvbGtz
IGhhdmUgdGVzdGVkIHRoaXMgdW5kZXIgeDg2IFhlbiB3aXRoICdzd2lvdGxiPWZvcmNlJyByaWdo
dD8KCkkgY2FuIHRlc3QgaXQgbXlzZWxmIGJ1dCBpdCB3aWxsIHRha2UgYSBjb3VwbGUgb2YgZGF5
cy4KPiAKPiBJZiB0aGlzIGdvZXMgdmlhIFhlbiB0cmVlIHRoZW4gdGhlIGZpcnN0IGNvdXBsZSBv
ZiBwYXRjaGVzIG5lZWQgYW4gYWNrCj4gZnJvbSBBUk0gbWFpbnRhaW5lcnMuCj4gCj4gLWJvcmlz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
