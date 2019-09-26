Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0CBBF545
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 16:47:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDV1g-0002LN-7o; Thu, 26 Sep 2019 14:45:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t6lf=XV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDV1f-0002LI-Es
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 14:45:47 +0000
X-Inumbo-ID: 527a9362-e06c-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 527a9362-e06c-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 14:45:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3BE46B18E;
 Thu, 26 Sep 2019 14:45:45 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190925042917.11392-1-jgross@suse.com>
 <c08b582b-d13d-7b2f-6b5a-216581f31cb7@arm.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <50c867f8-0ee3-fba6-e76d-94984df01740@suse.com>
Date: Thu, 26 Sep 2019 16:45:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c08b582b-d13d-7b2f-6b5a-216581f31cb7@arm.com>
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

T24gMjYuMDkuMTkgMTY6MjcsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwKPiAKPiBPbiA5LzI1
LzE5IDU6MjkgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IHZjcHVfcnVuc3RhdGVfZ2V0KCkg
c2hvdWxkIG5ldmVyIHJldHVybiBhIHN0YXRlIGVudHJ5IHRpbWUgd2l0aAo+PiBYRU5fUlVOU1RB
VEVfVVBEQVRFIHNldC4gVG8gYXZvaWQgdGhpcyBsZXQgdXBkYXRlX3J1bnN0YXRlX2FyZWEoKQo+
PiBvcGVyYXRlIG9uIGEgbG9jYWwgcnVuc3RhdGUgY29weS4KPj4KPj4gVGhpcyBwcm9ibGVtIHdh
cyBpbnRyb2R1Y2VkIHdpdGggY29tbWl0IDI1MjljODUwZWE0OGYwMzYgKCJhZGQgdXBkYXRlCj4+
IGluZGljYXRvciB0byB2Y3B1X3J1bnN0YXRlX2luZm8iKS4KPj4KPj4gUmVwb3J0ZWQtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4gLS0tCj4+IFYyOiBhZGQgaGFuZGxp
bmcgb24gQVJNLCB0b28gKEphbiBCZXVsaWNoKQo+PiAtLS0KPj4gwqAgeGVuL2FyY2gvYXJtL2Rv
bWFpbi5jIHwgMTMgKysrKysrKystLS0tLQo+PiDCoCB4ZW4vYXJjaC94ODYvZG9tYWluLmMgfCAx
NyArKysrKysrKysrLS0tLS0tLQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMo
KyksIDEyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFp
bi5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jCj4+IGluZGV4IGFlMTNlNDdlODYuLmQ2ODFmZjVj
NmUgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW4uYwo+PiArKysgYi94ZW4vYXJj
aC9hcm0vZG9tYWluLmMKPj4gQEAgLTI4MCwyOCArMjgwLDMxIEBAIHN0YXRpYyB2b2lkIGN0eHRf
c3dpdGNoX3RvKHN0cnVjdCB2Y3B1ICpuKQo+PiDCoCBzdGF0aWMgdm9pZCB1cGRhdGVfcnVuc3Rh
dGVfYXJlYShzdHJ1Y3QgdmNwdSAqdikKPj4gwqAgewo+PiDCoMKgwqDCoMKgIHZvaWQgX191c2Vy
ICpndWVzdF9oYW5kbGUgPSBOVUxMOwo+PiArwqDCoMKgIHN0cnVjdCB2Y3B1X3J1bnN0YXRlX2lu
Zm8gcnVuc3RhdGU7Cj4+IMKgwqDCoMKgwqAgaWYgKCBndWVzdF9oYW5kbGVfaXNfbnVsbChydW5z
dGF0ZV9ndWVzdCh2KSkgKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+PiArwqDCoMKg
IG1lbWNweSgmcnVuc3RhdGUsICZ2LT5ydW5zdGF0ZSwgc2l6ZW9mKHJ1bnN0YXRlKSk7Cj4gCj4g
SSBhbSBub3QgcmVhbGx5IGhhcHB5IHdpdGggdGhpcyBzb2x1dGlvbi4gQUZBSUNULCB5b3Ugb25s
eSBjb3B5IHRoZSBmdWxsIAo+IHN0cnVjdHVyZSBoZXJlIGp1c3QgZm9yIHRoZSBiZW5lZml0cyBv
ZiB1cGRhdGluZyBzdGF0ZV9lbnRyeV90aW1lLgo+IAo+IEkgc2F3IHlvdSBkaXNjdXNzIGFib3V0
IGl0IHdpdGggSmFuLCBzbyBpdCB3b3VsZCBiZSBuaWNlIHRvIGxvZyBhdCBsZWFzdCAKPiBpbiB0
aGUgY29tbWl0IG1lc3NhZ2UgdGhlIHJlYXNvbiB3aHkgdGhpcyBpcyBkb25lIGxpa2UgdGhhdC4K
Cklzbid0IHRoZSByZWZlcmVuY2UgdG8gY29tbWl0IDI1MjljODUwZWE0OGYwMzYgZW5vdWdoPyBU
aGUgdXBkYXRlCnByb3RvY29sIGlzIGNsZWFybHkgZGVzY3JpYmVkIGluIHRoYXQgY29tbWl0IG1l
c3NhZ2UuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
