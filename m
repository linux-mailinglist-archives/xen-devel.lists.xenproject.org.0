Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7490C3506D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 21:46:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYFKf-0005qK-JN; Tue, 04 Jun 2019 19:42:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=//cb=UD=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hYFKd-0005qF-CB
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 19:42:51 +0000
X-Inumbo-ID: ef3c356e-8700-11e9-8980-bc764e045a96
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ef3c356e-8700-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 19:42:49 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x54JcZTn154799;
 Tue, 4 Jun 2019 19:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=I0W6tkrmmn0EFWjEIpMc49ybVOB5DaVj8MpjLMk0VQg=;
 b=Iz6XFV1d0EwQdai80Eb36RTz2JYOiF1O2BlvXV6m1GfAoV6GLQK4Mex5KN/6Ij86EIXe
 kQojHQQt1k9t+wnck/rVjlypL45W9ZzgkuUn48AuRJpEW5omt5OEplwybSRdpKn1sedo
 2JWsTHZ+3iUpIqx3oQ5dhhBViWCbs6SeN7nqTaCEfpKekmqurD5mHTT2ZgQ1VvMd/d3S
 yArfy80q1/2YsCnqaP+PDmI8Jvb9wHxunoP+CV5ebbFqm+vs0AHaiJ0bKPBtIwzv3T0W
 SRZhHv9hAFTRW9YgQgTzMytZKTRgi7qC8UqnZfKRJK0mvjgvPQ0cSQ/P3W+iCh8VdgxP pw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2suj0qf1e6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 04 Jun 2019 19:42:44 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x54JfqNQ124981;
 Tue, 4 Jun 2019 19:42:44 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2swnghhqww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 04 Jun 2019 19:42:43 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x54Jgg1E002170;
 Tue, 4 Jun 2019 19:42:43 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 04 Jun 2019 12:42:42 -0700
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1905281546410.16734@sstabellini-ThinkPad-T480s>
 <4cfc2555-8933-b036-7068-470c388a665f@oracle.com>
 <alpine.DEB.2.21.1906031124300.14041@sstabellini-ThinkPad-T480s>
 <25ba38d9-3b9a-a748-714a-25ed207ce090@oracle.com>
 <alpine.DEB.2.21.1906040949090.14041@sstabellini-ThinkPad-T480s>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <4e4bef15-3e0a-c4a3-7b82-ddadb687e684@oracle.com>
Date: Tue, 4 Jun 2019 15:41:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906040949090.14041@sstabellini-ThinkPad-T480s>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9278
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906040124
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9278
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906040124
Subject: Re: [Xen-devel] [PATCH v2] xen/swiotlb: don't initialize swiotlb
 twice on arm64
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, Julien.Grall@arm.com,
 konrad.wilk@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNi80LzE5IDEyOjUxIFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24gTW9uLCAz
