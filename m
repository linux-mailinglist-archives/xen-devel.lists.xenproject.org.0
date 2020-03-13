Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F02184517
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 11:42:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jChjn-0002nr-Pr; Fri, 13 Mar 2020 10:40:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FVV1=46=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jChjm-0002nm-Nc
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 10:40:18 +0000
X-Inumbo-ID: 07967606-6517-11ea-b34e-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07967606-6517-11ea-b34e-bc764e2007e4;
 Fri, 13 Mar 2020 10:40:18 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id l18so11376346wru.11
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2020 03:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lfqr02TJ088xDIJimJE60ESCdHKydkYxREl34UcC7s8=;
 b=ICIUTWNILgua3ZDkT73ro3thsUWncYOCnfx6whtiFXAACn3awwH8gu4YAxOB0Oc9mG
 wAslZnKXxNNfF9CthZL256puyMUOoNojy027n0E+bkstHzAzdJPdb+MdcOaJX9Z9f/EK
 mD7AHm44vneRh+DQ+UM2QbXWKInkCzAZmewV/2T5JPdAVmOFSVgvujX4I9MpkEa1/hk4
 kw98P7apj6hDWvayQU2UxIg9RWPGP0JKBRgLjsUKEzjmbi0YqOvY9NWsZjQa5m8kMc9k
 kHZSGnDjz9OA/FamVh6T7Yq+1PtHB+Xe/6s5wuFHF0/vTkM7HqZX/vfoYi1vfXvJCYLo
 OptQ==
X-Gm-Message-State: ANhLgQ2hFwIBiwPpfekAjl/ck/PEHLV8RW46D9fEzK/r4pMRYp+wEACR
 J/VHr87sHR/87RYgX+p71wg=
X-Google-Smtp-Source: ADFU+vv/v0yCTsP9UnJJhbu3JAecherFBMWta3rP3mUCbm0xi24DLkmfLsHmNj146V6IzBEd5zvTrA==
X-Received: by 2002:adf:db84:: with SMTP id u4mr17421407wri.317.1584096016961; 
 Fri, 13 Mar 2020 03:40:16 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id m2sm16628145wml.24.2020.03.13.03.40.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 03:40:16 -0700 (PDT)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20200313080517.28728-1-jgross@suse.com>
 <20200313080517.28728-2-jgross@suse.com>
 <c41f57af-59ca-5418-5198-be9d82ff4cd6@xen.org>
 <11a48a47-4abe-8bd5-a3c6-1a4d28c21efe@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <41c5066a-17ef-31ca-afa6-f7ded8c31574@xen.org>
