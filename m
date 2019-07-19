Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 884BE6E6B5
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 15:44:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoT9H-0004E3-LG; Fri, 19 Jul 2019 13:42:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tC9P=VQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hoT9G-0004Dx-I7
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 13:42:10 +0000
X-Inumbo-ID: 00986e85-aa2b-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 00986e85-aa2b-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 13:42:08 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JKNaR3iSq52yr1bhWT+ZVBRKiK50j/YbuUmvkE75nEF6NsHOMpjXb9mrtcblM/ts78zIYzneaN
 2oDG1DdyBfS8Q6tleZ1QqcYLeepE4z1fUFfQFRSed9M8Y737TCJ1TNbwlhZXubpbWglBu6/U4b
 qnfEFrkj9m2UEoF76BsnNZAnJL/TGIPxe6qOg4lrd0icsYUFIA0YjknrMu4Fx/Jd3kv/9tvw9l
 lWrDTs8EjE++duy5NHPSTyaJyklweVQ847krFA9MmNSm6RJUegTzfh2L+SFXhA+7FdLnFFjdOV
 fIQ=
X-SBRS: 2.7
X-MesageID: 3180727
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,282,1559534400"; 
   d="scan'208";a="3180727"
To: Jan Beulich <JBeulich@suse.com>
References: <20190719122545.3486-1-paul.durrant@citrix.com>
 <bb3a29a3-5e76-8914-a88b-759220f22e5a@citrix.com>
 <3204c2f3-e6fc-20dc-f3d3-432a8d148419@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <cd840255-274f-6130-9bab-b57f0ef20477@citrix.com>
