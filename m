Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 890AA7D33B4
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 13:33:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621381.967789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qutAh-0003Uj-L1; Mon, 23 Oct 2023 11:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621381.967789; Mon, 23 Oct 2023 11:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qutAh-0003T4-IT; Mon, 23 Oct 2023 11:32:35 +0000
Received: by outflank-mailman (input) for mailman id 621381;
 Mon, 23 Oct 2023 11:32:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RLV=GF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qutAg-0003Sy-1U
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 11:32:34 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db46a571-7197-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 13:32:32 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5079fa1bbf8so4613506e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 04:32:32 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 k27-20020ac2457b000000b0050794b05c8asm1642883lfm.42.2023.10.23.04.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 04:32:31 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: db46a571-7197-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698060752; x=1698665552; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4SDCtlIcWoQh+/F5iDhmYwo0s0iC8aYTSmymX3sfzVA=;
        b=WlFdzF9EA0C2y2wiluRoyBAv5B3Xvsecn4tfy8LMZv/kTEylfqLDjcgYti7Xept3i/
         slqKIpTE9IySyC/MDB24AZDbPvSa5v33VRgFUwW1fq8XjFFs6+jk6aFMom337L6nRe1M
         9HD0+JkP4Ms1TruMYA0RGTX7WB8LMEhAg3rAhJktqfbMqTuyUJBtXIt20l4VMkdAadQJ
         p0/7M2ntarhuy9uIJ7qhRvkINmLLeZIBHhKKzCpih32xY27jRcZ3mjN0PkcMetwEhdrJ
         MrdXxgh4+aaQyWmh/voheScX50DXFEZqH9BjXj+oNssRH+hA48tlwIw+0GIf1sy6hutf
         GCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698060752; x=1698665552;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4SDCtlIcWoQh+/F5iDhmYwo0s0iC8aYTSmymX3sfzVA=;
        b=rM1gqocImjVSUdwtWFapxfaTC4Kb/Ru/kR7pp+Yuu7UzTKo2LtWkY4RUCrlVGsCXHX
         K3ezCtJGg4ZOyu/oIElEnCxd0H7yzzrAix8dcyR0P69Lytf6NDRSFE0vV69bbIsa2Tig
         f8CRpCILnhWG9dsY0c1pf2KAz1G1HCT4TAzvm+DWnFoK6ukYTr8eRsHbFYBSZ6DxZPc0
         uTVAvtTTC7Rm2W9eBGOQREyM5KjthGla2jUkmcn9DaDfXl8ktIPR/s0YrvaJgp/5KysJ
         ZDjV/gFn5oNEOXPhP9kppg/FvP2i0gXGgph/l+NJbmv4WmGBl0yKoSrgabpjOZ/twGD7
         dSGw==
X-Gm-Message-State: AOJu0Yx5W7PRvNGBzM4i3uOutH4a7RNSYjsTGblrc70w480/D2BKFa3i
	uIyDYZhst16ro+IXqIanQUo=
X-Google-Smtp-Source: AGHT+IHmbY/gq7K+NTyCHWXuibZ0q9/K+TJ3Agd7SqAmalVGS0ugHBI5Wa+mGi1yrPYVTbKXDHGmKw==
X-Received: by 2002:a19:655d:0:b0:507:9d70:b297 with SMTP id c29-20020a19655d000000b005079d70b297mr5519418lfj.60.1698060752076;
        Mon, 23 Oct 2023 04:32:32 -0700 (PDT)
Message-ID: <89edae543f03881ca371ff5dbfabe7daa977df1b.camel@gmail.com>
Subject: Re: [PATCH v1 20/29] xen/asm-generic: introduce stub header div64.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Mon, 23 Oct 2023 14:32:31 +0300
In-Reply-To: <337bcd1c-dfc5-cbe6-8e05-7fc640dde165@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <0c006d03b917924c411e563dcdc8043498be48b3.1694702259.git.oleksii.kurochko@gmail.com>
	 <337bcd1c-dfc5-cbe6-8e05-7fc640dde165@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

T24gVGh1LCAyMDIzLTEwLTE5IGF0IDEzOjEyICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAxNC4wOS4yMDIzIDE2OjU2LCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gLS0tIC9kZXYv
bnVsbAo+ID4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWdlbmVyaWMvZGl2NjQuaAo+ID4gQEAgLTAs
MCArMSwyNCBAQAo+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkg
Ki8KPiA+ICsjaWZuZGVmIF9fQVNNX0dFTkVSSUNfRElWNjQKPiA+ICsjZGVmaW5lIF9fQVNNX0dF
TkVSSUNfRElWNjQKPiA+ICsKPiA+ICsjaW5jbHVkZSA8eGVuL3R5cGVzLmg+Cj4gPiArCj4gPiAr
IyBkZWZpbmUgZG9fZGl2KG4sYmFzZSkgKHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArwqDCoMKg
wqDCoMKgwqAgdWludDMyX3QgX19iYXNlID0gKGJhc2UpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArwqDCoMKgwqDCoMKg
wqAgdWludDMyX3QgX19yZW07wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoMKg
wqDCoMKgIF9fcmVtID0gKCh1aW50NjRfdCkobikpICUgX19iYXNlO8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKgwqDCoMKgwqDCoCAobikgPSAo
KHVpbnQ2NF90KShuKSkgLyBfX2Jhc2U7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKgwqDCoMKgwqDCoCBfX3JlbTvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArIH0pCj4gCj4gV2hpbGUgSSdtIGZp
bmUgd2l0aCBoYXZpbmcganVzdCB0aGUgQklUU19QRVJfTE9ORyA9PSA2NAo+IGltcGxlbWVudGF0
aW9uCj4gaGVyZSwgdGhpcyB0aGVuIHN0aWxsIG5lZWRzIHRvIGhhdmUgdGhlICNpZiByZXRhaW5l
ZCB0aGF0IEFybSBoYXMuCj4gT25seQo+IHdpdGggdGhhdCB3aWxsIGl0IHRoZW4gYmUgZmluZSB0
byBoYXZlIGEgYmxhbmsgYmV0d2VlbiAjIGFuZCBkZWZpbmUuCj4gCj4gVGhlcmUgYXJlIHN0eWxl
IGlzc3VlcyB0aG91Z2g6IEEgYmxhbmsgaXMgbWlzc2luZyBhZnRlciB0aGUgY29tbWEsCj4gYW5k
IGFjY29yZGluZyB0byByZWNlbnQgYWdyZWVtZW50IGxlYWRpbmcgdW5kZXJzY29yZXMgc2hvdWxk
IG5vdCBiZQo+IHVzZWQgZm9yIHN5bWJvbHMgbGlrZSB0aGUgb25lcyBoZXJlIGFueW1vcmUgKEkg
YWxzbyB3b25kZXIgd2hldGhlcgo+ICJiYXNlIiBpcyByZWFsbHkgYSBnb29kIG5hbWUgZm9yIHRo
ZSBzeW1ib2w7ICJkaXZpc29yIiBtYXkgYmUgbW9yZSB0bwo+IHRoZSBwb2ludCkuIFRoZXJlIGFy
ZSBhbHNvIGV4Y2VzcyBwYXJlbnRoZXNlcyBhcm91bmQgdGhlIHR3byBjYXN0Cj4gZXhwcmVzc2lv
bnMuClRoYW5rcy4gSSdsbCB0YWtlIG1lbnRpb25lZCBpbnRvIGFjY291bnQuCgp+IE9sZXNraWkK



