Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2B81791DD
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 15:03:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9Ua9-0001Zc-0U; Wed, 04 Mar 2020 14:01:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/75R=4V=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j9Ua7-0001ZT-SX
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 14:01:03 +0000
X-Inumbo-ID: 95847d12-5e20-11ea-b52f-bc764e2007e4
Received: from mail-ed1-f67.google.com (unknown [209.85.208.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 95847d12-5e20-11ea-b52f-bc764e2007e4;
 Wed, 04 Mar 2020 14:01:03 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id m13so2426245edb.6
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2020 06:01:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=We1xOoBtMukhnEKp6XbPJfM74xL8HFyfb/vmA3wMttI=;
 b=S7u6VX+twqO2rQXSrR7Jq64uHe2DwOMLrogVN9xC/J9mh7YurmydrZnEj6x081z2p0
 LjSTa61PgApPdkSnL1UM1HSBVLjK6RkKzkk12AKNKFKlb+k7mz/CQwu6gTHXoxFKdL1G
 ar+WUttLtaYBVrQdnG/YhhDlJrRFw8L2HSOA/bZSflFbfHKHPHsP1KzSOFMzs3GGg6nV
 cQT0DRllxewy1LfY6qLU0Si0Zemn6ULXAYQjeegqIEHyji7qnO+93BG0pQVvIseZ5TgS
 bL7IvS94ICz3HUjKJLF+Lu7L0RsipISWEVPcp+e9fRYBHTYgtpvUbSdII6EeXPoq26zb
 NfBw==
X-Gm-Message-State: ANhLgQ33dIvqGaPuITHw3d7YazGT5U1lNBRnLGBEeMynmrofxR0EC+2w
 qTr3c0EvMkmv5CU3i8/c0QQ=
X-Google-Smtp-Source: ADFU+vuQa6IMJxp55xlOyoI9tqckgzS/Mj9iyu/lIOipB7WDYAoOx6fR6G/4KSzqrcO5UXuYz+dJnw==
X-Received: by 2002:a50:a7a5:: with SMTP id i34mr2913916edc.128.1583330462494; 
 Wed, 04 Mar 2020 06:01:02 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id 29sm1156085ejb.4.2020.03.04.06.01.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 06:01:01 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <20200204130614.15166-1-julien@xen.org>
 <20200204130614.15166-3-julien@xen.org>
 <316c8ebf-9cf1-53c2-98fe-03221b9ceed4@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <41e7d00f-f48d-f049-1606-be8153608116@xen.org>
Date: Wed, 4 Mar 2020 14:01:00 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <316c8ebf-9cf1-53c2-98fe-03221b9ceed4@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen/x86: hap: Clean-up and harden
 hap_enable()
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwMy8wMy8yMDIwIDEzOjI1LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAwNC4wMi4yMDIw
IDE0OjA2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxs
QGFtYXpvbi5jb20+Cj4+Cj4+IFVubGlrZSBzaGFkb3dfZW5hYmxlKCksIGhhcF9lbmFibGUoKSBj
YW4gb25seSBiZSBjYWxsZWQgb25jZSBkdXJpbmcKPj4gZG9tYWluIGNyZWF0aW9uIGFuZCB3aXRo
IHRoZSBtb2RlIGVxdWFsIHRvIG1vZGUgZXF1YWwgdG8KPj4gUEdfZXh0ZXJuYWwgfCBQR190cmFu
c2xhdGUgfCBQR19yZWZjb3VudHMuCj4+Cj4+IElmIGl0IHdlcmUgY2FsbGVkIHR3aWNlLCB0aGVu
IHdlIG1pZ2h0IGhhdmUgc29tZXRoaW5nIGludGVyZXN0aW5nCj4+IHByb2JsZW0gYXMgdGhlIHAy
bSB0YWJsZXMgd291bGQgYmUgcmUtYWxsb2NhdGVkIChhbmQgdGhlcmVmb3JlIGFsbCB0aGUKPj4g
bWFwcGluZ3Mgd291bGQgYmUgbG9zdCkuCj4+Cj4+IEFkZCBjb2RlIHRvIHNhbml0eSBjaGVjayB0
aGUgbW9kZSBhbmQgdGhhdCB0aGUgZnVuY3Rpb24gaXMgb25seSBjYWxsZWQKPj4gb25jZS4gVGFr
ZSB0aGUgb3Bwb3J0dW5pdHkgdG8gYW4gaWYgY2hlY2tpbmcgdGhhdCBQR190cmFuc2xhdGUgaXMg
c2V0Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29t
Pgo+IAo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gcHJlZmVy
YWJseSB3aXRoIHRoZSBkdXBsaWNhdGUgd29yZHMgb24gdGhlIHNlY29uZCBsaW5lIG9mIHRoZSBk
ZXNjcmlwdGlvbgo+IGRyb3BwZWQuCgpJIHdpbGwgcmVtb3ZlIGl0IG9uIGNvbW1pdC4KCj4gCj4+
IEkga2VlcCB0aGUgY2hlY2sgIT0gMCBiZWNhdXNlIHRoaXMgaXMgY29uc2lzdGVudCB3aXRoIHRo
ZSByZXN0IG9mIHRoZQo+PiBmaWxlLiBJZiB3ZSB3YW50IHRvIG9taXQgY29tcGFyaXNvbiBhZ2Fp
bnN0IDAsIHRoZW4gdGhpcyBzaG91bGQgYmUgaW4gYQo+PiBzZXBhcmF0ZSBwYXRjaGVzIGNvbnZl
cnRpbmcgdGhlIGZpbGUuCj4gCj4gSSBkaXNhZ3JlZSwgYnV0IG5vdCBlbm91Z2ggdG8gbWFrZSB0
aGUgYWNrIGRlcGVuZGVudCB1cG9uIHRoZSBhZGp1c3RtZW50Lgo+IAo+PiAtLS0gYS94ZW4vYXJj
aC94ODYvbW0vaGFwL2hhcC5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9oYXAvaGFwLmMKPj4g
QEAgLTQ0NSw2ICs0NDUsMTMgQEAgaW50IGhhcF9lbmFibGUoc3RydWN0IGRvbWFpbiAqZCwgdTMy
IG1vZGUpCj4+ICAgICAgIHVuc2lnbmVkIGludCBpOwo+PiAgICAgICBpbnQgcnYgPSAwOwo+PiAg
IAo+PiArICAgIGlmICggbW9kZSAhPSAoUEdfZXh0ZXJuYWwgfCBQR190cmFuc2xhdGUgfCBQR19y
ZWZjb3VudHMpICkKPj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+ICsKPj4gKyAgICAvKiBU
aGUgZnVuY3Rpb24gY2FuIG9ubHkgYmUgY2FsbGVkIG9uY2UgKi8KPj4gKyAgICBpZiAoIGQtPmFy
Y2gucGFnaW5nLm1vZGUgIT0gMCApCj4+ICsgICAgICAgIHJldHVybiAtRUVYSVNUOwo+IAo+IEkg
dGhpbmsgaWYgc3VjaCBhIGNvbW1lbnQgZ2V0cyBhZGRlZCwgaXQgc2hvdWxkIGJlIHVuYW1iaWd1
b3VzLiBUaGUKPiBmdW5jdGlvbiBjYW4gYmUgY2FsbGVkIG9uY2UgcGVyIGRvbWFpbiwgbm90IGp1
c3Qgb25jZSBpbiB0b3RhbC4KCkkgd2lsbCByZXBsYWNlIHdpdGggIlRoZSBmdW5jdGlvbiBjYW4g
b25seSBiZSBjYWxsZWQgb25lIHBlciBkb21haW4iLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
