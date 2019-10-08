Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A17ADCEFE3
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 02:22:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHdCv-0002XT-L3; Tue, 08 Oct 2019 00:18:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M61b=YB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iHdCu-0002XO-Ut
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 00:18:28 +0000
X-Inumbo-ID: 2662ca76-e961-11e9-80e3-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2662ca76-e961-11e9-80e3-bc764e2007e4;
 Tue, 08 Oct 2019 00:18:28 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 28D4E20867;
 Tue,  8 Oct 2019 00:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570493907;
 bh=BbyQVtBao3iVZmAvg8IXiI9Ho1mGWNONZ055zMuwYDw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=lcVrximjG8v7n0yHm2eHAKHIFjz22ey+F9BuiV6iAqw6G3vjXwDf2DJUqR8upM3h+
 0BmfVtjGBc+p7LLZqEhTsbfVHkqoNZY71QrYpaB0WDL1PwL5qGcBcFebrqsnyR0XOR
 DEwxCdPixFHHmFFuNwE01tInzz3TzWQUT5sGlr2s=
Date: Mon, 7 Oct 2019 17:18:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <Julien.Grall@arm.com>
In-Reply-To: <40fc893e-2739-2fec-4b17-2aaa733ddc6c@arm.com>
Message-ID: <alpine.DEB.2.21.1910071620140.13684@sstabellini-ThinkPad-T480s>
References: <20190917160202.16770-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1909191613060.19418@sstabellini-ThinkPad-T480s>
 <5a093a67-51f6-2d3d-6a98-87753cf4d186@arm.com>
 <alpine.DEB.2.21.1909200813510.3272@sstabellini-ThinkPad-T480s>
 <72de38de-2856-8873-ed70-6c354786bba3@arm.com>
 <alpine.DEB.2.21.1910021756570.2691@sstabellini-ThinkPad-T480s>
 <40fc893e-2739-2fec-4b17-2aaa733ddc6c@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [[PATCH for-4.13]] xen/arm: mm: Allow generic xen
 page-tables helpers to be called early
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCA3IE9jdCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCj4gCj4gT24gMDMv
MTAvMjAxOSAwMjowMiwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24gRnJpLCAyMCBT
ZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4+IFRoYXQncyBub3QgY29ycmVjdC4gYWxs
b2NfYm9vdF9wYWdlcygpIGlzIGFjdHVhbGx5IGhlcmUgdG8gYWxsb3cgZHluYW1pYwo+ID4+IGFs
bG9jYXRpb24gYmVmb3JlIHRoZSBtZW1vcnkgc3Vic3lzdGVtIChhbmQgdGhlcmVmb3JlIHRoZSBy
dW50aW1lIGFsbG9jYXRvcikKPiA+PiBpcyBpbml0aWFsaXplZC4KPiA+IAo+ID4gTGV0IG1lIGNo
YW5nZSB0aGUgcXVlc3Rpb24gdGhlbjogaXMgdGhlIHN5c3RlbV9zdGF0ZSA9PQo+ID4gU1lTX1NU
QVRFX2Vhcmx5X2Jvb3QgY2hlY2sgc3RyaWN0bHkgbmVjZXNzYXJ5PyBJdCBsb29rcyBsaWtlIGl0
IGlzIG5vdDoKPiA+IHRoZSBwYXRjaCB3b3VsZCB3b3JrIGV2ZW4gaWYgaXQgd2FzIGp1c3Q6Cj4g
Cj4gSSBoYWQgYSBmZXcgdGhvdWdodHMgYWJvdXQgaXQuIE9uIEFybTMyLCB0aGlzIG9ubHkgcmVh
bGx5IHdvcmtzIGZvciAKPiAzMi1iaXRzIG1hY2hpbmUgYWRkcmVzcyAoaXQgY2FuIGdvIHVwIHRv
IDQwLWJpdHMpLiBJIGhhdmVuJ3QgcmVhbGx5IAo+IGZ1bGx5IGludmVzdGlnYXRlZCB3aGF0IGNv
dWxkIGdvIHdyb25nLCBidXQgaXQgd291bGQgYmUgYmVzdCB0byBrZWVwIGl0IAo+IG9ubHkgZm9y
IGVhcmx5IGJvb3QuCj4gCj4gQWxzbywgSSBkb24ndCByZWFsbHkgd2FudCB0byByZWx5IG9uIHRo
aXMgIndvcmthcm91bmQiIGFmdGVyIGJvb3QuIE1heWJlIAo+IHdlIHdvdWxkIHdhbnQgdG8ga2Vl
cCB0aGVtIHVubWFwcGVkIGluIHRoZSBmdXR1cmUuCgpZZXMsIG5vIHByb2JsZW1zLCB3ZSBhZ3Jl
ZSBvbiB0aGF0LiBJIGFtIG5vdCBhc2tpbmcgaW4gcmVnYXJkcyB0byB0aGUKY2hlY2sgc3lzdGVt
X3N0YXRlID09IFNZU19TVEFURV9lYXJseV9ib290IHdpdGggdGhlIGdvYWwgb2YgYXNraW5nIHlv
dQp0byBnZXQgcmlkIG9mIGl0LiBJIGFtIGZpbmUgd2l0aCBrZWVwaW5nIHRoZSBjaGVjay4gKE1h
eWJlIHdlIHdhbnQgdG8gYWRkCmFuIGB1bmxpa2VseSgpJyBhcm91bmQgdGhlIGNoZWNrLikKCkkg
YW0gdHJ5aW5nIHRvIHVuZGVyc3RhbmQgd2hldGhlciB0aGUgY29kZSBhY3R1YWxseSByZWxpZXMg
b24Kc3lzdGVtX3N0YXRlID09IFNZU19TVEFURV9lYXJseV9ib290LCBhbmQsIGlmIHNvLCB3aHku
IFRoZSBnb2FsIGlzIHRvCm1ha2Ugc3VyZSB0aGF0IGlmIHRoZXJlIGFyZSBzb21lIGxpbWl0YXRp
b25zIHRoYXQgdGhleSBhcmUgZG9jdW1lbnRlZCwKb3IganVzdCB0byBkb3VibGUtY2hlY2sgdGhh
dCB0aGVyZSBhcmUgbm8gbGltaXRhdGlvbnMuCgpJbiByZWdhcmRzIHRvIHlvdXIgY29tbWVudCBh
Ym91dCBvbmx5IHdvcmtpbmcgZm9yIDMyLWJpdCBhZGRyZXNzZXMgb24KQXJtMzIsIHlvdSBoYXZl
IGEgcG9pbnQuIEF0IGxlYXN0IHdlIHNob3VsZCBiZSBjYXJlZnVsIHdpdGggdGhlIG1mbiB0bwp2
YWRkciBjb252ZXJzaW9uIGJlY2F1c2UgbWZuX3RvX21hZGRyIHJldHVybnMgYSBwYWRkcl90IHdo
aWNoIGlzIDY0LWJpdAphbmQgdmFkZHJfdCBpcyAzMi1iaXQuIEkgaW1hZ2luZSB0aGF0IHRoZW9y
ZXRpY2FsbHksIGV2ZW4gd2l0aApzeXN0ZW1fc3RhdGUgPT0gU1lTX1NUQVRFX2Vhcmx5X2Jvb3Qs
IGl0IGNvdWxkIGdldCB0cnVuY2F0ZWQgd2l0aCB0aGUKd3JvbmcgY29tYmluYXRpb24gb2YgbWZu
IGFuZCBwaHlzX29mZnNldC4KCklmIG5vdGhpbmcgZWxzZSwgbWF5YmUgd2Ugc2hvdWxkIGFkZCBh
IHRydW5jYXRpb24gY2hlY2sgZm9yIHNhZmV0eT8KU29tZXRoaW5nIGxpa2UgdGhlIGZvbGxvd2lu
ZyBidXQgdGhhdCBpZGVhbGx5IHdvdWxkIGJlIGFwcGxpY2FibGUgdG8KYXJtNjQgdG9vIHdpdGhv
dXQgaGF2aW5nIHRvIGFkZCBhbiAjaWZkZWY6CgogICAgcGFkZHJfdCBwYSA9IG1mbl90b19tYWRk
cihtZm4pIC0gcGh5c19vZmZzZXQ7CgogICAgaWYgKCBwYSA8IF9lbmQgJiYgaXNfa2VybmVsKCh2
YWRkcl90KXBhKSApCiAgICAgICAgcmV0dXJuIChscGFlX3QgKikodmFkZHJfdClwYTsKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
