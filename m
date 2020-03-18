Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57249189775
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 09:56:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEUSL-0001gU-Jz; Wed, 18 Mar 2020 08:53:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oC7P=5D=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jEUSK-0001gP-Ut
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 08:53:40 +0000
X-Inumbo-ID: f6b3e7e6-68f5-11ea-bec1-bc764e2007e4
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6b3e7e6-68f5-11ea-bec1-bc764e2007e4;
 Wed, 18 Mar 2020 08:53:40 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id t17so15642514qkm.6
 for <xen-devel@lists.xenproject.org>; Wed, 18 Mar 2020 01:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=5gU8D7VnIGVLBFESIZn8XtBgchga1oVYo9ZOpm+uw5s=;
 b=UPhS+tz8erCe52lJQjdz94/3brSyPqGTmap0Y9inC8ZFjpfGe8UdORGqFntDD8ub/Z
 Bgf5QwFkFkjy6Uf5X5LrkowaW78CbAgX+3feHy88KDAWTsCCRa5SB86nqngm2IFcy/XV
 ecE6TEkfO+Q2A6HeMCaA7GNwyHXseVVtR50Jec1B0A7uI8XmLCUgijaj+W8mWbG4au2U
 0wKtsIuDXe1t9nuZRvcEmSw3YQHNbHJ5sw7R/UZ0vhwq3cfdDBM52tBeKtQ0oNlnwbr2
 rekHMtOr3VbT6Ycwgf/f/+02u0TbnmNlas6TNm0Z+x/0ejdXbh1vf2Gs+Bi/EdTMOyjO
 8FWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=5gU8D7VnIGVLBFESIZn8XtBgchga1oVYo9ZOpm+uw5s=;
 b=qWn/iDOn82TQBoTtER1vOaHwbrkwPvzhuIZMzCF/XHlcRuozX9LmHSRD4/hqR2qFAb
 dPHqckgYcbNtCX99x3Q1omB8jQ7YiVOo9IWdnPqBpTIDYcAl1+d4+8dL2usWaccGD1bD
 dfo98a2TVPXSm12MieH5BtYHl7oNJcSRORxwhcpv/0KYCKBBT1cSVhpZ74Mko7dywf/d
 7cBaL4NK50lWdgeqGiLZVdAcEoTqka37pIMwc153625nhzXa+TPwv05WX9yV5LTQd+E1
 1VCWGXo5eg2mIOVo9+5mmdCleNAd9sU6On0blWITw3Uv2YhcjYkBezgI1qyFIiUek1PZ
 0gmA==
X-Gm-Message-State: ANhLgQ0jl82dKOierMQB303C96EymiCf1SpZwTfOdIWGi66/9cnPCZQi
 YU/ZN2+22ueDQaWcHkxcNQo=
X-Google-Smtp-Source: ADFU+vuTKqBSlE1LDbZ4lT+3/J3nR9C2WiKgMLCD1kuN/1Q+up95jVlEa1HiwzNAUgQS4q0SMsIpEA==
X-Received: by 2002:ae9:f40d:: with SMTP id y13mr2850660qkl.81.1584521619998; 
 Wed, 18 Mar 2020 01:53:39 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id q142sm3832131qke.45.2020.03.18.01.53.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Mar 2020 01:53:39 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'David Woodhouse'" <dwmw2@infradead.org>,
 "'Jan Beulich'" <jbeulich@suse.com>
References: <56f7fe21daff2dc4bf8db7ee356666233bdb0f7a.camel@infradead.org>
 <20200207155701.2781820-2-dwmw2@infradead.org>
 <cdf20919a9c1afcee2d2f63631391a701cde46ef.camel@amazon.com>
 <017D4B5F-603D-42BF-94DA-B757FF27EAF8@infradead.org>
 <2f2368f84380dd2c81bbfa310d03bc3c3f800b94.camel@amazon.com>
 <B63B9D74-EF17-4E6F-AA5D-2BEC0C3228D7@infradead.org>
 <f5b6325a469352585d7cf1d7d01d2dc4a2f2af8f.camel@infradead.org>
 <af374a90-f060-7239-5a02-c98df409819c@suse.com>
 <f320e035b9e77a565be61d7ad13c3947c1d00cb8.camel@infradead.org>
