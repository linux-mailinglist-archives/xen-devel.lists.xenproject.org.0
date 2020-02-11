Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDC1158F77
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 14:05:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1VAv-00020U-2Z; Tue, 11 Feb 2020 13:02:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lVjU=37=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j1VAu-00020P-4P
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 13:02:00 +0000
X-Inumbo-ID: b020a820-4cce-11ea-b593-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b020a820-4cce-11ea-b593-12813bfff9fa;
 Tue, 11 Feb 2020 13:01:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7EC4EAFEC;
 Tue, 11 Feb 2020 13:01:58 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200211122736.16714-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ab86650e-62b2-9967-c88d-3e0fc50bba11@suse.com>
Date: Tue, 11 Feb 2020 14:01:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200211122736.16714-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/sched: add some diagnostic info in
 the run queue keyhandler
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDIuMjAyMCAxMzoyNywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBXaGVuIGR1bXBpbmcg
dGhlIHJ1biBxdWV1ZSBpbmZvcm1hdGlvbiBhZGQgc29tZSBtb3JlIGRhdGEgcmVnYXJkaW5nCj4g
Y3VycmVudCBhbmQgKGlmIGtub3duKSBwcmV2aW91cyB2Y3B1IGZvciBlYWNoIHBoeXNpY2FsIGNw
dS4KPiAKPiBXaXRoIGNvcmUgc2NoZWR1bGluZyBhY3RpdmF0ZWQgdGhlIHByaW50ZWQgZGF0YSB3
aWxsIGJlIGUuZy46Cj4gCj4gKFhFTikgQ1BVcyBpbmZvOgo+IChYRU4pIENQVVswMF0gY3VycmVu
dD1kW0lETEVddjAsIGN1cnI9ZFtJRExFXXYwLCBwcmV2PU5VTEwKPiAoWEVOKSBDUFVbMDFdIGN1
cnJlbnQ9ZFtJRExFXXYxCj4gKFhFTikgQ1BVWzAyXSBjdXJyZW50PWRbSURMRV12MiwgY3Vycj1k
W0lETEVddjIsIHByZXY9TlVMTAo+IChYRU4pIENQVVswM10gY3VycmVudD1kW0lETEVddjMKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gLS0tCj4g
VjI6IGFkZCBwcm9wZXIgbG9ja2luZwoKIlByb3BlciIgaXMgYW1iaWd1b3VzIGluIHRoZSBjb250
ZXh0IG9mIGR1bXBpbmcgZnVuY3Rpb25zLiBJbiBhCm51bWJlciBvZiBwbGFjZXMgd2UgdXNlIHRy
eS1sb2NrLCB0byBhdm9pZCB0aGUgZHVtcGluZyBoYW5naW5nCm9uIHNvbWV0aGluZyBlbHNlIG1v
bm9wb2xpemluZyB0aGUgbG9jay4gSSdkIGxpa2UgdG8gc3VnZ2VzdCB0bwpkbyBzbyBoZXJlLCB0
b28uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
