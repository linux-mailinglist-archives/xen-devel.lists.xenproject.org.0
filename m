Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6615D5E6
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 20:09:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiN9D-00029v-GX; Tue, 02 Jul 2019 18:04:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5+mQ=U7=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hiN9B-00029q-5B
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 18:04:53 +0000
X-Inumbo-ID: e210d692-9cf3-11e9-86e1-dfab786cc288
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e210d692-9cf3-11e9-86e1-dfab786cc288;
 Tue, 02 Jul 2019 18:04:49 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x62I47BJ103338;
 Tue, 2 Jul 2019 18:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=jbycZdRLC69QbR6HcJd04SV8Mxw3HQTAcTaVQDlNWfc=;
 b=iLZawXziyt7/tf8BZXHAavj0BvhT6S1jkav0dL1Jq7WYj94bITtQ49omVMpXDaGhc3dr
 rAP4DsHik/Nw3OOcrA/wHFFwOm6x8pmgU/cnRBABDbzM3NJWbVysSiK3aqRiWL+5xYms
 OR+VXSeN+f9ZoLjkqBrQB75qSgoJ1dwOqD6DRMHfTGPGWDqWvHU64M2tERVB4BUU48wI
 ktxHjgBwC2Irur+K00O+tVOoInDKaZbWbE6f0rzcQFytJx/XtThW5MX8b3518rLQ0L3D
 tRmUeAt/zxvYgrZYbcXAAcGTUVpB2oBVqmK4iZGpPreSWigtMpKNE3jFVS985WHLT5zB /g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2te5tbn8ff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jul 2019 18:04:35 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x62I39t0088704;
 Tue, 2 Jul 2019 18:04:35 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2tebkudpk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jul 2019 18:04:35 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x62I4Xvv019653;
 Tue, 2 Jul 2019 18:04:33 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 02 Jul 2019 11:04:32 -0700
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>, linux-kernel@vger.kernel.org
References: <1561958399-28906-1-git-send-email-zhenzhong.duan@oracle.com>
 <1561958399-28906-5-git-send-email-zhenzhong.duan@oracle.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <cc61b7d3-b87d-7c52-57c9-b53135c98d97@oracle.com>
Date: Tue, 2 Jul 2019 14:04:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1561958399-28906-5-git-send-email-zhenzhong.duan@oracle.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9306
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907020199
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9306
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907020199
Subject: Re: [Xen-devel] [PATCH v4 4/5] x86/xen: Add 'nopv' support for HVM
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

