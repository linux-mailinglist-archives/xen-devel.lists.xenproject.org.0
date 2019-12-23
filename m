Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 236311297C0
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 15:58:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijP7V-0004W7-Ew; Mon, 23 Dec 2019 14:55:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Anrm=2N=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1ijP7T-0004W0-BT
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 14:55:39 +0000
X-Inumbo-ID: 480c4250-2594-11ea-b6f1-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 480c4250-2594-11ea-b6f1-bc764e2007e4;
 Mon, 23 Dec 2019 14:55:38 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p17so16410753wma.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Dec 2019 06:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nVe9ZSJHDokIGW8z1gEoPvwKkgBZGs+mQigtoE6+GVA=;
 b=aPsUkdZs9pPT6+HOCXN8lEw59dyzNwSO0TxZXvrLLJ9QE3+P0v2n1J69ef8tBZZCA9
 UcBT37vM/Gghb+RInCKe5K+HQ24MsvtiTBQ7lgG+LWkkeSijK6ro1cAhtC9I4CjN8DqG
 Z69tZnJVHpc60NeGstQpjJVhB+idUu2ITk3tiqplRzu/YF0k3U/1MChUZ6Vk2BjpaMEG
 lLYPkYSY/qsjBSZXxphF3wrfw/f/vEOXn1Wr/a7Arx9jbru4IeFvc+kNfl/t7+8EKFkg
 ntQP/AWzV0HVmM2A/BCyQw0qLsJhK1nfBhj4GSHZRI6+cFBlIuW8bOjFXRjFm05kchEI
 woCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nVe9ZSJHDokIGW8z1gEoPvwKkgBZGs+mQigtoE6+GVA=;
 b=RDL4p3atgtIgDO/oBKK+sVz9Y5++IXgujQ/NdAfzvhYz9O6pw2ba/elVXunrNgOGlo
 MA1eqjyHtWYbrP+mJzlao6LcTd5g3D8+mYgqpdS2YVnsTNaaXWbD5qF9wbhlyk0F106y
 mLrNDOFqvmeCVHTGs/cBkAzGbu/Z3Z311QBf7zkJvHmwH5YYbha2QVijWO/KvdZFqafh
 3WkxGmKyQFqx2zpxQddMx8xM1N3y6rGfstGhS8TwDDQrTjRS8dYC5nvJVsEi+pzeymM3
 +1GjVAhgrpC6n7tBVRRy1IfF3IwekDvjHAqAWqZypg3wxy0mwlesvrwe49zLDbsxgbqL
 cwEg==
X-Gm-Message-State: APjAAAVxqcWDPwtkTFn7GfLtjzu/VK1naCdc8LcgWDmigkEQn8RHXhD+
 5VD1k3bgNFjrAcIaolZMn52U+1Z7L4avUIhdFiA=
X-Google-Smtp-Source: APXvYqyahSY2vOa9/OtaCHQqQnjAz26eh67c6ey5UIfISbRN9i9YN64HWP02+24QiwIgyF2EsyvcTZXe9QCD6P+JbT4=
X-Received: by 2002:a1c:640a:: with SMTP id y10mr32356423wmb.14.1577112937849; 
 Mon, 23 Dec 2019 06:55:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <0987641ced136706961cf419eb5ed83d1302357b.1576697796.git.tamas.lengyel@intel.com>
 <ba37b587-6a4a-ecd8-3e2f-400e2755b24d@suse.com>
 <CABfawhmGQz8cAQWv-pkTXTNNXS-ML6wDcCon5ONAUZr_VP8WUA@mail.gmail.com>
 <530c2a0e-c79a-b540-8d6a-9d50e22bff41@citrix.com>
 <dab59394-756a-95de-76ac-c4fb34ee85a2@suse.com>
