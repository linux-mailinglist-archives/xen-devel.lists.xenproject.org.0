Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE72A285F
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 22:50:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3RKC-00008y-9k; Thu, 29 Aug 2019 20:47:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9sCI=WZ=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1i3RKA-00008l-Sa
 for xen-devel@lists.xen.org; Thu, 29 Aug 2019 20:47:18 +0000
X-Inumbo-ID: 2fb937a4-ca9e-11e9-8980-bc764e2007e4
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fb937a4-ca9e-11e9-8980-bc764e2007e4;
 Thu, 29 Aug 2019 20:47:17 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7TKk3Aa134456;
 Thu, 29 Aug 2019 20:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=nmjNzuyenLS3MJdS/4RhohAZY839/+6Lj6KyfJK5T/o=;
 b=AKEbtajh0Ui6/ybBZQcW43OHrRZdTc6ruT0fW6XxZDFA8b3hbMmDi7ieivqWoGmqTWC5
 3kUHHJ4kRcHvBZB/avCGhoSFZSY3ahZf1BR/z22Y1UEgBN5x7Fz28HwSTr9x6k763SP4
 /9xo8lHtWUMoxorQCxNKbYsUDAo05tt7IrHhw4b5Mjle1Pt49i+DiVDp+j4p01+WYEIr
 erFHpxCGEFzvR0U3lzzY1zn6vi2P6/KF0xZ0iXKmB/SjNiXX8FMce4wfQuaCn+EzqztW
 q533dolGbOH8F4HHl7W16UTn4xyYLeFHcxHfCIBYs4aoiZQBhvQA+Zzrx2Ew7HLE5i5E 2A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2upp16807b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2019 20:47:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7TKiAEH116214;
 Thu, 29 Aug 2019 20:47:07 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2upkrfec98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2019 20:47:07 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7TKl5i1007900;
 Thu, 29 Aug 2019 20:47:06 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 29 Aug 2019 13:47:05 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id 17E476A013F; Thu, 29 Aug 2019 16:48:54 -0400 (EDT)
