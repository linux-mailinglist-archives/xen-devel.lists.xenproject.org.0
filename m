Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E7A114FD5
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 12:37:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idBst-0002Gt-Ic; Fri, 06 Dec 2019 11:34:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z/5o=Z4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1idBsr-0002Ge-RO
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 11:34:53 +0000
X-Inumbo-ID: 6b51079e-181c-11ea-a4aa-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b51079e-181c-11ea-a4aa-bc764e2007e4;
 Fri, 06 Dec 2019 11:34:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6BD5BB253;
 Fri,  6 Dec 2019 11:34:52 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <57491ade-fa47-5e66-47ac-a5f79de84070@suse.com>
 <efe72f90-0fa5-d1c6-b87f-9b8e7b45b0f8@suse.com>
 <fc39c9a4-394a-f3f2-42fb-9ff9938d5455@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <606f5428-bacb-6771-b258-51915839e02f@suse.com>
Date: Fri, 6 Dec 2019 12:35:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <fc39c9a4-394a-f3f2-42fb-9ff9938d5455@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/3] x86: relax LDT check in
 arch_set_info_guest()
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMTIuMjAxOSAxMTozMywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNi8xMi8yMDE5
IDEwOjE0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gSXQgaXMgd3JvbmcgZm9yIHVzIHRvIGNoZWNr
IHRoZSBiYXNlIGFkZHJlc3Mgd2hlbiB0aGVyZSdzIG5vIExEVCBpbiB0aGUKPj4gZmlyc3QgcGxh
Y2UuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
Pj4gLS0tCj4+IFRCRDogSSBhbHNvIHdvbmRlciB3aGV0aGVyIHdlIHdvdWxkbid0IGJldHRlciBz
ZXQgdi0+YXJjaC5wdi5sZHRfYmFzZSB0bwo+PiAgICAgIHplcm8gZm9yIGFuIGVtcHR5IExEVCwg
anVzdCBsaWtlIGRvX21tdWV4dF9vcCgpIGRvZXMuCj4gCj4gTXkgcXVlcnkgd2l0aCBwYXRjaCAx
IGlzIGFsc28gYXBwbGljYWJsZSBoZXJlLgoKQXMgaXMgbXkgYW5zd2VyIHRoZXJlLgoKPiBBcyBm
b3Igc2V0dGluZyBpdCB0byB6ZXJvLCB3ZSBzaG91bGQgdXNlIHNvbWV0aGluZyBub24tY2Fub25p
Y2FsCj4gaW5zdGVhZC7CoCBEb2luZyBzbyB3b3VsZCBoYXZlIHNhdmVkIHVzIGZyb20gWFNBLTI5
OCwgd2hpY2ggd2FzIG9ubHkgYQo+IHByb2JsZW0gaW4gZ3Vlc3RzIGJlY2F1c2UgdGhlIGJhc2Ug
ZmFsbGluZyB0byAwLgoKSSBjYW4gY2VydGFpbmx5IGRvIHNvIChpbiBkb19tbXVleHRfb3AoKSB0
aGVuIGFzIHdlbGwpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
