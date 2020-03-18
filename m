Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E097F189D09
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 14:32:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEYlk-0001al-C8; Wed, 18 Mar 2020 13:30:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fuWQ=5D=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jEYlj-0001aP-2Z
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 13:29:59 +0000
X-Inumbo-ID: 8fb2a880-691c-11ea-a6c1-bc764e2007e4
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fb2a880-691c-11ea-a6c1-bc764e2007e4;
 Wed, 18 Mar 2020 13:29:58 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id a43so9106414edf.6
 for <xen-devel@lists.xenproject.org>; Wed, 18 Mar 2020 06:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+1swa6lIs2ZSrTkTQchMgIctuC8k0T+Foga8PxWdkqg=;
 b=p+vGZ4IrTGC+0eKeVmEFGSkv3Pzr6mGlx2zzDV5dn7c9Dg8MOiHLz6/z6NhxxvHvP2
 tBoF+Xknjma6L2wmAn1tKsnBfhwP4TmbK1b7x7gsOFOESjq5LLEaREDJiS4pKHEVhe5s
 NBryg4Kq3RLpZ/zvCCQqvQH7f7OvzjCqs6FR2wmdP197IoklQlUBnz1Mcvc1ykyZW6+l
 c/iEEp8M/D4PePmJtT1+r3OjthqAMxT3JzEp1PmKK7qE35bb6zWhCFw9wn68PtSsQYCd
 JtQCbL1WRgfzS6Rua2emDK1xIYNIAKo4AmOIR3E6hDvnGP2R9C42CltoYX6fNuKOduAY
 G77A==
X-Gm-Message-State: ANhLgQ2rk/pktlYBmP/bKRFgOuK0x9Wgv+A9TiktEK06zZcQxwLAy+do
 yAqRPwTEw7Wp1noColPf6X8=