Date: Thu, 29 Aug 2019 16:48:54 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Pawel Wieczorkiewicz <wipawel@amazon.de>
Message-ID: <20190829204853.GB24575@char.us.oracle.com>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190827084624.116917-1-wipawel@amazon.de>
 <20190827084624.116917-12-wipawel@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190827084624.116917-12-wipawel@amazon.de>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9364
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908290208
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9364
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908290209
Subject: Re: [Xen-devel] [PATCH v2 11/12] livepatch: Add metadata runtime
 retrieval mechanism
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
Cc: Tim Deegan <tim@xen.org>, wipawel@amazon.com,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 xen-devel@lists.xen.org, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMDg6NDY6MjNBTSArMDAwMCwgUGF3ZWwgV2llY3pvcmtp
ZXdpY3ogd3JvdGU6Cj4gRXh0ZW5kIHRoZSBsaXZlcGF0Y2ggbGlzdCBvcGVyYXRpb24gdG8gZmV0
Y2ggYWxzbyBwYXlsb2FkcycgbWV0YWRhdGEuCj4gVGhpcyBpcyBhY2hpZXZlZCBieSBleHRlbmRp
bmcgdGhlIHN5c2N0bCBsaXN0IGludGVyZmFjZSB3aXRoIDIgZXh0cmEKPiBndWVzdCBoYW5kbGVz
Ogo+ICogbWV0YWRhdGEgICAgIC0gYW4gYXJyYXkgb2YgYXJiaXRyYXJ5IHNpemUgc3RyaW5ncwo+
ICogbWV0YWRhdGFfbGVuIC0gYW4gYXJyYXkgb2YgbWV0YWRhdGEgc3RyaW5ncycgbGVuZ3RocyAo
dWluMzJfdCBlYWNoKQo+IAo+IFBheWxvYWRzJyBtZXRhZGF0YSBpcyBhIHN0cmluZyBvZiBhcmJp
dHJhcnkgc2l6ZSBhbmQgZG9lcyBub3QgaGF2ZSBhbgo+IHVwcGVyIGJvdW5kIGxpbWl0LiBJdCBt
YXkgYWxzbyB2YXJ5IGluIHNpemUgYmV0d2VlbiBwYXlsb2Fkcy4KPiAKPiBJbiBvcmRlciB0byBs
ZXQgdGhlIHVzZXJsYW5kIGFsbG9jYXRlIGVub3VnaCBzcGFjZSBmb3IgdGhlIGluY29taW5nCj4g
ZGF0YSBhZGQgYSBtZXRhZGF0YSB0b3RhbCBzaXplIGZpZWxkIHRvIHRoZSBsaXN0IHN5c2N0bCBv
cGVyYXRpb24gYW5kCj4gZmlsbCBpdCB3aXRoIHRvdGFsIHNpemUgb2YgYWxsIHBheWxvYWRzJyBt
ZXRhZGF0YS4KPiAKPiBFeHRlbmQgdGhlIGxpYnhjIHRvIGhhbmRsZSB0aGUgbWV0YWRhdGEgYmFj
ay10by1iYWNrIGRhdGEgdHJhbnNmZXJzCj4gYXMgd2VsbCBhcyBtZXRhZGF0YSBsZW5ndGggYXJy
YXkgZGF0YSB0cmFuc2ZlcnMuCj4gCj4gVGhlIHhlbi1saXZlcGF0Y2ggdXNlcmxhbmQgdG9vbCBp
cyBleHRlbmRlZCB0byBhbHdheXMgZGlzcGxheSB0aGUKPiBtZXRhZGF0YSBmb3IgZWFjaCByZWNl
aXZlZCBtb2R1bGUuIFRoZSBtZXRhZGF0YSBpcyByZWNlaXZlZCB3aXRoIHRoZQo+IGZvbGxvd2lu
ZyBmb3JtYXQ6IGtleT12YWx1ZVwwa2V5PXZhbHVlXDAuLi5rZXk9dmFsdWVcMC4gVGhlIGZvcm1h
dCBpcwo+IG1vZGlmaWVkIHRvIHRoZSBmb2xsb3dpbmcgb25lOiBrZXk9dmFsdWU7a2V5PXZhbHVl
Oy4uLmtleT12YWx1ZS4KPiBUaGUgbmV3IGZvcm1hdCBhbGxvd3MgdG8gZWFzaWx5IHBhcnNlIHRo
ZSBtZXRhZGF0YSBmb3IgYSBnaXZlbiBtb2R1bGUKPiBieSBhIG1hY2hpbmUuCj4gCj4gU2lnbmVk
LW9mZi1ieTogUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgo+IFJldmll
d2VkLWJ5OiBBbmRyYS1JcmluYSBQYXJhc2NoaXYgPGFuZHJhcHJzQGFtYXpvbi5jb20+Cj4gUmV2
aWV3ZWQtYnk6IE1hcnRpbiBQb2hsYWNrIDxtcG9obGFja0BhbWF6b24uZGU+Cj4gUmV2aWV3ZWQt
Ynk6IE5vcmJlcnQgTWFudGhleSA8bm1hbnRoZXlAYW1hem9uLmRlPgo+IC0tLQo+IENoYW5nZWQg
c2luY2UgdjE6Cj4gICAqIGFkZGVkIGNvcnJlc3BvbmRpbmcgZG9jdW1lbnRhdGlvbgo+ICAgKiBt
YWtlIG1ldGFkYXRhIG9wdGlvbmFsIChkbyBub3QgZGlzcGxheSBpdCB3aGVuIGdpdmVuIHBheWxv
YWQKPiAgICAgZG9lcyBub3QgaGF2ZSBpdCkKPiAKPiAgZG9jcy9taXNjL2xpdmVwYXRjaC5wYW5k
b2MgICAgfCAzMSArKysrKysrKysrKysrKysrLS0tLS0KPiAgdG9vbHMvbGlieGMvaW5jbHVkZS94
ZW5jdHJsLmggfCAyMiArKysrKysrKysrKy0tLS0KPiAgdG9vbHMvbGlieGMveGNfbWlzYy5jICAg
ICAgICAgfCA2NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4g
IHRvb2xzL21pc2MveGVuLWxpdmVwYXRjaC5jICAgIHwgNDMgKysrKysrKysrKysrKysrKysrKysr
KystLS0tLS0KPiAgeGVuL2NvbW1vbi9saXZlcGF0Y2guYyAgICAgICAgfCAyMiArKysrKysrKysr
Ky0tLS0KPiAgeGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oICAgfCAxOSArKysrKysrKystLS0t
Cj4gIDYgZmlsZXMgY2hhbmdlZCwgMTU3IGluc2VydGlvbnMoKyksIDQ0IGRlbGV0aW9ucygtKQoK
QW5kIGl0IG1heSBiZSB3b3J0aCBmb2xkaW5nIHRoaXMgaW46CgpkaWZmIC0tZ2l0IGEveGVuL3Rl
c3QvbGl2ZXBhdGNoL01ha2VmaWxlIGIveGVuL3Rlc3QvbGl2ZXBhdGNoL01ha2VmaWxlCmluZGV4
IGE3ODU3ZDNhMmUuLjNmMDg4ZTc0YjIgMTAwNjQ0Ci0tLSBhL3hlbi90ZXN0L2xpdmVwYXRjaC9N
YWtlZmlsZQorKysgYi94ZW4vdGVzdC9saXZlcGF0Y2gvTWFrZWZpbGUKQEAgLTc5LDkgKzc5LDE3
IEBAIGNvbmZpZy5oOiB4ZW5faGVsbG9fd29ybGRfZnVuYy5vCiB4ZW5faGVsbG9fd29ybGQubzog
Y29uZmlnLmgKIAogLlBIT05ZOiAkKExJVkVQQVRDSCkKLSQoTElWRVBBVENIKTogeGVuX2hlbGxv
X3dvcmxkX2Z1bmMubyB4ZW5faGVsbG9fd29ybGQubyBub3RlLm8geGVuX25vdGUubworJChMSVZF
UEFUQ0gpOiB4ZW5faGVsbG9fd29ybGRfZnVuYy5vIHhlbl9oZWxsb193b3JsZC5vIG5vdGUubyB4
ZW5fbm90ZS5vIG1vZGluZm8ubwogICAgICAgICQoTEQpICQoTERGTEFHUykgJChidWlsZF9pZF9s
aW5rZXIpIC1yIC1vICQoTElWRVBBVENIKSAkXgogCisuUEhPTlk6IG1vZGluZm8ubworbW9kaW5m
by5vOgorICAgICAgIChzZXQgLWU7IFwKKyAgICAgICAgcHJpbnRmICJMSVZFUEFUQ0hfUlVMRVpc
MCIpID4gJEAuYmluCisgICAgICAgJChPQkpDT1BZKSAkKE9CSkNPUFlfTUFHSUMpIFwKKyAgICAg
ICAgICAgICAgICAgIC0tcmVuYW1lLXNlY3Rpb249LmRhdGE9Lm1vZGluZm8sYWxsb2MsbG9hZCxy
ZWFkb25seSxkYXRhLGNvbnRlbnRzIC1TICRALmJpbiAkQAorICAgICAgICNybSAtZiAkQC5iaW4K
KwogIwogIyBUaGlzIHRhcmdldCBpcyBvbmx5IGFjY2Vzc2libGUgaWYgQ09ORklHX0xJVkVQQVRD
SCBpcyBkZWZpbmVkLCB3aGljaAogIyBkZXBlbmRzIG9uICQoYnVpbGRfaWRfbGlua2VyKSBiZWlu
ZyBhdmFpbGFibGUuIEhlbmNlIHdlIGRvIG5vdAoKLi4gd2hpY2ggdGhlIHRlc3QtY2FzZSBjYW4g
dGVzdCBmb3IuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
