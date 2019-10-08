Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE67AD02C4
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 23:21:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHwsQ-0007nS-Jc; Tue, 08 Oct 2019 21:18:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M61b=YB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iHwsO-0007nN-Lm
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 21:18:36 +0000
X-Inumbo-ID: 30081dc8-ea11-11e9-80e3-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30081dc8-ea11-11e9-80e3-bc764e2007e4;
 Tue, 08 Oct 2019 21:18:35 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AFEB321721;
 Tue,  8 Oct 2019 21:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570569515;
 bh=mZNWFLlfTAgWL/Tqb0fhpFmJalhhoEyXC4Wou7gAhco=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=y50L5d7kDzbYG/PB1rj9wND3JDtNffkbfUs0r2ud7MV1HI+lS5l7KQeakoRN349fB
 YfHy9vBD1NDA5sNE6iScK0o3i/Q2fZ+NP0SVSndBdLw7gmRzR+a5gNZhmyo2/2y1s3
 hs/OCJny7xGrKZap8Uypd5sWEI7ka5TEPyTye+P0=
Date: Tue, 8 Oct 2019 14:18:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <06903f95-0135-c392-3e44-9a9928a3a6de@arm.com>
Message-ID: <alpine.DEB.2.21.1910081413160.13684@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1910071811320.13684@sstabellini-ThinkPad-T480s>
 <20191008011501.21038-1-sstabellini@kernel.org>
 <06903f95-0135-c392-3e44-9a9928a3a6de@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 1/3] xen/arm: fix buf size in
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

