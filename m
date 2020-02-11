Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4BE1595F4
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 18:07:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1YxJ-00083v-NX; Tue, 11 Feb 2020 17:04:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lVjU=37=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j1YxI-00083o-IM
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 17:04:12 +0000
X-Inumbo-ID: 86251ade-4cf0-11ea-b5e4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86251ade-4cf0-11ea-b5e4-12813bfff9fa;
 Tue, 11 Feb 2020 17:04:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2FA2EBAA0;
 Tue, 11 Feb 2020 17:04:11 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200211122736.16714-1-jgross@suse.com>
 <ab86650e-62b2-9967-c88d-3e0fc50bba11@suse.com>
 <54c6223a-4ca5-40d2-d377-b7ec8eb19eb0@suse.com>
 <09af5f39-7740-43b1-bc07-3d7d51a8e767@suse.com>
 <a3aae1ec-0830-0d65-a53b-338e27fade95@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <464d4f4c-a7eb-d081-71f1-55f40de9bd9f@suse.com>
Date: Tue, 11 Feb 2020 18:04:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <a3aae1ec-0830-0d65-a53b-338e27fade95@suse.com>
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

T24gMTEuMDIuMjAyMCAxNzo1NCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxMS4wMi4yMCAx
Nzo0NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDExLjAyLjIwMjAgMTQ6MTAsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+PiBPbiAxMS4wMi4yMCAxNDowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMTEuMDIuMjAyMCAxMzoyNywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4gV2hlbiBk
dW1waW5nIHRoZSBydW4gcXVldWUgaW5mb3JtYXRpb24gYWRkIHNvbWUgbW9yZSBkYXRhIHJlZ2Fy
ZGluZwo+Pj4+PiBjdXJyZW50IGFuZCAoaWYga25vd24pIHByZXZpb3VzIHZjcHUgZm9yIGVhY2gg
cGh5c2ljYWwgY3B1Lgo+Pj4+Pgo+Pj4+PiBXaXRoIGNvcmUgc2NoZWR1bGluZyBhY3RpdmF0ZWQg
dGhlIHByaW50ZWQgZGF0YSB3aWxsIGJlIGUuZy46Cj4+Pj4+Cj4+Pj4+IChYRU4pIENQVXMgaW5m
bzoKPj4+Pj4gKFhFTikgQ1BVWzAwXSBjdXJyZW50PWRbSURMRV12MCwgY3Vycj1kW0lETEVddjAs
IHByZXY9TlVMTAo+Pj4+PiAoWEVOKSBDUFVbMDFdIGN1cnJlbnQ9ZFtJRExFXXYxCj4+Pj4+IChY
RU4pIENQVVswMl0gY3VycmVudD1kW0lETEVddjIsIGN1cnI9ZFtJRExFXXYyLCBwcmV2PU5VTEwK
Pj4+Pj4gKFhFTikgQ1BVWzAzXSBjdXJyZW50PWRbSURMRV12Mwo+Pj4+Pgo+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiBW
MjogYWRkIHByb3BlciBsb2NraW5nCj4+Pj4KPj4+PiAiUHJvcGVyIiBpcyBhbWJpZ3VvdXMgaW4g
dGhlIGNvbnRleHQgb2YgZHVtcGluZyBmdW5jdGlvbnMuIEluIGEKPj4+PiBudW1iZXIgb2YgcGxh
Y2VzIHdlIHVzZSB0cnktbG9jaywgdG8gYXZvaWQgdGhlIGR1bXBpbmcgaGFuZ2luZwo+Pj4+IG9u
IHNvbWV0aGluZyBlbHNlIG1vbm9wb2xpemluZyB0aGUgbG9jay4gSSdkIGxpa2UgdG8gc3VnZ2Vz
dCB0bwo+Pj4+IGRvIHNvIGhlcmUsIHRvby4KPj4+Cj4+PiBBbGwgdGhlIHNjaGVkdWxlciByZWxh
dGVkIGR1bXBpbmcgZnVuY3Rpb25zIGFyZSB1c2luZyB0aGUgInJlYWwiIGxvY2tzLgo+Pj4gU28g
dXNpbmcgdHJ5bG9jayBpbiB0aGlzIHNpbmdsZSBjYXNlIHdvdWxkbid0IGhlbHAgYXQgYWxsLiBB
ZGRpdGlvbmFsbHkKPj4+IHVzaW5nIHRyeWxvY2sgb25seSB3b3VsZCBtYWtlIGEgY3Jhc2ggZHVy
aW5nIGR1bXBpbmcgdGhlIGRhdGEgbW9yZQo+Pj4gcHJvYmFibGUsIHNvIEknbSBub3Qgc3VyZSB3
ZSB3YW50IHRoYXQuCj4+Cj4+IFdoeSB3b3VsZCBpdCBtYWtlIGEgY3Jhc2ggbW9yZSBsaWtlbHk/
IElmIHlvdSBjYW4ndCBnZXQgdGhlIGxvY2ssCj4+IHlvdSdkIHNpbXBseSBza2lwIGR1bXBpbmcu
Cj4gCj4gQWgsIG9rYXksIHRoZW4gSSBtaXN1bmRlcnN0b29kIHlvdXIgaW50ZW50aW9uLgo+IAo+
IEkgc3RpbGwgdGhpbmsgdGhhdCB0aGlzIHNob3VsZCBiZSBkb25lIG5vdCBvbmx5IGluIG9uZSBw
bGFjZSwgYnV0IGluIGEKPiBtb3JlIGdlbmVyYWwgZmFzaGlvbi4gSSdkIHJhdGhlciBnaXZlIHVw
IG9ubHkgYWZ0ZXIgc29tZSB0aW1lIHRyeWluZwo+ICgxIG1pbGxpc2Vjb25kIHBlciBkZWZhdWx0
PykgYW5kIGFwcGx5IHRoZSBzYW1lIHNjaGVtZSB0byBhbGwgZHVtcGluZwo+IGZ1bmN0aW9ucy4K
PiAKPiBJIGNhbiBoYXZlIGEgdHJ5IGZvciBzdWNoIGEgc2VyaWVzIGlmIHlvdSBhZ3JlZSBvbiB0
YWtpbmcgYSBtb3JlIGdlbmVyYWwKPiBhcHByb2FjaC4KCkdldHRpbmcgYmVoYXZpb3IgY29uc2lz
dGVudCBhY3Jvc3Mga2V5IGhhbmRsZXJzIHdvdWxkIG9mIGNvdXJzZQpiZSB2ZXJ5IG5pY2UuCgpK
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
