Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF6214A84B
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 17:46:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw7U0-0007ut-TX; Mon, 27 Jan 2020 16:43:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1l6N=3Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iw7Tz-0007un-9E
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 16:43:27 +0000
X-Inumbo-ID: 237eb160-4124-11ea-8578-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 237eb160-4124-11ea-8578-12813bfff9fa;
 Mon, 27 Jan 2020 16:43:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7D7DFB11A;
 Mon, 27 Jan 2020 16:43:25 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200123180615.69370-1-roger.pau@citrix.com>
 <20200123180615.69370-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <db22cea4-47cf-14b8-8ebf-6f65104920a4@suse.com>
Date: Mon, 27 Jan 2020 17:43:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200123180615.69370-3-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] x86/apic: simplify
 disconnect_bsp_APIC setup of LVT{0/1}
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
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDEuMjAyMCAxOTowNiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFRoZXJlJ3Mgbm8g
bmVlZCB0byByZWFkIHRoZSBjdXJyZW50IHZhbHVlcyBvZiBMVlR7MC8xfSBmb3IgdGhlCj4gcHVy
cG9zZXMgb2YgdGhlIGZ1bmN0aW9uLCB3aGljaCBzZWVtIHRvIGJlIHRvIHNhdmUgdGhlIGN1cnJl
bnRseQo+IHNlbGVjdGVkIHZlY3RvcjogaW4gdGhlIGRlc3RpbmF0aW9uIG1vZGVzIHVzZWQgKEV4
dElOVCBhbmQgTk1JKSB0aGUKPiB2ZWN0b3IgZmllbGQgaXMgaWdub3JlZCBhbmQgaGVuY2UgY2Fu
IGJlIHNldCB0byAwLgoKVGhlIHF1ZXN0aW9uIGlzIC0gaXMgdGhlcmUgZmlybXdhcmUgcHV0dGlu
ZyBkYXRhIGluIHRoZXNlIGZpZWxkcwp0aGF0IGl0IGV4cGVjdHMgdG8gc3Vydml2ZSB1bm1vZGlm
aWVkPyBTdWNoIGJlaGF2aW9yIHdvdWxkIGJlCmhpZ2hseSBzdXNwZWN0ICh0byBtZSBhdCBsZWFz
dCksIGJ1dCB5b3UgbmV2ZXIga25vdy4gVGhlcmUgb3VnaHQKdG8gYmUgYSByZWFzb24gaXQncyBi
ZWVuIGRvbmUgdGhpcyB3YXkgbm90IGp1c3QgaW4gWGVuLCBidXQgYWxzbwppbiBMaW51eC4gSU9X
IG1heSBJIGFzayB0aGF0IHlvdSBhdCBsZWFzdCBtYWtlIGFuIGF0dGVtcHQgdG8Kc3VibWl0IHRo
ZSBzYW1lIGNoYW5nZSBmb3IgTGludXgsIHRvIHNlZSB3aGF0IHRoZSBmZWVkYmFjayBpcz8KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
