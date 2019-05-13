Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F69A1B7B3
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 16:04:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQBWo-0006vJ-Qh; Mon, 13 May 2019 14:02:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KEM8=TN=citrix.com=prvs=029c3005f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hQBWm-0006v4-Ls
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:02:04 +0000
X-Inumbo-ID: aef42183-7587-11e9-8980-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id aef42183-7587-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 14:02:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="89708654"
Date: Mon, 13 May 2019 16:01:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190513140154.zepkj3kpax5uenrl@Air-de-Roger>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
 <5CD2D598020000780022CD43@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CD2D598020000780022CD43@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 08/12] x86/IRQs: correct/tighten vector
 check in _clear_irq_vector()
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
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDc6MTE6NTJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gSWYgYW55IHBhcnRpY3VsYXIgdmFsdWUgd2FzIHRvIGJlIGNoZWNrZWQgYWdhaW5zdCwg
aXQgd291bGQgbmVlZCB0byBiZQo+IElSUV9WRUNUT1JfVU5BU1NJR05FRC4KPiAKPiBSZXBvcnRl
ZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gCj4gQmUgbW9y
ZSBzdHJpY3QgdGhvdWdoIGFuZCB1c2UgdmFsaWRfaXJxX3ZlY3RvcigpIGluc3RlYWQuCj4gCj4g
VGFrZSB0aGUgb3Bwb3J0dW5pdHkgYW5kIGFsc28gY29udmVydCBsb2NhbCB2YXJpYWJsZXMgdG8g
dW5zaWduZWQgaW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
