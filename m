Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E6BB09F7
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 10:11:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8KAJ-0007zI-Tc; Thu, 12 Sep 2019 08:09:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8KAH-0007z8-TT
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 08:09:17 +0000
X-Inumbo-ID: 9ca93134-d534-11e9-83e4-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ca93134-d534-11e9-83e4-12813bfff9fa;
 Thu, 12 Sep 2019 08:09:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 35337AE03;
 Thu, 12 Sep 2019 08:09:15 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190911200504.5693-1-andrew.cooper3@citrix.com>
 <20190911200504.5693-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c5137acd-81ba-18fb-2d8d-637da7b9a7ab@suse.com>
Date: Thu, 12 Sep 2019 10:09:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190911200504.5693-5-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/8] tools/libxc: Pre-cleanup for
 xc_cpuid_{set, apply_policy}()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMjAxOSAyMjowNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGlzIHBhdGNoIGlz
IGJyb2tlbiBvdXQganVzdCB0byBzaW1wbGlmeSB0aGUgZm9sbG93aW5nIHR3by4KPiAKPiBGb3Ig
eGNfY3B1aWRfc2V0KCksIGRvY3VtZW50IGhvdyB0aGUgJ2snIHdvcmtzIGJlY2F1c2UgaXQgaXMg
cXVpdGUgc3VidGxlLgo+IFJlcGxhY2UgYSBtZW1zZXQoKSB3aXRoIHdlaXJkIGNhbGN1bGF0aW9u
IGZvciBhIGxvb3Agb2YgNCBleHBsaWNpdCBOVUxMCj4gYXNzaWdtZW50cy4gIFRoaXMgbWlycm9y
cyB0aGUgZnJlZSgpJ3MgaW4gdGhlIGZhaWwgcGF0aC4KPiAKPiBGb3IgeGNfY3B1aWRfYXBwbHlf
cG9saWN5KCksIGNvbnN0LWlmeSB0aGUgZmVhdHVyZXNldCBwb2ludGVyLiAgSXQgaXNuJ3QKPiB3
cml0dGVuIHRvLCBhbmQgd2FzIG5ldmVyIGludGVuZGVkIHRvIGJlIG11dGFibGUuCj4gCj4gRHJv
cCB0aHJlZSBwaWVjZXMgb2YgdHJhaWxpbmcgd2hpdGVzcGFjZS4KPiAKPiBObyBmdW5jdGlvbmFs
IGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
