Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6725617A90E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 16:41:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9saB-0007wM-08; Thu, 05 Mar 2020 15:38:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9ybd=4W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9sa9-0007w5-Hl
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 15:38:41 +0000
X-Inumbo-ID: 63528028-5ef7-11ea-a607-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63528028-5ef7-11ea-a607-12813bfff9fa;
 Thu, 05 Mar 2020 15:38:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1881FB034;
 Thu,  5 Mar 2020 15:38:40 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200303172046.50569-1-roger.pau@citrix.com>
 <20200303172046.50569-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1e908189-ffff-796c-9cc3-39260bd1120f@suse.com>
Date: Thu, 5 Mar 2020 16:38:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200303172046.50569-4-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 3/6] x86/hap: improve hypervisor assisted
 guest TLB flush
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
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDMuMjAyMCAxODoyMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFRoZSBjdXJyZW50
IGltcGxlbWVudGF0aW9uIG9mIHRoZSBoeXBlcnZpc29yIGFzc2lzdGVkIGZsdXNoIGZvciBIQVAg
aXMKPiBleHRyZW1lbHkgaW5lZmZpY2llbnQuCj4gCj4gRmlyc3Qgb2YgYWxsIHRoZXJlJ3Mgbm8g
bmVlZCB0byBjYWxsIHBhZ2luZ191cGRhdGVfY3IzLCBhcyB0aGUgb25seQo+IHJlbGV2YW50IHBh
cnQgb2YgdGhhdCBmdW5jdGlvbiB3aGVuIGRvaW5nIGEgZmx1c2ggaXMgdGhlIEFTSUQgdkNQVQo+
IGZsdXNoLCBzbyBqdXN0IGNhbGwgdGhhdCBmdW5jdGlvbiBkaXJlY3RseS4KPiAKPiBTaW5jZSBo
dm1fYXNpZF9mbHVzaF92Y3B1IGlzIHByb3RlY3RlZCBhZ2FpbnN0IGNvbmN1cnJlbnQgY2FsbGVy
cyBieQo+IHVzaW5nIGF0b21pYyBvcGVyYXRpb25zIHRoZXJlJ3Mgbm8gbmVlZCBhbnltb3JlIHRv
IHBhdXNlIHRoZSBhZmZlY3RlZAo+IHZDUFVzLgo+IAo+IEZpbmFsbHkgdGhlIGdsb2JhbCBUTEIg
Zmx1c2ggcGVyZm9ybWVkIGJ5IGZsdXNoX3RsYl9tYXNrIGlzIGFsc28gbm90Cj4gbmVjZXNzYXJ5
LCBzaW5jZSB3ZSBvbmx5IHdhbnQgdG8gZmx1c2ggdGhlIGd1ZXN0IFRMQiBzdGF0ZSBpdCdzIGVu
b3VnaAo+IHRvIHRyaWdnZXIgYSB2bWV4aXQgb24gdGhlIHBDUFVzIGN1cnJlbnRseSBob2xkaW5n
IGFueSB2Q1BVIHN0YXRlLCBhcwo+IHN1Y2ggdm1leGl0IHdpbGwgYWxyZWFkeSBwZXJmb3JtIGFu
IEFTSUQvVlBJRCB1cGRhdGUsIGFuZCB0aHVzIGNsZWFyCj4gdGhlIGd1ZXN0IFRMQi4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBS
ZXZpZXdlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
