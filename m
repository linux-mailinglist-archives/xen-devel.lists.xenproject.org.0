Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8BC148570
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 13:54:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuyPa-0000qz-Ok; Fri, 24 Jan 2020 12:50:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P0Jg=3N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuyPZ-0000nS-85
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 12:50:09 +0000
X-Inumbo-ID: 0cb99b58-3ea8-11ea-bfe5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0cb99b58-3ea8-11ea-bfe5-12813bfff9fa;
 Fri, 24 Jan 2020 12:50:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F13A5ADB5;
 Fri, 24 Jan 2020 12:50:06 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <b0b0c6db-7215-bb31-a1eb-722d13c72cdc@suse.com>
 <7a21c52f-8dfb-6e03-9789-f8588dbae531@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <08875fe8-e5dc-2ce6-4ead-b18b49357585@suse.com>
Date: Fri, 24 Jan 2020 13:50:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <7a21c52f-8dfb-6e03-9789-f8588dbae531@citrix.com>
Content-Language: en-US
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
 Tamas K Lengyel <tamas@tklengyel.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDEuMjAyMCAxMTowNSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxLzI0LzIwIDg6
NTEgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBFYWNoIG9mIHRoZXNlIGNvbW1pdHMgaW50cm9k
dWNlZCBhIGZ1bmN0aW9uIHByb3RvdHlwZSByZWZlcmVuY2luZyBhCj4+IHN0cnVjdHVyZSB3aGlj
aCBoYWRuJ3QgYXQgbGVhc3QgYmVlbiBmb3J3YXJkIGRlY2xhcmVkLiBBZGQgc3VjaAo+PiBkZWNs
YXJhdGlvbnMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KPiAKPiBBY2tlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXgu
Y29tPgoKVGhhbmtzLgoKPiBJIHdvdWxkbid0IG9iamVjdCBpZiB5b3UgZGVjaWRlZCB0byBjaGVj
ayB0aGVzZSBpbiBpbW1lZGlhdGVseSwgZ2l2ZW4KPiB0aGF0IGl0J3MgYSBzaW1wbGUgZml4IHdo
aWNoIHVuLWJyZWFrcyB0aGUgYnVpbGQuCgpEb25lLgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
