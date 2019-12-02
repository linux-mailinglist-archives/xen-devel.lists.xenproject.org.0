Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C504910EC32
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2019 16:21:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ibnTL-0004TI-Fw; Mon, 02 Dec 2019 15:18:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s7n+=ZY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ibnTK-0004TC-MM
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2019 15:18:46 +0000
X-Inumbo-ID: 081985b4-1517-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 081985b4-1517-11ea-a55d-bc764e2007e4;
 Mon, 02 Dec 2019 15:18:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DC985B35A;
 Mon,  2 Dec 2019 15:18:42 +0000 (UTC)
To: Yi Sun <yi.y.sun@linux.intel.com>, xen-devel@lists.xenproject.org
References: <1575271488-12126-1-git-send-email-yi.y.sun@linux.intel.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <806ca71c-192b-4bc3-8aaa-fec21b48c9e8@suse.com>
Date: Mon, 2 Dec 2019 16:18:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <1575271488-12126-1-git-send-email-yi.y.sun@linux.intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4] psr: fix bug which may cause crash
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
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTIuMTkgMDg6MjQsIFlpIFN1biB3cm90ZToKPiBEdXJpbmcgdGVzdCwgd2UgZm91bmQg
YSBjcmFzaCBvbiBYZW4gd2l0aCBiZWxvdyB0cmFjZS4KPiAoWEVOKSBYZW4gY2FsbCB0cmFjZToK
PiAoWEVOKSAgICBbPGZmZmY4MmQwODAyYTA2NWE+XSBSIHBzci5jI2wzX2NkcF93cml0ZV9tc3Ir
MHgxZS8weDIyCj4gKFhFTikgICAgWzxmZmZmODJkMDgwMmEwODU4Pl0gRiBwc3IuYyNkb193cml0
ZV9wc3JfbXNycysweDZkLzB4MTA5Cj4gKFhFTikgICAgWzxmZmZmODJkMDgwMjNlMDAwPl0gRiBz
bXBfY2FsbF9mdW5jdGlvbl9pbnRlcnJ1cHQrMHg1YS8weGFjCj4gKFhFTikgICAgWzxmZmZmODJk
MDgwMmEyYjg5Pl0gRiBjYWxsX2Z1bmN0aW9uX2ludGVycnVwdCsweDIwLzB4MzQKPiAoWEVOKSAg
ICBbPGZmZmY4MmQwODAyODJjNjQ+XSBGIGRvX0lSUSsweDE3NS8weDZhZQo+IChYRU4pICAgIFs8
ZmZmZjgyZDA4MDM4YjhiYT5dIEYgY29tbW9uX2ludGVycnVwdCsweDEwYS8weDEyMAo+IChYRU4p
ICAgIFs8ZmZmZjgyZDA4MDJlYzYxNj5dIEYgY3B1X2lkbGUuYyNhY3BpX2lkbGVfZG9fZW50cnkr
MHg5ZC8weGIxCj4gKFhFTikgICAgWzxmZmZmODJkMDgwMmVjYzAxPl0gRiBjcHVfaWRsZS5jI2Fj
cGlfcHJvY2Vzc29yX2lkbGUrMHg0MWQvMHg2MjYKPiAoWEVOKSAgICBbPGZmZmY4MmQwODAyNzM1
M2I+XSBGIGRvbWFpbi5jI2lkbGVfbG9vcCsweGE1LzB4YTcKPiAoWEVOKQo+IChYRU4pCj4gKFhF
TikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+IChYRU4pIFBhbmlj
IG9uIENQVSAyMDoKPiAoWEVOKSBHRU5FUkFMIFBST1RFQ1RJT04gRkFVTFQKPiAoWEVOKSBbZXJy
b3JfY29kZT0wMDAwXQo+IChYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioKPiAKPiBUaGUgYnVnIGhhcHBlbnMgd2hlbiBDRFAgYW5kIE1CQSBjby1leGlzdCBhbmQg
TUJBIENPU19NQVggaXMgYmlnZ2VyCj4gdGhhbiBDRFAgQ09TX01BWC4gRS5nLiBNQkEgaGFzIDgg
Q09TIHJlZ2lzdGVycyBidXQgQ0RQIG9ubHkgaGF2ZSA2Lgo+IFdoZW4gc2V0dGluZyBNQkEgdGhy
b3R0bGluZyB2YWx1ZSBmb3IgdGhlIDd0aCBndWVzdCwgdGhlIHZhbHVlIGFycmF5Cj4gd291bGQg
YmU6Cj4gICAgICArLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0t
LS0tLS0tLSsKPiAgICAgIHwgRGF0YSBkZWZhdWx0IHZhbCB8IENvZGUgZGVmYXVsdCB2YWwgfCBN
QkEgdGhyb3R0bGUgfAo+ICAgICAgKy0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0t
LS0rLS0tLS0tLS0tLS0tLS0rCj4gCj4gVGhlbiwgQ09TIGlkIDcgd2lsbCBiZSBzZWxlY3RlZCBm
b3Igd3JpdHRpbmcgdGhlIHZhbHVlcy4gV2Ugc2hvdWxkCj4gYXZvaWQgd3JpdHRpbmcgQ0RQIGRh
dGEvY29kZSB2YWx1bGVzIHRvIENPUyBpZCA3IE1TUiBiZWNhdXNlIGl0Cj4gZXhjZWVkcyB0aGUg
Q0RQIENPU19NQVguCj4gCj4gU2lnbmVkLW9mZi1ieTogWWkgU3VuIDx5aS55LnN1bkBsaW51eC5p
bnRlbC5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
