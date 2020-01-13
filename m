Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0258139BEE
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 22:54:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir7cH-0000B3-5z; Mon, 13 Jan 2020 21:51:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xsmv=3C=gmail.com=rjwysocki@srs-us1.protection.inumbo.net>)
 id 1ir7cF-0000Ay-VY
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 21:51:20 +0000
X-Inumbo-ID: cff4f3cc-364e-11ea-b89f-bc764e2007e4
Received: from mail-ot1-f66.google.com (unknown [209.85.210.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cff4f3cc-364e-11ea-b89f-bc764e2007e4;
 Mon, 13 Jan 2020 21:51:11 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id i15so10511752oto.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2020 13:51:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ffKiZp7TgACphMkCDUm1FD5yMgsxVZ6Ff6N1urk4jWc=;
 b=Np8uQ7LAodzcvakDBS8FrmrQLQe8WqqUmkt4TV2dycwtClVg3xQ7cDWUALufkwGPK4
 LLb4vhPtshRYKaWTb6nYwbI89AwRuWp+38FHfuGLxOv3j6hGZMRNT9j1pGcmxEVq+kFd
 bHeDSC12OKueJgoatGGUuCNXSywUpTRE4b388lF7hcxMeqQjMxwQaZk30917SbHDM73y
 YMna1bjJ/6MMW1gp44ZEqFPEFRtDdtC+H08bXZQo6JEsNdfbQGCKNYX9OATJKKt1fzYa
 EVZ0qd36jnOIqkVfY3IzvNpS4y8FNMekYU5cXYAOsYXTCx01yvwgNs8XKmPVglMfzmC1
 YmKw==
X-Gm-Message-State: APjAAAWO+vgQ689f0yEgHiFirDoy4WD53P7v97m6WX2pwOnzNkPB3gMl
 f0nHpm5vVwJOuSDD1hiHHSk4iMp82j+sfAcpwuw=
X-Google-Smtp-Source: APXvYqzboRxdkjdj+vWtBhL4TgciiCHxHfLR6hQIa9NC97Z5QPZwbV5+qGJCzmxQC2fQg0RpLiUiJ5XFNlHcaKaz1Xg=
X-Received: by 2002:a05:6830:4b9:: with SMTP id
 l25mr15083303otd.266.1578952270976; 
 Mon, 13 Jan 2020 13:51:10 -0800 (PST)
MIME-Version: 1.0
References: <20200107234526.GA19034@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200108105011.GY2827@hirez.programming.kicks-ass.net>
 <20200110153520.GC8214@u40b0340c692b58f6553c.ant.amazon.com>
 <20200113101609.GT2844@hirez.programming.kicks-ass.net>
 <857b42b2e86b2ae09a23f488daada3b1b2836116.camel@amazon.com>
 <20200113124247.GG2827@hirez.programming.kicks-ass.net>
In-Reply-To: <20200113124247.GG2827@hirez.programming.kicks-ass.net>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 13 Jan 2020 22:50:59 +0100
Message-ID: <CAJZ5v0jv+5aLY3N4wFSitu61o9S8tJWEWGGn1Xyw-P82_TwFdQ@mail.gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [Xen-devel] [RFC PATCH V2 11/11] x86: tsc: avoid system
 instability in hibernation
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
Cc: "konrad.wilk@oracle.co" <konrad.wilk@oracle.co>, "Valentin,
 Eduardo" <eduval@amazon.com>, "len.brown@intel.com" <len.brown@intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "pavel@ucw.cz" <pavel@ucw.cz>, "hpa@zytor.com" <hpa@zytor.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "fllinden@amaozn.com" <fllinden@amaozn.com>, "Kamata,
 Munehisa" <kamatam@amazon.com>, "mingo@redhat.com" <mingo@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Singh,
 Balbir" <sblbir@amazon.com>, "axboe@kernel.dk" <axboe@kernel.dk>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "Agarwal,
 Anchal" <anchalag@amazon.com>, "bp@alien8.de" <bp@alien8.de>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "jgross@suse.com" <jgross@suse.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "Woodhouse@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com"
 <Woodhouse@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>, "Woodhouse,
 David" <dwmw@amazon.co.uk>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMTMsIDIwMjAgYXQgMTo0MyBQTSBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBKYW4gMTMsIDIwMjAgYXQgMTE6NDM6MThB
TSArMDAwMCwgU2luZ2gsIEJhbGJpciB3cm90ZToKPiA+IEZvciB5b3VyIG9yaWdpbmFsIGNvbW1l
bnQsIGp1c3Qgd2FudGVkIHRvIGNsYXJpZnkgdGhlIGZvbGxvd2luZzoKPiA+Cj4gPiAxLiBBZnRl
ciBoaWJlcm5hdGlvbiwgdGhlIG1hY2hpbmUgY2FuIGJlIHJlc3VtZWQgb24gYSBkaWZmZXJlbnQg
YnV0IGNvbXBhdGlibGUKPiA+IGhvc3QgKHRoZXNlIGFyZSBWTSBpbWFnZXMgaGliZXJuYXRlZCkK
PiA+IDIuIFRoaXMgbWVhbnMgdGhlIGNsb2NrIGJldHdlZW4gaG9zdDEgYW5kIGhvc3QyIGNhbi93
aWxsIGJlIGRpZmZlcmVudAo+ID4KPiA+IEluIHlvdXIgY29tbWVudHMgYXJlIHlvdSBtYWtpbmcg
dGhlIGFzc3VtcHRpb24gdGhhdCB0aGUgaG9zdChzKSBpcy9hcmUgdGhlCj4gPiBzYW1lPyBKdXN0
IGNoZWNraW5nIHRoZSBhc3N1bXB0aW9ucyBiZWluZyBtYWRlIGFuZCBiZWluZyBvbiB0aGUgc2Ft
ZSBwYWdlIHdpdGgKPiA+IHRoZW0uCj4KPiBJIHdvdWxkIGV4cGVjdCB0aGlzIHRvIGJlIHRoZSBz
YW1lIHByb2JsZW0gd2UgaGF2ZSBhcyByZWd1bGFyIHN1c3BlbmQsCj4gYWZ0ZXIgcG93ZXIgb2Zm
IHRoZSBUU0Mgd2lsbCBoYXZlIGJlZW4gcmVzZXQsIHNvIHJlc3VtZSB3aWxsIGhhdmUgdG8KPiBz
b21laG93IGJyaWRnZSB0aGF0IGdhcC4gSSd2ZSBubyBpZGVhIGlmL2hvdyBpdCBkb2VzIHRoYXQu
CgpJbiBnZW5lcmFsLCB0aGlzIGlzIGRvbmUgYnkgdGltZWtlZXBpbmdfcmVzdW1lKCkgYW5kIHRo
ZSBvbmx5IHNwZWNpYWwKdGhpbmcgZG9uZSBmb3IgdGhlIFRTQyBhcHBlYXJzIHRvIGJlIHRoZSB0
c2NfdmVyaWZ5X3RzY19hZGp1c3QodHJ1ZSkKY2FsbCBpbiB0c2NfcmVzdW1lKCkuCgo+IEkgcmVt
ZW1iZXIgc29tZSBCSU9TZXMgaGFkIGNyYXp5IFRTQyBpZGVhcyBmb3Igc3VzcGVuZDJyYW0sIGFu
ZCB3ZSBncmV3Cj4gdHNjX3Jlc3RvcmVfc2NoZWRfY2xvY2tfc3RhdGUoKSBmb3IgaXQuCj4KPiBQ
bGF5aW5nIGNyYXp5IGdhbWVzIGxpa2Ugd2hhdCB5b3UncmUgZG9pbmcganVzdCBpc24ndCBpdCB0
aG91Z2guCgpSaWdodC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
