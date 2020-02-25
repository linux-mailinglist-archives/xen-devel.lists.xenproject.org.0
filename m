Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D2416C1FE
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 14:19:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6a4t-00079C-DP; Tue, 25 Feb 2020 13:16:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=g8Eh=4N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6a4r-000797-H9
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 13:16:45 +0000
X-Inumbo-ID: 0f6eff0e-57d1-11ea-92fc-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f6eff0e-57d1-11ea-92fc-12813bfff9fa;
 Tue, 25 Feb 2020 13:16:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E2B1CAAC2;
 Tue, 25 Feb 2020 13:16:39 +0000 (UTC)
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <8ccfd49088b2c811415f0c09886133a936e460d2.1582310142.git.tamas.lengyel@intel.com>
 <20200224152051.GS4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <019af1f3-5fd8-5842-ae48-69c490f143da@suse.com>
Date: Tue, 25 Feb 2020 14:16:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200224152051.GS4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9 1/5] xen/x86: Make hap_get_allocation
 accessible
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDIuMjAyMCAxNjoyMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIEZl
YiAyMSwgMjAyMCBhdCAxMDo0OToxOUFNIC0wODAwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4+
IER1cmluZyBWTSBmb3JraW5nIHdlJ2xsIGNvcHkgdGhlIHBhcmVudCBkb21haW4ncyBwYXJhbWV0
ZXJzIHRvIHRoZSBjbGllbnQsCj4+IGluY2x1ZGluZyB0aGUgSEFQIHNoYWRvdyBtZW1vcnkgc2V0
dGluZyB0aGF0IGlzIHVzZWQgZm9yIHN0b3JpbmcgdGhlIGRvbWFpbidzCj4+IEVQVC4gV2UnbGwg
Y29weSB0aGlzIGluIHRoZSBoeXBlcnZpc29yIGluc3RlYWQgZG9pbmcgaXQgZHVyaW5nIHRvb2xz
dGFjayBsYXVuY2gKPj4gdG8gYWxsb3cgdGhlIGRvbWFpbiB0byBzdGFydCBleGVjdXRpbmcgYW5k
IHVuc2hhcmluZyBtZW1vcnkgYmVmb3JlIChvcgo+PiBldmVuIGNvbXBsZXRlbHkgd2l0aG91dCkg
dGhlIHRvb2xzdGFjay4KPj4KPj4gU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1h
cy5sZW5neWVsQGludGVsLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+CgpBbmQgd2l0aCBtYWludGFpbmVyc2hpcCBub3cgaGF2aW5n
IGNoYW5nZWQKCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cgo+IEkg
d291bGQgYWxzbyBiZSBmaW5lIHdpdGggdGhpcyBtZXJnZWQgaW50byB0aGUgcmVzcGVjdGl2ZSBw
YXRjaCB3aGVyZQo+IGhhcF9nZXRfYWxsb2NhdGlvbiBnZXRzIGNhbGxlZC4KCkluZGVlZCB0aGF0
J3MgdGhlIHJlYXNvbiB3aHkgdGhpcyBoYXNuJ3QgZ29uZSBpbiB5ZXQsIEkgdGhpbmsuClRoZXJl
J3Mgbm8gdXNlIGZyb20gcHV0dGluZyBpdCBpbiB3aXRob3V0IGFsc28gcHV0dGluZyBpbiB0aGUK
cGF0Y2ggd2hlcmUgdGhpcyBpcyBhY3R1YWxseSBuZWVkZWQuIEluIGZhY3QgaXQgaW50cm9kdWNl
cyBhCiJzdHJheSBsYWNrIG9mIHN0YXRpYyIgaW5zdGFuY2UgdW50aWwgdGhlbiwgd2hpY2ggdHlw
aWNhbGx5IHdlCnRyeSB0byBjbGVhbiB1cC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
