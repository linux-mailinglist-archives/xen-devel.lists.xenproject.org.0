Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9F562A5E
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 22:31:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkaFX-0004je-Hj; Mon, 08 Jul 2019 20:28:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=arZn=VF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hkaFW-0004jZ-0o
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 20:28:34 +0000
X-Inumbo-ID: f2214524-a1be-11e9-ba2b-cf3eb269aafc
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f2214524-a1be-11e9-ba2b-cf3eb269aafc;
 Mon, 08 Jul 2019 20:28:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5AB52B;
 Mon,  8 Jul 2019 13:28:28 -0700 (PDT)
Received: from [10.119.48.199] (unknown [10.119.48.199])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25E953F246;
 Mon,  8 Jul 2019 13:28:28 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <1561109798-8744-5-git-send-email-andrew.cooper3@citrix.com>
 <20190704191449.22486-1-andrew.cooper3@citrix.com>
 <96aff7db-67f7-546a-da63-a915cdadd7b9@arm.com>
 <fba23c81-2ab9-28b8-86f2-89b3220345a9@citrix.com>
 <14762cea-1b87-4dea-69cc-6e4cf001c73b@arm.com>
 <2bfc235e-6b66-4b97-baef-618d5e80b360@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1ed8fc50-1c8e-b8c1-604a-bdb58d69af5b@arm.com>
Date: Mon, 8 Jul 2019 21:28:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <2bfc235e-6b66-4b97-baef-618d5e80b360@citrix.com>
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

