Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAFD159559
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 17:49:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1YgV-000633-S7; Tue, 11 Feb 2020 16:46:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lVjU=37=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j1YgU-00062x-Ol
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 16:46:50 +0000
X-Inumbo-ID: 19053c1a-4cee-11ea-8434-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19053c1a-4cee-11ea-8434-bc764e2007e4;
 Tue, 11 Feb 2020 16:46:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0585D69D87;
 Tue, 11 Feb 2020 16:46:49 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200211122736.16714-1-jgross@suse.com>
 <ab86650e-62b2-9967-c88d-3e0fc50bba11@suse.com>
 <54c6223a-4ca5-40d2-d377-b7ec8eb19eb0@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <09af5f39-7740-43b1-bc07-3d7d51a8e767@suse.com>
Date: Tue, 11 Feb 2020 17:46:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <54c6223a-4ca5-40d2-d377-b7ec8eb19eb0@suse.com>
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

T24gMTEuMDIuMjAyMCAxNDoxMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxMS4wMi4yMCAx
NDowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDExLjAyLjIwMjAgMTM6MjcsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBXaGVuIGR1bXBpbmcgdGhlIHJ1biBxdWV1ZSBpbmZvcm1hdGlvbiBh
ZGQgc29tZSBtb3JlIGRhdGEgcmVnYXJkaW5nCj4+PiBjdXJyZW50IGFuZCAoaWYga25vd24pIHBy
ZXZpb3VzIHZjcHUgZm9yIGVhY2ggcGh5c2ljYWwgY3B1Lgo+Pj4KPj4+IFdpdGggY29yZSBzY2hl
ZHVsaW5nIGFjdGl2YXRlZCB0aGUgcHJpbnRlZCBkYXRhIHdpbGwgYmUgZS5nLjoKPj4+Cj4+PiAo
WEVOKSBDUFVzIGluZm86Cj4+PiAoWEVOKSBDUFVbMDBdIGN1cnJlbnQ9ZFtJRExFXXYwLCBjdXJy
PWRbSURMRV12MCwgcHJldj1OVUxMCj4+PiAoWEVOKSBDUFVbMDFdIGN1cnJlbnQ9ZFtJRExFXXYx
Cj4+PiAoWEVOKSBDUFVbMDJdIGN1cnJlbnQ9ZFtJRExFXXYyLCBjdXJyPWRbSURMRV12MiwgcHJl
dj1OVUxMCj4+PiAoWEVOKSBDUFVbMDNdIGN1cnJlbnQ9ZFtJRExFXXYzCj4+Pgo+Pj4gU2lnbmVk
LW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+Pj4gLS0tCj4+PiBWMjog
YWRkIHByb3BlciBsb2NraW5nCj4+Cj4+ICJQcm9wZXIiIGlzIGFtYmlndW91cyBpbiB0aGUgY29u
dGV4dCBvZiBkdW1waW5nIGZ1bmN0aW9ucy4gSW4gYQo+PiBudW1iZXIgb2YgcGxhY2VzIHdlIHVz
ZSB0cnktbG9jaywgdG8gYXZvaWQgdGhlIGR1bXBpbmcgaGFuZ2luZwo+PiBvbiBzb21ldGhpbmcg
ZWxzZSBtb25vcG9saXppbmcgdGhlIGxvY2suIEknZCBsaWtlIHRvIHN1Z2dlc3QgdG8KPj4gZG8g
c28gaGVyZSwgdG9vLgo+IAo+IEFsbCB0aGUgc2NoZWR1bGVyIHJlbGF0ZWQgZHVtcGluZyBmdW5j
dGlvbnMgYXJlIHVzaW5nIHRoZSAicmVhbCIgbG9ja3MuCj4gU28gdXNpbmcgdHJ5bG9jayBpbiB0
aGlzIHNpbmdsZSBjYXNlIHdvdWxkbid0IGhlbHAgYXQgYWxsLiBBZGRpdGlvbmFsbHkKPiB1c2lu
ZyB0cnlsb2NrIG9ubHkgd291bGQgbWFrZSBhIGNyYXNoIGR1cmluZyBkdW1waW5nIHRoZSBkYXRh
IG1vcmUKPiBwcm9iYWJsZSwgc28gSSdtIG5vdCBzdXJlIHdlIHdhbnQgdGhhdC4KCldoeSB3b3Vs
ZCBpdCBtYWtlIGEgY3Jhc2ggbW9yZSBsaWtlbHk/IElmIHlvdSBjYW4ndCBnZXQgdGhlIGxvY2ss
CnlvdSdkIHNpbXBseSBza2lwIGR1bXBpbmcuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
