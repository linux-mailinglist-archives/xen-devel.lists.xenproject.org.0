Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C752E62AA5
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 22:57:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkaeb-0006wG-0m; Mon, 08 Jul 2019 20:54:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=arZn=VF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hkaea-0006w9-0K
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 20:54:28 +0000
X-Inumbo-ID: 90ec7d4c-a1c2-11e9-81c9-0b4a0e497cc8
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 90ec7d4c-a1c2-11e9-81c9-0b4a0e497cc8;
 Mon, 08 Jul 2019 20:54:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB6542B;
 Mon,  8 Jul 2019 13:54:23 -0700 (PDT)
Received: from [10.119.48.199] (unknown [10.119.48.199])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0ACD03F246;
 Mon,  8 Jul 2019 13:54:23 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <1561109798-8744-5-git-send-email-andrew.cooper3@citrix.com>
 <20190704191449.22486-1-andrew.cooper3@citrix.com>
 <96aff7db-67f7-546a-da63-a915cdadd7b9@arm.com>
 <fba23c81-2ab9-28b8-86f2-89b3220345a9@citrix.com>
 <14762cea-1b87-4dea-69cc-6e4cf001c73b@arm.com>
 <2bfc235e-6b66-4b97-baef-618d5e80b360@citrix.com>
 <1ed8fc50-1c8e-b8c1-604a-bdb58d69af5b@arm.com>
 <1311bbbd-6b01-fc08-0ac7-74befee9d374@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <24953088-900b-cb96-2913-27a7587bf2b7@arm.com>
