Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F341A130A09
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jan 2020 22:49:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioDid-0005za-9e; Sun, 05 Jan 2020 21:45:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FFS2=22=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ioDib-0005zV-Oq
 for xen-devel@lists.xenproject.org; Sun, 05 Jan 2020 21:45:53 +0000
X-Inumbo-ID: b9bb7748-3004-11ea-a1e1-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9bb7748-3004-11ea-a1e1-bc764e2007e4;
 Sun, 05 Jan 2020 21:45:44 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g17so47635899wro.2
 for <xen-devel@lists.xenproject.org>; Sun, 05 Jan 2020 13:45:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Ms9zwr3oP1fMyS4T7pBF++D5wnG2UZVM3Gg1Uf3sZsw=;
 b=sUOn8budy0XpPVjMGo89VZjJg8yVkDxi2fGC1bn/qqUcPWcqcMNnwYJKLlSmB6QB85
 WQUieHKN7mG7z7JV0tRQFlPAdGazcM4/BvK7byfWGbOHeXIi4e15SzN3DIgMGvXdahY3
 feg4+tbCBIrQOAxben65oFFDah6jVlW9RrI1DY5R3gRlRvnxpcPIS3+49DxEljuM5uyN
 Dinl7gJU6HJqsDrWdfjQVbGGnJmd+Bkx7RSyggtY+DkxUnRhbVKD8owbE8r1iTL7DSDq
 vxF9WgzVIxk9e+sOFDIBt1zp8rpbZlSLJukVXiqWNkCy2an0kZaO44zrG7h7J+1UtHQd
 QBHw==
X-Gm-Message-State: APjAAAXj7RHqPKc3Ife5zLLbBiMWS3i7+Ek1S0GqZgeXMB8dyM8tDa+F
 2QgTav5qpmr5Cf+roifiudA=
X-Google-Smtp-Source: APXvYqxQr0ZIeC0a3umBwdyQeqr16Gqz6u2gOF4i5B5Y+MbrXBTMtAT3SSXCP6x8HhhtowDuSDDmWg==
X-Received: by 2002:adf:fe90:: with SMTP id
 l16mr105194776wrr.265.1578260743882; 
 Sun, 05 Jan 2020 13:45:43 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id 16sm20378331wmi.0.2020.01.05.13.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2020 13:45:43 -0800 (PST)
Date: Sun, 5 Jan 2020 21:45:41 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200105214541.5z5ibv2nlyebbypj@debian>
References: <20200105164801.26278-1-liuwe@microsoft.com>
 <20200105164801.26278-2-liuwe@microsoft.com>
 <eae9980b-90dd-e747-9400-7bc044b06360@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eae9980b-90dd-e747-9400-7bc044b06360@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v3 1/5] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCBKYW4gMDUsIDIwMjAgYXQgMDU6Mzc6NDRQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAwNS8wMS8yMDIwIDE2OjQ3LCBXZWkgTGl1IHdyb3RlOgo+ID4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUgYi94ZW4vYXJjaC94ODYvZ3Vl
