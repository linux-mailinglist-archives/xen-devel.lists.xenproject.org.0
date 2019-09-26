Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9A7BF50F
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 16:29:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDUjj-0007w6-Sn; Thu, 26 Sep 2019 14:27:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOM6=XV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDUji-0007vn-Kb
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 14:27:14 +0000
X-Inumbo-ID: bb9138f4-e069-11e9-9657-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id bb9138f4-e069-11e9-9657-12813bfff9fa;
 Thu, 26 Sep 2019 14:27:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F84528;
 Thu, 26 Sep 2019 07:27:13 -0700 (PDT)
Received: from [10.37.8.90] (unknown [10.37.8.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 87D4B3F534;
 Thu, 26 Sep 2019 07:27:11 -0700 (PDT)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20190925042917.11392-1-jgross@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c08b582b-d13d-7b2f-6b5a-216581f31cb7@arm.com>
Date: Thu, 26 Sep 2019 15:27:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190925042917.11392-1-jgross@suse.com>
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

SGksCgpPbiA5LzI1LzE5IDU6MjkgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gdmNwdV9ydW5z
dGF0ZV9nZXQoKSBzaG91bGQgbmV2ZXIgcmV0dXJuIGEgc3RhdGUgZW50cnkgdGltZSB3aXRoCj4g
WEVOX1JVTlNUQVRFX1VQREFURSBzZXQuIFRvIGF2b2lkIHRoaXMgbGV0IHVwZGF0ZV9ydW5zdGF0
ZV9hcmVhKCkKPiBvcGVyYXRlIG9uIGEgbG9jYWwgcnVuc3RhdGUgY29weS4KPiAKPiBUaGlzIHBy
b2JsZW0gd2FzIGludHJvZHVjZWQgd2l0aCBjb21taXQgMjUyOWM4NTBlYTQ4ZjAzNiAoImFkZCB1
cGRhdGUKPiBpbmRpY2F0b3IgdG8gdmNwdV9ydW5zdGF0ZV9pbmZvIikuCj4gCj4gUmVwb3J0ZWQt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IC0tLQo+IFYyOiBhZGQgaGFu
ZGxpbmcgb24gQVJNLCB0b28gKEphbiBCZXVsaWNoKQo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL2Rv
bWFpbi5jIHwgMTMgKysrKysrKystLS0tLQo+ICAgeGVuL2FyY2gveDg2L2RvbWFpbi5jIHwgMTcg
KysrKysrKysrKy0tLS0tLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwg
MTIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW4uYyBi
L3hlbi9hcmNoL2FybS9kb21haW4uYwo+IGluZGV4IGFlMTNlNDdlODYuLmQ2ODFmZjVjNmUgMTAw
NjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jCj4gKysrIGIveGVuL2FyY2gvYXJtL2Rv
bWFpbi5jCj4gQEAgLTI4MCwyOCArMjgwLDMxIEBAIHN0YXRpYyB2b2lkIGN0eHRfc3dpdGNoX3Rv
KHN0cnVjdCB2Y3B1ICpuKQo+ICAgc3RhdGljIHZvaWQgdXBkYXRlX3J1bnN0YXRlX2FyZWEoc3Ry
dWN0IHZjcHUgKnYpCj4gICB7Cj4gICAgICAgdm9pZCBfX3VzZXIgKmd1ZXN0X2hhbmRsZSA9IE5V
TEw7Cj4gKyAgICBzdHJ1Y3QgdmNwdV9ydW5zdGF0ZV9pbmZvIHJ1bnN0YXRlOwo+ICAgCj4gICAg
ICAgaWYgKCBndWVzdF9oYW5kbGVfaXNfbnVsbChydW5zdGF0ZV9ndWVzdCh2KSkgKQo+ICAgICAg
ICAgICByZXR1cm47Cj4gICAKPiArICAgIG1lbWNweSgmcnVuc3RhdGUsICZ2LT5ydW5zdGF0ZSwg
c2l6ZW9mKHJ1bnN0YXRlKSk7CgpJIGFtIG5vdCByZWFsbHkgaGFwcHkgd2l0aCB0aGlzIHNvbHV0
aW9uLiBBRkFJQ1QsIHlvdSBvbmx5IGNvcHkgdGhlIGZ1bGwgCnN0cnVjdHVyZSBoZXJlIGp1c3Qg
Zm9yIHRoZSBiZW5lZml0cyBvZiB1cGRhdGluZyBzdGF0ZV9lbnRyeV90aW1lLgoKSSBzYXcgeW91
IGRpc2N1c3MgYWJvdXQgaXQgd2l0aCBKYW4sIHNvIGl0IHdvdWxkIGJlIG5pY2UgdG8gbG9nIGF0
IGxlYXN0IAppbiB0aGUgY29tbWl0IG1lc3NhZ2UgdGhlIHJlYXNvbiB3aHkgdGhpcyBpcyBkb25l
IGxpa2UgdGhhdC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