T24gNy8xLzE5IDE6MTkgQU0sIFpoZW56aG9uZyBEdWFuIHdyb3RlOgo+IFBWSCBndWVzdCBuZWVk
cyBQViBleHRlbnRpb25zIHRvIHdvcmssIHNvICdub3B2JyBwYXJhbWV0ZXIgc2hvdWxkIGJlCj4g
aWdub3JlZCBmb3IgUFZIIGJ1dCBub3QgZm9yIEhWTSBndWVzdC4KPgo+IElmIFBWSCBndWVzdCBi
b290cyB1cCB2aWEgdGhlIFhlbi1QVkggYm9vdCBlbnRyeSwgeGVuX3B2aCBpcyBzZXQgZWFybHks
Cj4gd2Uga25vdyBpdCdzIFBWSCBndWVzdCBhbmQgaWdub3JlICdub3B2JyBwYXJhbWV0ZXIgZGly
ZWN0bHkuCj4KPiBJZiBQVkggZ3Vlc3QgYm9vdHMgdXAgdmlhIHRoZSBub3JtYWwgYm9vdCBlbnRy
eSBzYW1lIGFzIEhWTSBndWVzdCwgaXQncwo+IGhhcmQgdG8gZGlzdGluZ3Vpc2ggUFZIIGFuZCBI
Vk0gZ3Vlc3QgYXQgdGhhdCB0aW1lLgo+Cj4gVG8gaGFuZGxlIHRoYXQgY2FzZSwgYWRkIGEgbmV3
IGZ1bmN0aW9uIHhlbl9odm1fbm9wdl9ndWVzdF9sYXRlX2luaXQoKQo+IHRvIGRldGVjdCBQVkgg
YXQgYSBsYXRlIHRpbWUgYW5kIHBhbmljIGl0c2VsZiBpZiAnbm9wdicgZW5hYmxlZCBmb3IgYQo+
IFBWSCBndWVzdC4KPgo+IFNpZ25lZC1vZmYtYnk6IFpoZW56aG9uZyBEdWFuIDx6aGVuemhvbmcu
ZHVhbkBvcmFjbGUuY29tPgo+IENjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBv
cmFjbGUuY29tPgo+IENjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gQ2M6IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBDYzogVGhvbWFzIEds
ZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4gQ2M6IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRo
YXQuY29tPgo+IENjOiBCb3Jpc2xhdiBQZXRrb3YgPGJwQGFsaWVuOC5kZT4KPiAtLS0KPiAgYXJj
aC94ODYveGVuL2VubGlnaHRlbl9odm0uYyB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5j
Cj4gaW5kZXggN2ZjYjRlYS4uMzQwZGZmOCAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni94ZW4vZW5s
aWdodGVuX2h2bS5jCj4gKysrIGIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0uYwo+IEBAIC0y
NSw2ICsyNSw3IEBACj4gICNpbmNsdWRlICJtbXUuaCIKPiAgI2luY2x1ZGUgInNtcC5oIgo+ICAK
PiArZXh0ZXJuIGJvb2wgbm9wdjsKCgpJJ2QgcHV0IHRoaXMgaW4gYXJjaC94ODYvaW5jbHVkZS9h
c20vaHlwZXJ2aXNvci5oCgoKPiAgc3RhdGljIHVuc2lnbmVkIGxvbmcgc2hhcmVkX2luZm9fcGZu
Owo+ICAKPiAgdm9pZCB4ZW5faHZtX2luaXRfc2hhcmVkX2luZm8odm9pZCkKPiBAQCAtMjIxLDEx
ICsyMjIsMzYgQEAgYm9vbCBfX2luaXQgeGVuX2h2bV9uZWVkX2xhcGljKHZvaWQpCj4gIAlyZXR1
cm4gdHJ1ZTsKPiAgfQo+ICAKPiArc3RhdGljIF9faW5pdCB2b2lkIHhlbl9odm1fbm9wdl9ndWVz
dF9sYXRlX2luaXQodm9pZCkKPiArewo+ICsjaWZkZWYgQ09ORklHX1hFTl9QVkgKPiArCWlmICh4
ODZfcGxhdGZvcm0ubGVnYWN5LnJ0YyB8fCAheDg2X3BsYXRmb3JtLmxlZ2FjeS5ub192Z2EpCj4g
KwkJcmV0dXJuOwo+ICsKPiArCS8qIFBWSCBkZXRlY3RlZC4gKi8KPiArCXhlbl9wdmggPSB0cnVl
Owo+ICsKPiArCXBhbmljKCJub3B2IHBhcmFtZXRlciBpc24ndCBzdXBwb3J0ZWQgaW4gUFZIIGd1
ZXN0LiIpOwo+ICsjZW5kaWYKPiArfQo+ICsKPiArCj4gIHN0YXRpYyB1aW50MzJfdCBfX2luaXQg
eGVuX3BsYXRmb3JtX2h2bSh2b2lkKQo+ICB7Cj4gIAlpZiAoeGVuX3B2X2RvbWFpbigpKQo+ICAJ
CXJldHVybiAwOwo+ICAKPiArCWlmICh4ZW5fcHZoX2RvbWFpbigpICYmIG5vcHYpIHsKPiArCQkv
KiBHdWVzdCBib290aW5nIHZpYSB0aGUgWGVuLVBWSCBib290IGVudHJ5IGdvZXMgaGVyZSAqLwo+
ICsJCXByX2luZm8oIm5vcHYgcGFyYW1ldGVyIGlzIGlnbm9yZWQgaW4gUFZIIGd1ZXN0XG4iKTsK
CgoKwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBub3B2ID0g
ZmFsc2U7CgpqdXN0IGluIGNhc2Ugbm9wdiBpcyB1c2VkIHNvbWV3aGVyZSBlbHNlIGxhdGVyPwoK
Ci1ib3JpcwoKPiArCX0gZWxzZSBpZiAobm9wdikgewo+ICsJCS8qCj4gKwkJICogR3Vlc3QgYm9v
dGluZyB2aWEgbm9ybWFsIGJvb3QgZW50cnkgKGxpa2UgdmlhIGdydWIyKSBnb2VzCj4gKwkJICog
aGVyZS4KPiArCQkgKi8KPiArCQl4ODZfaW5pdC5oeXBlci5ndWVzdF9sYXRlX2luaXQgPSB4ZW5f
aHZtX25vcHZfZ3Vlc3RfbGF0ZV9pbml0Owo+ICsJCXJldHVybiAwOwo+ICsJfQo+ICAJcmV0dXJu
IHhlbl9jcHVpZF9iYXNlKCk7Cj4gIH0KPiAgCj4gQEAgLTI1OCw0ICsyODQsNSBAQCBzdGF0aWMg
X19pbml0IHZvaWQgeGVuX2h2bV9ndWVzdF9sYXRlX2luaXQodm9pZCkKPiAgCS5pbml0LmluaXRf
bWVtX21hcHBpbmcJPSB4ZW5faHZtX2luaXRfbWVtX21hcHBpbmcsCj4gIAkuaW5pdC5ndWVzdF9s
YXRlX2luaXQJPSB4ZW5faHZtX2d1ZXN0X2xhdGVfaW5pdCwKPiAgCS5ydW50aW1lLnBpbl92Y3B1
ICAgICAgID0geGVuX3Bpbl92Y3B1LAo+ICsJLmlnbm9yZV9ub3B2ICAgICAgICAgICAgPSB0cnVl
LAo+ICB9OwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
