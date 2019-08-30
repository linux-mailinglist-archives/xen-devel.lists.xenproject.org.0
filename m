Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3ABA37B1
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 15:22:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3gof-0003kh-O2; Fri, 30 Aug 2019 13:19:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3god-0003kc-QB
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 13:19:47 +0000
X-Inumbo-ID: d5bd8044-cb28-11e9-ae89-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5bd8044-cb28-11e9-ae89-12813bfff9fa;
 Fri, 30 Aug 2019 13:19:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2E888B03D;
 Fri, 30 Aug 2019 13:19:45 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1567166206-13872-1-git-send-email-igor.druzhinin@citrix.com>
 <814e8dd518f549a7a19e70e4ad5b14be@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <954bc4c8-4b62-0fc1-2e3a-0beffe9b80ac@suse.com>
Date: Fri, 30 Aug 2019 15:19:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <814e8dd518f549a7a19e70e4ad5b14be@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/domain: don't destroy IOREQ servers on
 soft reset
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
 Paul Durrant <Paul.Durrant@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>,
 "wl@xen.org" <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDguMjAxOSAxNDoxMiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0
cml4LmNvbT4KPj4gU2VudDogMzAgQXVndXN0IDIwMTkgMTI6NTcKPj4gVG86IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwo+PiBDYzogamJldWxpY2hAc3VzZS5jb207IEFuZHJldyBDb29w
ZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBQYXVsIER1cnJhbnQKPj4gPFBhdWwuRHVy
cmFudEBjaXRyaXguY29tPjsgd2xAeGVuLm9yZzsgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT47IElnb3IgRHJ1emhpbmluCj4+IDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29t
Pgo+PiBTdWJqZWN0OiBbUEFUQ0hdIHg4Ni9kb21haW46IGRvbid0IGRlc3Ryb3kgSU9SRVEgc2Vy
dmVycyBvbiBzb2Z0IHJlc2V0Cj4+Cj4+IFBlcmZvcm1pbmcgc29mdCByZXNldCBzaG91bGQgbm90
IG9wcG9ydHVuaXN0aWNhbGx5IGtpbGwgSU9SRVEgc2VydmVycwo+PiBmb3IgZGV2aWNlIGVtdWxh
dG9ycyB0aGF0IG1pZ2h0IGJlIGN1cnJlbnRseSBydW5uaW5nIGZvciBhIGRvbWFpbi4KPj4gRXZl
cnkgZW11bGF0b3IgaXMgc3VwcG9zZWQgdG8gY2xlYW4gdXAgSU9SRVEgc2VydmVycyBmb3IgaXRz
ZWxmIG9uIGV4aXQuCj4+IFRoaXMgYWxsb3dzIGEgdG9vbHN0YWNrIHRvIGVsZWN0IHdoZXRoZXIg
b3Igbm90IGEgcGFydGljdWxhciBkZXZpY2UKPj4gbW9kZWwgc2hvdWxkIGJlIHJlc3RhcnRlZC4K
Pj4KPj4gVGhlIG9yaWdpbmFsIGNvZGUgd2FzIGludHJvZHVjZWQgaW4gMzIzNWNiZmUgKCJhcmNo
LXNwZWNpZmljIGhvb2tzIGZvcgo+PiBkb21haW5fc29mdF9yZXNldCgpIikgbGlrZWx5IGR1ZSB0
byB0aGUgZmFjdCAnZGVmYXVsdCcgSU9SRVEgc2VydmVyCj4+IGV4aXN0ZWQgaW4gWGVuIGF0IHRo
ZSB0aW1lIGFuZCB1c2VkIGJ5IFFFTVUgZGlkbid0IGhhdmUgYW4gQVBJIGNhbGwgdG8KPj4gZGVz
dHJveS4gU2luY2UgdGhlIHJlbW92YWwgb2YgJ2RlZmF1bHQnIElPUkVRIHNlcnZlciBmcm9tIFhl
biB0aGlzCj4+IHJlYXNvbiBoYXMgZ29uZSBhd2F5Lgo+Pgo+PiBTaW5jZSBjb21taXQgYmE3ZmRk
NjRiICgieGVuOiBjbGVhbnVwIElPUkVRIHNlcnZlciBvbiBleGl0IikgUUVNVSBub3cKPj4gZGVz
dHJveXMgSU9SRVEgc2VydmVyIGZvciBpdHNlbGYgYXMgZXZlcnkgb3RoZXIgZGV2aWNlIGVtdWxh
dG9yCj4+IGlzIHN1cHBvc2VkIHRvIGRvLiBJdCdzIG5vdyBzYWZlIHRvIHJlbW92ZSB0aGlzIGNv
ZGUgZnJvbSBzb2Z0IHJlc2V0Cj4+IHBhdGggLSBleGlzdGluZyBzeXN0ZW1zIHdpdGggb2xkIFFF
TVUgc2hvdWxkIGJlIGFibGUgdG8gd29yayBhcwo+PiBldmVuIGlmIHRoZXJlIGFyZSBJT1JFUSBz
ZXJ2ZXJzIGxlZnQgYmVoaW5kLCBhIG5ldyBRRU1VIGluc3RhbmNlIHdpbGwKPj4gb3ZlcnJpZGUg
aXRzIHJhbmdlcyBhbnl3YXkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxp
Z29yLmRydXpoaW5pbkBjaXRyaXguY29tPgo+IAo+IFJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQg
PHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
