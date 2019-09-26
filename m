Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8497BBF54D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 16:53:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDV6n-0003JW-7l; Thu, 26 Sep 2019 14:51:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOM6=XV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDV6l-0003JI-O7
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 14:51:03 +0000
X-Inumbo-ID: 0e7c8944-e06d-11e9-97fb-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 0e7c8944-e06d-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 14:51:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B053B28;
 Thu, 26 Sep 2019 07:51:00 -0700 (PDT)
Received: from [10.37.8.90] (unknown [10.37.8.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D63353F534;
 Thu, 26 Sep 2019 07:50:58 -0700 (PDT)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20190925042917.11392-1-jgross@suse.com>
 <c08b582b-d13d-7b2f-6b5a-216581f31cb7@arm.com>
 <50c867f8-0ee3-fba6-e76d-94984df01740@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <27edcddc-10a7-7012-64d8-626d6091c60e@arm.com>
Date: Thu, 26 Sep 2019 15:50:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <50c867f8-0ee3-fba6-e76d-94984df01740@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/sched: don't let XEN_RUNSTATE_UPDATE
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA5LzI2LzE5IDM6NDUgUE0sIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4gT24gMjYuMDku
MTkgMTY6MjcsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGksCj4+Cj4+IE9uIDkvMjUvMTkgNToy
OSBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+IHZjcHVfcnVuc3RhdGVfZ2V0KCkgc2hvdWxk
IG5ldmVyIHJldHVybiBhIHN0YXRlIGVudHJ5IHRpbWUgd2l0aAo+Pj4gWEVOX1JVTlNUQVRFX1VQ
REFURSBzZXQuIFRvIGF2b2lkIHRoaXMgbGV0IHVwZGF0ZV9ydW5zdGF0ZV9hcmVhKCkKPj4+IG9w
ZXJhdGUgb24gYSBsb2NhbCBydW5zdGF0ZSBjb3B5Lgo+Pj4KPj4+IFRoaXMgcHJvYmxlbSB3YXMg
aW50cm9kdWNlZCB3aXRoIGNvbW1pdCAyNTI5Yzg1MGVhNDhmMDM2ICgiYWRkIHVwZGF0ZQo+Pj4g
aW5kaWNhdG9yIHRvIHZjcHVfcnVuc3RhdGVfaW5mbyIpLgo+Pj4KPj4+IFJlcG9ydGVkLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+Pj4gU2lnbmVkLW9mZi1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+Pj4gLS0tCj4+PiBWMjogYWRkIGhh
bmRsaW5nIG9uIEFSTSwgdG9vIChKYW4gQmV1bGljaCkKPj4+IC0tLQo+Pj4gwqAgeGVuL2FyY2gv
YXJtL2RvbWFpbi5jIHwgMTMgKysrKysrKystLS0tLQo+Pj4gwqAgeGVuL2FyY2gveDg2L2RvbWFp
bi5jIHwgMTcgKysrKysrKysrKy0tLS0tLS0KPj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMTggaW5z
ZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9kb21haW4uYyBiL3hlbi9hcmNoL2FybS9kb21haW4uYwo+Pj4gaW5kZXggYWUxM2U0N2U4
Ni4uZDY4MWZmNWM2ZSAxMDA2NDQKPj4+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW4uYwo+Pj4g
KysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jCj4+PiBAQCAtMjgwLDI4ICsyODAsMzEgQEAgc3Rh
dGljIHZvaWQgY3R4dF9zd2l0Y2hfdG8oc3RydWN0IHZjcHUgKm4pCj4+PiDCoCBzdGF0aWMgdm9p
ZCB1cGRhdGVfcnVuc3RhdGVfYXJlYShzdHJ1Y3QgdmNwdSAqdikKPj4+IMKgIHsKPj4+IMKgwqDC
oMKgwqAgdm9pZCBfX3VzZXIgKmd1ZXN0X2hhbmRsZSA9IE5VTEw7Cj4+PiArwqDCoMKgIHN0cnVj
dCB2Y3B1X3J1bnN0YXRlX2luZm8gcnVuc3RhdGU7Cj4+PiDCoMKgwqDCoMKgIGlmICggZ3Vlc3Rf
aGFuZGxlX2lzX251bGwocnVuc3RhdGVfZ3Vlc3QodikpICkKPj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm47Cj4+PiArwqDCoMKgIG1lbWNweSgmcnVuc3RhdGUsICZ2LT5ydW5zdGF0ZSwgc2l6
ZW9mKHJ1bnN0YXRlKSk7Cj4+Cj4+IEkgYW0gbm90IHJlYWxseSBoYXBweSB3aXRoIHRoaXMgc29s
dXRpb24uIEFGQUlDVCwgeW91IG9ubHkgY29weSB0aGUgCj4+IGZ1bGwgc3RydWN0dXJlIGhlcmUg
anVzdCBmb3IgdGhlIGJlbmVmaXRzIG9mIHVwZGF0aW5nIHN0YXRlX2VudHJ5X3RpbWUuCj4+Cj4+
IEkgc2F3IHlvdSBkaXNjdXNzIGFib3V0IGl0IHdpdGggSmFuLCBzbyBpdCB3b3VsZCBiZSBuaWNl
IHRvIGxvZyBhdCAKPj4gbGVhc3QgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIHRoZSByZWFzb24gd2h5
IHRoaXMgaXMgZG9uZSBsaWtlIHRoYXQuCj4gCj4gSXNuJ3QgdGhlIHJlZmVyZW5jZSB0byBjb21t
aXQgMjUyOWM4NTBlYTQ4ZjAzNiBlbm91Z2g/IFRoZSB1cGRhdGUKPiBwcm90b2NvbCBpcyBjbGVh
cmx5IGRlc2NyaWJlZCBpbiB0aGF0IGNvbW1pdCBtZXNzYWdlLgoKSSBtZWFudCB0aGUgcmVhc29u
IHRvIHVzZSB0aGUgJ21lbWNweScsIHdoaWNoIHNvdW5kcyBsaWtlIHF1aXRlIGEgd2FzdGUsIApj
b21wYXJlIHRvIG9ubHkgY29weSBzdGF0ZV9lbnRyeV90aW1lLgoKQ2hlZXJzLAoKLS0gCkp1bGll
biBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
