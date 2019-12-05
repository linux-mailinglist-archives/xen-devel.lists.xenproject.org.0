Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3679011443C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 16:59:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ictVO-0001op-Lk; Thu, 05 Dec 2019 15:57:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=drz0=Z3=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ictVM-0001od-Pe
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 15:57:24 +0000
X-Inumbo-ID: ed291612-1777-11ea-8231-12813bfff9fa
Received: from mail-lj1-f194.google.com (unknown [209.85.208.194])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed291612-1777-11ea-8231-12813bfff9fa;
 Thu, 05 Dec 2019 15:57:24 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id r19so4194491ljg.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Dec 2019 07:57:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=73MK1lbUWo18YfY93yVZErVDTjTs3jLOOFt1LjFDKPU=;
 b=XS5XP6uuP0tvVdhmCWm4i9HJC2l+19Har9MKxenQ4CaeZIHayLSCZDntwM/iwfIWb1
 YIPyNTGtSGGkIO9MhhTCBw117Y6mp9Vu2UfPof9TJFLXjWPr+JN9XMZlPKF8fizPn7Z5
 PDdlBTSnFg4OedeRGGoyKInNH2cnFMFrHTHcMUKm6D238geCBI7Xp/Oa60Tqh1GsI9IG
 BRPhHqU4fNVOmcaR32ZPuhkFcGkXFflO8p5tHQRVeQeO014Q8TOhUj8xJB7VPTbPoQFI
 To1eVO2AnAhuLqKLuTk2SXZRCBMEvG5uNOJUUs7F3XBbRocOdh3GewC/f5sEoLYOI480
 932w==
X-Gm-Message-State: APjAAAWdfvmTd7tGiIreBfeGEMmwbu9jaUmGDY/NOeuih3WJ56eyNhsI
 MxMlCoS3FTRS5gYAwj4BObxwjaIvd5o=
X-Google-Smtp-Source: APXvYqzWojaRMw48kpBO23l2WWcMfWvevd1tx4c0yVGCOVPmggMvWE7Kj8X5vclIhWi5K5oJU/yTzA==
X-Received: by 2002:a2e:7818:: with SMTP id t24mr6134795ljc.195.1575561442801; 
 Thu, 05 Dec 2019 07:57:22 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182])
 by smtp.gmail.com with ESMTPSA id 144sm5308046lfi.67.2019.12.05.07.57.22
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2019 07:57:22 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id h23so4155306ljc.8
 for <xen-devel@lists.xenproject.org>; Thu, 05 Dec 2019 07:57:22 -0800 (PST)
X-Received: by 2002:a2e:8953:: with SMTP id b19mr5476740ljk.249.1575561442216; 
 Thu, 05 Dec 2019 07:57:22 -0800 (PST)
MIME-Version: 1.0
References: <34075b30-a9a1-4c02-5c6d-bdd73aeec5d0@suse.com>
In-Reply-To: <34075b30-a9a1-4c02-5c6d-bdd73aeec5d0@suse.com>
From: Wei Liu <wl@xen.org>
Date: Thu, 5 Dec 2019 15:57:05 +0000
X-Gmail-Original-Message-ID: <CAK9nU=o7pvTJeo_bV7eYB_CsSKPVundTTdQMZ=cfjfkLxDvL6A@mail.gmail.com>
Message-ID: <CAK9nU=o7pvTJeo_bV7eYB_CsSKPVundTTdQMZ=cfjfkLxDvL6A@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH] x86: don't offer Hyper-V option when "PV
 Shim Exclusive"
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCA1IERlYyAyMDE5IGF0IDE1OjQxLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+IHdyb3RlOgo+Cj4gVGhpcyBvbmx5IGFkZGVkIGRlYWQgY29kZS4gVXNlICJpZiIgaW5zdGVh
ZCBvZiAiZGVwZW5kcyBvbiIgdG8gbWFrZQo+IChoYWxmd2F5KSBjbGVhciB0aGF0IG90aGVyIGd1
ZXN0IG9wdGlvbnMgc2hvdWxkIGFsc28gZ28gaW4gdGhhZSBzYW1lCj4gYmxvY2suIE1vdmUgdGhl
IG9wdGlvbiBkb3duIHN1Y2ggdGhhdCB0aGUgc2hpbSByZWxhdGVkIG9wdGlvbnMgZ2V0Cj4gcHJl
c2VudGVkIGZpcnN0LCBhdm9pZGluZyB0byBhc2sgdGhlIHF1ZXN0aW9uIHdoZW4gdGhlIGFuc3dl
ciBtYXkgZW5kCj4gdXAgYmVpbmcgZGlzY2FyZGVkLgo+Cj4gV2hpbGUgaW4gdGhlIG5laWdoYm9y
aG9vZCBhbHNvIGJyaW5nIFBWX1NISU1fRVhDTFVTSVZFIGludG8gbW9yZQo+ICJjYW5vbmljYWwi
IHNoYXBlLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
