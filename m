Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEB913160B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 17:29:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioVDY-00081G-9M; Mon, 06 Jan 2020 16:27:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ceqV=23=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1ioVDW-00081B-0j
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 16:26:58 +0000
X-Inumbo-ID: 568ec984-30a1-11ea-a914-bc764e2007e4
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 568ec984-30a1-11ea-a914-bc764e2007e4;
 Mon, 06 Jan 2020 16:26:49 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 006GNQ0Y123623;
 Mon, 6 Jan 2020 16:26:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=K2YyETuhz2rqB+c/JRgkxRR273INfn72mp/0N3dcqxM=;
 b=QKsFpKJMZ9lJGwyWl8HpXlKJAeyf28Ho1NJCd0Jvms7VKKlcnOpNDQrdM9n26P9l66oq
 sRSvIA/iYa4+B5rOa0ePT2OdvLNSswrsa7h10qp8kXJbGsqdcDPyiBBjl8cDinigDk79
 luPBFsdklPCSbtIxA3wfY5t8hyIZoD3r4WGoe3kZvJTEthC9sNAVhbdBrMsmHBlZk/c0
 weA9XyllcOmYOMfbZ5E0H2CBhKfB0TLRJBwUCibk0pUfv0Ru9oeR3SlwH6jxas4aiTZM
 F5r5Rc9Sa9MSOv9gejdhvmRBoHcAHZLuJ2fJETIGskbaXWiNDf4C2ATaN/FvxJotUlkz XA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2xajnpr5tb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Jan 2020 16:26:42 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 006GPwWS116486;
 Mon, 6 Jan 2020 16:26:41 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 2xb466yg6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Jan 2020 16:26:41 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 006GQeco024871;
 Mon, 6 Jan 2020 16:26:40 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 06 Jan 2020 08:26:40 -0800
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id 1CD0E6A0144; Mon,  6 Jan 2020 11:30:16 -0500 (EST)
Date: Mon, 6 Jan 2020 11:30:16 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Pawel Wieczorkiewicz <wipawel@amazon.de>
Message-ID: <20200106163016.GB18151@char.us.oracle.com>
References: <20200106125623.97666-1-wipawel@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200106125623.97666-1-wipawel@amazon.de>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9492
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001060147
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9492
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001060147
Subject: Re: [Xen-devel] [PATCH] livepatch: use proper rc variable in
 livepatch_do_action()
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMDYsIDIwMjAgYXQgMTI6NTY6MjNQTSArMDAwMCwgUGF3ZWwgV2llY3pvcmtp
ZXdpY3ogd3JvdGU6Cj4gRml4IGMmcCBidWcgaW4gdGhlIGxpdmVwYXRjaF9kb19hY3Rpb24oKSBj
b2RlIG9mCj4gTElWRVBBVENIX0FDVElPTl9SRVBMQUNFIGNhc2UuCj4gVGhlIGNvcnJlY3QgdmFy
aWFibGUgaGFuZGxpbmcgcmV0dXJuIGNvZGUgb2YgcmV2ZXJ0IGFjdGlvbiBpcwo+IG90aGVyLT5y
YyBpbiB0aGlzIGNhc2UuCj4gCj4gQ292ZXJpdHktSUQ6IDE0NTc0NjcKPiBGaXhlczogNjA0NzEw
NGMzYyAoImxpdmVwYXRjaDogQWRkIHBlci1mdW5jdGlvbiBhcHBsaWVkL3JldmVydGVkIHN0YXRl
IHRyYWNraW5nIG1hcmtlciIpCj4gU2lnbmVkLW9mZi1ieTogUGF3ZWwgV2llY3pvcmtpZXdpY3og
PHdpcGF3ZWxAYW1hem9uLmRlPgo+IFJlcG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8
a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KCj4gLS0tCj4gIHhlbi9jb21tb24vbGl2ZXBhdGNoLmMg
fCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2xpdmVwYXRjaC5jIGIveGVuL2NvbW1vbi9saXZl
cGF0Y2guYwo+IGluZGV4IDJhOGFiMTM4NzkuLjVjNjdmM2RlNWEgMTAwNjQ0Cj4gLS0tIGEveGVu
L2NvbW1vbi9saXZlcGF0Y2guYwo+ICsrKyBiL3hlbi9jb21tb24vbGl2ZXBhdGNoLmMKPiBAQCAt
MTQ1Niw3ICsxNDU2LDcgQEAgc3RhdGljIHZvaWQgbGl2ZXBhdGNoX2RvX2FjdGlvbih2b2lkKQo+
ICAgICAgICAgICAgICBlbHNlCj4gICAgICAgICAgICAgICAgICBvdGhlci0+cmMgPSByZXZlcnRf
cGF5bG9hZChvdGhlcik7Cj4gIAo+IC0gICAgICAgICAgICBpZiAoICF3YXNfYWN0aW9uX2NvbnNp
c3RlbnQob3RoZXIsIHJjID8gTElWRVBBVENIX0ZVTkNfQVBQTElFRCA6IExJVkVQQVRDSF9GVU5D
X05PVF9BUFBMSUVEKSApCj4gKyAgICAgICAgICAgIGlmICggIXdhc19hY3Rpb25fY29uc2lzdGVu
dChvdGhlciwgb3RoZXItPnJjID8gTElWRVBBVENIX0ZVTkNfQVBQTElFRCA6IExJVkVQQVRDSF9G
VU5DX05PVF9BUFBMSUVEKSApCj4gICAgICAgICAgICAgICAgICBwYW5pYygibGl2ZXBhdGNoOiBw
YXJ0aWFsbHkgcmV2ZXJ0ZWQgcGF5bG9hZCAnJXMnIVxuIiwgb3RoZXItPm5hbWUpOwo+ICAKPiAg
ICAgICAgICAgICAgaWYgKCBvdGhlci0+cmMgPT0gMCApCj4gLS0gCj4gMi4xNi41Cj4gCj4gCj4g
Cj4gCj4gQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKPiBLcmF1c2Vuc3Ry
LiAzOAo+IDEwMTE3IEJlcmxpbgo+IEdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxh
ZWdlciwgSm9uYXRoYW4gV2Vpc3MKPiBFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90
dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKPiBTaXR6OiBCZXJsaW4KPiBVc3QtSUQ6IERFIDI4
OSAyMzcgODc5Cj4gCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