T24gVHVlLCA4IE9jdCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gT24gMTAvOC8xOSAyOjE0
IEFNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBUaGUgc2l6ZSBvZiBidWYgaXMgY2Fs
Y3VsYXRlZCB3cm9uZ2x5OiB0aGUgbnVtYmVyIGlzIDY0Yml0LCBub3QgMzJiaXQuCj4gCj4gV2hp
bGUgdGhlIHZhcmlhYmxlIG1wZGlyX2FmZiBpcyA2NC1iaXQsIHdlIG9ubHkgd3JpdGUgdGhlIGZp
cnN0IDMyLWJpdCBpbiB0aGUKPiBwcm9wZXJ0eSByZWcgKCNhZGRyZXNzLWNlbGxzID09IDEgYW5k
IGZkdF9wcm9wZXJ0eV9jZWxsKCkpLiBTbyB3aGF0IG5lZWRzIHRvCj4gYmUgbW9kaWZpZWQgaXMg
dGhlIGZvcm1hdCBoZXJlLgo+IAo+IEFsc28sIGxvb2tpbmcgdGhlIENQVSBiaW5kaW5ncyAoc2Vl
Cj4gbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9jcHVzLnlhbWwp
LCB0ZWNobmljYWxseSBvbmx5IHRoZQo+IGJpdHMgWzIzOjBdIG9mIHRoZSBtcGlkciBzaG91bGQg
YmUgdXNlZC4gVGhlIHJlc3QgaXMgemVyb2VkLgo+IAo+IFRoaXMgaXMgb2sgYmVjYXVzZSB2Y3B1
aWRfdG9fdmFmZmluaXR5KCkgaXMgYWx3YXlzIHJldHVybmluZyBhIHZhbHVlIGZvbGxvd2luZwo+
IHRoZSByZXF1aXJlbWVudHMgYWJvdmUuIEhvd2V2ZXIsIGZvciBjb3JyZWN0bmVzcywgdGhpcyBt
YXkgd2FudCB0byBiZSBmaXhlZC4KCkl0IGxvb2tzIGxpa2UgaXQgd291bGQgYmUgYmVzdCB0byBj
aGFuZ2UgbXBkaXJfYWZmIHRvIHVpbnQzMl90IGFuZApjaGFuZ2UgdmNwdWlkX3RvX3ZhZmZpbml0
eSB0byByZXR1cm4gYSB1aW50MzJfdC4KClRoZW4gb2YgY291cnNlIHRoZSBidWYgYWxsb2NhdGlv
biB3b3VsZCBiZSBidWZbMTNdLgoKSXMgdGhhdCB3aGF0IHlvdSBoYXZlIGluIG1pbmQ/CgoKPiA+
IEFsc28gdGhlIG51bWJlciBpcyBwcmludGVkIGFzIGEgaGV4YWRlY2ltYWwgbnVtYmVyLCBzbyB3
ZSBuZWVkIDggYnl0ZXMKPiA+IGZvciAzMmJpdCwgbm90IDEwIGJ5dGVzLgo+ID4gCj4gPiBBcyBh
IHJlc3VsdCwgaXQgc2hvdWxkIGJlIHNpemVvZigiY3B1QCIpICsgMTYgYnl0ZXMgZm9yIGEgNjQt
Yml0IG51bWJlcgo+ID4gKyAxIGJ5dGUgZm9yIFwwLiBUb3RhbCA9IDIxLgo+ID4gCj4gPiBGaXhl
czogZmFmZDY4MmMzZSAoeGVuL2FybTogQ3JlYXRlIGEgZmFrZSBjcHVzIG5vZGUgaW4gZG9tMCBk
ZXZpY2UgdHJlZSkKPiAKPiBJIGFtIGFmcmFpZCB0aGlzIGlzIG5vdCBmaXhpbmcgdGhpcyBwYXRj
aDoKPiAKPiBzbnByaW50ZihidWYsIHNpemVvZihidWYpLCAiY3B1QCV1IiwgY3B1KTsKPiAKPiBT
byB0aGUgMTAgYnl0ZXMgd2VyZSBhY3R1YWxseSBjb3JyZWN0IGJhY2sgdGhlbi4KPiAKPiBUaGUg
cHJvYmxlbSB3YXMgaW50cm9kdWNlZCBieSBjb21taXQgYzgxYTc5MWQzNCAieGVuL2FybTogU2V0
ICdyZWcnIG9mIGNwdQo+IG5vZGUgZm9yIGRvbTAgdG8gbWF0Y2ggTVBJRFIncyBhZmZpbml0eSIu
CgpZZXMsIEknbGwgY2hhbmdlIGl0CgoKPiA+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3RlZmFuby5zdGFiZWxsaW5pQHhpbGlueC5jb20+Cj4gPiAtLS0KPiA+IENoYW5nZXMg
aW4gdjI6Cj4gPiAtIHBhdGNoIGFkZGVkCj4gPiAtLS0KPiA+ICAgeGVuL2FyY2gvYXJtL2RvbWFp
bl9idWlsZC5jIHwgNCArKy0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWlu
X2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiA+IGluZGV4IDkyMWIwNTQ1
MjAuLjYwOTIzYTcwNTEgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxk
LmMKPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+ID4gQEAgLTc4OCw4ICs3
ODgsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBtYWtlX2NwdXNfbm9kZShjb25zdCBzdHJ1Y3QgZG9t
YWluICpkLAo+ID4gdm9pZCAqZmR0KQo+ID4gICAgICAgdW5zaWduZWQgaW50IGNwdTsKPiA+ICAg
ICAgIGNvbnN0IHZvaWQgKmNvbXBhdGlibGUgPSBOVUxMOwo+ID4gICAgICAgdTMyIGxlbjsKPiA+
IC0gICAgLyogUGxhY2Vob2xkZXIgZm9yIGNwdUAgKyBhIDMyLWJpdCBudW1iZXIgKyBcMCAqLwo+
ID4gLSAgICBjaGFyIGJ1ZlsxNV07Cj4gPiArICAgIC8qIFBsYWNlaG9sZGVyIGZvciBjcHVAICsg
YSA2NC1iaXQgbnVtYmVyICsgXDAgKi8KPiA+ICsgICAgY2hhciBidWZbMjFdOwo+ID4gICAgICAg
dTMyIGNsb2NrX2ZyZXF1ZW5jeTsKPiA+ICAgICAgIGJvb2wgY2xvY2tfdmFsaWQ7Cj4gPiAgICAg
ICB1aW50NjRfdCBtcGlkcl9hZmY7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