In-Reply-To: <dab59394-756a-95de-76ac-c4fb34ee85a2@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 23 Dec 2019 07:55:02 -0700
Message-ID: <CABfawhmeMQtpwjubk_YLO26Lo+6JvZtVtqKWexgjE3VR8SNZZQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v2 01/20] x86: make hvm_{get/set}_param
 accessible
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgMjMsIDIwMTkgYXQgMjozNyBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMjAuMTIuMjAxOSAxODozMiwgQW5kcmV3IENvb3BlciB3cm90
ZToKPiA+IE9uIDIwLzEyLzIwMTkgMTc6MjcsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+PiBP
biBGcmksIERlYyAyMCwgMjAxOSBhdCA5OjQ3IEFNIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4gPj4+IE9uIDE4LjEyLjIwMTkgMjA6NDAsIFRhbWFzIEsgTGVuZ3llbCB3
cm90ZToKPiA+Pj4+IEN1cnJlbnRseSB0aGUgaHZtIHBhcmFtZXRlcnMgYXJlIG9ubHkgYWNjZXNz
aWJsZSB2aWEgdGhlIEhWTU9QIGh5cGVyY2FsbHMuIEJ5Cj4gPj4+PiBleHBvc2luZyBodm1fe2dl
dC9zZXR9X3BhcmFtIGl0IHdpbGwgYmUgcG9zc2libGUgZm9yIFZNIGZvcmtpbmcgdG8gY29weSB0
aGUKPiA+Pj4+IHBhcmFtZXRlcnMgZGlyZWN0bHkgaW50byB0aGUgY2xvbmUgZG9tYWluLgo+ID4+
PiBIYXZpbmcgcGVla2VkIGFoZWFkIGF0IHBhdGNoIDE3LCB3aGVyZSB0aGlzIGdldHMgdXNlZCwg
SSB3b25kZXIgd2h5Cj4gPj4+IHlvdSB3YW50IGEgcGFpciBvZiBvbmUtYnktb25lIGZ1bmN0aW9u
cywgcmF0aGVyIHRoYW4gYSBjb3B5LWFsbCBvbmUuCj4gPj4+IFRoaXMgdGhlbiB3b3VsZG4ndCBy
ZXF1aXJlIGV4cG9zdXJlIG9mIHRoZSBmdW5jdGlvbnMgeW91IHRvdWNoIGhlcmUuCj4gPj4gV2Vs
bCwgcHJvdmlkZWQgdGhlcmUgaXMgbm8gc3VjaCBmdW5jdGlvbiBpbiBleGlzdGVuY2UgdG9kYXkg
aXQgd2FzCj4gPj4ganVzdCBlYXNpZXIgdG8gdXNlIHdoYXQncyBhbHJlYWR5IGF2YWlsYWJsZS4g
SSBzdGlsbCB3b3VsZG4ndCB3YW50IHRvCj4gPj4gaW1wbGVtZW50IGEgb25lLXNob3QgZnVuY3Rp
b24gbGlrZSB0aGF0IGJlY2F1c2UgdGhpcyBzYW1lIGNvZGUtcGF0aCBpcwo+ID4+IHNoYXJlZCBi
eSB0aGUgc2F2ZS1yZXN0b3JlIG9wZXJhdGlvbnMgb24gdGhlIHRvb2xzdGFjayBzaWRlLCBzbyBh
dAo+ID4+IGxlYXN0IEkgaGF2ZSBhIHJlYXNvbmFibGUgYXNzdW1wdGlvbiB0aGF0IGl0IHdvbid0
IGJyZWFrIG9uIG1lIGluIHRoZQo+ID4+IGZ1dHVyZS4KPiA+Cj4gPiBJbiBwYXJ0aWN1bGFyLCBh
IG51bWJlciBvZiB0aGUgc2V0IG9wZXJhdGlvbnMgYXJlIGRpc3RpbmN0bHkKPiA+IG5vbi10cml2
aWFsLgo+Cj4gSG93IGlzIHRyaXZpYWwgb3Igbm90IHJlbGF0ZWQgdG8gdGhlcmUgYmVpbmcgb25l
IGZ1bmN0aW9uIGRvaW5nCj4gdGhlIGxvb3Bpbmcgd2FudGVkIGhlcmUgdnMgdGhlIGxvb3Bpbmcg
YmVpbmcgZG9uZSBieSB0aGUgY2FsbGVyCj4gYXJvdW5kIHRoZSB0d28gcGVyLWVudGl0eSBjYWxs
cz8KCkkgZG9uJ3QgcmVhbGx5IGdldCB3aHkgd291bGQgaXQgbWF0dGVyIHdoZXJlIHRoZSBsb29w
aW5nIGlzIGJlaW5nCmRvbmU/IEV2ZW4gaWYgSSB3ZXJlIHRvIGFkZCBhIHNpbmdsZSBmdW5jdGlv
biB0byBkbyB0aGlzLCBpdCB3b3VsZCBkbwp0aGUgc2FtZSBsb29waW5nIGFuZCBqdXN0IGNhbGwg
dGhlIG5vdyBpbnRlcm5hbGx5IGtlcHQgZ2V0L3NldCBwYXJhbXMKZnVuY3Rpb25zLgoKVGFtYXMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
