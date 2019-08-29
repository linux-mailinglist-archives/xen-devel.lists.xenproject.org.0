Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A67E7A156E
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 12:08:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3HK4-0002hE-L7; Thu, 29 Aug 2019 10:06:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3HK3-0002h7-9T
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 10:06:31 +0000
X-Inumbo-ID: ab1615b6-ca44-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab1615b6-ca44-11e9-8980-bc764e2007e4;
 Thu, 29 Aug 2019 10:06:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7DCACAB9D;
 Thu, 29 Aug 2019 10:06:28 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Chao Gao <chao.gao@intel.com>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-11-git-send-email-chao.gao@intel.com>
 <20190822135923.fmontcb7dofrok4c@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ea7b2234-ec3f-1199-3077-a1a610883049@suse.com>
Date: Thu, 29 Aug 2019 12:06:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822135923.fmontcb7dofrok4c@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9 10/15] microcode: split out
 apply_microcode() from cpu_request_microcode()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDguMjAxOSAxNTo1OSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gU2VlaW5nIGhv
dyB0aGlzIHdvcmtzIEknbSBub3Qgc3VyZSB3aGF0J3MgdGhlIGJlc3Qgb3B0aW9uIGhlcmUuIEFz
Cj4gdXBkYXRpbmcgd2lsbCBiZSBhdHRlbXB0ZWQgb24gb3RoZXIgQ1BVcywgSSdtIG5vdCBzdXJl
IGlmIGl0J3MgT0sgdG8KPiByZXR1cm4gYW4gZXJyb3IgaWYgdGhlIHVwZGF0ZSBzdWNjZWVkIG9u
IHNvbWUgQ1BVcyBidXQgZmFpbGVkIG9uCj4gb3RoZXJzLgoKVGhlIG92ZXJhbGwgcmVzdWx0IG9m
IGEgcGFydGlhbGx5IHN1Y2Nlc3NmdWwgdXBkYXRlIHNob3VsZCBiZSBhbgplcnJvciAtIG1pc21h
dGNoZWQgdWNvZGUgbWF5LCBhZnRlciBhbGwsIGJlIG1vcmUgb2YgYSBwcm9ibGVtCnRoYW4gb3V0
ZGF0ZWQgdWNvZGUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
