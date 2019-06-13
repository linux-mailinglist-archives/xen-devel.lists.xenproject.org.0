Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B49343733
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 16:24:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbQcZ-0007Bm-6p; Thu, 13 Jun 2019 14:22:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ivaz=UM=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1hbQcX-0007Be-Tt
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 14:22:29 +0000
X-Inumbo-ID: ac4a4692-8de6-11e9-8980-bc764e045a96
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ac4a4692-8de6-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 14:22:28 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5DE9Es4048877;
 Thu, 13 Jun 2019 14:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to : content-transfer-encoding; s=corp-2018-07-02;
 bh=kWBoq9JTjqVn9J1/UnH/g18ill295HvUxTwBPnrfs20=;
 b=Hl7U5Pk1a3ImexioX4zQjmFfGVWB1yBiGd14xIAiatVmnUABA52I5X4GPyOiZlgRUvun
 cslj5YzxGByYk5T0ismdFIM0coRPO8rNFJuu3q3AJCl5p3jzutNFpsz/wZ4U4pXwh6UV
 mCrsBEstlJQzEdzPE1cDWv4hQJdRvVikPgIqz3CTUyBTwtRSAWi3kZsTI5uhDKI0Kd2c
 KNmff9E3zvFYWYvgEDc3hP4mbUjafl5YWI1ovqmkP0q8X+8q8NE+xIr/EsHFd3TCk0Nl
 emKiXVU5ohsXiGsGVmswzDUsEE0XecQMCoQYZSNtoMZVjCoZqvxfEMyC51HsdPbjeQTH iQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2t04ynssst-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Jun 2019 14:22:23 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5DELSpX043122;
 Thu, 13 Jun 2019 14:22:23 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 2t024vhnej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Jun 2019 14:22:22 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5DEMLgA002996;
 Thu, 13 Jun 2019 14:22:21 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 13 Jun 2019 07:22:21 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id 7F9B36A0125; Thu, 13 Jun 2019 10:23:45 -0400 (EDT)
