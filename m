Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9CF9A18B
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 23:00:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0u9H-0007Ir-UZ; Thu, 22 Aug 2019 20:57:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QFO2=WS=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1i0u9G-0007Im-Uu
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 20:57:35 +0000
X-Inumbo-ID: 76e4d202-c51f-11e9-b95f-bc764e2007e4
Received: from mail-pg1-x541.google.com (unknown [2607:f8b0:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 76e4d202-c51f-11e9-b95f-bc764e2007e4;
 Thu, 22 Aug 2019 20:57:34 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id n190so4393841pgn.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2019 13:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=GG+MAsHNsA8VMCDQfrBMlgIUGdDJVWa9F/793azKYxY=;
 b=ti7gdjkbO+JHU4/sMT725S2Q0xd1lCfIFSKlC1UW4XgcPvF6Y0NolskeFgyDfau7Qp
 pGFxFbjLn612LP9t4RPdivkKUoiX2XjYRjExXoikjzfCm8rn7sCIHaOYDKaJ4jrMi+V1
 dHG/WwUTPD4QoKsSIlX3bE8vuCrNPqBd4X4EvWK3k+SPEmvitlFuy+oiod/pngmB1lVu
 HdHs1kf1OpNd7cB359blYKYMohtOKHPS0CdgRS0Fg1mr9wQ1yrLlyI/jI8Fud4Dp4wci
 yqtW3LrI/lHoPNDToIuFiYyGpordRoBGiaOCAnIU1DNCTekRrTFifZW0GtrB1TdCD/eg
 tAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=GG+MAsHNsA8VMCDQfrBMlgIUGdDJVWa9F/793azKYxY=;
 b=EicxSA7cQPAQCICsYDlupsABvQNL64rUG25VtggiSmnZ6lEgFYUENgmDP+yeA3Aggp
 zOLXjsPxmVAjuQMYrElOSNGLRpCWaiqX9lyclzfAIzsnXN/ODvtlA3idQ2kBLl0czlKf
 4lQYV0T0CowOC0ABYcUuCoUaO4ZfID/w+i6oinUyjShriuE0J3FKKHXzXe+W3pLmoYOG
 dhcUfHLPXOt8FWAc+rD1K4vKUvE2PeGGtm+nwe1TX+8SkfaM2Q5VgE27Z99rxlkIea9J
 Fb276AbGcC+pO6H6Ka0Q8gK3zjGhRC8rA45+8ICgiv1oZ/C43/DPSjLUDILIv6oz8zI+
 Cvlw==
X-Gm-Message-State: APjAAAVl2cckS+ihLNn0wKoPivCOItvLiZS0WO4em3QYvbzOrZJlAxka
 9L+3yicQ8AKbi9lmzomwdvY=
X-Google-Smtp-Source: APXvYqwSYEfP4j9hWMQcl1QI6obpk7N4HqwWDbYzLGLwOKo9TW4xVvcArPpwI4pd8M0nbfd/l7c1RA==
X-Received: by 2002:a63:69c1:: with SMTP id e184mr959727pgc.198.1566507453545; 
 Thu, 22 Aug 2019 13:57:33 -0700 (PDT)
Received: from ?IPv6:2607:fb90:66ef:89b5:e53b:d749:bcad:a47e?
 ([2607:fb90:66ef:89b5:e53b:d749:bcad:a47e])
 by smtp.gmail.com with ESMTPSA id bt18sm434287pjb.1.2019.08.22.13.57.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Aug 2019 13:57:32 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPhone Mail (16G77)
In-Reply-To: <5b190182-4938-52b4-eeb2-df77224711c3@citrix.com>
Date: Thu, 22 Aug 2019 13:57:32 -0700
Message-Id: <587225E8-C0DE-40BA-B39E-E30F9CE69B92@gmail.com>
References: <15a4c482-1207-1d8a-fd2a-dc4f25956c27@cs.rochester.edu>
 <79c7b71f-0b61-2799-4a79-644536a9c891@citrix.com>
 <d55da430-0d73-8a92-73e7-99e1aa70680c@cs.rochester.edu>
 <5b190182-4938-52b4-eeb2-df77224711c3@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] More questions about Xen memory layout/usage,
 access to guest memory
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Johnson,
 Ethan" <ejohns48@cs.rochester.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBPbiBBdWcgMjIsIDIwMTksIGF0IDA5OjUxLCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPiB3cm90ZToKPiAKPj4gT24gMjIvMDgvMjAxOSAwMzowNiwgSm9obnNvbiwg
RXRoYW4gd3JvdGU6Cj4+IAo+PiBGb3IgSFZNLCBvYnZpb3VzbHkgYW55dGhpbmcgdGhhdCBjYW4n
dCBiZSB2aXJ0dWFsaXplZCBuYXRpdmVseSBieSB0aGUgCj4+IGhhcmR3YXJlIG5lZWRzIHRvIGJl
IGVtdWxhdGVkIGJ5IFhlbi9RRU1VIChzaW5jZSB0aGUgZ3Vlc3Qga2VybmVsIGlzbid0IAo+PiBl
eHBlY3RlZCB0byBiZSBjb29wZXJhdGl2ZSB0byBpc3N1ZSBQViBoeXBlcmNhbGxzIGluc3RlYWQp
OyBidXQgSSB3b3VsZCAKPj4gZXhwZWN0IGVtdWxhdGlvbiB0byBiZSBsaW1pdGVkIHRvIHRoZSBy
ZWxhdGl2ZWx5IHNtYWxsIHN1YnNldCBvZiB0aGUgSVNBIAo+PiB0aGF0IFZNWC9TVk0gY2FuJ3Qg
bmF0aXZlbHkgdmlydHVhbGl6ZS4gWWV0IEkgc2VlIHRoYXQgeDg2X2VtdWxhdGUuYyAKPj4gc3Vw
cG9ydHMgZW11bGF0aW5nIGp1c3QgYWJvdXQgZXZlcnl0aGluZy4gVW5kZXIgd2hhdCBjaXJjdW1z
dGFuY2VzIGRvZXMgCj4+IFhlbiBhY3R1YWxseSBuZWVkIHRvIHB1dCBhbGwgdGhhdCBlbXVsYXRp
b24gY29kZSB0byB1c2U/Cj4gCj4gSW50cm9zcGVjdGlvbiwgYXMgSSBzYWlkIGVhcmxpZXIsIHdo
aWNoIGlzIHBvdGVudGlhbGx5IGFueSBpbnN0cnVjdGlvbi4KCkNvdWxkIGludHJvc3BlY3Rpb24t
c3BlY2lmaWMgZW11bGF0aW9uIGNvZGUgYmUgZGlzYWJsZWQgdmlhIEtDb25maWc/CgpSaWNoCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
