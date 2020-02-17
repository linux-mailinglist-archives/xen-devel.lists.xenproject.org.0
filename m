Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 068BC16120E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 13:32:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3fXM-0006zc-Q2; Mon, 17 Feb 2020 12:30:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VaN/=4F=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j3fXM-0006zL-2i
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 12:30:08 +0000
X-Inumbo-ID: 3ad559fa-5181-11ea-ade5-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ad559fa-5181-11ea-ade5-bc764e2007e4;
 Mon, 17 Feb 2020 12:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581942607;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Ep82ly6kAvzjlkP8yRau+8MGDlO/90keqn07ySQ8u9Q=;
 b=CeU8wUGq/kmufmO282FB7WY0hk9BhBEFsIvnBCdmyCRuZyGYIxezgVSX
 kSChtP9yKe80xbnRskS31exhZ+Zt2FYIZ0XOMuIpIpFWoX5Iw7C3a1c5t
 fzYdGGn3/1zrQOO8QlAbfhz5tr/wMtIDUe4fRkstKF2OGyP+goGOoyJ3y c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zUPRYvI4VxZq450YoesygjFAhi0K0KO60U9A5mXPuKyi/zwwH6wdX8/PcAeiN7ACz+gFaPLo9d
 vuh2rU/481HqsYROSoMhU6938FxHovi27mqGZl0GU4Vz7Eo5N6ILUFyUAimy8EYEbX9WaW3dCv
 FeexNDBB3lDp6PaqbidLquRvwXWMLG0VNluyqmeLORkyjFrlWPdMmeAQC8p65F/aogD02t1TN8
 f5MQq1aUi6/ipE5f6sHdt89SWABo+dHG91wJod0jm8ptvyD569G6p2mEujoTUFlx+lHf9KGm4q
 2rw=
X-SBRS: 2.7
X-MesageID: 12567095
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,452,1574139600"; d="scan'208";a="12567095"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 <xen-devel@lists.xenproject.org>
References: <20200217072006.20211-1-jgross@suse.com>
 <20200217072006.20211-3-jgross@suse.com>
 <3f1b46dc-ba1d-301a-3a7b-f3480338f379@citrix.com>
 <a7a17e9d-dce5-0fff-9f75-9af69f173d5b@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <af2b3f49-77ef-1171-0901-5631b6404b5c@citrix.com>
Date: Mon, 17 Feb 2020 12:30:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a7a17e9d-dce5-0fff-9f75-9af69f173d5b@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcvMDIvMjAyMCAxMjoyOCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxNy4wMi4yMCAx
MzoyNiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IE9uIDE3LzAyLzIwMjAgMDc6MjAsIEp1ZXJn
ZW4gR3Jvc3Mgd3JvdGU6Cj4+PiBUb2RheSByY3VfYmFycmllcigpIGlzIGNhbGxpbmcgc3RvcF9t
YWNoaW5lX3J1bigpIHRvIHN5bmNocm9uaXplIGFsbAo+Pj4gcGh5c2ljYWwgY3B1cyBpbiBvcmRl
ciB0byBlbnN1cmUgYWxsIHBlbmRpbmcgcmN1IGNhbGxzIGhhdmUgZmluaXNoZWQKPj4+IHdoZW4g
cmV0dXJuaW5nLgo+Pj4KPj4+IEFzIHN0b3BfbWFjaGluZV9ydW4oKSBpcyB1c2luZyB0YXNrbGV0
cyB0aGlzIHJlcXVpcmVzIHNjaGVkdWxpbmcgb2YKPj4+IGlkbGUgdmNwdXMgb24gYWxsIGNwdXMg
aW1wb3NpbmcgdGhlIG5lZWQgdG8gY2FsbCByY3VfYmFycmllcigpIG9uIGlkbGUKPj4+IGNwdXMg
b25seSBpbiBjYXNlIG9mIGNvcmUgc2NoZWR1bGluZyBiZWluZyBhY3RpdmUsIGFzIG90aGVyd2lz
ZSBhCj4+PiBzY2hlZHVsaW5nIGRlYWRsb2NrIHdvdWxkIG9jY3VyLgo+Pj4KPj4+IFRoZXJlIGlz
IG5vIG5lZWQgYXQgYWxsIHRvIGRvIHRoZSBzeW5jaW5nIG9mIHRoZSBjcHVzIGluIHRhc2tsZXRz
LCBhcwo+Pj4gcmN1IGFjdGl2aXR5IGlzIHN0YXJ0ZWQgaW4gX19kb19zb2Z0aXJxKCkgY2FsbGVk
IHdoZW5ldmVyIHNvZnRpcnEKPj4+IGFjdGl2aXR5IGlzIGFsbG93ZWQuIFNvIHJjdV9iYXJyaWVy
KCkgY2FuIGVhc2lseSBiZSBtb2RpZmllZCB0byB1c2UKPj4+IHNvZnRpcnEgZm9yIHN5bmNocm9u
aXphdGlvbiBvZiB0aGUgY3B1cyBubyBsb25nZXIgcmVxdWlyaW5nIGFueQo+Pj4gc2NoZWR1bGlu
ZyBhY3Rpdml0eS4KPj4+Cj4+PiBBcyB0aGVyZSBhbHJlYWR5IGlzIGEgcmN1IHNvZnRpcnEgcmV1
c2UgdGhhdCBmb3IgdGhlIHN5bmNocm9uaXphdGlvbi4KPj4+Cj4+PiBGaW5hbGx5IHN3aXRjaCBy
Y3VfYmFycmllcigpIHRvIHJldHVybiB2b2lkIGFzIGl0IG5vdyBjYW4gbmV2ZXIgZmFpbC4KPj4+
Cj4+Cj4+IFdvdWxkIHRoaXMgaW1wbGVtZW50YXRpb24gZ3VhcmFudGVlIHByb2dyZXNzIGFzIHBy
ZXZpb3VzIGltcGxlbWVudGF0aW9uCj4+IGd1YXJhbnRlZWQ/Cj4gCj4gWWVzLgoKVGhhbmtzLCBJ
J2xsIHB1dCBpdCB0byB0ZXN0IHRvZGF5IHRvIHNlZSBpZiBpdCBzb2x2ZXMgb3VyIHVzZSBjYXNl
LgoKSWdvcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
