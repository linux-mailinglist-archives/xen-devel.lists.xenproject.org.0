Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBA035EFE
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 16:18:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYWhs-0005Je-9Z; Wed, 05 Jun 2019 14:16:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6QL9=UE=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1hYWhq-0005JZ-Pa
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 14:15:58 +0000
X-Inumbo-ID: 6fb57fef-879c-11e9-8980-bc764e045a96
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6fb57fef-879c-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 14:15:57 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x55E3wqk158240;
 Wed, 5 Jun 2019 14:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to : content-transfer-encoding; s=corp-2018-07-02;
 bh=jw2fbfM4TpkpV+IbipeFcznhok2954lpkNEKm7ZsCxQ=;
 b=jWLKLhtvjzxgRkzAnlZ9h2WOp2cndE/dJchJSYX8wm5mkZ6r3vChspaLH6FqnueUnAFm
 yRfO87FNK0Ctg/NX+blQM6ZhyH2jaQThhdPm3tDW4uPd4lpM2atZ6R/dDwlJiOtDa/SG
 qr0FEezduDJS7gWB3/Q2GdAqwgayHEn7NeqUruQ1ejzdc9Z3zON4WESwNSOl4fi3Vb6/
 zCShxcUEdswS8/nfueUtab7KCfig4fkDobFDknvIIUFIPXmXMV283dZS7IVJ+9VB+5xB
 08EkFR3tRj9Kc02xxrzFQT4A6/f2L4c+s+lihK0Pc/KiMtesG+1PfFysPCUAtU0E2d3M XA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2suj0qjskn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Jun 2019 14:15:51 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x55ECdLl119977;
 Wed, 5 Jun 2019 14:13:50 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2swnhc5gak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Jun 2019 14:13:50 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x55EDmhI016504;
 Wed, 5 Jun 2019 14:13:48 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 05 Jun 2019 07:13:48 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id 35EA66A0116; Wed,  5 Jun 2019 10:13:54 -0400 (EDT)
