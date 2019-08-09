Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C75882BD
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 20:38:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw9jn-0005Lw-5i; Fri, 09 Aug 2019 18:35:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5OiB=WF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hw9jl-0005Lr-DJ
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 18:35:37 +0000
X-Inumbo-ID: 7834d922-bad4-11e9-ad1a-3b18c2e959ea
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7834d922-bad4-11e9-ad1a-3b18c2e959ea;
 Fri, 09 Aug 2019 18:35:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B2FD1596;
 Fri,  9 Aug 2019 11:35:32 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDE3A3F694;
 Fri,  9 Aug 2019 11:35:30 -0700 (PDT)
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20190809121440.5668-1-julien.grall@arm.com>
 <e9d6353c-fd4d-116e-2531-7db46abf2b23@suse.com>
 <62e082b025d8483d8b577c283fce1873@dornerworks.com>
 <alpine.DEB.2.21.1908091123020.7788@sstabellini-ThinkPad-T480s>
 <edf1b7aaef154e4991a68d148b3e5fdc@dornerworks.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <4cee766d-931d-1bfb-0b23-5868a655b735@arm.com>
Date: Fri, 9 Aug 2019 19:35:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <edf1b7aaef154e4991a68d148b3e5fdc@dornerworks.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/page_alloc: Keep away MFN 0 from the
 buddy allocator
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
Cc: Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3Rld2FydCwKCk9uIDA5LzA4LzIwMTkgMTk6MzQsIFN0ZXdhcnQgSGlsZGVicmFuZCB3cm90
ZToKPiBPbiBGcmlkYXksIEF1Z3VzdCA5LCAyMDE5IDI6MjQgUE0sIFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPj4gT24gRnJpLCA5IEF1ZyAyMDE5LCBTdGV3YXJ0
IEhpbGRlYnJhbmQgd3JvdGU6Cj4+PiBIZXJlIGlzIEplZmYncyBpbml0aWFsIHBhdGNoIGZvciB0
aGUgaXNzdWUuCj4+Cj4+IEkgY29tbWl0dGVkIEp1bGllbidzIHBhdGNoIGZvciBub3csCj4gCj4g
R3JlYXQhIFRoYW5rcyEKPiAKPj4gYnV0IGlmIHdlIG5lZWQgdG8gbWFrZSBhbnkgY2hhbmdlcwo+
PiBvciBkZWNpZGUgZm9yIGEgYmV0dGVyIGFsdGVybmF0aXZlLCB3ZSBjYW4gYWx3YXlzIHJldmVy
dCBpdC4KPiAKPiBDYW4gd2UgZW50ZXJ0YWluIGNvbW1pdHRpbmcgYm90aCBwYXRjaGVzPwoKVGhh
dCdzIHlvdSB0byBwb3N0IGZvcm1hbGx5IHRoZSBwYXRjaCBvbiB0aGUgTUwgOykuIFRoZSB3YXkg
eW91IHBvc3RlZCBpcyBsaWtlbHkgCmdvaW5nIHRvIGJlIHVubm90aWNlZCBhcyB5b3UgaGlqYWNr
IHRoZSBkaXNjdXNzaW9uIChzdWJqZWN0IHRpdGxlIGFzIG5vdCBiZSAKY2hhbmdlZCkuCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
