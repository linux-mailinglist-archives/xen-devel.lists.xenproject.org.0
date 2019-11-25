Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 229AB108F53
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 14:54:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZEmm-0006Hf-Ko; Mon, 25 Nov 2019 13:52:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BGRM=ZR=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1iZEml-0006HY-79
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 13:52:15 +0000
X-Inumbo-ID: c951dd90-0f8a-11ea-b08b-bc764e2007e4
Received: from mail-yw1-xc2a.google.com (unknown [2607:f8b0:4864:20::c2a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c951dd90-0f8a-11ea-b08b-bc764e2007e4;
 Mon, 25 Nov 2019 13:52:14 +0000 (UTC)
Received: by mail-yw1-xc2a.google.com with SMTP id q140so5426624ywg.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2019 05:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=VhvvJ3+Q/bThi6aXt84Dcs4ccgai0AE6IsAGyWcqrB8=;
 b=hgOPPjy38IaBNu/DFt+AZK41Bz7I+B2b3iO0e6gFdyDjmGuAZ0AASSa1ALkkOURGY6
 eGgZIvEaDC8876vHJUx2ve8qHNtnLedIbWChjDPNj2NwjUAVZlI9JtBcUbe3ag99K5Cy
 BJpRnaZi6zRvZuAl8UHS1zPXeeWvzN9ix62KU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=VhvvJ3+Q/bThi6aXt84Dcs4ccgai0AE6IsAGyWcqrB8=;
 b=Km5usEON19urallCi4yLnbRnC3MoWGPuCN/NaPqCWQGp6GJX4b94iCH0XfF3/1xMkY
 dC+xtFxFL4uSU0s+XpuTWuMYRsHIlkTEEPTZFEQLnQwWOdG7C2IgXLwMYxeP9fft5qMp
 nWaYcgKbT+mfhWwbOFyd1P5w4XARM+Igx1lLXF2b1gjAAhTermQ8jfbrZ0F3je+S+joW
 L9LGbnoOx/kLQYFradXDGOzVxz4iuPxt6wzODEUa8AZ3mcFmLXqfQ6UW9GMbufCr5BXx
 Y9GkZF2H5BW7m5YnHlDlXScn6VGlQE7E1CNt6nYbNFP/SgT02llzqvECn8H1GevmXKU4
 9NUQ==
X-Gm-Message-State: APjAAAU5uzHw61db72OZZJztGj+MKc6GXCxPdxl2JHmEURChHnc+9g38
 EGsNIQrL9NwVNzoPZ2vZkS1I6g==
X-Google-Smtp-Source: APXvYqwFGUZstFKN3eRTu6ACCpddpJmLNX253O2fdJkEUok/ajE73y/9qn3wRpPwMOQc/EkEEJRkjw==
X-Received: by 2002:a81:f004:: with SMTP id p4mr21463177ywm.335.1574689934206; 
 Mon, 25 Nov 2019 05:52:14 -0800 (PST)
Received: from doug-macbook.localdomain
 ([2600:1700:7b90:52f0:546b:4824:2cc1:3b48])
 by smtp.gmail.com with ESMTPSA id l76sm3693093ywl.24.2019.11.25.05.52.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Nov 2019 05:52:13 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <a1f4af5b-65f6-6ebf-37af-828cc7e6fff2@cardoe.com>
 <fa0dce89-fadf-e23a-3e71-f84ad7a98613@suse.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <b5a2fc2d-c330-fe68-cdd8-a0fb845905d1@cardoe.com>
Date: Mon, 25 Nov 2019 07:52:12 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <fa0dce89-fadf-e23a-3e71-f84ad7a98613@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] tools/tests/x86_emulator causes build failures with
 older but supported compilers
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMjUvMTkgNDo0NCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cgo+IE9uIDIzLjExLjIwMTkg
MTk6MDAsIERvdWcgR29sZHN0ZWluIHdyb3RlOgo+PiBQZXIgUkVBRE1FLCBHQ0MgNC4xLjIgc2hv
dWxkIGxlYWQgdG8gYSBzdWNjZXNzZnVsIGRlZmF1bHQgIm1ha2UgaW5zdGFsbCIKPj4gcGVyIElO
U1RBTEwuIEN1cnJlbnRseSB0aGlzIGlzIGZhaWxpbmcgZHVlIHRvIHRvb2xzL3Rlc3RzL3g4Nl9l
bXVsYXRvcgo+PiBiZWluZyBpbiB0aGUgZGVmYXVsdCBwYXRoIGFuZCByZXF1aXJpbmcgYSBjb21w
aWxlciB3aXRoIEFWWC4gR0NDIDQuNC43Cj4+IG9uIENlbnRPUyA2IGRvZXMgbm90IGhhdmUgdGhp
cyBsZWFkaW5nIHRvIGEgZmFpbHVyZSB0byBidWlsZC4KPj4KPj4gMTI2NSBtYWtlWzVdOiBFbnRl
cmluZyBkaXJlY3RvcnkgYC9idWlsZHMveGVuLXByb2plY3QveGVuL3Rvb2xzL3Rlc3RzJwo+PiAx
MjY2IG1ha2UgLUMgeDg2X2VtdWxhdG9yIGluc3RhbGwKPj4gMTI2NyBjYzE6IGVycm9yOiB1bnJl
Y29nbml6ZWQgY29tbWFuZCBsaW5lIG9wdGlvbiAiLW1hdngyIgo+PiAxMjY4IGNjMTogZXJyb3I6
IHVucmVjb2duaXplZCBjb21tYW5kIGxpbmUgb3B0aW9uICItbWF2eDUxMmYiCj4+IDEyNjkgY2Mx
OiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQgbGluZSBvcHRpb24gIi1tYXZ4NTEyYnciCj4+
IDEyNzAgY2MxOiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQgbGluZSBvcHRpb24gIi1tYXZ4
NTEyZHEiCj4+IDEyNzEgY2MxOiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQgbGluZSBvcHRp
b24gIi1tYXZ4NTEyZXIiCj4+IDEyNzIgY2MxOiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQg
bGluZSBvcHRpb24gIi1tYXZ4NTEydmJtaSIKPj4gMTI3MyAvdG1wL2NjTWtMcFRWLnM6IEFzc2Vt
YmxlciBtZXNzYWdlczoKPj4gMTI3NCAvdG1wL2NjTWtMcFRWLnM6MzogRXJyb3I6IGp1bmsgYXQg
ZW5kIG9mIGxpbmUsIGZpcnN0IHVucmVjb2duaXplZAo+PiBjaGFyYWN0ZXIgaXMgYHsnCj4gVGhl
c2UgYXJlIGVycm9ycywgeWVzLCBidXQgLi4uCj4KPj4gMTI3NSBtYWtlWzZdOiBFbnRlcmluZyBk
aXJlY3RvcnkKPj4gYC9idWlsZHMveGVuLXByb2plY3QveGVuL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVs
YXRvcicKPj4gMTI3NiBNYWtlZmlsZToxMTY6IFRlc3QgaGFybmVzcyBub3QgYnVpbHQsIHVzZSBu
ZXdlciBjb21waWxlciB0aGFuICJnY2MiCj4+ICh2ZXJzaW9uIDQuNC43KSBhbmQgYW4gIntldmV4
fSIgY2FwYWJsZSBhc3NlbWJsZXIKPj4gMTI3NyBtYWtlWzZdOiBOb3RoaW5nIHRvIGJlIGRvbmUg
Zm9yIGBpbnN0YWxsJy4KPiAuLi4gdGhlcmUncyBubyBidWlsZCBmYWlsdXJlIGhlcmUgYWZhaWNz
LCBhbmQgdGhpcyBpcyB0aGUgaW50ZW5kZWQKPiB3YXkgb2YgaG93IHRoaW5ncyBhcmUgdG8gd29y
ay4KClRoZSB0cmVlIGlzIGludGVuZGVkIHRvIGJ1aWxkIHdpdGggYSBkZWZhdWx0ICJtYWtlIGlu
c3RhbGwiIHdpdGggYSAKc3VwcG9ydGVkIHNldCBvZiB0b29scyBmcm9tIFJFQURNRS4gVGhpcyBp
cyBwYXJ0IG9mIHRoZSBjb252ZXJzYXRpb25zIAp3ZSd2ZSBoYWQgaW4gdGhlIHBhc3QgYWJvdXQg
d2hhdCBzaG91bGQgYmUgdHJlYXRlZCBhcyBwcm9wZXIgYW5kIGl0IHdhcyAKdW5pdmVyc2FsbHkg
YWdyZWVkLgoKPj4gMi4gRml4IHRoZSBkZWZhdWx0IGJ1aWxkIHRvIHdvcmsgd2l0aCBvbGRlciBH
Q0MgdmVyc2lvbnMuCj4gTm90IGEgcmVhc29uYWJsZSBvcHRpb24gZWl0aGVyLCBhcyBpdCB3b3Vs
ZCBiZSBjbHV0dGVyaW5nIHRoZSBoYXJuZXNzCj4gd2l0aCBhbGwgc29ydHMgb2YgI2lmZGVmLXMg
b3IgYWJzdHJhY3Rpbmcgd3JhcHBlcnMsIG1ha2luZyBpdCBldmVuCj4gbW9yZSBkaWZmaWN1bHQg
dG8gbWFrZSBjaGFuZ2VzIHRvIGl0Lgo+Cj4gV2hhdCB3YXMgY29uc2lkZXJlZCBpbiB0aGUgcGFz
dCB3YXMgdG8gc2tpcCBidWlsZGluZyBvZiB0ZXN0cy8gYXMgYQo+IHdob2xlIGluIG5vbi1kZWJ1
ZyBidWlsZHM7IGRvbid0IGtub3cgd2hhdCBoYXMgY29tZSBvZiB0aGlzLiBJdCBpcwo+IHByb2Jh
Ymx5IHRlbGxpbmcgZW5vdWdoIHRoYXQgdGhlIGJvdHRvbSBvZiAuL0NvbmZpZy5tayByZWFkcyBs
aWtlIHRoaXM6Cj4KPiAjIFNob3J0IGFuc3dlciAtLSBkbyBub3QgZW5hYmxlIHRoaXMgdW5sZXNz
IHlvdSBrbm93IHdoYXQgeW91IGFyZQo+ICMgZG9pbmcgYW5kIGFyZSBwcmVwYXJlZCBmb3Igc29t
ZSBwYWluLgo+Cj4gQ09ORklHX1RFU1RTICAgICAgID89IHkKVGhlbiB0aGlzIGlzIHdoYXQgdGhl
IGRlZmF1bHQgb2YgdGhlIHRyZWUgc2hvdWxkIGJlLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
