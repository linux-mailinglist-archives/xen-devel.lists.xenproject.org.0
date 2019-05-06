Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DA015304
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 19:45:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNhd6-000407-0g; Mon, 06 May 2019 17:42:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qyPQ=TG=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hNhd4-000402-Fc
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 17:42:18 +0000
X-Inumbo-ID: 45f20578-7026-11e9-9cd2-1bf5f9ac2813
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45f20578-7026-11e9-9cd2-1bf5f9ac2813;
 Mon, 06 May 2019 17:42:09 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1557164529; h=Content-Transfer-Encoding: Content-Type: Cc: To:
 Subject: Message-ID: Date: From: In-Reply-To: References: MIME-Version:
 Sender; bh=0oncXAH3VDM+m9gyjPr3mzx5lk05owjtaz1woZhtUY8=;
 b=aNVaQuFqRgI5y7591rPJE/LFkCeYJmA2qHtXcp+qHFIEsXF80HaQ9wFiL3u1naWYd2R0p6Tu
 K3mvQYo/Q1pm/0MhLYcC0uA5gUXENjn0lLCnkiTWkjjCSa2PtEhPqSbVKRRDnlpP80L9fUNm
 inVj8FhZ0yEzCNuHlIThm9+ha0A=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mxa.mailgun.org with ESMTP id 5cd071f1.7fd939df8770-smtp-out-n02;
 Mon, 06 May 2019 17:42:09 -0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id h11so16189667wmb.5
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 10:42:08 -0700 (PDT)
X-Gm-Message-State: APjAAAVwQCQsnLpKbDSor+YWL23NBxSLA2PNG9+vEWHuN0igEVpT9F2H
 l9PszfddX0au2SjgDd3lgleLDVyDIevi95GY810=
X-Google-Smtp-Source: APXvYqxSUJ7ozINCOl+UVChp/bbzfkCJVBDsSYPyJQ0hVoLMmANqsjLALAuvxWjs88+nombWMTfIquW5bVss4/pJ7hE=
X-Received: by 2002:a1c:2e88:: with SMTP id u130mr10218625wmu.54.1557164528091; 
 Mon, 06 May 2019 10:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <f3zRvkN8JOfpv5k6jz7TbWXz-sso4q6CGB-3S05mSco8SuDy0BoN5z5_Lj_-Xnto1FPMCkhE89trkq-_f6itwRZ5F4NI9MKrcqZk8cdT45A=@protonmail.com>
 <76bd924a-34b1-eb7c-d3be-6c33aa7729fc@citrix.com>
