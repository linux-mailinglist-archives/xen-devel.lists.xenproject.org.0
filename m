Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39983E1F18
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 17:20:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNIPX-00068J-F9; Wed, 23 Oct 2019 15:18:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Og4R=YQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iNIPV-00068D-Ou
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 15:18:53 +0000
X-Inumbo-ID: 6bb27132-f5a8-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6bb27132-f5a8-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 15:18:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DC69FB894;
 Wed, 23 Oct 2019 15:18:51 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <49496057-afc0-f407-5a3b-7aeccedc1de1@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f73578b9-da58-22e3-e4b5-07b348488e7c@suse.com>
Date: Wed, 23 Oct 2019 17:18:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <49496057-afc0-f407-5a3b-7aeccedc1de1@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: fix off-by-one in is_xen_fixed_mfn()
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
 Julien Grall <julien.grall@arm.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMTkgMTc6MDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IF9fMk1fcndkYXRhX2VuZCBt
YXJrcyB0aGUgZmlyc3QgYnl0ZSBhZnRlciB0aGUgWGVuIGltYWdlLCBub3QgaXRzIGxhc3QKPiBi
eXRlLiBTdWJ0cmFjdCAxIHRvIG9idGFpbiB0aGUgdXBwZXIgYm91bmQgdG8gY29tcGFyZSBhZ2Fp
bnN0LiAoTm90ZQo+IHRoYXQgaW5zdGVhZCBzd2l0Y2hpbmcgZnJvbSA8PSB0byA8IGlzIGxlc3Mg
ZGVzaXJhYmxlLCBhcyBpbiBwcmluY2lwbGUKPiBfX3BhKCkgbWlnaHQgcmV0dXJuIHJ1YmJpc2gg
Zm9yIGFkZHJlc3NlcyBvdXRzaWRlIG9mIHRoZSBYZW4gaW1hZ2UuKQo+IAo+IFNpbmNlIHRoZSAm
IG5lZWRzIHRvIGJlIGRyb3BwZWQgZnJvbSB0aGUgbGluZSBpbiBxdWVzdGlvbiwgYWxzbyBkcm9w
IGl0Cj4gZnJvbSB0aGUgYWRqYWNlbnQgb25lLgo+IAo+IFJlcG9ydGVkLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
