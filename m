Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B1F61C99
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 11:52:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkQHH-00078d-4Q; Mon, 08 Jul 2019 09:49:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IuGq=VF=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hkQHF-00078T-Ns
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 09:49:41 +0000
X-Inumbo-ID: 130bdf0f-a15b-11e9-8980-bc764e045a96
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 130bdf0f-a15b-11e9-8980-bc764e045a96;
 Mon, 08 Jul 2019 08:33:34 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x688SPgX112277;
 Mon, 8 Jul 2019 08:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=UQsBXsIHQtJ9LZ75WWjRdKuqkVfjHrOmOAXqkEadiCk=;
 b=TaUgfw0fnMUE1OWAZInt+uzjBe3Oa9qW9qmihJiDcTwcPHpEtwhBm64mRHjIot2G5fk9
 ip3cNdo82hxlQbJp0n4MQD3fBlUywzc8aiD83I0xQ4P4dkEa6HY4eY5vH9vZu/MffJ3R
 RMrbUupoYh5rvqvEQO/Wg7b+7CJ2yDXZeI3ERZvBHBSZfJSnS9nhUA3ArptqmrAZZpMq
 RwEWeinpD+l2Wcz2B+fMLj443Lx7JVY7zb4cUx9SdPlnKsS/nyDw1wD1d8HSI7y6M2mS
 E06aPyZh8EGm3R9b8lzYxKNoqhP/HlMgOs0nUutPO12QBbAqS75MV/EQEfpComek1Q59 UA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2tjm9qcx4a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Jul 2019 08:33:16 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x688XFYi039574;
 Mon, 8 Jul 2019 08:33:15 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2tjkf22wt7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Jul 2019 08:33:15 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x688X90k012433;
 Mon, 8 Jul 2019 08:33:09 GMT