In-Reply-To: <76bd924a-34b1-eb7c-d3be-6c33aa7729fc@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 6 May 2019 11:41:31 -0600
X-Gmail-Original-Message-ID: <CABfawhnKxwNzOFEQ5T+xTsUvh+HKxatAODjLe1FLQ1oePF7dXw@mail.gmail.com>
Message-ID: <CABfawhnKxwNzOFEQ5T+xTsUvh+HKxatAODjLe1FLQ1oePF7dXw@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [VMI] Possible race-condition in altp2m APIs
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Mathieu Tarral <mathieu.tarral@protonmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAp0aGFua3MgZm9yIGhlbHBpbmcgYnJhaW5zdG9ybWluZyBvbiB0aGlzLgoKPiBI
b3cgZXhhY3RseSBkb2VzIERSQUtWVUYgZ28gYWJvdXQgaW5qZWN0aW5nIHNpbGVudCBicmVha3Bv
aW50cz8gIEl0IG9idmlvdXNseSBoYXMgdG8gYWxsb2NhdGUgYSBuZXcgZ2ZuIGZyb20gc29tZXdo
ZXJlIHRvIGJlZ2luIHdpdGguICBEbyB0aGUgYmlmdXJjYXRlZCBmcmFtZXMgZW5kIHVwIGluIHR3
byBkaWZmZXJlbnQgYWx0cDJtcywgb3Igb25lIGluIHRoZSBob3N0IHAybSBhbmQgb25lIGluIGFu
IGFsdGVybmF0aXZlPyAgRG9lcyAjVkUgZXZlciBnZXQgdXNlZD8KCkkndmUgcG9zdGVkIGEgYmxv
ZyBlbnRyeSBhYm91dCBpdCBhIHdoaWxlIGFnbywgaXQncyBzdGlsbCBhY2N1cmF0ZToKaHR0cHM6
Ly94ZW5wcm9qZWN0Lm9yZy8yMDE2LzA0LzEzL3N0ZWFsdGh5LW1vbml0b3Jpbmctd2l0aC14ZW4t
YWx0cDJtLgoKWW91IGNhbid0IGFkZCBuZXcgZnJhbWVzIHRvIG9ubHkgc29tZSBvZiB0aGUgYWx0
cDJtJ3MgLSBhdCBsZWFzdCBub3QKd2l0aCB0aGUgY3VycmVudCBpbnRlcmZhY2VzLiBBbGwgdGhl
IHNoYWRvdyBwYWdlcyBhcmUgYWRkZWQgdG8gdGhlCmhvc3RwMm0gYW5kIHRoZW4gaW4gdGhlIGFs
dHAybSB0aGUgR0ZOIGlzIHJlbWFwcGVkIHRvIHRoZSBtZm4gb2YgdGhlCnNoYWRvdyBwYWdlIHdp
dGggYW4gZXhlY3V0ZS1vbmx5IHBlcm1pc3Npb25zLiBUaGlzIHdheSB0aGUgYnJlYWtwb2ludApj
YW4gYmUgd3JpdHRlbiBpbnRvIHRoZSBzaGFkb3ctcGFnZSBhbmQgYW55IGF0dGVtcHQgdG8gcmVh
ZCBpdCBjYW4gYmUKc2FmZWx5IGhhbmRsZWQgb24gYSBwZXItdkNQVSBiYXNlIGJ5IHN3aXRjaGlu
ZyBpdCBiYWNrIHRvIHRoZSBob3N0cDJtCmZvciB0aGUgZHVyYXRpb24gb2YgYSBzaW5nbGVzdGVw
ICh3aXRoIE1URikuIFNldHRpbmcgdXAgdGhlIHNoYWRvdwpwYWdlcyBpcyBvbmx5IHNhZmUgdG8g
ZG8gZHVyaW5nIHRoZSBpbml0aWFsIHNldHVwIHdoaWxlIHRoZSBhbHRwMm0KdmlldyBpcyBub3Qg
dXNlZCBhbmQgdGhlIGd1ZXN0IGlzIHBhdXNlZC4gT25jZSBhbHRwMm0gdmlld3MgYXJlIGJlaW5n
CnVzZWQgYWRkaW5nIG5ldyBwYWdlcyB0byB0aGUgaG9zdHAybSByZXN1bHRzIGluIGxvc2luZyBh
bGwgYWx0cDJtCnNldHRpbmdzLiBGb3IgdGhlIG1vc3QgcGFydCB0aGlzIGxpbWl0YXRpb24gaXMg
bm90IGFuIGlzc3VlIGJlY2F1c2UKYWxsIHN1cHBvcnRlZCB1c2UtY2FzZXMgYWRkIHRoZSBicmVh
a3BvaW50cyBvbmNlIGR1cmluZyB0aGUgaW5pdGlhbApzZXR1cCBhbmQgdGhlcmUgYXJlIG5vIGJy
ZWFrcG9pbnRzIGFkZGVkIGxhdGVyIGR1cmluZyBydW50aW1lLgoKV2UndmUgbm90aWNlZCB0aGF0
IHRyYXBwaW5nIE1PVi1UTy1DUjMgd2l0aCB0aGUgbGF0ZXN0IHZlcnNpb24gb2YKV2luZG93cyAx
MCBoYXMgYSBsb3Qgb2YgaXNzdWVzIGluIHRlcm1zIG9mIG92ZXJoZWFkIHdoZW4gS1BUSSBpcyB1
c2VkLApzbyBhcyBhIGJhbmQtYWlkIHNvbHV0aW9uIGl0IGNhbiBiZSBkaXNhYmxlZCB0byBpbXBy
b3ZlIHBlcmZvcm1hbmNlCih3aGljaCBNYXRoaWV1IGFscmVhZHkgZGlkKS4KCkFsc28sIHRoaXMg
aXMgYWxsIHdpdGggZXh0ZXJuYWwgdXNlIG9mIGFsdHAybSwgI1ZFIGlzIG5vdCB1c2VkLgoKPiBH
aXZlbiBob3cgbWFueSBFUFQgZmx1c2hpbmcgYnVncyBJJ3ZlIGFscmVhZHkgZm91bmQgaW4gdGhp
cyBhcmVhLCBJIHdvdWxkbid0IGJlIHN1cnByaXNlZCBpZiB0aGVyZSBhcmUgZnVydGhlciBvbmVz
IGx1cmtpbmcuICBJZiBpdCBpcyBhbiBFUFQgZmx1c2hpbmcgYnVnLCB0aGlzIGRlbHRhIHNob3Vs
ZCBtYWtlIGl0IGdvIGF3YXksIGJ1dCBpdCB3aWxsIGNvbWUgd2l0aCBhIGhlZnR5IHBlcmYgaGl0
LgoKTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHRoZSBWUElEIGltcGxlbWVudGF0aW9uIGluIFhl
biBpcyBzdWNoIHRoYXQKZWZmZWN0aXZlbHkgYWxsIFZNRVhJVHMgd2lsbCB0cmlnZ2VyIGFzc2ln
bm1lbnQgb2YgYSBuZXcgVlBJRCB0byB0aGUKdkNQVSAtIHdoaWNoIGlzIGxpa2VseSBhIHBlcmZv
cm1hbmNlIGlzc3VlIGluIGl0c2VsZiAtIHNvIGZsdXNoaW5nIHRoZQpFUFQgaXMgbGlrZWx5IG5v
dCBnb2luZyB0byBtYWtlIGEgZGlmZmVyZW5jZS4gQnV0IGl0J3Mgd29ydGggYSBzaG90LAptYXli
ZSBpdCBkb2VzIDopCgpUaGFua3MsClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
