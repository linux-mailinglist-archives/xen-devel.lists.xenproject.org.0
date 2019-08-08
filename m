Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC42285E10
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 11:19:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hveWk-0003mQ-Fb; Thu, 08 Aug 2019 09:16:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=islG=WE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hveWi-0003mL-Va
 for xen-devel@lists.xen.org; Thu, 08 Aug 2019 09:16:04 +0000
X-Inumbo-ID: 2422b0b0-b9bd-11e9-a942-4305916abd99
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2422b0b0-b9bd-11e9-a942-4305916abd99;
 Thu, 08 Aug 2019 09:16:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 962101576;
 Thu,  8 Aug 2019 02:16:01 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1CEC3F706;
 Thu,  8 Aug 2019 02:16:00 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.10.1812050923160.527@sstabellini-ThinkPad-X260>
 <1544030891-11906-4-git-send-email-sstabellini@kernel.org>
 <8519371e-894b-88a3-ac71-b8367d93d9d3@arm.com>
 <alpine.DEB.2.10.1901031104000.800@sstabellini-ThinkPad-X260>
 <0c948ed9-5986-09c0-59ba-5d4e694c8ec4@arm.com>
 <alpine.DEB.2.21.1908071137220.2451@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e03c6581-7d7b-c874-d5a2-7f592e0172db@arm.com>
Date: Thu, 8 Aug 2019 10:15:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1908071137220.2451@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/5] xen/arm: use the physical number of gic
 lines for boot domains
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, Achin.Gupta@arm.com,
 andrii_anisov@epam.com, xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDA3LzA4LzIwMTkgMTk6NDIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBUdWUsIDE1IEphbiAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIFN0ZWZh
bm8sCj4+Cj4+IE9uIDEvMy8xOSA3OjA3IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+
PiBPbiBNb24sIDI0IERlYyAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gSGksCj4+Pj4K
Pj4+PiBPbiAxMi81LzE4IDU6MjggUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+Pj4g
V2UgZG9uJ3QgaGF2ZSBhIGNsZWFyIHdheSB0byBrbm93IGhvdyBtYW55IHZpcnR1YWwgU1BJcyB3
ZSBuZWVkIGZvciB0aGUKPj4+Pj4gYm9vdCBkb21haW5zLiBGb3Igc2ltcGxpY2l0eSwgYWxsb2Nh
dGUgYXMgbWFueSBhcyBuYXRpdmVseSBzdXBwb3J0ZWQsCj4+Pj4+IGp1c3QgbGlrZSBmb3IgZG9t
MC4KPj4+Pgo+Pj4+IFRoaXMgd2lsbCBwb3RlbnRpYWxseSBhbGxvY2F0ZSBhIGxvdCBvZiB1bnVz
ZWQgaW50ZXJydXB0cyBhbmQgYSB3YXN0ZSBvZgo+Pj4+IG1lbW9yeS4gU28gaXMgaXQgdGhlIGNv
cnJlY3Qgc29sdXRpb24/Cj4+Pj4KPj4+PiBGb3IgaW5zdGFuY2UsIHdlIHdvdWxkIHJlcXVlc3Qg
dGhlIHVzZXIgdG8gcHJvdmlkZSB0aGUgbnVtYmVyIG9mCj4+Pj4gaW50ZXJydXB0cy4KPj4+Cj4+
PiBVbmZvcnR1bmF0ZWx5LCB0aGlzIGhhcyB0byBoYXBwZW4gbXVjaCBlYXJsaWVyIHRoYW4gd2hl
biB3ZSBwYXJzZSB1c2VyCj4+PiBzdXBwbGllZCBkZXZpY2UgdHJlZSBvcHRpb25zLiBXZSBjb3Vs
ZCBtYWtlIGl0IGFuIGh5cGVydmlzb3IgY29tbWFuZAo+Pj4gbGluZSBwYXJhbWV0ZXIgYnV0IGl0
IHdvdWxkIGJlIG5hc3R5Lgo+Pgo+PiBXaHkgZG9lcyB0aGlzIHZhbHVlIG5lZWRzIHRvIGJlIGlu
IHRoZSBzdXBwbGllZCBkZXZpY2UtdHJlZS4gQ2FuJ3QgaXQgYmUgcGFydAo+PiBvZiB0aGUgbm9k
ZSBpbiB0aGUgaG9zdCBEVD8KPiAKPiBZb3UgbWVhbiBhcyBhbiBvcHRpb24gdW5kZXIgdGhlIHhl
bixkb21haW4gbm9kZT8gWWVzLCBJIHRoaW5rIHRoYXQgd291bGQKPiBiZSBwb3NzaWJsZS4gTGlr
ZToKPiAKPiAgIG5yX3NwaXMgPSA8MHg2ND47Cj4gCj4gQW5kIGlmIGl0IGlzIG1pc3Npbmcgd2Ug
ZGVmYXVsdCBiYWNrIHRvIGdpY19udW1iZXJfbGluZXMoKSAtIDMyLiBUaGF0Cj4gY291bGQgYmUg
YSBnb29kIGlkZWEuCgpZZXMgc29tZXRoaW5nIGxpa2UgdGhhdC4gSSBhbSBub3QgbmVjZXNzYXJp
bHkgYXNraW5nIHRvIGhhdmUgdGhpcyBvcHRpb24gZm9yIAp0aGlzIHNlcmllcy4gQnV0IGF0IGxl
YXN0IHRoZSBjb21taXQgbWVzc2FnZSBzaG91bGQgbm90IHNheSBpdCBpcyBkaWZmaWN1bHQgdG8g
CmRvIGl0LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
