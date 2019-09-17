Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25110B4EA2
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 14:59:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iACzl-0004yM-NT; Tue, 17 Sep 2019 12:54:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uYNM=XM=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1iACzj-0004y8-HI
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 12:54:11 +0000
X-Inumbo-ID: 3dea2ff8-d94a-11e9-960c-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3dea2ff8-d94a-11e9-960c-12813bfff9fa;
 Tue, 17 Sep 2019 12:54:10 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8HCrl7w194739;
 Tue, 17 Sep 2019 12:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to : content-transfer-encoding; s=corp-2019-08-05;
 bh=F7fXgVpUg89cm/7XZmq5Xu+LAUg7VJzRSt5fX9oTRzU=;
 b=RuKp1UMDIJPiPsFBPNXD3NDcXj1f7EUoSaBARk96rlpRlQHG/zqN4ID6sgDSL8LtmMES
 LI3p8NIdnj82E8/y3J8etg6avGqEKB4d8VEEVn1UEtbsOBs4jmPLhRDxQx5/skOQbJmC
 6/wzrJXfc+aU8OEuQSRAR7bbxrWL8QlKWAJZ3M6y+kF/Ryma4lNO5F1+GhDFEPK0RMxS
 GRUO6kWvTeqRmGAYS17pHMUM5Mwrjyi5clTZRA6NU1XlJ7mF7LqrxfLquot9eo32yD4r
 MIBYoRVNkIbh9F/3lwyXVnPOsvX7k8W6voFg2Gy49VreM/udmXkfqTLEqAtWKdek0/Ag Lg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2v0ruqp45h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 12:54:00 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8HCrQaF137768;
 Tue, 17 Sep 2019 12:54:00 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2v2nmv1b35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 12:53:59 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8HCrwpt019296;
 Tue, 17 Sep 2019 12:53:58 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 17 Sep 2019 05:53:58 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id C007C6A00EE; Tue, 17 Sep 2019 08:55:39 -0400 (EDT)
Date: Tue, 17 Sep 2019 08:55:39 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
Message-ID: <20190917125539.GA22162@char.us.oracle.com>
References: <20190916105945.93632-1-wipawel@amazon.de>
 <20190916105945.93632-11-wipawel@amazon.de>
 <fb181faf-76e2-57c9-ac1e-7f56a195f9ef@suse.com>
 <26B651C9-2FA3-491A-A383-E4A4FFB3650D@amazon.com>
 <031390a8-2dbc-c384-6752-4e5050dc5114@suse.com>
 <7DDFDD63-4BD3-4B18-835D-2915778E4096@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7DDFDD63-4BD3-4B18-835D-2915778E4096@amazon.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9382
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909170129
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9382
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909170129
Subject: Re: [Xen-devel] [PATCH v3 10/12] livepatch: Handle arbitrary size
 names with the list operation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, "Pohlack,
 Martin" <mpohlack@amazon.de>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMDg6NTU6MjJBTSArMDAwMCwgV2llY3pvcmtpZXdpY3os
