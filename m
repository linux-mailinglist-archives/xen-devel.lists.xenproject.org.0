Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D10CE1B268
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 11:11:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQ6xG-0005Sw-GR; Mon, 13 May 2019 09:09:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KEM8=TN=citrix.com=prvs=029c3005f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hQ6xE-0005Sr-SH
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 09:09:04 +0000
X-Inumbo-ID: bec80c08-755e-11e9-82d3-1363f3a63372
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bec80c08-755e-11e9-82d3-1363f3a63372;
 Mon, 13 May 2019 09:09:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="89705394"
Date: Mon, 13 May 2019 11:08:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190513090852.qy5l2mtxheafjjxu@Air-de-Roger>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
 <5CD2D489020000780022CD34@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CD2D489020000780022CD34@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 03/12] x86/IRQ: avoid UB (or worse) in
 trace_irq_mask()
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
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDc6MDc6MjFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gRHluYW1pY2FsbHkgYWxsb2NhdGVkIENQVSBtYXNrIG9iamVjdHMgbWF5IGJlIHNtYWxs
ZXIgdGhhbiBjcHVtYXNrX3QsIHNvCj4gY29weWluZyBoYXMgdG8gYmUgcmVzdHJpY3RlZCB0byB0
aGUgYWN0dWFsIGFsbG9jYXRpb24gc2l6ZS4gVGhpcyBpcwo+IHBhcnRpY3VsYXJ5IGltcG9ydGFu
dCBzaW5jZSB0aGUgZnVuY3Rpb24gZG9lc24ndCBiYWlsIGVhcmx5IHdoZW4gdHJhY2luZwo+IGlz
IG5vdCBhY3RpdmUsIHNvIGV2ZW4gcHJvZHVjdGlvbiBidWlsZHMgd291bGQgYmUgYWZmZWN0ZWQg
YnkgcG90ZW50aWFsCj4gbWlzYmVoYXZpb3IgaGVyZS4KPiAKPiBUYWtlIHRoZSBvcHBvcnR1bml0
eSBhbmQgYWxzbwo+IC0gdXNlIGluaXRpYWxpemVycyBpbnN0ZWFkIG9mIGFzc2lnbm1lbnQgKyBt
ZW1zZXQoKSwKPiAtIGNvbnN0aWZ5IHRoZSBjcHVtYXNrX3QgaW5wdXQgcG9pbnRlciwKPiAtIHUz
MiAtPiB1aW50MzJfdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+CgpUaGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
