Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1E0102545
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 14:20:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX3Oc-0001ek-GI; Tue, 19 Nov 2019 13:18:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wZDO=ZL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iX3Ob-0001ed-CX
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 13:18:17 +0000
X-Inumbo-ID: 0bf8edca-0acf-11ea-984a-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0bf8edca-0acf-11ea-984a-bc764e2007e4;
 Tue, 19 Nov 2019 13:18:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 210A3B03A;
 Tue, 19 Nov 2019 13:18:16 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <d66b1da4-8096-9b77-1ca6-d6b9954b113c@suse.com>
 <a5986837-01eb-7bf8-bf42-4d3084d6a1f5@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <fcfc2cc3-4f98-882d-ed14-d6e2e4d8731d@suse.com>
Date: Tue, 19 Nov 2019 14:18:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <a5986837-01eb-7bf8-bf42-4d3084d6a1f5@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] x86/Xen/32: simplify
 xen_iret_crit_fixup's ring check
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
 the arch/x86 maintainers <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTEuMTkgMTU6MzIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoaXMgY2FuIGJlIGhhZCB3
aXRoIHR3byBpbnN0ZWFkIG9mIHNpeCBpbnNucywgYnkganVzdCBjaGVja2luZyB0aGUgaGlnaAo+
IENTLlJQTCBiaXQuCj4gCj4gQWxzbyBhZGp1c3QgdGhlIGNvbW1lbnQgLSB0aGVyZSB3b3VsZCBi
ZSBubyAjR1AgaW4gdGhlIG1lbnRpb25lZCBjYXNlcywKPiBhcyB0aGVyZSdzIG5vIHNlZ21lbnQg
bGltaXQgdmlvbGF0aW9uIG9yIGFsaWtlLiBJbnN0ZWFkIHRoZXJlJ2QgYmUgI1BGLAo+IGJ1dCB0
aGF0IG9uZSByZXBvcnRzIHRoZSB0YXJnZXQgRUlQIG9mIHNhaWQgYnJhbmNoLCBub3QgdGhlIGFk
ZHJlc3Mgb2YKPiB0aGUgYnJhbmNoIGluc24gaXRzZWxmLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