IFBhd2VsIHdyb3RlOgo+IAo+IAo+ID4gT24gMTcuIFNlcCAyMDE5LCBhdCAxMDo0OCwgSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPiA+IAo+ID4gT24gMTcuMDkuMjAxOSAx
MDo0MCwgIFdpZWN6b3JraWV3aWN6LCBQYXdlbCAgd3JvdGU6Cj4gPj4gCj4gPj4gCj4gPj4gT24g
MTcuIFNlcCAyMDE5LCBhdCAxMDoyNywgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPG1h
aWx0bzpqYmV1bGljaEBzdXNlLmNvbT4+IHdyb3RlOgo+ID4+IAo+ID4+IE9uIDE2LjA5LjIwMTkg
MTI6NTksIFBhd2VsIFdpZWN6b3JraWV3aWN6IHdyb3RlOgo+ID4+IEBAIC05NTEsMTEgKzk1Miwx
MyBAQCBzdHJ1Y3QgeGVuX3N5c2N0bF9saXZlcGF0Y2hfbGlzdCB7Cj4gPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFtb3VudCBvZiBwYXlsb2FkcyBhbmQg
dmVyc2lvbi4KPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgT1VUOiBIb3cgbWFueSBwYXlsb2FkcyBsZWZ0LiAqLwo+ID4+ICAgIHVpbnQzMl90IHBhZDsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBJTjogTXVzdCBiZSB6ZXJvLiAqLwo+ID4+ICsg
ICAgdWludDY0X3QgbmFtZV90b3RhbF9zaXplOyAgICAgICAgICAgICAgIC8qIE9VVDogVG90YWwg
c2l6ZSBvZiBhbGwgdHJhbnNmZXIgbmFtZXMgKi8KPiA+PiAKPiA+PiBXaHkgdWludDY0X3QgYW5k
IG5vdCB1aW50MzJfdD8gWW91IGRvbid0IGV4cGVjdCB0aGlzIHRvIGdyb3cKPiA+PiBiZXlvbmQg
NEdpQiwgZG8geW91Pwo+ID4+IAo+ID4+IEkgZG9u4oCZdCwgYnV0IHVpbnQzMl90IGlzIG5vdCBy
ZWFsbHkgY29tcGF0aWJsZSB3aXRoIHNpemVfdC4KPiA+PiBBbmQgSSB3YXMgdGhvdWdodCB0byBh
bHdheXMgdXNlIHNpemVfdCBjb21wYXRpYmxlIHR5cGVzIGZvciBzaXplcy4KPiA+IAo+ID4gVGhh
dCdzIGEgZmFpciBwb2ludCwgYnV0IEkgdGhpbmsgd2UgdXNlIDMyLWJpdCBzaXplcyBlbHNld2hl
cmUKPiA+IGFzIHdlbGwsIHdoZW4gY3Jvc3NpbmcgdGhlIDRHaUIgYm91bmRhcnkgd291bGQgc2Vl
bSBlbnRpcmVseQo+ID4gdW5leHBlY3RlZC4KPiA+IAo+ID4gQnV0IHdoYXQncyB3b3JzZSBoZXJl
IC0geW91IHNob3VsZG4ndCB1c2UgcGxhaW4gdWludDY0X3QgaW4KPiA+IHN5c2N0bC5oIChhbmQg
ZG9tY3RsLmgpIGFueXdheS4gSWYgYW55dGhpbmcsIHlvdSBvdWdodCB0byB1c2UKPiA+IHVpbnQ2
NF9hbGlnbmVkX3QuIChHb2luZyB0aHJvdWdoIHRoZSBmaWxlIEkgbm90aWNlIGEgZmV3IG90aGVy
Cj4gPiBiYWQgaW5zdGFuY2VzIGhhdmUgY3JlcHQgaW4uKQo+ID4gCj4gCj4gSSBzZWUuIE5vdGVk
LCB0aGFua3MgZm9yIGxldHRpbmcgbWUga25vdy4KPiAKPiA+PiBBbnl3YXksIEkgZG8gbm90IG1p
bmQgY2hhbmdpbmcgdGhpcyB0byB3aGF0ZXZlciB0eXBlIHlvdSBwcmVmZXIuCj4gPiAKPiA+IFdl
bGwsIHByZWZlcmVuY2UgLSBpZiBhbnlvbmUncyAtIHdvdWxkIGJlIHRoZSBsaXZlcGF0Y2ggbWFp
bnRhaW5lcnMnCj4gPiBvbmUgaGVyZS4KPiA+IAo+IAo+IFdhaXRpbmcgZm9yIHRoZSBtYWludGFp
bmVycycgd2lzZSBqdWRnbWVudCB0aGVuIDotKS4KCjMyLWJpdCBwbGVhc2UuIFRoeAo+IAo+ID4g
QWxzbyAtIGNhbiB5b3UgcGxlYXNlIHNlZSBhYm91dCBhZGp1c3RpbmcgeW91ciByZXBseSBzdHls
ZT8gSW4gcGxhaW4KPiA+IHRleHQgbW9kZSBpdCdzIGltcG9zc2libGUgdG8gdGVsbCBjb250ZXh0
IGZyb20geW91ciByZXNwb25zZXMuCj4gCj4gT2gsIHNvcnJ5IGFib3V0IHRoYXQuIEkgdHdlYWtl
ZCBteSBzZXR0aW5ncy4KPiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgaXQgZG9lcyBub3QgZ2V0IGJl
dHRlci4KPiAKPiA+IAo+ID4gSmFuCj4gCj4gQmVzdCBSZWdhcmRzLAo+IFBhd2VsIFdpZWN6b3Jr
aWV3aWN6Cj4gCj4gCj4gCj4gCj4gCj4gCj4gQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJt
YW55IEdtYkgKPiBLcmF1c2Vuc3RyLiAzOAo+IDEwMTE3IEJlcmxpbgo+IEdlc2NoYWVmdHNmdWVo
cnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaAo+IEVpbmdldHJhZ2VuIGFt
IEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgo+IFNpdHo6IEJl
cmxpbgo+IFVzdC1JRDogREUgMjg5IDIzNyA4NzkKPiAKPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