c3QvaHlwZXJ2L01ha2VmaWxlCj4gPiBpbmRleCA2ODE3MDEwOWE5Li4xYTg4ODdkMmY0IDEwMDY0
NAo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZQo+ID4gKysrIGIv
eGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZQo+ID4gQEAgLTEgKzEsMiBAQAo+ID4g
K29iai15ICs9IGh5cGVyY2FsbF9wYWdlLm8KPiA+ICBvYmoteSArPSBoeXBlcnYubwo+ID4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJjYWxsX3BhZ2UuUyBiL3hl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJjYWxsX3BhZ2UuUwo+ID4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAuLjZkNmFiOTEzYmUKPiA+IC0tLSAvZGV2L251
bGwKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJjYWxsX3BhZ2UuUwo+
ID4gQEAgLTAsMCArMSwyMSBAQAo+ID4gKyNpbmNsdWRlIDxhc20vYXNtX2RlZm5zLmg+Cj4gPiAr
I2luY2x1ZGUgPGFzbS9wYWdlLmg+Cj4gPiArCj4gPiArICAgICAgICAuc2VjdGlvbiAiLnRleHQu
cGFnZV9hbGlnbmVkIiwgImF4IiwgQHByb2diaXRzCj4gPiArICAgICAgICAucDJhbGlnbiBQQUdF
X1NISUZUCj4gPiArR0xPQkFMKGh2X2h5cGVyY2FsbF9wYWdlKQo+ID4gKyAgICAgICAgLyogUmV0
dXJuIC0xIGZvciAibm90IHlldCByZWFkeSIgc3RhdGUgKi8KPiA+ICsgICAgICAgIG1vdiAtMSwg
JXJheAo+ID4gKyAgICAgICAgcmV0Cj4gPiArMToKPiA+ICsgICAgICAgIC8qIEZpbGwgdGhlIHJl
c3Qgd2l0aCBgcmV0YCAqLwo+ID4gKyAgICAgICAgLmZpbGwgUEFHRV9TSVpFIC0gKDFiIC0gaHZf
aHlwZXJjYWxsX3BhZ2UpLCAxLCAweGMzCj4gCj4gSWYgeW91IHdhbnQgdG8gZmlsbCB3aXRoIHJl
dHMsIHlvdSBjYW4gZG8gdGhpcyBtb3JlIHNpbXBseSB3aXRoOgo+IAo+IMKgwqDCoCAucDJsaWdu
IFBBR0VfU0hJRlQsIDB4YzMKPiAKPiB3aGljaCB3aWxsIGRvIHRoZSBzaXplIGNhbGN1bGF0aW9u
IGZvciB5b3UuCj4gCj4gVGhhdCBzYWlkLCBJIHJldHJhY3QgbXkgc3RhdGVtZW50IGFib3V0IHdh
bnRpbmcgdGhpcyBpbiB0aGUgbWlkZGxlIG9mCj4gLnRleHQuwqAgKFNvcnJ5LsKgIFNlZSBiZWxv
dy4pCj4gCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYu
YyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiA+IGluZGV4IDhkMzgzMTNk
N2EuLjM4MWJlMmE2OGMgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2
L2h5cGVydi5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4g
PiBAQCAtNzIsNiArNzIsMjcgQEAgY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzICpfX2luaXQg
aHlwZXJ2X3Byb2JlKHZvaWQpCj4gPiAgICAgIHJldHVybiAmb3BzOwo+ID4gIH0KPiA+ICAKPiA+
ICtzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfaHlwZXJjYWxsX3BhZ2Uodm9pZCkKPiA+ICt7Cj4g
PiArICAgIHVuaW9uIGh2X3g2NF9tc3JfaHlwZXJjYWxsX2NvbnRlbnRzIGh5cGVyY2FsbF9tc3I7
Cj4gPiArCj4gPiArICAgIHJkbXNybChIVl9YNjRfTVNSX0hZUEVSQ0FMTCwgaHlwZXJjYWxsX21z
ci5hc191aW50NjQpOwo+ID4gKyAgICBoeXBlcmNhbGxfbXNyLmVuYWJsZSA9IDE7Cj4gPiArICAg
IGh5cGVyY2FsbF9tc3IuZ3Vlc3RfcGh5c2ljYWxfYWRkcmVzcyA9Cj4gPiArICAgICAgICBfX3Bh
KGh2X2h5cGVyY2FsbF9wYWdlKSA+PiBIVl9IWVBfUEFHRV9TSElGVDsKPiA+ICsgICAgd3Jtc3Js
KEhWX1g2NF9NU1JfSFlQRVJDQUxMLCBoeXBlcmNhbGxfbXNyLmFzX3VpbnQ2NCk7Cj4gPiArfQo+
ID4gKwo+ID4gK3N0YXRpYyB2b2lkIF9faW5pdCBzZXR1cCh2b2lkKQo+ID4gK3sKPiA+ICsgICAg
c2V0dXBfaHlwZXJjYWxsX3BhZ2UoKTsKPiA+ICt9Cj4gCj4gVGhlIFRMRlMgc2F5cyB0aGF0IHdy
aXRpbmcgZW5hYmxlIHdpbGwgZmFpbCB1bnRpbCB0aGUgT1MgaWRlbnRpdHkgaXMKPiBzZXQsIHdo
aWNoIEFGQUNJVCwgaXNuJ3QgZG9uZSBhbnl3aGVyZSBpbiB0aGUgc2VyaWVzLsKgIFRoZSB3aG9s
ZQo+IHNlcXVlbmNlIGlzIGRlc2NyaWJlZCBpbiAiMy4xMyBFc3RhYmxpc2hpbmcgdGhlIEh5cGVy
Y2FsbCBJbnRlcmZhY2UiCgpHb29kIGNhdGNoLiBJIHdpbGwgbWFrZSB1cCBhbiBpZGVudGl0eSBu
dW1iZXIgZm9yIFhlbi4gSSB3aWxsIGFsc28KZm9sbG93IHRoZSBzZXF1ZW5jZSBzdHJpY3RseS4K
Cj4gCj4gVGhlIGxvY2tlZCBiaXQgaXMgcHJvYmFibHkgYSBnb29kIGlkZWEsIGJ1dCBvbmUgYXNw
ZWN0IG1pc3NpbmcgaGVyZSBpcwo+IHRoZSBjaGVjayB0byBzZWUgd2hldGhlciB0aGUgaHlwZXJj
YWxsIHBhZ2UgaXMgYWxyZWFkeSBlbmFibGVkLCB3aGljaCBJCj4gZXhwZWN0IGlzIGZvciBhIGtl
eGVjIGNyYXNoIHNjZW5hcmlvLgo+IAo+IEhvd2V2ZXIsIHRoZSBtb3N0IGltcG9ydGFudCBwb2lu
dCBpcyB0aGUgb25lIHdoaWNoIGRlc2NyaWJlcyB0aGUgI0dQCj4gcHJvcGVydGllcyBvZiB0aGUg
Z3Vlc3QgdHJ5aW5nIHRvIG1vZGlmeSB0aGUgcGFnZS7CoCBUaGlzIGNhbiBvbmx5IGJlCj4gYWNo
aWV2ZWQgd2l0aCBhbiBFUFQvTlBUIG1hcHBpbmcgbGFja2luZyB0aGUgVyBwZXJtaXNzaW9uLCB3
aGljaCB3aWxsCj4gc2hhdHRlciBob3N0IHN1cGVycGFnZXMuwqDCoCBUaGVyZWZvcmUsIHB1dHRp
bmcgaXQgaW4gLnRleHQgaXMgZ29pbmcgdG8gYmUKPiByYXRoZXIgcG9vciwgcGVyZiB3aXNlLgo+
IAo+IEkgYWxzbyBub3RlIHRoYXQgWGVuJ3MgaW1wbGVtZW50YXRpb24gb2YgdGhlIFZpcmlkaWFu
IGh5cGVyY2FsbCBwYWdlCj4gZG9lc24ndCBjb25mb3JtIHRvIHRoZXNlIHByb3BlcnRpZXMsIGFu
ZCB3YW50cyBmaXhpbmcuwqAgSXQgaXMgZ29pbmcgdG8KPiBuZWVkIGEgbmV3IGtpbmQgaWRlbnRp
ZmljYXRpb24gb2YgdGhlIHBhZ2UgKHByb2JhYmx5IGEgbmV3IHAybSB0eXBlKQo+IHdoaWNoIGlu
amVjdHMgI0dQIGlmIHdlIGV2ZXIgc2VlIGFuIEVQVF9WSU9MQVRJT04vTlBUX0ZBVUxUIGFnYWlu
c3QgaXQuCj4gCj4gQXMgZm9yIHN1Z2dlc3Rpb25zIGhlcmUsIEknbSBzdHJ1Z2dsaW5nIHRvIGZp
bmQgYW55IG1lbW9yeSBtYXAgZGV0YWlscwo+IGV4cG9zZWQgaW4gdGhlIFZpcmlkaWFuIGludGVy
ZmFjZSwgYW5kIHRoZXJlZm9yZSB3aGljaCBnZm4gaXMgYmVzdCB0bwo+IGNob29zZS7CoCBJIGhh
dmUgYSBzaW5raW5nIGZlZWxpbmcgdGhhdCB0aGUgYW5zd2VyIGlzIEFDUEkuLi4KClRMRlMgb25s
eSBzYXlzICJnbyBmaW5kIG9uZSBzdWl0YWJsZSBwYWdlIHlvdXJzZWxmIiB3aXRob3V0IGZ1cnRo
ZXIKaGludHMuCgpTaW5jZSB3ZSdyZSBzdGlsbCBxdWl0ZSBmYXIgYXdheSBmcm9tIGEgZnVuY3Rp
b25pbmcgc3lzdGVtLCBmaW5kaW5nIGEKbW9zdCBzdWl0YWJsZSBwYWdlIGlzbid0IG15IHRvcCBw
cmlvcml0eSBhdCB0aGlzIHBvaW50LiBJZiB0aGVyZSBpcyBhCnNpbXBsZSB3YXkgdG8gZXh0cmFw
b2xhdGUgc3VpdGFibGUgaW5mb3JtYXRpb24gZnJvbSBBQ1BJLCB0aGF0IHdvdWxkIGJlCmdyZWF0
LiBJZiBpdCByZXF1aXJlcyB3cml0aW5nIGEgc2V0IG9mIGZ1bmN0aW9uYWxpdGllcywgdGhhbiB0
aGF0IHdpbGwKbmVlZCB0byB3YWl0IHRpbGwgbGF0ZXIuCgpXZWkuCgo+IAo+IH5BbmRyZXcKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
