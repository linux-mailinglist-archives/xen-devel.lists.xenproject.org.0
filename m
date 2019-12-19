Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 299B3127149
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 00:14:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ii4vE-0001P7-LK; Thu, 19 Dec 2019 23:09:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yrdy=2J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ii4vD-0001P2-3D
 for xen-devel@lists.xen.org; Thu, 19 Dec 2019 23:09:31 +0000
X-Inumbo-ID: 9c040614-22b4-11ea-92bf-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c040614-22b4-11ea-92bf-12813bfff9fa;
 Thu, 19 Dec 2019 23:09:30 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b6so7667067wrq.0
 for <xen-devel@lists.xen.org>; Thu, 19 Dec 2019 15:09:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b7KGnBJ1FDH45B/EW83WW/zEM5+X0Jg5/CfssdvLyHI=;
 b=huw10pmISl9Cy62ZRVeykrqZWUcBauJWCwQNkk4qRmjpbw5kvPcXH4/S0k7MyDZ2NF
 JUTHsRKairARHgDE6M6v32+mloUES45a4mevD1wZnmHZgXd0iyZ0+MKGPVE8hSpH0gCM
 wf1a/76g4W9jApZXZ0XBKy4wds8VMZ6yybRxn3klyr6zrnQlpDGOPbwJPYydZpxVB5EN
 LrzXTe2lZB94RwDTxmjsYE5KLdZIexz/XGIFKbRv3+V0T8ZU0LixzL3OUXDEZgz5ge6H
 whgpVZZ72aSzgE/Qm/N3K9W2NgunWKyVY966av1MErvYJfeSc3h6hdZkiFLtLJOInK2w
 9ZfQ==
X-Gm-Message-State: APjAAAV5ELhZ7nhjJ980XB/oKHYLS6cZH88XoC3Mz1IJ9wCGlJqMJM89
 A3FvPeObCMRF9BoMu0gDjjs=
X-Google-Smtp-Source: APXvYqwDyNE2heC83x9YQxdju8NI6yaBb22ggwrl5B6K6jtxRh9wuxvGZ2+894nTbNKBG3rwSWMtvg==
X-Received: by 2002:adf:ef92:: with SMTP id d18mr11500927wro.234.1576796969054; 
 Thu, 19 Dec 2019 15:09:29 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com
 (cpc91200-cmbg18-2-0-cust94.5-4.cable.virginm.net. [81.100.41.95])
 by smtp.gmail.com with ESMTPSA id r68sm7670503wmr.43.2019.12.19.15.09.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2019 15:09:28 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20191217154625.31561-1-sergey.dyasli@citrix.com>
 <a5e3c4b7-40f4-017b-1154-d75f92075597@suse.com>
 <65aecab1-a1b0-f02e-be92-cda3cd37b9e5@citrix.com>
 <e997ff3e-4260-c872-0166-3885ce1a4ee1@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <03009222-8521-19a7-79b3-ff74450a6543@xen.org>
