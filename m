Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE5B1611C5
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 13:14:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3fFs-0004kv-O0; Mon, 17 Feb 2020 12:12:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ywWV=4F=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j3fFr-0004kp-1W
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 12:12:03 +0000
X-Inumbo-ID: b30ebff5-517e-11ea-bfd9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b30ebff5-517e-11ea-bfd9-12813bfff9fa;
 Mon, 17 Feb 2020 12:12:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6E96FB1CA;
 Mon, 17 Feb 2020 12:12:00 +0000 (UTC)
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20200217072006.20211-1-jgross@suse.com>
 <20200217072006.20211-3-jgross@suse.com>
 <0e8018be-7551-9bdf-fc6a-fb388579ff18@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4f29d05c-db7d-c1da-2fd9-8eed7dcdc587@suse.com>
Date: Mon, 17 Feb 2020 13:11:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <0e8018be-7551-9bdf-fc6a-fb388579ff18@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen/rcu: don't use stop_machine_run()
 for rcu_barrier()
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDIuMjAgMTI6NDksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSBKdWVyZ2VuLAo+IAo+
IE9uIDE3LzAyLzIwMjAgMDc6MjAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+ICt2b2lkIHJjdV9i
YXJyaWVyKHZvaWQpCj4+IMKgIHsKPj4gLcKgwqDCoCBhdG9taWNfdCBjcHVfY291bnQgPSBBVE9N
SUNfSU5JVCgwKTsKPj4gLcKgwqDCoCByZXR1cm4gc3RvcF9tYWNoaW5lX3J1bihyY3VfYmFycmll
cl9hY3Rpb24sICZjcHVfY291bnQsIE5SX0NQVVMpOwo+PiArwqDCoMKgIGlmICggIWF0b21pY19j
bXB4Y2hnKCZjcHVfY291bnQsIDAsIG51bV9vbmxpbmVfY3B1cygpKSApCj4gCj4gV2hhdCBkb2Vz
IHByZXZlbnQgdGhlIGNwdV9vbmxpbmVfbWFwIHRvIGNoYW5nZSB1bmRlciB5b3VyIGZlZXQ/IAo+
IFNob3VsZG4ndCB5b3UgZ3JhYiB0aGUgbG9jayB2aWEgZ2V0X2NwdV9tYXBzKCk/CgpPaCwgaW5k
ZWVkLgoKVGhpcyBpbiB0dXJuIHdpbGwgcmVxdWlyZSBhIG1vZGlmaWNhdGlvbiBvZiB0aGUgbG9n
aWMgdG8gZGV0ZWN0IHBhcmFsbGVsCmNhbGxzIG9uIG11bHRpcGxlIGNwdXMuCgoKSnVlcmdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
