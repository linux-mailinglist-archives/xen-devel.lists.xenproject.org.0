Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BB1117199
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 17:28:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieLqg-0003EI-AQ; Mon, 09 Dec 2019 16:25:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieLqe-0003ED-PO
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 16:25:24 +0000
X-Inumbo-ID: 7fb56a32-1aa0-11ea-a914-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7fb56a32-1aa0-11ea-a914-bc764e2007e4;
 Mon, 09 Dec 2019 16:25:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3BEEFB1A8;
 Mon,  9 Dec 2019 16:25:22 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191205223008.8623-1-andrew.cooper3@citrix.com>
 <20191205223008.8623-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2c3ea72b-b85a-a65e-9403-3abeae76a41a@suse.com>
Date: Mon, 9 Dec 2019 17:25:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191205223008.8623-5-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/6] xen/hypercall: Cope with -ERESTART on
 more hypercall paths
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMTIuMjAxOSAyMzozMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGVzZSBoeXBlcmNh
bGxzIGVhY2ggdXNlIGNvbnRpbnVlX2h5cGVyY2FsbF9vbl9jcHUoKSwgd2hvc2UgQVBJIGlzIGFi
b3V0IHRvCj4gc3dpdGNoIHRvIHVzZSAtRVJFU1RBUlQuICBVcGRhdGUgdGhlIHNvb24tdG8tYmUg
YWZmZWN0ZWQgcGF0aHMgdG8gY29wZSwKPiBmb2xkaW5nIGV4aXN0aW5nIGNvbnRpbmF0aW9uIGxv
Z2ljIHdoZXJlIGFwcGxpY2FibGUuCj4gCj4gSW4gYWRkaXRpb246Cj4gICogRm9yIHBsYXRmb3Jt
IG9wIGFuZCBzeXNjdGwsIGluc2VydCBhIGNwdV9yZWxheCgpIGludG8gd2hhdCBpcyBvdGhlcndp
c2UgYQo+ICAgIHRpZ2h0IHNwaW5sb2NrIGxvb3AsIGFuZCBtYWtlIHRoZSBjb250aW51YXRpb24g
bG9naWMgY29tbW9uIGF0IHRoZQo+ICAgIGVwaWxvZ3VlLgoKSXMgdGhpcyByZWFsbHkgbmVlZGVk
IHdpdGggYSBoeXBlcmNhbGxfcHJlZW1wdF9jaGVjaygpIGludm9jYXRpb24KYWxyZWFkeSBpbiB0
aGUgYm9kaWVzIG9mIHRoZXNlIGxvb3BzPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
