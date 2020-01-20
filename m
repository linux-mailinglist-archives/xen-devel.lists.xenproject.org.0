Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADC3143042
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 17:50:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itaCr-000092-VL; Mon, 20 Jan 2020 16:47:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vx53=3J=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1itaCq-00008x-Uk
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 16:47:17 +0000
X-Inumbo-ID: 81346406-3ba4-11ea-b99f-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81346406-3ba4-11ea-b99f-12813bfff9fa;
 Mon, 20 Jan 2020 16:47:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1579538832; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=8sxssoyiZYnP7hRXt2yX7Gd/h/eJZgKymCz1IlGVDVg=;
 b=MgXWW2GNUdC+2B3yRrIdVJeGAOLAeUL/BvSYspJ2uMwkBQjBQfxQl2jcA1gareJHPFQQEhHj
 FIvpKNbUm7aPFe5ZctB6L2axjB6LF3c65lhCZ3HQT8Xb/zv2vRbJrhd4Avtxb9A/hU97XDMD
 hg5bixGaqbLoZ5u9cErWOrFzq0c=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mxa.mailgun.org with ESMTP id 5e25d98d.7f8443b80930-smtp-out-n03;
 Mon, 20 Jan 2020 16:47:09 -0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id b19so2218wmj.4
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2020 08:47:09 -0800 (PST)
X-Gm-Message-State: APjAAAUpJgWGHlqvtSnSRbB/diCYoPYm6PGbzKmJqbK6v73SQIKddY1+
 lc70eUhqtOKe3iCYYyUuhVKNWre9yYIgs1BvAiU=
X-Google-Smtp-Source: APXvYqyvtaFZu0TpV0GLIfSmfeCOE8a1aewuoeNMlimTOWIUL2e9I9Vk3BTz1KvGdcGKsia+a+L8DsREJ0yjRpjeoco=
X-Received: by 2002:a7b:cbcc:: with SMTP id n12mr227880wmi.186.1579538827944; 
 Mon, 20 Jan 2020 08:47:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <a74d4a8de609dfba8b561b7ba0795b22e754fa0b.1578503483.git.tamas.lengyel@intel.com>
 <ab45f909-9463-2c6f-1a60-7e541663b1bc@suse.com>
