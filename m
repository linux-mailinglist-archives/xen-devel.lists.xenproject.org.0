Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CE4F8AD7
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 09:42:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iURii-00082f-Mc; Tue, 12 Nov 2019 08:40:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ifzZ=ZE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iURig-00082Y-I3
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 08:40:14 +0000
X-Inumbo-ID: 0b3e94a4-0528-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b3e94a4-0528-11ea-b678-bc764e2007e4;
 Tue, 12 Nov 2019 08:40:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1E4ACAF99;
 Tue, 12 Nov 2019 08:40:13 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191111205514.2779-1-andrew.cooper3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <43729558-e825-c82a-0627-295e67ac3685@suse.com>
Date: Tue, 12 Nov 2019 09:40:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191111205514.2779-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] AMD/IOMMU: Fix passthrough following c/s
 d7cfeb7c13e
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
Cc: Jennifer Herbert <jennifer.herbert@citrix.com>,
 Jan Beulich <JBeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTEuMTkgMjE6NTUsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gIkFNRC9JT01NVTogZG9u
J3QgYmxpbmRseSBhbGxvY2F0ZSBpbnRlcnJ1cHQgcmVtYXBwaW5nIHRhYmxlcyIgaW50cm9kdWNl
cyBhCj4gY2FsbCBhdCBydW50aW1lIGZyb20gYW1kX2lvbW11X2FkZF9kZXZpY2UoKSB0byBhbWRf
aW9tbXVfc2V0X2ludHJlbWFwX3RhYmxlKCkKPiB3aGljaCBpcyBzdGlsbCBtYXJrZWQgYXMgX19p
bml0Lgo+IAo+IE9uIG9uZSBBTUQgUm9tZSBtYWNoaW5lIHdlIGhhdmUsIHRoaXMgcmVzdWx0cyBp
biBhIGNyYXNoIHRoZSBtb21lbnQgd2UgdHJ5IHRvCj4gdXNlIGFuIFNSLUlPViBWRiBpbiBhIFZN
Lgo+IAo+IFJlcG9ydGVkLWJ5OiBKZW5uaWZlciBIZXJiZXJ0IDxqZW5uaWZlci5oZXJiZXJ0QGNp
dHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
