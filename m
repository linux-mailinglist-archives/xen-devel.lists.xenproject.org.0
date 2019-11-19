Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D66102544
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 14:20:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX3O7-0001cz-6L; Tue, 19 Nov 2019 13:17:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wZDO=ZL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iX3O5-0001cu-Ko
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 13:17:45 +0000
X-Inumbo-ID: f89dc534-0ace-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f89dc534-0ace-11ea-9631-bc764e2007e4;
 Tue, 19 Nov 2019 13:17:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 732B3B297;
 Tue, 19 Nov 2019 13:17:43 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andy Lutomirski <luto@kernel.org>
References: <d66b1da4-8096-9b77-1ca6-d6b9954b113c@suse.com>
 <32d8713d-25a7-84ab-b74b-aa3e88abce6b@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f45354ff-4755-1884-444d-007ea46bb847@suse.com>
Date: Tue, 19 Nov 2019 14:17:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <32d8713d-25a7-84ab-b74b-aa3e88abce6b@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] x86/Xen/32: make xen_iret_crit_fixup
 independent of frame layout
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
 the arch/x86 maintainers <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTEuMTkgMTU6MzIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE5vdyB0aGF0IFNTOkVTUCBh
bHdheXMgZ2V0IHNhdmVkIGJ5IFNBVkVfQUxMLCB0aGlzIGFsc28gbmVlZHMgdG8gYmUKPiBhY2Nv
dW50ZWQgZm9yIGluIHhlbl9pcmV0X2NyaXRfZml4dXAuIE90aGVyd2lzZSB0aGUgb2xkX2F4IHZh
bHVlIGdldHMKPiBpbnRlcnByZXRlZCBhcyBFRkxBR1MsIGFuZCBoZW5jZSBWTTg2IG1vZGUgYXBw
ZWFycyB0byBiZSBhY3RpdmUgYWxsCj4gdGhlIHRpbWUsIGxlYWRpbmcgdG8gcmFuZG9tICJ2bTg2
XzMyOiBubyB1c2VyX3ZtODY6IEJBRCIgbG9nIG1lc3NhZ2VzCj4gYWxvbmdzaWRlIHByb2Nlc3Nl
cyByYW5kb21seSBjcmFzaGluZy4KPiAKPiBTaW5jZSBmb2xsb3dpbmcgdGhlIHByZXZpb3VzIG1v
ZGVsIChzaXR0aW5nIGFmdGVyIFNBVkVfQUxMKSB3b3VsZAo+IGZ1cnRoZXIgY29tcGxpY2F0ZSB0
aGUgY29kZSBfYW5kXyByZXRhaW4gdGhlIGRlcGVuZGVuY3kgb2YKPiB4ZW5faXJldF9jcml0X2Zp
eHVwIG9uIGZyYW1lIG1hbmlwdWxhdGlvbnMgZG9uZSBieSBlbnRyeV8zMi5TLCBzd2l0Y2gKPiB0
aGluZ3MgYXJvdW5kIGFuZCBkbyB0aGUgYWRqdXN0bWVudCBhaGVhZCBvZiBTQVZFX0FMTC4KPiAK
PiBGaXhlczogM2M4OGM2OTJjMjg3ICgieDg2L3N0YWNrZnJhbWUvMzI6IFByb3ZpZGUgY29uc2lz
dGVudCBwdF9yZWdzIikKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1
ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
