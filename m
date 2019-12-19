Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A497125E8F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 11:09:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihsea-0006JA-8B; Thu, 19 Dec 2019 10:03:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SZrV=2J=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1ihseY-0006J1-QE
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 10:03:30 +0000
X-Inumbo-ID: c1e054dc-2246-11ea-a914-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1e054dc-2246-11ea-a914-bc764e2007e4;
 Thu, 19 Dec 2019 10:03:08 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 20so4828732wmj.4;
 Thu, 19 Dec 2019 02:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=hlmutj29Mv+oNv5ld2Or2ujG/4pVcFrZodzfldMf1oQ=;
 b=FtAsu6AQ+X/QB7TD9tgObM1SEqgIw8QB5P+4fkAM/s4SuYfC0mIKmEAmZV+fsvNASA
 ykhN2rJ7DD2b5/89/f8GAgqZQTG9Z210ZwgOyq6KTt7nKY3CvgdqGlUq/AUARuk9VZAM
 C8U8qf7kKI8s2WPGLvxlzDOkA5FnhQITJri7OCxP1rRnuMxiGCrZHQ92nfUecaIFXayx
 8mA2mCPX4dewu87DmiAv0F/XGRxOQJowo4fcLPVG9zvPP5txU8RiPfmeySs09gXAAHJh
 F/+uYrek+NJvcZqOeA8SHtaA/WhU8T7seE7zMHhf/tuN3oJ6u+qtH3r8hr4EcFPADv4k
 G56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=hlmutj29Mv+oNv5ld2Or2ujG/4pVcFrZodzfldMf1oQ=;
 b=TV635rsr/Omd+HCa/61WkFW4lTFYYb7Mk3SxDUSr9zQus9YRpG/0/c8bfeIq18eRV2
 rm0qoxb499d9PDKLuubCydIMaE9BMiditI3W0yKGj4yT1kjPune+X6cgmM5RhYl2wGdZ
 j/Ef8taOy55KkyHvThARLiWIjiHBVV8nmZN5VTcupU3wtyedfq9Y4KYvP2PQ8eFVxW5z
 rITnmp4XhMCFAF33lwXfwD92FWiJq2V6HbZ9cf+GDGYedYCeJsydhY5dJyeGlwzwq3k0
 bwDK+iqpsYgLii1wzMZ5q03+FAPB/jcubSMjUi678z03EwExVxeIP6GJvM+85BOeYAOh
 z+wQ==
X-Gm-Message-State: APjAAAUQkKruSykzvB0HANUkZblN3rV7dVU8sRa855jeBueQRUI1Ulks
 h/S8sIx7WbEewEbEWusO5uwBEoDA
X-Google-Smtp-Source: APXvYqx44/U9WE8B4+fooFTBnqb6tsRL7SH4SVAZmmrqswvjxSsAaTauIxlTjsgIHDZU18QU5SLs1Q==
X-Received: by 2002:a05:600c:2207:: with SMTP id
 z7mr8693903wml.138.1576749787471; 
 Thu, 19 Dec 2019 02:03:07 -0800 (PST)
Received: from ?IPv6:2a01:4c8:1038:6f39:cd58:18e8:a347:8ea6?
 ([2a01:4c8:1038:6f39:cd58:18e8:a347:8ea6])
 by smtp.gmail.com with ESMTPSA id u13sm5636149wmd.36.2019.12.19.02.03.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Dec 2019 02:03:06 -0800 (PST)
From: Lars Kurth <lars.kurth.xen@gmail.com>
X-Google-Original-From: Lars Kurth <lars.kurth@xenproject.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
In-Reply-To: <1ed2d421-7dfe-1d92-5edc-7f11e8409ff7@suse.com>
Date: Thu, 19 Dec 2019 10:03:04 +0000
Message-Id: <3A37215A-9402-4611-B5EE-1CA4D1218F87@xenproject.org>
References: <cover.1576184325.git.lars.kurth@citrix.com>
 <98ab54c95a9541c918dfec529bcfc5867fd3ed33.1576184325.git.lars.kurth@citrix.com>
 <7a043307-f23f-c537-012b-393f59617c1c@xen.org>
 <0DE885E1-C4C3-447A-8408-88D43B9FE355@citrix.com>
 <1ed2d421-7dfe-1d92-5edc-7f11e8409ff7@suse.com>
