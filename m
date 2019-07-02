Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD7D5CFF7
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 15:03:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiIPc-00086P-L9; Tue, 02 Jul 2019 13:01:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Sn/J=U7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hiIPa-00086F-HV
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 13:01:30 +0000
X-Inumbo-ID: 814c6882-9cc9-11e9-aa86-3f7d09c392db
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 814c6882-9cc9-11e9-aa86-3f7d09c392db;
 Tue, 02 Jul 2019 13:01:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CD0CEB9E7;
 Tue,  2 Jul 2019 13:01:27 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <6f3419c8-73fa-e46b-0432-c2a178180d6c@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <a5afda91-0155-b017-3913-6baee9092ec3@suse.com>
Date: Tue, 2 Jul 2019 15:01:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <6f3419c8-73fa-e46b-0432-c2a178180d6c@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 38/60] x86: make loading of GDT at context
 switch more modular
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDcuMTkgMTQ6NDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI4LjA1LjE5IGF0
IDEyOjMyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gSW4gcHJlcGFyYXRpb24gZm9yIGNv
cmUgc2NoZWR1bGluZyBjYXJ2ZSBvdXQgdGhlIEdEVCByZWxhdGVkCj4+IGZ1bmN0aW9uYWxpdHkg
KHdyaXRpbmcgR0RUIHJlbGF0ZWQgUFRFcywgbG9hZGluZyBkZWZhdWx0IG9mIGZ1bGwgR0RUKQo+
PiBpbnRvIHN1Yi1mdW5jdGlvbnMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KPj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KPj4gLS0tCj4+IFJGQyBWMjogc3BsaXQgb2ZmIG5vbi1yZWZhY3RvcmluZyBwYXJ0Cj4+
IFYxOiBjb25zdGlmeSBwb2ludGVycywgdXNlIGluaXRpYWxpemVycyAoSmFuIEJldWxpY2gpCj4g
Cj4gSSdtIGdldHRpbmcgdGhlIGltcHJlc3Npb24gdGhhdCB0aGlzIGFuZCB0aGUgZm9sbG93aW5n
IHBhdGNoIGFyZQo+IGluZGVwZW5kZW50IG9mIHRoZSBlYXJsaWVyIHBhcnRzIG9mIHRoZSBzZXJp
ZXMsIGFuZCBoZW5jZSBjb3VsZAo+IGluIHByaW5jaXBsZSBnbyBpbiByaWdodCBhd2F5PyBBbSBJ
IG92ZXJsb29raW5nIGFueXRoaW5nPwoKTm8sIHNob3VsZCB3b3JrLiBQYXRjaGVzIGFwcGx5IGFu
ZCB0aGUgcmVzdWx0IHNob3dzIG5vIGNvbXBpbGluZyBlcnJvcnMuCgoKSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
