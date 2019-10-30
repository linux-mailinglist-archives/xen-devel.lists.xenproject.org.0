Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AF3E9F2C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 16:35:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPpyh-0006Sg-Ba; Wed, 30 Oct 2019 15:33:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iUym=YX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iPpyg-0006SY-40
 for xen-devel@lists.xen.org; Wed, 30 Oct 2019 15:33:42 +0000
X-Inumbo-ID: a5c6b767-fb2a-11e9-9528-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5c6b767-fb2a-11e9-9528-12813bfff9fa;
 Wed, 30 Oct 2019 15:33:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C9B08B351;
 Wed, 30 Oct 2019 15:33:39 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20191030145447.11122-1-sergey.dyasli@citrix.com>
 <20191030145447.11122-2-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <487d8ef1-f7f2-a5e6-3ebd-df94ce370da4@suse.com>
Date: Wed, 30 Oct 2019 16:33:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191030145447.11122-2-sergey.dyasli@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 for 4.13 2/2] x86/e820: fix 640k - 1M
 region reservation logic
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMTAuMjAxOSAxNTo1NCwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiBDb252ZXJ0aW5nIGEg
Z3Vlc3QgZnJvbSBQViB0byBQVi1pbi1QVkggbWFrZXMgdGhlIGd1ZXN0IHRvIGhhdmUgMzg0awo+
IGxlc3MgbWVtb3J5LCB3aGljaCBtYXkgY29uZnVzZSBndWVzdCdzIGJhbGxvb24gZHJpdmVyLiBU
aGlzIGhhcHBlbnMKPiBiZWNhdXNlIFhlbiB1bmNvbmRpdGlvbmFsbHkgcmVzZXJ2ZXMgNjQwayAt
IDFNIHJlZ2lvbiBpbiBFODIwIGRlc3BpdGUKPiB0aGUgZmFjdCB0aGF0IGl0J3MgcmVhbGx5IGEg
dXNhYmxlIFJBTSBpbiBQVkggYm9vdCBtb2RlLgo+IAo+IEZpeCB0aGlzIGJ5IHNraXBwaW5nIHJl
Z2lvbiB0eXBlIGNoYW5nZSBpbiB2aXJ0dWFsaXNlZCBlbnZpcm9ubWVudHMsCj4gdHJ1c3Rpbmcg
d2hhdGV2ZXIgbWVtb3J5IG1hcCBvdXIgaHlwZXJ2aXNvciBoYXMgcHJvdmlkZWQuCj4gCj4gU2ln
bmVkLW9mZi1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgoKUmV2
aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
