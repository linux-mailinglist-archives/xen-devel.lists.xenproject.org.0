Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C46222CE
	for <lists+xen-devel@lfdr.de>; Sat, 18 May 2019 11:56:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRw0d-00051S-3Z; Sat, 18 May 2019 09:52:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qPpN=TS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hRw0a-00051L-Vh
 for xen-devel@lists.xenproject.org; Sat, 18 May 2019 09:52:05 +0000
X-Inumbo-ID: 9633ad89-7952-11e9-8980-bc764e045a96
Received: from mail-lj1-f195.google.com (unknown [209.85.208.195])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9633ad89-7952-11e9-8980-bc764e045a96;
 Sat, 18 May 2019 09:52:03 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id h21so8317129ljk.13
 for <xen-devel@lists.xenproject.org>; Sat, 18 May 2019 02:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0t3h8Y4xANQAH5x8/oS++078us3kglt1BnhzVQPPhy8=;
 b=uPRhkrLSiEptuUNO7NSIn9GLCn+yaGKCha5TNmx4dLXJVE82mkyx0y8CkDjFirHPBL
 5BzofceiAxnQUQrdFOj7s5nkwHeKyC8HryujmEyepzxLhB01gtZ6Dwcpmdgvcvms2I/o
 VVC9Mi1XOlXckw/+2hTErCEAv8t0BO61Xk0e17voDg0hM4crN1LH7ciuxA3yfNv1df4e
 j4dusWSzhBQi26Jt9hyNKvSP5VX0L2vMfvV07wsrtmoUWA0utGz8SC9h7PIrxHQceC95
 ZnJVVS883GYSW00KrKlqr1UINIWYlNpejS3H0IZbVIiweOeEtPf6S81UVRacAXA1gS4V
 IVQg==
X-Gm-Message-State: APjAAAWwuCaRun539pR9LM4cP8Uk1d42VOdv/CZXFHMLrqnVvzPzY+Hn
 d79+oG26UwofIdEXspwj2iCC33NojBE=
X-Google-Smtp-Source: APXvYqzwcZNHr6xZDC3qRQlMAoay/2Zf/OIbQfwAV4SOj0O5GFb7N36jln5gh5yQ9hi/JvQUJs8Saw==
X-Received: by 2002:a2e:9d59:: with SMTP id y25mr25009168ljj.137.1558173121883; 
 Sat, 18 May 2019 02:52:01 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46])
 by smtp.gmail.com with ESMTPSA id h25sm2204548ljb.80.2019.05.18.02.52.00
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 18 May 2019 02:52:00 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id n22so6978192lfe.12
 for <xen-devel@lists.xenproject.org>; Sat, 18 May 2019 02:52:00 -0700 (PDT)
X-Received: by 2002:a19:1908:: with SMTP id 8mr4859361lfz.171.1558173120583;
 Sat, 18 May 2019 02:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190516000212.13468-1-alistair.francis@wdc.com>
 <5CDD3BF2020000780022F8AD@prv1-mh.provo.novell.com>
 <20190516111330.GA32248@aepfle.de>
 <20190516113902.GZ2798@zion.uk.xensource.com>
 <20190516151819.168c6b36.olaf@aepfle.de>
 <20190516133037.GH2798@zion.uk.xensource.com>
 <CAKmqyKPjkTJEHe_AR7sqZ+Od34A6ZTU4-N0+rYpLAS1h2HoL6g@mail.gmail.com>
 <20190517163756.GP2798@zion.uk.xensource.com>
 <CAKmqyKPp-vPFYxykbAEJ+8KfyUbhhNBJC0jOrmWkNPzFcZEw5g@mail.gmail.com>
In-Reply-To: <CAKmqyKPp-vPFYxykbAEJ+8KfyUbhhNBJC0jOrmWkNPzFcZEw5g@mail.gmail.com>
From: Wei Liu <wl@xen.org>
Date: Sat, 18 May 2019 10:51:43 +0100
X-Gmail-Original-Message-ID: <CAK9nU=r9=6VysMPSQXWnQS1ge_7S9aRNeBRPyhmPW0bXbTD8ew@mail.gmail.com>
Message-ID: <CAK9nU=r9=6VysMPSQXWnQS1ge_7S9aRNeBRPyhmPW0bXbTD8ew@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Subject: Re: [Xen-devel] [PATCH 1/3] config.sub: Update config.sub to latest
 version
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
Cc: Olaf Hering <olaf@aepfle.de>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAxNyBNYXkgMjAxOSBhdCAyMzo0MywgQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIy
M0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPaywgSSBoYXZlIHVwZGF0ZWQgdGhlIHBh
dGNoIHRvIHJlbW92ZSB0aGUgY29uZmlndXJlIHNjcmlwdCwgYnV0IHdlCj4gPiA+IHN0aWxsIGFy
ZSBzdHVjayB3aXRoIGNvbmZpZy5zdWIgYW5kIGNvbmZpZy5ndWVzcyBhcyB3ZSBhcmUgdXNpbmcg
dGhlCj4gPiA+IEFDX0NBTk9OSUNBTF9IT1NUIG1hY3JvIFsxXS4gSSB3aWxsIHNlbmQgYSB2MiB0
aGF0IHJlbW92ZXMgdGhlCj4gPiA+IGNvbmZpZ3VyZSBzY3JpcHQsIGJ1dCB0aGlzIHBhdGNoIGlz
IHN0aWxsIHJlcXVpcmVkLgo+ID4gPgo+ID4gPiAxOiBodHRwczovL3d3dy5nbnUub3JnL3NvZnR3
YXJlL2F1dG9jb25mL21hbnVhbC9hdXRvY29uZi5odG1sI0Nhbm9uaWNhbGl6aW5nCj4gPiA+Cj4g
Pgo+ID4gQmVmb3JlIHlvdSBnbyBhd2F5IGFuZCBkbyB3b3JrLCBwbGVhc2Ugd2FpdCBmb3IgcmVw
bHkgZnJvbSBJYW4uCj4KPiBJIGhhZCBhbHJlYWR5IGRvbmUgYWxsIHRoZSB3b3JrIHNvIEkgc2Vu
dCBhIHYyLiBXZSBjYW4gaGF2ZSB0aGUKPiBkaXNjdXNzaW9uIHRoZXJlLCBpdCBzdGlsbCBoYXMg
dGhpcyBwYXRjaCAobW9yZSBvciBsZXNzKSBhcyBwYXRjaCAxLgo+CgpPSy4gVGhhdCdzIGZpbmUg
YnkgbWUuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
