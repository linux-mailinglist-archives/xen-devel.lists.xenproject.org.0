Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A3D1771AF
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 09:58:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j93M3-0001da-Jy; Tue, 03 Mar 2020 08:56:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TLdZ=4U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j93M2-0001dV-5j
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 08:56:42 +0000
X-Inumbo-ID: e6479f12-5d2c-11ea-a0ac-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6479f12-5d2c-11ea-a0ac-12813bfff9fa;
 Tue, 03 Mar 2020 08:56:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A9E74B038;
 Tue,  3 Mar 2020 08:56:40 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200303080300.12467-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <81f3149c-79c7-4b7e-8058-88a95eb311ea@suse.com>
Date: Tue, 3 Mar 2020 09:56:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200303080300.12467-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: fix error path in
 cpupool_unassign_cpu_start()
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
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDMuMjAyMCAwOTowMywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBJbiBjYXNlIG1vdmlu
ZyBhd2F5IGFsbCBkb21haW5zIGZyb20gdGhlIGNwdSB0byBiZSByZW1vdmVkIGlzIGZhaWxpbmcK
PiBpbiBjcHVwb29sX3VuYXNzaWduX2NwdV9zdGFydCgpIHRoZSBlcnJvciBwYXRoIGlzIG1pc3Np
bmcgdG8gcmVsZWFzZQo+IHNjaGVkX3Jlc19yY3Vsb2NrLgo+IAo+IFRoZSBub3JtYWwgZXhpdCBw
YXRoIGlzIHJlbGVhc2luZyBkb21saXN0X3JlYWRfbG9jayBpbnN0ZWFkICh0aGlzIGlzCj4gY3Vy
cmVudGx5IG5vIHByb2JsZW0gYXMgdGhlIHJlZmVyZW5jZSB0byB0aGUgc3BlY2lmaWMgcmN1IGxv
Y2sgaXMgbm90Cj4gdXNlZCBieSByY3VfcmVhZF91bmxvY2soKSkuCj4gCj4gUmVwb3J0ZWQtYnk6
IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CmFsYmVpdCBwcmVmZXJhYmx5IHdpdGggLi4uCgo+IC0t
LSBhL3hlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5jCj4gKysrIGIveGVuL2NvbW1vbi9zY2hlZC9j
cHVwb29sLmMKPiBAQCAtNDY2LDcgKzQ2Niw3IEBAIHN0YXRpYyBpbnQgY3B1cG9vbF91bmFzc2ln
bl9jcHVfc3RhcnQoc3RydWN0IGNwdXBvb2wgKmMsIHVuc2lnbmVkIGludCBjcHUpCj4gICAgICAg
ICAgfQo+ICAgICAgICAgIHJjdV9yZWFkX3VubG9jaygmZG9tbGlzdF9yZWFkX2xvY2spOwo+ICAg
ICAgICAgIGlmICggcmV0ICkKPiAtICAgICAgICAgICAgZ290byBvdXQ7Cj4gKyAgICAgICAgICAg
IGdvdG8gb3V0X3JjdTsKPiAgICAgIH0KPiAgICAgIGNwdXBvb2xfbW92aW5nX2NwdSA9IGNwdTsK
PiAgICAgIGF0b21pY19pbmMoJmMtPnJlZmNudCk7Cj4gQEAgLTQ3NCw3ICs0NzQsOCBAQCBzdGF0
aWMgaW50IGNwdXBvb2xfdW5hc3NpZ25fY3B1X3N0YXJ0KHN0cnVjdCBjcHVwb29sICpjLCB1bnNp
Z25lZCBpbnQgY3B1KQo+ICAgICAgY3B1bWFza19hbmRub3QoYy0+Y3B1X3ZhbGlkLCBjLT5jcHVf
dmFsaWQsIGNwdXMpOwo+ICAgICAgY3B1bWFza19hbmQoYy0+cmVzX3ZhbGlkLCBjLT5jcHVfdmFs
aWQsICZzY2hlZF9yZXNfbWFzayk7Cj4gIAo+IC0gICAgcmN1X3JlYWRfdW5sb2NrKCZkb21saXN0
X3JlYWRfbG9jayk7Cj4gK291dF9yY3U6CgouLi4gdGhlIGxhYmVsIGluZGVudGVkIGJ5IGF0IGxl
YXN0IG9uZSBibGFuaywgYXQgd2hpY2ggcG9pbnQgaXQKbWF5IG1ha2Ugc2Vuc2UgdG8gYWxzbyAu
Li4KCj4gKyAgICByY3VfcmVhZF91bmxvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsKPiAgb3V0OgoK
Li4uIGNvcnJlY3QgdGhpcyBvbmUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
