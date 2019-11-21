Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DC31055AF
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 16:34:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXoQl-0004lG-Pf; Thu, 21 Nov 2019 15:31:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tdvM=ZN=gmail.com=2rushikeshj@srs-us1.protection.inumbo.net>)
 id 1iXoQk-0004lB-DH
 for xen-devel@lists.xen.org; Thu, 21 Nov 2019 15:31:38 +0000
X-Inumbo-ID: 018c4c14-0c74-11ea-9631-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 018c4c14-0c74-11ea-9631-bc764e2007e4;
 Thu, 21 Nov 2019 15:31:37 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id p59so3151735edp.7
 for <xen-devel@lists.xen.org>; Thu, 21 Nov 2019 07:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=K3xn9E+iqVPEPZRhKmLjcpHswlvBhMQCaFmXi925NDc=;
 b=MnkPwsaFgI6fK9SWlY1gb9rocXhyR8RP+m0HDn22tmEe03WlLwJ4kBuwZOaI9pnFT8
 KkdDZ2yWbk+kPVCTBkDQEfhfj40NzNK1svkXCuoGYsDNzLUZJtu4j9YevlAX54Ll8v73
 QIwfnIqqcK8d6p3uHSkmenmAyFbkYPvYioRmTNxzI5O4oH3B4yog5s83ZOdJNxJvV5j2
 HuwEjOZfmkZtxpZntdz3z9DpK+f+wuTsZX+BBAc2oBipJdQr3DrdGGPbetATtYTefBuB
 V4UwpiXdUsFNB4g3okl2OUhWyEX5rwyL5Z4pDW/6P4ikPSGrIMp0AQ0P3rgl7tDm9wYw
 bdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K3xn9E+iqVPEPZRhKmLjcpHswlvBhMQCaFmXi925NDc=;
 b=PFP4JWVfgpMpDrgqpT82oUKxbwfRnmiQVZXVdgLjm98lwWgU65EofIkAp+UwwlgSVB
 teS3qVi3xHgae+1PfPHB0t64TCcbBdXt+spwDP4eUb8GoH6g0eIiHlhwch+DuBqWemKj
 pFyw9GkzHR50oPN7jhlWJ/77DY9HO11zyQHArVHrjN9a11GnwaxzuDnwgccwiBm0fQFW
 oU70fax2bl4xx7IJFUYdLGKpbpvRB0TzI8J+Yb03h0Jy+qWAB68DrpMHTIHxPKm/jM/u
 1wyG3RzNocQercIR76C+oRWihlcEM08LR+0YeptpyEwS9jAqUP33yzanNLhZ29t4Cpme
 oK8w==
X-Gm-Message-State: APjAAAWF8fQgBxkD100LBUabo6Fwbup/qNV9N7VIA7nyc8uc+kqxbwoc
 dPfw+akPkqdJRmSRK9Srg4CkZPwP0d40m7hSv7s=
X-Google-Smtp-Source: APXvYqxJTvg5e2mGf5844WgMfWIXJPtoSghGe9iiaHR2ci2DCO3e0ivby01e4zt4QZecKUw85nqTMrQaTQcxzdpe4SU=
X-Received: by 2002:a17:906:fac7:: with SMTP id
 lu7mr14836004ejb.5.1574350296616; 
 Thu, 21 Nov 2019 07:31:36 -0800 (PST)
MIME-Version: 1.0
References: <CAO9XypWibNu0iDnJsZXkQ+=Ecd6eThnu+td4O3VVLMe+qJ80eQ@mail.gmail.com>
 <76a91fb3-d2b0-dd23-7e99-0015fbee5990@suse.com>
 <CAO9XypVpBAPk8Hakqt7jJ08pCUhR_GzNxDWh2D-CGfp0+tfaAA@mail.gmail.com>
 <3b8d187e-c4d5-a7a5-76c2-874db47440ee@suse.com>
 <CAO9XypVNhSd8hPu1nA1uP8PVCPVgW-Bs_q6gmPky6Px0-U6G+w@mail.gmail.com>
 <04b95cfb-afa0-b6ba-2e69-74b56edbf4c4@suse.com>
 <CAO9XypVS1vfZu+ZJ_dK9VRTEhMR7y8viceAmOufCpvDLt-sXHw@mail.gmail.com>
 <0276e934-4a59-386f-87ee-2b801fd26dae@suse.com>