Date: Thu, 19 Dec 2019 23:09:27 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <e997ff3e-4260-c872-0166-3885ce1a4ee1@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxOS8xMi8yMDE5IDExOjM1LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAxOS4xMi4y
MDE5IDEyOjIzLCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+PiBPbiAxOC8xMi8yMDE5IDExOjA2LCBK
YW4gQmV1bGljaCB3cm90ZToKPj4+IE9uIDE3LjEyLjIwMTkgMTY6NDYsIFNlcmdleSBEeWFzbGkg
d3JvdGU6Cj4+Pj4gSGlkZSB0aGUgZm9sbG93aW5nIGluZm9ybWF0aW9uIHRoYXQgY2FuIGhlbHAg
aWRlbnRpZnkgdGhlIHJ1bm5pbmcgWGVuCj4+Pj4gYmluYXJ5IHZlcnNpb246Cj4+Pj4KPj4+PiAg
ICAgIFhFTlZFUl9leHRyYXZlcnNpb24KPj4+PiAgICAgIFhFTlZFUl9jb21waWxlX2luZm8KPj4+
PiAgICAgIFhFTlZFUl9jYXBhYmlsaXRpZXMKPj4+Cj4+PiBXaGF0J3Mgd3Jvbmcgd2l0aCBleHBv
c2luZyB0aGlzIG9uZT8KPj4KPj4gZXh0cmF2ZXJzaW9uIGNhbiBoZWxwIGlkZW50aWZ5IHRoZSBl
eGFjdCBydW5uaW5nIFhlbiBiaW5hcnkgKGFuZCBJIG11c3QKPj4gc2F5IHRoYXQgYXQgQ2l0cml4
IHdlIGFkZCBzb21lIGFkZGl0aW9uYWwgdmVyc2lvbiBpbmZvcm1hdGlvbiB0aGVyZSkuCj4+IGNv
bXBpbGVfaW5mbyB3aWxsIGlkZW50aWZ5IGNvbXBpbGVyIGFuZCBtYW55IHNwZWN1bGF0aXZlIG1p
dGlnYXRpb25zCj4+IGFyZSBwcm92aWRlZCBieSBjb21waWxlcnMgdGhlc2UgZGF5cy4gTm90IHN1
cmUgaWYgaXQncyB3b3J0aCBoaWRpbmcKPj4gY2FwYWJpbGl0aWVzLCBidXQgT1RPSCBJIGRvbid0
IHNlZSBob3cgZ3Vlc3RzIGNvdWxkIG1lYW5pbmdmdWxseSB1c2UgaXQuCj4gCj4gV2VsbCwgbXkg
cXVlc3Rpb24gKHVzaW5nICJ0aGlzIiwgbm90ICJ0aGVzZSIpIHdhcyByZWFsbHkgbWFpbmx5IG9u
Cj4gdGhlIGxhc3QgaXRlbS4gSSBjYW4gc2VlIGhvdyBleHRyYXZlcnNpb24gY2FuIHByb3ZpZGUg
Y2x1ZXMuIEknbQo+IGhhdmluZyBkaWZmaWN1bHR5IHNlZWluZyBob3cgdGhlIGNvbXBpbGVyIChs
aXR0bGUgYml0IG9mKSBkZXRhaWxzCj4gY2FuIHByb3ZpZGUgc3VmZmljaWVudCBpbmZvcm1hdGlv
biB0byBiZWNvbWUgbGV2ZXJhZ2FibGUuCj4gCj4+Pj4gICAgICBYRU5WRVJfY2hhbmdlc2V0Cj4+
Pj4gICAgICBYRU5WRVJfY29tbWFuZGxpbmUKPj4+PiAgICAgIFhFTlZFUl9idWlsZF9pZAo+Pj4+
Cj4+Pj4gUmV0dXJuIGEgbW9yZSBjdXN0b21lciBmcmllbmRseSBlbXB0eSBzdHJpbmcgaW5zdGVh
ZCBvZiAiPGRlbmllZD4iCj4+Pj4gd2hpY2ggd291bGQgYmUgc2hvd24gaW4gdG9vbHMgbGlrZSBk
bWlkZWNvZGUuPgo+Pj4gSSB0aGluayAiPGRlbmllZD4iIGlzIHF1aXRlIGZpbmUgZm9yIG1hbnkg
b2YgdGhlIG9yaWdpbmFsIHB1cnBvc2VzLgo+Pj4gTWF5YmUgaXQgd291bGQgYmUgYmV0dGVyIHRv
IGZpbHRlciBmb3IgdGhpcyB3aGVuIHBvcHVsYXRpbmcgZ3Vlc3QKPj4+IERNSSB0YWJsZXM/Cj4+
Cj4+IEkgZG9uJ3Qga25vdyBob3cgRE1JIHRhYmxlcyBhcmUgcG9wdWxhdGVkLCBidXQgbm90aGlu
ZyBzdG9wcyBhIGd1ZXN0Cj4+IGZyb20gdXNpbmcgdGhlc2UgaHlwZXJjYWxscyBkaXJlY3RseS4K
PiAKPiBBbmQgdGhpcyBpcyBwcmVjaXNlbHkgdGhlIGNhc2Ugd2hlcmUgSSB0aGluayAiPGRlbmll
ZD4iIGlzIGJldHRlcgo+IHRoYW4gYW4gZW1wdHkgc3RyaW5nLgoKKzEuIFRoZSBtb3JlIHRoZSBi
ZWhhdmlvciB3b3VsZCBjaGFuZ2UgZm9yIHRvb2xzIGNoZWNraW5nIHdoZXRoZXIgdGhlIApzdHJp
bmcgaXMgdmFsaWQgKGkuZSAhPSAiPGRlbmllZD4iKS4KCj4gCj4+Pj4gICAgICAgICAgIHJldHVy
biB4c21fZGVmYXVsdF9hY3Rpb24oWFNNX0hPT0ssIGN1cnJlbnQtPmRvbWFpbiwgTlVMTCk7Cj4+
Pj4gKwo+Pj4+ICsgICAgY2FzZSBYRU5WRVJfZXh0cmF2ZXJzaW9uOgo+Pj4+ICsgICAgY2FzZSBY
RU5WRVJfY29tcGlsZV9pbmZvOgo+Pj4+ICsgICAgY2FzZSBYRU5WRVJfY2FwYWJpbGl0aWVzOgo+
Pj4+ICsgICAgY2FzZSBYRU5WRVJfY2hhbmdlc2V0Ogo+Pj4+ICsgICAgY2FzZSBYRU5WRVJfY29t
bWFuZGxpbmU6Cj4+Pj4gKyAgICBjYXNlIFhFTlZFUl9idWlsZF9pZDoKPj4+PiAgICAgICBkZWZh
dWx0Ogo+Pj4KPj4+IFRoZXJlJ3Mgbm8gbmVlZCB0byBhZGQgYWxsIG9mIHRoZXNlIG5leHQgdG8g
dGhlIGRlZmF1bHQgY2FzZS4KPj4+IE5vdGUgaG93IGNvbW1hbmRsaW5lIGFuZCBidWlsZF9pZCBo
YXZlIGJlZW4gY29taW5nIGhlcmUgYWxyZWFkeQo+Pj4gKGFuZCB0aGVyZSB3b3VsZCBuZWVkIHRv
IGJlIGZ1cnRoZXIganVzdGlmaWNhdGlvbiBmb3IgZXhwb3NpbmcKPj4+IHRoZW0gb24gZGVidWcg
YnVpbGRzLCBzaG91bGQgdGhpcyBxdWVzdGlvbmFibGUgYmVoYXZpb3IgLSBzZWUKPj4+IGFib3Zl
IC0gYmUgcmV0YWluZWQpLgo+Pgo+PiBJIGZpbmQgdGhhdCBleHBsaWNpdGx5IGxpc3RpbmcgYWxs
IHRoZSBjYXNlcyBpcyBiZXR0ZXIgZm9yIGNvZGUKPj4gcmVhZGFiaWxpdHksIGJ1dCBJIGRvbid0
IGhhdmUgYSBzdHJvbmcgb3BpbmlvbiBoZXJlLgo+IAo+IFdlbGwsIEknbSB2aWV3aW5nIGl0IGtp
bmQgb2YgdGhlIG9wcG9zaXRlLCBhcyBiZWluZyB1bm5lY2Vzc2FyeQo+IGNsdXR0ZXIgKGFuZCBo
ZW5jZSBoYXJtaW5nIHJlYWRhYmlsaXR5KS4gV2UnbGwgc2VlIHdoYXQgb3RoZXJzCj4gdGhpbmsu
CkkgYW0gb24gU2VyZ2V5IHNpZGUgaGVyZSwgd2l0aCBhICJkZWZhdWx0IiBsYWJlbCB5b3UgaGF2
ZSB0byBjaGVjayB3aGF0IApmYWxscyB1bmRlciBpdC4gU28gZXhwbGljaXQgY2FzZSBtYWtlcyBl
YXNpZXIgdG8gZmluZCBvdXQgaG93IGVhY2ggCmh5cGVyY2FsbHMgYXJlIGRlYWx0IHdpdGguCgpD
aGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