In-Reply-To: <f320e035b9e77a565be61d7ad13c3947c1d00cb8.camel@infradead.org>
Date: Wed, 18 Mar 2020 08:53:35 -0000
Message-ID: <005f01d5fd02$b7aa2240$26fe66c0$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLJFAfqp+GM6M5D8UrpK4lT1oBe3AGkGb2bAUDgoMUBUDuLzgGt2p0pALGuH7ECPAQBuAHzVUdOAovrbzCl/VfnwA==
Subject: Re: [Xen-devel] [PATCH 2/2] xen/mm: Introduce PG_state_uninitialised
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
Reply-To: paul@xen.org
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org, konrad.wilk@oracle.com,
 george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 jeff.kubascik@dornerworks.com, "'Xia, Hongyan'" <hongyxia@amazon.com>,
 stewart.hildebrand@dornerworks.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVs
LWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBEYXZpZCBXb29kaG91
c2UKPiBTZW50OiAxNyBNYXJjaCAyMDIwIDIyOjE1Cj4gVG86IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBDYzogc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsganVsaWVuQHhlbi5vcmc7
IHdsQHhlbi5vcmc7IGtvbnJhZC53aWxrQG9yYWNsZS5jb207Cj4gZ2VvcmdlLmR1bmxhcEBldS5j
aXRyaXguY29tOyBhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tOyBpYW4uamFja3NvbkBldS5jaXRy
aXguY29tOwo+IGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbTsgamVmZi5rdWJhc2Npa0Bkb3JuZXJ3
b3Jrcy5jb207IFhpYSwgSG9uZ3lhbiA8aG9uZ3l4aWFAYW1hem9uLmNvbT47Cj4gc3Rld2FydC5o
aWxkZWJyYW5kQGRvcm5lcndvcmtzLmNvbTsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCAyLzJdIHhlbi9tbTogSW50cm9kdWNl
IFBHX3N0YXRlX3VuaW5pdGlhbGlzZWQKPiAKPiBPbiBUaHUsIDIwMjAtMDItMjAgYXQgMTI6NTkg
KzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gT24gMDcuMDIuMjAyMCAxOTowNCwgRGF2aWQg
V29vZGhvdXNlIHdyb3RlOgo+ID4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0uYwo+ID4gPiArKysg
Yi94ZW4vYXJjaC94ODYvbW0uYwo+ID4gPiBAQCAtNDg4LDcgKzQ4OCw4IEBAIHZvaWQgc2hhcmVf
eGVuX3BhZ2Vfd2l0aF9ndWVzdChzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlLCBzdHJ1Y3QgZG9tYWlu
ICpkLAo+ID4gPgo+ID4gPiAgICAgIHBhZ2Vfc2V0X293bmVyKHBhZ2UsIGQpOwo+ID4gPiAgICAg
IHNtcF93bWIoKTsgLyogaW5zdGFsbCB2YWxpZCBkb21haW4gcHRyIGJlZm9yZSB1cGRhdGluZyBy
ZWZjbnQuICovCj4gPiA+IC0gICAgQVNTRVJUKChwYWdlLT5jb3VudF9pbmZvICYgflBHQ194ZW5f
aGVhcCkgPT0gMCk7Cj4gPiA+ICsgICAgQVNTRVJUKChwYWdlLT5jb3VudF9pbmZvICYgflBHQ194
ZW5faGVhcCkgPT0gUEdDX3N0YXRlX2ludXNlIHx8Cj4gPiA+ICsgICAgICAgICAgIChwYWdlLT5j
b3VudF9pbmZvICYgflBHQ194ZW5faGVhcCkgPT0gUEdDX3N0YXRlX3VuaW5pdGlhbGlzZWQpOwo+
ID4KPiA+IENhbiB1bmluaXRpYWxpemVkIHBhZ2VzIHJlYWxseSBtYWtlIGl0IGhlcmU/Cj4gCj4g
WWVwLCB3ZSBzaGFyZSB0aGUgbG93IDFNaUIgd2l0aCBkb21faW8uCj4gCgpPT0kgYW55b25lIGtu
b3cgd2h5IHdlIGRvIHRoaXM/IElzIGl0IGFjdHVhbGx5IG5lY2Vzc2FyeT8KCiAgUGF1bAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