Date: Wed, 5 Jun 2019 10:13:54 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <20190605141354.GA16635@char.us.oracle.com>
References: <alpine.DEB.2.21.1905281546410.16734@sstabellini-ThinkPad-T480s>
 <4cfc2555-8933-b036-7068-470c388a665f@oracle.com>
 <alpine.DEB.2.21.1906031124300.14041@sstabellini-ThinkPad-T480s>
 <25ba38d9-3b9a-a748-714a-25ed207ce090@oracle.com>
 <alpine.DEB.2.21.1906040949090.14041@sstabellini-ThinkPad-T480s>
 <4e4bef15-3e0a-c4a3-7b82-ddadb687e684@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4e4bef15-3e0a-c4a3-7b82-ddadb687e684@oracle.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9278
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906050090
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9278
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906050090
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
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDM6NDE6NDBQTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+IE9uIDYvNC8xOSAxMjo1MSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+
ID4gT24gTW9uLCAzIEp1biAyMDE5LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4gPj4gT24gNi8z
LzE5IDI6MjUgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+Pj4gT24gVHVlLCAyOCBN
YXkgMjAxOSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+ID4+Pj4gT24gNS8yOC8xOSA2OjQ4IFBN
LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPj4+Pj4gRnJvbTogU3RlZmFubyBTdGFiZWxs
aW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgo+ID4+Pj4+Cj4gPj4+Pj4gT24gYXJtNjQgc3dpb3Rs
YiBpcyBvZnRlbiAobm90IGFsd2F5cykgYWxyZWFkeSBpbml0aWFsaXplZCBieSBtZW1faW5pdC4K
PiA+Pj4+PiBXZSBkb24ndCB3YW50IHRvIGluaXRpYWxpemUgaXQgdHdpY2UsIHdoaWNoIHdvdWxk
IHRyaWdnZXIgYSBzZWNvbmQKPiA+Pj4+PiBtZW1vcnkgYWxsb2NhdGlvbi4gTW9yZW92ZXIsIHRo
ZSBzZWNvbmQgbWVtb3J5IHBvb2wgaXMgdHlwaWNhbGx5IG1hZGUgb2YKPiA+Pj4+PiBoaWdoIHBh
Z2VzIGFuZCBlbmRzIHVwIHJlcGxhY2luZyB0aGUgb3JpZ2luYWwgbWVtb3J5IHBvb2wgb2YgbG93
IHBhZ2VzLgo+ID4+Pj4+IEFzIGEgc2lkZSBlZmZlY3Qgb2YgdGhpcyBjaGFuZ2UsIGl0IGlzIHBv
c3NpYmxlIHRvIGhhdmUgbG93IHBhZ2VzIGluCj4gPj4+Pj4gc3dpb3RsYi14ZW4gb24gYXJtNjQu
Cj4gPj4+Pj4KPiA+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZh
bm9zQHhpbGlueC5jb20+Cj4gPj4+PiBIYXMgdGhpcyBiZWVuIHRlc3RlZCBvbiB4ODY/Cj4gPj4+
IFllcywgSSBtYW5hZ2VkIHRvIHRlc3QgaXQgdXNpbmcgUUVNVS4gVGhlcmUgYXJlIG5vIGVmZmVj
dHMgb24geDg2LCBhcwo+ID4+PiB0aGUgY2hlY2sgaW9fdGxiX3N0YXJ0ICE9IDAgcmV0dXJucyBm
YWxzZS4KPiA+PiBJIHdvbmRlciB0aG91Z2ggd2hldGhlciB0aGlzIGlzIGFsd2F5cyB0aGUgY2Fz
ZS7CoCBXaGVuIHdlIGFyZSBjYWxsZWQKPiA+PiBmcm9tIHBjaV94ZW5fc3dpb3RsYl9pbml0X2xh
dGUoKSBmb3IgZXhhbXBsZS4KPiA+IEluIHRoYXQgY2FzZSwgcGNpX3hlbl9zd2lvdGxiX2luaXRf
bGF0ZSgpIGlzIGNhbGxlZCBieQo+ID4gcGNpZnJvbnRfY29ubmVjdF9hbmRfaW5pdF9kbWEsIHdo
aWNoIGRvZXM6Cj4gPgo+ID4gCWlmICghZXJyICYmICFzd2lvdGxiX25yX3RibCgpKSB7Cj4gPiAJ
CWVyciA9IHBjaV94ZW5fc3dpb3RsYl9pbml0X2xhdGUoKTsKPiA+IAkJaWYgKGVycikKPiA+IAkJ
CWRldl9lcnIoJnBkZXYtPnhkZXYtPmRldiwgIkNvdWxkIG5vdCBzZXR1cCBTV0lPVExCIVxuIik7
Cj4gPiAJfQo+ID4KPiA+IHBjaV94ZW5fc3dpb3RsYl9pbml0X2xhdGUoKSBpcyBvbmx5IGNhbGxl
ZCB3aGVuIHN3aW90bGJfbnJfdGJsKCkgcmV0dXJucwo+ID4gMC4gSWYgc3dpb3RsYl9ucl90Ymwo
KSByZXR1cm5zIDAsIGNlcnRhaW5seSB0aGUgc3dpb3RsYiBoYXMgbm90IGJlZW4KPiA+IGFsbG9j
YXRlZCB5ZXQsIGFuZCB0aGUgaW9fdGxiX3N0YXJ0ICE9IDAgY2hlY2sgYXQgdGhlIGJlZ2lubmlu
ZyBvZgo+ID4geGVuX3N3aW90bGJfaW5pdCB3aWxsIGFsc28gZmFpbC4gVGhlIGNvZGUgd2lsbCB0
YWtlIHRoZSBub3JtYWwKPiA+IHJvdXRlLCBzYW1lIGFzIHRvZGF5LiBJbiBzaG9ydCwgdGhlcmUg
c2hvdWxkIGJlIG5vIGVmZmVjdHMgb24geDg2Lgo+IAo+IAo+IE9LLCB0aGFua3MuCj4gCj4gUmV2
aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CgpQ
dXNoZWQgaW4gZGV2ZWwvZm9yLWxpbnVzLTUuMiBhbmQgd2lsbCBldmVudHVhbGx5IG1vdmUgaXQg
dG8gc3RhYmxlIGFuZCBwdXNoIHRvIExpbnVzIG5leHQtd2Vlay4KCkFyZSB0aGVyZSBhbnkgb3Ro
ZXIgcGF0Y2hlcyBJIHNob3VsZCBwaWNrIHVwPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
