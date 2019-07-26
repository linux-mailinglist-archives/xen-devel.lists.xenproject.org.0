Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F57E76AFF
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 16:04:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr0mX-0001WQ-MJ; Fri, 26 Jul 2019 14:01:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yHJP=VX=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hr0mV-0001WL-VR
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 14:01:12 +0000
X-Inumbo-ID: d242fd52-afad-11e9-8980-bc764e045a96
Received: from mail-io1-xd43.google.com (unknown [2607:f8b0:4864:20::d43])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d242fd52-afad-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 14:01:10 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id k8so105032186iot.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 07:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I+oefRftrQbPNxcOrvsH4iGyGjF10oDYrTk24nF8Wf0=;
 b=L/Yxjj8QtXI/P1kqHdJfyn5RpU81TKVh2k7cEkC2mFGRPJ/b2QlO6XPUdp7e5nAQNw
 lwTPr8RxJi5jPhXtwmHupwJrHz/4dmY5fMLaprveoHCsuz+LL2q8Dvv1EaJiwzQxnJLu
 rTmdDUxXfbCcF+ITpAqaIWzNRv18xoAfNYjZMKX0P9qqK8W1UI3+Fs3oI7um9pubmJfI
 xucncPmRW7s3mnJ3dmdpqIxRoG9bjCIPtUQ0cDuEfR7YYgFWt0l/tOe4BHEhkb4GVYbU
 g4hJwruX+eqjYaB6EcwxPqphllj5G9+XEkU8vy77qlhFWh+YENMVsRjsUEbETM1nOQ5m
 odPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I+oefRftrQbPNxcOrvsH4iGyGjF10oDYrTk24nF8Wf0=;
 b=rzjF3JljleT8zz2YUeHroyLUvle44g/zOKicHaUWodKCR148egGO7w1o3RnRQiKeuz
 DSBVsHiw1D73y8JeBCcwEseavcwszFOxc6+otjAtgplFSoXy4dy1LvrDoS+9iKeapyG/
 ztK6oNs1k9woSG9V8q1cM5C4h9ky+qHQ8nF8CViu/G6Krh1hpmhuvgI+2yi/4+pCO3MO
 EasLpuJ832YtqFWYMYapcrVSPp3iRa/HZvptwUNwMSV++VzqrOe51Tk7FFxIUJFqVmZ6
 fuwVVpWdhPnnYCdSpSE9V0pVe6BawlUwObkEpE7lTbA2KA1yqxvprwL/QRmGfXkmsE5A
 NhXA==
X-Gm-Message-State: APjAAAVl4p7wmv1+xysWQwa288Y96RZMIzq2UXR+j0dAQPs/2Ltx2gu9
 tgD/0v/VUhd6wCiEb7y/J1+eOEzwHgCS2IVWU+8=
X-Google-Smtp-Source: APXvYqwvQS3y6bRyqynH3zg0o7O2H0xwUDw5jxI2Ry88+h6kCOnVxUbal3vIkovWrqErK4Ouuf34teNBxHSqw0J6i3w=
X-Received: by 2002:a02:6a22:: with SMTP id l34mr99680495jac.126.1564149670041; 
 Fri, 26 Jul 2019 07:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190717193335.11991-1-tamas@tklengyel.com>
 <20190717193335.11991-6-tamas@tklengyel.com>
 <7d6e93e9-8037-e0ed-5c2b-e00a810bc7e4@suse.com>
 <CABfawhm35+gf=3J-OYo84nwymDAx2vCrgtyqSe2it4LAgpxYTw@mail.gmail.com>
 <95234c89-846c-1f65-7418-0c2187aa0067@suse.com>
 <CABfawhmDTQ6d+FDhY3PLydE1rshew-EnRBH-SjgV2DLCdbAgiw@mail.gmail.com>
 <9d59429f-c54e-9e3c-1b85-3b49ed98a6b7@suse.com>
