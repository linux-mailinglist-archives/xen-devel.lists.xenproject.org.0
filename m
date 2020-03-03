Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 220641776FC
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 14:29:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j97aJ-00012b-KY; Tue, 03 Mar 2020 13:27:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TLdZ=4U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j97aI-00012W-Gc
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 13:27:42 +0000
X-Inumbo-ID: c248e924-5d52-11ea-b7d4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c248e924-5d52-11ea-b7d4-bc764e2007e4;
 Tue, 03 Mar 2020 13:27:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 51074B1A2;
 Tue,  3 Mar 2020 13:27:41 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200204130614.15166-1-julien@xen.org>
 <20200204130614.15166-3-julien@xen.org>
 <3c1f1f91-6350-57de-2134-ab98bd4186d4@xen.org>
 <447cdd4f-cb30-d4ec-3cb9-852ff41c86f6@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ebc81484-6596-13a6-7afe-d9406aa5945e@suse.com>
Date: Tue, 3 Mar 2020 14:27:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <447cdd4f-cb30-d4ec-3cb9-852ff41c86f6@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen/x86: hap: Clean-up and harden
 hap_enable()
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDMuMjAyMCAxMzoyMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFBpbmcgYWdhaW4uCgpU
byBiZSBob25lc3QsIHdpdGggdGhlIHJlY2VudCBtYWludGFpbmVyIGNoYW5nZSBpdCB3b3VsZCBw
cm9iYWJseQpoYXZlIGJlZW4gaGVscGZ1bCBpZiB5b3UgaGFkIHNpbXBseSByZS1zZW50IHRoZSBw
YXRjaC4gSSBkaWQgc2VlCml0IGJhY2sgdGhlbiwgYnV0IGhhZCBubyBjb21tZW50cyB0byBtYWtl
IGFuZCBkaWRuJ3QgaGF2ZSB0aGUKYXV0aG9yaXR5IHRvIGFjayBpdCwgc28gc2ltcGx5IGRyb3Bw
ZWQgaXQgZnJvbSBteSBtYWlsYm94IHNlZWluZwp0aGF0IHlvdSB3b3VsZCBiZSBhYmxlIHRvIGNv
bW1pdCBpdCB5b3Vyc2VsZiBldmVudHVhbGx5LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
