Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E80D311042A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 19:23:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icCmo-0003ew-17; Tue, 03 Dec 2019 18:20:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zB0y=ZZ=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1icCmm-0003er-GD
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 18:20:32 +0000
X-Inumbo-ID: 96a74d9c-15f9-11ea-81e8-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 96a74d9c-15f9-11ea-81e8-12813bfff9fa;
 Tue, 03 Dec 2019 18:20:30 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1575397232; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=aQVh+5qX2IvIGp5IqQpyOgOaEntIOFcSMldWg/1t9Bw=;
 b=q4k1EoEgI810macsXihL+60/gvVuPFYHuNPlgbuKQYUjDvVcHHzyfBhaRhSqUO+oh/BzS1nq
 7WYC2LazjLT6BmS4PUkz8ERQWGouxQvJHbR4nnyZ7s2Ywn7gkXgD0HQuIsNUHhVqYrVXCfXh
 RMuE6C3k1Nttaw4hVx29Wls3hbA=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mxa.mailgun.org with ESMTP id 5de6a50a.7faefc0adaf0-smtp-out-n01;
 Tue, 03 Dec 2019 18:10:18 -0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id c14so4885508wrn.7
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2019 10:10:17 -0800 (PST)
X-Gm-Message-State: APjAAAWbz0s5wo+LcqPGwRiAqxguQs4hrBZGX+fxnUK79PmQ6c6cHRy+
 Dt0Y+i5xka2RkfCDcluKA0j8XA3ou8gJpZZOkPI=
X-Google-Smtp-Source: APXvYqysohm7Ks9BDX72/sf7flbVEUAAqcxyen+UbxTiOycjVZ9EfD72AeXoBsrviF6vne7sSC/PmL7MCb5zhTx091s=
X-Received: by 2002:a5d:6802:: with SMTP id w2mr6498852wru.353.1575396616375; 
 Tue, 03 Dec 2019 10:10:16 -0800 (PST)
MIME-Version: 1.0
References: <20191203171030.11680-1-andrew.cooper3@citrix.com>
 <CABfawhmfefUGEaL4vNd8AG=_H4vBZROv9SywuZORDrFBoDCcgg@mail.gmail.com>
In-Reply-To: <CABfawhmfefUGEaL4vNd8AG=_H4vBZROv9SywuZORDrFBoDCcgg@mail.gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 3 Dec 2019 13:09:40 -0500
X-Gmail-Original-Message-ID: <CABfawh=TP7oB5VLadnD1iC=k9sX1s1zJJQKxHR=HopzvNZns+g@mail.gmail.com>
Message-ID: <CABfawh=TP7oB5VLadnD1iC=k9sX1s1zJJQKxHR=HopzvNZns+g@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/debug: Plumb pending_dbg through the
 monitor and devicemodel interfaces
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMywgMjAxOSBhdCAxOjA1IFBNIFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGts
ZW5neWVsLmNvbT4gd3JvdGU6Cj4KPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMv
dm1fZXZlbnQuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy92bV9ldmVudC5oCj4gPiBpbmRleCA5NTkw
ODNkOGM0Li43NjY3NmZmNGMwIDEwMDY0NAo+ID4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL3Zt
X2V2ZW50LmgKPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy92bV9ldmVudC5oCj4gPiBAQCAt
MjgxLDYgKzI4MSw3IEBAIHN0cnVjdCB2bV9ldmVudF9kZWJ1ZyB7Cj4gPiAgICAgIHVpbnQzMl90
IGluc25fbGVuZ3RoOwo+ID4gICAgICB1aW50OF90IHR5cGU7ICAgICAgICAvKiBIVk1PUF9UUkFQ
XyogKi8KPiA+ICAgICAgdWludDhfdCBfcGFkWzNdOwo+ID4gKyAgICB1aW50NjRfdCBwZW5kaW5n
X2RiZzsKPgo+IFRoaXMgaXMganVzdCBhIG5pdHBpY2sgYnV0IEkgd291bGQgcHJlZmVyIGlmIHdl
IGhhZCB0aGUgX3BhZCBmaWVsZCBhcwo+IHRoZSBsYXN0IGVsZW1lbnQgaW4gdGhlIHN0cnVjdCBh
bmQga2VlcCBhbGwgNjQtYml0IG1lbWJlcnMgdXAgaW4gdGhlCj4gZnJvbnQuCgpBbHNvLCBzaW5j
ZSBwZW5kaW5nX2RiZyB1c2VzIHVuc2lnbmVkIGludCBpbiBYZW4sIGRvIHdlIG5lZWQgdWludDY0
X3QKZm9yIGl0IGhlcmU/IFNlZW1zIHRvIG1lIGEgdWludDMyX3Qgd291bGQgc3VmZmljZS4KClRh
bWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
