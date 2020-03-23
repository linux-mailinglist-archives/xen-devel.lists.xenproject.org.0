Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3180918F0F3
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 09:36:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGIVo-0006Ws-T6; Mon, 23 Mar 2020 08:32:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1UMm=5I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGIVn-0006Wn-Fb
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 08:32:43 +0000
X-Inumbo-ID: dc2c9173-6ce0-11ea-827a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc2c9173-6ce0-11ea-827a-12813bfff9fa;
 Mon, 23 Mar 2020 08:32:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 74E4BAF01;
 Mon, 23 Mar 2020 08:32:41 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200320212453.21685-1-andrew.cooper3@citrix.com>
 <20200320212453.21685-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <beef054b-17de-ada1-badb-df4ff9c5b16e@suse.com>
Date: Mon, 23 Mar 2020 09:32:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200320212453.21685-3-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/4] x86/ucode: Fix error paths in
 apply_microcode()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDMuMjAyMCAyMjoyNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBAQCAtMjU5LDE1ICsy
NjAsMTQgQEAgc3RhdGljIGludCBhcHBseV9taWNyb2NvZGUoY29uc3Qgc3RydWN0IG1pY3JvY29k
ZV9wYXRjaCAqcGF0Y2gpCj4gICAgICAvKiBjaGVjayBjdXJyZW50IHBhdGNoIGlkIGFuZCBwYXRj
aCdzIGlkIGZvciBtYXRjaCAqLwo+ICAgICAgaWYgKCBod19lcnIgfHwgKHJldiAhPSBoZHItPnBh
dGNoX2lkKSApCj4gICAgICB7Cj4gLSAgICAgICAgcHJpbnRrKEtFUk5fRVJSICJtaWNyb2NvZGU6
IENQVSVkIHVwZGF0ZSBmcm9tIHJldmlzaW9uICIKPiAtICAgICAgICAgICAgICAgIiUjeCB0byAl
I3ggZmFpbGVkXG4iLCBjcHUsIHJldiwgaGRyLT5wYXRjaF9pZCk7Cj4gKyAgICAgICAgcHJpbnRr
KFhFTkxPR19FUlIKPiArICAgICAgICAgICAgICAgIm1pY3JvY29kZTogQ1BVJXUgdXBkYXRlIHJl
diAlI3ggdG8gJSN4IGZhaWxlZCwgcmVzdWx0ICUjeFxuIiwKPiArICAgICAgICAgICAgICAgY3B1
LCBvbGRfcmV2LCBoZHItPnBhdGNoX2lkLCByZXYpOwo+ICAgICAgICAgIHJldHVybiAtRUlPOwo+
ICAgICAgfQo+ICAKPiAtICAgIHByaW50ayhLRVJOX1dBUk5JTkcgIm1pY3JvY29kZTogQ1BVJWQg
dXBkYXRlZCBmcm9tIHJldmlzaW9uICUjeCB0byAlI3hcbiIsCj4gLSAgICAgICAgICAgY3B1LCBz
aWctPnJldiwgaGRyLT5wYXRjaF9pZCk7Cj4gLQo+IC0gICAgc2lnLT5yZXYgPSByZXY7Cj4gKyAg
ICBwcmludGsoWEVOTE9HX1dBUk5JTkcgIm1pY3JvY29kZTogQ1BVJXUgdXBkYXRlZCBmcm9tIHJl
dmlzaW9uICUjeCB0byAlI3hcbiIsCj4gKyAgICAgICAgICAgY3B1LCBvbGRfcmV2LCBoZHItPnBh
dGNoX2lkKTsKClByZWZlciB0aGUgbG9jYWwgdmFyaWFibGUgaGVyZSBvdmVyIGhkci0+cGF0Y2hf
aWQsIGp1c3QgbGlrZSB5b3UgZG8Kb24gdGhlIEludGVsIHNpZGU/CgpKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
