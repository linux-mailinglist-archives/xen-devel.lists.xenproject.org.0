Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43767F0ACC
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 01:00:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS8hl-0003Ut-Gt; Tue, 05 Nov 2019 23:57:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SRxw=Y5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iS8hk-0003Uo-2c
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 23:57:44 +0000
X-Inumbo-ID: 0e9781ba-0028-11ea-984a-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e9781ba-0028-11ea-984a-bc764e2007e4;
 Tue, 05 Nov 2019 23:57:43 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7CFAB21A49;
 Tue,  5 Nov 2019 23:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572998262;
 bh=XCuE57hq8kteyVSTFcr8nlC4NVsnxxh3B2I9PO/uyf4=;
 h=Date:From:To:cc:Subject:From;
 b=KJt8BbpT/vHX5E9WAdejJNKzawzCZJtwVUNn/VDiuUbTqL2thv450LD5iGCCaHYpw
 XPYWPrQLKNMmPxv/fkiSfvwoVmMnYHxXhfuvJzM72A+eZEOxBFJdnCM+e5f8nls+bE
 jqlti4LLvk078OWsV4HshHJ+nWxB+oF11RaeRCSE=
Date: Tue, 5 Nov 2019 15:57:36 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: dfaggioli@suse.com
Message-ID: <alpine.DEB.2.21.1911051556200.14907@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] Urgent for 4.13,
 Was dom0less + sched=null => broken in staging (fwd)
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
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, jgross@suse.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgRGFyaW8sCgpJIGp1c3QgY2hlY2tlZCBhbmQgdGhlIHBhdGNoIGlzIG5vdCBpbiBzdGFnaW5n
IHlldC4gQ2FuIHdlIHBsZWFzZSBtYWtlCnN1cmUgdGhlIHBhdGNoIGdvZXMgaW4gYXMgc29vbiBh
cyBwb3NzaWJsZSwgZ2l2ZW4gdGhlIGxvb21pbmcgcmVsZWFzZT8KCkNoZWVycywKClN0ZWZhbm8K
Ci0tLS0tLS0tLS0gRm9yd2FyZGVkIG1lc3NhZ2UgLS0tLS0tLS0tLQpEYXRlOiBNb24sIDI4IE9j
dCAyMDE5IDExOjQwOjIzIC0wNzAwIChQRFQpCkZyb206IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4KVG86IERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5j
b20+CkNjOiAic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
LAogICAgIkdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbSIgPEdlb3JnZS5EdW5sYXBAZXUuY2l0
cml4LmNvbT4sCiAgICAiamdyb3NzQHN1c2UuZGUiIDxqZ3Jvc3NAc3VzZS5kZT4sCiAgICAieGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIiA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnPiwKICAgICJqdWxpZW4uZ3JhbGxAYXJtLmNvbSIgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpT
dWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gZG9tMGxlc3MgKyBzY2hlZD1udWxsID0+IGJyb2tlbiBp
biBzdGFnaW5nCgpPbiBNb24sIDI4IE9jdCAyMDE5LCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPiBP
biBGcmksIDIwMTktMDgtMjMgYXQgMTg6MTYgLTA3MDAsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiA+IE9uIFdlZCwgMjEgQXVnIDIwMTksIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+ID4gPiBI
ZXksIFN0ZWZhbm8sIEp1bGllbiwKPiA+ID4gCj4gPiA+IEhlcmUncyBhbm90aGVyIHBhdGNoLgo+
ID4gPiAKPiA+ID4gUmF0aGVyIHRoYW4gYSBkZWJ1ZyBwYXRjaCwgdGhpcyBpcyByYXRoZXIgYW4g
YWN0dWFsICJwcm9wb3NlZAo+ID4gPiBzb2x1dGlvbiIuCj4gPiA+IAo+ID4gPiBDYW4geW91IGdp
dmUgaXQgYSBnbz8gSWYgaXQgd29ya3MsIEknbGwgc3BpbiBpdCBhcyBhIHByb3BlciBwYXRjaC4K
PiA+IAo+ID4gWWVzLCB0aGlzIHNlZW1zIHRvIHNvbHZlIHRoZSBwcm9ibGVtLCB0aGFuayB5b3Uh
Cj4gPiAKPiBIZXksCj4gCj4gU29ycnkgdGhpcyBpcyB0YWtpbmcgYSBsaXR0bGUgd2hpbGUuIENh
biBhbnkgb2YgeW91IHBsZWFzZSB0ZXN0IHRoZQo+IGF0dGFjaGVkLCBvbiB0b3Agb2YgY3VycmVu
dCBzdGFnaW5nPwo+IAo+IEluIGZhY3QsIEkgcmViYXNlZCB0aGUgcGF0Y2ggaW4gbXkgbGFzdCBl
bWFpbCBvbiB0b3Agb2YgdGhhdCwgYW5kIEknZAo+IGxpa2UgdG8ga25vdyBpZiBpdCBzdGlsbCB3
b3JrcywgZXZlbiBub3cgdGhhdCBjb3JlLXNjaGVkdWxpbmcgaXMgaW4uCj4gCj4gSWYgaXQgZG9l
cywgdGhlbiBhIHByb3BlciBjaGFuZ2Vsb2cgaXMgdGhlIG9ubHkgdGhpbmcgaXQnZCBiZSBtaXNz
aW5nLAo+IGFuZCBJJ2xsIGRvIGl0IHF1aWNrbHksIEkgcHJvbWlzZSA6LSkKClRlc3RlZC1ieTog
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
