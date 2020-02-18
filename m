Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A46162A24
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 17:13:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j45TF-000489-IE; Tue, 18 Feb 2020 16:11:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=u3z7=4G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j45TE-000484-9y
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 16:11:36 +0000
X-Inumbo-ID: 55cfa20e-5269-11ea-81ce-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55cfa20e-5269-11ea-81ce-12813bfff9fa;
 Tue, 18 Feb 2020 16:11:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A6691BD0E;
 Tue, 18 Feb 2020 16:11:34 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200217111740.7298-1-andrew.cooper3@citrix.com>
 <20200217111740.7298-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c9858aca-b6c8-7596-6bef-060b5257b782@suse.com>
Date: Tue, 18 Feb 2020 17:11:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200217111740.7298-3-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/3] xen: Move async_exception_*
 infrastructure into x86
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

T24gMTcuMDIuMjAyMCAxMjoxNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgYXN5bmNfZXhj
ZXB0aW9uX3tzdGF0ZSxtYXNrfSBpbmZyYXN0cnVjdHVyZSBpcyBpbXBsZW1lbnRlZCBpbiBjb21t
b24gY29kZSwKPiBidXQgaXMgbGltaXRlZCB0byB4ODYgYmVjYXVzZSBvZiB0aGUgVkNQVV9UUkFQ
X0xBU1QgaWZkZWYtYXJ5Lgo+IAo+IFRoZSBpbnRlcm5hbHMgYXJlIHZlcnkgeDg2IHNwZWNpZmlj
IChhbmQgZXZlbiB0aGVuLCBpbiBuZWVkIG9mIGNvcnJlY3Rpb24pLAo+IGFuZCB3b24ndCBiZSBv
ZiBpbnRlcmVzdCB0byBvdGhlciBhcmNoaXRlY3R1cmVzLgoKSnVzdCB0byBleHBsYWluIC0gYXQg
dGhlIHRpbWUgaXQgZ290IHB1dCB0aGVyZSB0aGUgYXNzdW1wdGlvbiB3YXMKdGhhdCBpYTY0IG1p
Z2h0IGxhdGVyIGhhdmUgd2FudGVkIHRvIGFsc28gdXNlIHRoaXMuCgo+ICBNb3ZlIGl0IGFsbCBp
bnRvIHg4Ngo+IHNwZWNpZmljIGNvZGUuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
