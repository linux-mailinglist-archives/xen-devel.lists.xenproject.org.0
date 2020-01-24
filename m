Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D61F1148672
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 15:01:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuzU9-0006cz-CU; Fri, 24 Jan 2020 13:58:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s6by=3N=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1iuzU7-0006ck-H5
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 13:58:55 +0000
X-Inumbo-ID: a3f2cc3e-3eb1-11ea-b833-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3f2cc3e-3eb1-11ea-b833-bc764e2007e4;
 Fri, 24 Jan 2020 13:58:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1579874327; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=qO4PUWnZjFrRD2+8hgxxHHH1j2LOvQC2ph3ejLZqzfs=;
 b=TRlE3jhes0DNYNnnPhUTAabkWnd/y2qThgfTiXN9tJDFJKxhl/LuymuyyhMgvN4fJTES4xh6
 EdJ8NPHoMKoBxtRJXqcQ+Dql+xgjifIYehXCzhnrphYzAfY913MPwR7foFAf2hCtZUrFbMNw
 /1s4gW/x9SAB4GQAvf/UrVtZ3yI=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mxa.mailgun.org with ESMTP id 5e2af816.7fc8f75edbf0-smtp-out-n03;
 Fri, 24 Jan 2020 13:58:46 -0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id d16so2071509wre.10
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2020 05:58:45 -0800 (PST)
X-Gm-Message-State: APjAAAW1TswKtNU7NxkJISZ4VHySBNRc7pyt0939efkHH4IDxxB4CMn/
 I40fQwji4w3gcYz3mza/pEHZIM6qzu9hKTsbwVc=
X-Google-Smtp-Source: APXvYqyM6txGNGXK5BrWxIxG8Yxj+f5I9mvCOcrM3d1aIM/bLZgCiR21buqS5GTjIMc2xL57K8AVV6b0MmMl/EIhVck=
X-Received: by 2002:adf:9c8f:: with SMTP id d15mr4748390wre.390.1579874325023; 
 Fri, 24 Jan 2020 05:58:45 -0800 (PST)
MIME-Version: 1.0
References: <b0b0c6db-7215-bb31-a1eb-722d13c72cdc@suse.com>
 <7a21c52f-8dfb-6e03-9789-f8588dbae531@citrix.com>
 <08875fe8-e5dc-2ce6-4ead-b18b49357585@suse.com>
In-Reply-To: <08875fe8-e5dc-2ce6-4ead-b18b49357585@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 24 Jan 2020 06:58:08 -0700
X-Gmail-Original-Message-ID: <CABfawhk0vTdPoOEy7r4VkG6D+ESLzMg_TEyGD1+Kkbb1zRDOig@mail.gmail.com>
Message-ID: <CABfawhk0vTdPoOEy7r4VkG6D+ESLzMg_TEyGD1+Kkbb1zRDOig@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH] Arm/p2m: fix build after ea22bcd030da and
 2aa977eb6baa
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <ian.jackson@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMjQsIDIwMjAgYXQgNTo1MCBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMjQuMDEuMjAyMCAxMTowNSwgR2VvcmdlIER1bmxhcCB3cm90
ZToKPiA+IE9uIDEvMjQvMjAgODo1MSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4gRWFjaCBv
ZiB0aGVzZSBjb21taXRzIGludHJvZHVjZWQgYSBmdW5jdGlvbiBwcm90b3R5cGUgcmVmZXJlbmNp
bmcgYQo+ID4+IHN0cnVjdHVyZSB3aGljaCBoYWRuJ3QgYXQgbGVhc3QgYmVlbiBmb3J3YXJkIGRl
Y2xhcmVkLiBBZGQgc3VjaAo+ID4+IGRlY2xhcmF0aW9ucy4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+Cj4gPiBBY2tlZC1ieTogR2Vv
cmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgo+Cj4gVGhhbmtzLgo+Cj4gPiBJ
IHdvdWxkbid0IG9iamVjdCBpZiB5b3UgZGVjaWRlZCB0byBjaGVjayB0aGVzZSBpbiBpbW1lZGlh
dGVseSwgZ2l2ZW4KPiA+IHRoYXQgaXQncyBhIHNpbXBsZSBmaXggd2hpY2ggdW4tYnJlYWtzIHRo
ZSBidWlsZC4KPgo+IERvbmUuCgpUaGFua3MgZm9yIHRoZSBmYXN0IGZpeC4gSSBzZW50IGEgZm9s
bG93IHVwIHBhdGNoIHRoYXQgcmVsb2NhdGVzIHRoZQpWRSBmdW5jdGlvbnMgdG8geDg2LiBUaGVz
ZSByZWFsbHkgc2hvdWxkIG5vdCBoYXZlIGJlZW4gYWRkZWQgdG8gdGhlCmNvbW1vbiBoZWFkZXIg
dG8gYmVnaW4gd2l0aC4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