X-Google-Smtp-Source: ADFU+vt7roNb4SNRrDD+K1dqUbEXwuOpCIO++IWvn8iqiOH6l3bPT0JChMTq/a3+oY7KCaScfP5FpA==
X-Received: by 2002:a17:906:edbd:: with SMTP id
 sa29mr4066926ejb.186.1584538197537; 
 Wed, 18 Mar 2020 06:29:57 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-231.amazon.com.
 [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id lu24sm238480ejb.35.2020.03.18.06.29.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Mar 2020 06:29:56 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>
References: <916bbc82cafac74f0a203b48eebfbc711bd33a70.camel@infradead.org>
 <c22d4a40717c7d2fad243c244619d2882ad5baf2.camel@infradead.org>
 <5fc87ac4-8be9-3881-03af-85faca1e2bf5@suse.com>
 <9664816b-7607-c3f4-b70c-455bb946241f@xen.org>
 <079ba681-0a2d-95a5-046d-15be3e123a4f@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <07231df6-6c4e-1fc9-4833-6e5a50b5b3d4@xen.org>
Date: Wed, 18 Mar 2020 13:29:55 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <079ba681-0a2d-95a5-046d-15be3e123a4f@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 1/2] x86/setup: simplify handling of
 initrdidx when no initrd present
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <xadimgnik@gmail.com>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw2@infradead.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxOC8wMy8yMDIwIDEzOjIwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAxOC4wMy4yMDIw
IDEzOjEyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiAxOC8wMy8yMDIwIDEx
OjUxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IE9uIDE4LjAzLjIwMjAgMTI6NDYsIERhdmlkIFdv
b2Rob3VzZSB3cm90ZToKPj4+PiBGcm9tOiBEYXZpZCBXb29kaG91c2UgPGR3bXdAYW1hem9uLmNv
LnVrPgo+Pj4+Cj4+Pj4gUmVtb3ZlIGEgdGVybmFyeSBvcGVyYXRvciB0aGF0IG1hZGUgbXkgYnJh
aW4gaHVydC4KPj4+Cj4+PiBNeSBwb3NpdGlvbiB0b3dhcmRzIHRoaXMgaGFzbid0IGNoYW5nZWQs
IGp1c3QgZnRyLgo+Pj4KPj4+PiBSZXBsYWNlIGl0IHdpdGggc29tZXRoaW5nIHNpbXBsZXIgdGhh
dCBtYWtlcyBpdCBzb21ld2hhdCBjbGVhcmVyIHRoYXQKPj4+PiB0aGUgY2hlY2sgZm9yIGluaXRy
ZGlkeCA8IG1iaS0+bW9kc19jb3VudCBpcyBiZWNhdXNlIGxhcmdlciB2YWx1ZXMgYXJlCj4+Pj4g
d2hhdCBmaW5kX2ZpcnN0X2JpdCgpIHdpbGwgcmV0dXJuIHdoZW4gaXQgZG9lc24ndCBmaW5kIGFu
eXRoaW5nLgo+Pj4+Cj4+Pj4gQWxzbyBkcm9wIHRoZSBleHBsaWNpdCBjaGVjayBmb3IgbW9kdWxl
ICMwIHNpbmNlIHRoYXQgd291bGQgYmUgdGhlCj4+Pj4gZG9tMCBrZXJuZWwgYW5kIHRoZSBjb3Jy
ZXNwb25kaW5nIGJpdCBpcyBhbHdheXMgY2xlYXIgaW4gbW9kdWxlX21hcC4KPj4+Pgo+Pj4+IFNp
Z25lZC1vZmYtYnk6IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Cj4+Pj4gQWNr
ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Cj4+Pgo+Pj4gU3RyaWN0bHkgc3Bl
YWtpbmcgdGhpcyBpcyBub3QgYSB2YWxpZCB0YWcgaGVyZSwgb25seSBSLWIgd291bGQgYmUuCj4+
Cj4+IEkgY2FuJ3QgZmluZCBhbnkgcnVsZSBpbiBvdXIgY29kZSBiYXNlIHByZXZlbnRpbmcgYSBu
b24tbWFpbnRhaW5lciB0byBhZGQgaXRzICJhY2tlZC1ieSIgdGFnLgo+IAo+IEkgY291bGQgaGF2
ZSBzYWlkICJtZWFuaW5nZnVsIiBpbnN0ZWFkIG9mICJ2YWxpZCI6IEEgcGF0Y2ggaXMgbm90Cj4g
c3VwcG9zZWQgdG8gZ28gaW4gd2l0aG91dCBhIGRpcmVjdCBtYWludGFpbmVyJ3MgYWNrLCB1bmxl
c3MgdGhlcmUncwo+IGEgcmVhc29uIHRvIGludm9rZSB0aGUgbmVzdGVkIG1haW50YWluZXJzaGlw
IHJ1bGVzLiBUaGF0J3MgbXkKPiB1bmRlcnN0YW5kaW5nIGF0IGxlYXN0LgoKSSBzdGlsbCBkb24n
dCBzZWUgd2h5IHlvdSBhcmUgbm90IGhhcHB5IHdpdGggbXkgdGFnIGhlcmUgdGhlIG1vcmUgSSAK
ZG9uJ3QgdGhpbmsgRGF2aWQgb3IgSSBldmVyIGNsYWltZWQgbXkgYWNrZWQtYnkgd2FzIHN1ZmZp
Y2llbnQgZm9yIHRoZSAKcGF0Y2ggdG8gYmUgbWVyZ2VkLgoKV2l0aCBteSB0YWcgSSBhY2tub3ds
ZWRnZWQgdGhlIHBhdGNoLiBJIGNvdWxkIGFsc28gaGF2ZSBpZ25vcmVkIGl0IGFuZCAKeW91IHdv
dWxkIGhhdmUgY29tcGxhaW5lZCB0aGF0IG5vYm9keSBoZWxwIHlvdSByZXZpZXdpbmcgcGF0Y2hl
cy4uLgoKPiAKPj4gQnV0IGlmIHlvdSB3YW50IHRvIHBsYXkgYXQgdGhpcyBnYW1lLCBteSB0YWcg
aXMgdGVjaG5pY2FsbHkgdmFsaWQKPj4gYmVjYXVzZSAiVEhFIFJFU1QiIGVuZ2xvYmVzIHRoZSBm
dWxsIFhlbiBjb2RlYmFzZSAoTm90ZSB0aGUgKiBpbgo+PiB0aGUgTUFJTlRBSU5FUlMgZmlsZSku
Cj4gCj4gTm90ZSB0aGUgbmVzdGVkIG1haW50YWluZXJzaGlwIHdvcmRpbmcgaW4gdGhhdCBmaWxl
LCB3aGljaCB3YXMgYWRkZWQKPiBwcmV0dHkgcmVjZW50bHkuIElmIHRoYXQgd29yZGluZyBpc24n
dCBjbGVhciBlbm91Z2gsIHBlcmhhcHMgd2UgY2FuCj4gZnVydGhlciByZWZpbmUgaXQ/CgpUaGUg
d29yZGluZyBpcyBjbGVhciBlbm91Z2gsIGJ1dCBpdCBzdGlsbCBkb2Vzbid0IHByZXZlbnQgbWUg
dG8gYWRkIG15IAphY2tlZC1ieS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
