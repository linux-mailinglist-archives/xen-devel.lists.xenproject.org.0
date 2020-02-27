Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E075172359
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 17:27:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7Lxd-0002xV-QL; Thu, 27 Feb 2020 16:24:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iNYA=4P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j7Lxb-0002xQ-MO
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 16:24:27 +0000
X-Inumbo-ID: 9eed768b-597d-11ea-96f3-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9eed768b-597d-11ea-96f3-12813bfff9fa;
 Thu, 27 Feb 2020 16:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582820666;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=p6MqM/KGF0z2pXBfmiPRTOxhymtIE5+u4mCe0tqs+sI=;
 b=YSX9wDEviWlW8bysJh76NQ9i7RF+fSJIL7S8RI5qWgyR8KM/E75wdq88
 tRw2E2A0FgzQM9xwNV0lzYBMvq+jxm5uQma4PU+7IPrn9XU1td8Bj1sCc
 H7CY/3x1u7hkU3ycR84e/IjQl7K4F5Ey7w6+4eUe9aMX03kUo/ifrvBKH g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ey3qlWgSSH4gfTTbC6gzgNQXY29pu19OEmPJ4f/UOzlyUK+Cy4MS+Ol7U78P+UNnucM7OJ7x8x
 Np6wE2mf4qkhELdwWnbJwdnUoBfZn/CRLPGaHpGSgYHbJVy2/1h7ehOHE+zknXJwe+xhuJnxzq
 TpRtXZLbMnWNZRGnT9ox4bvs9Q484ra/DiO58jj6rODFwKnkTy3DSA0mwH657ZpvXsgy23TcYo
 YqHmJ3QVBkXcVB3rTybzWFjp08v+FLzHXPN3pmTlS62RkSvm/+EP0d8+sgySYBVcRnziz4P7gE
 vRs=
X-SBRS: 2.7
X-MesageID: 13743215
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,492,1574139600"; d="scan'208";a="13743215"
To: Jan Beulich <jbeulich@suse.com>
References: <20200226202221.6555-1-andrew.cooper3@citrix.com>
 <20200226202221.6555-2-andrew.cooper3@citrix.com>
 <f25da974-6fe3-5b0e-4ca1-a937b61d9b22@suse.com>
 <69658bb9-e4e2-dda7-d341-caea6846e794@citrix.com>
 <e4bbd588-559d-1392-7253-8b512c7a2aef@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <e2b0458b-5271-b7cf-1d4f-08256aee6aed@citrix.com>
Date: Thu, 27 Feb 2020 16:24:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e4bbd588-559d-1392-7253-8b512c7a2aef@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 01/10] x86/sysctl: Don't return cpu policy
 data for compiled-out support (2)
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcvMDIvMjAyMCAwOTo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjcuMDIuMjAyMCAx
MDozMywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjcvMDIvMjAyMCAwNzozOCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAyNi4wMi4yMDIwIDIxOjIyLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IEp1c3QgYXMgd2l0aCBjL3MgOTZkYzc3YjRiMSBmb3IgWEVOX1NZU0NUTF9nZXRfY3B1
X3BvbGljeSwKPj4+PiBYRU5fU1lTQ1RMX2dldF9jcHVfZmVhdHVyZXNldCBuZWVkcyB0byBiZWNv
bWUgY29uZGl0aW9uYWwuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+Pj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KPj4+Cj4+PiBBbGJlaXQgSSdkIHNheSAid2FudCIsIG5vdCAibmVl
ZHMiIGluIHRoZSBkZXNjcmlwdGlvbi4KPj4gSXQgb2NjdXJzIHRvIG1lIHRoYXQgWEVOX1NZU0NU
TF9nZXRfY3B1X2ZlYXR1cmVzZXQgaXMgc3RyaWN0bHkgYSBzdWJzZXQKPj4gb2YgWEVOX1NZU0NU
TF9nZXRfY3B1X3BvbGljeSwgYW5kIHRoYXQgbm93IEkndmUgYWRqdXN0ZWQgdGhlIHRvb2xzdGFj
awo+PiBvbnRvIGdldF9jcHVfcG9saWN5LCB0aGUgc29sZSByZW1haW5pbmcgdXNlciBpcyB4ZW4t
Y3B1aWQuCj4+Cj4+IGdldF9jcHVfcG9saWN5IGFscmVhZHkgaGFzIHNlcGFyYXRlIGRlZmF1bHQg
YW5kIG1heCBpbmRpY2VzLCB3aGVyZWFzCj4+IGdldF9jcHVfZmVhdHVyZXNldCB3YXMgd3JpdHRl
biBiZWZvcmUgdGhlIG5lZWQgZm9yIHRoaXMgaGFzIGJlY29tZSBvYnZpb3VzLgo+Pgo+PiBUaGlz
IGxlYWRzIHRvIGFuIGFzeW1tZXRyeSBpbiB4ZW4tY3B1aWQsIHdoZXJlIHRoZSAtcCAocG9saWN5
KSBvcHRpb24KPj4gcHJvdmlkZXMgdHdvIG1vcmUgc2V0cyBvZiBpbmZvcm1hdGlvbiB0aGFuIHRo
ZSBmZWF0dXJlc2V0IGxpc3RpbmcuCj4+Cj4+IEluc3RlYWQsIEkgdGhpbmsgSSdkIGxpa2UgdG8g
ZHJvcCBYRU5fU1lTQ1RMX2dldF9jcHVfZmVhdHVyZXNldCBhbmQKPj4gdXBkYXRlIHRoZSBzb2xl
IHVzZXIgdG8gdGhlIG1vcmUgY29tcGxldGUgaW50ZXJmYWNlLgo+IFNvdW5kcyBsaWtlIGEgZ29v
ZCBtb3ZlIHRvIG1lLgoKQWN0dWFsbHksIGFmdGVyIGhhdmluZyBzcGVudCBhbG1vc3QgYSBkYXkg
dHJ5aW5nIHRvIGRpc2VudGFuZ2xlIHRoZQpyZW1haW5zIG9mIHRoaXMsIEknbSBnb2luZyB0byBs
ZWF2ZSBpdCBmb3Igbm93LgoKSXQgdHVybnMgb3V0IGl0IGlzIHN0aWxsIHVzZWQgYnkgdGhlIGxl
Z2FjeSBDUFVJRCBsb2dpYywgYW5kIEkgY291bGQgZG8Kd2l0aCBnZXR0aW5nIGEgZmV3IG90aGVy
IHBpZWNlcyBvZiBpbmZyYXN0cnVjdHVyZSBiZWZvcmUgaXQgaXMgZWFzeSB0bwp0YWtlIG91dC4K
Cn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