In-Reply-To: <ab45f909-9463-2c6f-1a60-7e541663b1bc@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 20 Jan 2020 09:46:33 -0700
X-Gmail-Original-Message-ID: <CABfawhnR=_XLm6YvduSpVEb6cPiLb15=KUCJt_agL7vPZj92bA@mail.gmail.com>
Message-ID: <CABfawhnR=_XLm6YvduSpVEb6cPiLb15=KUCJt_agL7vPZj92bA@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v4 14/18] x86/mem_sharing: check page type
 count earlier
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjAsIDIwMjAgYXQgOTozNCBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMDguMDEuMjAyMCAxODoxNCwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gLS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKPiA+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jCj4gPiBAQCAtNjUyLDE5ICs2NTIsMTggQEAgc3Rh
dGljIGludCBwYWdlX21ha2Vfc2hhcmFibGUoc3RydWN0IGRvbWFpbiAqZCwKPiA+ICAgICAgICAg
IHJldHVybiAtRUJVU1k7Cj4gPiAgICAgIH0KPiA+Cj4gPiAtICAgIC8qIENoYW5nZSBwYWdlIHR5
cGUgYW5kIGNvdW50IGF0b21pY2FsbHkgKi8KPiA+IC0gICAgaWYgKCAhZ2V0X3BhZ2VfYW5kX3R5
cGUocGFnZSwgZCwgUEdUX3NoYXJlZF9wYWdlKSApCj4gPiArICAgIC8qIENoZWNrIGlmIHBhZ2Ug
aXMgYWxyZWFkeSB0eXBlZCBhbmQgYmFpbCBlYXJseSBpZiBpdCBpcyAqLwo+ID4gKyAgICBpZiAo
IChwYWdlLT51LmludXNlLnR5cGVfaW5mbyAmIFBHVF9jb3VudF9tYXNrKSAhPSAxICkKPiA+ICAg
ICAgewo+ID4gICAgICAgICAgc3Bpbl91bmxvY2soJmQtPnBhZ2VfYWxsb2NfbG9jayk7Cj4gPiAt
ICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ICsgICAgICAgIHJldHVybiAtRUVYSVNUOwo+ID4g
ICAgICB9Cj4gPgo+ID4gLSAgICAvKiBDaGVjayBpdCB3YXNuJ3QgYWxyZWFkeSBzaGFyYWJsZSBh
bmQgdW5kbyBpZiBpdCB3YXMgKi8KPiA+IC0gICAgaWYgKCAocGFnZS0+dS5pbnVzZS50eXBlX2lu
Zm8gJiBQR1RfY291bnRfbWFzaykgIT0gMSApCj4gPiArICAgIC8qIENoYW5nZSBwYWdlIHR5cGUg
YW5kIGNvdW50IGF0b21pY2FsbHkgKi8KPiA+ICsgICAgaWYgKCAhZ2V0X3BhZ2VfYW5kX3R5cGUo
cGFnZSwgZCwgUEdUX3NoYXJlZF9wYWdlKSApCj4gPiAgICAgIHsKPiA+ICAgICAgICAgIHNwaW5f
dW5sb2NrKCZkLT5wYWdlX2FsbG9jX2xvY2spOwo+ID4gLSAgICAgICAgcHV0X3BhZ2VfYW5kX3R5
cGUocGFnZSk7Cj4gPiAtICAgICAgICByZXR1cm4gLUVFWElTVDsKPiA+ICsgICAgICAgIHJldHVy
biAtRUlOVkFMOwo+ID4gICAgICB9Cj4KPiBJdCB3b3VsZCBzZWVtIHRvIG1lIHRoYXQgZWl0aGVy
IHRoZSBvcmlnaW5hbCBvciB0aGUgbmV3IGNvZGUgY2Fubm90Cj4gaGF2ZSB3b3JrZWQgLyB3b3Jr
OiBUaGUgb3JpZ2luYWwgdmFyaWFudCBjaGVja2VkIHRoZSBjb3VudCBfYWZ0ZXJfCj4gaGF2aW5n
IGluY3JlbWVudGVkIGl0LCBpLmUuIGl0IGV4cGVjdGVkIGEgMC0+MSB0cmFuc2l0aW9uLiBUaGUg
bmV3Cj4gY29kZSBjaGVja3MgdGhhdCB0aGUgY291bnQgaXMgMSBfYmVmb3JlXyBkb2luZyB0aGUg
Z2V0Lgo+Cj4gSG93ZXZlciwgZXZlbiBpZiB0aGlzIHdhcyBjaGFuZ2VkIHRvCj4KPiAgICAgaWYg
KCBwYWdlLT51LmludXNlLnR5cGVfaW5mbyAmIFBHVF9jb3VudF9tYXNrICkKPgo+IEkgd291bGQg
cmVjb21tZW5kIGFnYWluc3QgdGhlIGNoYW5nZTogQWl1aSB5b3UgYnVpbGQgdXBvbiB0aGUgZmFj
dAo+IHRoYXQgYSB0cmFuc2l0aW9uIHRvIFBHVF9zaGFyZWRfcGFnZSBjYW4gaGFwcGVuIG9ubHkg
aGVyZSwgYW5kIHRoaXMKPiBjb2RlIGhvbGRzIGQtPnBhZ2VfYWxsb2NfbG9jay4gQnV0IGltbyB0
aGlzIGlzIG1ha2luZyB0aGUgY29kZSBtb3JlCj4gZnJhZ2lsZS4gSW4gZmFjdCBJIGNhbid0IGVh
c2lseSBzZWUgd2h5IHRoZSBvdGhlciB0d28gY2FzZXMgd2hlcmUKPiBQR1Rfc2hhcmVkX3BhZ2Ug
Z2V0cyBwYXNzZWQgdG8gZ2V0X3BhZ2VfYW5kX3R5cGUoKSBjYW4ndCBhbHNvCj4gZWZmZWN0IGEg
MC0+MSB0cmFuc2l0aW9uLiBJIGNhbiBvbmx5IGd1ZXNzIGZyb20gdGhlaXIgQlVHX09OKCktcwo+
IHRoYXQgdGhleSBhc3N1bWUgYSByZWZlcmVuY2Ugd2FzIGFscmVhZHkgYWNxdWlyZWQgc29tZXdo
ZXJlIGVsc2UuCgpIbSwgcmlnaHQsIGl0IGNlcnRhaW5seSBsb29rcyBsaWtlIHRoaXMgcGF0Y2gg
aXNuJ3QgbmVlZGVkLiBJdCBoYXMKYmVlbiBhIHdoaWxlIG5vdyBhbmQgSSBkb24ndCByZWNhbGwg
d2h5IGV4YWN0bHkgSSB3YXMgbW92aW5nIHRoZSB0eXBlCmNvdW50IGNoZWNrLCBpdCBtaWdodCBo
YXZlIGp1c3QgYmVlbiB3aGlsZSBJIHdhcyBleHBlcmltZW50aW5nIGFuZCBpdApuZXZlciBnb3Qg
cmV2ZXJ0ZWQuCgpUaGFua3MsClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
