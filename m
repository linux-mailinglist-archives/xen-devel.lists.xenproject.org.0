Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0B5118C89
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 16:30:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iehPs-0000hV-RR; Tue, 10 Dec 2019 15:27:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iehPr-0000hQ-AQ
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 15:27:11 +0000
X-Inumbo-ID: 87d22632-1b61-11ea-898a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87d22632-1b61-11ea-898a-12813bfff9fa;
 Tue, 10 Dec 2019 15:27:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 541E3AF3E;
 Tue, 10 Dec 2019 15:27:09 +0000 (UTC)
To: Hongyan Xia <hongyxia@amazon.com>
References: <cover.1575891620.git.hongyxia@amazon.com>
 <46ca4f3baff325a2aa558783a8dc3de215286d2e.1575891620.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f05a8135-bf8a-fd51-d7da-9499c1912f68@suse.com>
Date: Tue, 10 Dec 2019 16:27:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <46ca4f3baff325a2aa558783a8dc3de215286d2e.1575891620.git.hongyxia@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] x86/mm: factor out the code for
 shattering an l2 PTE
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
Cc: xen-devel@lists.xenproject.org, jgrall@amazon.com,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMjAxOSAxMjo0OCwgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4gbWFwX3BhZ2VzX3RvX3hl
biBhbmQgbW9kaWZ5X3hlbl9tYXBwaW5ncyBhcmUgcGVyZm9ybWluZyBhbG1vc3QgZXhhY3RseQo+
IHRoZSBzYW1lIG9wZXJhdGlvbnMgd2hlbiBzaGF0dGVyaW5nIGFuIGwyIFBURSwgdGhlIG9ubHkg
ZGlmZmVyZW5jZQo+IGJlaW5nIHdoZXRoZXIgd2Ugd2FudCB0byBmbHVzaC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBIb25neWFuIFhpYSA8aG9uZ3l4aWFAYW1hem9uLmNvbT4KCk1vc3RseSB0aGUgc2Ft
ZSBjb21tZW50cyBhcyBmb3IgcGF0Y2ggMSAoSSB0aGluayBvbmUgaXMgaW5hcHBsaWNhYmxlCmhl
cmUpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
