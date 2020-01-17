Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD474140EAD
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 17:08:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isU8I-0004eY-Jn; Fri, 17 Jan 2020 16:06:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KK5S=3G=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1isU8H-0004eR-0e
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 16:06:01 +0000
X-Inumbo-ID: 4087804a-3943-11ea-9fd7-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4087804a-3943-11ea-9fd7-bc764e2007e4;
 Fri, 17 Jan 2020 16:06:00 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id h23so26988400ljc.8
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jan 2020 08:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9Y4Rkp9oKyxsX3igm/LENpmSTyKk6EaA5o2vtJgyYJI=;
 b=hf49EtqrnfPB8ILKvthmkl4uSg0aWUnbqHuUlyJL6ucysdg5IZPsOj1sLB3Fb1htgL
 o9RPAAFnI/wnISjOMJe4hWHjZW4UnQIX5tiDvleBpTAGtGhLxHGC2nlldaIfpts8TvHA
 EZZVFhe7sRxQ3j3g/I5Nfp0ISthaL1BF2fjs5tKVLpevLaaBbLzAb45FViVA2qBdqKj7
 ZHveULbiCuMqfbIGYXsF2gJPoA2L1tIeNYb1uwJuAkZ8lrK9oyvaQPGvpyJzgOq8F3ch
 Ppp/7NRIn+LryEMEhs8QXwy0743K9COnCbhM1PuRwjbIok1zVm185PvMaK3UzMTJ6Dh+
 fb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9Y4Rkp9oKyxsX3igm/LENpmSTyKk6EaA5o2vtJgyYJI=;
 b=Nwn+PwHw8D35NJBv8D994phmU1YB4yIoN812QW05afyIY+B1K0gTZnaXyZwc1VL20I
 CszbArt638s01+bMgbTGwEoyl/AAeUZTuCCFFCo5Kqhluuh1V888dOV812DvDDWFnDi6
 +zk+nfg5OK/VkFdQE0IfG1xiEzBzXR0n17AcocxCE+tjNopQuiSS2JsqZ6s3Kl1ftJg/
 ZJTSg0kc8KnwWwOpvfz+KsXo8rtzv+T4vPUTY9iYlugSo8+5jQYYRKzGjeOk6DOItawQ
 dXa7RBjzs52cLHTvqs5kclbrJQdGuCxrkvKG6anSPkfSob0n2v5qf8c4EWpjdLOA+gTr
 jRag==
X-Gm-Message-State: APjAAAWp8/xrg3Dt6sO+BoN+FJXeQhC1gjUxMuDQ8JjywJJhcN2/2Vn3
 I9SP6SeLdZ24sCHT8hL/DHIvKGbkNTJRItN/wlA=
X-Google-Smtp-Source: APXvYqx7OQfoGOygHHvI7Tn7vn+DxAbusJs/30pK//wo4u8T7szB263WJMLSj0G8x36YXA8cqdCpjx+sK/wZ57xGRJM=
X-Received: by 2002:a2e:9b12:: with SMTP id u18mr6266230lji.274.1579277159214; 
 Fri, 17 Jan 2020 08:05:59 -0800 (PST)
MIME-Version: 1.0
References: <20200117110811.43321-1-roger.pau@citrix.com>
In-Reply-To: <20200117110811.43321-1-roger.pau@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 17 Jan 2020 11:05:48 -0500
Message-ID: <CAKf6xpsGhh8hKeaSO_=sRknc=AHnS6bK9dHje3iwter3UsHowA@mail.gmail.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2] x86/hvmloader: round up memory BAR size
 to 4K
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMTcsIDIwMjAgYXQgNjowOCBBTSBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToKPgo+IFdoZW4gcGxhY2luZyBtZW1vcnkgQkFScyB3aXRoIHNp
emVzIHNtYWxsZXIgdGhhbiA0SyBtdWx0aXBsZSBtZW1vcnkKPiBCQVJzIGNhbiBlbmQgdXAgbWFw
cGVkIHRvIHRoZSBzYW1lIGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3MsIGFuZCB0aHVzCj4gd29uJ3Qg
d29yayBjb3JyZWN0bHkuCj4KPiBSb3VuZCB1cCBhbGwgbWVtb3J5IEJBUiBzaXplcyB0byBiZSBh
dCBsZWFzdCA0Sywgc28gdGhhdCB0aGV5IGFyZQo+IG5hdHVyYWxseSBhbGlnbmVkIHRvIGEgcGFn
ZSBzaXplIGFuZCB0aHVzIGRvbid0IGVuZCB1cCBzaGFyaW5nIGEgcGFnZS4KPiBBbHNvIGFkZCBh
IGNvdXBsZSBvZiBhc3NlcnRzIHRvIHRoZSBjdXJyZW50IGNvZGUgdG8gbWFrZSBzdXJlIHRoZSBN
TUlPCj4gaG9sZSBpcyBwcm9wZXJseSBzaXplZCBhbmQgYWxpZ25lZC4KPgo+IE5vdGUgdGhhdCB0
aGUgZ3Vlc3QgY2FuIHN0aWxsIG1vdmUgdGhlIEJBUnMgYXJvdW5kIGFuZCBjcmVhdGUgdGhpcwo+
IGNvbGxpc2lvbnMsIGFuZCB0aGF0IEJBUnMgbm90IGZpbGxpbmcgdXAgYSBwaHlzaWNhbCBwYWdl
IG1pZ2h0IGxlYWsKPiBhY2Nlc3MgdG8gb3RoZXIgTU1JTyByZWdpb25zIHBsYWNlZCBpbiB0aGUg
c2FtZSBob3N0IHBoeXNpY2FsIHBhZ2UuCj4KPiBUaGlzIGlzIGhvd2V2ZXIgbm8gd29yc2UgdGhh
biB3aGF0J3MgY3VycmVudGx5IGRvbmUsIGFuZCBoZW5jZSBzaG91bGQKPiBiZSBjb25zaWRlcmVk
IGFuIGltcHJvdmVtZW50IG92ZXIgdGhlIGN1cnJlbnQgc3RhdGUuCj4KPiBSZXBvcnRlZC1ieTog
SmFzb24gQW5kcnl1ayA8amFuZHJ5dWtAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IC0tLQo+IENjOiBKYXNvbiBBbmRy
eXVrIDxqYW5kcnl1a0BnbWFpbC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAgLSBE
byB0aGUgcm91bmQgdXAgd2hlbiBzaXppbmcgdGhlIEJBUnMsIHNvIHRoYXQgdGhlIE1NSU8gaG9s
ZSBpcwo+ICAgIGNvcnJlY3RseSBzaXplZC4KPiAgLSBBZGQgc29tZSBhc3NlcnRzIHRoYXQgdGhl
IGhvbGUgaXMgcHJvcGVybHkgc2l6ZWQgYW5kIHNpemUtYWxpZ25lZC4KPiAgLSBEcm9wcGVkIEph
c29uIFRlc3RlZC1ieSBzaW5jZSB0aGUgY29kZSBoYXMgY2hhbmdlZC4KPiAtLS0KPiBKYXNvbiwg
Y2FuIHlvdSBnaXZlIHRoaXMgYSBzcGluPyBUaGFua3MuCgpUZXN0ZWQtYnk6IEphc29uIEFuZHJ5
dWsgPGphbmRyeXVrQGdtYWlsLmNvbT4KClRoYW5rcyEKCi1KYXNvbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
