Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 549459E3E1
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 11:22:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2XdY-0007sh-1w; Tue, 27 Aug 2019 09:19:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sv2a=WX=twosheds.srs.infradead.org=batv+d6b5d8d91af00b0fd28a+5847+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1i2XdW-0007sV-C4
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 09:19:34 +0000
X-Inumbo-ID: c8090c9a-c8ab-11e9-8980-bc764e2007e4
Received: from twosheds.infradead.org (unknown
 [2001:8b0:10b:1:21d:7dff:fe04:dbe2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8090c9a-c8ab-11e9-8980-bc764e2007e4;
 Tue, 27 Aug 2019 09:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=twosheds.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Cc:To:From:Subject:Date:References:In-Reply-To:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P7KwSDsCDZf1GmFzkQ5IPpeYnIjgdlnJ4cOv1VPpuoo=; b=HsAOZiguRlJgqDT9tNYWcRUsm
 FDmUyJj/8tM2ZaM3vSOw8YGllxCBkJlV5DPgmbRXnCtogiPxp3gpqIc9qpXmmoKrxE1e+293PK3g1
 ndu7ORA9bKiCCpT+wQ4Jry36Ikh1fJ1OLmQI0BWgN1e1+5CWGKiZvBxh6rplkFzZ9KoW1B+Y+YFkc
 T5iHZoyEWlFaXpWTPXWH0ao9KBNHkd4MBvhQZrav4OlSBCVbnzHIdWDPYY6deR/42oRCi1hhwlek4
 Nf2NUzKFyYcRFkWco2Idvu5L6YBoDVKbPBQJLMTwKDR+Tp8Trqp9YQE2hKEtp4OAJvkNvvtzC5BnQ
 3JRUCCZYA==;
Received: from localhost ([127.0.0.1] helo=twosheds.infradead.org)
 by twosheds.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1i2XdQ-006s0f-ND; Tue, 27 Aug 2019 09:19:29 +0000
Received: from 2a01:4c8:100c:7dd1:5f27:ed70:63ce:f1e5
 (SquirrelMail authenticated user dwmw2)
 by twosheds.infradead.org with HTTP; Tue, 27 Aug 2019 09:19:29 -0000
Message-ID: <1d7f547352df06ca840e820bd9194354.squirrel@twosheds.infradead.org>
In-Reply-To: <f5d0d640-ed92-e97e-d94b-38fe0b05835d@suse.com>
References: <cover.1565362089.git.dwmw@amazon.co.uk>
 <14720122f97667082d27153edd0e50aa6bc29e96.camel@infradead.org>
 <6487c442-d134-756a-e29d-81fae360a504@suse.com>
 <32bc72da5d499125a1b3c620e1438b2e8c31f772.camel@infradead.org>
 <f5d0d640-ed92-e97e-d94b-38fe0b05835d@suse.com>
Date: Tue, 27 Aug 2019 09:19:29 -0000
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Jan Beulich" <jbeulich@suse.com>
User-Agent: SquirrelMail/1.4.23 [SVN]-1.fc30.20180816
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 twosheds.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] [PATCH v2 5/6] x86/boot: Copy 16-bit boot variables
 back up to Xen image
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 David Woodhouse <dwmw2@infradead.org>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?utf-8?B?IlJvZ2VyIFBhdSBNb25uw6ki?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDE5LjA4LjIwMTkgMTc6MjUsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPj4gT24gTW9u
LCAyMDE5LTA4LTEyIGF0IDEyOjI0ICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IE9uIDA5
LjA4LjIwMTkgMTc6MDIsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPj4+PiBAQCAtMjI3LDcgKzIz
MSw3IEBAIHN0YXJ0NjQ6Cj4+Pj4gICAgICAgICAgIC53b3JkICAgMAo+Pj4+ICAgaWR0XzQ4OiAu
d29yZCAgIDAsIDAsIDAgIyBiYXNlID0gbGltaXQgPSAwCj4+Pj4gICAgICAgICAgIC53b3JkICAg
MAo+Pj4+IC1nZHRfNDg6IC53b3JkICAgNio4LTEKPj4+PiArZ2R0XzQ4OiAud29yZCAgIDcqOC0x
Cj4+Pj4gICAgICAgICAgIC5sb25nICAgdHJhbXAzMnN5bV9yZWwodHJhbXBvbGluZV9nZHQsNCkK
Pj4+Cj4+PiBZb3UgZG9uJ3QgZ3JvdyB0cmFtcG9saW5lX2dkdCBoZXJlLCBzbyBJIHRoaW5rIHRo
aXMgY2hhbmdlIGlzCj4+PiB3cm9uZy4gQW5kIGlmIGEgY2hhbmdlIHdhcyBuZWVkZWQgYXQgYWxs
IChwZXJoYXBzIGluIHRoZSBuZXh0Cj4+PiBwYXRjaCksIHRoZW4gSSB0aGluayBpdCB3b3VsZCBi
ZSBiZXR0ZXIgdG8gcmVwbGFjZSB0aGUgdXNlIG9mCj4+PiBsaXRlcmFsIG51bWJlcnMsIHVzaW5n
IHRoZSBkaWZmZXJlbmNlIG9mIHR3byBsYWJlbHMgaW5zdGVhZAo+Pj4gKHRoZSAiZW5kIiBsYWJs
ZSBwcmVmZXJhYmx5IGJlaW5nIGEgLkwtcHJlZml4ZWQgb25lKS4KPj4KPj4gSSBkb24ndCBncm93
IGl0IGJ1dC4uLiBjb3VudCBpdCDimLouCj4+Cj4+IEkgZG8gc3RhcnQgdXNpbmcgc3ltX2ZzKCkg
aGVyZSBpbiBwbGFjZXMgdGhhdCBpdCB3YXNuJ3QgYmVmb3JlLCBzbyB0aGUKPj4gaW5jb3JyZWN0
IHNpemUgc3RhcnRlZCB0byAqbWF0dGVyKiBiZWNhdXNlIHRoZSBCT09UX0ZTIHNlbGVjdG9yIHdh
c24ndAo+PiBpbmNsdWRlZCBpbiB0aGUgbGltaXQuCj4KPiBPaCwgSSBzZWUgLSBhIChsYXRlbnQp
IGJ1ZyBpbnRyb2R1Y2VkIGJ5IGIyODA0NDIyNmUuIFNob3VsZCBwZXJoYXBzCj4gYmUgYSBzZXBh
cmF0ZSBwYXRjaCB0byBmaXggdGhpcyB0aGVuIChieSwgYXMgc3VnZ2VzdGVkLCB1c2luZyBhbgo+
ICJlbmQiIGxhYmVsIHJhdGhlciB0aGFuIGhhcmQgY29kZWQgbnVtYmVycykuCgpJbmRlZWQuIEFu
ZHJldyBhbHJlYWR5IHBvc3RlZCBhIHBhdGNoIGZvciB0aGF0LCB3aGljaCAoYWxvbmcgd2l0aCBo
aXMKb3RoZXJzKSBJIGhhdmUgcmViYXNlZCBvbiB0b3Agb2YgbXkgdHJlZSBhdApodHRwczovL3hl
bmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9cGVvcGxlL2R3bXcyL3hlbi5naXQ7YT1zaG9ydGxvZzto
PXJlZnMvaGVhZHMvYm9vdGNsZWFudXAtYW5keQoKLS0gCmR3bXcyCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
