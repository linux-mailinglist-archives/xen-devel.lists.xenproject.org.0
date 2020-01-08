Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0DA13419A
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 13:26:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipANd-00025J-0W; Wed, 08 Jan 2020 12:24:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e5qD=25=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ipANc-00025E-Be
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 12:24:08 +0000
X-Inumbo-ID: bf3da858-3211-11ea-bc14-bc764e2007e4
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf3da858-3211-11ea-bc14-bc764e2007e4;
 Wed, 08 Jan 2020 12:23:59 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j42so3094586wrj.12
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2020 04:23:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=RdWLntUtTPTe9Vg919BHsYy1BKfo8PfzD+FgLgOkV8Q=;
 b=gF76g2N0QIhZiMB4EKA2Ellv8LaY/yxvth8kUFFUUAljQv5hcsJWFNoVDe7ksS7LmK
 iiQ9E0IgvNde9pJxbA1Z7+kmEnUQQCz/7AM1bMKrYsso1G77XhQ756pTMeVhFg+m4iwI
 La6/07Etf4N4VPrK7Q9RuSxDWURd0eO2iZ9Vb3wihhY1MZJ+9ELvLgeqFrkvb3qltV/u
 EXyYvWkqzvFlNKjVvgMW2MdhF7WVwyG9jCMSUQI1S2Cwem2RdvJp5h4qFC2kVu3fWhow
 8Y6JstA8o2SNyJoGqw69fMiVGWAkujbbMZVjrvE3Tv0VD9hmdsRn3dDmT/X3bnW2dw9r
 GJNw==
X-Gm-Message-State: APjAAAWr4cDjQunA2upvLY80aK7sYZMLdZK07WrcWIBDAsMilWZ+2Vnv
 pFFWi0+QGmsS5fIuho974m8=
X-Google-Smtp-Source: APXvYqxHYNSmCR+yZR3aygUM0JbT8dkkFoqbHKrm2KTQq3guN7W6xE9QK3JOymYQFVMQ6KnseojfyQ==
X-Received: by 2002:a5d:494b:: with SMTP id r11mr4321118wrs.184.1578486238912; 
 Wed, 08 Jan 2020 04:23:58 -0800 (PST)
Received: from debian (11.163.200.146.dyn.plus.net. [146.200.163.11])
 by smtp.gmail.com with ESMTPSA id n189sm3761320wme.33.2020.01.08.04.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 04:23:58 -0800 (PST)
Date: Wed, 8 Jan 2020 12:23:55 +0000
From: Wei Liu <wl@xen.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20200108122355.3js5sbis2yxxszqc@debian>
References: <20200108110148.18988-1-jgross@suse.com>
 <20200108121606.yr25b27mrnawu6um@debian>
 <61ec5633-05b7-fab3-ceac-e6c7649893e3@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61ec5633-05b7-fab3-ceac-e6c7649893e3@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] xen/x86: clear per cpu stub page
 information in cpu_smpboot_free()
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
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMDgsIDIwMjAgYXQgMDE6MTg6NDZQTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAwOC4wMS4yMCAxMzoxNiwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFdlZCwgSmFu
IDA4LCAyMDIwIGF0IDEyOjAxOjQ4UE0gKzAxMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gPiA+
IGNwdV9zbXBib290X2ZyZWUoKSByZW1vdmVzIHRoZSBzdHVicyBmb3IgdGhlIGNwdSBnb2luZyBv
ZmZsaW5lLCBidXQgaXQKPiA+ID4gaXNuJ3QgY2xlYXJpbmcgdGhlIHJlbGF0ZWQgcGVyY3B1IHZh
cmlhYmxlcy4gVGhpcyB3aWxsIHJlc3VsdCBpbgo+ID4gPiBjcmFzaGVzIHdoZW4gYSBzdHViIHBh
Z2UgaXMgcmVsZWFzZWQgZHVlIHRvIGFsbCByZWxhdGVkIGNwdXMgZ29uZQo+ID4gPiBvZmZsaW5l
IGFuZCBvbmUgb2YgdGhvc2UgY3B1cyBnb2luZyBvbmxpbmUgbGF0ZXIuCj4gPiA+IAo+ID4gPiBG
aXggdGhhdCBieSBjbGVhcmluZyBzdHVicy5hZGRyIGFuZCBzdHVicy5tZm4gaW4gb3JkZXIgdG8g
YWxsb2NhdGUgYQo+ID4gPiBuZXcgc3R1YiBwYWdlIHdoZW4gbmVlZGVkLgo+ID4gPiAKPiA+ID4g
U2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+ID4gPiAtLS0K
PiA+ID4gICB4ZW4vYXJjaC94ODYvc21wYm9vdC5jIHwgMiArKwo+ID4gPiAgIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvc21wYm9vdC5jIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+ID4gPiBpbmRleCA3ZTI5NzA0
MDgwLi40NmMwNzI5MjE0IDEwMDY0NAo+ID4gPiAtLS0gYS94ZW4vYXJjaC94ODYvc21wYm9vdC5j
Cj4gPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKPiA+ID4gQEAgLTk0NSw2ICs5NDUs
OCBAQCBzdGF0aWMgdm9pZCBjcHVfc21wYm9vdF9mcmVlKHVuc2lnbmVkIGludCBjcHUsIGJvb2wg
cmVtb3ZlKQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHBlcl9jcHUoc3R1
YnMuYWRkciwgY3B1KSB8IH5QQUdFX01BU0spICsgMSk7Cj4gPiA+ICAgICAgICAgICBpZiAoIGkg
PT0gU1RVQlNfUEVSX1BBR0UgKQo+ID4gPiAgICAgICAgICAgICAgIGZyZWVfZG9taGVhcF9wYWdl
KG1mbl90b19wYWdlKG1mbikpOwo+ID4gPiArICAgICAgICBwZXJfY3B1KHN0dWJzLmFkZHIsIGNw
dSkgPSAwOwo+ID4gPiArICAgICAgICBwZXJfY3B1KHN0dWJzLm1mbiwgY3B1KSA9IDA7Cj4gPiAK
PiA+IFNob3VsZG4ndCB0aGUgbWZuIGJlIHNldCB0byBJTlZBTElEX01GTiBpbnN0ZWFkPwo+IAo+
IFRoaXMgd291bGQgcmVxdWlyZSBtb2RpZnlpbmcgYWxsb2Nfc3R1Yl9wYWdlKCk6Cj4gCj4gICAg
IGlmICggKm1mbiApCj4gICAgICAgICBwZyA9IG1mbl90b19wYWdlKF9tZm4oKm1mbikpOwo+ICAg
ICBlbHNlCgpPSy4gSSB0aGluayB0aGUgY2hhbmNlIG9mIGFsbG9jYXRpbmcgbWZuIDAgZnJvbSB0
aGUgYWxsb2NhdG9yIGlzCmV4Y2VlZGluZ2x5IGxvdywgc28gSSBjZXJ0YWlubHkgaGF2ZSBubyBv
YmplY3Rpb24gdG8gcmVzZXQgaXQgdG8gMC4KCldlaS4KCj4gCj4gCj4gSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
