Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1804F168238
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 16:48:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5AVq-0002tt-10; Fri, 21 Feb 2020 15:46:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYDf=4J=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j5AVo-0002to-Id
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 15:46:44 +0000
X-Inumbo-ID: 5b3db80e-54c1-11ea-86a2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b3db80e-54c1-11ea-86a2-12813bfff9fa;
 Fri, 21 Feb 2020 15:46:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7D529AD03;
 Fri, 21 Feb 2020 15:46:42 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org
References: <1582133128-25638-1-git-send-email-igor.druzhinin@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <119a1e77-fcd3-4de9-28ae-e3801981a585@suse.com>
Date: Fri, 21 Feb 2020 16:46:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1582133128-25638-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/cpu: Sync any remaining RCU
 callbacks after CPU up/down
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
Cc: andrew.cooper3@citrix.com, wl@xen.org, jbeulich@suse.com,
 roger.pau@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAgMTg6MjUsIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+IER1cmluZyBDUFUgZG93
biBvcGVyYXRpb24gUkNVIGNhbGxiYWNrcyBhcmUgc2NoZWR1bGVkIHRvIGZpbmlzaAo+IG9mZiBz
b21lIGFjdGlvbnMgbGF0ZXIgYXMgc29vbiBhcyBDUFUgaXMgZnVsbHkgZGVhZCAodGhlIHNhbWUg
YXBwbGllcwo+IHRvIENQVSB1cCBvcGVyYXRpb24gaW4gY2FzZSBlcnJvciBwYXRoIGlzIHRha2Vu
KS4gSWYgaW4gdGhlIHNhbWUgZ3JhY2UKPiBwZXJpb2QgYW5vdGhlciBDUFUgdXAgb3BlcmF0aW9u
IGlzIHBlcmZvcm1lZCBvbiB0aGUgc2FtZSBDUFUsIFJDVSBjYWxsYmFjawo+IHdpbGwgYmUgY2Fs
bGVkIGxhdGVyIG9uIGEgQ1BVIGluIGEgcG90ZW50aWFsbHkgd3JvbmcgKGFscmVhZHkgdXAgYWdh
aW4KPiBpbnN0ZWFkIG9mIHN0aWxsIGJlaW5nIGRvd24pIHN0YXRlIGxlYWRpbmcgdG8gZXZlbnR1
YWwgc3RhdGUgaW5jb25zaXN0ZW5jeQo+IGFuZC9vciBjcmFzaC4KPiAKPiBJbiBvcmRlciB0byBh
dm9pZCBpdCAtIGZsdXNoIFJDVSBjYWxsYmFja3MgZXhwbGljaXRseSB1cG9uIGZpbmlzaGluZyBv
ZmYKPiB0aGUgY3VycmVudCBvcGVyYXRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogSWdvciBEcnV6
aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
