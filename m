Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDABCB3FD
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 06:49:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGFVA-000471-Nq; Fri, 04 Oct 2019 04:47:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lyic=X5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iGFV9-00046t-H2
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 04:47:35 +0000
X-Inumbo-ID: 1442bfe2-e662-11e9-973e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1442bfe2-e662-11e9-973e-12813bfff9fa;
 Fri, 04 Oct 2019 04:47:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AD934B0F2;
 Fri,  4 Oct 2019 04:47:32 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191003104736.32259-1-andrew.cooper3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d55c8ab3-79fd-f9b1-c680-e8b75034658a@suse.com>
Date: Fri, 4 Oct 2019 06:47:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003104736.32259-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/vvmx: Fix the use of RDTSCP when it is
 intercepted at L0
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Chris Brannon <cmb@prgmr.com>,
 Jan Beulich <jbeulich@suse.com>, Sarah Newman <srn@prgmr.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMTAuMTkgMTI6NDcsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gTGludXggaGFzIHN0YXJ0
ZWQgdXNpbmcgUkRUU0NQIGFzIG9mIHY1LjEuICBUaGlzIGhhcyBoaWdobGlnaHRlZCBhIGJ1ZyBp
biBYZW4sCj4gd2hlcmUgdmlydHVhbCB2bWV4aXQgc2ltcGx5IGdpdmVzIHVwLgo+IAo+ICAgIChY
RU4pIGQxdjEgVW5oYW5kbGVkIG5lc3RlZCB2bWV4aXQ6IHJlYXNvbiA1MQo+ICAgIChYRU4pIGRv
bWFpbl9jcmFzaCBjYWxsZWQgZnJvbSB2dm14LmM6MjY3MQo+ICAgIChYRU4pIERvbWFpbiAxICh2
Y3B1IzEpIGNyYXNoZWQgb24gY3B1IzI6Cj4gCj4gSGFuZGxlIFJEVFNDUCBpbiB0aGUgdmlydHVh
bCB2bWV4aXQgaGFuZGVyIGluIHRoZSBzYW1lIHdhcyBhcyBSRFRTQwo+IGludGVyY2VwdHMuCj4g
Cj4gUmVwb3J0ZWQtYnk6IFNhcmFoIE5ld21hbiA8c3JuQHByZ21yLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IFRlc3RlZC1i
eTogQ2hyaXMgQnJhbm5vbiA8Y21iQHByZ21yLmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
