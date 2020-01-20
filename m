Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E48142DE8
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 15:43:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itYEe-0005NH-F4; Mon, 20 Jan 2020 14:41:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itYEd-0005NA-2r
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 14:40:59 +0000
X-Inumbo-ID: dcd5203c-3b92-11ea-b987-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dcd5203c-3b92-11ea-b987-12813bfff9fa;
 Mon, 20 Jan 2020 14:40:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1B1F2AFF9;
 Mon, 20 Jan 2020 14:40:54 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200120143142.19820-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6d7631ca-e772-5efc-3ffe-9a4a09100a97@suse.com>
Date: Mon, 20 Jan 2020 15:40:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200120143142.19820-1-julien@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/x86: domain: Free all the pages
 associated to struct domain
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDEuMjAyMCAxNTozMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEZyb206IEp1bGllbiBH
cmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Cj4gCj4gVGhlIHN0cnVjdHVyZSBkb21haW4gbWF5IGJl
IGJpZ2dlciB0aGFuIGEgcGFnZSBzaXplIHdoZW4gbG9jayBwcm9maWxpbmcKPiBpcyBlbmFibGVk
LiBIb3dldmVyLCB0aGUgZnVuY3Rpb24gZnJlZV9kb21oZWFwX3N0cnVjdCB3aWxsIG9ubHkgZnJl
ZSB0aGUKPiBmaXJzdCBwYWdlLgo+IAo+IFRoaXMgaXMgbm90IGEgc2VjdXJpdHkgaXNzdWUgYmVj
YXVzZSBzdHJ1Y3QgZG9tYWluIGNhbiBvbmx5IGJlIGJpZ2dlcgo+IHRoYW4gYSBwYWdlIHNpemUg
Zm9yIGxvY2sgcHJvZmlsaW5nLiBUaGUgZmVhdHVyZSBjYW4gb25seSBiZSBzZWxlY3RlZAo+IGlu
IERFQlVHIGFuZCBFWFBFUlQgbW9kZS4KPiAKPiBGaXhlczogODkxNmZjZjQ1NzcgKCJ4ODYvZG9t
YWluOiBjb21waWxlIHdpdGggbG9ja19wcm9maWxlPXkgZW5hYmxlZCIpCj4gUmVwb3J0ZWQtYnk6
IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Cj4gU2lnbmVkLW9mZi1ieTogSnVs
aWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
