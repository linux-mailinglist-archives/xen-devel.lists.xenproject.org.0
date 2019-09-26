Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6548ABF3D0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 15:13:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDTX5-0005QP-Dg; Thu, 26 Sep 2019 13:10:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eR0+=XV=gmail.com=aford173@srs-us1.protection.inumbo.net>)
 id 1iDTX3-0005FP-Lx
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 13:10:05 +0000
X-Inumbo-ID: f47f0ab6-e05e-11e9-97fb-bc764e2007e4
Received: from mail-io1-xd41.google.com (unknown [2607:f8b0:4864:20::d41])
 by localhost (Halon) with ESMTPS
 id f47f0ab6-e05e-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 13:10:04 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id j4so6260136iog.11
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 06:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FZIPxOACSyBTtRH5A7Lgyz9YR30y4W13jpD2I+1mgJM=;
 b=M0MOZVUz4t6WU55SoJjNSOp7QYn65o/NCOkDutq5p4891fxVHa6jIYc0GzSPoE5NgC
 Y/F31CMUMd8X4Qdqfc4MGmYyhNuR+uHG233WadTHQa0xsWxFJv5rl8RVwaE3bu3pB7qr
 wri0795JXn4yi9BdL9A4kIX8Eq3Xd1Myt3BkKJ+99RFh8if3n6D0lMDd1/A4PUTHHLSY
 mi041pBhTLwJRt9cj7XQ/sDkCPZZAFKFgXm6Ri5VzL7A0Gk1JZg/oHQRycR2/sZb03c2
 lzEE4rwwCW+uRuqgQOz+nrJU3ZVzQbE+b9nB1IS53yKZV5lYYrQXdFhuW1+ZKBjhKOVA
 lysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FZIPxOACSyBTtRH5A7Lgyz9YR30y4W13jpD2I+1mgJM=;
 b=EAYYws9hk5pToF/wh/9jitLmydK7EoI440B3Kje7AR6deWYg9V+ZC081cye9P4lSaa
 IeaNDpb22QPm/lAo1yYzMnU4X1Hme+BDobbOEOV3qHvbEDQUbEE+96qztfEuqnXaNdhw
 J8FNdjJ0bNZ4BIaBJvwRSGgrt3diOYrdMxEaHBbD/8r29oWUUkqhjxS080YGH94xzGUL
 3+0mGBR5kvQG6mdqmcSextWdJ3HpSv1VCOBsXS/vFjVlzALCQcO4WBKoSp5KxjxIRoxm
 gAefLsPR6Iaiw3upOa6cjZiMM92K3QzjR8AFgegZFbF3xqeqG+FUZH/LBkDLt4cKJn24
 hcOw==
X-Gm-Message-State: APjAAAUlMRf4X+K3g/dHBV4omiSViUeNIVPk3Vsrnqj74k99gZjqeCQi
 IbRerTPAGv3wSRfgwc2k0Axu90lTFes1S3MqUZs=
X-Google-Smtp-Source: APXvYqzlyCi4JSGY6XghEeQ/E8vAIH7ViuIHrzxvUyMsua1GZWLVjXjlSiGwrvjIiebbaCWFI8rRhtB8cjRotnhYNKg=
X-Received: by 2002:a6b:d601:: with SMTP id w1mr3118098ioa.158.1569503404009; 
 Thu, 26 Sep 2019 06:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
 <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
 <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
 <CAOMZO5D2uzR6Sz1QnX3G-Ce_juxU-0PO_vBZX+nR1mpQB8s8-w@mail.gmail.com>
In-Reply-To: <CAOMZO5D2uzR6Sz1QnX3G-Ce_juxU-0PO_vBZX+nR1mpQB8s8-w@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 26 Sep 2019 08:09:52 -0500
Message-ID: <CAHCN7xJ32BYZu-DVTVLSzv222U50JDb8F0A_tLDERbb8kPdRxg@mail.gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [Xen-devel] [PATCH v2 00/21] Refine memblock API
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, devicetree <devicetree@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Weinberger <richard@nod.at>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, kasan-dev <kasan-dev@googlegroups.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 Chris Healy <cphealy@gmail.com>, uclinux-h8-devel@lists.sourceforge.jp,
 Petr Mladek <pmladek@suse.com>, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 linux-m68k@lists.linux-m68k.org, Rob Herring <robh+dt@kernel.org>,
 Greentime Hu <green.hu@gmail.com>, xen-devel@lists.xenproject.org,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Burton <paul.burton@mips.com>, Vineet Gupta <vgupta@synopsys.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMTA6MTcgQU0gRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1A
Z21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgU2VwIDI1LCAyMDE5IGF0IDk6MTcgQU0gQWRh
bSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBJIHRyaWVkIGNtYT0yNTZN
IGFuZCBub3RpY2VkIHRoZSBjbWEgZHVtcCBhdCB0aGUgYmVnaW5uaW5nIGRpZG4ndAo+ID4gY2hh
bmdlLiAgRG8gd2UgbmVlZCB0byBzZXR1cCBhIHJlc2VydmVkLW1lbW9yeSBub2RlIGxpa2UKPiA+
IGlteDZ1bC1jY2lteDZ1bHNvbS5kdHNpIGRpZD8KPgo+IEkgZG9uJ3QgdGhpbmsgc28uCj4KPiBX
ZXJlIHlvdSBhYmxlIHRvIGlkZW50aWZ5IHdoYXQgd2FzIHRoZSBleGFjdCBjb21taXQgdGhhdCBj
YXVzZWQgc3VjaCByZWdyZXNzaW9uPwoKSSB3YXMgYWJsZSB0byBuYXJyb3cgaXQgZG93biB0aGUg
OTJkMTJmOTU0NGI3ICgibWVtYmxvY2s6IHJlZmFjdG9yCmludGVybmFsIGFsbG9jYXRpb24gZnVu
Y3Rpb25zIikgdGhhdCBjYXVzZWQgdGhlIHJlZ3Jlc3Npb24gd2l0aApFdG5hdml2LgoKSSBhbHNv
IG5vdGljZWQgdGhhdCBpZiBJIGNyZWF0ZSBhIHJlc2VydmVkIG1lbW9yeSBub2RlIGFzIHdhcyBk
b25lIG9uZQppbXg2dWwtY2NpbXg2dWxzb20uZHRzaSB0aGUgM0Qgc2VlbXMgdG8gd29yayBhZ2Fp
biwgYnV0IHdpdGhvdXQgaXQsIEkKd2FzIGdldHRpbmcgZXJyb3JzIHJlZ2FyZGxlc3Mgb2YgdGhl
ICdjbWE9MjU2TScgb3Igbm90LgpJIGRvbid0IGhhdmUgYSBwcm9ibGVtIHVzaW5nIHRoZSByZXNl
cnZlZCBtZW1vcnksIGJ1dCBJIGd1ZXNzIEkgYW0gbm90CnN1cmUgd2hhdCB0aGUgYW1vdW50IHNo
b3VsZCBiZS4gIEkga25vdyBmb3IgdGhlIHZpZGVvIGRlY29kaW5nIDEwODBwLApJIGhhdmUgaGlz
dG9yaWNhbGx5IHVzZWQgY21hPTEyOE0sIGJ1dCB3aXRoIHRoZSAzRCBhbHNvIG5lZWRpbmcgc29t
ZQptZW1vcnkgYWxsb2NhdGlvbiwgaXMgdGhhdCBlbm91Z2ggb3Igc2hvdWxkIEkgdXNlIDI1Nk0/
CgphZGFtCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
