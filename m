Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6805FD14
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 20:42:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj6cY-0003xv-9a; Thu, 04 Jul 2019 18:38:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E3Ia=VB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hj6cW-0003xq-Qy
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 18:38:12 +0000
X-Inumbo-ID: dfc5faf5-9e8a-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dfc5faf5-9e8a-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 18:38:11 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: MbdKaRzWV26+HAPxf+8J0C7knx77i8U47WoQgfMO4yJAfbA8gRf9/HVHoXBsaGc5mqHYEP7BKo
 cJdv6qSZR2O3hK50DbnSPkN4Wbp4HmA1NVcUBUPYQfjA29Qt4ao7TjAvSLMEcYCaYava70onV5
 km5WW3ACQWvO1777NvGzXQA2cw1Qo+zNHydHBH5reFahDJqG1xRTOsLb1pIf6/9AJ2PqT5TWrT
 WjhNSLOWKZkkF+9ka/Hhuzr/aJkOsgzPT4efKaG+eN/kIDxqm07F6BLWyOHdWEwBBP2atVWykH
 AD0=
X-SBRS: 2.7
X-MesageID: 2593360
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2593360"
To: Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <f69ca82f-e2db-e85e-ff98-2060a8dc28a5@suse.com>
 <745c685a-a614-6067-946d-c89fe98cb589@suse.com>
 <3240eb2e-ff32-bfc6-fa49-0cc8bb84582d@citrix.com>
 <e95d1c2c-feea-b8cc-0fca-a005668f269f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <40ac52b4-7d97-2106-3065-22dd810be5c4@citrix.com>
Date: Thu, 4 Jul 2019 19:38:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <e95d1c2c-feea-b8cc-0fca-a005668f269f@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v9 11/23] x86emul: support of AVX512*
 population count insns
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
Cc: Wei Liu <wl@xen.org>, RogerPau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMDcvMjAxOSAxNTo1NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDQuMDcuMjAxOSAx
Njo0NywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDEvMDcvMjAxOSAxMjoyMiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiAtLS0gYS94ZW4vdG9vbHMvZ2VuLWNwdWlkLnB5Cj4+PiArKysgYi94
ZW4vdG9vbHMvZ2VuLWNwdWlkLnB5Cj4+PiBAQCAtMjY4LDcgKzI2OCw3IEBAIGRlZiBjcnVuY2hf
bnVtYmVycyhzdGF0ZSk6Cj4+PiAgICAgICAgICAgICMgQVZYNTEyIGV4dGVuc2lvbnMgYWN0aW5n
IG9uIHZlY3RvcnMgb2YgYnl0ZXMvd29yZHMgYXJlIG1hZGUKPj4+ICAgICAgICAgICAgIyBkZXBl
bmRlbnRzIG9mIEFWWDUxMkJXIChhcyB0byByZXF1aXJpbmcgd2lkZXIgdGhhbiAxNi1iaXQgbWFz
awo+Pj4gICAgICAgICAgICAjIHJlZ2lzdGVycyksIGRlc3BpdGUgdGhlIFNETSBub3QgZm9ybWFs
bHkgbWFraW5nIHRoaXMgY29ubmVjdGlvbi4KPj4+IC0gICAgICAgIEFWWDUxMkJXOiBbQVZYNTEy
X0JGMTYsIEFWWDUxMl9WQk1JLCBBVlg1MTJfVkJNSTJdLAo+Pj4gKyAgICAgICAgQVZYNTEyQlc6
IFtBVlg1MTJfQkYxNiwgQVZYNTEyX0JJVEFMRywgQVZYNTEyX1ZCTUksIEFWWDUxMl9WQk1JMl0s
Cj4+IEJJVEFMRyBzaG91bGQgYmUgYWZ0ZXIgVkJNSTIsIGJlY2F1c2UgZXZlcnl0aGluZyBpbiB0
aGlzIHRhYmxlIGlzCj4+IG9yZGVyZWQgYnkgYml0IG51bWJlci4KPiBBcyBzYWlkIGJlZm9yZSAt
IHRoZXJlJ3Mgbm8gb3JkZXJpbmcgYnkgYml0IG51bWJlciBwb3NzaWJsZSBoZXJlLgoKSXRzIHBl
cmZlY3RseSBlYXN5LsKgIEVhY2ggZmVhdHVyZSBoYXMgYSB1bmlxdWUgbnVtYmVyLgoKPiBUaGUg
aW5kaXZpZHVhbCBmZWF0dXJlcyBtYXkgbGl2ZSBvbiBkaWZmZXJlbnQgKHN1YilsZWF2ZXMuIEJ5
Cj4gd2hhdCB5b3Ugc2F5IEJGMTYgc2hvdWxkbid0IGJlIGZpcnN0LiBUaGUgbGlzdCBoZXJlIGNs
ZWFybHkgaXMKPiBzb3J0ZWQgYWxwaGFiZXRpY2FsbHksIGFuZCBpbW8gdGhhdCdzIHRoZSBvbmx5
IGZ1dHVyZSBwcm9vZiBzb3J0aW5nCj4gcG9zc2libGUgKGFuZCBhbHNvIGZvciBBVlg1MTJGLCB3
aGVyZSBJIGhhZCBwcmV2aW91c2x5IG9mZmVyZWQgdG8KPiBwdXQgdG9nZXRoZXIgYSBwYXRjaCB0
byBzd2l0Y2ggdG8gYWxwaGFiZXRpY2FsIG9yZGVyaW5nLCBpZiBvbmx5IHdlCj4gY291bGQgYWdy
ZWUgb24gdGhhdCkuCgpJbiB3aGljaCBjYXNlIEkgbWlzc2VkIGl0IGR1cmluZyByZXZpZXcuCgpU
aGlzIGZlYXR1cmUgbWF0cml4IGlzIGRlbGliZXJhdGVseSBzb3J0ZWQgYnkgZmVhdHVyZSBudW1i
ZXIgaW4gYW4KZWZmb3J0IHRvIHByZXNlcnZlIGNocm9ub2xvZ3ksIHdoaWNoIGlzIGEgbXVjaCBt
b3JlIHVzZWZ1bCB3YXkgb2YKcmVhc29uaW5nIGFib3V0IGZlYXR1cmUgZGVwZW5kZW5jaWVzLgoK
fkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
