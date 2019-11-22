Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C48107B26
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2019 00:14:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYI4M-0002sD-Ar; Fri, 22 Nov 2019 23:10:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NTZz=ZO=posteo.de=hfp@srs-us1.protection.inumbo.net>)
 id 1iYI4K-0002s8-Ny
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 23:10:29 +0000
X-Inumbo-ID: 44ed4742-0d7d-11ea-a367-12813bfff9fa
Received: from mout01.posteo.de (unknown [185.67.36.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44ed4742-0d7d-11ea-a367-12813bfff9fa;
 Fri, 22 Nov 2019 23:10:27 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 2CB0816005E
 for <xen-devel@lists.xenproject.org>; Sat, 23 Nov 2019 00:10:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1574464226; bh=7B75oHUzWlpSnIpxc+bVCvz4hWo1K5L6VZkXzCxuWPA=;
 h=From:Subject:To:Cc:Date:From;
 b=cRKOEUTKRgAGLKaPY7FcTdes4nUM1lfVPgcbdkHQo6B7+H+nBdGD/+0+bgRPj+zcb
 xF9aYi1imG3yhn4L/ZY2KZDTeHF+XFZharW0T4N4IHWTkPzSEpp5fff+0IF26Wizk2
 F1myX2ltUMDltdDEOnDM4G6/1HQDe6Iu+z7QLvgj63tXU0g8vLOvZ8NVZwhaU54Iiq
 DscUVaB6msZWh1bDgD0HLs9Kr0f1hxPx2JRZ5hpMXFk3UJIWVQ93/oZ4t6uqLMWPH0
 6V3GPwOEJZOJKrTf5BH4FbigCZth9UIqTT7LcGZbh+wppnhBUKGb1nYn3i0aGfeXvN
 LRBvErjY8aMdQ==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 47KXG84zgQz6tm8;
 Sat, 23 Nov 2019 00:10:24 +0100 (CET)
From: Andreas Kinzler <hfp@posteo.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <fba2992c-e306-dfb2-8edb-20fe5d18ca98@suse.com>
 <ad0a9bc4-dbd6-d59c-d33b-8bed744376ae@citrix.com>
 <ccebdbf3-7cd9-b1e9-b3c5-976ee5b5380b@suse.com>
 <7d2259af-188b-031f-6853-44a0151b7ee3@citrix.com>
Message-ID: <e628dd1c-dd2b-76e0-6735-5785361756a1@posteo.de>
Date: Sat, 23 Nov 2019 00:10:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <7d2259af-188b-031f-6853-44a0151b7ee3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: avoid HPET use on certain Intel
 platforms
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMTEuMjAxOSAxMzo1OCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMi8xMS8yMDE5
IDEyOjU3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjIuMTEuMjAxOSAxMzo1MCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDIyLzExLzIwMTkgMTI6NDYsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IExpbnV4IGNvbW1pdCBmYzVkYjU4NTM5YjQ5MzUxZTc2ZjE5ODE3ZWQxMTAyYmY3Yzcx
MmQwIHNheXMKPj4+Pgo+Pj4+ICJTb21lIENvZmZlZSBMYWtlIHBsYXRmb3JtcyBoYXZlIGEgc2tl
d2VkIEhQRVQgdGltZXIgb25jZSB0aGUgU29DcyBlbnRlcmVkCj4+Pj4gICBQQzEwLCB3aGljaCBp
biBjb25zZXF1ZW5jZSBtYXJrcyBUU0MgYXMgdW5zdGFibGUgYmVjYXVzZSBIUEVUIGlzIHVzZWQg
YXMKPj4+PiAgIHdhdGNoZG9nIGNsb2Nrc291cmNlIGZvciBUU0MuIgo+Pj4+Cj4+Pj4gQWRqdXN0
IGEgZmV3IHR5cGVzIGluIHRvdWNoZWQgb3IgbmVhcmJ5IGNvZGUgYXQgdGhlIHNhbWUgdGltZS4K
Pj4+IFJlcG9ydGVkLWJ5ID8KPj4gVGhlIExpbnV4IGNvbW1pdCBoYXMgYSBTdWdnZXN0ZWQtYnks
IGJ1dCBubyBSZXBvcnRlZC1ieS4gRG8geW91Cj4+IHdhbnQgbWUgdG8gY29weSB0aGF0IG9uZT8g
T3IgZWxzZSBkbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbiBhcwo+PiB0byB3aG8gdGhlIHJlcG9y
dGVyIHdhcz8KPiBXZWxsIC0gdGhpcyBwYXRjaCB3YXMgaWRlbnRpZmllZCBieSBzb21lb25lIG9u
IHhlbi1kZXZlbCwgd2hpY2ggSQo+IHByZXN1bWUgd2FzIHlvdXIgYmFzaXMgZm9yIGxvb2tpbmcg
aW50byBpdC4KCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4t
ZGV2ZWwvMjAxOS0xMS9tc2cwMDY2Mi5odG1sCgpCVFc6IFhlb24gRS0yMTM2IEAgQzI0MiBoYXMg
ODA4NjozZWNhIGFzIElELiBPbmUgbmVlZHMgdG8gY2hlY2sgd2l0aCAKSW50ZWwgd2hpY2ggY29t
YmluYXRpb25zIGFyZSByZWFsbHkgYWZmZWN0ZWQuCgpSZWdhcmRzIEFuZHJlYXMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
