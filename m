Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E789D1D95
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 02:44:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIMVc-0005ez-8v; Thu, 10 Oct 2019 00:40:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=klDL=YD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iIMVa-0005eS-JS
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 00:40:46 +0000
X-Inumbo-ID: 98a3afe2-eaf6-11e9-97fa-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98a3afe2-eaf6-11e9-97fa-12813bfff9fa;
 Thu, 10 Oct 2019 00:40:45 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA48E2067B;
 Thu, 10 Oct 2019 00:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570668045;
 bh=Qn0O8Hkf2zC6c/jleSOrvpN9oe09fqzAf57y0G7a+rs=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=B37REhyI6r3PbXaUMa48Yj44zOjK29pyiHvrSwLdzlphIJrxHgehNubhm2kiajXwx
 ycJrCqJaSjF3PWWqNNLSxf/N93F/MAj7q1M8Kzncg4pnnRCdp3OgsDLG5BT07To3KF
 AOIL8PWiQMDS9XvhrOeKIY3PH6slSYtDQrUToyRU=
Date: Wed, 9 Oct 2019 17:40:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <3cfd5f51-8cc0-03aa-dcfc-af2d59488fc0@arm.com>
Message-ID: <alpine.DEB.2.21.1910091740330.13684@sstabellini-ThinkPad-T480s>
References: <20191008231211.31110-1-sstabellini@kernel.org>
 <3cfd5f51-8cc0-03aa-dcfc-af2d59488fc0@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-4.13 v3] xen/arm: fix buf size in
 make_cpus_node
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCA5IE9jdCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgU3RlZmFubywKPiAK
PiBPbiAwOS8xMC8yMDE5IDAwOjEyLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBUaGUg
c2l6ZSBvZiBidWYgaXMgY2FsY3VsYXRlZCB3cm9uZ2x5OiB0aGUgbnVtYmVyIGlzIHByaW50ZWQg
YXMgYQo+ID4gaGV4YWRlY2ltYWwgbnVtYmVyLCBzbyB3ZSBuZWVkIDggYnl0ZXMgZm9yIDMyYml0
LCBub3QgMTAgYnl0ZXMuCj4gPiAKPiA+IEFzIGEgcmVzdWx0LCBpdCBzaG91bGQgYmUgc2l6ZW9m
KCJjcHVAIikgKyA4IGJ5dGVzIGZvciBhIDMyLWJpdCBudW1iZXIgKwo+ID4gMSBieXRlIGZvciBc
MC4gVG90YWwgPSAxMy4KPiA+IAo+ID4gbXBpZHJfYWZmIGlzIDY0LWJpdCwgaG93ZXZlciwgb25s
eSBiaXRzIFswLTIzXSBhcmUgdXNlZC4gQWRkIGEgY2hlY2sgZm9yCj4gPiB0aGF0Lgo+IAo+IEkg
YW0gbm90IGVudGlyZWx5IGhhcHB5IHdpdGggdGhlIGNvbW1pdCBtZXNzYWdlLiBUaGVyZSBhcmUg
bm8gcmVhbCBpc3N1ZSB3aXRoCj4gdGhlIGN1cnJlbnQgY29kZSAodGhlIGJ1ZmZlciBpcyBiaWcg
ZW5vdWdoKSBhcyBtcGRpcl9hZmYgY2FuIG9ubHkgaGF2ZSBbMjM6MF0KPiBzZXQgaW4gdGhlIGN1
cnJlbnQgY29kZS4KPiAKPiBUaGUgcGF0Y2ggaXMgb25seSBoYXJkZW5pbmcgdGhlIGNvZGUgYW5k
IHRoYXQgc2hvdWxkIGJlIHJlZmxlY3RlZCBpbiB0aGUKPiBjb21taXQgbWVzc2FnZS4KPiAKPiBT
byBob3cgYWJvdXQ6Cj4gCj4geGVuL2FybTogZG9tYWluX2J1aWxkOiBIYXJkZW4gbWFrZV9jcHVz
X25vZGUoKQo+IAo+IG1ha2VfY3B1c19ub2RlKCkgaXMgdXNpbmcgYSBzdGF0aWMgYnVmZmVyIHRv
IGdlbmVyYXRlIHRoZSBGRFQgbm9kZSBuYW1lLgo+IAo+IFdoaWxlIG1wZGlyX2FmZiBpcyBhIDY0
LWJpdCBpbnRlZ2VyLCB3ZSBvbmx5IGV2ZXIgdXNlIHRoZSBiaXRzIFsyMzowXSBhcyBvbmx5Cj4g
QUZGezAsIDEsIDJ9IGFyZSBzdXBwb3J0ZWQgZm9yIG5vdy4KPiAKPiBUbyBhdm9pZCBhbnkgcG90
ZW50aWFsIGlzc3VlIGluIHRoZSBmdXR1cmUsIGNoZWNrIHRoYXQgbXBkaXJfYWZmIGhhcyBvbmx5
IGJpdHMKPiBbMjM6MF0gc2V0Lgo+IAo+IEF0IHRoZSBzYW1lIHRpbWUsIHRha2UgdGhlIG9wcG9y
dHVuaXR5IHRvIHJlZHVjZSB0aGUgc2l6ZSBvZiB0aGUgYnVmZmVyLgo+IEluZGVlZCwgb25seSA4
IGNoYXJhY3RlcnMgaXMgdXNlZnVsIHRvIGdlbmVyYXRlIGFuIDMyLWJpdCBoZXhhZGVjaW1hbCBu
dW1iZXIuCj4gU28gc2l6ZW9mKCJjcHVAIikgKyA4ID0gMTMgY2hhcmFjdGVycyBpcyBzdWZmaWNp
ZW50IGhlcmUuCgpPaywgdGhhbmtzIGZvciBwcm92aWRpbmcgdGhlIGNvbW1pdCBtZXNzYWdlLiBJ
J2xsIHVzZSBpdC4KCgo+ID4gRml4ZXM6IGM4MWE3OTFkMzQgKHhlbi9hcm06IFNldCAncmVnJyBv
ZiBjcHUgbm9kZSBmb3IgZG9tMCB0byBtYXRjaCBNUElEUidzCj4gPiBhZmZpbml0eSkKPiA+IFNp
Z25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFuby5zdGFiZWxsaW5pQHhpbGlu
eC5jb20+Cj4gPiBSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+Cj4gPiAtLS0KPiA+IENoYW5nZXMgaW4gdjM6Cj4gPiAtIG1ha2Ugc3VyZSBvbmx5IFsyMzow
XSBiaXRzIGFyZSB1c2VkIGluIG1waWRyX2FmZgo+ID4gLSBjbGFyaWZ5IHRoYXQgd2Ugb25seSBu
ZWVkIDMyYml0IGZvciBidWYgd3JpdGVzCj4gPiAKPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiAtIHBh
dGNoIGFkZGVkCj4gPiAtLS0KPiA+ICAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgMTIg
KysrKysrKysrKystCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxk
LmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiA+IGluZGV4IDkyMWIwNTQ1MjAuLmQ1
ZWU2Mzk1NDggMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiA+
ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+ID4gQEAgLTc4OSw3ICs3ODksNyBA
QCBzdGF0aWMgaW50IF9faW5pdCBtYWtlX2NwdXNfbm9kZShjb25zdCBzdHJ1Y3QgZG9tYWluICpk
LAo+ID4gdm9pZCAqZmR0KQo+ID4gICAgICAgY29uc3Qgdm9pZCAqY29tcGF0aWJsZSA9IE5VTEw7
Cj4gPiAgICAgICB1MzIgbGVuOwo+ID4gICAgICAgLyogUGxhY2Vob2xkZXIgZm9yIGNwdUAgKyBh
IDMyLWJpdCBudW1iZXIgKyBcMCAqLwo+IAo+IEkgdGhpbmsgeW91IHdhbnQgdG8gdXBkYXRlIHRo
ZSBjb21tZW50IHRvIHNheSAiMzItYml0IGhleGEgbnVtYmVyIi4KCk9LCgoKPiA+IC0gICAgY2hh
ciBidWZbMTVdOwo+ID4gKyAgICBjaGFyIGJ1ZlsxM107Cj4gCj4gVGhpcyBpcyBhIGNvbmZ1c2lu
ZyBjb2RlIHRvIHJlYWQgYmVjYXVzZSBhYm92ZSB5b3UgbWVudGlvbiB0aGlzIGlzIGEgMzItYml0
Cj4gbnVtYmVyLCBidXQgYmVsb3cgeW91IGFyZSB1c2luZyBQUkl4NjQuIEl0IHRha2VzIGEgYml0
IG9mIHRpbWUgdG8gZmlndXJlIG91dAo+IHRoYXQgbXBkaXJfYWZmIHdpbGwgYWx3YXlzIGhhdmUg
Yml0cyBhYm92ZSAzMi1iaXQgemVyb2VkLgo+IAo+IEkgd291bGQgcHJlZmVyIHRvIHVzZSBhIHRl
bXBvcmFyeSB2YXJpYWJsZSBmb3IgdGhlIHJlZ2lzdGVyLCBidXQgSSB3b3VsZCBiZQo+IGhhcHB5
IHRvIGNvbnNpZGVyIGEgc3VpdGFibGUgY29tbWVudCBpbiBjb2RlLgoKSSdsbCBnbyB3aXRoIHRo
ZSBjb21tZW50CgoKPiA+ICAgICAgIHUzMiBjbG9ja19mcmVxdWVuY3k7Cj4gPiAgICAgICBib29s
IGNsb2NrX3ZhbGlkOwo+ID4gICAgICAgdWludDY0X3QgbXBpZHJfYWZmOwo+ID4gQEAgLTg0Nyw4
ICs4NDcsMTggQEAgc3RhdGljIGludCBfX2luaXQgbWFrZV9jcHVzX25vZGUoY29uc3Qgc3RydWN0
IGRvbWFpbgo+ID4gKmQsIHZvaWQgKmZkdCkKPiA+ICAgICAgICAgICAgKiB0aGUgTVBJRFIncyBh
ZmZpbml0eSBiaXRzLiBXZSB3aWxsIHVzZSBBRkYwIGFuZCBBRkYxIHdoZW4KPiA+ICAgICAgICAg
ICAgKiBjb25zdHJ1Y3RpbmcgdGhlIHJlZyB2YWx1ZSBvZiB0aGUgZ3Vlc3QgYXQgdGhlIG1vbWVu
dCwgZm9yIGl0Cj4gPiAgICAgICAgICAgICogaXMgZW5vdWdoIGZvciB0aGUgY3VycmVudCBtYXgg
dmNwdSBudW1iZXIuCj4gPiArICAgICAgICAgKgo+ID4gKyAgICAgICAgICogV2Ugb25seSBkZWFs
IHdpdGggQUZGezAsIDEsIDJ9IHN0b3JlZCBpbiBiaXRzIFsyMzowXSBhdCB0aGUKPiA+ICsgICAg
ICAgICAqIG1vbWVudC4KPiA+ICAgICAgICAgICAgKi8KPiA+ICAgICAgICAgICBtcGlkcl9hZmYg
PSB2Y3B1aWRfdG9fdmFmZmluaXR5KGNwdSk7Cj4gPiArICAgICAgICBpZiAoIChtcGlkcl9hZmYg
JiB+R0VOTUFTS19VTEwoMjMsIDApKSAhPSAwICkKPiA+ICsgICAgICAgIHsKPiA+ICsgICAgICAg
ICAgICBwcmludGsoWEVOTE9HX0VSUiAiVW5hYmxlIHRvIGhhbmRsZSBNUElEUiBBRkZJTklUWQo+
ID4gMHglIlBSSXg2NCJcbiIsCj4gPiArICAgICAgICAgICAgICAgICAgIG1waWRyX2FmZik7Cj4g
PiArICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiArICAgICAgICB9Cj4gPiArCj4gPiAg
ICAgICAgICAgZHRfZHByaW50aygiQ3JlYXRlIGNwdUAlIlBSSXg2NCIgKGxvZ2ljYWwgQ1BVSUQ6
ICVkKSBub2RlXG4iLAo+ID4gICAgICAgICAgICAgICAgICAgICAgbXBpZHJfYWZmLCBjcHUpOwo+
ID4gICAKPiAKPiBDaGVlcnMsCj4gCj4gLS0gCj4gSnVsaWVuIEdyYWxsCj4gCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
