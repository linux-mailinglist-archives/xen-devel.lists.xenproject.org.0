Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5949F145773
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 15:07:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuGdE-0004e2-Bo; Wed, 22 Jan 2020 14:05:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kXAC=3L=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1iuGdD-0004dw-4U
 for xen-devel@lists.xen.org; Wed, 22 Jan 2020 14:05:19 +0000
X-Inumbo-ID: 36e7c3e9-3d20-11ea-bc49-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36e7c3e9-3d20-11ea-bc49-12813bfff9fa;
 Wed, 22 Jan 2020 14:05:16 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q10so7365515wrm.11
 for <xen-devel@lists.xen.org>; Wed, 22 Jan 2020 06:05:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nTDawKBuPPz3RFrkaA7TRY9Jia2zninb0DeM+/pbQ8U=;
 b=ACA5P0k1G238KQWW3hm85iYtz+n6yU+oOpDxBniMOaSSvnKCBn2J7DUq2HF89/hNzs
 L/AGlY3wH4vk5neK3QyWIREvUb+f+vPiDtQAb3Te+suWBLl3Zq0pFqv4+qId4tmM+3vj
 fbKsolvAl1NpDd6qlg3gPo4tlXS+frHF/+sKzTiEYXIYYeeLSf3+QmqiG3PnMIolYzjA
 BSdN+Q8NKKC/nbU9yzSsjFi8RGK9N2NmZjotqgNJyRL1avZVfRpgeaCUGVfsnE82W2/m
 AAY5qDqBY66lEBNOkZvxLxlt5E+07rJZpYVJmySlzo0oIsQ/+h+snvE00f/NvDQfOnOn
 H3zw==
X-Gm-Message-State: APjAAAXxlmH8ATKoHld4yWp79hz337E51T6qjTr35sioQqO72ilqrUE9
 nAnlUUcEpaM8PHkhus3h9BY=
X-Google-Smtp-Source: APXvYqxlAP+/wQo+U5G/hC5nhSUhqcfVX0b3qdlQz+EBZiRxKCsql6s8v1dOdo8DVwgg6iphafdn3g==
X-Received: by 2002:a05:6000:1241:: with SMTP id
 j1mr11170497wrx.26.1579701916005; 
 Wed, 22 Jan 2020 06:05:16 -0800 (PST)
Received: from debian (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id b137sm4417661wme.26.2020.01.22.06.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 06:05:15 -0800 (PST)
Date: Wed, 22 Jan 2020 14:05:12 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Message-ID: <20200122140512.zxtld5sanohpmgt2@debian>
References: <20200117125834.14552-1-sergey.dyasli@citrix.com>
 <20200117125834.14552-5-sergey.dyasli@citrix.com>
 <CACCGGhApXXnQwfBN_LioAh+8bk-cAAQ2ciua-MnnQoMBUfap6g@mail.gmail.com>
 <85b36733-7f54-fdfd-045d-b8e8a92d84c5@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <85b36733-7f54-fdfd-045d-b8e8a92d84c5@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2 4/4] xen/netback: fix grant copy across
 page boundary
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Paul Durrant <pdurrant@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, xen-devel@lists.xen.org, linux-mm@kvack.org,
 Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjIsIDIwMjAgYXQgMTA6MDc6MzVBTSArMDAwMCwgU2VyZ2V5IER5YXNsaSB3
cm90ZToKPiBPbiAyMC8wMS8yMDIwIDA4OjU4LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPiBPbiBG
cmksIDE3IEphbiAyMDIwIGF0IDEyOjU5LCBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gRnJvbTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFn
ZXJ3YWxsQGNpdHJpeC5jb20+Cj4gPj4KPiA+PiBXaGVuIEtBU0FOIChvciBTTFVCX0RFQlVHKSBp
cyB0dXJuZWQgb24sIHRoZXJlIGlzIGEgaGlnaGVyIGNoYW5jZSB0aGF0Cj4gPj4gbm9uLXBvd2Vy
LW9mLXR3byBhbGxvY2F0aW9ucyBhcmUgbm90IGFsaWduZWQgdG8gdGhlIG5leHQgcG93ZXIgb2Yg
MiBvZgo+ID4+IHRoZSBzaXplLiBUaGVyZWZvcmUsIGhhbmRsZSBncmFudCBjb3BpZXMgdGhhdCBj
cm9zcyBwYWdlIGJvdW5kYXJpZXMuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBSb3NzIExhZ2Vy
d2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBTZXJn
ZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+Cj4gPj4gLS0tCj4gPj4gdjEgLS0+
IHYyOgo+ID4+IC0gVXNlIHNpemVvZl9maWVsZChzdHJ1Y3Qgc2tfYnVmZiwgY2IpKSBpbnN0ZWFk
IG9mIG1hZ2ljIG51bWJlciA0OAo+ID4+IC0gU2xpZ2h0bHkgdXBkYXRlIGNvbW1pdCBtZXNzYWdl
Cj4gPj4KPiA+PiBSRkMgLS0+IHYxOgo+ID4+IC0gQWRkZWQgQlVJTERfQlVHX09OIHRvIHRoZSBu
ZXRiYWNrIHBhdGNoCj4gPj4gLSB4ZW52aWZfaWR4X3JlbGVhc2UoKSBub3cgbG9jYXRlZCBvdXRz
aWRlIHRoZSBsb29wCj4gPj4KPiA+PiBDQzogV2VpIExpdSA8d2VpLmxpdUBrZXJuZWwub3JnPgo+
ID4+IENDOiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KPiA+Cj4gPiBBY2tlZC1ieTogUGF1
bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+Cj4gCj4gVGhhbmtzISBJIGJlbGlldmUgdGhpcyBwYXRj
aCBjYW4gZ28gaW4gaW5kZXBlbmRlbnRseSBmcm9tIHRoZSBvdGhlcgo+IHBhdGNoZXMgaW4gdGhl
IHNlcmllcy4gV2hhdCBlbHNlIGlzIHJlcXVpcmVkIGZvciB0aGlzPwoKVGhpcyBwYXRjaCBkaWRu
J3QgQ2MgdGhlIG5ldHdvcmsgZGV2ZWxvcG1lbnQgbGlzdCBzbyBEYXZpZCBNaWxsZXIKd291bGRu
J3QgYmUgYWJsZSB0byBwaWNrIGl0IHVwLgoKV2VpLgoKPiAKPiAtLQo+IFNlcmdleQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
