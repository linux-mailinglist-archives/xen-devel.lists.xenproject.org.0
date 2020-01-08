Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5126A13460A
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 16:23:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipD7c-0002xX-2P; Wed, 08 Jan 2020 15:19:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cnPU=25=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ipD7a-0002xQ-GR
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 15:19:46 +0000
X-Inumbo-ID: 4d20d4cb-322a-11ea-b827-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d20d4cb-322a-11ea-b827-12813bfff9fa;
 Wed, 08 Jan 2020 15:19:45 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1578496785; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=RQPxU4eWefsryI2ywgZKSoj7OC3+KkE+yL31svooWl0=;
 b=RZs8oXoYeMxbNvm0p54Juf8CBseBfe3dL0ROmKWJ/OUVjzOXnwgoYNfNv/BWU3WPY+Betq2t
 x7FSvj2zahzmcQokkS7QjUuVWZnSq4KXKHA7JdMx0dgUSigi4tnDj1tEWb1KAwSr8TCHzZ6R
 pRZzol0Zn1fnEaT6qsSdROM5buY=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mxa.mailgun.org with ESMTP id 5e15f30e.7faf1ab3d4b0-smtp-out-n02;
 Wed, 08 Jan 2020 15:19:42 -0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id f129so2911741wmf.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2020 07:19:42 -0800 (PST)
X-Gm-Message-State: APjAAAUXAVN1a3iPt0vM8k5ezLvQ43g8BLyOYIJFG26BXoUD/Qj0EZVy
 Zuu3ynYHQeGF6sBWDVaROUakeYlM4STkWePWFdg=
X-Google-Smtp-Source: APXvYqx22tOTXxHMje6LCGNvanU1GVDwEhbrep9kjHzVnker2qa4K7a33l6gehwa3Mn6fhdf90XKN9BHohOcO6bAE2g=
X-Received: by 2002:a1c:22c6:: with SMTP id i189mr4777638wmi.15.1578496780945; 
 Wed, 08 Jan 2020 07:19:40 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577721845.git.tamas.lengyel@intel.com>
 <168faa6e-359d-f576-63af-29680a2aea37@citrix.com>
In-Reply-To: <168faa6e-359d-f576-63af-29680a2aea37@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 8 Jan 2020 08:19:04 -0700
X-Gmail-Original-Message-ID: <CABfawh=QBWun=D1mmAFbH8v6V6LeemNACZTChNg61-5eJqdt_A@mail.gmail.com>
Message-ID: <CABfawh=QBWun=D1mmAFbH8v6V6LeemNACZTChNg61-5eJqdt_A@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v3 00/18] VM forking
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
Cc: Julien Grall <julien@xen.org>, Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gOCwgMjAyMCBhdCA3OjU4IEFNIEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5s
YXBAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAxMi8zMC8xOSA0OjExIFBNLCBUYW1hcyBLIExl
bmd5ZWwgd3JvdGU6Cj4gPiBUaGUgZm9sbG93aW5nIHNlcmllcyBpbXBsZW1lbnRzIFZNIGZvcmtp
bmcgZm9yIEludGVsIEhWTSBndWVzdHMgdG8gYWxsb3cgZm9yCj4gPiB0aGUgZmFzdCBjcmVhdGlv
biBvZiBpZGVudGljYWwgVk1zIHdpdGhvdXQgdGhlIGFzc29zY2lhdGVkIGhpZ2ggc3RhcnR1cCBj
b3N0cwo+ID4gb2YgYm9vdGluZyBvciByZXN0b3JpbmcgdGhlIFZNIGZyb20gYSBzYXZlZmlsZS4K
Pgo+IFRhbWFzLAo+Cj4gVGhpcyBkb2Vzbid0IHNlZW0gdG8gYXBwbHkgdG8gc3RhZ2luZy4gIENv
dWxkIHlvdSBnaXZlIG1lIGEgY29tbWl0IGhhc2gKPiB0byB3aGljaCBpdCBzaG91bGQgYXBwbHk/
CgpIaSBHZW9yZ2UsCmh1aCBpdCdzIHdlaXJkLiBJIHJlYmFzZWQgaXQgYmVmb3JlIEkgc2VudCBv
biBzdGFnaW5nIGJ1dCBzb21laG93IHRoZQpsYXRlc3QgY29tbWl0IGluIHN0YWdpbmcgaXQgc2Vl
bXMgd2FzIGEgY29tbWl0IGZyb20gQXByaWwgMjAxOSwgd2hpY2gKZG9lc24ndCBzZWVtIHJpZ2h0
LiBJZiB0aGlzIHdhcyBqdXN0IG9uIG9uZSBzeXN0ZW0gSSB3b3VsZCBzYXkgSSBqdXN0CmhhZCBh
IHN0YWxlIGJyYW5jaCBvbiB0aGF0IHN5c3RlbSBhbmQgZm9yZ290IHRvIHB1bGwgaXQgYmVmb3Jl
IHRoZQpyZWJhc2UgYnV0IGl0J3MgYWN0dWFsbHkgaGFwcGVuZWQgb24gYm90aCBteSB0ZXN0IHN5
c3RlbXMKaW5kZXBlbmRlbnRseS4gQWxzbywgd2l0aCBteSB2MiBicmFuY2ggb2YgdGhpcyBzZXJp
ZXMgd2FzIGJyYW5jaGVkCmZyb20gYSBtb3JlIHJlY2VudCB2ZXJzaW9uIG9mIHN0YWdpbmcuIEkg
cmVhbGx5IGRvbid0IGtub3cgd2hhdApoYXBwZW5lZC4uLiBJJ2xsIGJlIHNlbmRpbmcgdjQgc2hv
cnRseS4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
