Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF0F5C7F7
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 05:52:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hi9mG-0001oY-46; Tue, 02 Jul 2019 03:48:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5+mQ=U7=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hi9mE-0001oT-BE
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 03:48:18 +0000
X-Inumbo-ID: 36f4c54c-9c7c-11e9-9022-5f0f846eba53
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36f4c54c-9c7c-11e9-9022-5f0f846eba53;
 Tue, 02 Jul 2019 03:48:13 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x623joE8164668;
 Tue, 2 Jul 2019 03:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=gdW0k6GFcvfCYhWjUDdQVw9IHGxp4MNf7humvJiGshw=;
 b=tUh2nNFH+tZX8xkAjB+238YKlYl2id8wnb91earTc7hbfSFPqqSGt5HIO80GshAj3Dk+
 JvnqaBBCB70zx6SD1MS+IKTwl6o59rC0T9384VjTi4BzgbmjxQgbP5S8/d2PJoWwWNkV
 q/80obpCDjTeBijh1Yha8Zk31/QZF98nKbplEFIOa4CZqPk9Fco+pDo4ODe47gHAnOIl
 +KV0LifNIxQNUofim3A7et/oyq5/keRs3YMP9mWxt2gvALpY9OJc5ZCGlDEUnmsvUAUy
 lX5dFm7eucbsj0N/uqLENuzPUOuj6CoRkOxbjVh05IoIkO1oWrdvVh4FXUK6KAMB9iII mQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2te5tbgw9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jul 2019 03:48:00 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x623lxbX071550;
 Tue, 2 Jul 2019 03:47:59 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2tebku0yg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jul 2019 03:47:59 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x623lp4A024771;
 Tue, 2 Jul 2019 03:47:52 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 01 Jul 2019 20:47:51 -0700
Date: Mon, 1 Jul 2019 23:48:18 -0400
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Message-ID: <20190702034818.GB8003@bostrovs-us.us.oracle.com>
References: <1561947628-1147-1-git-send-email-zhenzhong.duan@oracle.com>
 <1561947628-1147-4-git-send-email-zhenzhong.duan@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1561947628-1147-4-git-send-email-zhenzhong.duan@oracle.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9305
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907020040
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9305
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907020039
Subject: Re: [Xen-devel] [PATCH v3 3/4] Revert "xen: Introduce 'xen_nopv' to
 disable PV extensions for HVM guests."
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
Cc: jgross@suse.com, sstabellini@kernel.org, linux-kernel@vger.kernel.org,
 mingo@redhat.com, bp@alien8.de, boris.ostrovsky@oracle.co,
 xen-devel@lists.xenproject.org, tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMDEsIDIwMTkgYXQgMTA6MjA6MjdBTSArMDgwMCwgWmhlbnpob25nIER1YW4g
