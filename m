Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3CD2BC6C
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 02:07:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVPaP-0005eM-LB; Tue, 28 May 2019 00:03:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ktOE=T4=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hVPaO-0005eH-5Y
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 00:03:24 +0000
X-Inumbo-ID: 02003155-80dc-11e9-8980-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 02003155-80dc-11e9-8980-bc764e045a96;
 Tue, 28 May 2019 00:03:22 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1559001802; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=tqAHRet97g2TiZ31+IBGLOCnSNc4tzGEErgtDkWQuic=;
 b=CyvjdtZKHAZ+m6nX2fC+Eg9W0eb+pN+Hgo2q7e6gk9lPsZ2URGWxX4yjkkvEjKEWrw84JA1T
 9unNM9E3owfMYNP0neACEwPGT+LtkBp9NAsDvUFkkKPePZiz/DxwwuuZXsjY3OXlBqIROJ1o
 ExuWrrNhOgtgR2PXI3ovG6V1aS4=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mxa.mailgun.org with ESMTP id 5cec7ac9.7f9f81d42230-smtp-out-n02;
 Tue, 28 May 2019 00:03:21 -0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id h1so4104467wro.4
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2019 17:03:21 -0700 (PDT)
X-Gm-Message-State: APjAAAVqMnxlX0vM1uZdVUnKkVLuTkAKmdmtxF0tlZ8Kd9CPUTzT3mzM
 gGA68PGws1unU9Xdv0qiD0Ok9nvAMAFezYkjov0=
X-Google-Smtp-Source: APXvYqy5pFgrtF0YKalDS18PUgAWxXq0atPEllo+y/3u06e0d3TvVKxx9Byc3UCDufBU1t58OfF1ceBM/hgZg1HQpn4=
X-Received: by 2002:adf:81c8:: with SMTP id 66mr1729328wra.261.1559001799942; 
 Mon, 27 May 2019 17:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190412200813.25447-1-tamas@tklengyel.com>
 <46d12d38-cc34-0a2a-7d08-42b9256d5b05@citrix.com>
In-Reply-To: <46d12d38-cc34-0a2a-7d08-42b9256d5b05@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 27 May 2019 18:02:43 -0600
X-Gmail-Original-Message-ID: <CABfawhmWLivZv6Jz=Shj23t738Qi7G4XRoMfDeJYKqhjWAKrKw@mail.gmail.com>
Message-ID: <CABfawhmWLivZv6Jz=Shj23t738Qi7G4XRoMfDeJYKqhjWAKrKw@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2] x86/altp2m: cleanup p2m_altp2m_lazy_copy
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
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgOTo1NSBBTSBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gNC8xMi8xOSA5OjA4IFBNLCBUYW1hcyBLIExl
bmd5ZWwgd3JvdGU6Cj4gPiBUaGUgcDJtX2FsdHAybV9sYXp5X2NvcHkgaXMgcmVzcG9uc2libGUg
Zm9yIGxhemlseSBwb3B1bGF0aW5nIGFuIGFsdHAybSB2aWV3Cj4gPiB3aGVuIHRoZSBndWVzdCB0
cmFwcyBvdXQgZHVlIHRvIG5vIEVQVCBlbnRyeSBiZWluZyBwcmVzZW50IGluIHRoZSBhY3RpdmUg
dmlldy4KPiA+IEN1cnJlbnRseSB0aGUgZnVuY3Rpb24gdG9vayBzZXZlcmFsIGlucHV0cyB0aGF0
IGl0IGRpZG4ndCB1c2UgYW5kIGFsc28KPiA+IGxvY2tlZC91bmxvY2tlZCBnZm5zIHdoZW4gaXQg
ZGlkbid0IG5lZWQgdG8uCj4KPiBXb3csIHRoZSBjb2RlIHlvdSdyZSBjbGVhbmluZyB1cCB3YXMg
cmVhbGx5IGFsbCBvdmVyIHRoZSBwbGFjZS4gIFRoYW5rcwo+IGZvciB0aGlzLgo+Cj4gVGhlIGNv
ZGUgaW4geW91ciBwYXRjaCBsb29rcyBjb3JyZWN0OyBidXQgd2hpbGUgeW91J3ZlIGdvdHRlbiBy
aWQgb2YgdGhlCj4gcmVkdW5kYW50IGhvc3QgcDJtIGxvb2t1cCwgdGhlcmUncyBzdGlsbCBhIHJl
ZHVuZGFudCBhbHRwMm0gbG9va3VwLiAgSXMKPiB0aGVyZSBhbnkgcmVhc29uIG5vdCB0byB0YWtl
IGl0IHRvIGl0cyBsb2dpY2FsIGNvbmNsdXNpb24sIGxpa2UgdGhlCj4gYXR0YWNoZWQgcGF0Y2g/
CgpMb29rcyBnb29kIHRvIG1lLgoKPgo+IE5CIHRoaXMgaXMgY29tcGlsZS10ZXN0ZWQgb25seTsg
ZGVmaW5pdGVseSBkb3VibGUtY2hlY2sgaXQgZm9yIGxvZ2ljIGVycm9ycy4KCkkgZGlkIGEgbGl2
ZSB0ZXN0IGFuZCBldmVyeXRoaW5nIHdvcmtzIGZpbmUuCgpUaGFua3MsClRhbWFzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