Date: Mon, 8 Jul 2019 21:54:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1311bbbd-6b01-fc08-0ac7-74befee9d374@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 4/5] xen/gnttab: Refactor
 gnttab_clear_flag() to be gnttab_clear_flags()
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gNy84LzE5IDk6MzggUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24g
MDgvMDcvMjAxOSAyMToyOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+Pgo+Pj4+PiBodHRwczov
L2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvMTU2MTEwOTc5OC04NzQ0LTUtZ2l0LXNlbmQtZW1h
aWwtYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbS9ULyN0Cj4+Pj4+Cj4+Pj4+Cj4+Pj4KPj4+PiBU
byBiZSBob25lc3QsIEkgdGhpbmsgaXQgaXMgd3JvbmcgdG8gdHJ5IHRvIG1pY3JvLW9wdGltaXpl
IGEgY29tbW9uCj4+Pj4gcHJvdG90eXBlIGZvciB0aGUgYmVuZWZpdCBvZiBvbmUgYXJjaGl0ZWN0
dXJlIGFuZCBvbmUgY29tcGlsZXIgdmVyc2lvbgo+Pj4+IChvciBldmVuIG5vbmUgcGVyIHRoZSBl
LW1haWwpLgo+Pj4KPj4+IFRoZSBwcm90b3R5cGUgd2Fzbid0IGNvbW1vbi7CoCBPYnNlcnZlIHRo
YXQgYmVmb3JlIHRoaXMgcGF0Y2gsIEFSTSB1c2VkCj4+PiB1bnNpZ25lZCBsb25nIHdoaWxlIHg4
NiB1c2VkIHVpbnQxNl90LsKgIEl0IHNob3VsZCBiZWNvbWUgY29tbW9uLAo+Pj4gaG93ZXZlci4K
Pj4KPj4gSSBhbSBub3Qgc3VyZSB0byBmb2xsb3cgdGhpcy4gQUZBSUNULCB3ZSB1c2UgdWludDE2
X3QgcHJvcGVybHkgb24gQXJtLgo+IAo+IExvb2sgYXQgdGhlIG1vZGlmaWNhdGlvbnMgdG8gZ250
dGFiX2NsZWFyX2ZsYWdzKCksIGFuZCBpbiBwYXJ0aWN1bGFyLAo+IHRoZSByZW1vdmFscy7CoCBC
ZWZvcmUgdGhpcyBwYXRjaCwgdGhlIEFQSSByZWFsbHkgaXMgZGlmZmVyZW50IGJldHdlZW4KPiBB
Uk0gYW5kIHg4Ni7CoCAoQWx0aG91Z2ggaXQgZGlmZmVyZWQgYmV0d2VlbiB1bnNpZ25lZCBsb25n
IGFuZCB1bnNpZ25lZAo+IGludC7CoCBUaGUgdWludDE2X3Qgd2FzIGEgbWlzdGFrZSBvbiBteSBi
ZWhhbGYuKQoKT2gsIHllcy4gSSBhbSBub3Qgc3VyZSB3aHkgd2UgdXNlIHVuc2lnbmVkIGxvbmcg
Zm9yIGRlc2NyaWJpbmcgdGhlIApzaGlmdC4gQW55d2F5Li4uCgo+IAo+Pgo+Pj4KPj4+IEluIHBy
YWN0aWNlLCB3ZSdyZSB0YWxraW5nIGFib3V0IGJpdHMgMyBhbmQgNCwgYW5kIHRoaXMgaXNuJ3Qg
bGlhYmxlIHRvCj4+PiBjaGFuZ2UgaW4gYSBodXJyeS4KPj4+Cj4+Pj4gT25lIGNvdWxkIGFsc28g
YXJndWUgdGhhdCB0aGlzIG1heSBiZSBub3QgYmVuZWZpY2lhbCBmb3IgdGhlIG5vbi14ODYKPj4+
PiBhcmNoaXRlY3R1cmUgZGVwZW5kaW5nIG9uIGhvdyB0aGUgY29tcGlsZXIgZGVjaWRlIHRvIGRv
IHRoZSBjYXN0IGZyb20KPj4+PiAzMi1iaXQgdG8gMTYtYml0Li4uCj4+Pgo+Pj4gQWxsIGFyY2hp
dGVjdHVyZSBuZWNlc3NhcmlseSBzdWZmZXIgdGhlIGRvd25jYXN0IHNvbWV3aGVyZSwgZXZlbiB4
ODYuCj4+PiBBUk0ncyBpcyBpbiB0aGUgcHJvdG90eXBlIGZvciBndWVzdF9jbGVhcl9tYXNrMTYo
KSwgYnV0IGluIHRlcm1zIG9mIHRoZQo+Pj4gY29tbW9uIGxvZ2ljIGZvciBjYWxjdWxhdGluZyBj
b25kaXRpb25hbGx5IHdoaWNoIGJpdHMgdG8gY2xlYXIsIGtlZXBpbmcKPj4+IGV2ZXJ5dGhpbmcg
YXMgdW5zaWduZWQgaW50IGZvciBhcyBsb25nIGFzIHBvc3NpYmxlIG9mZmVycyB0aGUgbW9zdAo+
Pj4gZmxleGliaWxpdHkgdG8gdGhlIGNvbXBpbGVyLCBhcyBpdCBjYW4gc2VlIGFsbCB0aGUgY29u
c3RhbnRzIGludm9sdmVkLgo+Pgo+PiBUaGlzIGlzIHRoZSBhcmd1bWVudCBJIHdhcyBsb29raW5n
IGZvciA6KS4gVGhhbmsgeW91IGZvciB3cml0aW5nIGl0IQo+IAo+IENhbiBJIHRha2UgdGhpcyBh
cyBhbiBhY2ssIG9yIGEgcmVxdWVzdCBmb3IgY2xhcmlmaWNhdGlvbiBpbiB0aGUgY29tbWl0Cj4g
bWVzc2FnZSwgb3Igc29tZXRoaW5nIGVsc2U/CgpObyBuZWVkIGZvciBjbGFyaWZpY2F0aW9uIGlu
IHRoZSBjb21taXQgbWVzc2FnZS4KCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
