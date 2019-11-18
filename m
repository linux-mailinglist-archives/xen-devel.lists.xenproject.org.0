Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29894100304
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 11:55:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWeei-0002M9-88; Mon, 18 Nov 2019 10:53:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eRBh=ZK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iWeeg-0002M2-BJ
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 10:53:14 +0000
X-Inumbo-ID: 9de27bcc-09f1-11ea-a2d6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9de27bcc-09f1-11ea-a2d6-12813bfff9fa;
 Mon, 18 Nov 2019 10:53:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 31C14B14F;
 Mon, 18 Nov 2019 10:53:12 +0000 (UTC)
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-14-daniel.vetter@ffwll.ch>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <354de8f0-46bb-a4ed-c80e-cb364c315165@suse.com>
Date: Mon, 18 Nov 2019 11:53:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191118103536.17675-14-daniel.vetter@ffwll.ch>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 13/15] xen/gntdev-dmabuf: Ditch dummy map
 functions
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTEuMTkgMTE6MzUsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gVGhlcmUncyBubyBpbi1r
ZXJuZWwgdXNlcnMgZm9yIHRoZSBrKHVuKW1hcCBzdHVmZi4gQW5kIHRoZSBtbWFwIG9uZSBpcwo+
IGFjdGl2ZWx5IGhhcm1mdWwgLSByZXR1cm4gMCBhbmQgdGhlbiBfbm90XyBhY3R1YWxseSBtbWFw
aW5nIGNhbid0IGVuZAo+IHdlbGwuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0
cm92c2t5QG9yYWNsZS5jb20+Cj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
PiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENjOiB4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+Cgo+IC0tCj4gQWNrIGZvciBtZXJnaW5nIHRoaXMgdGhyb3VnaCBk
cm0gdHJlZXMgdmVyeSBtdWNoIGFwcHJlY2lhdGVkLgoKWWVzLCBJJ20gZmluZSB3aXRoIHRoYXQu
CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
