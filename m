Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DD812F6C0
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 11:32:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inKE0-0006l0-VB; Fri, 03 Jan 2020 10:30:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inKDy-0006kv-SS
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 10:30:34 +0000
X-Inumbo-ID: 0de0e580-2e14-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0de0e580-2e14-11ea-88e7-bc764e2007e4;
 Fri, 03 Jan 2020 10:30:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 26CF5AD45;
 Fri,  3 Jan 2020 10:30:25 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <b7a1a7fe-0bc5-1654-ff1c-e5eb787c579e@suse.com>
 <c36cac91-49ae-6bb2-b057-195031979d21@suse.com>
 <627ad007-c3d0-8b73-7a68-358d153d1c25@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1936d92e-fb82-45f1-175e-24889a03b528@suse.com>
Date: Fri, 3 Jan 2020 11:31:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <627ad007-c3d0-8b73-7a68-358d153d1c25@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/3] x86: relax LDT check in
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

T24gMjcuMTIuMjAxOSAxNjoyNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMC8xMi8yMDE5
IDEzOjUwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gSXQgaXMgd3JvbmcgZm9yIHVzIHRvIGNoZWNr
IHRoZSBiYXNlIGFkZHJlc3Mgd2hlbiB0aGVyZSdzIG5vIExEVCBpbiB0aGUKPj4gZmlyc3QgcGxh
Y2UuIE9uY2Ugd2UgZG9uJ3QgZG8gdGhpcyBjaGVjayBhbnltb3JlIHdlIGNhbiBhbHNvIHNldCB0
aGUKPj4gYmFzZSBhZGRyZXNzIHRvIGEgbm9uLWNhbm9uaWNhbCB2YWx1ZSB3aGVuIHRoZSBMRFQg
aXMgZW1wdHkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KPiAKPiBJJ3ZlIG9ubHkganVzdCBzcG90dGVkLCBidXQgdGhpcyBpcyBhIHNlbWFudGlj
IGNoYW5nZSB0byB0aGUgZ3Vlc3QuwqAKPiBQcmV2aW91c2x5LCBiYXNlIHdpdGggZW50cz0wIHdv
dWxkIGJlIHByZXNlcnZlZCB2aWEgYXJjaF9nZXRfaW5mb19ndWVzdCgpLgoKSSd2ZSBkb25lIChl
eHRlbmRlZCBmcm9tIHYxKSB0aGlzIHVwb24geW91ciByZXF1ZXN0OyBJIGRpZCBub3RpY2UKdGhp
cyBzaWRlIGVmZmVjdCBvZiB0aGUgY2hhbmdlLiBUaGlzIGlzIChwYXJ0bHkpIHdoeSBJJ3ZlIG1h
ZGUgYW4KYWRqdXN0bWVudCB0byBhcmNoX2dldF9pbmZvX2d1ZXN0KCkgaW4gdGhlIGZpcnN0IHBs
YWNlLgoKPiBGaW5hbGx5LCBhIHNpbWlsYXIgY29uY2VybiBhYm91dCBjaGFuZ2VzIHdoaWNoIGEg
Z3Vlc3QgY2FuJ3QgYWN0dWFsbHkKPiBtYWtlIHVzZSBvZiwgZXZlbiBpZiB0aGlzIG9uZSBzZWVt
cyByYXRoZXIgbW9yZSBtaW5vci4KCkxpa2UgZm9yIHRoZSBHRFQgY2FzZSwgdGhlIGdvYWwgaXNu
J3Qgc28gbXVjaCB0byBhbGxvdyBndWVzdHMgbW9yZQpyZWxheGVkIGJlaGF2aW9yIChhbGJlaXQg
Zm9yIG9uZXMgbm90IGNhcmluZyBhYm91dCBiZWluZyBjb21wYXRpYmxlCndpdGggb2xkZXIgWGVu
IHRoaXMgaXMgc3RpbGwgYSBzZWNvbmRhcnkgZ29hbCksIGJ1dCB0byBnZXQgYmVoYXZpb3IKaW4g
WGVuIGludG8gYW4gb3ZlcmFsbCBtb3JlIGNvbnNpc3RlbnQgc2hhcGUuCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
