Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCD0127C72
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 15:23:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiJ9t-0004mQ-6W; Fri, 20 Dec 2019 14:21:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiJ9s-0004mH-0H
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 14:21:36 +0000
X-Inumbo-ID: 02287f18-2334-11ea-b6f1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02287f18-2334-11ea-b6f1-bc764e2007e4;
 Fri, 20 Dec 2019 14:21:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8E4E3B24A;
 Fri, 20 Dec 2019 14:21:26 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8b611419-a0c7-743f-fec4-f02a04caf114@suse.com>
Date: Fri, 20 Dec 2019 15:21:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86/EPT: adjustments for redundant function
 arguments
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gZXB0X3AybV90eXBlX3RvX2ZsYWdzKCkgcGFzc2luZyBpbiB0eXBlIGFuZCBhY2Nlc3MgYXMg
c2VwYXJhdGUKcGFyYW1ldGVycyBjYW4gYmUgY29uc2lkZXJlZCBhbiBvcHRpbWl6YXRpb24sIGFz
IGFsbCBjYWxsZXJzIHNldCB0aGUKcmVzcGVjdGl2ZSBmaWVsZHMgaW4gdGhlIGVudHJ5IGJlaW5n
IHVwZGF0ZWQgYmVmb3JlIHRoZSBjYWxsLiBSZXRhaW4KdGhpcyBiZWhhdmlvciBidXQgYWRkIGFz
c2VydGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgotLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9w
Mm0tZXB0LmMKQEAgLTc1LDcgKzc1LDggQEAgc3RhdGljIHZvaWQgZXB0X3AybV90eXBlX3RvX2Zs
YWdzKHN0cnVjdAogICAgICAqIEQgYml0IGlzIHNldCBmb3IgYWxsIHdyaXRhYmxlIHR5cGVzIGlu
IEVQVCBsZWFmIGVudHJ5LCBleGNlcHQgZm9yCiAgICAgICogbG9nLWRpcnR5IHR5cGUgd2l0aCBQ
TUwuCiAgICAgICovCi0gICAgc3dpdGNoKHR5cGUpCisgICAgQVNTRVJUKHR5cGUgPT0gZW50cnkt
PnNhX3AybXQpOworICAgIHN3aXRjaCAoIHR5cGUgKQogICAgIHsKICAgICAgICAgY2FzZSBwMm1f
aW52YWxpZDoKICAgICAgICAgY2FzZSBwMm1fbW1pb19kbToKQEAgLTE0Myw5ICsxNDQsOSBAQCBz
dGF0aWMgdm9pZCBlcHRfcDJtX3R5cGVfdG9fZmxhZ3Moc3RydWN0CiAgICAgICAgICAgICBicmVh
azsKICAgICB9CiAKLQogICAgIC8qIFRoZW4gcmVzdHJpY3Qgd2l0aCBhY2Nlc3MgcGVybWlzc2lv
bnMgKi8KLSAgICBzd2l0Y2ggKGFjY2VzcykgCisgICAgQVNTRVJUKGFjY2VzcyA9PSBlbnRyeS0+
YWNjZXNzKTsKKyAgICBzd2l0Y2ggKCBhY2Nlc3MgKQogICAgIHsKICAgICAgICAgY2FzZSBwMm1f
YWNjZXNzX246CiAgICAgICAgIGNhc2UgcDJtX2FjY2Vzc19uMnJ3eDoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
