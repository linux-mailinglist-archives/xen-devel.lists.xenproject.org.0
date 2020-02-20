Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42297165933
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 09:30:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4hBG-0004Ej-S6; Thu, 20 Feb 2020 08:27:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iWzT=4I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4hBF-0004Ec-Ba
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 08:27:33 +0000
X-Inumbo-ID: d6eda2da-53ba-11ea-84e6-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6eda2da-53ba-11ea-84e6-12813bfff9fa;
 Thu, 20 Feb 2020 08:27:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0DB5CAC8F;
 Thu, 20 Feb 2020 08:27:32 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1576877960-12767-1-git-send-email-igor.druzhinin@citrix.com>
 <98c80514-a3cc-9e4f-d84c-3a12b08feaf2@suse.com>
 <6d3b8fed-538f-9c9b-d33e-3ccb94935bf0@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <86036433-0dd9-773c-3855-fb4b4697fc08@suse.com>
Date: Thu, 20 Feb 2020 09:27:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <6d3b8fed-538f-9c9b-d33e-3ccb94935bf0@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/vpt: update last_guest_time with
 cmpxchg and drop pl_time_lock
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
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com, wl@xen.org,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAyMCAxOTo1MiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMTkvMDIvMjAy
MCAwNzo0OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDIwLjEyLjIwMTkgMjI6MzksIElnb3Ig
RHJ1emhpbmluIHdyb3RlOgo+Pj4gQEAgLTM4LDI0ICszNywyMiBAQCB2b2lkIGh2bV9pbml0X2d1
ZXN0X3RpbWUoc3RydWN0IGRvbWFpbiAqZCkKPj4+ICB1aW50NjRfdCBodm1fZ2V0X2d1ZXN0X3Rp
bWVfZml4ZWQoY29uc3Qgc3RydWN0IHZjcHUgKnYsIHVpbnQ2NF90IGF0X3RzYykKPj4+ICB7Cj4+
PiAgICAgIHN0cnVjdCBwbF90aW1lICpwbCA9IHYtPmRvbWFpbi0+YXJjaC5odm0ucGxfdGltZTsK
Pj4+IC0gICAgdTY0IG5vdzsKPj4+ICsgICAgc190aW1lX3Qgb2xkLCBuZXcsIG5vdyA9IGdldF9z
X3RpbWVfZml4ZWQoYXRfdHNjKSArIHBsLT5zdGltZV9vZmZzZXQ7Cj4+PiAgCj4+PiAgICAgIC8q
IENhbGxlZCBmcm9tIGRldmljZSBtb2RlbHMgc2hhcmVkIHdpdGggUFYgZ3Vlc3RzLiBCZSBjYXJl
ZnVsLiAqLwo+Pj4gICAgICBBU1NFUlQoaXNfaHZtX3ZjcHUodikpOwo+Pj4gIAo+Pj4gLSAgICBz
cGluX2xvY2soJnBsLT5wbF90aW1lX2xvY2spOwo+Pj4gLSAgICBub3cgPSBnZXRfc190aW1lX2Zp
eGVkKGF0X3RzYykgKyBwbC0+c3RpbWVfb2Zmc2V0Owo+Pj4gLQo+Pj4gICAgICBpZiAoICFhdF90
c2MgKQo+Pj4gICAgICB7Cj4+PiAtICAgICAgICBpZiAoIChpbnQ2NF90KShub3cgLSBwbC0+bGFz
dF9ndWVzdF90aW1lKSA+IDAgKQo+Pj4gLSAgICAgICAgICAgIHBsLT5sYXN0X2d1ZXN0X3RpbWUg
PSBub3c7Cj4+PiAtICAgICAgICBlbHNlCj4+PiAtICAgICAgICAgICAgbm93ID0gKytwbC0+bGFz
dF9ndWVzdF90aW1lOwo+Pj4gKyAgICAgICAgZG8gewo+Pj4gKyAgICAgICAgICAgIG9sZCA9IHBs
LT5sYXN0X2d1ZXN0X3RpbWU7Cj4+PiArICAgICAgICAgICAgbmV3ID0gbm93ID4gcGwtPmxhc3Rf
Z3Vlc3RfdGltZSA/IG5vdyA6IG9sZCArIDE7Cj4+PiArICAgICAgICB9IHdoaWxlICggY21weGNo
ZygmcGwtPmxhc3RfZ3Vlc3RfdGltZSwgb2xkLCBuZXcpICE9IG9sZCApOwo+Pgo+PiBJIHdvbmRl
ciB3aGV0aGVyIHlvdSB3b3VsZG4ndCBiZXR0ZXIgcmUtaW52b2tlIGdldF9zX3RpbWUoKSBpbgo+
PiBjYXNlIHlvdSBuZWVkIHRvIHJldHJ5IGhlcmUuIFNlZSBob3cgdGhlIGZ1bmN0aW9uIHByZXZp
b3VzbHkKPj4gd2FzIGNhbGxlZCBvbmx5IGFmdGVyIHRoZSBsb2NrIHdhcyBhbHJlYWR5IGFjcXVp
cmVkLgo+IAo+IElmIHRoZXJlIGlzIGEgY29uY3VycmVudCB3cml0ZXIsIHdvdWxkbid0IGl0IGp1
c3QgdXBkYXRlIHBsLT5sYXN0X2d1ZXN0X3RpbWUKPiB3aXRoIHRoZSBuZXcgZ2V0X3NfdGltZSgp
IGFuZCB0aGVuIHdlIHN1YnNlcXVlbnRseSB3b3VsZCBqdXN0IHVzZSB0aGUgbmV3Cj4gdGltZSBv
biByZXRyeT8KClllcywgaXQgd291bGQsIGJ1dCB0aGUgbGF0ZW5jeSB1bnRpbCB0aGUgcmV0cnkg
YWN0dWFsbHkgb2NjdXJzCmlzIHVua25vd24gKGluIHBhcnRpY3VsYXIgaWYgWGVuIGl0c2VsZiBy
dW5zIHZpcnR1YWxpemVkKS4gSS5lLgppbiB0aGUgYXRfdHNjID09IDAgY2FzZSBJIHRoaW5rIHRo
ZSB2YWx1ZSB3b3VsZCBiZXR0ZXIgYmUKcmUtY2FsY3VsYXRlZCBvbiBldmVyeSBpdGVyYXRpb24u
CgpBbnRoZXIgdGhpbmcgSSBub3RpY2Ugb25seSBub3cgYXJlIHRoZSBtdWx0aXBsZSByZWFkcyBv
ZgpwbC0+bGFzdF9ndWVzdF90aW1lLiBXb3VsZG4ndCB5b3UgYmV0dGVyIGRvCgogICAgICAgIGRv
IHsKICAgICAgICAgICAgb2xkID0gQUNDRVNTX09OQ0UocGwtPmxhc3RfZ3Vlc3RfdGltZSk7CiAg
ICAgICAgICAgIG5ldyA9IG5vdyA+IG9sZCA/IG5vdyA6IG9sZCArIDE7CiAgICAgICAgfSB3aGls
ZSAoIGNtcHhjaGcoJnBsLT5sYXN0X2d1ZXN0X3RpbWUsIG9sZCwgbmV3KSAhPSBvbGQgKTsKCj8K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
