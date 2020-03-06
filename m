Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A59E517BC49
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 13:05:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jABgy-0002PA-NK; Fri, 06 Mar 2020 12:03:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jABgx-0002P2-RC
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 12:02:59 +0000
X-Inumbo-ID: 6bf63304-5fa2-11ea-b74d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6bf63304-5fa2-11ea-b74d-bc764e2007e4;
 Fri, 06 Mar 2020 12:02:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 530DFAAC7;
 Fri,  6 Mar 2020 12:02:58 +0000 (UTC)
To: pdurrant@amzn.com
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-5-pdurrant@amzn.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9e089403-4a26-a69e-136c-8523c322dd7f@suse.com>
Date: Fri, 6 Mar 2020 13:03:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200305124504.3564-5-pdurrant@amzn.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 4/6] x86 / ioreq: use a MEMF_no_refcount
 allocation for server pages...
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDMuMjAyMCAxMzo0NSwgcGR1cnJhbnRAYW16bi5jb20gd3JvdGU6Cj4gRnJvbTogUGF1
bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgo+IAo+IC4uLiBub3cgdGhhdCBpdCBpcyBz
YWZlIHRvIGFzc2lnbiB0aGVtLgo+IAo+IFRoaXMgYXZvaWRzIHJlbHlpbmcgb24gbGlieGwgKG9y
IHdoYXRldmVyIHRvb2xzdGFjayBpcyBpbiB1c2UpIHNldHRpbmcKPiBtYXhfcGFnZXMgdXAgd2l0
aCBzdWZmaWNpZW50ICdzbG9wJyB0byBhbGxvdyBhbGwgbmVjZXNzYXJ5IGlvcmVxIHNlcnZlcgo+
IHBhZ2VzIHRvIGJlIGFsbG9jYXRlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQg
PHBkdXJyYW50QGFtYXpvbi5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKV2hpbGUgdGhpcyBvbmUgbG9va3MgdG8gYmUgaW5kZXBlbmRlbnQgb2YgZWFy
bGllciBwYXRjaGVzIGluIHRoaXMKc2VyaWVzIChhbmQgaGVuY2UgY291bGQgYmUgY29uc2lkZXJl
ZCBhIGNhbmRpZGF0ZSBmb3IgY29tbWl0dGluZwplYXJseSksIEkgZG9uJ3QgdGhpbmsgd2Ugd2Fu
dCB0aGlzIGNvbW1pdHRlZCBhaGVhZCBvZiAodG8gYmUKZXh0ZW5kZWQpIHBhdGNoIDMsIHRvIGF2
b2lkIGhhdmluZyBtb3JlIHBhZ2VzIHdoaWNoIG1heSBnZXQgbWlzLQpoYW5kbGVkIGluIGEgZmV3
IHBsYWNlcy4gSXQgd291bGQgYmUgbmljZSBpZiBpbiB2NCB5b3UgY291bGQgYWRkCmEgcmVzcGVj
dGl2ZSBwb3N0LWNvbW1pdC1tZXNzYWdlIHJlbWFyay4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
