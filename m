Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFC513906C
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 12:51:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iqyCr-0005Eh-Rq; Mon, 13 Jan 2020 11:48:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xsmv=3C=gmail.com=rjwysocki@srs-us1.protection.inumbo.net>)
 id 1iqyCq-0005EZ-Es
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 11:48:28 +0000
X-Inumbo-ID: 980b2c14-35fa-11ea-a985-bc764e2007e4
Received: from mail-ot1-f67.google.com (unknown [209.85.210.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 980b2c14-35fa-11ea-a985-bc764e2007e4;
 Mon, 13 Jan 2020 11:48:19 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id a15so8662135otf.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2020 03:48:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LxnhZqYlYpH5Vy9lVIo6OhZ32kMjzMITo+VXkeln1fw=;
 b=uWaGfKbQUcy+oJ/MA+dn4BpX9JAnbd0k1VXl9A3EoU0IkQ2+JIzwWhOQNPCFec7XLL
 xOKOsrxmHticXw0yVNpU9HwU0e1QTMzf0C0ara9e9jjxZLXPDjkBcqME4guqyZB7D7b5
 itAZwHLOFZIfdnPxtaalTXlFwxy7x2ZdMcBKyPwxc9rOzlRhheMgN421bg4ZnIFz/BPJ
 8pn6XRnSLV0eUJDv0W7LbrGv91quS8Dt8ODFr+wrAYlyJyDb1heECiV3gae6WrR/6P8H
 i/5Jbd1x6fHGPl7YZR/yCiKRVgiRneBpbxz6CwgMeztQI7/PMJ48lpIIf96AoY2IsF2J
 NDag==
X-Gm-Message-State: APjAAAWk9lRgmlNx4Yb5qSrUMjDVgoWNC/WgignL/ruanlPfchkRFWeb
 gFcx1zMZJf7JJNLzh7+vll6DOkbyCKsJJY8OXFQ=
X-Google-Smtp-Source: APXvYqw3Qgw3VCVDMPHWyRb4A+fn8GcFRFWgD+RozWxW13+tMz8RTbaH9oz22LVJAtTKMJUr2mfSKOEXlhCa9eU2PHs=
X-Received: by 2002:a05:6830:4b9:: with SMTP id
 l25mr13198440otd.266.1578916099461; 
 Mon, 13 Jan 2020 03:48:19 -0800 (PST)
MIME-Version: 1.0
References: <20200107234526.GA19034@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200108105011.GY2827@hirez.programming.kicks-ass.net>
 <20200110153520.GC8214@u40b0340c692b58f6553c.ant.amazon.com>
 <20200113101609.GT2844@hirez.programming.kicks-ass.net>
 <857b42b2e86b2ae09a23f488daada3b1b2836116.camel@amazon.com>
In-Reply-To: <857b42b2e86b2ae09a23f488daada3b1b2836116.camel@amazon.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 13 Jan 2020 12:48:08 +0100
Message-ID: <CAJZ5v0jkaw1jJVahWbvcqcYhcwWLqajm7gchn4L4WOngHJcbUA@mail.gmail.com>
To: "Singh, Balbir" <sblbir@amazon.com>
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
 "peterz@infradead.org" <peterz@infradead.org>,
 "x86@kernel.org" <x86@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "pavel@ucw.cz" <pavel@ucw.cz>, "hpa@zytor.com" <hpa@zytor.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "fllinden@amaozn.com" <fllinden@amaozn.com>, "Kamata,
 Munehisa" <kamatam@amazon.com>, "mingo@redhat.com" <mingo@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "axboe@kernel.dk" <axboe@kernel.dk>,
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

T24gTW9uLCBKYW4gMTMsIDIwMjAgYXQgMTI6NDMgUE0gU2luZ2gsIEJhbGJpciA8c2JsYmlyQGFt
YXpvbi5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCAyMDIwLTAxLTEzIGF0IDExOjE2ICswMTAwLCBQ
ZXRlciBaaWpsc3RyYSB3cm90ZToKPiA+IE9uIEZyaSwgSmFuIDEwLCAyMDIwIGF0IDA3OjM1OjIw
QU0gLTA4MDAsIEVkdWFyZG8gVmFsZW50aW4gd3JvdGU6Cj4gPiA+IEhleSBQZXRlciwKPiA+ID4K
PiA+ID4gT24gV2VkLCBKYW4gMDgsIDIwMjAgYXQgMTE6NTA6MTFBTSArMDEwMCwgUGV0ZXIgWmlq
bHN0cmEgd3JvdGU6Cj4gPiA+ID4gT24gVHVlLCBKYW4gMDcsIDIwMjAgYXQgMTE6NDU6MjZQTSAr
MDAwMCwgQW5jaGFsIEFnYXJ3YWwgd3JvdGU6Cj4gPiA+ID4gPiBGcm9tOiBFZHVhcmRvIFZhbGVu
dGluIDxlZHV2YWxAYW1hem9uLmNvbT4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBTeXN0ZW0gaW5zdGFi
aWxpdHkgYXJlIHNlZW4gZHVyaW5nIHJlc3VtZSBmcm9tIGhpYmVybmF0aW9uIHdoZW4gc3lzdGVt
Cj4gPiA+ID4gPiBpcyB1bmRlciBoZWF2eSBDUFUgbG9hZC4gVGhpcyBpcyBkdWUgdG8gdGhlIGxh
Y2sgb2YgdXBkYXRlIG9mIHNjaGVkCj4gPiA+ID4gPiBjbG9jayBkYXRhLCBhbmQgdGhlIHNjaGVk
dWxlciB3b3VsZCB0aGVuIHRoaW5rIHRoYXQgaGVhdnkgQ1BVIGhvZwo+ID4gPiA+ID4gdGFza3Mg
bmVlZCBtb3JlIHRpbWUgaW4gQ1BVLCBjYXVzaW5nIHRoZSBzeXN0ZW0gdG8gZnJlZXplCj4gPiA+
ID4gPiBkdXJpbmcgdGhlIHVuZnJlZXppbmcgb2YgdGFza3MuIEZvciBleGFtcGxlLCB0aHJlYWRl
ZCBpcnFzLAo+ID4gPiA+ID4gYW5kIGtlcm5lbCBwcm9jZXNzZXMgc2VydmljaW5nIG5ldHdvcmsg
aW50ZXJmYWNlIG1heSBiZSBkZWxheWVkCj4gPiA+ID4gPiBmb3Igc2V2ZXJhbCB0ZW5zIG9mIHNl
Y29uZHMsIGNhdXNpbmcgdGhlIHN5c3RlbSB0byBiZSB1bnJlYWNoYWJsZS4KPiA+ID4gPiA+IFRo
ZSBmaXggZm9yIHRoaXMgc2l0dWF0aW9uIGlzIHRvIG1hcmsgdGhlIHNjaGVkIGNsb2NrIGFzIHVu
c3RhYmxlCj4gPiA+ID4gPiBhcyBlYXJseSBhcyBwb3NzaWJsZSBpbiB0aGUgcmVzdW1lIHBhdGgs
IGxlYXZpbmcgaXQgdW5zdGFibGUKPiA+ID4gPiA+IGZvciB0aGUgZHVyYXRpb24gb2YgdGhlIHJl
c3VtZSBwcm9jZXNzLiBUaGlzIHdpbGwgZm9yY2UgdGhlCj4gPiA+ID4gPiBzY2hlZHVsZXIgdG8g
YXR0ZW1wdCB0byBhbGlnbiB0aGUgc2NoZWQgY2xvY2sgYWNyb3NzIENQVXMgdXNpbmcKPiA+ID4g
PiA+IHRoZSBkZWx0YSB3aXRoIHRpbWUgb2YgZGF5LCB1cGRhdGluZyBzY2hlZCBjbG9jayBkYXRh
LiBJbiBhIHBvc3QKPiA+ID4gPiA+IGhpYmVybmF0aW9uIGV2ZW50LCB3ZSBjYW4gdGhlbiBtYXJr
IHRoZSBzY2hlZCBjbG9jayBhcyBzdGFibGUKPiA+ID4gPiA+IGFnYWluLCBhdm9pZGluZyB1bm5l
Y2Vzc2FyeSBzeW5jcyB3aXRoIHRpbWUgb2YgZGF5IG9uIHN5c3RlbXMKPiA+ID4gPiA+IGluIHdo
aWNoIFRTQyBpcyByZWxpYWJsZS4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgbWFrZXMgbm8gZnJpZ2dp
bmcgc2Vuc2Ugd2hhdCBzbyBibG9vZHkgZXZlci4gSWYgdGhlIGNsb2NrIGlzCj4gPiA+ID4gc3Rh
YmxlLCB3ZSBkb24ndCBjYXJlIGFib3V0IHNjaGVkX2Nsb2NrX2RhdGEuIFdoZW4gaXQgaXMgc3Rh
YmxlIHlvdSBnZXQKPiA+ID4gPiBhIGxpbmVhciBmdW5jdGlvbiBvZiB0aGUgVFNDIHdpdGhvdXQg
Y29tcGxpY2F0ZWQgYml0cyBvbi4KPiA+ID4gPgo+ID4gPiA+IFdoZW4gaXQgaXMgdW5zdGFibGUs
IG9ubHkgdGhlbiBkbyB3ZSBjYXJlIGFib3V0IHRoZSBzY2hlZF9jbG9ja19kYXRhLgo+ID4gPiA+
Cj4gPiA+Cj4gPiA+IFllYWgsIG1heWJlIHdoYXQgaXMgbm90IGNsZWFyIGhlcmUgaXMgdGhhdCB3
ZSBjb3ZlcmluZyBmb3Igc2l0dWF0aW9uCj4gPiA+IHdoZXJlIGNsb2NrIHN0YWJpbGl0eSBjaGFu
Z2VzIG92ZXIgdGltZSwgZS5nLiBhdCByZWd1bGFyIGJvb3QgY2xvY2sgaXMKPiA+ID4gc3RhYmxl
LCBoaWJlcm5hdGlvbiBoYXBwZW5zLCB0aGVuIHJlc3RvcmUgaGFwcGVucyBpbiBhIG5vbi1zdGFi
bGUgY2xvY2suCj4gPgo+ID4gU3RpbGwgY29uZnVzZWQsIHdobyBtYXJrcyB0aGUgdGhpbmcgdW5z
dGFibGU/IFRoZSBwYXRjaCBzZWVtcyB0byBzdWdnZXN0Cj4gPiB5b3UgZG8geW91cnNlbGYsIGJ1
dCBpdCBpcyBub3QgYXQgYWxsIGNsZWFyIHdoeS4KPiA+Cj4gPiBJZiBUU0MgcmVhbGx5IGlzIHVu
c3RhYmxlLCB0aGVuIGl0IG5lZWRzIHRvIHJlbWFpbiB1bnN0YWJsZS4gSWYgdGhlIFRTQwo+ID4g
cmVhbGx5IGlzIHN0YWJsZSB0aGVuIHRoZXJlIGlzIG5vIHBvaW50IGluIG1hcmtpbmcgaXMgdW5z
dGFibGUuCj4gPgo+ID4gRWl0aGVyIHdheSBzb21ldGhpbmcgaXMgb2ZmLCBhbmQgeW91J3JlIG5v
dCB0ZWxsaW5nIG1lIHdoYXQuCj4gPgo+Cj4gSGksIFBldGVyCj4KPiBGb3IgeW91ciBvcmlnaW5h
bCBjb21tZW50LCBqdXN0IHdhbnRlZCB0byBjbGFyaWZ5IHRoZSBmb2xsb3dpbmc6Cj4KPiAxLiBB
ZnRlciBoaWJlcm5hdGlvbiwgdGhlIG1hY2hpbmUgY2FuIGJlIHJlc3VtZWQgb24gYSBkaWZmZXJl
bnQgYnV0IGNvbXBhdGlibGUKPiBob3N0ICh0aGVzZSBhcmUgVk0gaW1hZ2VzIGhpYmVybmF0ZWQp
Cj4gMi4gVGhpcyBtZWFucyB0aGUgY2xvY2sgYmV0d2VlbiBob3N0MSBhbmQgaG9zdDIgY2FuL3dp
bGwgYmUgZGlmZmVyZW50CgpTbyB0aGUgcHJvYmxlbSBpcyBzcGVjaWZpYyB0byB0aGlzIHBhcnRp
Y3VsYXIgdXNlIGNhc2UuCgpJJ20gbm90IHN1cmUgd2h5IHRvIGltcG9zZSB0aGlzIGhhY2sgb24g
aGliZXJuYXRpb24gaW4gYWxsIGNhc2VzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