SGkgQW5kcmV3LAoKT24gNy84LzE5IDk6MjEgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24g
MDgvMDcvMjAxOSAyMDoyNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gNy84
LzE5IDc6MTEgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+PiBPbiAwNy8wNy8yMDE5IDE5OjQy
LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gSGkgQW5kcmV3LAo+Pj4+Cj4+Pj4gT24gNy80LzE5
IDg6MTQgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IFRvIGFsbG93IGZvciBmdXJ0aGVy
IGltcHJvdmVtZW50cywgaXQgaXMgdXNlZnVsIHRvIGJlIGFibGUgdG8gY2xlYXIKPj4+Pj4gbW9y
ZSB0aGFuCj4+Pj4+IGEgc2luZ2xlIGZsYWcgYXQgb25jZS7CoCBSZXdvcmsgZ250dGFiX2NsZWFy
X2ZsYWcoKSBpbnRvCj4+Pj4+IGdudHRhYl9jbGVhcl9mbGFncygpCj4+Pj4+IHdoaWNoIHRha2Vz
IGEgYml0bWFzayByYXRoZXIgdGhhbiBhIGJpdCBudW1iZXIuCj4+Pj4+Cj4+Pj4+IE5vIHByYWN0
aWNhbCBjaGFuZ2UgeWV0Lgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+Pj4+PiAtLS0KPj4+Pj4gQ0M6IEphbiBCZXVs
aWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPj4+Pj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4+
Pj4+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4+Pj4gQ0M6
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPj4+Pj4gQ0M6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+Pj4+IENDOiBHZW9yZ2UgRHVubGFw
IDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5jb20+Cj4+Pj4+Cj4+Pj4+IHYyOgo+Pj4+PiAgwqDC
oCAqIFVzZSB1bnNpZ25lZCBpbnQgZm9yIHRoZSBtYXNrIHBhcmFtZXRlcgo+Pj4+Cj4+Pj4gSSBk
b24ndCBzZWVtIHRvIGZpbmQgdGhlIHJlcXVlc3Qgb24gdGhlIE1MLiBUZWNobmljYWxseSB0aGUg
bWFzayBjYW4KPj4+PiBvbmx5IGJlIDE2LWJpdC4gTWF5IEkgYXNrIHRoZSByZWFzb24gb2YgdGhp
cyBjaGFuZ2U/Cj4+Pgo+Pj4gSXQgaXMgb24gdGhlIG1haWxpbmcgbGlzdCwgYnV0IGFuIG9ycGhh
bmVkIGVtYWlsIGR1ZSB0byBKYW4ncyBlbWFpbAo+Pj4gY2hhbmdlcy4KPj4KPj4gSXMgaXQgdGhl
IHNhbWUgcHJvYmxlbSBhcyBJIGhhdmUgc2VlbiB0aGUgcGFzdCA2IG1vbnRocyBiZXR3ZWVuCj4+
IEp1ZXJnZW4gYW5kIEphbidzIGUtbWFpbD8KPiAKPiBJIHRoaW5rIGl0cyBkaWZmZXJlbnQsIGJ1
dCBJJ20gbG9zaW5nIHRyYWNrIHRiaC4KCkl0IHdvdWxkIGJlIG5pY2UgdG8gcmVzb2x2ZSBpdC4u
LiBJdCBpcyBhIHBhaW4gdG8gdHJ5IHRvIG1hdGNoIHRoZW0gd2l0aCAKdGhlIGNvcnJlY3QgdGhy
ZWFkLgoKPiAKPj4KPj4+Cj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvMTU2
MTEwOTc5OC04NzQ0LTUtZ2l0LXNlbmQtZW1haWwtYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbS9U
LyN0Cj4+Pgo+Pgo+PiBUbyBiZSBob25lc3QsIEkgdGhpbmsgaXQgaXMgd3JvbmcgdG8gdHJ5IHRv
IG1pY3JvLW9wdGltaXplIGEgY29tbW9uCj4+IHByb3RvdHlwZSBmb3IgdGhlIGJlbmVmaXQgb2Yg
b25lIGFyY2hpdGVjdHVyZSBhbmQgb25lIGNvbXBpbGVyIHZlcnNpb24KPj4gKG9yIGV2ZW4gbm9u
ZSBwZXIgdGhlIGUtbWFpbCkuCj4gCj4gVGhlIHByb3RvdHlwZSB3YXNuJ3QgY29tbW9uLsKgIE9i
c2VydmUgdGhhdCBiZWZvcmUgdGhpcyBwYXRjaCwgQVJNIHVzZWQKPiB1bnNpZ25lZCBsb25nIHdo
aWxlIHg4NiB1c2VkIHVpbnQxNl90LsKgIEl0IHNob3VsZCBiZWNvbWUgY29tbW9uLCBob3dldmVy
LgoKSSBhbSBub3Qgc3VyZSB0byBmb2xsb3cgdGhpcy4gQUZBSUNULCB3ZSB1c2UgdWludDE2X3Qg
cHJvcGVybHkgb24gQXJtLgoKPiAKPiBJbiBwcmFjdGljZSwgd2UncmUgdGFsa2luZyBhYm91dCBi
aXRzIDMgYW5kIDQsIGFuZCB0aGlzIGlzbid0IGxpYWJsZSB0bwo+IGNoYW5nZSBpbiBhIGh1cnJ5
Lgo+IAo+PiBPbmUgY291bGQgYWxzbyBhcmd1ZSB0aGF0IHRoaXMgbWF5IGJlIG5vdCBiZW5lZmlj
aWFsIGZvciB0aGUgbm9uLXg4Ngo+PiBhcmNoaXRlY3R1cmUgZGVwZW5kaW5nIG9uIGhvdyB0aGUg
Y29tcGlsZXIgZGVjaWRlIHRvIGRvIHRoZSBjYXN0IGZyb20KPj4gMzItYml0IHRvIDE2LWJpdC4u
Lgo+IAo+IEFsbCBhcmNoaXRlY3R1cmUgbmVjZXNzYXJpbHkgc3VmZmVyIHRoZSBkb3duY2FzdCBz
b21ld2hlcmUsIGV2ZW4geDg2Lgo+IEFSTSdzIGlzIGluIHRoZSBwcm90b3R5cGUgZm9yIGd1ZXN0
X2NsZWFyX21hc2sxNigpLCBidXQgaW4gdGVybXMgb2YgdGhlCj4gY29tbW9uIGxvZ2ljIGZvciBj
YWxjdWxhdGluZyBjb25kaXRpb25hbGx5IHdoaWNoIGJpdHMgdG8gY2xlYXIsIGtlZXBpbmcKPiBl
dmVyeXRoaW5nIGFzIHVuc2lnbmVkIGludCBmb3IgYXMgbG9uZyBhcyBwb3NzaWJsZSBvZmZlcnMg
dGhlIG1vc3QKPiBmbGV4aWJpbGl0eSB0byB0aGUgY29tcGlsZXIsIGFzIGl0IGNhbiBzZWUgYWxs
IHRoZSBjb25zdGFudHMgaW52b2x2ZWQuCgpUaGlzIGlzIHRoZSBhcmd1bWVudCBJIHdhcyBsb29r
aW5nIGZvciA6KS4gVGhhbmsgeW91IGZvciB3cml0aW5nIGl0IQoKQ2hlZXJzLAoKLS0gCkp1bGll
biBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
