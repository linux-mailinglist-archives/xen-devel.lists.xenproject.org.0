Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBF37AB79
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 16:55:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsTUB-00031X-7h; Tue, 30 Jul 2019 14:52:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7rz3=V3=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1hsTUA-00031S-C2
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 14:52:18 +0000
X-Inumbo-ID: 9f852380-b2d9-11e9-8980-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9f852380-b2d9-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 14:52:17 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id v85so44902935lfa.6
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2019 07:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vLDKuH+/Y6R1wGAQGSCIi/9agKk/j9gR7pNqj2Ro2Ic=;
 b=iuQpUu6a8JnbGLjoBITZrEilnUrTWiH26PXOZvr0eJQhTGXYXPQKMEzNw2wB2Zdhwg
 O1s79fuH/+qKj9qM+F5N7WUORuY3bi2XPxK5gT8Guf2uZd9D6oyAtYDwhskz/FMsfn6o
 lKk6nD1IBmzrEbMo1z8fbSNSoKGZUfXjLfcnm5mKawQB8u+vap+bsQ1AUfdjGTiXN2ty
 tL6eFXIjDfZ571OcOPQwvXVAUX+46G+xpgSdufwNKOjBmDF3XP8A7mx0CfXSR6UXqbUn
 dguHNLtM+ir+qgid1b0WJ9SI3b8hxcX2P6U5NkAvYIDJKRzUwkVnKHJszs5C7d/SjcoV
 C0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vLDKuH+/Y6R1wGAQGSCIi/9agKk/j9gR7pNqj2Ro2Ic=;
 b=HDTgRG4EmVTPGa96tQ5/HcXr1fWYOnufmNSJuovNPAcEZORmUG9CVfg5S9QFMiEE2R
 SWO+Q9y73m9EYKwBiSc6ZqfFhUaO1Y7pXPVF9VTbW1V72pXHw+PdjnzYsdo4ckqLYSvl
 k6b8ROQN9jDEa+OyPCDJJOBlmkFyt9EQIFpglg94Idjru0vR9llSfRf13hHpbcflGbNk
 swY8ZEFlMf8zOvk6A8MhBJySJvTryiKxSKA35XeOaLTPrFbn3Ggrn7YuIeriBuMEP7DF
 00SozL+h6n2dUri8iiSHtIUN/2+VkFI9bqw5aLcVoNGCYiUTxun9a8hiVtG3o5+kAO1W
 l2WQ==
X-Gm-Message-State: APjAAAVhxLkRU/QJrQJBf4W2Hug0PCD/FqA3P/UHXxo0nQR1Sn/fDPe4
 LpgAb6fYCBb3Z8YGiiImkcw9ZKAYqPAZX5htf2s=
X-Google-Smtp-Source: APXvYqwtNV8PHczquSPB8e+BmF7PEr+3WvMBui8pMbhp0rAOkLkZq6TteMkvwzTbZj0eIDgOEAic/3pWWOYVMC6LbUU=
X-Received: by 2002:a19:c1cc:: with SMTP id r195mr53854149lff.95.1564498336043; 
 Tue, 30 Jul 2019 07:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190215024830.GA26477@jordon-HP-15-Notebook-PC>
 <20190728180611.GA20589@mail-itl>
 <CAFqt6zaMDnpB-RuapQAyYAub1t7oSdHH_pTD=f5k-s327ZvqMA@mail.gmail.com>
 <CAFqt6zY+07JBxAVfMqb+X78mXwFOj2VBh0nbR2tGnQOP9RrNkQ@mail.gmail.com>
 <20190729133642.GQ1250@mail-itl>
 <CAFqt6zZN+6r6wYJY+f15JAjj8dY+o30w_+EWH9Vy2kUXCKSBog@mail.gmail.com>
 <bf02becc-9db0-bb78-8efc-9e25cc115237@oracle.com>
 <20190730142233.GR1250@mail-itl>