Received: from [10.191.18.118] (/10.191.18.118)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 08 Jul 2019 01:33:08 -0700
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
References: <1562116778-5846-1-git-send-email-zhenzhong.duan@oracle.com>
 <1562116778-5846-5-git-send-email-zhenzhong.duan@oracle.com>
 <7f5f42fd-de85-91f4-3274-055df28a27f6@oracle.com>
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Organization: Oracle Corporation
Message-ID: <a1882b6a-3f97-f784-7f2b-fc1ac8ad954c@oracle.com>
Date: Mon, 8 Jul 2019 16:33:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <7f5f42fd-de85-91f4-3274-055df28a27f6@oracle.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9311
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907080112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9311
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907080111
Subject: Re: [Xen-devel] [PATCH v5 4/4] x86/xen: Add "nopv" support for HVM
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDIwMTkvNy81IDIxOjA2LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4gT24gNy8yLzE5IDk6
MTkgUE0sIFpoZW56aG9uZyBEdWFuIHdyb3RlOgo+PiBQVkggZ3Vlc3QgbmVlZHMgUFYgZXh0ZW50
aW9ucyB0byB3b3JrLCBzbyAibm9wdiIgcGFyYW1ldGVyIHNob3VsZCBiZQo+PiBpZ25vcmVkIGZv
ciBQVkggYnV0IG5vdCBmb3IgSFZNIGd1ZXN0Lgo+Pgo+PiBJZiBQVkggZ3Vlc3QgYm9vdHMgdXAg
dmlhIHRoZSBYZW4tUFZIIGJvb3QgZW50cnksIHhlbl9wdmggaXMgc2V0IGVhcmx5LAo+PiB3ZSBr
bm93IGl0J3MgUFZIIGd1ZXN0IGFuZCBpZ25vcmUgIm5vcHYiIHBhcmFtZXRlciBkaXJlY3RseS4K
Pj4KPj4gSWYgUFZIIGd1ZXN0IGJvb3RzIHVwIHZpYSB0aGUgbm9ybWFsIGJvb3QgZW50cnkgc2Ft
ZSBhcyBIVk0gZ3Vlc3QsIGl0J3MKPj4gaGFyZCB0byBkaXN0aW5ndWlzaCBQVkggYW5kIEhWTSBn
dWVzdCBhdCB0aGF0IHRpbWUuCj4+Cj4+IFRvIGhhbmRsZSB0aGF0IGNhc2UsIGFkZCBhIG5ldyBm
dW5jdGlvbiB4ZW5faHZtX25vcHZfZ3Vlc3RfbGF0ZV9pbml0KCkKPj4gdG8gZGV0ZWN0IFBWSCBh
dCBhIGxhdGUgdGltZSBhbmQgcGFuaWMgaXRzZWxmIGlmIG5vcHYgZW5hYmxlZCBmb3IgYQo+PiBQ
VkggZ3Vlc3QuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFpoZW56aG9uZyBEdWFuPHpoZW56aG9uZy5k
dWFuQG9yYWNsZS5jb20+Cj4+IENjOiBCb3JpcyBPc3Ryb3Zza3k8Ym9yaXMub3N0cm92c2t5QG9y
YWNsZS5jb20+Cj4+IENjOiBKdWVyZ2VuIEdyb3NzPGpncm9zc0BzdXNlLmNvbT4KPj4gQ2M6IFN0
ZWZhbm8gU3RhYmVsbGluaTxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+PiBDYzogVGhvbWFzIEds
ZWl4bmVyPHRnbHhAbGludXRyb25peC5kZT4KPj4gQ2M6IEluZ28gTW9sbmFyPG1pbmdvQHJlZGhh
dC5jb20+Cj4+IENjOiBCb3Jpc2xhdiBQZXRrb3Y8YnBAYWxpZW44LmRlPgo+PiAtLS0KPj4gICBh
cmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysr
KysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdp
dCBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVu
X2h2bS5jCj4+IGluZGV4IDE3NTZjZjcuLjA5YTAxMGEgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gveDg2
L3hlbi9lbmxpZ2h0ZW5faHZtLmMKPj4gKysrIGIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0u
Ywo+PiBAQCAtMjMxLDExICsyMzEsMzcgQEAgYm9vbCBfX2luaXQgeGVuX2h2bV9uZWVkX2xhcGlj
KHZvaWQpCj4+ICAgCXJldHVybiB0cnVlOwo+PiAgIH0KPj4gICAKPj4gK3N0YXRpYyBfX2luaXQg
dm9pZCB4ZW5faHZtX25vcHZfZ3Vlc3RfbGF0ZV9pbml0KHZvaWQpCj4+ICt7Cj4+ICsjaWZkZWYg
Q09ORklHX1hFTl9QVkgKPj4gKwlpZiAoeDg2X3BsYXRmb3JtLmxlZ2FjeS5ydGMgfHwgIXg4Nl9w
bGF0Zm9ybS5sZWdhY3kubm9fdmdhKQo+PiArCQlyZXR1cm47Cj4+ICsKPj4gKwkvKiBQVkggZGV0
ZWN0ZWQuICovCj4+ICsJeGVuX3B2aCA9IHRydWU7Cj4+ICsKPj4gKwlwYW5pYygiXCJub3B2XCIg
YW5kIFwieGVuX25vcHZcIiBwYXJhbWV0ZXJzIGFyZSB1bnN1cHBvcnRlZCBpbiBQVkggZ3Vlc3Qu
Iik7Cj4+ICsjZW5kaWYKPj4gK30KPiBDYW4ndCBhbGwgb2YgdGhpcyBiZSBkb25lIGluIHhlbl9o
dm1fZ3Vlc3RfbGF0ZV9pbml0KCk/IEl0IGhhcyB0aGUgc2FtZQo+IHRlc3RzIGFscmVhZHkgYW5k
IGl0IHNlZW1zIHRvIG1lIHlvdSBzaG91bGQgYmUgYWJsZSB0byBwYW5pYyBmcm9tIHRoZXJlLgoK
SW5kZWVkLCBJIGRpZG4ndCByZWFsaXplIHRoaXMsIHRoYW5rcyBmb3IgcG9pbnRpbmcsIEknbGwg
Zml4IGl0LgoKWmhlbnpob25nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
