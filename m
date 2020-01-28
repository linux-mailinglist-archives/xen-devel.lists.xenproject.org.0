Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1732514AE73
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 04:41:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwHhH-0004XS-ES; Tue, 28 Jan 2020 03:37:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pl1b=3R=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1iwHhG-0004XN-N2
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 03:37:50 +0000
X-Inumbo-ID: 8ec52e58-417f-11ea-aafc-bc764e2007e4
Received: from mail-yb1-xb42.google.com (unknown [2607:f8b0:4864:20::b42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ec52e58-417f-11ea-aafc-bc764e2007e4;
 Tue, 28 Jan 2020 03:37:50 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id l197so6094108ybf.7
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2020 19:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=9SDqd50+CdonC4Pkn+3vE85P4Rl4PNN2CEBpcKEvJjg=;
 b=C0WhU9akg4e3J/gIXn0HbYTh0aj8sEsq7AzTrd3TfhxvZkQZBBEqeIU0hythmMTmTk
 V7ec5G4OeLCgYzzn8n1cv3ImWoknl7FUMkP+vsDH4FSy8z9CySpX9S783HbVG6IOuXwh
 XypZtM+q3ctvwhIfgtUfvmrMSCMjB/8LDnkBtb7pDEfA5fUdUvSRAoObYY2KMaaVpI5B
 VV83vBEj5Brdpx7rtqttoAZ8x7FeVwaJjT1UBAZIYjrNeWDefx8366wjOR8yFNZyiNiW
 Hr/8ZpsotbNFuXy2xULvHNvdJYj0UKtEUQH2xHT2ItSmxSs8UZDaQE+CkxyCycj4WXoh
 lpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9SDqd50+CdonC4Pkn+3vE85P4Rl4PNN2CEBpcKEvJjg=;
 b=VZy9YtAvwefeWknd1XkMu8/ke1L1k9zTAVKq9nVOD0/aVCls5OlRl4Ht1Le4k3dyxY
 QNUlRzFUFF4ohyH7kVxJQphTncqVRgvqiLMpGYzjOLaoTOZO3+CNhdiXFf4W/oSV1AIb
 UvyiGHhHEE2WIWiHoyQRTH4bP9WvyLflrFrk4we6Dt1QwGiqnSBKSupYSA0IPxMlqDwp
 gvUvVkNb3ur4CgBDB95m8Jx+RwbWzCRT+hmUnGRqWKSADEBIo7Ne/nxE/Z5Dp0o1my3C
 0VI0dAJWKwhR1l6REXdc7q0dbicaubPCGxIdSSacdjlCkvRchsTpZJzPVQcpzsHxK+bQ
 SC+g==
X-Gm-Message-State: APjAAAV/9yHVXGZO+asLAWUMwb7HKrwBxaJ9/K9ajbdzs00wgQf0ybZo
 n5ZLrkoTwZKa/BqrfsK4/A0=
X-Google-Smtp-Source: APXvYqxmdQu/oUQnytmcw/nNVM/Nt/Y5l7AThC3X3G7Xbiv3SbH2bXNf+wA/njfSwKDIComD61007g==
X-Received: by 2002:a5b:e8e:: with SMTP id z14mr13796432ybr.392.1580182669490; 
 Mon, 27 Jan 2020 19:37:49 -0800 (PST)
Received: from bobbye-pc ([216.186.244.35])
 by smtp.gmail.com with ESMTPSA id d66sm6133180ywc.16.2020.01.27.19.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 19:37:48 -0800 (PST)
Date: Mon, 27 Jan 2020 21:37:46 -0600
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200128033746.GA26308@bobbye-pc>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
 <abbe5c9f-46e2-af76-a7ff-d98c55fa364f@citrix.com>
 <20200125032655.GC11702@bobbye-pc>
 <2ddf3f61-91d9-2492-ff31-f78cc9b445dd@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ddf3f61-91d9-2492-ff31-f78cc9b445dd@citrix.com>
Subject: Re: [Xen-devel] [RFC XEN PATCH 00/23] xen: beginning support for
 RISC-V
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Dan Robertson <dan@dlrobertson.com>,
 Alistair Francis <alistair.francis@wdc.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCBKYW4gMjUsIDIwMjAgYXQgMDU6MTE6MThQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyNS8wMS8yMDIwIDAzOjI2LCBCb2JieSBFc2hsZW1hbiB3cm90ZToKPiA+IE9u
IEZyaSwgSmFuIDI0LCAyMDIwIGF0IDAxOjQxOjM4UE0gKzAwMDAsIEFuZHJldyBDb29wZXIgd3Jv
dGU6Cj4gPj4gT3RoZXIgYXJlYXMgd2hlcmUgeW91IGNhbiByZWR1Y2UgdGhlIG1pbmltdW0gYnVp
bGQgd291bGQgYmUgdG8gcHV0IHNvbWUKPiA+PiBkZWZhdWx0cyBpbnRvIHRoZSBkZWZjb25maWcs
IHN1Y2ggYXMgZGlzYWJsaW5nIGdyYW50IHRhYmxlcyBhbmQgbWVtCj4gPj4gYWNjZXNzLsKgIFRo
ZXJlIGFyZSBhbG1vc3QgY2VydGFpbmx5IG90aGVycyB3aGljaCB3aWxsIGhlbHAsIHNvIGhhdmUg
YQo+ID4+IHNlYXJjaCBhcm91bmQgbWVudWNvbmZpZy4KPiA+IFRha2luZyBub3RlIG9mIHRoZXNl
LCBJIGNhbiBkZWZpbml0ZWx5IGRvIHRoYXQuCj4gCj4gVG8gZm9yZS13YXJuIHlvdSwgdGhlcmUg
cHJvYmFibHkgd2lsbCBiZSBtb3JlIHRoaW5ncyBsaWtlIHRoaXMgd2hpY2gKPiBiZWNvbWUgYXBw
YXJlbnQgb24gZnVydGhlciByZXZpZXcuCj4gCj4gV2hpbGUgSSBkb24ndCBleHBlY3QgeW91IHRv
IGRvIGFsbCB0aGUgY2xlYW51cCAoc29tZSB3aWxsIGFsbW9zdAo+IGNlcnRhaW5seSBiZSBxdWlj
a2VyIGZvciBvdGhlcnMgdG8gZG8pLCBJIHdvdWxkIGxpa2UgdG8gdGFrZSB0aGUKPiBvcHBvcnR1
bml0eSB0byBkbyB0aGUgb2J2aW91cyBiaXRzIG9mIGNsZWFudXAsIGdpdmVuIHRoZSByYXJlCj4g
b3Bwb3J0dW5pdHkgb2Ygc2VlaW5nIHRoZSBtaW5pbXVtIHZpYWJsZSBzZXQgb2YgdGhpbmdzIHRv
IG1ha2UgYSBuZXcKPiBhcmNoIGNvbXBpbGUuCgpUaGlzIHNvdW5kcyB2ZXJ5IHJlYXNvbmFibGUu
Cgo+IFRoaXMgbG9va3MgdG8gYmUgdGhlIHNhbWUgYXMgd2hhdCB3ZSd2ZSBjaG9zZW4gdG8gZG8g
aW4geDg2LCBnaXZlIG9yCj4gdGFrZSBhIGZlbmNlcG9zdC4KPiAKPiBJJ2QgcmVjb21tZW5kIHVz
aW5nIEx7My4uMH0gZm9yIHNpbWlsYXJpdHkgd2l0aCB0aGUgc3BlYyAoeW91IHN1cmVseQo+IGRv
bid0IHdhbnQgYW4gb2ZmLWJ5LW9uZSBkaWZmZXJlbmNlIGJldHdlZW4gY29kZSBpbiBYZW4gYW5k
IHRoZSBzcGVjKS7CoAo+IFdoYXRldmVyIHlvdSBlbmQgdXAgY2hvb3NpbmcsIHB1dCBhIGRlc2Ny
aXB0aW9uIGF0IHRoZSB0b3Agb2YgbW0uaCAob3IKPiB3aGVyZXZlciBhcHByb3ByaWF0ZSkgd2hp
Y2ggYnJpZWZseSBpbnRyb2R1Y2VzIHRoZSB0ZXJtaW5vbG9neSBpbiBYZW4sCj4gYW5kIGNyb3Nz
IHJlZmVyZW5jZXMgYW55IGRpZmZlcmVuY2VzIHdpdGggdGhlIHNwZWMuCgpSb2dlciB0aGF0LgoK
VGhhbmtzIGFnYWluIGZvciB0aGUgZmVlZGJhY2suCgotQm9iYnkKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
