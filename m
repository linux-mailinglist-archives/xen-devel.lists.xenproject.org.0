Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F4F15BBC2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 10:34:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2AqW-0003JX-BF; Thu, 13 Feb 2020 09:31:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ys07=4B=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1j2AqV-0003JS-9P
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 09:31:43 +0000
X-Inumbo-ID: a452e1b8-4e43-11ea-ade5-bc764e2007e4
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a452e1b8-4e43-11ea-ade5-bc764e2007e4;
 Thu, 13 Feb 2020 09:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4uDWUfZ/loKhYSMqGcRriAkkkjJBxvZzcw/HMd5998c=; b=WbUtGpED/t2fAr6PcGPszfZUG/
 g6p6cjgyD+xNOQ0qpLXYgGUPDvldgWK4++KdKcANjHZgUhy1VsdOj+5F/DiA5DAAtNgy1GlBYnqUp
 zqffjVBu2hEe2wU4PHue6qT59OO1aSuPJGHWo3yBvByaFISymBuwY1g9BfyyitMwmjzA=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:59174
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1j2As7-0003c9-TM; Thu, 13 Feb 2020 10:33:23 +0100
From: Sander Eikelenboom <linux@eikelenboom.it>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200212164949.56434-1-roger.pau@citrix.com>
 <1d26308a-cbe9-8a6c-a4a9-9211c0b165c5@eikelenboom.it>
 <20200212170150.GS4679@Air-de-Roger>
 <287b5277-c6fc-3444-5c6a-6099cd754c2b@eikelenboom.it>
Message-ID: <f0b098bf-1c8a-0f47-93b6-5f0b63da769f@eikelenboom.it>
Date: Thu, 13 Feb 2020 10:31:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <287b5277-c6fc-3444-5c6a-6099cd754c2b@eikelenboom.it>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/3] x86: fixes/improvements for scratch
 cpumask
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMDIvMjAyMCAxODoxMywgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+IE9uIDEyLzAy
LzIwMjAgMTg6MDEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+IE9uIFdlZCwgRmViIDEyLCAy
MDIwIGF0IDA1OjUzOjM5UE0gKzAxMDAsIFNhbmRlciBFaWtlbGVuYm9vbSB3cm90ZToKPj4+IE9u
IDEyLzAyLzIwMjAgMTc6NDksIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+PiBIZWxsbywKPj4+
Pgo+Pj4+IENvbW1pdDoKPj4+Pgo+Pj4+IDU1MDBkMjY1YTJhOGZhNjNkNjBjMDhiZWI1NDlkZThl
YzgyZmY3YTUKPj4+PiB4ODYvc21wOiB1c2UgQVBJQyBBTExCVVQgZGVzdGluYXRpb24gc2hvcnRo
YW5kIHdoZW4gcG9zc2libGUKPj4+Pgo+Pj4+IEludHJvZHVjZWQgYSBib2d1cyB1c2FnZSBvZiB0
aGUgc2NyYXRjaCBjcHVtYXNrOiBpdCB3YXMgdXNlZCBpbiBhCj4+Pj4gZnVuY3Rpb24gdGhhdCBj
b3VsZCBiZSBjYWxsZWQgZnJvbSBpbnRlcnJ1cHQgY29udGV4dCwgYW5kIGhlbmNlIHVzaW5nCj4+
Pj4gdGhlIHNjcmF0Y2ggY3B1bWFzayB0aGVyZSBpcyBub3Qgc2FmZS4gUGF0Y2ggIzIgaXMgYSBm
aXggZm9yIHRoYXQgdXNhZ2UuCj4+Pj4KPj4+PiBQYXRjaCAjMyBhZGRzIHNvbWUgZGVidWcgaW5m
cmFzdHJ1Y3R1cmUgdG8gbWFrZSBzdXJlIHRoZSBzY3JhdGNoIGNwdW1hc2sKPj4+PiBpcyB1c2Vk
IGluIHRoZSByaWdodCBjb250ZXh0LCBhbmQgaGVuY2Ugc2hvdWxkIHByZXZlbnQgZnVydGhlciBt
aXNzdXNlcy4KPj4+Pgo+Pj4+IFRoYW5rcywgUm9nZXIuCj4+Pgo+Pj4gSGkgUm9nZXIsCj4+Pgo+
Pj4gRG8geW91IHN0aWxsIHdhbnQgbWUgdG8gdGVzdCB0aGUgInBhbmljIiBwYXRjaCA/Cj4+PiBP
ciB0ZXN0IHRoaXMgc2VyaWVzIGluc3RlYWQgPwo+Pgo+PiBJJ3ZlIGJlZW4gYWJsZSB0byB0cmln
Z2VyIHRoaXMgbXlzZWxmLCBzbyBpZiB5b3UgY2FuIGdpdmUgYSB0cnkgdG8gdGhlCj4+IHNlcmll
cyBpbiBvcmRlciB0byBhc3NlcnQgaXQgZml4ZXMgeW91ciBpc3N1ZSB0aGF0IHdvdWxkIGJlIGdy
ZWF0Lgo+Pgo+PiBUaGFua3MuCj4+Cj4gCj4gU3VyZSwgY29tcGlsaW5nIG5vdywgd2lsbCByZXBv
cnQgYmFjayB0b21vcnJvdyBtb3JuaW5nLgo+IC0tCj4gU2FuZGVyCj4gCgpIYXZlbid0IHNlZW4g
dGhlIGlzc3VlIHlldCwgc28gaXQgc2VlbXMgZml4ZWQuClRoYW5rcyAhCi0tClNhbmRlcgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
