Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2A032D60
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 12:02:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXjlT-0005ly-Vd; Mon, 03 Jun 2019 10:00:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQxh=UC=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hXjlS-0005ll-8d
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 10:00:26 +0000
X-Inumbo-ID: 66c26260-85e6-11e9-8980-bc764e045a96
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 66c26260-85e6-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 10:00:24 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 3 Jun
 2019 17:58:09 +0800
To: Jan Beulich <JBeulich@suse.com>
References: <735ee4900c5054a558c1cb7c3b6d7e9a@sslemail.net>
 <5CF4E7E702000078002347A9@prv1-mh.provo.novell.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <64a7b056-d6ab-45cd-292a-1ecb9823d2c5@mxnavi.com>
Date: Mon, 3 Jun 2019 18:00:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF4E7E702000078002347A9@prv1-mh.provo.novell.com>
Content-Language: en-US
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: Re: [Xen-devel] [PATCH RESEND] xen: notifier: refine
 'notifier_head', use 'list_head' directly
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDYvMy8xOSAxNzoyNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDMuMDYuMTkgYXQg
MDM6MzMsIDxjaGVuYmFvZG9uZ0BteG5hdmkuY29tPiB3cm90ZToKPj4gJ25vdGlmaWVyX2Jsb2Nr
JyBjYW4gYmUgcmVwbGFjZWQgd2l0aCAnbGlzdF9oZWFkJyB3aGVuIHVzZWQgZm9yCj4+ICdub3Rp
Zmllcl9oZWFkJywgdGhpcyBtYWtlIHRoZSBhIGxpdHRsZSBtb3JlIGNsZWFyLgo+IEkgZ3Vlc3Mg
eW91IG1lYW4gIi4uLiBtYWtlcyB0aGUgY29kZSBhIGxpdHRsZSAuLi4iPwpZZXMsIGZpeGVkLCBz
ZWUgdjEuCj4+IEBAIC03MSwxNiArNzEsMTYgQEAgaW50IG5vdGlmaWVyX2NhbGxfY2hhaW4oCj4+
ICAgewo+PiAgICAgICBpbnQgcmV0ID0gTk9USUZZX0RPTkU7Cj4+ICAgICAgIHN0cnVjdCBsaXN0
X2hlYWQgKmN1cnNvcjsKPj4gLSAgICBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iOwo+PiArICAg
IHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmIgPSBOVUxMOwo+PiAgICAgICBib29sX3QgcmV2ZXJz
ZSA9ICEhKHZhbCAmIE5PVElGWV9SRVZFUlNFKTsKPj4gICAKPj4gLSAgICBjdXJzb3IgPSAmKHBj
dXJzb3IgJiYgKnBjdXJzb3IgPyAqcGN1cnNvciA6ICZuaC0+aGVhZCktPmNoYWluOwo+PiArICAg
IGN1cnNvciA9IChwY3Vyc29yICYmICpwY3Vyc29yID8gJigqcGN1cnNvciktPmNoYWluIDogJm5o
LT5oZWFkKTsKPiBUaGUgb3V0ZXJtb3N0IHBhcmVudGhlc2VzIGFyZSBub3cgbm90IHJlYWxseSBu
ZWVkZWQgYW55bW9yZS4KWWVzLCBmaXhlZCwgc2VlIHYxLgo+Cj4+IC0tLSBhL3hlbi9pbmNsdWRl
L3hlbi9ub3RpZmllci5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9ub3RpZmllci5oCj4+IEBA
IC0yOSwxMyArMjksMTIgQEAgc3RydWN0IG5vdGlmaWVyX2Jsb2NrIHsKPj4gICB9Owo+PiAgIAo+
PiAgIHN0cnVjdCBub3RpZmllcl9oZWFkIHsKPj4gLSAgICBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sg
aGVhZDsKPj4gKyAgICBzdHJ1Y3QgbGlzdF9oZWFkIGhlYWQ7Cj4+ICAgfTsKPj4gICAKPj4gLSNk
ZWZpbmUgTk9USUZJRVJfSU5JVChuYW1lKSB7IC5oZWFkLmNoYWluID0gTElTVF9IRUFEX0lOSVQo
bmFtZS5oZWFkLmNoYWluKSB9Cj4gTm90ZSB0aGUgYmxhbmtzIGltbWVkaWF0ZWx5IGluc2lkZSB0
aGUgZmlndXJlIGJyYWNlcyAtIC4uLgpZZXMsIGZpeGVkLCBzZWUgdjEuCj4KPj4gKyNkZWZpbmUg
Tk9USUZJRVJfSEVBRChuYW1lKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4+ICsgIHN0cnVjdCBub3RpZmllcl9oZWFkIG5hbWUgPSB7LmhlYWQg
PSBMSVNUX0hFQURfSU5JVChuYW1lLmhlYWQpfQo+IC4uLiBwbGVhc2UgZG9uJ3QgYnJlYWsgc3Vj
aCBzdHlsZSBhc3BlY3RzLCB1bmxlc3MgeW91IGtub3cKPiBpdCBpcyBzb21ldGhpbmcgdGhhdCBu
ZWVkcyBmaXhpbmcgKGZvciBiZWluZyBpbiB2aW9sYXRpb24gb2Ygb3VyCj4gc3R5bGUgZ3VpZGVs
aW5lcykuClllcywgZml4ZWQsIHNlZSB2MS4KPgo+IEphbgo+Cj4KPiAuCj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