IEp1biAyMDE5LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+IE9uIDYvMy8xOSAyOjI1IFBNLCBT
dGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+PiBPbiBUdWUsIDI4IE1heSAyMDE5LCBCb3JpcyBP
c3Ryb3Zza3kgd3JvdGU6Cj4+Pj4gT24gNS8yOC8xOSA2OjQ4IFBNLCBTdGVmYW5vIFN0YWJlbGxp
bmkgd3JvdGU6Cj4+Pj4+IEZyb206IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54
LmNvbT4KPj4+Pj4KPj4+Pj4gT24gYXJtNjQgc3dpb3RsYiBpcyBvZnRlbiAobm90IGFsd2F5cykg
YWxyZWFkeSBpbml0aWFsaXplZCBieSBtZW1faW5pdC4KPj4+Pj4gV2UgZG9uJ3Qgd2FudCB0byBp
bml0aWFsaXplIGl0IHR3aWNlLCB3aGljaCB3b3VsZCB0cmlnZ2VyIGEgc2Vjb25kCj4+Pj4+IG1l
bW9yeSBhbGxvY2F0aW9uLiBNb3Jlb3ZlciwgdGhlIHNlY29uZCBtZW1vcnkgcG9vbCBpcyB0eXBp
Y2FsbHkgbWFkZSBvZgo+Pj4+PiBoaWdoIHBhZ2VzIGFuZCBlbmRzIHVwIHJlcGxhY2luZyB0aGUg
b3JpZ2luYWwgbWVtb3J5IHBvb2wgb2YgbG93IHBhZ2VzLgo+Pj4+PiBBcyBhIHNpZGUgZWZmZWN0
IG9mIHRoaXMgY2hhbmdlLCBpdCBpcyBwb3NzaWJsZSB0byBoYXZlIGxvdyBwYWdlcyBpbgo+Pj4+
PiBzd2lvdGxiLXhlbiBvbiBhcm02NC4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogU3RlZmFu
byBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgo+Pj4+IEhhcyB0aGlzIGJlZW4gdGVz
dGVkIG9uIHg4Nj8KPj4+IFllcywgSSBtYW5hZ2VkIHRvIHRlc3QgaXQgdXNpbmcgUUVNVS4gVGhl
cmUgYXJlIG5vIGVmZmVjdHMgb24geDg2LCBhcwo+Pj4gdGhlIGNoZWNrIGlvX3RsYl9zdGFydCAh
PSAwIHJldHVybnMgZmFsc2UuCj4+IEkgd29uZGVyIHRob3VnaCB3aGV0aGVyIHRoaXMgaXMgYWx3
YXlzIHRoZSBjYXNlLsKgIFdoZW4gd2UgYXJlIGNhbGxlZAo+PiBmcm9tIHBjaV94ZW5fc3dpb3Rs
Yl9pbml0X2xhdGUoKSBmb3IgZXhhbXBsZS4KPiBJbiB0aGF0IGNhc2UsIHBjaV94ZW5fc3dpb3Rs
Yl9pbml0X2xhdGUoKSBpcyBjYWxsZWQgYnkKPiBwY2lmcm9udF9jb25uZWN0X2FuZF9pbml0X2Rt
YSwgd2hpY2ggZG9lczoKPgo+IAlpZiAoIWVyciAmJiAhc3dpb3RsYl9ucl90YmwoKSkgewo+IAkJ
ZXJyID0gcGNpX3hlbl9zd2lvdGxiX2luaXRfbGF0ZSgpOwo+IAkJaWYgKGVycikKPiAJCQlkZXZf
ZXJyKCZwZGV2LT54ZGV2LT5kZXYsICJDb3VsZCBub3Qgc2V0dXAgU1dJT1RMQiFcbiIpOwo+IAl9
Cj4KPiBwY2lfeGVuX3N3aW90bGJfaW5pdF9sYXRlKCkgaXMgb25seSBjYWxsZWQgd2hlbiBzd2lv
dGxiX25yX3RibCgpIHJldHVybnMKPiAwLiBJZiBzd2lvdGxiX25yX3RibCgpIHJldHVybnMgMCwg
Y2VydGFpbmx5IHRoZSBzd2lvdGxiIGhhcyBub3QgYmVlbgo+IGFsbG9jYXRlZCB5ZXQsIGFuZCB0
aGUgaW9fdGxiX3N0YXJ0ICE9IDAgY2hlY2sgYXQgdGhlIGJlZ2lubmluZyBvZgo+IHhlbl9zd2lv
dGxiX2luaXQgd2lsbCBhbHNvIGZhaWwuIFRoZSBjb2RlIHdpbGwgdGFrZSB0aGUgbm9ybWFsCj4g
cm91dGUsIHNhbWUgYXMgdG9kYXkuIEluIHNob3J0LCB0aGVyZSBzaG91bGQgYmUgbm8gZWZmZWN0
cyBvbiB4ODYuCgoKT0ssIHRoYW5rcy4KClJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJv
cmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
