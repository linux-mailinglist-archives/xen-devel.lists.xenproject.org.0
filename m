Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A789A181B6E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 15:36:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC2Px-0002NU-7f; Wed, 11 Mar 2020 14:33:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8QTE=44=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jC2Pv-0002NP-PF
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 14:33:03 +0000
X-Inumbo-ID: 369ba476-63a5-11ea-92cf-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 369ba476-63a5-11ea-92cf-bc764e2007e4;
 Wed, 11 Mar 2020 14:33:03 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id o10so2560520ljc.8
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2020 07:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6kc2edplrqyMbJfDXW0Dt0fKhuQh8wvnYIoohoVWG2k=;
 b=VJ/Lkta7vKteiwwMCHJBZifZLF5Io/gqgUAkySIyd0M7k0fLEvw92u/0Ug0Hi3FLYM
 rhWchO2zubFp6IfqLtGQAQHkwFsZjql6e1bNdYfAr3I8RxAv+Hp3OavOpPkn/gAS9n/t
 svNeG/dwqn1eTMokrElh2P2ILyji7PYIRkfzTO/fNZCDI3Dhg6iGL1f+dkWNXywTTUGD
 +/u2Z7hAtdj22qlRaxPec9MsaC0no2JPzhFVquMTHBpfKfxxj49Yks7Dai41a7wSIwtV
 xCXmwcs6I9ez4T6lo76aJVnd3Hn9rwpaXAO+otHhqvIq6fhQqtLfRFwduMQvnF1Ads83
 tlkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6kc2edplrqyMbJfDXW0Dt0fKhuQh8wvnYIoohoVWG2k=;
 b=W+TjRTU5xk0yryVR9Omx88aFNJM8uBGXhJpql7QNyBuKAyhKeuF6javkz6IZgkDuoz
 +64+L0/MEgV4F8vg9WWsmQT0geQOAZ4XCVR4ZQ/20ThsievMiH+M/K5E+zqg83W1KnU9
 B35j+sX5PFqRaoEmCFrMwpILLKoIREoEv41mjiZ9qZAj8xkr4cWIb1j431MK3J2FX73y
 h93qD5PUmAp5gSB7iFKItLfbHm1IvTL4OGNqpNJq9DcnH3Rz9xuX7KFxxyAFq05YW4Xd
 JT5VMEwqs6fuIf7R5Cyk6nwsHl9KLM5bSWmPobU1UPkYGG5EzxMKtWroiA+3a2qPPhyO
 JtZg==
X-Gm-Message-State: ANhLgQ2iMW2nNP1pxqRB/ihZLHkGxKawb34zYk2PYnTvqniOqVjudtVS
 6cHSz3nOR4D/v1OIsEJLp05bTr4MEmdM0NaXyh0=
X-Google-Smtp-Source: ADFU+vvEVVBTCt1kTWpJL9yjFC6xmoZM3ECbfqtanvmMWfHAvIGFdAJ667x7vJITHgKHtoS+kqcnvnuYS0GfJdmRWs0=
X-Received: by 2002:a2e:891a:: with SMTP id d26mr2247234lji.182.1583937182021; 
 Wed, 11 Mar 2020 07:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200309144932.866097-1-george.dunlap@citrix.com>
 <20200309144932.866097-2-george.dunlap@citrix.com>
In-Reply-To: <20200309144932.866097-2-george.dunlap@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Wed, 11 Mar 2020 10:32:50 -0400
Message-ID: <CAEBZRSe7njLURzYJ4O1Bj=RDC5jkdQMq4gz9+ccCT2+Ds2-5jg@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v4 2/3] golang/xenlight: Notify xenlight of
 SIGCHLD
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBsaWJ4bCBmb3JrcyBleHRlcm5hbCBwcm9jZXNzZXMgYW5kIHdhaXRzIGZvciB0aGVtIHRvIGNv
bXBsZXRlOyBpdAo+IHRoZXJlZm9yZSBuZWVkcyB0byBiZSBub3RpZmllZCB3aGVuIGNoaWxkcmVu
IGV4aXQuCj4KPiBJbiBhYnNlbmNlIG9mIGluc3RydWN0aW9ucyB0byB0aGUgY29udHJhcnksIGxp
YnhsIHNldHMgdXAgaXRzIG93bgo+IFNJR0NITEQgaGFuZGxlcnMuCj4KPiBHb2xhbmcgYWx3YXlz
IHVubWFza3MgYW5kIGhhbmRsZXMgU0lHQ0hMRCBpdHNlbGYuICBsaWJ4bCB0aGFua2Z1bGx5Cj4g
bm90aWNlcyB0aGlzIGFuZCB0aHJvd3MgYW4gYXNzZXJ0KCkgcmF0aGVyIHRoYW4gY2xvYmJlcmlu
ZyBTSUdDSExECj4gaGFuZGxlcnMuCj4KPiBUZWxsIGxpYnhsIHRoYXQgd2UnbGwgYmUgcmVzcG9u
c2libGUgZm9yIGdldHRpbmcgU0lHQ0hMRCBub3RpZmljYXRpb25zCj4gdG8gaXQuICBBcnJhbmdl
IGZvciBhIGNoYW5uZWwgaW4gdGhlIGNvbnRleHQgdG8gcmVjZWl2ZSBub3RpZmljYXRpb25zCj4g
b24gU0lHQ0hMRCwgYW5kIHNldCB1cCBhIGdvcm91dGluZSB0aGF0IHdpbGwgcGFzcyB0aGVzZSBv
biB0byBsaWJ4bC4KPgo+IE5CIHRoYXQgZXZlcnkgbGlieGwgY29udGV4dCBuZWVkcyBhIG5vdGlm
aWNhdGlvbjsgc28gbXVsdGlwbGUgY29udGV4dHMKPiB3aWxsIGVhY2ggc3BpbiB1cCB0aGVpciBv
d24gZ29yb3V0aW5lIHdoZW4gb3BlbmluZyBhIGNvbnRleHQsIGFuZCBzaHV0Cj4gaXQgZG93biBv
biBjbG9zZS4KPgo+IGxpYnhsIGFsc28gd2FudHMgdG8gaG9sZCBvbiB0byBhIGNvbnN0IHBvaW50
ZXIgdG8KPiB4ZW5saWdodF9jaGlsZHByb2NfaG9va3MgcmF0aGVyIHRoYW4gZG8gYSBjb3B5OyBz
byBtYWtlIGEgZ2xvYmFsCj4gc3RydWN0dXJlIGluIEMgc3BhY2UuICBNYWtlIGl0IGBzdGF0aWMg
Y29uc3RgLCBqdXN0IGZvciBleHRyYSBzYWZldHk7Cj4gdGhpcyByZXF1aXJlcyBtYWtpbmcgYSBm
dW5jdGlvbiBpbiB0aGUgQyBzcGFjZSB0byBwYXNzIGl0IHRvIGxpYnhsLgo+Cj4gV2hpbGUgaGVy
ZSwgYWRkIGEgZmV3IGNvbW1lbnRzIHRvIG1ha2UgdGhlIGNvbnRleHQgc2V0LXVwIGEgYml0IGVh
c2llcgo+IHRvIGZvbGxvdy4KPgo+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3Jn
ZS5kdW5sYXBAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBOaWNrIFJvc2Jyb29rIDxyb3Nicm9v
a25AYWluZm9zZWMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
