Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 493C11B2FC
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 11:36:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQ7Kf-0007q8-At; Mon, 13 May 2019 09:33:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nxsn=TN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQ7Kd-0007q3-Sb
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 09:33:15 +0000
X-Inumbo-ID: 218aab40-7562-11e9-93f9-57fd80f9b060
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 218aab40-7562-11e9-93f9-57fd80f9b060;
 Mon, 13 May 2019 09:33:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E55E3341;
 Mon, 13 May 2019 02:33:13 -0700 (PDT)
Received: from [10.37.12.148] (unknown [10.37.12.148])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 180123F703;
 Mon, 13 May 2019 02:33:12 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1905081538170.9403@sstabellini-ThinkPad-T480s>
 <20190508224727.11549-1-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f21a3290-08e5-7770-eace-6d03ee372014@arm.com>
Date: Mon, 13 May 2019 10:33:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190508224727.11549-1-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/3] xen/arm: fix nr_pdxs calculation
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
Cc: xen-devel@lists.xenproject.org, JBeulich@suse.com,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDUvOC8xOSAxMTo0NyBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IHBmbl90b19wZHggZXhwZWN0cyBhbiBhZGRyZXNzLCBub3QgYSBzaXplLCBhcyBhIHBhcmFt
ZXRlci4gSXQgZXhwZWN0cwo+IHRoZSBlbmQgYWRkcmVzcywgYW5kIHRoZSBtYXNrcyBjYWxjdWxh
dGlvbnMgY29tcGVuc2F0ZSBmb3IgYW55IGhvbGVzCj4gYmV0d2VlbiBzdGFydCBhbmQgZW5kLiBQ
YXNzIHRoZSBlbmQgYWRkcmVzcyB0byBwZm5fdG9fcGR4LiAKClRoZSB3b3JkaW5nIGlzIGEgYml0
IGRpZmZpY3VsdCB0byByZWFkLiBEb24ndCB5b3UgbWlzcyBhICJTbyIgb3IgCiJUaGVyZWZvcmUi
IHNvbWV3aGVyZT8KCgo+IEFsc28gcmVtb3ZlCgpzL3JlbW92ZS9zdWJzdHJhY3QvPwoKPiBmcm9t
IHRoZSByZXN1bHQgcGZuX3RvX3BkeChzdGFydF9hZGRyZXNzKSBiZWNhdXNlIHdlIGtub3cgdGhh
dCB3ZQo+IGRvbid0IG5lZWQgdG8gY292ZXIgYW55IG1lbW9yeSBpbiB0aGUgcmFuZ2UgMC1zdGFy
dCBpbiB0aGUgZnJhbWV0YWJsZS4KClRoZSBvbmx5IHJlYXNvbiB3ZSBjYW4gc3Vic3RyYWN0IHBm
bl90b19wZHgoc3RhcnRfYWRkcmVzcykgaGVyZSBpcyAKYmVjYXVzZSB3ZSBzdG9yZSB0aGUgaW5p
dGlhbCBQRFggaW4gZnJhbWV0YWJsZV9iYXNlX3BkeC4gV2l0aG91dCB0aGF0LCAKdGhlIGZyYW1l
dGFibGUgd291bGQgbmVlZCB0byBjb3ZlciB0aGUgcmFuZ2UgMCAtIHN0YXJ0LgoKVGhlIGNvZGUg
bG9va3MgZ29vZCB0byBtZS4KCj4gCj4gUmVtb3ZlIHRoZSB2YXJpYWJsZSBgbnJfcGFnZXMnIGJl
Y2F1c2UgaXQgaXMgdW51c2VkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3RlZmFub3NAeGlsaW54LmNvbT4KPiBDQzogSkJldWxpY2hAc3VzZS5jb20KPiAtLS0KPiBD
aGFuZ2VzIGluIHYyOgo+IC0gdXNlIG1mbl90b19wZHggYW5kIG1hZGRyX3RvX21mbiBhbG9uZyB3
aXRoIG1mbl9hZGQoKQo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL21tLmMgfCA0ICsrLS0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS9tbS5jIGIveGVuL2FyY2gvYXJtL21tLmMKPiBpbmRleCAwMWFl
MmNjY2MwLi41OGQ3MWQzYzIzIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9tbS5jCj4gKysr
IGIveGVuL2FyY2gvYXJtL21tLmMKPiBAQCAtODc0LDggKzg3NCw4IEBAIHZvaWQgX19pbml0IHNl
dHVwX3hlbmhlYXBfbWFwcGluZ3ModW5zaWduZWQgbG9uZyBiYXNlX21mbiwKPiAgIC8qIE1hcCBh
IGZyYW1lIHRhYmxlIHRvIGNvdmVyIHBoeXNpY2FsIGFkZHJlc3NlcyBwcyB0aHJvdWdoIHBlICov
Cj4gICB2b2lkIF9faW5pdCBzZXR1cF9mcmFtZXRhYmxlX21hcHBpbmdzKHBhZGRyX3QgcHMsIHBh
ZGRyX3QgcGUpCj4gICB7Cj4gLSAgICB1bnNpZ25lZCBsb25nIG5yX3BhZ2VzID0gKHBlIC0gcHMp
ID4+IFBBR0VfU0hJRlQ7Cj4gLSAgICB1bnNpZ25lZCBsb25nIG5yX3BkeHMgPSBwZm5fdG9fcGR4
KG5yX3BhZ2VzKTsKPiArICAgIHVuc2lnbmVkIGxvbmcgbnJfcGR4cyA9IG1mbl90b19wZHgobWZu
X2FkZChtYWRkcl90b19tZm4ocGUpLCAtMSkpIC0KPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG1mbl90b19wZHgobWFkZHJfdG9fbWZuKHBzKSkgKyAxOwo+ICAgICAgIHVuc2lnbmVkIGxv
bmcgZnJhbWV0YWJsZV9zaXplID0gbnJfcGR4cyAqIHNpemVvZihzdHJ1Y3QgcGFnZV9pbmZvKTsK
PiAgICAgICBtZm5fdCBiYXNlX21mbjsKPiAgICAgICBjb25zdCB1bnNpZ25lZCBsb25nIG1hcHBp
bmdfc2l6ZSA9IGZyYW1ldGFibGVfc2l6ZSA8IE1CKDMyKSA/IE1CKDIpIDogTUIoMzIpOwo+IAoK
Q2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
