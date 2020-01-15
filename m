Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A02313C6EF
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 16:08:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irkDk-0004qw-NA; Wed, 15 Jan 2020 15:04:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t5IT=3E=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1irkDj-0004qP-0a
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 15:04:35 +0000
X-Inumbo-ID: 5467c527-37a8-11ea-8582-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5467c527-37a8-11ea-8582-12813bfff9fa;
 Wed, 15 Jan 2020 15:04:30 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id q9so195100wmj.5
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2020 07:04:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xQvK3Khfh8ssHY6UKXAmXLE4MXakJFMEfTNk2HuT3e8=;
 b=oBAM5jtt/WbB5zAwc6S+z3KnBRL1tCn0g3/vltZOIbHQ/N/KZyeD978O92hQcClwgC
 YGmXSm8GiSidM4TYMYFqDNysoTpR6vUf9aDuGVuduYHEaHmqzWukUTKRQ3lsc0gQlxji
 Vdt17y/09yzx0KJLwav4YoA7M8eaRkspaEq834oXJk3Hcw1i/Ur0XWk9L7P5b/fc2J1D
 AgsVEPnk4fgWYweBr3yv7bcKiL2aiZOK91vzK3xoDIlwBKRqmYlI5MIpHKEVCSTwB5Ym
 j8stGexO5hO0aonS8yTQisxtZiXY5+zeZpGqU40XCz0hqmzub7vZ07i/ZepcpLMVMxQ+
 O0Sw==
X-Gm-Message-State: APjAAAXkcsd0SsOaU/F5cmPXCxOJlX5RbyRswz04Lh7G8C4p03LlxT4G
 zU6VXTH0sq6bUFdfwPvYGiY=
X-Google-Smtp-Source: APXvYqy279tPnlZqttod0cBi9Mva6wkZHlFzeLjXHeZe9tBQL0b+hXbPpd8U2Ldc2U+oX97PYuyAOw==
X-Received: by 2002:a1c:2187:: with SMTP id h129mr244143wmh.44.1579100669759; 
 Wed, 15 Jan 2020 07:04:29 -0800 (PST)
Received: from debian (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id b137sm133936wme.26.2020.01.15.07.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 07:04:28 -0800 (PST)
Date: Wed, 15 Jan 2020 15:04:26 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Message-ID: <20200115150426.svapzpux2tbbgvmn@debian>
References: <20200115124129.5684-1-madhuparnabhowmik04@gmail.com>
 <20200115135631.edr2nrfkycppxcku@debian>
 <CAF65HP0q_KcrUP_50JxZL1xNc47=detHvdOzjBmuiqUtB3AwfA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF65HP0q_KcrUP_50JxZL1xNc47=detHvdOzjBmuiqUtB3AwfA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] net: xen-netbank: hash.c: Use built-in RCU
 list checking
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
Cc: Wei Liu <wei.liu@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 paul@xen.org, netdev@vger.kernel.org, Amol Grover <frextrite@gmail.com>,
 linux-kernel@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 xen-devel@lists.xenproject.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMTUsIDIwMjAgYXQgMDc6MzY6MzhQTSArMDUzMCwgTWFkaHVwYXJuYSBCaG93
bWlrIHdyb3RlOgpbLi4uXQo+IAo+ID4gVGhlIHN1cnJvdW5kaW5nIGNvZGUgbWFrZXMgaXQgcHJl
dHR5IGNsZWFyIHRoYXQgdGhlIGxvY2sgaXMgYWxyZWFkeSBoZWxkCj4gPiBieSB0aGUgdGltZSBs
aXN0X2Zvcl9lYWNoX2VudHJ5X3JjdSBpcyBjYWxsZWQsIHlldCB0aGUgY2hlY2tpbmcgaW52b2x2
ZWQKPiA+IGluIGxvY2tkZXBfaXNfaGVsZCBpcyBub3QgdHJpdmlhbCwgc28gSSdtIGFmcmFpZCBJ
IGRvbid0IGNvbnNpZGVyIHRoaXMgYQo+ID4gc3RyaWN0IGltcHJvdmVtZW50IG92ZXIgdGhlIGV4
aXN0aW5nIGNvZGUuCj4gPgo+ID4gQWN0dWFsbHksICB3ZSB3YW50IHRvIG1ha2UgQ09ORklHX1BS
T1ZFX0xJU1RfUkNVIGVuYWJsZWQgYnkgZGVmYXVsdC4KCkkgdGhpbmsgeW91IG1lYW50IENPTkZJ
R19QUk9WRV9SQ1VfTElTVC4KCj4gQW5kIGlmIHRoZSBjb25kIGFyZ3VtZW50IGlzIG5vdCBwYXNz
ZWQgd2hlbiB0aGUgdXNhZ2Ugb2YKPiBsaXN0X2Zvcl9lYWNoX2VudHJ5X3JjdSgpCj4gaXMgb3V0
c2lkZSBvZiByY3VfcmVhZF9sb2NrKCksIGl0IHdpbGwgbGVhZCB0byBhIGZhbHNlIHBvc2l0aXZl
Lgo+IFRoZXJlZm9yZSwgSSB0aGluayB0aGlzIHBhdGNoIGlzIHJlcXVpcmVkLgoKRmFpciBlbm91
Z2guCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
