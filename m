Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADB01126BF
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 10:14:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icQfc-0000Xm-G2; Wed, 04 Dec 2019 09:10:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qu5=Z2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icQfb-0000Kj-7t
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 09:10:03 +0000
X-Inumbo-ID: da9ed548-1675-11ea-81fb-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da9ed548-1675-11ea-81fb-12813bfff9fa;
 Wed, 04 Dec 2019 09:10:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CB895AD18;
 Wed,  4 Dec 2019 09:10:01 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191203223046.15011-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fdb5e2ff-7b5c-0f4b-2e83-adc078c12c28@suse.com>
Date: Wed, 4 Dec 2019 10:10:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191203223046.15011-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/svm: Fix handling of EFLAGS.RF on task
 switch
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMTIuMjAxOSAyMzozMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBWVC14IHVwZGF0ZXMg
UkYgYmVmb3JlIHZtZXhpdCwgc28gZWZsYWdzIHdyaXR0ZW4gaW50byB0aGUgb3V0Z29pbmcgVFNT
IGhhcHBlbnMKPiB0byBiZSBjb3JyZWN0LiAgU1ZNIGRvZXMgbm90IHVwZGF0ZSBSRiBiZWZvcmUg
dm1leGl0LCBhbmQgaW5zdGVhZCBwcm92aWRlcyBpdAo+IHZpYSBhIGJpdCBpbiBleGl0aW5mbzIu
Cj4gCj4gSW4gcHJhY3RpY2UsIG5lZWRpbmcgUkYgc2V0IGluIHRoZSBvdXRnb2luZyBzdGF0ZSBv
Y2N1cnMgd2hlbiBhIHRhc2sgZ2F0ZSBpcwo+IHVzZWQgdG8gaGFuZGxlIGZhdWx0cy4KPiAKPiBF
eHRlbmQgaHZtX3Rhc2tfc3dpdGNoKCkgd2l0aCBhbiBleHRyYV9lZmxhZ3MgcGFyYW1ldGVyIHdo
aWNoIGdldHMgZmVkIGludG8KPiB0aGUgb3V0Z29pbmcgVFNTLCBhbmQgZmlsbCBpdCBpbiBzdWl0
YWJseSBmcm9tIHRoZSBTVk0gdm1leGl0IGluZm9ybWF0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
