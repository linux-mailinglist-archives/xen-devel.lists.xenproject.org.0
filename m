Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B9F14A69D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 15:55:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw5lW-0005Sh-Fx; Mon, 27 Jan 2020 14:53:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1l6N=3Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iw5lU-0005ST-M6
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 14:53:24 +0000
X-Inumbo-ID: c4598048-4114-11ea-b833-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4598048-4114-11ea-b833-bc764e2007e4;
 Mon, 27 Jan 2020 14:53:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7CB7AABED;
 Mon, 27 Jan 2020 14:53:23 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200127134800.15078-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <adca713f-846d-ddf8-52ad-73f1d9ae7257@suse.com>
Date: Mon, 27 Jan 2020 15:53:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200127134800.15078-1-julien@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/x86: domctl: Don't leak data via
 XEN_DOMCTL_gethvmcontext
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDEuMjAyMCAxNDo0OCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEZyb206IEp1bGllbiBH
cmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Cj4gCj4gVGhlIEhWTSBjb250ZXh0IG1heSBub3QgZmls
bCB1cCB0aGUgZnVsbCBidWZmZXIgcGFzc2VkIGJ5IHRoZSBjYWxsZXIuCj4gV2hpbGUgd2UgcmVw
b3J0IGNvcmVjdGx5IHRoZSBzaXplIG9mIHRoZSBjb250ZXh0LCB3ZSB3aWxsIHN0aWxsIGJlCj4g
Y29weWluZyBiYWNrIHRoZSBmdWxsIHNpemUgb2YgdGhlIGJ1ZmZlci4KPiAKPiBBcyB0aGUgYnVm
ZmVyIGlzIGFsbG9jYXRlZCB0aHJvdWdoIHhtYWxsb2MoKSwgd2Ugd2lsbCBiZSBjb3B5aW5nIHNv
bWUKPiBiaXRzIGZyb20gdGhlIHByZXZpb3VzIGFsbG9jYXRpb24uCj4gCj4gT25seSBjb3B5IGJh
Y2sgdGhlIHBhcnQgb2YgdGhlIGJ1ZmZlciB1c2VkIGJ5IHRoZSBIVk0gY29udGV4dCB0byBwcmV2
ZW50Cj4gYW55IGxlYWsuCj4gCj4gTm90ZSB0aGF0IHBlciBYU0EtNzIsIHRoaXMgaXMgbm90IGEg
c2VjdXJpdHkgaXNzdWUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxA
YW1hem9uLmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
