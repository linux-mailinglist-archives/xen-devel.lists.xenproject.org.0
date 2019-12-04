Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB781112FC5
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 17:15:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icXGZ-0005kM-TU; Wed, 04 Dec 2019 16:12:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R9pO=Z2=amazon.com=prvs=2347cf4ab=jgrall@srs-us1.protection.inumbo.net>)
 id 1icXGZ-0005kG-7t
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 16:12:39 +0000
X-Inumbo-ID: e45ba8d2-16b0-11ea-9c09-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e45ba8d2-16b0-11ea-9c09-bc764e2007e4;
 Wed, 04 Dec 2019 16:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575475959; x=1607011959;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=DpTc4y44BU6Ite3qN9qW+6mZAyhmMIsytDHsHoUgg7I=;
 b=lVO7u0BZMF44ifxv8yrumSC0DlrZFc2zn25JEy36ikChfAF0Yk/c4i/S
 wJLE8hy9/Mi5T0+Q2amY2SrDtghCDCVdKqcbOcPNbd7eI7w+DQ7YR40GZ
 MMjqQSs4MA8Sjz0C/tB0YWXTVgGGbIxZT2VK4Z6jJSyrzgX68Vitsjegj 0=;
IronPort-SDR: OJS8Q4OULEKs2AIIpGtR9hNN6CbQE521t7ZLmyXbM5zh+8F1qZtk38j3GBRj/mst6XruGuAme/
 0PyuBc6fgNdw==
X-IronPort-AV: E=Sophos;i="5.69,277,1571702400"; 
   d="scan'208";a="7067304"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 04 Dec 2019 16:12:38 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id A11E3282443; Wed,  4 Dec 2019 16:12:35 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 16:12:34 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 16:12:33 +0000
Received: from a483e7b01a66.ant.amazon.com (10.125.106.66) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 4 Dec 2019 16:12:31 +0000
To: Jan Beulich <jbeulich@suse.com>
References: <20191128093828.8462-1-pdurrant@amazon.com>
 <33cd176f-074f-9c3a-1ba6-7a1b40f604ed@suse.com>
 <b39e656f-47a2-0132-1dd4-e6a3a9c3607a@oracle.com>
 <6992520f-c191-8282-d0f2-74713cfe0e54@amazon.com>
 <14C0E8CA-60F6-4903-8AC5-A7285F283A4E@ORACLE.COM>
 <e17569a6-d47c-63e7-e11d-9920435b711a@amazon.com>
 <16886ce8-379b-2577-8fea-fac21f7abc5c@suse.com>
From: Julien Grall <jgrall@amazon.com>
Message-ID: <13d692d3-5187-486d-c5a8-b0fc80743684@amazon.com>
Date: Wed, 4 Dec 2019 16:12:30 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <16886ce8-379b-2577-8fea-fac21f7abc5c@suse.com>
Content-Language: en-GB
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3] xen/x86: vpmu: Unmap per-vCPU PMU page
 when the domain is destroyed
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <BORIS.OSTROVSKY@ORACLE.COM>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwNC8xMi8yMDE5IDE2OjA4LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAwNC4xMi4yMDE5
IDE3OjAyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDA0LzEyLzIwMTkgMTU6NTks
IEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4+Cj4+Pgo+Pj4+IE9uIERlYyA0LCAyMDE5LCBhdCAx
MDo1NSBBTSwgSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4gd3JvdGU6Cj4+Pj4KPj4+
PiBIaSBCb3JpcywKPj4+Pgo+Pj4+IE9uIDI4LzExLzIwMTkgMjE6NTAsIEJvcmlzIE9zdHJvdnNr
eSB3cm90ZToKPj4+Pj4gT24gMTEvMjgvMTkgNToyMyBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4+PiBPbiAyOC4xMS4yMDE5IDEwOjM4LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+Pj4+Pgo+Pj4+
Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvdnBtdS5jCj4+Pj4+Pj4gKysrIGIveGVuL2FyY2gv
eDg2L2NwdS92cG11LmMKPj4+Pj4+PiBAQCAtNTc2LDExICs1NzYsMzYgQEAgc3RhdGljIHZvaWQg
dnBtdV9hcmNoX2Rlc3Ryb3koc3RydWN0IHZjcHUgKnYpCj4+Pj4+Pj4gICAgICAgICAgICAgICB2
cG11LT5hcmNoX3ZwbXVfb3BzLT5hcmNoX3ZwbXVfZGVzdHJveSh2KTsKPj4+Pj4+PiAgICAgICAg
fQo+Pj4+Pj4+ICsKPj4+Pj4+PiArICAgIHZwbXVfcmVzZXQodnBtdSwgVlBNVV9DT05URVhUX0FM
TE9DQVRFRCk7Cj4+Pj4+Pj4gICAgfQo+Pj4+Pj4gQm9yaXMsIHRvIGJlIG9uIHRoZSBzYWZlIHNp
ZGUgLSBhcmUgeW91IGluIGFncmVlbWVudCB3aXRoIHRoaXMKPj4+Pj4+IGNoYW5nZSwgbm93IHRo
YXQgdGhlIHNldHRpbmcgb2YgdGhlIGZsYWcgaXMgYmVpbmcgbGVmdCB1bnRvdWNoZWQ/Cj4+Pj4+
IFllcywgdGhpcyBpcyBmaW5lLgo+Pj4+Cj4+Pj4gQ2FuIHdlIHRha2UgdGhpcyBhcyBhbiBBQ0s/
Cj4+Pgo+Pj4KPj4+IFllcywgb2YgY291cnNlLgo+Pgo+PiBUaGFuayB5b3UhCj4+Cj4+IEBBbmRy
ZXcsIEBKYW46IHRoaXMgaXMgeDg2IGNvZGUsIGJ1dCBJIGFtIGhhcHB5IHRvIGNvbW1pdCBpdCBp
ZiB5b3UgcHJlZmVyLgo+IAo+IEl0IGhhcyBiZWVuIGNvbW1pdHRlZCBhbHJlYWR5LgoKT2gsIEkg
ZGlkbid0IHNwb3QgaXQgaW4gZ2l0IGxvZy4gU29ycnkgZm9yIHRoZSBub2lzZS4KCkNoZWVycywK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