In-Reply-To: <20190730142233.GR1250@mail-itl>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Tue, 30 Jul 2019 20:22:02 +0530
Message-ID: <CAFqt6zZOymx8RH75F69exukLYcGd45xpUHkRHK8nYXpwF8co6g@mail.gmail.com>
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [Xen-devel] [PATCH v4 8/9] xen/gntdev.c: Convert to use
 vm_map_pages()
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
Cc: Juergen Gross <jgross@suse.com>, Michal Hocko <mhocko@suse.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
 Linux-MM <linux-mm@kvack.org>, stable@vger.kernel.org,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 robin.murphy@arm.com, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgNzo1MiBQTSBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kKPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBK
dWwgMzAsIDIwMTkgYXQgMTA6MDU6NDJBTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+
ID4gT24gNy8zMC8xOSAyOjAzIEFNLCBTb3VwdGljayBKb2FyZGVyIHdyb3RlOgo+ID4gPiBPbiBN
b24sIEp1bCAyOSwgMjAxOSBhdCA3OjA2IFBNIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraQo+
ID4gPiA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4gd3JvdGU6Cj4gPiA+PiBPbiBN
b24sIEp1bCAyOSwgMjAxOSBhdCAwMjowMjo1NFBNICswNTMwLCBTb3VwdGljayBKb2FyZGVyIHdy
b3RlOgo+ID4gPj4+IE9uIE1vbiwgSnVsIDI5LCAyMDE5IGF0IDE6MzUgUE0gU291cHRpY2sgSm9h
cmRlciA8anJkci5saW51eEBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPj4+PiBPbiBTdW4sIEp1bCAy
OCwgMjAxOSBhdCAxMTozNiBQTSBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kKPiA+ID4+Pj4g
PG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+ID4gPj4+Pj4gT24gRnJp
LCBGZWIgMTUsIDIwMTkgYXQgMDg6MTg6MzFBTSArMDUzMCwgU291cHRpY2sgSm9hcmRlciB3cm90
ZToKPiA+ID4+Pj4+PiBDb252ZXJ0IHRvIHVzZSB2bV9tYXBfcGFnZXMoKSB0byBtYXAgcmFuZ2Ug
b2Yga2VybmVsCj4gPiA+Pj4+Pj4gbWVtb3J5IHRvIHVzZXIgdm1hLgo+ID4gPj4+Pj4+Cj4gPiA+
Pj4+Pj4gbWFwLT5jb3VudCBpcyBwYXNzZWQgdG8gdm1fbWFwX3BhZ2VzKCkgYW5kIGludGVybmFs
IEFQSQo+ID4gPj4+Pj4+IHZlcmlmeSBtYXAtPmNvdW50IGFnYWluc3QgY291bnQgKCBjb3VudCA9
IHZtYV9wYWdlcyh2bWEpKQo+ID4gPj4+Pj4+IGZvciBwYWdlIGFycmF5IGJvdW5kYXJ5IG92ZXJy
dW4gY29uZGl0aW9uLgo+ID4gPj4+Pj4gVGhpcyBjb21taXQgYnJlYWtzIGdudGRldiBkcml2ZXIu
IElmIHZtYS0+dm1fcGdvZmYgPiAwLCB2bV9tYXBfcGFnZXMKPiA+ID4+Pj4+IHdpbGw6Cj4gPiA+
Pj4+PiAgLSB1c2UgbWFwLT5wYWdlcyBzdGFydGluZyBhdCB2bWEtPnZtX3Bnb2ZmIGluc3RlYWQg
b2YgMAo+ID4gPj4+PiBUaGUgYWN0dWFsIGNvZGUgaWdub3JlcyB2bWEtPnZtX3Bnb2ZmID4gMCBz
Y2VuYXJpbyBhbmQgbWFwcGVkCj4gPiA+Pj4+IHRoZSBlbnRpcmUgbWFwLT5wYWdlc1tpXS4gV2h5
IHRoZSBlbnRpcmUgbWFwLT5wYWdlc1tpXSBuZWVkcyB0byBiZSBtYXBwZWQKPiA+ID4+Pj4gaWYg
dm1hLT52bV9wZ29mZiA+IDAgKGluIG9yaWdpbmFsIGNvZGUpID8KPiA+ID4+IHZtYS0+dm1fcGdv
ZmYgaXMgdXNlZCBhcyBpbmRleCBwYXNzZWQgdG8gZ250ZGV2X2ZpbmRfbWFwX2luZGV4LiBJdCdz
Cj4gPiA+PiBiYXNpY2FsbHkgKGFiKXVzaW5nIHRoaXMgcGFyYW1ldGVyIGZvciAid2hpY2ggZ3Jh
bnQgcmVmZXJlbmNlIHRvIG1hcCIuCj4gPiA+Pgo+ID4gPj4+PiBhcmUgeW91IHJlZmVycmluZyB0
byBzZXQgdm1hLT52bV9wZ29mZiA9IDAgaXJyZXNwZWN0aXZlIG9mIHZhbHVlIHBhc3NlZAo+ID4g
Pj4+PiBmcm9tIHVzZXIgc3BhY2UgPyBJZiB5ZXMsIHVzaW5nIHZtX21hcF9wYWdlc196ZXJvKCkg
aXMgYW4gYWx0ZXJuYXRlCj4gPiA+Pj4+IG9wdGlvbi4KPiA+ID4+IFllcywgdGhhdCBzaG91bGQg
d29yay4KPiA+ID4gSSBwcmVmZXIgdG8gdXNlIHZtX21hcF9wYWdlc196ZXJvKCkgdG8gcmVzb2x2
ZSBib3RoIHRoZSBpc3N1ZXMuIEFsdGVybmF0aXZlbHkKPiA+ID4gdGhlIHBhdGNoIGNhbiBiZSBy
ZXZlcnRlZCBhcyB5b3Ugc3VnZ2VzdGVkLiBMZXQgbWUga25vdyB5b3Ugb3BpbmlvbiBhbmQgd2Fp
dAo+ID4gPiBmb3IgZmVlZGJhY2sgZnJvbSBvdGhlcnMuCj4gPiA+Cj4gPiA+IEJvcmlzLCB3b3Vs
ZCB5b3UgbGlrZSB0byBnaXZlIGFueSBmZWVkYmFjayA/Cj4gPgo+ID4gdm1fbWFwX3BhZ2VzX3pl
cm8oKSBsb29rcyBnb29kIHRvIG1lLiBNYXJlaywgZG9lcyBpdCB3b3JrIGZvciB5b3U/Cj4KPiBZ
ZXMsIHJlcGxhY2luZyB2bV9tYXBfcGFnZXMoKSB3aXRoIHZtX21hcF9wYWdlc196ZXJvKCkgZml4
ZXMgdGhlCj4gcHJvYmxlbSBmb3IgbWUuCgpNYXJlaywgSSBjYW4gc2VuZCBhIHBhdGNoIGZvciB0
aGUgc2FtZSBpZiB5b3UgYXJlIG9rLgpXZSBuZWVkIHRvIGNjIHN0YWJsZSBhcyB0aGlzIGNoYW5n
ZXMgYXJlIGF2YWlsYWJsZSBpbiA1LjIuNC4KCj4KPiAtLQo+IEJlc3QgUmVnYXJkcywKPiBNYXJl
ayBNYXJjenlrb3dza2ktR8OzcmVja2kKPiBJbnZpc2libGUgVGhpbmdzIExhYgo+IEE6IEJlY2F1
c2UgaXQgbWVzc2VzIHVwIHRoZSBvcmRlciBpbiB3aGljaCBwZW9wbGUgbm9ybWFsbHkgcmVhZCB0
ZXh0Lgo+IFE6IFdoeSBpcyB0b3AtcG9zdGluZyBzdWNoIGEgYmFkIHRoaW5nPwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
