Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA74218FA1
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 19:52:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOnBP-0004eT-Ii; Thu, 09 May 2019 17:50:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=przs=TJ=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hOnBN-0004eH-G9
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 17:50:13 +0000
X-Inumbo-ID: e40a2764-7282-11e9-b72b-bb0a35bc3fea
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e40a2764-7282-11e9-b72b-bb0a35bc3fea;
 Thu, 09 May 2019 17:50:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1557424211; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=PorqCzbk8uxMF5fWdoLjq6yK0Gox4ngePSq5ohiRWVY=;
 b=Wxr2kRoAi56CGdX95obMygx5VPgq5xn9Kq2775zRz2hRA28K02B0yMapfGqCj4i536P9pEB4
 8SFHd5M77Y+DeL+x9efcbJ7Ix4bYVJh+2IBlU9Sxwth4ITtdi69OeuIc1SpQLJeC10fr54JZ
 cFaBW+ShXk+IB6NJ3B09hIDQ8Z0=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mxa.mailgun.org with ESMTP id 5cd46852.7f173595dbb0-smtp-out-n02;
 Thu, 09 May 2019 17:50:10 -0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id s18so4693149wmh.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2019 10:50:10 -0700 (PDT)
X-Gm-Message-State: APjAAAU+FbCFo2Cu3fzeAYQ1OiqZXhfdITMy1GRTvahtw+SbfKiPcR+L
 dybh6yxPxICI8j0cjpgWyykcHkJlyeNC7GDq8EQ=
X-Google-Smtp-Source: APXvYqwIn1t8kIa1UM/KnS2dH9bE/nN2VrC86ttGn0d10txJpfUHmcVcsK75woKPDatLzUclYXkfhVTn6GDaq+EIMeo=
X-Received: by 2002:a1c:2e88:: with SMTP id u130mr3774752wmu.54.1557424209307; 
 Thu, 09 May 2019 10:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <f3zRvkN8JOfpv5k6jz7TbWXz-sso4q6CGB-3S05mSco8SuDy0BoN5z5_Lj_-Xnto1FPMCkhE89trkq-_f6itwRZ5F4NI9MKrcqZk8cdT45A=@protonmail.com>
 <76bd924a-34b1-eb7c-d3be-6c33aa7729fc@citrix.com>
 <WL45-Mjyf7to-l_u4XAT3M46R6YcAECvEwl6SDzOWeLE_SOQUyF26Vj2cu0mScD47fS95OaBAWDddX7DL7yujvl03YffFRDoqrpRcFDSnxA=@protonmail.com>
 <oSx3iO5YqwrWedfgCT8yEj4jGrzisHnNA6d9XQIKAJJAOhr6TPANrqVHf6s56L8_WBgLtVMJv37Cypbr2emtg0ZKb25HdHo91eM1J1fVJHo=@protonmail.com>
In-Reply-To: <oSx3iO5YqwrWedfgCT8yEj4jGrzisHnNA6d9XQIKAJJAOhr6TPANrqVHf6s56L8_WBgLtVMJv37Cypbr2emtg0ZKb25HdHo91eM1J1fVJHo=@protonmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 9 May 2019 11:49:33 -0600
X-Gmail-Original-Message-ID: <CABfawhkKpBDnZK3AH=8HEa3NKW1u2H-iLKWqo+A2_uhMQ5N2uA@mail.gmail.com>
Message-ID: <CABfawhkKpBDnZK3AH=8HEa3NKW1u2H-iLKWqo+A2_uhMQ5N2uA@mail.gmail.com>
To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Subject: Re: [Xen-devel] [VMI] Possible race-condition in altp2m APIs
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBJIGRvbid0IGZlZWwgY29tZm9ydGFibGUgZGlnZ2luZyBpbnRvIFhlbidzIGNvZGUsIGVzcGVj
aWFsbHkgZm9yIHNvbWV0aGluZyBhcyBjb21wbGljYXRlZCBhcyBwYWdlIHRhYmxlIGFuZCBtZW1v
cnkgbWFuYWdlbWVudCwKPiBpbmNyZWFzZWQgYnkgdGhlIGNvbXBsZXhpdHkgb2YgYWx0cDJtLgoK
VW5mb3J0dW5hdGVseSB0aGUgcmVhbGl0eSBpcyB0aGF0IHlvdSBtaWdodCB2ZXJ5IHdlbGwgaGF2
ZSB0byBiZWNvbWUKZmFtaWxpYXIgd2l0aCB0aGVzZSBhcmVhcyBpZiB5b3UgaG9wZSB0byBkZWJ1
ZyBzb21lIG9mIHRoZXNlIGlzc3Vlcy4KCj4gV2hhdCBpIGNhbiBkbyBob3dldmVyLCBpcyB0ZXN0
IHlvdXIgaWRlYXMgYW5kIHBhdGNoZXMgYW5kIHJlcG9ydCB0aGUgaW5mb3JtYXRpb24gSSBjYW4g
Z2F0aGVyIG9uIHRoaXMgaXNzdWUuCj4KPiBOb3RlOiBJIHRlc3RlZCB3aXRoIHRoZSBsYXRlc3Qg
Y29tbWl0cyBvbiBEcmFrdnVmL21hc3RlciwgZXNwZWNpYWxseToKPiAiQWRkIGEgVk0gcGF1c2Ug
Zm9yIHNoYWRvdyBjb3B5IHJlZnJlc2ggb3BlcmF0aW9uIgo+IGh0dHBzOi8vZ2l0aHViLmNvbS90
a2xlbmd5ZWwvZHJha3Z1Zi9wdWxsLzYyNgo+Cj4gQHRhbWFzLCBkaWQgeW91IG1hZGUgdGhpcyBw
YXRjaCB0byBmaXggdGhlc2Uga2luZCBvZiByYWNlIGNvbmRpdGlvbnMgaXNzdWUgdGhhdCBpJ20g
cmVwb3J0aW5nID8KPiBPciB3YXMgaXQgdG90YWxseSB1bnJlbGF0ZWQgPwoKSXQgd2FzIGFuIHVu
cmVsYXRlZCByYWNlLWNvbmRpdGlvbiB0aGF0IEkgc3R1bWJsZWQgYWNyb3NzIHdoaWxlIHRyeWlu
Zwp0byB0aGluayBvZiB2ZWN0b3JzIHRoYXQgbWlnaHQgYmUgY2F1c2luZyB0aGUgaXNzdWUgeW91
IGFyZSBzZWVpbmcuIEFzCnlvdSBzdGlsbCBoYXZlIHRoZSBpc3N1ZSwgZXZpZGVudGx5IGl0IHdh
cyBhbiB1bnJlbGF0ZWQgaXNzdWUuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
