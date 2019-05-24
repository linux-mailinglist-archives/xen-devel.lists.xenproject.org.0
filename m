Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 489082A0D9
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2019 00:01:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUICN-0007X1-76; Fri, 24 May 2019 21:57:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Sh8e=TY=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hUICL-0007Ww-Ep
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 21:57:57 +0000
X-Inumbo-ID: fc944568-7e6e-11e9-8980-bc764e045a96
Received: from mail-vk1-xa2d.google.com (unknown [2607:f8b0:4864:20::a2d])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fc944568-7e6e-11e9-8980-bc764e045a96;
 Fri, 24 May 2019 21:57:56 +0000 (UTC)
Received: by mail-vk1-xa2d.google.com with SMTP id x196so2386530vkd.9
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2019 14:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=2jcEa45cVl42XAB642b3QoninW9W2J8YGGT414A5OP8=;
 b=exXxd/5V5Zsi86d1PWnBLVoNEQvSXImunfJL2XJOAGoSOF+lAp4Bts2fg3COc8zGI6
 VbPS3Z1VTGxu9jqe5M/4wKbpjwtUzinwI8TDxV+ffe9GpwSCwlWd3WMDgNg+8hCs7BRC
 RA6wms3q3ZX3Wk052Uc6pXN/8QEDneDLeOwXy/X3FxNqfPrJ2n9Ns7LSSWFqunDk5pbJ
 UyaUqNo3nbmAvvreuZvnqW2I0gWq01kikot3bYraj747fHuD04KY+FIbNItYDq6dJIwr
 KFPH6kHM67o1V2INVRPBU37XUZklBGlzHcqwYlXUdR/JaG16/DRbhw+Gzd/wS+UQa0Kc
 W6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=2jcEa45cVl42XAB642b3QoninW9W2J8YGGT414A5OP8=;
 b=I/EwX4WWgj352LpcB0rgN4k+a/0uRSgefCDXfbzzdpNJcpCC/w3p8rvJ4GCHi+t7Yk
 jO/zC1BEiNM2DUU7IAAvF8ucypgrab7iSwypkUqgdfIsqfkv+45+MesCwy4qCFVh+mQ3
 R8L1XnX5yp0lWMXHtNM8a5zyBwu3xnODW71TikRtc3M/deta3iKjsQXyNofT8f8YB+Ct
 iDy/CeLEulDqd/Y7YTgkIBgsBwkXv4GLl7u+H/tqB+rVIAWeANKhXj/Y0bVJmIIplUpS
 PASgDbxKxL3NSC3KFkweFdFS+kOIw9SGnuRkdnrwOlgUAUuVru8q/TvppeVa5qfAW/So
 Vzew==
X-Gm-Message-State: APjAAAXWw5gvHBYFyhABKhyJ/HgEW6HmA5zKylnFM+/owIuvmAX1xT6K
 wl5pzhQ/EoOgeCVJRzNPf8PyewB4
X-Google-Smtp-Source: APXvYqzqpku41dwtWRswmdJf1y9pFkKv2yJ2IUp6Wtpj77WxnO8HXnplX7ZH7wPrjMTWTBj9kcjkbg==
X-Received: by 2002:a1f:174d:: with SMTP id 74mr8389137vkx.39.1558735075114;
 Fri, 24 May 2019 14:57:55 -0700 (PDT)
Received: from [192.168.0.104] ([190.106.78.158])
 by smtp.gmail.com with ESMTPSA id e19sm3102519vsc.24.2019.05.24.14.57.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 14:57:54 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
