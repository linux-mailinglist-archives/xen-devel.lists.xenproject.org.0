Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F337EF4E
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 10:30:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htSvF-0002mX-Ok; Fri, 02 Aug 2019 08:28:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bRuE=V6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1htSvD-0002mH-T4
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 08:28:19 +0000
X-Inumbo-ID: 7a4eecbb-b4ff-11e9-8980-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7a4eecbb-b4ff-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 08:28:18 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id z15so48052304lfh.13
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2019 01:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B9jBQ5dPB2ne859xagm2yY8yOJCoSBu700W/X9nYfYM=;
 b=Q4xW7o+/qo8bPnkKuXoa7OB6EEXDMRQ3uyrtICgY19rfM5u5/EuThTnKz6B80JSmzF
 2xVUTCgRzV9auAMcRURv7MwBpGz+G13CmWXELhT4SQHpXYvB0cxvHJY31pWahWjru2vB
 PnGhBRqgVhONWQjJFldCbnL9ISlIfw/+S1MOBS4KkskWAdMN8eO76o/R77AGkvexiDFW
 uLTpnmzrnHleOHZMNulv7YnUtPQD73GGFGs6I+mi1aJwrWC1AZHkQvfzSWlShBCHRpDG
 ZH8UlntKtPc+c52B5yEni5O3cK4sWEa0gYzWT5pT5ySfwn7d3oeu+muTmA2UL9i2JYda
 uYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B9jBQ5dPB2ne859xagm2yY8yOJCoSBu700W/X9nYfYM=;
 b=QR8xBDLedK92WMt8cs2/Aq7SfEFGqSSonEZnTMWmBG9SLU27a0ydXnjFOW+yA/l/16
 T1Y4MY3fiTJIgC7LGu34i7TDFL07V7L5Qg9DLvW2mRhiyk2lDLVCQtpybu4WKRl5StNv
 zXX+Y4VMfCTIVZliEYbcIQZ5JHZbV47qX083z6Vdt+bvd8YftQPnvnJMjiXclBI1D0LT
 +DyirFmq755pNvP30jhMdKJ/11H/MKxrUtj4r+8V0UZlabDJ4I2Pqqqmow9yC799tL6l
 nJly/2DToIAvT7PW2QNe4stD7iA+vNRy2+cO248bmAO/lZIWbHG2wjONUvHzHiVFwYA2
 P/Yw==
X-Gm-Message-State: APjAAAW6oRhdU6bSq493kjVen6D4rDceK9AZCrjRRfo+9viPsy89KvfG
 yJMIgl/34iQXGRFstCmPaEQ=
X-Google-Smtp-Source: APXvYqxqmEDUToznfG2ek/P4uRurcTwnC7jun92Sr2XxkEBsC+tP48KKQBE1InhYimsciOaV9cV4AA==
X-Received: by 2002:ac2:482d:: with SMTP id 13mr2510982lft.132.1564734496743; 
 Fri, 02 Aug 2019 01:28:16 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 b6sm14063894lfa.54.2019.08.02.01.28.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Aug 2019 01:28:16 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-2-git-send-email-andrii.anisov@gmail.com>
 <ad2a343e-1a65-6569-17a2-e5b676908e49@arm.com>
 <de4feda4-d8b6-4922-26f5-ea3d3f940563@gmail.com>
 <2da153e4-2e11-18af-5a0d-cdc12beaf858@arm.com>
 <be1d31db-60d6-6e05-e50d-d5bc6963d9e7@gmail.com>
 <096ebef8-0bc5-8b49-9b59-10fdb7e6c1de@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <0f4bd23e-587d-d166-01a1-7c4d44ad4b50@gmail.com>
