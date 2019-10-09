Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D44D0D0A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 12:46:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI9S9-0003cL-4y; Wed, 09 Oct 2019 10:44:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iI9S8-0003cG-6x
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 10:44:20 +0000
X-Inumbo-ID: be825382-ea81-11e9-97e8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be825382-ea81-11e9-97e8-12813bfff9fa;
 Wed, 09 Oct 2019 10:44:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9430CAF25;
 Wed,  9 Oct 2019 10:44:17 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191009090539.2141-1-roger.pau@citrix.com>
 <41262e54-44ac-4a31-21d4-83ed8a63eb8f@suse.com>
 <20191009102028.GB1389@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4b1e141e-ab9a-9a59-8915-e9675a6f49b2@suse.com>
Date: Wed, 9 Oct 2019 12:44:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191009102028.GB1389@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/passthrough: fix migration of
 MSI when using posted interrupts
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Joe Jin <joe.jin@oracle.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTAuMjAxOSAxMjoyMCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gV2VkLCBP
Y3QgMDksIDIwMTkgYXQgMTI6MDg6NTBQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IENv
bnNpZGVyaW5nIHRoYXQgaHZtX2dpcnFfZGVzdF8yX3ZjcHVfaWQoKSBpc24ndCByZWFsbHkgaW5l
eHBlbnNpdmUsCj4+IHN1YnNlcXVlbnQgY2xlYW51cCBtYXkgdGhlbiBpbnZvbHZlIGF2b2lkaW5n
IHRvIGNhbGwgdGhpcyBmdW5jdGlvbgo+PiBpZiB3ZSdkIG92ZXJ3cml0ZSAuZGVzdF92Y3B1X2lk
IGFzIHBlciBhYm92ZSBhbnl3YXkuCj4gCj4gSG0sIEkgc2VlLiBJIHdvdWxkIGxlYXZlIHRoYXQg
Zm9yIGEgZnVydGhlciBvcHRpbWl6YXRpb24uCgpTdXJlLCBoZW5jZSBtZSBzYXlpbmcgInN1YnNl
cXVlbnQgY2xlYW51cCIuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
