Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D9861FD6
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 15:52:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkU0J-00089q-VD; Mon, 08 Jul 2019 13:48:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=herT=VF=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hkU0I-00089l-7d
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 13:48:26 +0000
X-Inumbo-ID: 0e5f91d9-a187-11e9-8980-bc764e045a96
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0e5f91d9-a187-11e9-8980-bc764e045a96;
 Mon, 08 Jul 2019 13:48:24 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x68DhVam069388;
 Mon, 8 Jul 2019 13:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=jd+8j6+yNC3ijBw7+ODjQJXJiyZtrWICCAM1SOfIdDA=;
 b=bpUOslIiaLPmuaytkrSZqCSyy9p3sjdE9No2vxO00n+9aEO5UKU1Qyl+3U/S1XSiUZyo
 XnF8+bjOP4sSgzoIi+Y66MMcF8UpQZPgkJdJ6fzDN3TvO8hR8/MzEO8keo6CUhVeuStd
 o0eQzynEOrS1TVOjzo7ABEMCnull0ic95EOFT6mOnt1iF8HGn8OaTgi4fAB5zuclLGhu
 kGY6dYQMzXM2X8nZ73OC57GJq6zHKfvdbVf7LLq0PKLwo3M2BmVRUfn/GrEwLKAOjI7m
 u6Arcud+FYmlwYkH3Xx9L+v5WYnTtmn4zGYta7AdGPg+91B+jkmYPjyoijN/nfgJNTOm DA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2tjkkpeggf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Jul 2019 13:48:10 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x68Dh2OH073349;
 Mon, 8 Jul 2019 13:46:10 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2tjkf26s5m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Jul 2019 13:46:10 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x68Dk7hq000349;
 Mon, 8 Jul 2019 13:46:08 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 08 Jul 2019 06:46:07 -0700
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>, linux-kernel@vger.kernel.org
References: <1562490908-17882-1-git-send-email-zhenzhong.duan@oracle.com>
 <1562490908-17882-5-git-send-email-zhenzhong.duan@oracle.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <86b0dbb9-74a7-6883-e6d7-210bd35a6944@oracle.com>
Date: Mon, 8 Jul 2019 09:46:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1562490908-17882-5-git-send-email-zhenzhong.duan@oracle.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9311
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907080173
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9311
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907080173
Subject: Re: [Xen-devel] [PATCH v6 4/4] x86/xen: Add "nopv" support for HVM
 guest
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
Cc: jgross@suse.com, sstabellini@kernel.org, mingo@redhat.com, bp@alien8.de,
 xen-devel@lists.xenproject.org, tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy83LzE5IDU6MTUgQU0sIFpoZW56aG9uZyBEdWFuIHdyb3RlOgo+ICAKPiArc3RhdGljIHVp
bnQzMl90IF9faW5pdCB4ZW5fcGxhdGZvcm1faHZtKHZvaWQpCj4gK3sKPiArCWlmICh4ZW5fcHZf
ZG9tYWluKCkpCj4gKwkJcmV0dXJuIDA7Cj4gKwo+ICsJaWYgKHhlbl9wdmhfZG9tYWluKCkgJiYg
bm9wdikgewo+ICsJCS8qIEd1ZXN0IGJvb3RpbmcgdmlhIHRoZSBYZW4tUFZIIGJvb3QgZW50cnkg
Z29lcyBoZXJlICovCj4gKwkJcHJfaW5mbygiXCJub3B2XCIgcGFyYW1ldGVyIGlzIGlnbm9yZWQg
aW4gUFZIIGd1ZXN0XG4iKTsKPiArCQlub3B2ID0gZmFsc2U7Cj4gKwl9IGVsc2UgaWYgKG5vcHYp
IHsKPiArCQkvKgo+ICsJCSAqIEd1ZXN0IGJvb3RpbmcgdmlhIG5vcm1hbCBib290IGVudHJ5IChs
aWtlIHZpYSBncnViMikgZ29lcwo+ICsJCSAqIGhlcmUuCj4gKwkJICovCj4gKwkJeDg2X2luaXQu
aHlwZXIuZ3Vlc3RfbGF0ZV9pbml0ID0geGVuX2h2bV9ndWVzdF9sYXRlX2luaXQ7Cj4gKwkJcmV0
dXJuIDA7CgpBZnRlciBzdGFyaW5nIGF0IHRoaXMgc29tZSBtb3JlIEkgZG9uJ3QgdGhpbmsgd2Ug
Y2FuIGRvIHRoaXMuCkh5cGVydmlzb3Itc3BlY2lmaWMgY29kZSBzaG91bGQgbm90IG11Y2sgd2l0
aCB3aXRoIHg4Nl9pbml0Lmh5cGVyLCBpdCdzCmxheWVyaW5nIHZpb2xhdGlvbi4gVGhhdCdzIHdo
YXQgaW5pdF9oeXBlcnZpc29yX3BsYXRmb3JtKCkgaXMgZm9yLgoKU28gd2UgbWF5IGhhdmUgdG8g
Y3JlYXRlIGFub3RoZXIgaHlwZXJ2aXNvcl94ODYgb3BzIHN0cnVjdHVyZSBmb3IgWGVuCm5vcHYg
KHdoaWNoIEkgZG9uJ3QgZmluZCB2ZXJ5IGFwcGVhbGluZyBUQkgpLiBPciB1cGRhdGUKeDg2X2h5
cGVyX3hlbl9odm0gYW5kIHJldHVybiB4ZW5fY3B1aWRfYmFzZSgpIGluc3RlYWQgb2YgemVybyAo
YnV0IHRoZW4KeW91J2QgbmVlZCB0byB1cGRhdGUgYWxsIHRoZXNlIHN0cnVjdHMgZnJvbSBfX2lu
aXRjb25zdCB0byBfaW5pdCBvciBzb21lCnN1Y2gpLiBPciBzb21ldGhpbmcgZWxzZS4KCgotYm9y
aXMKCgo+ICsJfQo+ICsJcmV0dXJuIHhlbl9jcHVpZF9iYXNlKCk7Cj4gK30KPiArCj4gIGNvbnN0
IF9faW5pdGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX3g4NiB4ODZfaHlwZXJfeGVuX2h2bSA9IHsK
PiAgCS5uYW1lICAgICAgICAgICAgICAgICAgID0gIlhlbiBIVk0iLAo+ICAJLmRldGVjdCAgICAg
ICAgICAgICAgICAgPSB4ZW5fcGxhdGZvcm1faHZtLAo+IEBAIC0yNjgsNCArMjgzLDUgQEAgc3Rh
dGljIF9faW5pdCB2b2lkIHhlbl9odm1fZ3Vlc3RfbGF0ZV9pbml0KHZvaWQpCj4gIAkuaW5pdC5p
bml0X21lbV9tYXBwaW5nCT0geGVuX2h2bV9pbml0X21lbV9tYXBwaW5nLAo+ICAJLmluaXQuZ3Vl
c3RfbGF0ZV9pbml0CT0geGVuX2h2bV9ndWVzdF9sYXRlX2luaXQsCj4gIAkucnVudGltZS5waW5f
dmNwdSAgICAgICA9IHhlbl9waW5fdmNwdSwKPiArCS5pZ25vcmVfbm9wdiAgICAgICAgICAgID0g
dHJ1ZSwKPiAgfTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
