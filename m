Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A611900F
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 20:12:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOnVN-0006zl-EG; Thu, 09 May 2019 18:10:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kt3J=TJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hOnVL-0006zf-Hv
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 18:10:51 +0000
X-Inumbo-ID: c6a4b1a4-7285-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id c6a4b1a4-7285-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 18:10:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA1AB374;
 Thu,  9 May 2019 11:10:49 -0700 (PDT)
Received: from [10.37.9.129] (unknown [10.37.9.129])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E21B3F738;
 Thu,  9 May 2019 11:10:47 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-7-julien.grall@arm.com>
 <alpine.DEB.2.21.1905091057200.25766@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b1f7d744-060c-73bb-e08b-990566b06c57@arm.com>
Date: Thu, 9 May 2019 19:10:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1905091057200.25766@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 06/14] xen: Convert hotplug page function to
 use typesafe MFN
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
Cc: Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDUvOS8xOSA3OjAxIFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6
Cj4gT24gVHVlLCA3IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IENvbnZlcnQgb25s
aW5lX3BhZ2UsIG9mZmxpbmVfcGFnZSBhbmQgcXVlcnlfcGFnZV9vZmZsaW5lIHRvIHVzZQo+PiB0
eXBlc2FmZSBNRk4uCj4gCj4gSSB3b3VsZCBsaWtlIHRvIGhhdmUgYSBzdGF0ZW1lbnQgaW4gdGhl
IGNvbW1pdCBtZXNzYWdlIG1lbnRpb25pbmcgdGhlCj4gY2hhbmdlcyBiZWxvdyB0byBtY2lfYWN0
aW9uX2FkZF9wYWdlb2ZmbGluZSBhbmQgbWNfbWVtZXJyX2RoYW5kbGVyLgoKSSB3b3VsZCBwcmVm
ZXIgdGhlIGdlbmVyaWMgd29yZGluZzoKCiJBdCB0aGUgc2FtZSB0aW1lLCB0aGUgdHlwZXNhZmUg
aXMgcHJvcGFnYXRlZCBhcyBmYXIgYXMgcG9zc2libGUgd2l0aG91dAptYWpvciBtb2RpZmljYXRp
b25zLiIKCj4gCj4gIEZyb20gYW4gQVJNIHBvaW50IG9mIHZpZXcsIGl0IGlzIGZpbmUuCgpUaGFu
ayB5b3UhCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