Date: Fri, 2 Aug 2019 11:28:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <096ebef8-0bc5-8b49-9b59-10fdb7e6c1de@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 1/6] xen/arm: Re-enable interrupt later in the
 trap path
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwMS4wOC4xOSAxMjozNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDAx
LzA4LzIwMTkgMDc6NDUsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4+IE9uIDMwLjA3LjE5IDIzOjEw
LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Cj4+Pj4gSW4gdGhpcyBzZXJpZXMgSSB0aGluayBJIG5l
ZWQgaW50ZXJydXB0cyBsb2NrZWQgdW50aWwgSSBzdGFydCB0aW1lIGFjY291bnRpbmcgZm9yIGh5
cGVydmlzb3IuIFRpbWUgYWNjb3VudGluZyBpcyBzdGFydGVkIGJ5IGB0YWNjX2hlYWQoKWAgZnVu
Y3Rpb24uIEkgcHJlZmVyIHRvIGhhdmUgaXQgY2FsbGVkIGZyb20gQywgYmVjYXVzZSBpdCBpcyBt
b3JlIGNvbnZlbmllbnQgYW5kIG9idmlvdXMgZm9yIHRob3NlIHdobyBhcmUgbGVzcyBmYW1pbGlh
ciB3aXRoIHRoZSBBUk0gY29kZS4KPj4KPj4gSGVyZSBpcyB0aGUgcXVlc3Rpb24gdG8geW91OiB3
aGF0IGlzIHRoZSBiZXN0IHBsYWNlIChhbmQgd2F5KSB0byBzdGFydCBoeXBlcnZpc29yIHRpbWUg
dHJhY2tpbmc/Cj4gCj4gTG9va2luZyBhdCB0aGUgcGF0Y2gsIGh5cGVydmlzb3IgdGltZSBhY2Nv
dW50aW5nIGlzIGZvcjoKPiAgwqDCoMKgIDEpIHNvZnRpcnFzCj4gIMKgwqDCoCAyKSBoYXJkaXJx
cwo+IAo+IEZvciBoYXJkaXJxcywgeW91IGFsd2F5cyBlbnRlciBpbiBDIHdpdGggaW50ZXJydXB0
IGRpc2FibGVkLiBTbyB0aGlzIGNhbiBiZSBjYWxsZWQgZGlyZWN0bHkgZnJvbSB0aGVyZS4KPiAK
PiBGb3Igc29mdGlycXMsIHRoZXkgYXJlIHF1aXRlIGEgZmV3IHBsYWNlcyB3aGVyZSBkb19zb2Zp
cnEoKSBpcyBjYWxsZWQuIFNvIHlvdSBlaXRoZXIgd2FudCB0byB0cmFjayB0aGUgdGltZSBpbiB0
aGUgZnVuY3Rpb24gZGlyZWN0bHkgb3Igb24gZWFjaCBjYWxsZXJzLgoKClNvZnRpcnE/IFdoYXQg
YWJvdXQgdGhlIHJlc3Qgb2YgYGxlYXZlX2h5cGVydmlzb3JfdGFpbCgpYD8KCgo+ICJiaWcgcGll
Y2UiIGlzIHNvbWV3aGF0IGhhbGYtY29ycmVjdC4uLi4gQWxsIHRoZSBoeXBlcmNhbGxzIHdpbGwg
YmUgY29ycmVjdGx5IHByb3RlY3RlZCwgc28gdGhlIHByb2JsZW0gaXMgb25seSBpZiB5b3UgcmVj
ZWl2ZSBhbiBpbnRlcnJ1cHQgYmVmb3JlIFNTQkQgaXMgZW5hYmxlZC4KPiAKPiBJIHdvdWxkIG1v
dmUgdGhlIGVuYWJsZW1lbnQgaW4gYXNzZW1ibHkgY29kZSBhcyBwYXJ0IG9mIGVudHJ5LgoKVGhh
dCdzIGl0LiBJIHN1cHBvc2UgdGhlIGZ1bmN0aW9uIGBlbnRlcl9oeXBlcnZpc29yX2hlYWQoKWAg
d2FzIGludHJvZHVjZWQgYW5kIG5hbWVkIGFzIGEgcGFydCBvZiBlbnRyeSwgd2hpbGUgaW4gZmFj
dCBpcyBub3QgdGhlIHBhcnQuCkFuZCBJIGd1ZXNzIHlvdSB3ZXJlIGNvbmZ1c2VkIHdpdGggaXQg
d2hlbiBpbnRyb2R1Y2luZyB0aGF0IFdBLgpBcyB3ZWxsIGFzIEkgd2FzIHNvbWUgdGltZSBhZ28g
WzFdLgoKWzFdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4t
ZGV2ZWwvMjAxOC0xMC9tc2cwMjI0OC5odG1sCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