In-Reply-To: <9d59429f-c54e-9e3c-1b85-3b49ed98a6b7@suse.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Fri, 26 Jul 2019 17:00:59 +0300
Message-ID: <CAOcoXZZgW4Ls-9bvMsJ4jHDm0L0sss9HooRdWDLK-RsHKXRpJA@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>, Lars Kurth <lars.kurth.xen@gmail.com>, 
 Artem Mygaiev <Artem_Mygaiev@epam.com>, Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [PATCH v6 5/5] x86/mem_sharing: style cleanup
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
 Tamas K Lengyel <tamas@tklengyel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLCBBbGwsCgpPbiBUaHUsIEp1bCAxOCwgMjAxOSBhdCA0OjM4IFBNIEphbiBCZXVsaWNo
IDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cgo+ID4+IEJ1dCB5b3UncmUgYWN0aXZlbHkgYnJl
YWtpbmcgWGVuIHN0eWxlIGhlcmUgKGFuZCBiZWxvdykuCj4gPgo+ID4gSSBkb24ndCBzZWUgYW55
IG1lbnRpb24gb2Ygc3R5bGUgcmVzdHJpY3Rpb25zIHJlZ2FyZGluZyB0aGlzIGluCj4gPiBDT0RJ
TkdfU1RZTEUuIElmIHRoZXJlIGlzLCBJIHdvdWxkIHByZWZlciBjaGFuZ2luZyB0aGF0IHNvIHdl
IGNhbgo+ID4gYXV0b21hdGUgc3R5bGUgY2hlY2tzIHdoaWNoIElNSE8gYXJlIHRoZSBiaWdnZXN0
IHdhc3RlIG9mIGV2ZXJ5b25lJ3MKPiA+IHRpbWUgdG8gZG8gbWFudWFsbHkuCj4KPiAuL0NPRElO
R19TVFlMRSBmYWlscyB0byBtZW50aW9uIG1hbnkgYXNwZWN0cyBvZiB3aGF0IHdlIGRvIGV2ZXJ5
d2hlcmUuCj4gQWxtb3N0IGFueSBhdHRlbXB0IG9mIHVwZGF0aW5nIGl0IGhhcyBmYWlsZWQgZm9y
IG1lIGluIHRoZSBwYXN0LCBvZnRlbgo+IGR1ZSB0byBlbnRpcmUgbGFjayBvZiByZXNwb25zZXMg
b24gcGF0Y2hlcyAoaW4gb3RoZXIgY2FzZXMgYWxzbyBiZWNhdXNlCj4gb2YgcGVvcGxlIGRpc2Fn
cmVlaW5nKS4gRGVzcGl0ZSB5b3UgYmVpbmcgdGhlIG1haW50YWluZXIgb2YgdGhlIGZpbGUgSQo+
IHN0cm9uZ2x5IHRoaW5rIHlvdSBzaG91bGRuJ3QgYWN0aXZlbHkgYnJlYWsgc3R5bGUgdGhhdCdz
IGluIGxpbmUgd2l0aAo+IGxhcmdlIHN3YXRoZXMgb2YgY29kZSBlbHNld2hlcmUuCgpUaGUgZXhh
bXBsZSBhYm92ZSBkZW1vbnN0cmF0ZXMgdGhlIGNvbW1vbiBzaXR1YXRpb24gYWJvdXQgWGVuIGNv
ZGUgc3R5bGUgcnVsZXMuCkFncmVlIHdpdGggeW91IHRoYXQgLi9DT0RJTkdfU1RZTEUgc2hvdWxk
IGJlIGltcHJvdmVkIGJ5IGFkZGluZyBleHBsaWNpdCBydWxlcy4KU28gYWxsIHRoZSBmb3JtYXR0
aW5nIGFzcGVjdHMgY2FuIGJlIGFkZHJlc3NlZCBleHBsaWNpdGx5LgpJTUhPIHRoZXJlIHNob3Vs
ZCBub3QgYmUgYW55IGltcGxpY2l0ICdub24td3JpdHRlbicgY29kZSBmb3JtYXR0aW5nIHJ1bGVz
LgpJbiBvdGhlciBjYXNlcywgaXQgd2lsbCBiZSByZWFsbHkgaGFyZCB0byBhdXRvbWF0ZSBjb2Rl
IGZvcm1hdHRpbmcgY2hlY2tzLgoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
