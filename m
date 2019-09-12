Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2781EB13D2
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 19:37:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8Sz1-0004dX-4Q; Thu, 12 Sep 2019 17:34:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tLUX=XH=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1i8Sz0-0004dS-Az
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 17:34:14 +0000
X-Inumbo-ID: 89408562-d583-11e9-95a2-12813bfff9fa
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89408562-d583-11e9-95a2-12813bfff9fa;
 Thu, 12 Sep 2019 17:34:13 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8CHSr6x128692;
 Thu, 12 Sep 2019 17:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=w1+EtgABHl+iChi0YBjwSlQ99GBTuClSKjEQg45c0tA=;
 b=iXJznD/SjrrW2gjC0/VoHxKmegq7dyIf24jHOVAvW17OVuFDwhkIjDNClhrfD0mTwvGw
 rNpHYHQY2fPDWa7Y253cbkPmd+DMLwWg0vjAH4aRjnpPXwzl/bZD8YGEOhsz1PblBZAA
 9yDfxF2zcWCZ6afxUD29V68FuSQHbTAgTRuLIZVFD0eWWewvbR7KlTT40oLfCtY3cz1z
 /abd61o7ed+CZQ0lqlMlXu7s3ZhbkYg+EaUhTGnEBcpjOOWWa6TjD+YQD1jUUrIq/+QS
 PujTky08yMtJ/mxEejpi9EIEsQxrP5CbL/xIKt5Kr0fUeEe5Ko9zUD33EIW0VN/cAn1J 3Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2uytd301b4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Sep 2019 17:34:11 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8CHXKUA161847;
 Thu, 12 Sep 2019 17:34:11 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2uytdh8855-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Sep 2019 17:34:11 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8CHYASJ020430;
 Thu, 12 Sep 2019 17:34:10 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 12 Sep 2019 10:34:10 -0700
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <1567556431-9809-1-git-send-email-igor.druzhinin@citrix.com>
 <5054ad91-5b87-652c-873a-b31758948bd7@oracle.com>
 <e3114d56-51cd-b973-1ada-f6a60a7e99cc@citrix.com>
 <43b7da04-5c42-80d8-898b-470ee1c91ed2@oracle.com>
 <adefac87-c2b3-b67f-fb4d-d763ce920bef@citrix.com>
 <1695c88d-e5ad-1854-cdef-3cd95c812574@oracle.com>
 <4d3bf854-51de-99e4-9a40-a64c581bdd10@citrix.com>
 <bc3da154-d451-02cf-6154-5e0dc721a6e6@oracle.com>
 <c45b8786-5735-a95d-bc40-61372c326037@citrix.com>
 <43e492ff-f967-7218-65c4-d16581fabea3@oracle.com>
 <416ff4b7-3186-f61a-75fa-bcfc968f8117@citrix.com>
 <df64cd80-d92e-27ad-b1bc-e58184379e50@oracle.com>
 <d281baaf-a6d7-306e-63aa-b84552ac3ea5@citrix.com>
 <9ac1f34b-ea2a-3818-4cbd-a22a9a475dd4@oracle.com>
 <74c9d2cc-a528-2cec-099e-0d803aeace6f@citrix.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <dd95aa25-bea7-dbc1-fea3-0e21d00d0686@oracle.com>
