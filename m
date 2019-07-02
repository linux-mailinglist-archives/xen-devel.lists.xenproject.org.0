Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5F45CC53
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 11:04:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiEfU-0003yB-26; Tue, 02 Jul 2019 09:01:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Sn/J=U7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hiEfS-0003y5-0a
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 09:01:38 +0000
X-Inumbo-ID: ff001b13-9ca7-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ff001b13-9ca7-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 09:01:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B7618ADFE;
 Tue,  2 Jul 2019 09:01:35 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <309aa9f8-b412-120b-6f20-090d11236443@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <703ae870-476b-c50d-2a01-4531ea7e177f@suse.com>
Date: Tue, 2 Jul 2019 11:01:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <309aa9f8-b412-120b-6f20-090d11236443@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 26/60] xen: let vcpu_create() select
 processor
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDcuMTkgMTA6NTUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI4LjA1LjE5IGF0
IDEyOjMyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gVG9kYXkgdGhlcmUgYXJlIHR3byBk
aXN0aW5jdCBzY2VuYXJpb3MgZm9yIHZjcHVfY3JlYXRlKCk6IGVpdGhlciBmb3IKPj4gY3JlYXRp
b24gb2YgaWRsZS1kb21haW4gdmNwdXMgKHZjcHVpZCA9PSBwcm9jZXNzb3IpIG9yIGZvciBjcmVh
dGlvbiBvZgo+PiAibm9ybWFsIiBkb21haW4gdmNwdXMgKGluY2x1ZGluZyBkb20wKSwgd2hlcmUg
dGhlIGNhbGxlciBzZWxlY3RzIHRoZQo+PiBpbml0aWFsIHByb2Nlc3NvciBvbiBhIHJvdW5kLXJv
YmluIHNjaGVtZSBvZiB0aGUgYWxsb3dlZCBwcm9jZXNzb3JzCj4+IChhbGxvd2VkIGJlaW5nIGJh
c2VkIG9uIGNwdXBvb2wgYW5kIGFmZmluaXRpZXMpLgo+Pgo+PiBJbnN0ZWFkIG9mIHBhc3Npbmcg
dGhlIGluaXRpYWwgcHJvY2Vzc29yIHRvIHZjcHVfY3JlYXRlKCkgYW5kIHBhc3NpbmcKPj4gb24g
dG8gc2NoZWRfaW5pdF92Y3B1KCkgbGV0IHNjaGVkX2luaXRfdmNwdSgpIGRvIHRoZSBwcm9jZXNz
b3IKPj4gc2VsZWN0aW9uLiBGb3Igc3VwcG9ydGluZyBkb20wIHZjcHUgY3JlYXRpb24gdXNlIHRo
ZSBub2RlX2FmZmluaXR5IG9mCj4+IHRoZSBkb21haW4gYXMgYSBiYXNlIGZvciBzZWxlY3Rpbmcg
dGhlIHByb2Nlc3NvcnMuIFVzZXIgZG9tYWlucyB3aWxsCj4+IGhhdmUgaW5pdGlhbGx5IGFsbCBu
b2RlcyBzZXQsIHNvIHRoaXMgaXMgbm8gZGlmZmVyZW50IGJlaGF2aW9yIGNvbXBhcmVkCj4+IHRv
IHRvZGF5Lgo+IAo+IFRoaXMgbGFzdCBhc3BlY3QgaXMgYSByZXN1bHQgb2YgaG93IHRoZSB0b29s
IHN0YWNrIGN1cnJlbnRseSB3b3JrcywgYnV0Cj4gYXMgbG9uZyBhcyB0aGVyZSdzIGEgc2VwYXJh
dGUgWEVOX0RPTUNUTF9tYXhfdmNwdXMgdGhlcmUncyBubwo+IHJlYWwgZ3VhcmFudGVlIHRoYXQg
dGhlIGRvbWFpbiBhZmZpbml0eSBtYXNrIGhhc24ndCBjaGFuZ2VkIGFscmVhZHksCj4gaXMgdGhl
cmU/IEkgZG9uJ3QgbWluZCBzdWNoIGEgZGVwZW5kZW5jeSwgc2luY2UgWEVOX0RPTUNUTF9tYXhf
dmNwdXMKPiBpcyBzY2hlZHVsZWQgdG8gZ28gYXdheSBhbnl3YXksIGJ1dCBJIHRoaW5rIHRoaXMg
c2hvdWxkIGJlIGNhbGxlZCBvdXQKPiBleHBsaWNpdGx5IGhlcmUuCgpPa2F5LCBJJ2xsIHVwZGF0
ZSB0aGUgY29tbWl0IG1lc3NhZ2UuCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
