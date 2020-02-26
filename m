Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2227D16FA9B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 10:22:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6sqZ-0004zF-Kc; Wed, 26 Feb 2020 09:19:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=joxT=4O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6sqX-0004zA-Pa
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 09:19:13 +0000
X-Inumbo-ID: 0d33e47c-5879-11ea-aba8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d33e47c-5879-11ea-aba8-bc764e2007e4;
 Wed, 26 Feb 2020 09:19:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A385EAD5E;
 Wed, 26 Feb 2020 09:19:11 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1B925CC0CD9F3341B32D442251E7E1DC3E3DBF54@SHSMSX104.ccr.corp.intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b33cc365-6537-d816-8a89-eadd514a2427@suse.com>
Date: Wed, 26 Feb 2020 10:19:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1B925CC0CD9F3341B32D442251E7E1DC3E3DBF54@SHSMSX104.ccr.corp.intel.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86/vPMU: don't blindly assume
 IA32_PERF_CAPABILITIES MSR exists
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, "Hao,
 Xudong" <xudong.hao@intel.com>, "Chen, Farrah" <farrah.chen@intel.com>, "Gao,
 Chao" <chao.gao@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVzdCBsaWtlIFZNWCdlcyBsYnJfdHN4X2ZpeHVwX2NoZWNrKCkgdGhlIHJlc3BlY3RpdmUgQ1BV
SUQgYml0IHNob3VsZApiZSBjb25zdWx0ZWQgZmlyc3QuCgpSZXBvcnRlZC1ieTogRmFycmFoIENo
ZW4gPGZhcnJhaC5jaGVuQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2FyY2gveDg2L2NwdS92cG11X2ludGVsLmMKKysr
IGIveGVuL2FyY2gveDg2L2NwdS92cG11X2ludGVsLmMKQEAgLTkwMCw3ICs5MDAsNiBAQCBpbnQg
dm14X3ZwbXVfaW5pdGlhbGlzZShzdHJ1Y3QgdmNwdSAqdikKIAogaW50IF9faW5pdCBjb3JlMl92
cG11X2luaXQodm9pZCkKIHsKLSAgICB1NjQgY2FwczsKICAgICB1bnNpZ25lZCBpbnQgdmVyc2lv
biA9IDA7CiAgICAgdW5zaWduZWQgaW50IGk7CiAKQEAgLTkzMiw4ICs5MzEsMTQgQEAgaW50IF9f
aW5pdCBjb3JlMl92cG11X2luaXQodm9pZCkKIAogICAgIGFyY2hfcG1jX2NudCA9IGNvcmUyX2dl
dF9hcmNoX3BtY19jb3VudCgpOwogICAgIGZpeGVkX3BtY19jbnQgPSBjb3JlMl9nZXRfZml4ZWRf
cG1jX2NvdW50KCk7Ci0gICAgcmRtc3JsKE1TUl9JQTMyX1BFUkZfQ0FQQUJJTElUSUVTLCBjYXBz
KTsKLSAgICBmdWxsX3dpZHRoX3dyaXRlID0gKGNhcHMgPj4gMTMpICYgMTsKKworICAgIGlmICgg
Y3B1X2hhc19wZGNtICkKKyAgICB7CisgICAgICAgIHVpbnQ2NF90IGNhcHM7CisKKyAgICAgICAg
cmRtc3JsKE1TUl9JQTMyX1BFUkZfQ0FQQUJJTElUSUVTLCBjYXBzKTsKKyAgICAgICAgZnVsbF93
aWR0aF93cml0ZSA9IChjYXBzID4+IDEzKSAmIDE7CisgICAgfQogCiAgICAgZml4ZWRfY3RybF9t
YXNrID0gfigoMXVsbCA8PCAoZml4ZWRfcG1jX2NudCAqIEZJWEVEX0NUUl9DVFJMX0JJVFMpKSAt
IDEpOwogICAgIC8qIG1hc2sgLkFueVRocmVhZCBiaXRzIGZvciBhbGwgZml4ZWQgY291bnRlcnMg
Ki8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