Date: Thu, 12 Sep 2019 13:33:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <74c9d2cc-a528-2cec-099e-0d803aeace6f@citrix.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9378
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909120184
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9378
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909120183
Subject: Re: [Xen-devel] [PATCH] xen/pci: try to reserve MCFG areas earlier
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
Cc: jgross@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8xMC8xOSA5OjE1IFBNLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPiBPbiAxMC8wOS8yMDE5
IDIyOjE5LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+IE9uIDkvMTAvMTkgNDozNiBQTSwgSWdv
ciBEcnV6aGluaW4gd3JvdGU6Cj4+PiBPbiAxMC8wOS8yMDE5IDE4OjQ4LCBCb3JpcyBPc3Ryb3Zz
a3kgd3JvdGU6Cj4+Pj4gT24gOS8xMC8xOSA1OjQ2IEFNLCBJZ29yIERydXpoaW5pbiB3cm90ZToK
Pj4+Pj4gT24gMTAvMDkvMjAxOSAwMjo0NywgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+Pj4+Pj4g
T24gOS85LzE5IDU6NDggUE0sIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+Pj4+Pj4+IE9uIDA5LzA5
LzIwMTkgMjA6MTksIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4+Pj4+Pgo+Pj4+Pj4+PiBUaGUg
b3RoZXIgcXVlc3Rpb24gSSBoYXZlIGlzIHdoeSB5b3UgdGhpbmsgaXQncyB3b3J0aCBrZWVwaW5n
Cj4+Pj4+Pj4+IHhlbl9tY2ZnX2xhdGUoKSBhcyBhIGxhdGUgaW5pdGNhbGwuIEhvdyBjb3VsZCBN
Q0ZHIGluZm8gYmUgdXBkYXRlZAo+Pj4+Pj4+PiBiZXR3ZWVuIGFjcGlfaW5pdCgpIGFuZCBsYXRl
X2luaXRjYWxscyBiZWluZyBydW4/IEknZCB0aGluayBpdCBjYW4gb25seQo+Pj4+Pj4+PiBoYXBw
ZW4gd2hlbiBhIG5ldyBkZXZpY2UgaXMgaG90cGx1Z2dlZC4KPj4+Pj4+Pj4KPj4+Pj4+PiBJdCB3
YXMgYSBwcmVjYXV0aW9uIGFnYWluc3Qgc2V0dXBfbWNmZ19tYXAoKSBjYWxscyB0aGF0IG1pZ2h0
IGFkZCBuZXcKPj4+Pj4+PiBhcmVhcyB0aGF0IGFyZSBub3QgaW4gTUNGRyB0YWJsZSBidXQgZm9y
IHNvbWUgcmVhc29uIGhhdmUgX0NCQSBtZXRob2QuCj4+Pj4+Pj4gSXQncyBvYnZpb3VzbHkgYSAi
ZmlybXdhcmUgaXMgYnJva2VuIiBzY2VuYXJpbyBzbyBJIGRvbid0IGhhdmUgc3Ryb25nCj4+Pj4+
Pj4gZmVlbGluZ3MgdG8ga2VlcCBpdCBoZXJlLiBXaWxsIHByZWZlciB0byByZW1vdmUgaW4gdjIg
aWYgeW91IHdhbnQuCj4+Pj4+PiBJc24ndCBzZXR1cF9tY2ZnX21hcCgpIGNhbGxlZCBiZWZvcmUg
dGhlIGZpcnN0IHhlbl9hZGRfZGV2aWNlKCkgd2hpY2ggaXMgd2hlcmUgeW91IGFyZSBjYWxsaW5n
IHhlbl9tY2ZnX2xhdGUoKT8KPj4+Pj4+Cj4+Pj4+IHNldHVwX21jZmdfbWFwKCkgY2FsbHMgYXJl
IGRvbmUgaW4gb3JkZXIgb2Ygcm9vdCBidXMgZGlzY292ZXJ5IHdoaWNoCj4+Pj4+IGhhcHBlbnMg
KmFmdGVyKiB0aGUgcHJldmlvdXMgcm9vdCBidXMgaGFzIGJlZW4gZW51bWVyYXRlZC4gU28gdGhl
IG9yZGVyCj4+Pj4+IGlzOiBjYWxsIHNldHVwX21jZmdfbWFwKCkgZm9yIHJvb3QgYnVzIDAsIGZp
bmQgdGhhdAo+Pj4+PiBwY2lfbW1jZmdfbGF0ZV9pbml0KCkgaGFzIGZpbmlzaGVkIE1DRkcgYXJl
YSByZWdpc3RyYXRpb24sIHBlcmZvcm0gUENJCj4+Pj4+IGVudW1lcmF0aW9uIG9mIGJ1cyAwLCBj
YWxsIHhlbl9hZGRfZGV2aWNlKCkgZm9yIGV2ZXJ5IGRldmljZSB0aGVyZSwgY2FsbAo+Pj4+PiBz
ZXR1cF9tY2ZnX21hcCgpIGZvciByb290IGJ1cyBYLCBldGMuCj4+Pj4gQWgsIHllcy4gTXVsdGlw
bGUgYnVzc2VzLgo+Pj4+Cj4+Pj4gSWYgdGhhdCdzIHRoZSBjYXNlIHRoZW4gd2h5IGRvbid0IHdl
IG5lZWQgdG8gY2FsbCB4ZW5fbWNmZ19sYXRlKCkgZm9yCj4+Pj4gdGhlIGZpcnN0IGRldmljZSBv
biBlYWNoIGJ1cz8KPj4+Pgo+Pj4gSWRlYWxseSwgeWVzIC0gd2UnZCBsaWtlIHRvIGNhbGwgaXQg
Zm9yIGV2ZXJ5IGJ1cyBkaXNjb3ZlcmVkLiBCdXQgYm9vdAo+Pj4gdGltZSBidXNlcyBhcmUgYWxy
ZWFkeSBpbiBNQ0ZHIChvdGhlcndpc2Ugc3lzdGVtIGJvb3QgbWlnaHQgbm90IHNpbXBseQo+Pj4g
d29yayBhcyBKYW4gcG9pbnRlZCBvdXQpIHNvIGl0J3Mgbm90IHN0cmljdGx5IHJlcXVpcmVkLiBU
aGUgb25seSBjYXNlIGlzCj4+PiBhIHBvdGVudGlhbCBQQ0kgYnVzIGhvdC1wbHVnIGJ1dCBJJ20g
bm90IHN1cmUgaXQgYWN0dWFsbHkgd29ya3MgaW4KPj4+IHByYWN0aWNlIGFuZCB3ZSBjZXJ0YWlu
bHkgZGlkbid0IHN1cHBvcnQgaXQgYmVmb3JlLiBJdCBtaWdodCBiZSBzb2x2ZWQKPj4+IHRoZW9y
ZXRpY2FsbHkgYnkgc3Vic2NyaWJpbmcgdG8gYWNwaV9idXNfdHlwZSB0aGF0IGlzIGF2YWlsYWJs
ZSBhZnRlcgo+Pj4gYWNwaV9pbml0KCkuCj4+IE9LLiBUaGVuICpJIHRoaW5rKiB3ZSBjYW4gZHJv
cCBsYXRlX2luaXRjYWxsKCkgYnV0IEkgd291bGQgcmVhbGx5IGxpa2UKPj4gdG8gaGVhciB3aGVu
IG90aGVycyB0aGluay4KClNpbmNlIG5vb25lIGNvbW1lbnRlZCB0aGVuIGNhbiB5b3Ugc2VuZCBh
IHYyIHdpdGggc2Vjb25kIHBhdGNoIHJlbW92aW5nCnRoZSBsYXRlIGNhbGw/CgpBbHNvLCBpbiB0
aGUgZmlyc3QgcGF0Y2ggcGxlYXNlIGxpbWl0IHRoZSBzY29wZSBvZiBwY2lfbWNmZ19yZXNlcnZl
ZCB0bwpqdXN0IHhlbl9hZGRfZGV2aWNlKCkuCgotYm9yaXMKCgo+Pgo+IEFub3RoZXIgdGhpbmcg
dGhhdCBJIGltcGxpZWQgYnkgIm5vdCBzdXBwb3J0aW5nIiBidXQgd2FudCB0byBleHBsaWNpdGx5
Cj4gY2FsbCBvdXQgaXMgdGhhdCBjdXJyZW50bHkgWGVuIHdpbGwgcmVmdXNlIHJlc2VydmluZyBh
bnkgTUNGRyBhcmVhCj4gdW5sZXNzIGl0IGFjdHVhbGx5IGV4aXN0ZWQgaW4gTUNGRyB0YWJsZSBh
dCBib290LiBJIGRvbid0IGNsZWFybHkKPiB1bmRlcnN0YW5kIHJlYXNvbmluZyBiZWhpbmQgaXQg
YnV0IGl0IG1pZ2h0IGJlIHdvcnRoIHJlbGF4aW5nIGF0IGxlYXN0Cj4gc2l6ZSBtYXRjaGluZyBy
ZXN0cmljdGlvbiBvbiBYZW4gc2lkZSBub3cgd2l0aCB0aGlzIGNoYW5nZS4KPgo+IElnb3IKPgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gWGVuLWRl
dmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