From: Lars Kurth <lars.kurth.xen@gmail.com>
In-Reply-To: <9FCB2022-A547-4FA2-88E7-91DA3C023438@gmail.com>
Date: Fri, 24 May 2019 15:57:51 -0600
Message-Id: <6385E667-84CB-483B-9E4A-87BF4BF7D10B@gmail.com>
References: <9FCB2022-A547-4FA2-88E7-91DA3C023438@gmail.com>
To: xen-devel <xen-devel@lists.xenproject.org>
X-Mailer: Apple Mail (2.3445.9.1)
Subject: Re: [Xen-devel] Guest Testing in OSSTEST - What distros and
 versions should we test against
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
Cc: Juergen Gross <jgross@suse.com>, Committers <committers@xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSB3YXMgaG9waW5nIHdlJ2QgZ2V0IGEgbGlzdCBvZiBkaXN0cm9zICsgdmVyc2lvbnMgdG9nZXRo
ZXIsIGJ1dCBoYXZlIG5vdCBoYWQgYW55IGlucHV0IG9uIHNwZWNpZmljIGRpc3Ryb3MKClRvIG1h
a2UgdGhpcyBlYXNpZXIsIEkgY3JlYXRlZCBodHRwczovL2NyeXB0cGFkLmZyL3BhZC8jLzIvcGFk
L2VkaXQvOU1wcGtiVTM2TERjV1QxMnVDNlhrM1NRLyAKVHJ5aW5nIHNvbWV0aGluZyBlbHNlLCBh
cyBzb21lIHBlb3BsZSBoYXZlIHRyb3VibGUgd2l0aCBnb29nbGUgZG9jcwoKUmVnYXJkcwpMYXJz
Cgo+IE9uIDkgTWF5IDIwMTksIGF0IDE5OjI4LCBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoLnhlbkBn
bWFpbC5jb20+IHdyb3RlOgo+IAo+IEhpIGFsbCwKPiAKPiBmb2xsb3dpbmcgYSBkaXNjdXNzaW9u
IHdpdGggY29tbWl0dGVycyBhYm91dCBHdWVzdCB0ZXN0aW5nIGluIE9TU1RFU1QsIGl0IHN1cmZh
Y2VkIHRoYXQgd2UgaGF2ZSBub3QgdXBkYXRlZCB3aGF0IGRpc3Ryb3Mgd2UgdGVzdCBpbiBPU1NU
RVNUIGZvciBhIHZlcnkgbG9uZyB0aW1lLiBBbGwgYWdyZWVkIHRoYXQgd2Ugc2hvdWxkIHJlZ3Vs
YXJseSByZXZpZXcgd2hhdCB3ZSB0ZXN0IGFnYWluc3Q6IG1heWJlIGF0IHRoZSBiZWdpbm5pbmcg
b2YgYSByZWxlYXNlIGN5Y2xlCj4gCj4gSW4gYW55IGNhc2UsIGN1cnJlbnRseSB3ZSB0ZXN0IGFn
YWluc3QKPiAKPiB4ODYgSFZNIGd1ZXN0czoKPiAgZGViaWFuLTkuNC4wLXtpMzg2LGFtZDY0fS1D
RC0xLmlzbwo+ICByaGVsLXNlcnZlci02LjEtaTM4Ni1kdmQuaXNvCj4gIHdpbjEwdjE3MDMteDg2
Lmlzbwo+ICB3aW43LXg2NC5pc28KPiAgd3MxNi14NjQuaXNvCj4gIEZyZWVCU0QtMTAuMS1DVVNU
T00te2kzODYsYW1kNjR9LTIwMTUwNTI1LnJhdy54ego+ICBEZWJpYW4gSFZNIHtpMzg2LGFtZDY0
fSB2aWEgZGViaWFuLWluc3RhbGxlciBuZXRpbnN0IFsxXQo+IAo+IHg4NiBQViBndWVzdHM6Cj4g
IERlYmlhbiBQViB7aTM4NixhbWQ2NH0gdmlhIGRlYmlhbi1pbnN0YWxsZXIgbmV0aW5zdCBbMV0K
PiAKPiBBUk0gZ3Vlc3RzOgo+ICBEZWJpYW4gUFYgdmlhIGRlYmlhbi1pbnN0YWxsZXIgbmV0aW5z
dCBbMV0KPiAKPiBbMV0gd2hhdGV2ZXIgRGViaWFuIHJlbGVhc2Ugb3NzdGVzdCBpdHNlbGYgbW9z
dGx5IHJ1bnMKPiAKPiBTbyBJIGFtIG9wZW5pbmcgdGhlIGZsb29yIHRvIHN1Z2dlc3Rpb25zLgo+
IAo+IFdpdGggcmVnYXJkcyB0byBXaW5kb3dzIHRlc3Rpbmcgd2UgaGF2ZSBzb21lIHJlc3RyaWN0
aW9ucy4gV2UgaGF2ZSB0cmllZCBzZXZlcmFsIHRpbWVzIHRvIGJ1eSBhZGRpdGlvbmFsIHRlc3Qg
bGljZW5zZXMsIGJ1dCB0aGlzIG5ldmVyIHdlbnQgYW55d2hlcmUgKHNvbWUgb2YgdGhlIFZNIGxp
Y2Vuc2VzIGFyZSBub3QgYXZhaWxhYmxlIGZvciBvdXIgZW52aXJvbm1lbnQsIHVubGVzcyB5b3Ug
YnVsayBidXksIHdoaWNoIGlzIHZlcnkgZXhwZW5zaXZlKS4gVGhlIG9ubHkgYXBwcm9hY2ggdGhh
dCB3b3VsZCBhbGxvdyB1cyB0byB0ZXN0IGFnYWluc3QgZGlmZmVyZW50IHdpbmRvd3MgdmVyc2lv
bnMgd291bGQgYmUgdG8gcmVxdWlyZSBldmVyeW9uZSB3aG8gbWF5IHRvdWNoIE9TU1RFU1Qgd2hp
Y2ggaXMgbm90IGRvYWJsZS4KPiAKPiBJIGNhbiBicmluZyB0aGlzIHVwIHdpdGggdGhlIE1TIG9w
ZW4gc291cmNlIG9mZmljZSwgaWYgdGhlcmUgYXJlIHN0cm9uZyBmZWVsaW5ncyBhYm91dCB0aGlz
IGFuZCB0cnkgYWdhaW4KPiAKPiBMYXJzCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
