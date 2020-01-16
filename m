Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF6713D746
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 10:57:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is1rz-0000pC-3u; Thu, 16 Jan 2020 09:55:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1is1rx-0000p7-L3
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 09:55:17 +0000
X-Inumbo-ID: 4a196f2c-3846-11ea-86de-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a196f2c-3846-11ea-86de-12813bfff9fa;
 Thu, 16 Jan 2020 09:55:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8485FAC6E;
 Thu, 16 Jan 2020 09:55:12 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200115184418.21365-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c42a1292-d7e9-fe23-1a44-866c2c7c5c9e@suse.com>
Date: Thu, 16 Jan 2020 10:55:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200115184418.21365-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/vcpu: Improve sanity checks in
 vcpu_create()
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

T24gMTUuMDEuMjAyMCAxOTo0NCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgQlVHX09OKCkg
aXMgY29uZnVzaW5nIHRvIGZvbGxvdy4gIFRoZSAoIWlzX2lkbGVfZG9tYWluKGQpIHx8IHZjcHVf
aWQpIHBhcnQKPiBpcyBhIHZlc3RpZ2lhbCByZW1uYW50IG9mIGFyY2hpdGVjdHVyZXMgcG9pc2lv
bmluZyBpZGxlX3ZjcHVbMF0gd2l0aCBub24tTlVMTAo+IHBvaW50ZXJzLgo+IAo+IE5vdyB0aGF0
IGlkbGVfdmNwdVswXSBpcyBOVUxMIG9uIGFsbCBhcmNoaXRlY3R1cmVzLCBhbmQgZC0+bWF4X3Zj
cHVzIHNwZWNpZmllZAo+IGJlZm9yZSB2Y3B1X2NyZWF0ZSgpIGlzIGNhbGxlZCwgd2UgY2FuIHBy
b3Blcmx5IHJhbmdlIGNoZWNrIHRoZSByZXF1ZXN0ZWQKPiB2Y3B1X2lkLgoKSSBndWVzcyB0aGlz
IGlzIG1lYW50IHRvIGJlIHRydWUgb24gdG9wIG9mIHlvdXIgQXJtIHNpZGUgY2hhbmdlCndoaWNo
IGhhc24ndCBiZWVuIGNvbW1pdHRlZCB5ZXQ/IEFuZCBwZXJoYXBzIGJldHRlciAiLi4uIHN0YXJ0
cwpvdXQgYXMgTlVMTCBvbiBhbGwgLi4uIj8KCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
