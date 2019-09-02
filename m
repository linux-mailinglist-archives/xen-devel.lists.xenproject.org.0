Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E37A5530
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 13:44:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4khe-0004Tl-IU; Mon, 02 Sep 2019 11:40:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zPYt=W5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i4khd-0004Tg-Ja
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 11:40:57 +0000
X-Inumbo-ID: 868c86b4-cd76-11e9-b95f-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 868c86b4-cd76-11e9-b95f-bc764e2007e4;
 Mon, 02 Sep 2019 11:40:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7D6DAAF83;
 Mon,  2 Sep 2019 11:40:55 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190827105928.1769-1-jgross@suse.com>
 <20190827105928.1769-4-jgross@suse.com>
 <7a4fd708-b109-59b8-1633-2f80ef523dcb@citrix.com>
 <6a9bfc0d-ce17-e074-1c2d-98c36858f801@suse.com>
 <318611e2-ab1d-6c56-b36c-0195311d499c@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <68fd8945-802b-0829-0a27-9a98dfc5e7c9@suse.com>
Date: Mon, 2 Sep 2019 13:40:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <318611e2-ab1d-6c56-b36c-0195311d499c@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 3/3] xen/sched: add minimalistic idle
 scheduler for free cpus
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDkuMTkgMTM6MDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI3LjA4LjIwMTkgMTQ6
NDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDI3LjA4LjE5IDE0OjM3LCBBbmRyZXcgQ29v
cGVyIHdyb3RlOgo+Pj4gT24gMjcvMDgvMjAxOSAxMTo1OSwgSnVlcmdlbiBHcm9zcyB3cm90ZToK
Pj4+PiArc3RhdGljIHZvaWQgKgo+Pj4+ICtzY2hlZF9pZGxlX2FsbG9jX3ZkYXRhKGNvbnN0IHN0
cnVjdCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IHZjcHUgKnYsCj4+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgdm9pZCAqZGQpCj4+Pj4gK3sKPj4+PiArICAgIC8qIEFueSBub24tTlVMTCBwb2lu
dGVyIGlzIGZpbmUgaGVyZS4gKi8KPj4+PiArICAgIHJldHVybiAodm9pZCAqKTFVTDsKPj4+Cj4+
PiBBcyBhbiBvYnNlcnZhdGlvbiwgdGhlIHZkYXRhIGludGVyZmFjZSAoYW5kIG90aGVycywgaWYg
YXBwbGljYWJsZSkgY291bGQKPj4+IGRvIHdpdGggYmVpbmcgdXBkYXRlZCB0byB1c2UgRVJSX1BU
UigpLCBqdXN0IGFzIGRvbmUgaW4gYy9zIDM0MGVkYzM5MAo+Pgo+PiBPbmUgb2YgdGhlIGl0ZW1z
IGZvciBteSBzY2hlZHVsZXIgY2xlYW51cCBwYXRjaGVzLgo+Pgo+Pj4gUGFzc2luZyAxIGJhY2sg
aGVyZSBpcyByYXRoZXIgZGFuZ2Vyb3VzLgo+Pgo+PiBOb3QgcmVhbGx5LiB2ZGF0YSBpcyBzY2hl
ZHVsZXIgc3BlY2lmaWMsIGFuZCB0aGUgaWRsZS1zY2hlZHVsZXIgZG9lc24ndAo+PiB1c2UgaXQu
Cj4gCj4gQnV0IG1heWJlIGhhbmRpbmcgYmFjayBlLmcuIFpFUk9fQkxPQ0tfUFRSIHdvdWxkIHN0
aWxsIGJlIGJldHRlcj8KPiBOb3QgdGhlIGxlYXN0IGJlY2F1c2Ugb2YgYXZvaWRpbmcgYW4gb3Bl
bi1jb2RlZCBjYXN0PwoKWWVzLiBJIHdhc24ndCBhd2FyZSBvZiBpdHMgZXhpc3RhbmNlLgoKCkp1
ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
