Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A43C16A756
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 14:35:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Dq1-0003dW-4O; Mon, 24 Feb 2020 13:31:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BoNe=4M=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j6Dq0-0003dR-2A
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 13:31:56 +0000
X-Inumbo-ID: 05fa0ea4-570a-11ea-ade5-bc764e2007e4
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05fa0ea4-570a-11ea-ade5-bc764e2007e4;
 Mon, 24 Feb 2020 13:31:55 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id p3so11895640edx.7
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2020 05:31:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NYbse21yV6CGJd4Y87CtS4AvvTi6/OWPk58Nfb1OGKE=;
 b=fHLYFCiVOCpKpdTk45f7zFfmZWnJy0agqgXl/+2RQtJPxqYF0xtoo0PdSqxI6ZCrAo
 oTAe3wZTvc5XFcvQOOnKXPQDwDhqyOxPWPug1GuQA/IMvNPTkEUIgYiYsrnUSljyKraS
 yiDamrO9JPdxrF36tn3TuJh0gf4aVtuF4txWqu0Xc65OCzVkB+1RN5hkbvJtxHkNXWuX
 9Wq5aZvNmzmZHdbBuopdqB7sMREUzVHxWiIdnHoRGGdVHPFMykjRVYWDro6WcqqW7a0T
 ehaoiMK5vGfquTpkfxJ0BqIVEfsxGXUN7QmIhJivnlqmzMeo8nSZtZxI+jkWVyC4OdPR
 PZQg==
X-Gm-Message-State: APjAAAWyOS3Gws1emC+6+pSuVJhdC+63K+XYpujfVMbbcLFELRQuz4Ng
 9qLWK0YVsj26OSbSniw9cP0=
X-Google-Smtp-Source: APXvYqwr+fIZ5k11FaABFTTqmfiKDu49CNmSfarPtbqGsRhzWgJmeZTrN5yd+wg1uJ6HpvQUDUfavg==
X-Received: by 2002:aa7:cf06:: with SMTP id a6mr48403140edy.161.1582551114666; 
 Mon, 24 Feb 2020 05:31:54 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id 2sm960328edv.87.2020.02.24.05.31.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2020 05:31:53 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>, David Woodhouse <dwmw2@infradead.org>
References: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
 <20200201003303.2363081-7-dwmw2@infradead.org>
 <3821a29a-7d60-c18b-71dd-12ed3c5b708d@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <519b73bb-2db3-75e4-db81-3781c462290e@xen.org>
Date: Mon, 24 Feb 2020 13:31:52 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <3821a29a-7d60-c18b-71dd-12ed3c5b708d@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 7/8] x86/setup: simplify handling of
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Varad Gautam <vrd@amazon.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMjEvMDIvMjAyMCAxNjo1OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDEu
MDIuMjAyMCAwMTozMywgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+PiBGcm9tOiBEYXZpZCBXb29k
aG91c2UgPGR3bXdAYW1hem9uLmNvLnVrPgo+Pgo+PiBSZW1vdmUgYSB0ZXJuYXJ5IG9wZXJhdG9y
IHRoYXQgbWFkZSBteSBicmFpbiBodXJ0Lgo+IAo+IFBlcnNvbmFsbHkgSSdkIHByZWZlciB0aGUg
Y29kZSB0byBzdGF5IGFzIGlzLCBidXQgaWYgQW5kcmV3IGFncmVlcwo+IHdpdGggdGhpcyBiZWlu
ZyBhbiBpbXByb3ZlbWVudCwgdGhlbiBJIGFsc28gd291bGRuJ3Qgd2FudCB0byBzdGFuZAo+IGlu
IHRoZSB3YXkuIElmIGl0IGlzIHRvIGdvIGluIEkgaGF2ZSBhIGZldyBzbWFsbCBhZGp1c3RtZW50
IHJlcXVlc3RzOgo+IAo+PiBSZXBsYWNlIGl0IHdpdGggc29tZXRoaW5nIHNpbXBsZXIgdGhhdCBt
YWtlcyBpdCBzb21ld2hhdCBjbGVhcmVyIHRoYXQKPj4gdGhlIGNoZWNrIGZvciBpbml0cmRpZHgg
PCBtYmktPm1vZHNfY291bnQgaXMgYmVjYXVzZSBtYmktPm1vZHNfY291bnQKPj4gaXMgd2hhdCBm
aW5kX2ZpcnN0X2JpdCgpIHdpbGwgcmV0dXJuIHdoZW4gaXQgZG9lc24ndCBmaW5kIGFueXRoaW5n
Lgo+IAo+IEVzcGVjaWFsbHkgaW4gbGlnaHQgb2YgdGhlIHJlY2VudCBYU0EtMzA3IEknZCBsaWtl
IHRvIGFzayB0aGF0IHdlCj4gYXZvaWQgaW1wcmVjaXNlIHN0YXRlbWVudHMgbGlrZSB0aGlzOiBB
ZmFpY3QgZmluZF9maXJzdF9iaXQoKSBtYXkKPiBhbHNvIHZhbGlkbHkgcmV0dXJuIGFueSB2YWx1
ZSBsYXJnZXIgdGhhbiB0aGUgcGFzc2VkIGluIGJpdG1hcAo+IGxlbmd0aC4KCklzIGl0PyBJIHRo
b3VnaCB0aGF0IGFsbCB0aGUgY2FsbGVycyBhcmUgbm93IHJldHVybmluZyAnc2l6ZScgaW4gYWxs
IHRoZSAKZXJyb3IgY2FzZXMuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
