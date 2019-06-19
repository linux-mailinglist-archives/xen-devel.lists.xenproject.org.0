Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5074C2E8
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 23:24:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdi1e-0000N8-Dw; Wed, 19 Jun 2019 21:21:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hb7b=US=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdi1d-0000N3-30
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 21:21:49 +0000
X-Inumbo-ID: 3ec8a1ae-92d8-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 3ec8a1ae-92d8-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 21:21:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D5F2344;
 Wed, 19 Jun 2019 14:21:47 -0700 (PDT)
Received: from [10.37.8.153] (unknown [10.37.8.153])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18DAD3F738;
 Wed, 19 Jun 2019 14:21:45 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <1560975087-25632-1-git-send-email-andrew.cooper3@citrix.com>
 <1560975087-25632-3-git-send-email-andrew.cooper3@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <bfafad45-d05a-d9e5-8f8b-b313b4cd322f@arm.com>
Date: Wed, 19 Jun 2019 22:21:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560975087-25632-3-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/4] xen/link: Link .data.schedulers and
 CONSTRUCTERS in more appropriate locations
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
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gNi8xOS8xOSA5OjExIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE5l
aXRoZXIgb2YgdGhlc2Ugc2hvdWxkIGxpdmUgaW4gLmRhdGEKPiAKPiAgICogLmRhdGEuc2NoZWR1
bGVycyBpcyBvbmx5IGV2ZXIgcmVhZCwgc28gaXMgbW92ZWQgaW50byAucm9kYXRhCj4gICAqIENP
TlNUUlVDVE9SUyBpcyBvbmx5IGV2ZXIgcmVhZCwgYW5kIG9ubHkgYXQgYm9vdCwgc28gaXMgbW92
ZWQgdG8gYmVzaWRlCj4gICAgIC5pbml0LnJvZGF0YQo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gLS0tCj4gQ0M6IEphbiBCZXVs
aWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiBDQzog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gQ0M6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBDQzogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4KPiAtLS0KPiAgIHhlbi9hcmNoL2FybS94ZW4ubGRzLlMgfCAxMSAr
KysrKystLS0tLQo+ICAgeGVuL2FyY2gveDg2L3hlbi5sZHMuUyB8IDExICsrKysrKy0tLS0tCj4g
ICAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0veGVuLmxkcy5TIGIveGVuL2FyY2gvYXJtL3hlbi5s
ZHMuUwo+IGluZGV4IDMxZDc0YTguLjJiNDRlNWQgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJt
L3hlbi5sZHMuUwo+ICsrKyBiL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMKPiBAQCAtNjYsNiArNjYs
MTEgQEAgU0VDVElPTlMKPiAgICAgICAgICAqKC5kYXRhLnBhcmFtKQo+ICAgICAgICAgIF9fcGFy
YW1fZW5kID0gLjsKPiAgIAo+ICsgICAgICAgLiA9IEFMSUdOKFBPSU5URVJfQUxJR04pOwoKVGhl
IGFsaWdubWVudCBpcyBnb2luZyB0byBiZSBkaWZmZXJlbnQgb24gYXJtMzIgbm93LiBQbGVhc2Ug
ZXhwbGFpbiBpbiAKdGhlIGNvbW1pdCBtZXNzYWdlIHdoeSB0aGlzIGlzIGZpbmUuCgo+ICsgICAg
ICAgX19zdGFydF9zY2hlZHVsZXJzX2FycmF5ID0gLjsKPiArICAgICAgICooLmRhdGEuc2NoZWR1
bGVycykKPiArICAgICAgIF9fZW5kX3NjaGVkdWxlcnNfYXJyYXkgPSAuOwo+ICsKCkNoZWVycywK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
