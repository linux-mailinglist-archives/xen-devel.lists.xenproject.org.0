Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB1A1341C8
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 13:32:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipAT8-0002dF-VF; Wed, 08 Jan 2020 12:29:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e5qD=25=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ipAT7-0002d7-F7
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 12:29:49 +0000
X-Inumbo-ID: 8a9df462-3212-11ea-a455-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a9df462-3212-11ea-a455-bc764e2007e4;
 Wed, 08 Jan 2020 12:29:40 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p9so2289085wmc.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2020 04:29:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=t2iFw/vOP4HjRcnjhcBDB1I9YyMy5eM9tmephDl3yD8=;
 b=kdC8qUeACMuzi/xTYrD9ccKD2kU4zKgICv7KaCbHFSg3BjjKhhBx+zzizRtwAq5Vgk
 s1RjMhkPExSbo8cExR3CuuNAa9mPKIE6Zbkp2VKy+2sqKM6Yr9CKx4po/yL9CZDk1c0i
 M6HslbLiw/s9LVymkmpDDsnr4e+H/jragKVQR/ckZpq0/A5IFN1EMBnrENpzOsm3pSaU
 UMpmqN26HuJGMPpihSBsTak1yc+5QgVGuBfb9Wamqc5O3PHhe4LT2JnLuC6Z4vGd0t+G
 CsI3UsI1LASNBZHrmiHNh66Vpl7JfFZXt7GzXEMLMi5lziKC2joeiJXCkhZzeZB+RSaF
 2u2A==
X-Gm-Message-State: APjAAAWCY/YMSMhZ822wWhOeAIDIINY1j6mOJvOu2hm4R47pdxp8rYyq
 itnKklU8/0ezkPTXfiKJCDY=
X-Google-Smtp-Source: APXvYqw5v8PX6gictx2zLz2REh2LaQ5tGfCdCB/gxpvTVEbxR72tLZpwZvUBeyh8F9cCgsWJ7jK2cA==
X-Received: by 2002:a05:600c:20c7:: with SMTP id
 y7mr3722437wmm.21.1578486580138; 
 Wed, 08 Jan 2020 04:29:40 -0800 (PST)
Received: from debian (11.163.200.146.dyn.plus.net. [146.200.163.11])
 by smtp.gmail.com with ESMTPSA id c2sm4093210wrp.46.2020.01.08.04.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 04:29:39 -0800 (PST)