Date: Fri, 19 Jul 2019 14:42:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3204c2f3-e6fc-20dc-f3d3-432a8d148419@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] include/public/memory.h: remove the
 XENMEM_rsrc_acq_caller_owned flag
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMDcvMjAxOSAxNDozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTkuMDcuMjAxOSAx
NDo0MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTkvMDcvMjAxOSAxMzoyNSwgUGF1bCBE
dXJyYW50IHdyb3RlOgo+Pj4gV2hlbiBjb21taXQgM2Y4ZjEyMjggIng4Ni9tbTogYWRkIEhZUEVS
VklTT1JfbWVtb3J5X29wIHRvIGFjcXVpcmUgZ3Vlc3QKPj4+IHJlc291cmNlcyIgaW50cm9kdWNl
ZCB0aGUgY29uY2VwdCBvZiBkaXJlY3RseSBtYXBwaW5nIHNvbWUgZ3Vlc3QgcmVzb3VyY2VzLAo+
Pj4gaXQgd2FzIGVudmlzYWdlZCB0aGF0IHRoZSBtZW1vcnkgZm9yIHNvbWUgcmVzb3VyY2VzIGFz
c29jaWF0ZWQgd2l0aCBhIGd1ZXN0Cj4+PiBtYXkgbm90IGFjdHVhbGx5IGJlIGFzc2lnbmVkIHRv
IHRoYXQgZ3Vlc3QsIHNwZWNpZmljYWxseSB0aGUgSU9SRVEgc2VydmVyCj4+PiByZXNvdXJjZSBp
bnRyb2R1Y2VzIGluIGNvbW1pdCA2ZTM4NzQ2MSAieDg2L2h2bS9pb3JlcTogYWRkIGEgbmV3IG1h
cHBhYmxlCj4+PiByZXNvdXJjZSB0eXBlLi4uIi4gU3VjaCByZXNvdXJjZXMgd2VyZSBkdWJiZWQg
ImNhbGxlciBvd25lZCIgYW5kIHJlc3VsdGVkCj4+PiBpbiB0aGUgb3duZWQgcmVzb3VyY2VzIiBh
bmQgYWNxdWlyaW5nIHRoZW0gcmVzdWx0ZWQgaW4gdGhlCj4+PiBYRU5NRU1fcnNyY19hY3FfY2Fs
bGVyX293bmVkIGZsYWcgYmVpbmcgcGFzc2VkIGJhY2sgdG8gdGhlIGNhbGxlciBvZiB0aGUKPj4+
IG1lbW9yeSBvcC4KPj4+Cj4+PiBVbmZvcnR1bmF0ZWx5IHRoZSBpbXBsZW1lbnRhdGlvbiBsZWQg
dG8gWFNBLTI3Niwgd2hpY2ggd2FzIG1pdGlnYXRlZAo+Pj4gYnkgY29tbWl0IGY2YjZhZTc4ICJ4
ODYvaHZtL2lvcmVxOiBmaXggcGFnZSByZWZlcmVuY2luZyIgYW5kIHRoZW4gYSByZWxhdGVkCj4+
PiBtZW1vcnkgYWNjb3VudGluZyBwcm9ibGVtIHdhcyB3b3JrZWQgYXJvdW5kIGJ5IGNvbW1pdCBl
ODYyZTZjZQo+Pj4gIng4Ni9odm0vaW9yZXE6IHVzZSByZWYtY291bnRlZCB0YXJnZXQtYXNzaWdu
ZWQgc2hhcmVkIHBhZ2VzIi4gVGhpcyBsYXR0ZXIKPj4+IGNvbW1pdCByZW1vdmVkIHRoZSBvbmx5
IGluc3RhbmNlIG9mIGEgImNhbGxlciBvd25lZCIgcmVzb3VyY2UsIGJ1dCB0aGUKPj4+IGZsYWcg
d2FzIGxlZnQgaW4gaGVhZGVyIGFuZCBjaGVja2VkIGluIG9uZSBwbGFjZSBpbiB0aGUgY29yZSBj
b2RlLgo+Pj4gVGhpcyBwYXRjaCByZW1vdmVzIHRoYXQgbm93IHJlZHVuZGFudCBjaGVjayBhbmQg
cmVtb3ZlcyB0aGUgZGVmaW5pdGlvbiBvZgo+Pj4gWEVOTUVNX3JzcmNfYWNxX2NhbGxlcl9vd25l
ZCBmcm9tIHRoZSBwdWJsaWMgaGVhZGVyLiBBbHNvLCBzaW5jZSB0aGlzIHdhcwo+Pj4gdGhlIG9u
bHkgZmxhZyBkZWZpbmVkIGZvciB0aGUgWEVOTUVNX2FjcXVpcmVfcmVzb3VyY2UgbWVtb3J5IG9w
LCBpdCByZW1vdmVzCj4+PiB0aGUgJ2ZsYWdzJyBmaWVsZCBvZiBzdHJ1Y3QgeGVuX21lbV9hY3F1
aXJlX3Jlc291cmNlIGFuZCByZXBsYWNlcyBpdCB3aXRoCj4+PiBhbiBlcXVpdmFsZW50bHkgc2l6
ZWQgJ3BhZCcgZmllbGQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVs
LmR1cnJhbnRAY2l0cml4LmNvbT4KPj4gVGhpcyBpcyBhIG1vZGlmaWNhdGlvbiB0byBhIHB1Ymxp
YyBoZWFkZXIsIGJ1dCBpbiB0aGlzIHNwZWNpZmljIGNhc2UsIEkKPj4gdGhpbmsgaXQgaXMgdGhl
IGNvcnJlY3QgdGhpbmcgdG8gZG8uCj4gVGhpcyBpcyBpbiBhIGxhcmdlICIjaWYgZGVmaW5lZChf
X1hFTl9fKSB8fCBkZWZpbmVkKF9fWEVOX1RPT0xTX18pIiBzZWN0aW9uLAo+IGFuZCB3ZSBjb25z
aWRlciBwdWJsaWMgaW50ZXJmYWNlIHBhcnRzIGluIHN1Y2ggc2VjdGlvbnMgdm9sYXRpbGUgYW55
d2F5LgoKT2ggLSBldmVuIGJldHRlci7CoCBJJ2Qgbm90IHNwb3R0ZWQgdGhhdC4KCn5BbmRyZXcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
