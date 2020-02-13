Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8178215BB1E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 10:05:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2ANy-0000f0-6O; Thu, 13 Feb 2020 09:02:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QmQS=4B=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1j2ANx-0000eu-DO
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 09:02:13 +0000
X-Inumbo-ID: 85c54ae6-4e3f-11ea-ade5-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85c54ae6-4e3f-11ea-ade5-bc764e2007e4;
 Thu, 13 Feb 2020 09:02:12 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1j2ANs-0002fD-1D; Thu, 13 Feb 2020 09:02:08 +0000
Date: Thu, 13 Feb 2020 09:02:08 +0000
From: Tim Deegan <tim@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20200213090208.GA10200@deinos.phlegethon.org>
References: <20200210172829.43604-1-roger.pau@citrix.com>
 <20200210172829.43604-3-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210172829.43604-3-roger.pau@citrix.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org);
 SAEximRunCond expanded to false
Subject: Re: [Xen-devel] [PATCH v4 2/7] x86/paging: add TLB flush hooks
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgMTg6MjggKzAxMDAgb24gMTAgRmViICgxNTgxMzU5MzA0KSwgUm9nZXIgUGF1IE1vbm5lIHdy
b3RlOgo+IEFkZCBzaGFkb3cgYW5kIGhhcCBpbXBsZW1lbnRhdGlvbiBzcGVjaWZpYyBoZWxwZXJz
IHRvIHBlcmZvcm0gZ3Vlc3QKPiBUTEIgZmx1c2hlcy4gTm90ZSB0aGF0IHRoZSBjb2RlIGZvciBi
b3RoIGlzIGV4YWN0bHkgdGhlIHNhbWUgYXQgdGhlCj4gbW9tZW50LCBhbmQgaXMgY29waWVkIGZy
b20gaHZtX2ZsdXNoX3ZjcHVfdGxiLiBUaGlzIHdpbGwgYmUgY2hhbmdlZCBieQo+IGZ1cnRoZXIg
cGF0Y2hlcyB0aGF0IHdpbGwgYWRkIGltcGxlbWVudGF0aW9uIHNwZWNpZmljIG9wdGltaXphdGlv
bnMgdG8KPiB0aGVtLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IFJl
dmlld2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKQWNrZWQtYnk6IFRpbSBEZWVnYW4gPHRq
ZC14ZW5AcGhsZWdldGhvbi5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
