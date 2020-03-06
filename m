Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D3917BC3C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 12:59:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jABaJ-0001LW-RH; Fri, 06 Mar 2020 11:56:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jABaH-0001LP-KB
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 11:56:05 +0000
X-Inumbo-ID: 74d3f070-5fa1-11ea-90c4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74d3f070-5fa1-11ea-90c4-bc764e2007e4;
 Fri, 06 Mar 2020 11:56:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CFB7EAAC7;
 Fri,  6 Mar 2020 11:56:03 +0000 (UTC)
To: pdurrant@amzn.com
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-4-pdurrant@amzn.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7d66a1b0-ca7b-500b-73c4-140ab32f0c4e@suse.com>
Date: Fri, 6 Mar 2020 12:56:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200305124504.3564-4-pdurrant@amzn.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/6] x86 / pv: do not treat PGC_extra
 pages as RAM when constructing dom0
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDMuMjAyMCAxMzo0NSwgcGR1cnJhbnRAYW16bi5jb20gd3JvdGU6Cj4gLS0tIGEveGVu
L2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9wdi9kb20wX2J1
aWxkLmMKPiBAQCAtNzkyLDYgKzc5MiwxMCBAQCBpbnQgX19pbml0IGRvbTBfY29uc3RydWN0X3B2
KHN0cnVjdCBkb21haW4gKmQsCj4gICAgICB7Cj4gICAgICAgICAgbWZuID0gbWZuX3gocGFnZV90
b19tZm4ocGFnZSkpOwo+ICAgICAgICAgIEJVR19PTihTSEFSRURfTTJQKGdldF9ncGZuX2Zyb21f
bWZuKG1mbikpKTsKPiArCj4gKyAgICAgICAgaWYgKCBwYWdlLT5jb3VudF9pbmZvICYgUEdDX2V4
dHJhICkKPiArICAgICAgICAgICAgY29udGludWU7CgpUaGlzIHN1cmVseSBpcyBhIHBhdHRlcm4s
IGkuZS4gdGhlcmUgYXJlIG1vcmUgc2ltaWxhciBjaGFuZ2VzIHRvCm1ha2U6IHRib290X2dlbl9k
b21haW5faW50ZWdyaXR5KCkgZS5nLiBpZ25vcmVzIGQtPnhlbnBhZ2VfbGlzdCwKYW5kIGhlbmNl
IHdpdGggdGhlIGdvYWwgb2YgY29udmVydGluZyB0aGUgc2hhcmVkIGluZm8gcGFnZSB3b3VsZAph
bHNvIHdhbnQgYWRqdXN0bWVudC4gRm9yIGR1bXBfbnVtYSgpIGl0IG1heSBiZSBsZXNzIGltcG9y
dGFudCwKYnV0IGl0IHdvdWxkIHN0aWxsIGxvb2sgbW9yZSBjb3JyZWN0IGlmIGl0IHRvbyBnb3Qg
Y2hhbmdlZC4KYXVkaXRfcDJtKCkgbWlnaHQgYXBwYXJlbnRseSBjb21wbGFpbiBhYm91dCBzdWNo
IHBhZ2VzIChhbmQKaGVuY2UgbWlnaHQgYmUgYSBwcm9ibGVtIHdpdGggdGhlIG9uZSBQR0NfZXh0
cmEgcGFnZSBWTVggZG9tYWlucwpub3cgaGF2ZSkuIEFuZCB0aGlzIGlzIG9ubHkgZnJvbSBtZSBs
b29raW5nIGF0CnBhZ2VfbGlzdF9mb3JfZWFjaCguLi4sICZkLT5wYWdlX2xpc3QpIGNvbnN0cnVj
dHM7IHdobyBrbm93cwp3aGF0IGVsc2UgdGhlcmUgaXMuCgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
