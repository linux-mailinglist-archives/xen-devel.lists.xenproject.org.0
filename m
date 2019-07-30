Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC32B7A4E8
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 11:43:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsOdR-00017L-I7; Tue, 30 Jul 2019 09:41:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QE78=V3=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hsOdP-000176-Dj
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 09:41:31 +0000
X-Inumbo-ID: 353c4b26-b2ae-11e9-8980-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 353c4b26-b2ae-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 09:41:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 831E55AFF8;
 Tue, 30 Jul 2019 09:41:29 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.36.118.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA53660BE5;
 Tue, 30 Jul 2019 09:41:27 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-10-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <918ab165-052f-2f23-906a-150161388475@redhat.com>
Date: Tue, 30 Jul 2019 11:41:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190729153944.24239-10-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Tue, 30 Jul 2019 09:41:29 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 09/35] OvmfPkg/OvmfXen: use
 a TimerLib instance that depends only on the CPU
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jordan Justen <jordan.l.justen@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMjkvMTkgMTc6MzksIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFRoZSBBQ1BJIFRpbWVy
IGlzbid0IHByZXNlbnQgaW4gYSBQVkggZ3Vlc3QsIGJ1dCBsb2NhbCBBUElDIHdvcmtzIG9uCj4g
Ym90aCBQVkggYW5kIEhWTS4KPiAKPiBOb3RlIHRoYXQgdGhlIHVzZSBvZiBTZWNQZWlEeGVUaW1l
ckxpYkNwdSBtaWdodCBiZSBhbiBpc3N1ZSB3aXRoIGEKPiBkcml2ZXIgb2YgdHlwZSBEWEVfUlVO
VElNRV9EUklWRVIuIEkndmUgYXR0ZW1wdGVkIHRvIGZpbmQgb3V0IHdoaWNoIG9mCj4gdGhlIERY
RV9SVU5USU1FX0RSSVZFUiB1c2VzIHRoZSBUaW1lckxpYiBhdCBydW50aW1lLiBJJ3ZlIGRvbmUg
dGhhdCBieQo+IHJlcGxhY2luZyB0aGUgVGltZXJMaWIgZXZhbHVhdGlvbiBpbgo+IFtMaWJyYXJ5
Q2xhc3Nlcy5jb21tb24uRFhFX1JVTlRJTUVfRFJJVkVSXSBieSBhIGRpZmZlcmVudCBvbmUgYW5k
Cj4gY2hlY2tpbmcgZXZlcnkgbW9kdWxlIHRoYXQgdXNlcyBpdCAod2l0aCB0aGUgLS1yZXBvcnQt
ZmlsZT1yZXBvcnQKPiBidWlsZCBvcHRpb24pLgo+IAo+IFJlc2V0U3lzdGVtUnVudGltZUR4ZSBp
cyBjYWxsaW5nIHRoZSBUaW1lckxpYiBBUEkgYXQgcnVudGltZSB0byBkbyB0aGUKPiBvcGVyYXRp
b24gIkVmaVJlc2V0Q29sZCIsIHNvIHRoaXMgbWF5IG5ldmVyIGNvbXBsZXRlIGlmIHRoZSBPUyBo
YXZlCj4gZGlzYWJsZWQgdGhlIExvY2FsIEFQSUMgVGltZXIuCj4gCj4gUmVmOiBodHRwczovL2J1
Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTE2ODkKPiBTaWduZWQtb2ZmLWJ5
OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiBBY2tlZC1ieTog
TGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KPiAtLS0KPiAKPiBOb3RlczoKPiAgICAg
djQ6Cj4gICAgIC0gcmV3b3JkZWQgdGhlIGZpcnN0IHNlbnRlbmNlLCB1c2UgIm5vdCBwcmVzZW50
IiBpbnN0ZWFkIG9mICJkb24ndCB3b3JrIi4KClBsdXMgdHdvIHR5cG8gZml4ZXMuCgpBY2tlZC1i
eTogTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KClRoYW5rcwpMYXN6bG8KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
