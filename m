Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6511423CCE
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 18:03:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSkh0-00088O-4l; Mon, 20 May 2019 15:59:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hSkgy-00088J-EA
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 15:59:12 +0000
X-Inumbo-ID: 333d41a2-7b18-11e9-b0ed-77b51824a413
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 333d41a2-7b18-11e9-b0ed-77b51824a413;
 Mon, 20 May 2019 15:59:08 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 20 May 2019 09:59:07 -0600
Message-Id: <5CE2CEC40200007800230B3A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 20 May 2019 09:59:00 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1558365981-3175-1-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1558365981-3175-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/cpuid: Don't use volatile asm statements
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIwLjA1LjE5IGF0IDE3OjI2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQ29tbW9uIHVzZSBvZiB0aGUgQ1BVSUQgaW5zdHJ1Y3Rpb24gb3BlcmF0ZXMgd2l0aG91
dCBzaWRlIGVmZmVjdHMuICBMZXQgdGhlCj4gY29tcGlsZXIgYmV0dGVyIG9wdGltaXNlIGNvZGUg
YnkgZHJvcHBpbmcgdGhlIHZvbGF0aWxlIHF1YWxpZmllci4KPiAKPiBUaGUgb25seSBwbGFjZSB3
aGVyZSBvcmRlciBtYXR0ZXJzIGlzIGZvciBJbnRlbCBtaWNyb2NvZGUgbG9hZGluZywgd2hlcmUK
PiBleGVjdXRpbmcgYSBDUFVJRCBpbnN0cnVjdGlvbiBpcyB1c2VkIGZvciBpdHMgc2lkZSBlZmZl
Y3Qgb2YgdXBkYXRpbmcKPiBNU1JfSUEzMl9VQ09ERV9SRVYuCj4gCj4gVGhlIGV4aXN0aW5nIGxv
Z2ljIGlzIGJ1Z2d5IGJlY2F1c2UgR0NDIGhhcyBiZWVuIHNlZW4gdG8gcmVvcmRlciBpbmRlcGVu
ZGVudAo+IGFzbSB2b2xhdGlsZSBzdGF0ZW1lbnRzLiAgT3BlbmNvZGUgdGhlIHR3byBjYXNlcywg
d2l0aCBhIGNvbXBpbGVyIGJhcnJpZXIgdG8KPiBlbmZvcmNlIHRoZSBjb3JyZWN0IG9yZGVyaW5n
IG9mIG9wZXJhdGlvbnMuCgpJJ20gYWZyYWlkIEkgZG9uJ3Qgc2VlIGhvdyBhICJjb21waWxlciBi
YXJyaWVyIiBoZWxwcyBoZXJlLiBSZWNhbGwKdGhhdCB3ZSBvbmx5IGNhbGwgaXQgdGhpcyB3YXks
IGluIHJlYWxpdHkgaXQncyBhIG1lbW9yeSBjbG9iYmVyLCBhbmQKdGhhdCBpcyBhbGwgaXQgbWVh
bnMgdG8gdGhlIGNvbXBpbGVyLiBBcyBhIHJlc3VsdCwgSSBkb24ndCB0aGluayBpdCdsbApoZWxw
IG9yZGVyIGFnYWluc3QgdGhlIGVhcmxpZXIgV1JNU1IuIElmIHlvdSB3YW50IHRvIGVuZm9yY2UK
b3JkZXIgcmVsaWFibHksIEkgdGhpbmsgeW91ciBvbmx5IG9wdGlvbnMgYXJlIGEgc2luZ2xlIGFz
bSgpIGRvaW5nCmV2ZXJ5dGhpbmcgb3IgdGhlIHNlY29uZCBhc20oKSBjb25zdW1pbmcgYW4gb3V0
cHV0IChwZXJoYXBzCmEgZmFrZSBvbmUpIG9mIHRoZSBmaXJzdCBvbmUuIEkgdGhpbmsgdGhhdCdz
IGFsc28gd2hhdCBpbiBlc3NlbmNlCnRoZSBnY2MgZG9jIHNheXMuCgo+IFdoaWxlIGhlcmUsIGZp
eCB0aGUgY29tbWVudCwgd2hpY2ggaXNuJ3QgY29ycmVjdC4gIFRoZSBTRE0gZG9lc24ndCBzdGF0
ZSB0aGF0Cj4gYSByZWFkIG9mIGxlYWYgMSBpcyByZXF1aXJlZCAtIGp1c3QgdGhhdCBhIENQVUlE
IGluc3RydWN0aW9uIGlzIHJlcXVpcmVkLgo+IFVzaW5nIGxlYWYgMCByZXN1bHRzIGluIGJldHRl
ciBjb2RlIGdlbmVyYXRpb24sIGZvbGxvd2luZyB0aGUgd3JpdGUgb2YgMCB0bwo+IE1TUl9JQTMy
X1VDT0RFX1JFVi4KCldlbGwsIHRoZSBxdWVzdGlvbiBpcyAtIGFyZSB3ZSBzdXJlIHRoaXMgaXMg
d29ya2luZyBhcyBleHBlY3RlZApuZXZlcnRoZWxlc3MsIG9uIGFsbCBtb2RlbHM/IFRoZSBleGFt
cGxlIGluIHRoZSBTRE0gY2VydGFpbmx5CnVzZXMgbGVhZiAxLgoKPiBTdWdnZXN0ZWQtYnk6IEph
biBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KCkRpZCBJPyBNdXN0IGhhdmUgYmVlbiBxdWl0
ZSBzb21lIHRpbWUgYmFjaywgYXMgSSBkb24ndCByZWFsbHkgcmVjYWxsLgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