Date: Thu, 13 Jun 2019 10:23:45 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20190613142345.GC456@char.us.oracle.com>
References: <alpine.DEB.2.21.1905281546410.16734@sstabellini-ThinkPad-T480s>
 <4cfc2555-8933-b036-7068-470c388a665f@oracle.com>
 <alpine.DEB.2.21.1906031124300.14041@sstabellini-ThinkPad-T480s>
 <25ba38d9-3b9a-a748-714a-25ed207ce090@oracle.com>
 <alpine.DEB.2.21.1906040949090.14041@sstabellini-ThinkPad-T480s>
 <4e4bef15-3e0a-c4a3-7b82-ddadb687e684@oracle.com>
 <20190605141354.GA16635@char.us.oracle.com>
 <9d5a5e02-842f-fd2e-1b85-dd8a68600704@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9d5a5e02-842f-fd2e-1b85-dd8a68600704@suse.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9286
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906130108
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9286
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906130108
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
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien.Grall@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMDQ6MjQ6MDZQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAwNS4wNi4xOSAxNjoxMywgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIHdyb3RlOgo+
ID4gT24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDM6NDE6NDBQTSAtMDQwMCwgQm9yaXMgT3N0cm92
c2t5IHdyb3RlOgo+ID4gPiBPbiA2LzQvMTkgMTI6NTEgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3
cm90ZToKPiA+ID4gPiBPbiBNb24sIDMgSnVuIDIwMTksIEJvcmlzIE9zdHJvdnNreSB3cm90ZToK
PiA+ID4gPiA+IE9uIDYvMy8xOSAyOjI1IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4g
PiA+ID4gPiA+IE9uIFR1ZSwgMjggTWF5IDIwMTksIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiA+
ID4gPiA+ID4gPiBPbiA1LzI4LzE5IDY6NDggUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToK
PiA+ID4gPiA+ID4gPiA+IEZyb206IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54
LmNvbT4KPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gT24gYXJtNjQgc3dpb3RsYiBp
cyBvZnRlbiAobm90IGFsd2F5cykgYWxyZWFkeSBpbml0aWFsaXplZCBieSBtZW1faW5pdC4KPiA+
ID4gPiA+ID4gPiA+IFdlIGRvbid0IHdhbnQgdG8gaW5pdGlhbGl6ZSBpdCB0d2ljZSwgd2hpY2gg
d291bGQgdHJpZ2dlciBhIHNlY29uZAo+ID4gPiA+ID4gPiA+ID4gbWVtb3J5IGFsbG9jYXRpb24u
IE1vcmVvdmVyLCB0aGUgc2Vjb25kIG1lbW9yeSBwb29sIGlzIHR5cGljYWxseSBtYWRlIG9mCj4g
PiA+ID4gPiA+ID4gPiBoaWdoIHBhZ2VzIGFuZCBlbmRzIHVwIHJlcGxhY2luZyB0aGUgb3JpZ2lu
YWwgbWVtb3J5IHBvb2wgb2YgbG93IHBhZ2VzLgo+ID4gPiA+ID4gPiA+ID4gQXMgYSBzaWRlIGVm
ZmVjdCBvZiB0aGlzIGNoYW5nZSwgaXQgaXMgcG9zc2libGUgdG8gaGF2ZSBsb3cgcGFnZXMgaW4K
PiA+ID4gPiA+ID4gPiA+IHN3aW90bGIteGVuIG9uIGFybTY0Lgo+ID4gPiA+ID4gPiA+ID4gCj4g
PiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9z
QHhpbGlueC5jb20+Cj4gPiA+ID4gPiA+ID4gSGFzIHRoaXMgYmVlbiB0ZXN0ZWQgb24geDg2Pwo+
ID4gPiA+ID4gPiBZZXMsIEkgbWFuYWdlZCB0byB0ZXN0IGl0IHVzaW5nIFFFTVUuIFRoZXJlIGFy
ZSBubyBlZmZlY3RzIG9uIHg4NiwgYXMKPiA+ID4gPiA+ID4gdGhlIGNoZWNrIGlvX3RsYl9zdGFy
dCAhPSAwIHJldHVybnMgZmFsc2UuCj4gPiA+ID4gPiBJIHdvbmRlciB0aG91Z2ggd2hldGhlciB0
aGlzIGlzIGFsd2F5cyB0aGUgY2FzZS7CoCBXaGVuIHdlIGFyZSBjYWxsZWQKPiA+ID4gPiA+IGZy
b20gcGNpX3hlbl9zd2lvdGxiX2luaXRfbGF0ZSgpIGZvciBleGFtcGxlLgo+ID4gPiA+IEluIHRo
YXQgY2FzZSwgcGNpX3hlbl9zd2lvdGxiX2luaXRfbGF0ZSgpIGlzIGNhbGxlZCBieQo+ID4gPiA+
IHBjaWZyb250X2Nvbm5lY3RfYW5kX2luaXRfZG1hLCB3aGljaCBkb2VzOgo+ID4gPiA+IAo+ID4g
PiA+IAlpZiAoIWVyciAmJiAhc3dpb3RsYl9ucl90YmwoKSkgewo+ID4gPiA+IAkJZXJyID0gcGNp
X3hlbl9zd2lvdGxiX2luaXRfbGF0ZSgpOwo+ID4gPiA+IAkJaWYgKGVycikKPiA+ID4gPiAJCQlk
ZXZfZXJyKCZwZGV2LT54ZGV2LT5kZXYsICJDb3VsZCBub3Qgc2V0dXAgU1dJT1RMQiFcbiIpOwo+
ID4gPiA+IAl9Cj4gPiA+ID4gCj4gPiA+ID4gcGNpX3hlbl9zd2lvdGxiX2luaXRfbGF0ZSgpIGlz
IG9ubHkgY2FsbGVkIHdoZW4gc3dpb3RsYl9ucl90YmwoKSByZXR1cm5zCj4gPiA+ID4gMC4gSWYg
c3dpb3RsYl9ucl90YmwoKSByZXR1cm5zIDAsIGNlcnRhaW5seSB0aGUgc3dpb3RsYiBoYXMgbm90
IGJlZW4KPiA+ID4gPiBhbGxvY2F0ZWQgeWV0LCBhbmQgdGhlIGlvX3RsYl9zdGFydCAhPSAwIGNo
ZWNrIGF0IHRoZSBiZWdpbm5pbmcgb2YKPiA+ID4gPiB4ZW5fc3dpb3RsYl9pbml0IHdpbGwgYWxz
byBmYWlsLiBUaGUgY29kZSB3aWxsIHRha2UgdGhlIG5vcm1hbAo+ID4gPiA+IHJvdXRlLCBzYW1l
IGFzIHRvZGF5LiBJbiBzaG9ydCwgdGhlcmUgc2hvdWxkIGJlIG5vIGVmZmVjdHMgb24geDg2Lgo+
ID4gPiAKPiA+ID4gCj4gPiA+IE9LLCB0aGFua3MuCj4gPiA+IAo+ID4gPiBSZXZpZXdlZC1ieTog
Qm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KPiA+IAo+ID4gUHVz
aGVkIGluIGRldmVsL2Zvci1saW51cy01LjIgYW5kIHdpbGwgZXZlbnR1YWxseSBtb3ZlIGl0IHRv
IHN0YWJsZSBhbmQgcHVzaCB0byBMaW51cyBuZXh0LXdlZWsuCj4gPiAKPiA+IEFyZSB0aGVyZSBh
bnkgb3RoZXIgcGF0Y2hlcyBJIHNob3VsZCBwaWNrIHVwPwo+ID4gCj4gCj4gSSB0aGluayBhdCBs
ZWFzdCB0aGUgZmlyc3QgdHdvIHBhdGNoZXMgZnJvbSBteSBzZXJpZXM6Cj4gCj4gaHR0cHM6Ly9w
YXRjaGV3Lm9yZy9YZW4vMjAxOTA1MjkwOTA0MDcuMTIyNS0xLWpncm9zc0BzdXNlLmNvbS8KPiAK
PiBhcmUgcmVhZHkgdG8gZ28gaW4uCgojMiBwYXRjaCBzYXlzOgoKCSI+IFRvIGJlIHN5bW1ldHJp
YyB3aXRoIHNldHRpbmcgdGhlIGZsYWcgb25seSBhZnRlciBoYXZpbmcgbWFkZSB0aGUgcmVnaW9u
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAoJPiBjb250aWd1b3VzLCBhbmQg
dG8gYXZvaWQgKHBlcmhhcHMganVzdCB0aGVvcmV0aWNhbCkgcmFjZXMsIHdvdWxkbid0IGl0IGJl
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKCT4gYmV0dGVyIHRvIGNsZWFyIHRo
ZSBmbGFnIGJlZm9yZSBjYWxsaW5nIHhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKCk/ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCgk+IEV2ZW4gYmV0dGVyIHdvdWxkIGJl
IGEgVGVzdEFuZENsZWFyLi4uKCkgb3BlcmF0aW9uLiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAoKCUkgbGlrZSB0aGF0IGlkZWEuCiIKPwoK
PiAKPiAKPiBKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