To: 'Jan Beulich' <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3445.104.11)
Subject: Re: [Xen-devel] [PATCH v3 5/7] Add Code Review Guide
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
Cc: Lars Kurth <lars.kurth@citrix.com>, Julien Grall <julien@xen.org>,
 "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDE5IERlYyAyMDE5LCBhdCAwOTo1NiwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPiB3cm90ZToKPiAKPiBPbiAxOC4xMi4yMDE5IDE4OjA5LCBMYXJzIEt1cnRoIHdyb3RlOgo+
PiAKPj4gCj4+IO+7v09uIDE4LzEyLzIwMTksIDE0OjI5LCAiSnVsaWVuIEdyYWxsIiA8anVsaWVu
QHhlbi5vcmc+IHdyb3RlOgo+PiAKPj4gICAgSGkgTGFycywKPj4gCj4+ICAgIE9uIDEyLzEyLzIw
MTkgMjE6MTQsIExhcnMgS3VydGggd3JvdGU6Cj4+PiArIyMjIFdvcmtmbG93IGZyb20gYW4gQXV0
aG9yJ3MgUGVyc3BlY3RpdmUKPj4+ICsKPj4+ICtXaGVuIGNvZGUgYXV0aG9ycyByZWNlaXZlIGZl
ZWRiYWNrIG9uIHRoZWlyIHBhdGNoZXMsIHRoZXkgdHlwaWNhbGx5IGZpcnN0IHRyeQo+Pj4gK3Rv
IGNsYXJpZnkgZmVlZGJhY2sgdGhleSBkbyBub3QgdW5kZXJzdGFuZC4gRm9yIHNtYWxsZXIgcGF0
Y2hlcyBvciBwYXRjaCBzZXJpZXMKPj4+ICtpdCBtYWtlcyBzZW5zZSB0byB3YWl0IHVudGlsIHJl
Y2VpdmluZyBmZWVkYmFjayBvbiB0aGUgZW50aXJlIHNlcmllcyBiZWZvcmUKPj4+ICtzZW5kaW5n
IG91dCBhIG5ldyB2ZXJzaW9uIGFkZHJlc3NpbmcgdGhlIGNoYW5nZXMuIEZvciBsYXJnZXIgc2Vy
aWVzLCBpdCBtYXkKPj4+ICttYWtlIHNlbnNlIHRvIHNlbmQgb3V0IGEgbmV3IHJldmlzaW9uIGVh
cmxpZXIuCj4+PiArCj4+PiArQXMgYSByZXZpZXdlciwgeW91IG5lZWQgc29tZSBzeXN0ZW0gdGhh
dCBoZTtwcyBlbnN1cmUgdGhhdCB5b3UgYWRkcmVzcyBhbGwKPj4gCj4+ICAgIEp1c3QgYSBzbWFs
bCB0eXBvOiBJIHRoaW5rIHlvdSBtZWFudCAiaGVscHMiIHJhdGhlciB0aGFuICJoZTtwcyIuCj4+
IAo+PiAgICBDaGVlcnMsCj4+IAo+PiBUaGFuayB5b3U6IGZpeGVkIGluIG15IHdvcmtpbmcgY29w
eS4KPj4gCj4+IE9uZSB0aGluZyB3aGljaCBvY2N1cnJlZCB0byBtZSBmb3IgcmV2aWV3cyBsaWtl
IHRoZXNlLCB3aGVyZSB0aGVyZSBpcyBubyBBQ0sncyBvciBSZXZpZXdlZC1ieSdzIGlzIHRoYXQg
SSBkb24ndCBhY3R1YWxseSBrbm93IHdoZXRoZXIgeW91IGFzIHJldmlld2VyIGlzIG90aGVyd2lz
ZSBoYXBweSB3aXRoIHRoZSByZW1haW5kZXIgb2YgdGhlIHBhdGNoLgo+PiBOb3JtYWxseSB0aGUg
QUNLZWQtYnkgb3IgUmV2aWV3ZWQtYnkgaXMgYSBzaWduYWwgdGhhdCBpdCBpcwo+PiAKPj4gSSBh
bSBhc3N1bWluZyBpdCBpcywgYnV0IEkgdGhpbmsgaXQgbWF5IGJlIHdvcnRod2hpbGUgcG9pbnRp
bmcgdGhpcyBvdXQgaW4gdGhlIGRvY3VtZW50LCB0aGF0IHVubGVzcyBzdGF0ZWQgb3RoZXJ3aXNl
LCB0aGUgcmV2aWV3ZXIgaXMgaGFwcHkgd2l0aCB0aGUgcGF0Y2gKPiAKPiBJIGRvbid0IHRoaW5r
IHRoZXJlIHNob3VsZCBldmVyIGJlIHN1Y2ggYW4gaW1wbGljYXRpb24uIEFmYWljIHRoZXJlCj4g
YXJlIHBhdGNoZXMgSSBjb21tZW50IHVwb24sIGJ1dCB0aGF0IEkgZWl0aGVyIGRvbid0IGZlZWwg
cXVhbGlmaWVkCj4gdG8gZ2l2ZSBhbiBhY2svUi1iIG9uLCBvciB0aGF0IEkgc2ltcGx5IGRvbid0
IHdhbnQgdG8gZm9yIHdoYXRldmVyCj4gcmVhc29uLiBBdCBiZXN0LCBubyBvdGhlciBjb21tZW50
IChhcyBpbiB0aGUgYWJvdmUgZXhhbXBsZSkgbWF5IGJlCj4gdGFrZW4gYXMgIkkgZG9uJ3Qgb2Jq
ZWN0Ii4KCgpJZiB0aGF0IGlzIHRoZSBjYXNlLCB3b3VsZCB0aGVyZSBiZSBhIHJlYXNvbmFibGUg
Y29udmVudGlvbiB0byBtYWtlIHRoaXMgY2xlYXI/IAoKSW4gYSBudXRzaGVsbCwgaW4gc3VjaCBh
IHJldmlldyB0aGUgcG9zc2libGUgaW50ZXJwcmV0YXRpb25zIGFyZQoqIEkgcmV2aWV3ZWQsIGJ1
dCBkaWRuJ3QgZmVlbCBxdWFsaWZpZWQgdG8gZG8gdGhlIHJlc3QKKiBJIHJldmlld2VkLCBidXQg
ZGlkIG5vdCBnZXQgcm91bmQgdG8gZ2l2ZSBpdCBmdWxsIGF0dGVudGlvbgoqIEkgcmV2aWV3ZWQs
IGJ1dCBiZWZvcmUgSSBtYWtlIGEgZmluYWwgZGVjaXNpb24gd2FudCB0byBsb29rIGF0IHRoZSBu
ZXh0IHZlcnNpb24KLi4uCiogSSByZXZpZXdlZCBhbmQgZG9uJ3Qgb2JqZWN0IHRoZSByZXN0Ciog
SSByZXZpZXdlZCBhbmQgYWdyZWVkIHdpdGggdGhlIHJlc3QgClRoZSBsYXR0ZXIgdHdvIGFyZSBl
cXVpdmFsZW50IHRvIEFjay9SLWIKClRoYXQgaXMgcXVpdGUgYSBsYXJnZSByYW5nZSBvZiBwb3Nz
aWJpbGl0aWVzIGFuZCBraW5kIG9mIGxlYXZlcyB0aGUgYXV0aG9yIGd1ZXNzaW5nIHdoYXQgc3Rh
dGUgdGhlIHJldmlldyBpcyBpbgoKUmVnYXJkcwpMYXJzCgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