Date: Fri, 13 Mar 2020 10:40:15 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <11a48a47-4abe-8bd5-a3c6-1a4d28c21efe@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 1/2] xen/rwlocks: call preempt_disable()
 when taking a rwlock
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVlcmdlbiwKCk9uIDEzLzAzLzIwMjAgMTA6MTUsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4g
T24gMTMuMDMuMjAgMTE6MDIsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGkgSnVlcmdlbiwKPj4K
Pj4gT24gMTMvMDMvMjAyMCAwODowNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+IFNpbWlsYXIg
dG8gc3BpbmxvY2tzIHByZWVtcHRpb24gc2hvdWxkIGJlIGRpc2FibGVkIHdoaWxlIGhvbGRpbmcg
YQo+Pj4gcndsb2NrLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KPj4+IC0tLQo+Pj4gwqAgeGVuL2luY2x1ZGUveGVuL3J3bG9jay5oIHwgMTgg
KysrKysrKysrKysrKysrKystCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vcnds
b2NrLmggYi94ZW4vaW5jbHVkZS94ZW4vcndsb2NrLmgKPj4+IGluZGV4IDFjMjIxZGQwZDkuLjRl
ZTM0MWExODIgMTAwNjQ0Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vcndsb2NrLmgKPj4+ICsr
KyBiL3hlbi9pbmNsdWRlL3hlbi9yd2xvY2suaAo+Pj4gQEAgLTIsNiArMiw3IEBACj4+PiDCoCAj
ZGVmaW5lIF9fUldMT0NLX0hfXwo+Pj4gwqAgI2luY2x1ZGUgPHhlbi9wZXJjcHUuaD4KPj4+ICsj
aW5jbHVkZSA8eGVuL3ByZWVtcHQuaD4KPj4+IMKgICNpbmNsdWRlIDx4ZW4vc21wLmg+Cj4+PiDC
oCAjaW5jbHVkZSA8eGVuL3NwaW5sb2NrLmg+Cj4+PiBAQCAtNTcsMTAgKzU4LDEyIEBAIHN0YXRp
YyBpbmxpbmUgaW50IF9yZWFkX3RyeWxvY2socndsb2NrX3QgKmxvY2spCj4+PiDCoMKgwqDCoMKg
IGNudHMgPSBhdG9taWNfcmVhZCgmbG9jay0+Y250cyk7Cj4+PiDCoMKgwqDCoMKgIGlmICggbGlr
ZWx5KF9jYW5fcmVhZF9sb2NrKGNudHMpKSApCj4+PiDCoMKgwqDCoMKgIHsKPj4KPj4gSWYgeW91
IGdldCBwcmVlbXB0ZWQgaGVyZSwgdGhlbiBpdCBtZWFucyB0aGUgY2hlY2sgYmVsb3cgaXMgbGlr
ZWx5IAo+PiBnb2luZyB0byBmYWlsLiBTbyBJIHRoaW5rIGl0IHdvdWxkIGJlIGJlc3QgdG8gZGlz
YWJsZSBwcmVlbXB0aW9uIAo+PiBiZWZvcmUsIHRvIGdpdmUgbW9yZSBjaGFuY2UgdG8gc3VjY2Vl
ZC4KPiAKPiBBcyBwcmVlbXB0aW9uIHByb2JhYmlsaXR5IGF0IHRoaXMgdmVyeSBwb2ludCBzaG91
bGQgYmUgbXVjaCBsb3dlciB0aGFuCj4gdGhhdCBvZiBoZWxkIGxvY2tzIEkgdGhpbmsgdGhhdCBp
cyBvcHRpbWl6aW5nIHRoZSB3cm9uZyBwYXRoLgoKV2h5IHNvPyBMb2NrIGNvbnRlbnRpb24gc2hv
dWxkIGJlIGZhaXJseSBsaW1pdGVkIG9yIHlvdSBhbHJlYWR5IGhhdmUgYSAKcHJvYmxlbSBvbiB5
b3VyIHN5c3RlbS4gU28gcHJlZW1wdGlvbiBpcyBtb3JlIGxpa2VseS4KCj4gSSdtIG5vdAo+IG9w
cG9zZWQgZG9pbmcgdGhlIG1vZGlmaWNhdGlvbiB5b3UgYXJlIHJlcXVlc3RpbmcsIGJ1dCB3b3Vs
ZCBsaWtlIHRvCj4gaGVhciBhIHNlY29uZCBvcGluaW9uIG9uIHRoYXQgdG9waWMsIGVzcGVjaWFs
bHkgYXMgSSdkIG5lZWQgdG8gYWRkCj4gYW5vdGhlciBwcmVlbXB0X2VuYWJsZSgpIGNhbGwgd2hl
biBmb2xsb3dpbmcgeW91ciBhZHZpY2UuCgpJIGRvbid0IHJlYWxseSBzZWUgdGhlIHByb2JsZW0g
d2l0aCBhZGRpbmcgYSBuZXcgcHJlZW1wdGlvbl9lbmFibGUoKSAKY2FsbC4gQnV0IHRoZSBjb2Rl
IGNhbiBhbHNvIGJlIHJld29ya2VkIHRvIGhhdmUgb25seSBvbmUgY2FsbC4uLgoKQ2hlZXJzLAoK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
