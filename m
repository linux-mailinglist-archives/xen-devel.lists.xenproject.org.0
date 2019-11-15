Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E81A1FDDA7
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 13:26:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVadS-0006uQ-2K; Fri, 15 Nov 2019 12:23:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVadQ-0006uG-4P
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 12:23:32 +0000
X-Inumbo-ID: bb96d33a-07a2-11ea-a268-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb96d33a-07a2-11ea-a268-12813bfff9fa;
 Fri, 15 Nov 2019 12:23:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D2E66AF61;
 Fri, 15 Nov 2019 12:23:29 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20191114180542.1016867-1-anthony.perard@citrix.com>
 <3bbbd382-465b-6169-f8b3-936cd71d222f@suse.com>
 <20191115121221.GB1425@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <62c9bdf0-ca13-53d9-a702-e51d9e1875c5@suse.com>
Date: Fri, 15 Nov 2019 13:23:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191115121221.GB1425@perard.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] xen: Fix race to build
 arch/x86/efi/relocs-dummy.o
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTEuMjAxOSAxMzoxMiwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IE9uIEZyaSwgTm92
IDE1LCAyMDE5IGF0IDExOjA2OjI3QU0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24g
MTQuMTEuMjAxOSAxOTowNSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+Pj4gV2l0aCAkKFRBUkdF
VCkuZWZpIGRlcGVuZGluZyBvbiBlZmkvcmVsb2NzLWR1bW15Lm8sIGFyY2gveDg2L01ha2VmaWxl
DQo+Pj4gd2lsbCBhdHRlbXB0IHRvIGJ1aWxkIHRoYXQgb2JqZWN0LiBUaGlzIHJlc3VsdCBpbiB0
aGUgZGVwZW5kZW5jeSBmaWxlDQo+Pj4gYmVlbiBnZW5lcmF0ZWQgd2l0aCByZWxvY3MtZHVtbXku
byBkZXBlbmRpbmcgb24gZWZpL3JlbG9jcy1kdW1teS5vLg0KPj4NCj4+IEkgY2Fubm90IGNvbmZp
cm0gdGhpcywgd2hhdCBJIHNlZSBpcw0KPj4NCj4+IGVmaS9yZWxvY3MtZHVtbXkubzogZWZpL3Jl
bG9jcy1kdW1teS5TIFwNCj4+ICAuLi4NCj4gDQo+IA0KPiBJJ3ZlIHdyaXR0ZW4gdGhlIGNvbW1p
dCBtZXNzYWdlIGJhc2Ugb24gZmV3IGV2aWRlbmNlcywgYnV0IEkgZG9uJ3Qga25vdw0KPiBpZiB0
aGUgcmFjZSBjb21lcyBmcm9tIHRyeWluZyB0byBidWlsZCAkKFRBUkdFVCkuZWZpLiBIZXJlIGlz
IHdoYXQgSQ0KPiBoYXZlOg0KPiANCj4gIyBCdWlsZGluZyBYZW4gd2l0aCBtYWtlIC1qOCBhZnRl
ciBnaXQgY2xlYW4NCj4gbWFrZVszXTogKioqIE5vIHJ1bGUgdG8gbWFrZSB0YXJnZXQgJ2VmaS9y
ZWxvY3MtZHVtbXkuUycsIG5lZWRlZCBieSAncmVsb2NzLWR1bW15Lm8nLg0KPiAkIGhlYWQgLTEg
YXJjaC94ODYvZWZpLy5yZWxvY3MtZHVtbXkuby5kDQo+IHJlbG9jcy1kdW1teS5vOiBlZmkvcmVs
b2NzLWR1bW15LlMgXA0KPiANCj4gYXJjaC94ODYvLnJlbG9jcy1kdW1teS5vLmQgZG9lc24ndCBl
eGlzdC4NCg0KU28gSSBndWVzcyBJJ2QgbGlrZSB0byBpbmNsdWRlICJtYXkiIHRoZW4gaW4gdGhh
dCBzcGVjaWZpYyBzZW50ZW5jZSBvZg0KdGhlIGNvbW1pdCBtZXNzYWdlLCB3aGljaCB3b3VsZCBi
ZSBlYXN5IGVub3VnaCB0byBkbyB3aGlsZSBjb21taXR0aW5nLg0KDQo+IGxvb2tpbmcgYmFjayBh
dCB0aGUgbWFrZSBvdXRwdXQsIHJlbG9jcy1kdW1teSB3YXMgYnVpbHQgd2l0aDoNCj4gZ2NjIC1E
X19BU1NFTUJMWV9fIC1tNjQgLURCVUlMRF9JRCAtZm5vLXN0cmljdC1hbGlhc2luZyAtV2FsbCAt
V3N0cmljdC1wcm90b3R5cGVzIC1XZGVjbGFyYXRpb24tYWZ0ZXItc3RhdGVtZW50IC1Xbm8tdW51
c2VkLWJ1dC1zZXQtdmFyaWFibGUgLVduby11bnVzZWQtbG9jYWwtdHlwZWRlZnMgLU8xIC1mbm8t
b21pdC1mcmFtZS1wb2ludGVyIC1ub3N0ZGluYyAtZm5vLWJ1aWx0aW4gLWZuby1jb21tb24gLVdl
cnJvciAtV3JlZHVuZGFudC1kZWNscyAtV25vLXBvaW50ZXItYXJpdGggLVd2bGEgLXBpcGUgLURf
X1hFTl9fIC1pbmNsdWRlIC9sb2NhbC9ob21lL3NoZWVwL3dvcmsveGVuL3hlbi9pbmNsdWRlL3hl
bi9jb25maWcuaCAnLURfX09CSkVDVF9GSUxFX189ImVmaS9yZWxvY3MtZHVtbXkubyInIC1XYSwt
LXN0cmlwLWxvY2FsLWFic29sdXRlIC1nIC1NTUQgLU1GIGVmaS8ucmVsb2NzLWR1bW15Lm8uZCAt
RFhFTl9CVUlMRF9FRkkgLUkvbG9jYWwvaG9tZS9zaGVlcC93b3JrL3hlbi94ZW4vaW5jbHVkZSAt
SS9sb2NhbC9ob21lL3NoZWVwL3dvcmsveGVuL3hlbi9pbmNsdWRlL2FzbS14ODYvbWFjaC1nZW5l
cmljIC1JL2xvY2FsL2hvbWUvc2hlZXAvd29yay94ZW4veGVuL2luY2x1ZGUvYXNtLXg4Ni9tYWNo
LWRlZmF1bHQgLURYRU5fSU1HX09GRlNFVD0weDIwMDAwMCAnLURfX09CSkVDVF9MQUJFTF9fPWFy
Y2gkeDg2JGVmaSRyZWxvY3NfZHVtbXkubycgLW1zb2Z0LWZsb2F0IC1mbm8tc3RhY2stcHJvdGVj
dG9yIC1mbm8tZXhjZXB0aW9ucyAtV25lc3RlZC1leHRlcm5zIC1ESEFWRV9BU19WTVggLURIQVZF
X0FTX1NTRTRfMiAtREhBVkVfQVNfRVBUIC1ESEFWRV9BU19SRFJBTkQgLURIQVZFX0FTX0ZTR1NC
QVNFIC1ESEFWRV9BU19YU0FWRU9QVCAtREhBVkVfQVNfUkRTRUVEIC1ESEFWRV9BU19DTFdCIC1V
X19PQkpFQ1RfTEFCRUxfXyAtREhBVkVfQVNfUVVPVEVEX1NZTSAnLURfX09CSkVDVF9MQUJFTF9f
PWFyY2gveDg2L2VmaS9yZWxvY3MtZHVtbXkubycgLURIQVZFX0FTX0lOVlBDSUQgLURIQVZFX0FT
X05FR0FUSVZFX1RSVUUgLURIQVZFX0FTX05PUFNfRElSRUNUSVZFIC1tbm8tcmVkLXpvbmUgLWZw
aWMgLWZuby1hc3luY2hyb25vdXMtdW53aW5kLXRhYmxlcyAtbW5vLXNzZSAtbXNraXAtcmF4LXNl
dHVwIC1ER0NDX0hBU19WSVNJQklMSVRZX0FUVFJJQlVURSAtbWluZGlyZWN0LWJyYW5jaD10aHVu
ay1leHRlcm4gLW1pbmRpcmVjdC1icmFuY2gtcmVnaXN0ZXIgLURDT05GSUdfSU5ESVJFQ1RfVEhV
TksgLWZuby1qdW1wLXRhYmxlcyAtbXByZWZlcnJlZC1zdGFjay1ib3VuZGFyeT0zIC1XYSwtSS9s
b2NhbC9ob21lL3NoZWVwL3dvcmsveGVuL3hlbi9pbmNsdWRlIC1EQlVJTERfSURfRUZJIC1jIGVm
aS9yZWxvY3MtZHVtbXkuUyAtbyBlZmkvcmVsb2NzLWR1bW15Lm8NCj4gDQo+ICQgZ2NjIC0tdmVy
c2lvbg0KPiBnY2MgKEdDQykgOS4yLjANCj4gDQo+IEknbSBndWVzc2luZyB0aGF0IGdjYyBiZWhh
dmUgZGlmZmVyZW50bHkgYmV0d2VlbiBib3RoIG91ciBzeXN0ZW0/DQoNClF1aXRlIHBvc3NpYmxl
LCBhbGJlaXQgaXQncyA5LjIuMCBoZXJlIHRvby4gRGlmZmVyZW50IHNldCBvZiBwYXRjaGVzDQpv
biB0b3Agb2YgdGhlIHVwc3RyZWFtIHZlcnNpb24sIEkgZ3Vlc3MuDQoNCkphbg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