In-Reply-To: <0276e934-4a59-386f-87ee-2b801fd26dae@suse.com>
From: Rishi <2rushikeshj@gmail.com>
Date: Thu, 21 Nov 2019 21:01:25 +0530
Message-ID: <CAO9XypWH8qYH34Hb=2BV6X+HELK=7HWfGujJx+Wq0G8Jtn=Bew@mail.gmail.com>
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [Xen-devel] Xen hiding thermal capabilities from Dom0
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
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgNzo1NCBQTSBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMjEuMTEuMTkgMTQ6MzksIFJpc2hpIHdyb3RlOgo+ID4gT24g
VHVlLCBOb3YgMTksIDIwMTkgYXQgMjo0NyBQTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMTkuMTEuMjAxOSAwNjoyMywgUmlzaGkgd3JvdGU6Cj4g
Pj4+IG9rLCB0aGFua3MgZm9yIGNsZWFyaW5nIGl0IHVwLiBXb3VsZCBhIHBhdGNoIGJlIGFjY2Vw
dGVkIGlmIHRoaXMKPiA+Pj4gb3B0aW9uIG9mIHNob3dpbmcgRUFYIGxlYWYgaXMgc2VsZWN0aXZl
bHkgZG9uZSB0aHJvdWdoIGNvbW1hbmQgbGluZQo+ID4+PiAoZGVmYXVsdCBkaXNhYmxlZCk/Cj4g
Pj4KPiA+PiBJbiBnZW5lcmFsIEknZCBleHBlY3QgdGhpcyB0byBiZSByYXRoZXIgdW5saWtlbHks
IGJ1dCBJIGd1ZXNzIG11Y2gKPiA+PiB3b3VsZCBkZXBlbmQgb24gdGhlIGFjdHVhbCByZWFzb25p
bmcgZG9uZSBpbiB0aGUgZGVzY3JpcHRpb24uCj4gPj4KPiA+Pj4gT24gbG9uZ2VyIHJ1biwgd2hh
dCBpcyBhbiBleHBlY3RlZCBzYW5lIG1vZGVsIG9mIHZpcnR1YWxpemluZyB0aGlzPwo+ID4+PiBX
aXRoIHNvbWUgZ3VpZGFuY2UsIG1heSBiZSBJIG9yIHNvbWVvbmUgZWxzZSBjYW4gY29kZSB0byBi
cmluZyB0aGUKPiA+Pj4gZnVuY3Rpb25hbGl0eSBiYWNrLgo+ID4+Cj4gPj4gV2hpY2ggZnVuY3Rp
b25hbGl0eT8gU28gZmFyIHlvdSd2ZSB0YWxrZWQgb2Ygb25seSBDUFVJRCBiaXRzIEkKPiA+PiB0
aGluaywgd2l0aG91dCBleHBsYWluaW5nIGF0IGFsbCB3aGF0IGZ1bmN0aW9uYWxpdHkgeW91IHdh
bnQgdG8KPiA+PiBoYXZlIHRoYXQgZGVwZW5kcyBvbiB0aGVzZS4gSW4gZ2VuZXJhbCwgYXMgc2Fp
ZCBlYXJsaWVyLCBDUFUKPiA+PiBtYW5hZ2VtZW50IGlzIHRoZSBoeXBlcnZpc29yJ3MgcmVzcG9u
c2liaWxpdHksIHNvIEknZCByYXRoZXIKPiA+PiBub3Qgc2VlIHRoaXMgdmlydHVhbGl6ZWQsIGJ1
dCB0aGUgaHlwZXJ2aXNvciBiZSBwdXQgaW50byBhCj4gPj4gcG9zaXRpb24gb2YgZG9pbmcgd2hh
dGV2ZXIgaXMgbmVlZGVkLgo+ID4+Cj4gPj4gSmFuCj4gPgo+ID4gVGhlIHJlYXNvbmluZyB0byBo
YXZlIEVBWCgweDA2aCkgZXhwb3NlZCB0byBEb20wIGlzIGZvciBUaGVybWFsIGFuZAo+ID4gUG93
ZXIgbWFuYWdlbWVudC4KPiA+IFdpdGhvdXQgRUFYKDB4MDZoKSBEb20wIGlzIHVuYWJsZSB0byBz
ZW5zZSBwcmVzZW5jZSBvZiBDUFUgY29yZQo+ID4gdGVtcGVyYXR1cmUgb3IgZG8gVGhlcm1hbCBt
YW5hZ2VtZW50IC0gaW5jbHVkaW5nIGJ1dCBub3QgbGltaXRlZCB0bwo+ID4gb3BlcmF0aW5nIEZh
biBzcGVlZC4KPiA+IERvbTAgaGFzIHRvIHJlbHkgb24gb3RoZXIgcG9zc2libGUgd2F5cyBzdWNo
IGFzIGlwbWkgb3IgQklPUyB3aGljaCBhcmUKPiA+IG9wdGlvbmFsbHkgYXZhaWxhYmxlLgo+Cj4g
WW91IGFyZSBhd2FyZSB0aGF0IGRvbTAgY2FuJ3QgZWFzaWx5IGNvbnRyb2wgb24gd2hpY2ggX3Bo
eXNpY2FsXyBjcHUgaXQKPiBpcyBqdXN0IHJ1bm5pbmc/IFNvIGl0IGNvdWxkIGVhc2lseSBiZSB0
aGF0IHlvdSBhcmUgc2FtcGxpbmcgbGV0cyBzYXkKPiAzIE1TUnMgaW4gYSBmdW5jdGlvbiwgYnV0
IHlvdSBhcmUgYWNjZXNzaW5nIGRpZmZlcmVudCBjcHVzIGVhY2ggdGltZSBkdWUKPiB0byB0aGUg
aHlwZXJ2aXNvciByZS1zY2hlZHVsaW5nIHRoZSB2Y3B1IGluIGJldHdlZW4uCj4KPiBBbmQgaW4g
Y2FzZSB5b3Ugd2FudCB0byBhZGp1c3Qgc2V0dGluZ3MgeW91IGNhbiBoaXQgYW5vdGhlciBjcHUg
YWdhaW4uCj4KPiBTbzogbm8sIGp1c3QgZ2l2aW5nIGRvbTAgYWNjZXNzIHRvIHRoZSBtYW5hZ2Vt
ZW50IGhhcmR3YXJlIGlzbid0IGdvaW5nCj4gdG8gZmx5LiBZb3UgbmVlZCB0byBoYXZlIGEgcHJv
cGVyIHZpcnR1YWxpemF0aW9uIGxheWVyIGZvciB0aGF0IHB1cnBvc2UuCj4KPgo+IEp1ZXJnZW4K
Ckkgbm93IHVuZGVyc3RhbmQgaXQsIHRoYW5rcy4KQXMgbWVudGlvbmVkIGluIG90aGVyIHJlcGx5
LCBJIHRoaW5rIGEgcHYgdmVyc2lvbiBvZiBjb3JldGVtcCBMaW51eApkcml2ZXIgbWF5IGJlIGEg
d2F5IHRvIGJyaW5nIGJhY2sgdGhlcm1hbCBpbmZvcm1hdGlvbiB2YWx1ZXMgZm9yIGEKZ2l2ZW4g
cENQVS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
