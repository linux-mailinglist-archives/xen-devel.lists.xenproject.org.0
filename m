Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B341146EA
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 11:00:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNZSI-0002jM-36; Mon, 06 May 2019 08:58:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNZSH-0002jG-1w
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 08:58:37 +0000
X-Inumbo-ID: 1f598b3c-6fdd-11e9-b046-9fba4c6d153b
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f598b3c-6fdd-11e9-b046-9fba4c6d153b;
 Mon, 06 May 2019 08:58:32 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 06 May 2019 02:58:31 -0600
Message-Id: <5CCFF732020000780022C12F@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 06 May 2019 02:58:26 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-2-jgross@suse.com>
 <5CCFF004020000780022C0D4@suse.com>
 <c54fb173-0381-786c-a95c-eabf0629de84@suse.com>
In-Reply-To: <c54fb173-0381-786c-a95c-eabf0629de84@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH RFC V2 01/45] xen/sched: add inline wrappers
 for calling per-scheduler functions
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
 Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA2LjA1LjE5IGF0IDEwOjM0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
Ni8wNS8yMDE5IDEwOjI3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDYuMDUuMTkgYXQg
MDg6NTYsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gQEAgLTIwNyw2ICsyNTAsMTQxIEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCBzY2hlZF9mcmVlX2RvbWRhdGEoY29uc3Qgc3RydWN0IHNjaGVk
dWxlciAqcywKPj4+ICAgICAgICAgIEFTU0VSVCghZGF0YSk7Cj4+PiAgfQo+Pj4gIAo+Pj4gK3N0
YXRpYyBpbmxpbmUgdm9pZCAqc2NoZWRfYWxsb2NfcGRhdGEoY29uc3Qgc3RydWN0IHNjaGVkdWxl
ciAqcywgaW50IGNwdSkKPj4+ICt7Cj4+PiArICAgIGlmICggcy0+YWxsb2NfcGRhdGEgKQo+Pj4g
KyAgICAgICAgcmV0dXJuIHMtPmFsbG9jX3BkYXRhKHMsIGNwdSk7Cj4+PiArICAgIGVsc2UKPj4+
ICsgICAgICAgIHJldHVybiBOVUxMOwo+Pj4gK30KPj4gCj4+IEluIGNhc2VzIGxpa2UgdGhpcyBv
bmUgSSdkIGxpa2UgdG8gYXNrIHRoYXQgZWl0aGVyID86IGJlIHVzZWQsIG9yIHRoZSBwb2ludGxl
c3MKPj4gImVsc2UiIGJlIGRyb3BwZWQuCj4gCj4gRmluZSB3aXRoIG1lLiBJIGd1ZXNzIGFkYXB0
aW5nIHRoZSBhbHJlYWR5IGV4aXN0aW5nIGlubGluZSB3cmFwcGVycyB0bwo+IHRoYXQgc2NoZW1l
IHdpdGggdGhlIHNhbWUgcGF0Y2ggaXMgb2theT8KCkkgc3VwcG9zZSBzbywgdW5sZXNzIHRoYXQg
d291bGQgZ3JvdyB0aGUgc2l6ZSBvZiB0aGUgcGF0Y2gKc2lnbmlmaWNhbnRseS4KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
