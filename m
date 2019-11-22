Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D18D107388
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 14:43:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY99c-0006wZ-RH; Fri, 22 Nov 2019 13:39:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=28IZ=ZO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iY99b-0006wU-F7
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 13:39:19 +0000
X-Inumbo-ID: 7b225bb8-0d2d-11ea-a352-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b225bb8-0d2d-11ea-a352-12813bfff9fa;
 Fri, 22 Nov 2019 13:39:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8FFAFB132;
 Fri, 22 Nov 2019 13:39:17 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191121221551.1175-1-andrew.cooper3@citrix.com>
 <20191121221551.1175-2-andrew.cooper3@citrix.com>
 <20191122123716.GX72134@Air-de-Roger>
 <581b0f48-cd25-7a80-1b13-2bbe51fc2904@suse.com>
 <629651d1-0dea-4f03-edbe-397d2f4f54f2@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3ab517bf-8023-3894-c6a9-ddd49d2c5ef5@suse.com>
Date: Fri, 22 Nov 2019 14:39:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <629651d1-0dea-4f03-edbe-397d2f4f54f2@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] x86/vtx: Fix fault semantics for early
 task switch failures
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMTEuMjAxOSAxNDoxMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMi8xMS8yMDE5
IDEzOjA4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjIuMTEuMjAxOSAxMzozNywgUm9nZXIg
UGF1IE1vbm7DqSAgd3JvdGU6Cj4+PiBPbiBUaHUsIE5vdiAyMSwgMjAxOSBhdCAxMDoxNTo1MFBN
ICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+IFRoZSBWVC14IHRhc2sgc3dpdGNoIGhh
bmRsZXIgYWRkcyBpbnN0X2xlbiB0byByaXAgYmVmb3JlIGNhbGxpbmcKPj4+PiBodm1fdGFza19z
d2l0Y2goKS4gIFRoaXMgY2F1c2VzIGVhcmx5IGZhdWx0cyB0byBiZSBkZWxpdmVyZWQgdG8gdGhl
IGd1ZXN0IHdpdGgKPj4+PiB0cmFwIHNlbWFudGljcywgYW5kIGJyZWFrIHJlc3RhcnRpYmlsaXR5
Lgo+Pj4+Cj4+Pj4gSW5zdGVhZCwgcGFzcyB0aGUgaW5zdHJ1Y3Rpb24gbGVuZ3RoIGludG8gaHZt
X3Rhc2tfc3dpdGNoKCkgYW5kIHdyaXRlIGl0IGludG8KPj4+PiB0aGUgb3V0Z29pbmcgdHNzIG9u
bHksIGxlYXZpbmcgcmlwIGluIGl0cyBvcmlnaW5hbCBsb2NhdGlvbi4KPj4+Pgo+Pj4+IEZvciBu
b3csIHBhc3MgMCBvbiB0aGUgU1ZNIHNpZGUuICBUaGlzIGhpZ2hsaWdodHMgYSBzZXBhcmF0ZSBw
cmVleGlzdGluZyBidWcKPj4+PiB3aGljaCB3aWxsIGJlIGFkZHJlc3NlZCBpbiB0aGUgZm9sbG93
aW5nIHBhdGNoLgo+Pj4+Cj4+Pj4gV2hpbGUgYWRqdXN0aW5nIGNhbGwgc2l0ZXMsIGRyb3AgdGhl
IHVubmVjZXNzYXJ5IHVpbnQxNl90IGNhc3QuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+Pj4gQ29kZSBMR1RNOgo+Pj4K
Pj4+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
Pj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBJdCBvY2N1
cnMgdG8gbWUgdGhhdCB0aGlzIGFsc28gZml4ZXMgYSB2bWVudHJ5IGZhaWx1cmUgaW4gdGhlIGNv
cm5lcgo+IGNhc2UgdGhhdCBhbiBpbnN0cnVjdGlvbiwgd2hpY2ggY3Jvc3NlcyB0aGUgNEc9PjAg
Ym91bmRhcnkgdGFrZXMgYQo+IGZhdWx0LsKgICVyaXAgd2lsbCBiZSBhZGp1c3RlZCB3aXRob3V0
IGJlaW5nIHRydW5jYXRlZC4KCkkgd2FzIGFib3V0IHRvIHNheSBzbyBpbiBteSBlYXJsaWVyIHJl
cGx5LCB1bnRpbCBJIHBhaWQgYXR0ZW50aW9uCnRvIHRoaXMKCkBAIC0yOTg3LDcgKzI5ODcsNyBA
QCB2b2lkIGh2bV90YXNrX3N3aXRjaCgKICAgICBpZiAoIHRhc2tzd2l0Y2hfcmVhc29uID09IFRT
V19pcmV0ICkKICAgICAgICAgZWZsYWdzICY9IH5YODZfRUZMQUdTX05UOwogCi0gICAgdHNzLmVp
cCAgICA9IHJlZ3MtPmVpcDsKKyAgICB0c3MuZWlwICAgID0gcmVncy0+ZWlwICsgaW5zbl9sZW47
Cgp0b2dldGhlciB3aXRoIHRoZSBzdWJzZXF1ZW50CgogICAgcmVncy0+cmlwICAgID0gdHNzLmVp
cDsKCmFscmVhZHkgaGF2aW5nIHRha2VuIGNhcmUgb2YgdGhpcyBhc3BlY3QgYmVmb3JlLCBhZmFp
Y3QuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
