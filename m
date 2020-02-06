Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 047E01545C7
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 15:13:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izhrD-0007fl-Vk; Thu, 06 Feb 2020 14:10:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X1jU=32=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1izhrC-0007fg-51
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 14:10:14 +0000
X-Inumbo-ID: 64447e5a-48ea-11ea-841d-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64447e5a-48ea-11ea-841d-bc764e2007e4;
 Thu, 06 Feb 2020 14:10:13 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id p3so6070670edx.7
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2020 06:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OVxT3iVTdickLRHvRLm+79CuE1TtMII3GzwzKf51zaY=;
 b=P6B1+lwANxzu8CKOIvPHwxQvrJhHWCiTE64DArX7gfo1OZm0Dkunu89gwrV9cTczN8
 KG5BYuzIywA/YMIhNO5hJknwCLkJykLCBXvZy26gXextkwfgAowNC0zc2rzRBqzc32Ka
 Y7Epkp7/Cj3vQd8+qO1BpkA1TBnUzs2pJv72xWLHnXgmYQNihjx59hIEVQWWWuTtK3+9
 GLCnTYlsYTdGeMi1rBV8wsuvQCCheQ1vDv6Grvms3CB/ByoiyUkcJjhdgTkxcUopWKL1
 S02zZgglY8xNk2H5c814SC9zpPPAEY64zymWtw/Ga//V44xX2ZA06DitNu9M6dVqecBp
 Q5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OVxT3iVTdickLRHvRLm+79CuE1TtMII3GzwzKf51zaY=;
 b=UO9t6inUj/0s/HhK57nPXZB48GDB4gkomRQsLRaV02DMX+OiCFQN+EXo4/DbXqP8La
 q+7oO2CdSQvMSYuPNsMH4qFzm2/1QxuYD2h7QPpNJFgUzctuF4/DrF6W/dO/eilA0b4h
 wQ1u1vB8kHKwDylt8mfP0C+qT43QONo7dDSOYlIx2SLRTpdN5sZQWJUTfGg4mImkJM2F
 tghjw/sgX8q5aVRVrfdkUiosyzeiePgc1ZFQKtpkduF9RwuypuNqEi7zjcRMDzjpBf6e
 IG+5iMu97JkiN0bYKw5vyKNwoCXx0G1S4DtX/mg5RL/BuE2bS8uIyVSL6awVmdSXNEfD
 Gyiw==
X-Gm-Message-State: APjAAAUBD4eq4C9+ps2Xala86oZP7SYbzaX2eGnzr+RvvTeX1z975yj7
 CFXOYbQKA1cUOAuP/deZ8WqQ9kA6BcI=
X-Google-Smtp-Source: APXvYqx+209ekxb2jvrQzsbvIrN9c9jp5x3wyMM2OENtZj3JnLnlHFRWx7EB1kJjQe83YcMS44ouqw==
X-Received: by 2002:a17:906:5586:: with SMTP id
 y6mr3464848ejp.336.1580998211894; 
 Thu, 06 Feb 2020 06:10:11 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53])
 by smtp.gmail.com with ESMTPSA id q3sm400047eju.88.2020.02.06.06.10.10
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2020 06:10:10 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id y17so7376731wrh.5
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2020 06:10:10 -0800 (PST)
X-Received: by 2002:adf:8b54:: with SMTP id v20mr4210658wra.390.1580998210206; 
 Thu, 06 Feb 2020 06:10:10 -0800 (PST)
MIME-Version: 1.0
References: <20200206132452.11802-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200206132452.11802-1-andrew.cooper3@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 6 Feb 2020 07:09:33 -0700
X-Gmail-Original-Message-ID: <CABfawhmqmrcd1=Gr27GsLr8_-wvEHOdrhqBxb69zB9NEtTLkdA@mail.gmail.com>
Message-ID: <CABfawhmqmrcd1=Gr27GsLr8_-wvEHOdrhqBxb69zB9NEtTLkdA@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] xen/hvm: Fix handling of obsolete HVM_PARAMs
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
Cc: Wei Liu <wl@xen.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Jan Beulich <JBeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgNiwgMjAyMCBhdCA2OjI0IEFNIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gVGhlIGxvY2FsIHhjX2h2bV9wYXJhbV9kZXByZWNh
dGVkX2NoZWNrKCkgaW4gbGlieGMgdHJpZXMgdG8gZ3Vlc3MgWGVuJ3MKPiBiZWhhdmlvdXIgZm9y
IHRoZSBNRU1PUllfRVZFTlQgcGFyYW1zLCBidXQgaXMgd3JvbmcgZm9yIHRoZSBnZXQgc2lkZSwg
d2hlcmUKPiBYZW4gd291bGQgcmV0dXJuIDAgKHdoaWNoIGlzIGFsc28gYSBidWcpLiAgRGVsZXRl
IHRoZSBoZWxwZXIuCj4KPiBJbiBYZW4sIHBlcmZvcm0gdGhlIGNoZWNrcyBpbiBodm1fYWxsb3df
c2V0X3BhcmFtKCksIHJhdGhlciB0aGFuCj4gaHZtX3NldF9wYXJhbSgpLCBhbmQgYWN0dWFsbHkg
aW1wbGVtZW50IGNoZWNrcyBvbiB0aGUgZ2V0IHNpZGUgc28gdGhlCj4gaHlwZXJjYWxsIGRvZXNu
J3QgcmV0dXJuIHN1Y2Nlc3NmdWxseSB3aXRoIDAgYXMgYW4gYW5zd2VyLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAtLS0KPiBD
QzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgo+IENDOiBXZWkgTGl1IDx3bEB4ZW4u
b3JnPgo+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBDQzog
SWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+Cj4gQ0M6IFJhenZhbiBDb2pvY2Fy
dSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KPiBDQzogVGFtYXMgSyBMZW5neWVsIDx0YW1h
c0B0a2xlbmd5ZWwuY29tPgo+Cj4gVGFtYXM6IFlvdSBpbnRyb2R1Y2VkIHhjX2h2bV9wYXJhbV9k
ZXByZWNhdGVkX2NoZWNrKCkgaW4gMGEyNDZiNDFjYSB3aGlsZQo+IGludHJvZHVjaW5nIFhFTl9E
T01DVExfbW9uaXRvcl9vcC4gIERvIHlvdSByZWNhbGwgd2h5PwoKV2VsbCwgZnJvbSB0aGUgbG9v
a3Mgb2YgaXQgdGhlIGludGVudCB3YXMgdG8gdGVsbCBhbnkgcmVtYWluaW5nIHVzZXIKb2YgdGhl
IGRlcHJlY2F0ZWQgSFZNIHBhcmFtcyB0aGF0IHRoZXNlIGFyZSBubyBsb25nZXIgc3VwcG9ydGVk
IHNpbmNlCndlIG5vdyBoYXZlIGEgc2VwYXJhdGUgZG9tY3RsLCB0aGUgbW9uaXRvcl9vcCwgdG8g
c2V0IHRoZXNlIG9wdGlvbnMuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
