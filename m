Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B45161208
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 13:30:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3fVb-0006Ey-0u; Mon, 17 Feb 2020 12:28:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ywWV=4F=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j3fVZ-0006Es-Km
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 12:28:17 +0000
X-Inumbo-ID: f9266562-5180-11ea-bfdb-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9266562-5180-11ea-bfdb-12813bfff9fa;
 Mon, 17 Feb 2020 12:28:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1029AADFE;
 Mon, 17 Feb 2020 12:28:16 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org
References: <20200217072006.20211-1-jgross@suse.com>
 <20200217072006.20211-3-jgross@suse.com>
 <3f1b46dc-ba1d-301a-3a7b-f3480338f379@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a7a17e9d-dce5-0fff-9f75-9af69f173d5b@suse.com>
Date: Mon, 17 Feb 2020 13:28:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <3f1b46dc-ba1d-301a-3a7b-f3480338f379@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen/rcu: don't use stop_machine_run()
 for rcu_barrier()
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDIuMjAgMTM6MjYsIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+IE9uIDE3LzAyLzIwMjAg
MDc6MjAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFRvZGF5IHJjdV9iYXJyaWVyKCkgaXMgY2Fs
bGluZyBzdG9wX21hY2hpbmVfcnVuKCkgdG8gc3luY2hyb25pemUgYWxsCj4+IHBoeXNpY2FsIGNw
dXMgaW4gb3JkZXIgdG8gZW5zdXJlIGFsbCBwZW5kaW5nIHJjdSBjYWxscyBoYXZlIGZpbmlzaGVk
Cj4+IHdoZW4gcmV0dXJuaW5nLgo+Pgo+PiBBcyBzdG9wX21hY2hpbmVfcnVuKCkgaXMgdXNpbmcg
dGFza2xldHMgdGhpcyByZXF1aXJlcyBzY2hlZHVsaW5nIG9mCj4+IGlkbGUgdmNwdXMgb24gYWxs
IGNwdXMgaW1wb3NpbmcgdGhlIG5lZWQgdG8gY2FsbCByY3VfYmFycmllcigpIG9uIGlkbGUKPj4g
Y3B1cyBvbmx5IGluIGNhc2Ugb2YgY29yZSBzY2hlZHVsaW5nIGJlaW5nIGFjdGl2ZSwgYXMgb3Ro
ZXJ3aXNlIGEKPj4gc2NoZWR1bGluZyBkZWFkbG9jayB3b3VsZCBvY2N1ci4KPj4KPj4gVGhlcmUg
aXMgbm8gbmVlZCBhdCBhbGwgdG8gZG8gdGhlIHN5bmNpbmcgb2YgdGhlIGNwdXMgaW4gdGFza2xl
dHMsIGFzCj4+IHJjdSBhY3Rpdml0eSBpcyBzdGFydGVkIGluIF9fZG9fc29mdGlycSgpIGNhbGxl
ZCB3aGVuZXZlciBzb2Z0aXJxCj4+IGFjdGl2aXR5IGlzIGFsbG93ZWQuIFNvIHJjdV9iYXJyaWVy
KCkgY2FuIGVhc2lseSBiZSBtb2RpZmllZCB0byB1c2UKPj4gc29mdGlycSBmb3Igc3luY2hyb25p
emF0aW9uIG9mIHRoZSBjcHVzIG5vIGxvbmdlciByZXF1aXJpbmcgYW55Cj4+IHNjaGVkdWxpbmcg
YWN0aXZpdHkuCj4+Cj4+IEFzIHRoZXJlIGFscmVhZHkgaXMgYSByY3Ugc29mdGlycSByZXVzZSB0
aGF0IGZvciB0aGUgc3luY2hyb25pemF0aW9uLgo+Pgo+PiBGaW5hbGx5IHN3aXRjaCByY3VfYmFy
cmllcigpIHRvIHJldHVybiB2b2lkIGFzIGl0IG5vdyBjYW4gbmV2ZXIgZmFpbC4KPj4KPiAKPiBX
b3VsZCB0aGlzIGltcGxlbWVudGF0aW9uIGd1YXJhbnRlZSBwcm9ncmVzcyBhcyBwcmV2aW91cyBp
bXBsZW1lbnRhdGlvbgo+IGd1YXJhbnRlZWQ/CgpZZXMuCgoKSnVlcmdlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
