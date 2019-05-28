Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 155982C5A9
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 13:47:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVaWZ-0000Jv-Px; Tue, 28 May 2019 11:44:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RBlk=T4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVaWY-0000J2-Iw
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 11:44:10 +0000
X-Inumbo-ID: e720401c-813d-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e720401c-813d-11e9-8980-bc764e045a96;
 Tue, 28 May 2019 11:44:08 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 28 May 2019 05:44:07 -0600
Message-Id: <5CED1F030200007800233129@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 28 May 2019 05:44:03 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-50-jgross@suse.com>
In-Reply-To: <20190528103313.1343-50-jgross@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 49/60] xen/sched: reject switching smt
 on/off with core scheduling active
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI4LjA1LjE5IGF0IDEyOjMzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiAtLS0g
YS94ZW4vYXJjaC94ODYvc3lzY3RsLmMKPiArKysgYi94ZW4vYXJjaC94ODYvc3lzY3RsLmMKPiBA
QCAtMjAwLDcgKzIwMCw4IEBAIGxvbmcgYXJjaF9kb19zeXNjdGwoCj4gIAo+ICAgICAgICAgIGNh
c2UgWEVOX1NZU0NUTF9DUFVfSE9UUExVR19TTVRfRU5BQkxFOgo+ICAgICAgICAgIGNhc2UgWEVO
X1NZU0NUTF9DUFVfSE9UUExVR19TTVRfRElTQUJMRToKPiAtICAgICAgICAgICAgaWYgKCAhY3B1
X2hhc19odHQgfHwgYm9vdF9jcHVfZGF0YS54ODZfbnVtX3NpYmxpbmdzIDwgMiApCj4gKyAgICAg
ICAgICAgIGlmICggIWNwdV9oYXNfaHR0IHx8IGJvb3RfY3B1X2RhdGEueDg2X251bV9zaWJsaW5n
cyA8IDIgfHwKPiArICAgICAgICAgICAgICAgICBzY2hlZF9kaXNhYmxlX3NtdF9zd2l0Y2hpbmcg
KQo+ICAgICAgICAgICAgICB7Cj4gICAgICAgICAgICAgICAgICByZXQgPSAtRU9QTk9UU1VQUDsK
PiAgICAgICAgICAgICAgICAgIGJyZWFrOwoKSSdtIG5vdCBjb252aW5jZWQgLUVPUE5PVFNVUFAg
aXMgYW4gYXBwcm9wcmlhdGUgZXJyb3IgY29kZSBmb3IKdGhpcyBuZXcgY2FzZS4gLUVQRVJNLCAt
RUFDQ0VTLCBvciAtRUlPIHdvdWxkIGFsbCBzZWVtIG1vcmUKYXBwcm9wcmlhdGUgdG8gbWUgKGFu
ZCBwZXJoYXBzIHRoZXJlIGFyZSBmdXJ0aGVyIG9uZXMpLgoKPiAtLS0gYS94ZW4vY29tbW9uL3Nj
aGVkdWxlLmMKPiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPiBAQCAtNTcsNiArNTcsNyBA
QCBpbnRlZ2VyX3BhcmFtKCJzY2hlZF9yYXRlbGltaXRfdXMiLCBzY2hlZF9yYXRlbGltaXRfdXMp
Owo+ICAKPiAgLyogTnVtYmVyIG9mIHZjcHVzIHBlciBzdHJ1Y3Qgc2NoZWRfdW5pdC4gKi8KPiAg
c3RhdGljIHVuc2lnbmVkIGludCBzY2hlZF9ncmFudWxhcml0eSA9IDE7Cj4gK2Jvb2wgc2NoZWRf
ZGlzYWJsZV9zbXRfc3dpdGNoaW5nOwoKX19yZWFkX21vc3RseSAocGVyaGFwcyBhbHNvIHRoZSBw
cmUtZXhpc3RpbmcgdmFyaWFibGUgaW4gY29udGV4dCk/CgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
