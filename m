Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 035901816F7
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 12:39:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBzfM-00011O-7z; Wed, 11 Mar 2020 11:36:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TdBs=44=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jBzfL-00010a-6S
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 11:36:47 +0000
X-Inumbo-ID: 96c3f024-638c-11ea-af6e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 96c3f024-638c-11ea-af6e-12813bfff9fa;
 Wed, 11 Mar 2020 11:36:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BAED6AC26;
 Wed, 11 Mar 2020 11:36:45 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200310072853.27567-1-jgross@suse.com>
 <20200310072853.27567-5-jgross@suse.com>
 <0ac4075c-a847-38e6-f692-646d722da7ef@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <1598c9b5-4f44-9b6d-2445-0a0aa96d87c5@suse.com>
Date: Wed, 11 Mar 2020 12:36:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0ac4075c-a847-38e6-f692-646d722da7ef@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 4/6] xen/rcu: fix rcu_lock_domain()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDMuMjAgMTI6MzUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEwLjAzLjIwMjAgMDg6
MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IHJjdV9sb2NrX2RvbWFpbigpIG1pc3VzZXMgdGhl
IGRvbWFpbiBzdHJ1Y3R1cmUgYXMgcmN1IGxvY2ssIHdoaWNoIGlzCj4+IHdvcmtpbmcgb25seSBh
cyBsb25nIGFzIHJjdV9yZWFkX2xvY2soKSBpc24ndCBldmFsdWF0aW5nIHRoZSBsb2NrLgo+Pgo+
PiBGaXggdGhhdCBieSBhZGRpbmcgYSByY3UgbG9jayB0byBzdHJ1Y3QgZG9tYWluIGFuZCB1c2Ug
dGhhdCBmb3IKPj4gcmN1X2xvY2tfZG9tYWluKCkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IEkgZ3Vlc3MgdGhpcyBvbmUgaXMgaW5kZXBlbmRlbnQg
b2YgcGF0Y2hlcyAyIGFuZCAzLCBhbmQgaGVuY2UgY291bGQKPiBnbyBpbiB0b2dldGhlciB3aXRo
IHBhdGNoIDE/CgpZZXMuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
