Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C82E8BCB43
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 17:25:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCmeL-0006jH-Mb; Tue, 24 Sep 2019 15:22:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MVCM=XT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iCmeJ-0006jB-Rj
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:22:43 +0000
X-Inumbo-ID: 27102036-dedf-11e9-9621-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 27102036-dedf-11e9-9621-12813bfff9fa;
 Tue, 24 Sep 2019 15:22:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0E3AFB613;
 Tue, 24 Sep 2019 15:22:42 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190924074202.4064-1-jgross@suse.com>
 <c711742e-cedf-ce3c-9f0a-86282fba572c@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7da2f2cd-3d5e-5f43-512c-ca3b5f621085@suse.com>
Date: Tue, 24 Sep 2019 17:22:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c711742e-cedf-ce3c-9f0a-86282fba572c@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: don't let XEN_RUNSTATE_UPDATE
 leak into vcpu_runstate_get()
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMTkgMTc6MTYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI0LjA5LjIwMTkgMDk6
NDIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IHZjcHVfcnVuc3RhdGVfZ2V0KCkgc2hvdWxkIG5l
dmVyIHJldHVybiBhIHN0YXRlIGVudHJ5IHRpbWUgd2l0aAo+PiBYRU5fUlVOU1RBVEVfVVBEQVRF
IHNldC4gVG8gYXZvaWQgdGhpcyBsZXQgdXBkYXRlX3J1bnN0YXRlX2FyZWEoKQo+PiBvcGVyYXRl
IG9uIGEgbG9jYWwgcnVuc3RhdGUgY29weS4KPj4KPj4gVGhpcyBwcm9ibGVtIHdhcyBpbnRyb2R1
Y2VkIHdpdGggY29tbWl0IDI1MjljODUwZWE0OGYwMzYgKCJhZGQgdXBkYXRlCj4+IGluZGljYXRv
ciB0byB2Y3B1X3J1bnN0YXRlX2luZm8iKS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgo+PiAtLS0KPj4gICB4ZW4vYXJjaC94ODYvZG9tYWluLmMg
fCAxNyArKysrKysrKysrLS0tLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IEkgaGFkIHRoaXMgY29tbWl0dGVkIGFscmVhZHkgYW5k
IHdhcyBhYm91dCB0byBwdXNoLCBidXQgdGhpcwo+IGRlZmluaXRlbHkgd2FudHMgYSBzaW1pbGFy
IGNoYW5nZSBmb3IgQXJtLgoKT2gsIEkgd2FzIGZvb2xlZCBieSBjc2NvcGUgYWdhaW4sIHdoaWNo
IGdldHMgZmVkIGFuIGFyY2ggc3BlY2lmaWMKZmlsZSBsaXN0LgoKU2VuZGluZyBWMiBzb29uLgoK
Ckp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
