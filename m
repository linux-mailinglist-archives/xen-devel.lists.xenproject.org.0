Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB64139D5B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 00:32:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir9A8-0008TZ-8F; Mon, 13 Jan 2020 23:30:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xsmv=3C=gmail.com=rjwysocki@srs-us1.protection.inumbo.net>)
 id 1ir9A6-0008TT-B7
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 23:30:22 +0000
X-Inumbo-ID: a5e47dec-365c-11ea-b89f-bc764e2007e4
Received: from mail-oi1-f193.google.com (unknown [209.85.167.193])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5e47dec-365c-11ea-b89f-bc764e2007e4;
 Mon, 13 Jan 2020 23:30:13 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id z64so10089442oia.4
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2020 15:30:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eZaqiw319VJnCml2+zBJxKWVWM0h/GzDX6yg9g2Rquw=;
 b=Qe4BqpuYY7cJYK8XzA7mQYD6+RVWkX6peIvFdddmbLLTzxc/4U5imRmq4KlUJ8dpbK
 mbc0EVGq7H9wKxoZMaqk3C1r8dH31t+vL3BwQV+177/jEK4PlzwySZyA+7UvS3aye3dw
 K7RBWLETf+LPXLo/wTGhyUHm4eJi4p1yCHRDpO0ZDJzqkhSKvQrv/6lAmv6+VEvE46GA
 7NxkGRiknWnmp4R6PSiYGRB+lIm4jr5D2K0Emz82mzoyYMcdmdcXxdsy8ZOTAuOzvhqk
 sEho1XSrnx2SFj1SYvqshHnx/YMEu9a/uu5zh5aiWWwP0OBboAUlsKohwPYaGcuf3aI7
 XvaA==
X-Gm-Message-State: APjAAAUzjq888yBNAKEpV9IHh9USkByycbVIpcAsgG7mtGSldbYLdl9Q
 3NlGtzDHIYthOnQmzUxqtHhNeZpBEcauHJycMkY=
X-Google-Smtp-Source: APXvYqzg8CdbzHzyG2pmz4js9Msb/H7pbgSPntduERaOQNPUZYVj+FwHMkNAuBIckeikwPmAWFV/f2vKNieGQbmMI6k=
X-Received: by 2002:a54:488d:: with SMTP id r13mr14062187oic.115.1578958213346; 
 Mon, 13 Jan 2020 15:30:13 -0800 (PST)
MIME-Version: 1.0
References: <20200107234526.GA19034@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200108105011.GY2827@hirez.programming.kicks-ass.net>
 <20200110153520.GC8214@u40b0340c692b58f6553c.ant.amazon.com>
 <20200113101609.GT2844@hirez.programming.kicks-ass.net>
 <857b42b2e86b2ae09a23f488daada3b1b2836116.camel@amazon.com>
 <20200113124247.GG2827@hirez.programming.kicks-ass.net>
 <CAJZ5v0jv+5aLY3N4wFSitu61o9S8tJWEWGGn1Xyw-P82_TwFdQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0jv+5aLY3N4wFSitu61o9S8tJWEWGGn1Xyw-P82_TwFdQ@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 14 Jan 2020 00:30:02 +0100
Message-ID: <CAJZ5v0imNbbch=NWAdgVKf_hjwRrEiWAL8SFNwe6rW_SjgYzrw@mail.gmail.com>
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
Cc: "konrad.wilk@oracle.co" <konrad.wilk@oracle.co>, "Kamata,
 Munehisa" <kamatam@amazon.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "pavel@ucw.cz" <pavel@ucw.cz>, "hpa@zytor.com" <hpa@zytor.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "fllinden@amaozn.com" <fllinden@amaozn.com>, "Valentin,
 Eduardo" <eduval@amazon.com>, "x86@kernel.org" <x86@kernel.org>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Singh,
 Balbir" <sblbir@amazon.com>, "len.brown@intel.com" <len.brown@intel.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "Agarwal,
 Anchal" <anchalag@amazon.com>, "bp@alien8.de" <bp@alien8.de>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "axboe@kernel.dk" <axboe@kernel.dk>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>, "Woodhouse,
 David" <dwmw@amazon.co.uk>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMTMsIDIwMjAgYXQgMTA6NTAgUE0gUmFmYWVsIEouIFd5c29ja2kgPHJhZmFl
bEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgSmFuIDEzLCAyMDIwIGF0IDE6NDMgUE0g
UGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBN
b24sIEphbiAxMywgMjAyMCBhdCAxMTo0MzoxOEFNICswMDAwLCBTaW5naCwgQmFsYmlyIHdyb3Rl
Ogo+ID4gPiBGb3IgeW91ciBvcmlnaW5hbCBjb21tZW50LCBqdXN0IHdhbnRlZCB0byBjbGFyaWZ5
IHRoZSBmb2xsb3dpbmc6Cj4gPiA+Cj4gPiA+IDEuIEFmdGVyIGhpYmVybmF0aW9uLCB0aGUgbWFj
aGluZSBjYW4gYmUgcmVzdW1lZCBvbiBhIGRpZmZlcmVudCBidXQgY29tcGF0aWJsZQo+ID4gPiBo
b3N0ICh0aGVzZSBhcmUgVk0gaW1hZ2VzIGhpYmVybmF0ZWQpCj4gPiA+IDIuIFRoaXMgbWVhbnMg
dGhlIGNsb2NrIGJldHdlZW4gaG9zdDEgYW5kIGhvc3QyIGNhbi93aWxsIGJlIGRpZmZlcmVudAo+
ID4gPgo+ID4gPiBJbiB5b3VyIGNvbW1lbnRzIGFyZSB5b3UgbWFraW5nIHRoZSBhc3N1bXB0aW9u
IHRoYXQgdGhlIGhvc3QocykgaXMvYXJlIHRoZQo+ID4gPiBzYW1lPyBKdXN0IGNoZWNraW5nIHRo
ZSBhc3N1bXB0aW9ucyBiZWluZyBtYWRlIGFuZCBiZWluZyBvbiB0aGUgc2FtZSBwYWdlIHdpdGgK
PiA+ID4gdGhlbS4KPiA+Cj4gPiBJIHdvdWxkIGV4cGVjdCB0aGlzIHRvIGJlIHRoZSBzYW1lIHBy
b2JsZW0gd2UgaGF2ZSBhcyByZWd1bGFyIHN1c3BlbmQsCj4gPiBhZnRlciBwb3dlciBvZmYgdGhl
IFRTQyB3aWxsIGhhdmUgYmVlbiByZXNldCwgc28gcmVzdW1lIHdpbGwgaGF2ZSB0bwo+ID4gc29t
ZWhvdyBicmlkZ2UgdGhhdCBnYXAuIEkndmUgbm8gaWRlYSBpZi9ob3cgaXQgZG9lcyB0aGF0Lgo+
Cj4gSW4gZ2VuZXJhbCwgdGhpcyBpcyBkb25lIGJ5IHRpbWVrZWVwaW5nX3Jlc3VtZSgpIGFuZCB0
aGUgb25seSBzcGVjaWFsCj4gdGhpbmcgZG9uZSBmb3IgdGhlIFRTQyBhcHBlYXJzIHRvIGJlIHRo
ZSB0c2NfdmVyaWZ5X3RzY19hZGp1c3QodHJ1ZSkKPiBjYWxsIGluIHRzY19yZXN1bWUoKS4KCkFu
ZCBJIGZvcmdvdCBhYm91dCB0c2NfcmVzdG9yZV9zY2hlZF9jbG9ja19zdGF0ZSgpIHRoYXQgZ2V0
cyBjYWxsZWQKdmlhIHJlc3RvcmVfcHJvY2Vzc29yX3N0YXRlKCkgb24geDg2LCBiZWZvcmUgY2Fs
bGluZwp0aW1la2VlcGluZ19yZXN1bWUoKS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
