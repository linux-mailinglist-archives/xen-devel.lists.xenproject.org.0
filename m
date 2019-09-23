Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E64BB7A9
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 17:14:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCQ0t-0002iH-CD; Mon, 23 Sep 2019 15:12:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XN81=XS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCQ0r-0002iA-QY
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 15:12:29 +0000
X-Inumbo-ID: 8e3da3f9-de14-11e9-9600-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 8e3da3f9-de14-11e9-9600-12813bfff9fa;
 Mon, 23 Sep 2019 15:12:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 75E2FAB9B;
 Mon, 23 Sep 2019 15:12:27 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <48d6972c-c15a-6f74-1726-ff4154f04c4d@suse.com>
 <92120cfd-0b0b-0152-5296-9c6889d21687@suse.com>
 <b8b5b176-3863-4b3b-fd43-c8012610dfff@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <01f86b13-958d-9ea2-7a79-129b5a79e777@suse.com>
Date: Mon, 23 Sep 2019 17:12:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b8b5b176-3863-4b3b-fd43-c8012610dfff@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/2] x86/traps: guard top-of-stack reads
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
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDkuMjAxOSAxNjoyMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNS8wNy8yMDE5
IDE2OjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gTm90aGluZyBndWFyYW50ZWVzIHRoYXQgdGhl
IG9yaWdpbmFsIGZyYW1lJ3Mgc3RhY2sgcG9pbnRlciBwb2ludHMgYXQKPj4gcmVhZGFibGUgbWVt
b3J5LiBBdm9pZCBhIChsaWtlbHkgbmVzdGVkKSBjcmFzaCBieSBhdHRhY2hpbmcgZXhjZXB0aW9u
Cj4+IHJlY292ZXJ5IHRvIHRoZSByZWFkIChtYWtpbmcgaXQgYSBzaW5nbGUgcmVhZCBhdCB0aGUg
c2FtZSB0aW1lKS4gRG9uJ3QKPj4gZXZlbiBpbnZva2UgX3Nob3dfdHJhY2UoKSBpbiBjYXNlIG9m
IGEgbm9uLXJlYWRhYmxlIHRvcCBzbG90Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgoKV2l0aCB0aGlzLCAuLi4KCj4gUmV2aWV3ZWQtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgouLi4gd2FzIHRoaXMgcGVy
aGFwcyBtZWFudCBmb3IgcGF0Y2ggMiBvZiB0aGlzIHNob3J0IHNlcmllcz8KCkphbgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