Date: Wed, 8 Jan 2020 12:29:38 +0000
From: Wei Liu <wl@xen.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20200108122938.7w7lpi6ykkpnn6ru@debian>
References: <20200108110148.18988-1-jgross@suse.com>
 <20200108121606.yr25b27mrnawu6um@debian>
 <61ec5633-05b7-fab3-ceac-e6c7649893e3@suse.com>
 <20200108122355.3js5sbis2yxxszqc@debian>
 <62c457b3-dd02-ad2b-4d17-f11739a27dc3@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62c457b3-dd02-ad2b-4d17-f11739a27dc3@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] xen/x86: clear per cpu stub page
 information in cpu_smpboot_free()
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMDgsIDIwMjAgYXQgMDE6MjY6NDlQTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAwOC4wMS4yMCAxMzoyMywgV2VpIExpdSB3cm90ZToKPiA+IE9uIFdlZCwgSmFu
IDA4LCAyMDIwIGF0IDAxOjE4OjQ2UE0gKzAxMDAsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4gPiA+
IE9uIDA4LjAxLjIwIDEzOjE2LCBXZWkgTGl1IHdyb3RlOgo+ID4gPiA+IE9uIFdlZCwgSmFuIDA4
LCAyMDIwIGF0IDEyOjAxOjQ4UE0gKzAxMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gPiA+ID4g
PiBjcHVfc21wYm9vdF9mcmVlKCkgcmVtb3ZlcyB0aGUgc3R1YnMgZm9yIHRoZSBjcHUgZ29pbmcg
b2ZmbGluZSwgYnV0IGl0Cj4gPiA+ID4gPiBpc24ndCBjbGVhcmluZyB0aGUgcmVsYXRlZCBwZXJj
cHUgdmFyaWFibGVzLiBUaGlzIHdpbGwgcmVzdWx0IGluCj4gPiA+ID4gPiBjcmFzaGVzIHdoZW4g
YSBzdHViIHBhZ2UgaXMgcmVsZWFzZWQgZHVlIHRvIGFsbCByZWxhdGVkIGNwdXMgZ29uZQo+ID4g
PiA+ID4gb2ZmbGluZSBhbmQgb25lIG9mIHRob3NlIGNwdXMgZ29pbmcgb25saW5lIGxhdGVyLgo+
ID4gPiA+ID4gCj4gPiA+ID4gPiBGaXggdGhhdCBieSBjbGVhcmluZyBzdHVicy5hZGRyIGFuZCBz
dHVicy5tZm4gaW4gb3JkZXIgdG8gYWxsb2NhdGUgYQo+ID4gPiA+ID4gbmV3IHN0dWIgcGFnZSB3
aGVuIG5lZWRlZC4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgICB4ZW4vYXJj
aC94ODYvc21wYm9vdC5jIHwgMiArKwo+ID4gPiA+ID4gICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQo+ID4gPiA+ID4gCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L3NtcGJvb3QuYyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKPiA+ID4gPiA+IGluZGV4IDdlMjk3
MDQwODAuLjQ2YzA3MjkyMTQgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS94ZW4vYXJjaC94ODYvc21w
Ym9vdC5jCj4gPiA+ID4gPiArKysgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5jCj4gPiA+ID4gPiBA
QCAtOTQ1LDYgKzk0NSw4IEBAIHN0YXRpYyB2b2lkIGNwdV9zbXBib290X2ZyZWUodW5zaWduZWQg
aW50IGNwdSwgYm9vbCByZW1vdmUpCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIChwZXJfY3B1KHN0dWJzLmFkZHIsIGNwdSkgfCB+UEFHRV9NQVNLKSArIDEpOwo+ID4g
PiA+ID4gICAgICAgICAgICBpZiAoIGkgPT0gU1RVQlNfUEVSX1BBR0UgKQo+ID4gPiA+ID4gICAg
ICAgICAgICAgICAgZnJlZV9kb21oZWFwX3BhZ2UobWZuX3RvX3BhZ2UobWZuKSk7Cj4gPiA+ID4g
PiArICAgICAgICBwZXJfY3B1KHN0dWJzLmFkZHIsIGNwdSkgPSAwOwo+ID4gPiA+ID4gKyAgICAg
ICAgcGVyX2NwdShzdHVicy5tZm4sIGNwdSkgPSAwOwo+ID4gPiA+IAo+ID4gPiA+IFNob3VsZG4n
dCB0aGUgbWZuIGJlIHNldCB0byBJTlZBTElEX01GTiBpbnN0ZWFkPwo+ID4gPiAKPiA+ID4gVGhp
cyB3b3VsZCByZXF1aXJlIG1vZGlmeWluZyBhbGxvY19zdHViX3BhZ2UoKToKPiA+ID4gCj4gPiA+
ICAgICAgaWYgKCAqbWZuICkKPiA+ID4gICAgICAgICAgcGcgPSBtZm5fdG9fcGFnZShfbWZuKCpt
Zm4pKTsKPiA+ID4gICAgICBlbHNlCj4gPiAKPiA+IE9LLiBJIHRoaW5rIHRoZSBjaGFuY2Ugb2Yg
YWxsb2NhdGluZyBtZm4gMCBmcm9tIHRoZSBhbGxvY2F0b3IgaXMKPiA+IGV4Y2VlZGluZ2x5IGxv
dywgc28gSSBjZXJ0YWlubHkgaGF2ZSBubyBvYmplY3Rpb24gdG8gcmVzZXQgaXQgdG8gMC4KPiAK
PiBUaGUgY2hhbmNlIHNob3VsZCBiZSBleGFjdGx5IHplcm8uIE90aGVyd2lzZSB3ZSdkIGhhdmUg
YSBiaWcgcHJvYmxlbQo+IGR1ZSB0byBMMVRGLi4uCgpIZWguLi4KClJldmlld2VkLWJ5OiBXZWkg
TGl1IDx3bEB4ZW4ub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
