Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4AA115C6
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 10:52:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hM7QL-000370-Pz; Thu, 02 May 2019 08:50:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L2Tp=TC=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hM7QK-00036v-FH
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 08:50:36 +0000
X-Inumbo-ID: 557844c0-6cb7-11e9-9000-77b68b4f63d0
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 557844c0-6cb7-11e9-9000-77b68b4f63d0;
 Thu, 02 May 2019 08:50:28 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 90F82301AB43; Thu,  2 May 2019 11:50:27 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 73F4A306E477;
 Thu,  2 May 2019 11:50:27 +0300 (EEST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <20190501235203.1179-1-tamas@tklengyel.com>
 <01d02c64-a044-5c6f-d411-ec50abb83408@bitdefender.com>
 <7c05a7d3-3423-e342-7704-fa906c99d620@citrix.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <01fb72b9-3089-c160-3368-2d99df00972a@bitdefender.com>
Date: Thu, 2 May 2019 11:50:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7c05a7d3-3423-e342-7704-fa906c99d620@citrix.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH v2] x86/vmx: correctly gather gs_shadow
 value for current vCPU
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNS8yLzE5IDExOjQ1IEFNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDAyLzA1LzIwMTkg
MDc6MjAsIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPj4gT24gNS8yLzE5IDI6NTIgQU0sIFRhbWFz
IEsgTGVuZ3llbCB3cm90ZToKPj4+IEN1cnJlbnRseSB0aGUgZ3Nfc2hhZG93IHZhbHVlIGlzIG9u
bHkgY2FjaGVkIHdoZW4gdGhlIHZDUFUgaXMgYmVpbmcgc2NoZWR1bGVkCj4+PiBvdXQgYnkgWGVu
LiBSZXBvcnRpbmcgdGhpcyAodXN1YWxseSkgc3RhbGUgdmFsdWUgdGhyb3VnaCB2bV9ldmVudCBp
cyBpbmNvcnJlY3QsCj4+PiBzaW5jZSBpdCBkb2Vzbid0IHJlcHJlc2VudCB0aGUgYWN0dWFsIHN0
YXRlIG9mIHRoZSB2Q1BVIGF0IHRoZSB0aW1lIHRoZSBldmVudAo+Pj4gd2FzIHJlY29yZGVkLiBU
aGlzIHByZXZlbnRzIHZtX2V2ZW50IHN1YnNjcmliZXJzIGZyb20gY29ycmVjdGx5IGZpbmRpbmcg
a2VybmVsCj4+PiBzdHJ1Y3R1cmVzIGluIHRoZSBndWVzdCB3aGVuIGl0IGlzIHRyYXBwZWQgd2hp
bGUgaW4gcmluZzMuCj4+Pgo+Pj4gUmVmcmVzaCBzaGFkb3dfZ3MgdmFsdWUgd2hlbiB0aGUgY29u
dGV4dCBiZWluZyBzYXZlZCBpcyBmb3IgdGhlIGN1cnJlbnQgdkNQVS4KPj4+Cj4+PiBTaWduZWQt
b2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4+PiBDYzogUmF6
dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgo+Pj4gQ2M6IEp1biBOYWth
amltYSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT4KPj4+IENjOiBLZXZpbiBUaWFuIDxrZXZpbi50
aWFuQGludGVsLmNvbT4KPj4+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
PiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPj4+IENjOiBX
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+Pj4gQ2M6IFJvZ2VyIFBhdSBNb25uZSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4+PiAtLS0KPj4+IHYyOiBtb3ZlIGZpeCB0byBodm0gc28gdm1f
ZXZlbnQgZG9lc24ndCBoYXZlIHRvIGtub3cgc3BlY2lmaWNzCj4+PiAtLS0KPj4+ICAgeGVuL2Fy
Y2gveDg2L2h2bS92bXgvdm14LmMgfCA1ICsrKysrCj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14
LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwo+Pj4gaW5kZXggMjgzZWI3YjM0ZC4uNTE1
NGVjYzJhOCAxMDA2NDQKPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCj4+PiAr
KysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwo+Pj4gQEAgLTc3OSwxMiArNzc5LDE3IEBA
IHN0YXRpYyB2b2lkIHZteF9sb2FkX2NwdV9zdGF0ZShzdHJ1Y3QgdmNwdSAqdiwgc3RydWN0IGh2
bV9od19jcHUgKmRhdGEpCj4+PiAgIAo+Pj4gICBzdGF0aWMgdm9pZCB2bXhfc2F2ZV92bWNzX2N0
eHQoc3RydWN0IHZjcHUgKnYsIHN0cnVjdCBodm1faHdfY3B1ICpjdHh0KQo+Pj4gICB7Cj4+PiAr
ICAgIGlmICggdiA9PSBjdXJyZW50ICkKPj4+ICsgICAgICAgIHZteF9zYXZlX2d1ZXN0X21zcnMo
dik7Cj4+IHZteF9zYXZlX2d1ZXN0X21zcnMoKSBpcyBzaW1wbGUgZW5vdWdoIHRoYXQgdGhlIGlm
IGlzIHByb2JhYmx5IG5vdAo+PiBuZWNlc3NhcnkgaGVyZSAod2UgY2FuIGp1c3QgY2FsbCB0aGUg
ZnVuY3Rpb24gZGlyZWN0bHksIHJlZ2FyZGxlc3Mgb2YKPj4gd2hhdCB2IGhvbGRzKS4KPiAKPiBX
aHk/wqAgRG9pbmcgdGhhdCB3b3VsZCBmdWxseSBjb3JydXB0IHYncyBzdGF0ZSB3aGVuIGNhbGxl
ZCBpbiByZW1vdGUKPiBjb250ZXh0LCBhcyB5b3UnZCBjbG9iYmVyIHYncyBnc19zaGFkb3cgd2hp
Y2ggd2hhdGV2ZXIgdGhlIHZhbHVlIHdhcwo+IGZyb20gdGhlIGN1cnJlbnQgdmNwdS4KCkdvb2Qg
cG9pbnQsIEkndmUgbWlzc2VkIHRoYXQuCgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
