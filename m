Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57308177A61
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 16:26:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j99OT-0004AI-TF; Tue, 03 Mar 2020 15:23:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TLdZ=4U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j99OS-0004AD-LK
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 15:23:36 +0000
X-Inumbo-ID: f2e99961-5d62-11ea-a195-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2e99961-5d62-11ea-a195-12813bfff9fa;
 Tue, 03 Mar 2020 15:23:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 62754B332;
 Tue,  3 Mar 2020 15:23:34 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <1e1ccd2a-526c-631b-7889-35f993b2005e@suse.com>
 <b9aa8053-b35b-1d0f-8303-abc39e1ae17d@suse.com>
 <aadbe8745d334ca8bece2d7e9ef1cd4e@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <130fb38f-205e-c75d-eee4-d1576ac79049@suse.com>
Date: Tue, 3 Mar 2020 16:23:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <aadbe8745d334ca8bece2d7e9ef1cd4e@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 2/4] x86/HVM: implement memory read
 caching for insn emulation
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
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDMuMjAyMCAxNjoxNiwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gRnJvbTogWGVuLWRl
dmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9m
IEphbiBCZXVsaWNoCj4+IFNlbnQ6IDAzIE1hcmNoIDIwMjAgMTA6MTcKPj4KPj4gLS0tIGEveGVu
L2FyY2gveDg2L2h2bS9lbXVsYXRlLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9lbXVsYXRl
LmMKPj4gQEAgLTI4LDYgKzI4LDE5IEBACj4+ICAjaW5jbHVkZSA8YXNtL2lvY2FwLmg+Cj4+ICAj
aW5jbHVkZSA8YXNtL3ZtX2V2ZW50Lmg+Cj4+Cj4+ICtzdHJ1Y3QgaHZtZW11bF9jYWNoZQo+PiAr
ewo+PiArICAgIC8qIFRoZSBjYWNoZSBpcyBkaXNhYmxlZCBhcyBsb25nIGFzIG51bV9lbnRzID4g
bWF4X2VudHMuICovCj4+ICsgICAgdW5zaWduZWQgaW50IG51bV9lbnRzOwo+PiArICAgIHVuc2ln
bmVkIGludCBtYXhfZW50czsKPj4gKyAgICBzdHJ1Y3Qgewo+PiArICAgICAgICBwYWRkcl90IGdw
YTpQQUREUl9CSVRTOwo+PiArICAgICAgICB1bnNpZ25lZCBpbnQgOkJJVFNfUEVSX0xPTkcgLSBQ
QUREUl9CSVRTIC0gODsKPiAKPiBJcyBjbGFuZyBvayB3aXRoIHVubmFtZWQgZmllbGRzPwoKQ2xh
bmcgNSBhdCBsZWFzdCBpcywgYW5kIGlpcmMgdGhpcyBpcyBhIHN0YW5kYXJkIEMgZmVhdHVyZS4K
Cj4+ICt2b2lkIGh2bWVtdWxfY2FjaGVfcmVzdG9yZShzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQg
aW50IHRva2VuKQo+PiArewo+PiArICAgIHN0cnVjdCBodm1lbXVsX2NhY2hlICpjYWNoZSA9IHYt
PmFyY2guaHZtLmh2bV9pby5jYWNoZTsKPj4gKwo+PiArICAgIEFTU0VSVChjYWNoZS0+bnVtX2Vu
dHMgPiBjYWNoZS0+bWF4X2VudHMpOwo+PiArICAgIGNhY2hlLT5udW1fZW50cyA9IHRva2VuOwo+
IAo+IEFTU0VSVCh0b2tlbiA8PSBjYWNoZS0+bWF4X2VudHMpIGhlcmU/CgpIbW0sIG5vdCBzdXJl
LiBEZWZpbml0ZWx5IG5vdCBleGFjdGx5IGFzIHlvdSBzYXksIGFzIGRpc2FibGluZwppbiBhbHJl
YWR5IGRpc2FibGVkIHN0YXRlIHdvdWxkIHJldHVybiBtYXhfZW50cyArIDEsIGFuZCBoZW5jZQp0
aGlzIHZhbHVlIGNvdWxkIGFsc28gYmUgZmVkIGJhY2sgaGVyZS4gQnV0IGV2ZW4gYmV5b25kIHRo
YXQgSQpkb24ndCBzZWUgYSBuZWVkIHRvIHJlc3RyaWN0IHRoZSB2YWx1ZSByYW5nZSBoZXJlIC0g
YW55dGhpbmcKbGFyZ2VyIHRoYW4gbWF4X2VudHMgd2lsbCBzaW1wbHkgcmVzdWx0IGluIHRoZSBj
YWNoZSBiZWluZwpkaXNhYmxlZC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