d3JvdGU6Cj4gVGhpcyByZXZlcnRzIGNvbW1pdCA4ZDY5M2I5MTFiYjljNTcwMDljMjRjYjE3NzJk
MjA1Yjg0Yzc5ODVjLgo+IAo+IEluc3RlYWQgd2UgdXNlIGFuIHVuaWZpZWQgcGFyYW1ldGVyICdu
b3B2JyBmb3IgYWxsIHRoZSBoeXBlcnZpc29yCj4gcGxhdGZvcm1zLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFpoZW56aG9uZyBEdWFuIDx6aGVuemhvbmcuZHVhbkBvcmFjbGUuY29tPgo+IFJldmlld2Vk
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gQ2M6IEJvcmlzIE9zdHJvdnNr
eSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+Cj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPgo+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiBDYzogSW5n
byBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+Cj4gQ2M6IEJvcmlzbGF2IFBldGtvdiA8YnBAYWxp
ZW44LmRlPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0
ZXJzLnR4dCB8ICA0IC0tLS0KPiAgYXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0uYyAgICAgICAg
ICAgICAgICAgICAgfCAxMiArLS0tLS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMTUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
YWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1n
dWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKPiBpbmRleCAyMWUwOGFmLi5kNWMzZGNjIDEwMDY0
NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQK
PiBAQCAtNTI1MSwxMCArNTI1MSw2IEBACj4gIAkJCURpc2FibGVzIHRoZSB0aWNrZXRsb2NrIHNs
b3dwYXRoIHVzaW5nIFhlbiBQVgo+ICAJCQlvcHRpbWl6YXRpb25zLgo+ICAKPiAtCXhlbl9ub3B2
CVtYODZdCj4gLQkJCURpc2FibGVzIHRoZSBQViBvcHRpbWl6YXRpb25zIGZvcmNpbmcgdGhlIEhW
TSBndWVzdCB0bwo+IC0JCQlydW4gYXMgZ2VuZXJpYyBIVk0gZ3Vlc3Qgd2l0aCBubyBQViBkcml2
ZXJzLgo+IC0KCgpTbyBzb21lb25lIHVwZ3JhZGVzIHRoZSBrZXJuZWwgYW5kIHN1ZGRlbmx5IHRo
aW5ncyB3b3JrIGRpZmZlcmVudGx5PwoKQXQgbGVhc3QgdGhlcmUgc2hvdWxkIGJlIGEgd2Fybmlu
ZyB0aGF0IHRoZSBvcHRpb24gaGFzIGJlZW4gcmVwbGFjZWQKd2l0aCAnbm9wdicgKGJ1dCBJIHdv
dWxkIGFjdHVhbGx5IGtlZXAgdGhpcyBvcHRpb24gd29ya2luZyBhcyB3ZWxsKS4KCi1ib3JpcwoK
Cgo+ICAJeGVuX3NjcnViX3BhZ2VzPQlbWEVOXQo+ICAJCQlCb29sZWFuIG9wdGlvbiB0byBjb250
cm9sIHNjcnViYmluZyBwYWdlcyBiZWZvcmUgZ2l2aW5nIHRoZW0gYmFjawo+ICAJCQl0byBYZW4s
IGZvciB1c2UgYnkgb3RoZXIgZG9tYWlucy4gQ2FuIGJlIGFsc28gY2hhbmdlZCBhdCBydW50aW1l
Cj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMgYi9hcmNoL3g4Ni94
ZW4vZW5saWdodGVuX2h2bS5jCj4gaW5kZXggYWM0OTQzYy4uN2ZjYjRlYSAxMDA2NDQKPiAtLS0g
YS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jCj4gKysrIGIvYXJjaC94ODYveGVuL2VubGln
aHRlbl9odm0uYwo+IEBAIC0yMTAsMTggKzIxMCw4IEBAIHN0YXRpYyB2b2lkIF9faW5pdCB4ZW5f
aHZtX2d1ZXN0X2luaXQodm9pZCkKPiAgI2VuZGlmCj4gIH0KPiAgCj4gLXN0YXRpYyBib29sIHhl
bl9ub3B2Owo+IC1zdGF0aWMgX19pbml0IGludCB4ZW5fcGFyc2Vfbm9wdihjaGFyICphcmcpCj4g
LXsKPiAtICAgICAgIHhlbl9ub3B2ID0gdHJ1ZTsKPiAtICAgICAgIHJldHVybiAwOwo+IC19Cj4g
LWVhcmx5X3BhcmFtKCJ4ZW5fbm9wdiIsIHhlbl9wYXJzZV9ub3B2KTsKPiAtCj4gIGJvb2wgX19p
bml0IHhlbl9odm1fbmVlZF9sYXBpYyh2b2lkKQo+ICB7Cj4gLQlpZiAoeGVuX25vcHYpCj4gLQkJ
cmV0dXJuIGZhbHNlOwo+ICAJaWYgKHhlbl9wdl9kb21haW4oKSkKPiAgCQlyZXR1cm4gZmFsc2U7
Cj4gIAlpZiAoIXhlbl9odm1fZG9tYWluKCkpCj4gQEAgLTIzMyw3ICsyMjMsNyBAQCBib29sIF9f
aW5pdCB4ZW5faHZtX25lZWRfbGFwaWModm9pZCkKPiAgCj4gIHN0YXRpYyB1aW50MzJfdCBfX2lu
aXQgeGVuX3BsYXRmb3JtX2h2bSh2b2lkKQo+ICB7Cj4gLQlpZiAoeGVuX3B2X2RvbWFpbigpIHx8
IHhlbl9ub3B2KQo+ICsJaWYgKHhlbl9wdl9kb21haW4oKSkKPiAgCQlyZXR1cm4gMDsKPiAgCj4g
IAlyZXR1cm4geGVuX2NwdWlkX2Jhc2UoKTsKPiAtLSAKPiAxLjguMy4xCj4gCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
