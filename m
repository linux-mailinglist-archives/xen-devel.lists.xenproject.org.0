Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 846F8A59F7
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 16:58:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4nlI-0007XB-Hy; Mon, 02 Sep 2019 14:56:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i4nlG-0007X6-NR
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 14:56:54 +0000
X-Inumbo-ID: e6943866-cd91-11e9-aea3-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6943866-cd91-11e9-aea3-12813bfff9fa;
 Mon, 02 Sep 2019 14:56:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E7522AE65;
 Mon,  2 Sep 2019 14:56:49 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190902113034.97934-1-roger.pau@citrix.com>
 <e4afc421-17ef-32a7-21f4-3ecb65ebb44a@suse.com>
 <20190902135813.tz64qcg5rxujis6j@Air-de-Roger>
 <386cdf66-f53a-555e-6fb9-1c60681ce082@suse.com>
 <20190902142325.2na455eb75xy5kbp@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4a3b3bc4-9644-9df2-d850-23f12e2b2a9a@suse.com>
Date: Mon, 2 Sep 2019 16:56:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902142325.2na455eb75xy5kbp@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] vpci: don't allow access to devices not
 assigned to the domain
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDkuMjAxOSAxNjoyMywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gU28gdGhlIHBy
b2JsZW0gSSBmb3VuZCwgYW5kIHRoYXQgSSB3YXMgdHJ5aW5nIHRvIGFkZHJlc3Mgd2l0aCB0aGlz
Cj4gcGF0Y2ggaXMgdGhhdCBhIFBWSCBkb20wIG9uIEFNRCBoYXJkd2FyZSBmaW5kcyB0aGUgaW9t
bXVzIGJ5IHNjYW5uaW5nCj4gdGhlIFBDSSBidXMsIGFuZCBhIExpbnV4IGRvbTAgc2VlbXMgdG8g
aW1tZWRpYXRlbHkgdHVybiBvZmYgdGhlIE1TSQo+IGVuYWJsZSBjb250cm9sIGJpdCBvbiBhbnkg
ZGV2aWNlcyBpdCBmaW5kcywgdGh1cyBsZWF2aW5nIHRoZSBpb21tdQo+IHdpdGhvdXQgYmVpbmcg
YWJsZSB0byBnZW5lcmF0ZSBpbnRlcnJ1cHRzLgo+IAo+IEkgY2FuIGltcGxlbWVudCB0aGUgUk8g
c3R1ZmYsIGJ1dCBpdCBzZWVtcyB3ZWlyZCB0byBtZS4gQUZBSUNUIHRoZQo+IG9ubHkgZGV2aWNl
cyBvd25lZCBieSBYZW4gc2hvdWxkIGJlIHRoZSBzZXJpYWwgY29uc29sZSwgdGhlIGlvbW11IGFu
ZAo+IHRoZSBIUEVUIG1heWJlLiBIb3cgY2FuIGhpZGluZyB0aG9zZSBjYXVzZSBhbm9tYWxpZXMg
aW4gYnVzCj4gZW51bWVyYXRpb24/CgpCb3RoIHRoZSBzZXJpYWwgZGV2aWNlIGFuZCBhbiBJT01N
VSBtYXkgaW4gcHJpbmNpcGxlIGJlIGZ1bmMgMCBvZiBhCm11bHRpLWZ1bmN0aW9uIGRldmljZS4g
QnkgZnVsbHkgaGlkaW5nIHN1Y2ggZGV2aWNlcywgeW91IGFsc28gaGlkZQpmdW5jcyAxLTcgYWZh
aWN0LiBGdXJ0aGVybW9yZSwgZnJvbSBhIHRlY2ggc3VwcG9ydCBwb3YgaXQgc2VlbXMKcmF0aGVy
IGRlc2lyYWJsZSB0byBoYXZlIGUuZy4gbHNwY2kgb3V0cHV0IGluIERvbTAgdG8gYmUgYXMgY29t
cGxldGUKYXMgcG9zc2libGUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
