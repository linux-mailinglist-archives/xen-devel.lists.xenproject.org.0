Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C860033ED4
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 08:11:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY2d6-0005Yk-6v; Tue, 04 Jun 2019 06:09:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hY2d5-0005Ye-6C
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 06:09:03 +0000
X-Inumbo-ID: 3d1df824-868f-11e9-ada7-b3b664846cb3
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d1df824-868f-11e9-ada7-b3b664846cb3;
 Tue, 04 Jun 2019 06:08:58 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 04 Jun 2019 00:08:56 -0600
Message-Id: <5CF60AF10200007800234DF3@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 04 Jun 2019 00:08:49 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5CF0F8530200007800233DE0@prv1-mh.provo.novell.com>
 <5CF0F9DC0200007800233E0A@prv1-mh.provo.novell.com>
 <7e04a515-719f-1788-2638-2f8313509f0e@citrix.com>
 <5CF4D6C402000078002346B3@prv1-mh.provo.novell.com>
In-Reply-To: <5CF4D6C402000078002346B3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 4/4] x86: use POPCNT for hweight<N>() when
 available
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAzLjA2LjE5IGF0IDEwOjEzLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+
IE9uIDMxLjA1LjE5IGF0IDIyOjQzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6
Cj4+IE9uIDMxLzA1LzIwMTkgMDI6NTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gVGhpcyBpcyBm
YXN0ZXIgdGhhbiB1c2luZyB0aGUgc29mdHdhcmUgaW1wbGVtZW50YXRpb24sIGFuZCB0aGUgaW5z
biBpcwo+Pj4gYXZhaWxhYmxlIG9uIGFsbCBoYWxmLXdheSByZWNlbnQgaGFyZHdhcmUuIFRoZXJl
Zm9yZSBjb252ZXJ0Cj4+PiBnZW5lcmljX2h3ZWlnaHQ8Tj4oKSB0byBvdXQtb2YtbGluZSBmdW5j
dGlvbnMgKHdpdGhvdXQgYWZmZWN0aW5nIEFybSkKPj4+IGFuZCB1c2UgYWx0ZXJuYXRpdmVzIHBh
dGNoaW5nIHRvIHJlcGxhY2UgdGhlIGZ1bmN0aW9uIGNhbGxzLgo+Pj4KPj4+IFN1Z2dlc3RlZC1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPj4+IFNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gCj4+IFNvLCBJIHRydXN0
IHlvdSB3ZXJlbid0IGV4cGVjdGluZyB0byBqdXN0IGFjayB0aGlzIGFuZCBsZXQgaXQgZ28gaW4/
Cj4+IAo+PiBUaGUgcHJpbmNpcGxlIG9mIHRoZSBwYXRjaCAodXNlIHBvcGNudCB3aGVuIGF2YWls
YWJsZSkgaXMgYW4gaW1wcm92ZW1lbnQKPj4gd2hpY2ggSSdtIGVudGlyZWx5IGluIGFncmVlbWVu
dCB3aXRoLCBidXQgZXZlcnl0aGluZyBlbHNlIGlzIGEgcHJvYmxlbS4KPj4gCj4+IFRoZSBsb25n
IGFuZCB0aGUgc2hvcnQgb2YgaXQgaXMgdGhhdCBJJ20gbm90IGdvaW5nIHRvIGFjY2VwdCBhbnkg
dmVyc2lvbgo+PiBvZiB0aGlzIHdoaWNoIGlzbid0IHRoZSBMaW51eCB2ZXJzaW9uLgo+IAo+IFlv
dSdyZSBraWRkaW5nLiBXZSB3YW50IHRvIG1vdmUgYXdheSBmcm9tIGFzc2VtYmx5IHdoZXJldmVy
IHdlCj4gY2FuLCBhbmQgeW91IGRlbWFuZCBuZXcgYXNzZW1ibHkgY29kZT8KPiAKPj4+RnJvbSBh
IG1pY3JvYXJjaGl0ZWN0dXJhbCBzdGFuZHBvaW50LCB0aGUgdHJhZGVvZmYgYmV0d2VlbiBmcmFj
dGlvbmFsCj4+IHJlZ2lzdGVyIHNjaGVkdWxpbmcgZmxleGliaWxpdHkgKHdoaWNoIGluIHByYWN0
aWNlIGlzIGxhcmdlbHkgYm91bmQKPj4gYW55d2F5IGJ5IHJlYWwgZnVuY3Rpb24gY2FsbHMgaW4g
c3Vycm91bmRpbmcgY29kZSkgYW5kIGluY3JlYXNlZCBpY2FjaGUKPj4gcHJlc3N1cmUvY29sZG5l
c3MgKGZyb20gdGhlIHJlZHVuZGFudCBmdW5jdGlvbiBjb3BpZXMpIGZhbGxzIGxhcmdlbHkgaW4K
Pj4gZmF2b3VyIG9mIHRoZSBMaW51eCB3YXkgb2YgZG9pbmcgaXQsIGEgY29sZCBpY2FjaGUgbGlu
ZSBpcwo+PiBkaXNwcm9wb3J0aW9uYWxseSBtb3JlIGV4cGVuc2l2ZSB0aGFuIHJlcXVpcmluZyB0
aGUgY29tcGlsZXIgdG8gb3JkZXIKPj4gaXRzIHJlZ2lzdGVycyBkaWZmZXJlbnRseSAoZXNwZWNp
YWxseSBhcyBhbGwgbm9uLW9ic29sZXRlIHByb2Nlc3NvcnMKPj4gdGhlc2UgZGF5cyBoYXZlIHpl
cm8tY29zdCByZWdpc3RlciByZW5hbWluZyBpbnRlcm5hbGx5LCBmb3IgdGhlIHB1cnBvc2UKPj4g
b2Ygc3VwZXJzY2FsYXIgZXhlY3V0aW9uKS4KPiAKPiBJJ20gYWZyYWlkIEknbSBzdHJ1Z2dsaW5n
IGhlYXZpbHkgYXMgdG8gd2hhdCB5b3UncmUgd2FudGluZyB0byB0ZWxsCj4gbWUgaGVyZTogV2hl
cmUncyB0aGUgZGlmZmVyZW5jZSAoaW4gdGhpcyByZWdhcmQpIGJldHdlZW4gdGhlCj4gY2hhbmdl
IGhlcmUgYW5kIHRoZSB3YXkgaG93IExpbnV4IGRvZXMgaXQ/IEJvdGggZW1pdCBhIENBTEwKPiBp
bnNuIHdpdGggcmVnaXN0ZXJzIHNldCB1cCBzdWl0YWJseSBmb3IgaXQsIGFuZCBib3RoIHBhdGNo
IGl0IHdpdGggYQo+IFBPUENOVCBpbnNuIHVzaW5nIHRoZSByZWdpc3RlcnMgYXMgZGVtYW5kZWQg
YnkgdGhlIENBTEwuCgpIYXZpbmcgdGhvdWdodCBhYm91dCB0aGlzIHNvbWUgbW9yZSwgaW4gYW4g
YXR0ZW1wdCB0byB0cnkgdG8KdW5kZXJzdGFuZCAoYSkgd2hhdCB5b3UgbWVhbiBhbmQgKGIpIGhv
dyB5b3Ugd2FudCB0aGluZ3MKdG8gYmUgZG9uZSAieW91ciB3YXkiLCBJJ20gYWZyYWlkIEkndmUg
Z290IG1vcmUgY29uZnVzZWQ6IFlvdXIKcmVwbHkgcmVtaW5kcyBtZSBoZWF2aWx5IG9mIHRoZSBk
aXNjdXNzaW9uIHdlIGhhZCBvbiB0aGUgQk1JMgpwYXRjaGluZyBzZXJpZXMgSSBoYWQgZG9uZSAo
YW5kIG5vdyBkcm9wcGVkKTogVGhlcmUgeW91CmNvbXBsYWluZWQgYWJvdXQgbWUgX25vdF8gdXNp
bmcgZml4ZWQgcmVnaXN0ZXJzIGFuZCBoZW5jZQpwb3RlbnRpYWxseSBjYWxsaW5nIGZyZXF1ZW50
IGktY2FjaGUtY29sZCBsaW5lcyB0byBiZSBhY2Nlc3NlZC4KV2hpbGUgbXkgb3JpZ2luYWwgcGxh
biB3YXMgdG8gdXNlIGEgc2ltaWxhciBhcHByb2FjaCBoZXJlLCBJCnNwZWNpZmljYWxseSB3ZW50
IHRoZSBvcHBvc2l0ZSB3YXkgdG8gYXZvaWQgc2ltaWxhciBjb21wbGFpbnRzCm9mIHlvdXJzLiBK
dXN0IHRvIGZpbmQgdGhhdCB5b3UgdXNlIHRoZSAoYXBwYXJlbnRseSkgc2FtZQphcmd1bWVudCBh
Z2Fpbi4gQXMgYSByZXN1bHQgSSBjYW4gb25seSBjb25jbHVkZSB0aGF0IEknbSBub3cKcHJldHR5
IHVuY2xlYXIgb24gd2hhdCBtb2RlbCB5b3Ugd291bGQgYWN0dWFsbHkgYXBwcm92ZSBvZi4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
