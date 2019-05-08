Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28493181E9
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 00:06:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOUeB-0002Mk-Sx; Wed, 08 May 2019 22:02:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FJge=TI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hOUeA-0002Mf-TP
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 22:02:42 +0000
X-Inumbo-ID: ff8906e9-71dc-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ff8906e9-71dc-11e9-8980-bc764e045a96;
 Wed, 08 May 2019 22:02:41 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B885320675;
 Wed,  8 May 2019 22:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557352960;
 bh=tZ3RnuPAQxBRGGSzTNd7/IbZ7wJHeyGtaVr/Ikpqd6g=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=blKiT5w5TC4RUh3W64vV0tCb942EpCPq5y5I1TI2bgqulK5ksv7w0DsNWhK+UB3NQ
 mVtLE9hR38pzDzR/T2NfYZJR5Qa2Z6hG01OsfSwxvi+zOtNvy4nPeudz7J9LysUQ6m
 E/qPucUeK6u6BVNN7gwlU8kJCDKgSSpI55nYjRUM=
Date: Wed, 8 May 2019 15:02:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <5CCFFC2A020000780022C16A@prv1-mh.provo.novell.com>
Message-ID: <alpine.DEB.2.21.1905081502140.9403@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.10.1905031347520.3722@sstabellini-ThinkPad-X260>
 <1556916614-21512-2-git-send-email-sstabellini@kernel.org>
 <5CCFFC2A020000780022C16A@prv1-mh.provo.novell.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/3] xen: actually skip the first MAX_ORDER
 bits in pfn_pdx_hole_setup
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCA2IE1heSAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4gT24gMDMuMDUuMTkg
YXQgMjI6NTAsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+IEZpeCB0aGUgaXNz
dWUgYnkgcGFzc2luZyBqKzEgYW5kIGkrMSB0byBmaW5kX25leHRfemVyb19iaXQgYW5kCj4gPiBm
aW5kX25leHRfYml0LiBBbHNvIGFkZCBhIGNoZWNrIGZvciBpID49IEJJVFNfUEVSX0xPTkcgYmVj
YXVzZQo+ID4gZmluZF97LG5leHRffXplcm9fYml0KCkgb24geDg2IGFzc3VtZSB0aGVpciBsYXN0
IGFyZ3VtZW50IHRvIGJlIGxlc3MKPiA+IHRoYW4gdGhlaXIgbWlkZGxlIG9uZS4KPiAKPiBJIGhh
ZCBwb2ludGVkIG91dCB4ODYgc2luY2UgSSBrbmV3IGl0IGhhcyB0aGlzIGFzc3VtcHRpb24uIE5v
dwo+IHRoYXQgeW91IG1lbnRpb24gaXQgaGVyZSwgSSB3b3VsZCBoYXZlIGV4cGVjdGVkIHlvdSd2
ZSBjaGVja2VkCj4gdGhhdCBBcm0gZG9lc24ndCBtYWtlIHNpbWlsYXIgYXNzdW1wdGlvbnMuIDMy
LWJpdCBBcm0gbG9va3MgdG8KPiBkbywgdGhvdWdoICh3aGlsZSA2NC1iaXQgaGFzIGEgZGVkaWNh
dGVkIGlmKCkgdG8gZGVhbCB3aXRoIHRoZQo+IHNpdHVhdGlvbikuCgpJIHRoaW5rIHRoYXQgZWl0
aGVyIHdheSB3ZSB3YW50IHRvIHNheSB0aGF0IHRob3NlIGZ1bmN0aW9ucyBhcmUgbm90CnN1cHBv
c2VkIHRvIGJlIGNhbGxlZCB0aGF0IHdheS4gSSdsbCB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdl
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
