Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0886013744C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 18:03:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipxeV-0006G8-DC; Fri, 10 Jan 2020 17:00:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NhKW=27=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ipxeU-0006G2-3C
 for xen-devel@lists.xen.org; Fri, 10 Jan 2020 17:00:50 +0000
X-Inumbo-ID: bb4fd652-33ca-11ea-a985-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb4fd652-33ca-11ea-a985-bc764e2007e4;
 Fri, 10 Jan 2020 17:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578675641;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=k22gBcSilM/gkxW89YZo3WBNDsxKIYgukwWoWIQ9NJU=;
 b=LWr1IowoerMSWo7ROF6GF/n2Hq56Tlftq2kgcVJsrheWEPnXAEK/jIaV
 nDnkxkCwkBVYb+rKn2L1Hmpg46Dn9ZYoirnUEJXneUhZNNKxf0HJAuwtt
 G/Mf9Vn2ZPFOvOYxZxh0MVkb4i4rwYvkB/rrvWMRdzk9he53X7NTr10rN Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Oj5PmpvB416UaREQRwQzG7P33Nz3Khx5hYvQZENngyzsFn0g+Ag2LhAtPBB73inAUCfz52+0fo
 RqCrJitMM8xIp6HDwjDOW9exJVG9Q1mHjuXVtCzIrbpGUEuqmkixoJilaXbr/RI1ZBeykjxqTn
 OPPvs2E6MEsBPQXcyJtQGcBA7Pr3ImOut6XnVBrCM7XR9fH5hKG5+qdMOcMJRAhrRKTQjwDTCt
 04JCC2KBPJvWf+rCd5dBI6gq9+wSNjPSF768Gdbq9z28RltPg053lyNIF76b9uzgZFEqs4mYEI
 G98=
X-SBRS: 2.7
X-MesageID: 11342455
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,417,1571716800"; d="scan'208";a="11342455"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200110103723.29538-1-sergey.dyasli@citrix.com>
 <e79ec88a-8261-39e0-6c18-a1db5af85b6a@citrix.com>
 <5e6956a4-9b32-6fae-6fa5-cf72a627a3da@citrix.com>
 <01239ba8-9084-faff-c9f7-f59970aefd82@suse.com>
 <e57a35f1-1c81-8393-0efd-c3592aa69dd2@suse.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <feeedeb6-a70c-efe5-d270-cd4d7881c4ce@citrix.com>
Date: Fri, 10 Jan 2020 17:00:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e57a35f1-1c81-8393-0efd-c3592aa69dd2@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Daniel De
 Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS8xMC8yMCA0OjQ1IFBNLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+IE9uIDEwLjAxLjIwIDE2
OjU2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTAuMDEuMjAyMCAxNjoyOCwgR2VvcmdlIER1
bmxhcCB3cm90ZToKPj4+IE9uIDEvMTAvMjAgMTE6MDIgQU0sIEFuZHJldyBDb29wZXIgd3JvdGU6
Cj4+Pj4gT24gMTAvMDEvMjAyMCAxMDozNywgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4+Pj4gSGlk
ZSB0aGUgZm9sbG93aW5nIGluZm9ybWF0aW9uIHRoYXQgY2FuIGhlbHAgaWRlbnRpZnkgdGhlIHJ1
bm5pbmcgWGVuCj4+Pj4+IGJpbmFyeSB2ZXJzaW9uOiBYRU5WRVJfZXh0cmF2ZXJzaW9uLCBYRU5W
RVJfY29tcGlsZV9pbmZvLAo+Pj4+PiBYRU5WRVJfY2hhbmdlc2V0Lgo+Pj4+PiBBZGQgZXhwbGlj
aXQgY2FzZXMgZm9yIFhFTlZFUl9jb21tYW5kbGluZSBhbmQgWEVOVkVSX2J1aWxkX2lkIGFzIHdl
bGwuCj4+Pj4+Cj4+Pj4+IEludHJvZHVjZSB4c21fZmlsdGVyX2RlbmllZCgpIHRvIGh2bWxvYWRl
ciB0byByZW1vdmUgIjxkZW5pZWQ+IiBzdHJpbmcKPj4+Pj4gZnJvbSBndWVzdCdzIERNSSB0YWJs
ZXMgdGhhdCBvdGhlcndpc2Ugd291bGQgYmUgc2hvd24gaW4gdG9vbHMgbGlrZQo+Pj4+PiBkbWlk
ZWNvZGUuCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5k
eWFzbGlAY2l0cml4LmNvbT4KPj4+Pj4gLS0tCj4+Pj4+IHYxIC0tPiB2MjoKPj4+Pj4gLSBBZGRl
ZCB4c21fZmlsdGVyX2RlbmllZCgpIHRvIGh2bWxvYWRlciBpbnN0ZWFkIG9mIG1vZGlmeWluZwo+
Pj4+PiB4ZW5fZGVueSgpCj4+Pj4+IC0gTWFkZSBiZWhhdmlvdXIgdGhlIHNhbWUgZm9yIGJvdGgg
UmVsZWFzZSBhbmQgRGVidWcgYnVpbGRzCj4+Pj4+IC0gWEVOVkVSX2NhcGFiaWxpdGllcyBpcyBu
byBsb25nZXIgaGlkZWQKPj4+Pj4KPj4+Pj4gQ0M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Cj4+Pj4+IENDOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1
LmNpdHJpeC5jb20+Cj4+Pj4+IENDOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT4KPj4+Pj4gQ0M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+Pj4gQ0M6
IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Cj4+Pj4+IENDOiBLb25yYWQgUnplc3p1dGVr
IFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cj4+Pj4+IENDOiBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4+Pj4+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3Jn
Pgo+Pj4+PiBDQzogRGFuaWVsIERlIEdyYWFmIDxkZ2RlZ3JhQHR5Y2hvLm5zYS5nb3Y+Cj4+Pj4K
Pj4+PiBJIHJlYWxpc2UgdGhlcmUgYXJlIGFyZ3VtZW50cyBvdmVyIGhvdyB0byBmaXggdGhpcywg
YnV0IHdlICh0aGUgWGVuCj4+Pj4gY29tbXVuaXR5KSBoYXZlIGFscmVhZHkgZipja2VkIHVwIG9u
Y2UgaGVyZSwgYW5kIHRoaXMgaXMgZG9pbmcgc28gYQo+Pj4+IHNlY29uZCB0aW1lLgo+Pj4+Cj4+
Pj4gTmFjay4KPj4+Pgo+Pj4+IEZpeGluZyBpdCBhbnl3aGVyZSBvdGhlciB0aGFuIFhlbiBpcyBz
aW1wbHkgbm90IGFwcHJvcHJpYXRlLgo+Pgo+PiAocmVwbHlpbmcgaGVyZSwgYmVjYXVzZSB0aGUg
b3JpZ2luYWwgbWFpbCBkb2Vzbid0IHNlZW0gdG8gaGF2ZQo+PiBtYWRlIGl0IGludG8gbXkgaW5i
b3gpCj4+Cj4+IEkndmUgc2FpZCBzbyB0byBTZXJnZXkgYWxyZWFkeSBvbiB2MTogVGhlICJmaXgi
IHlvdSB3YW50IG5lZWRzIHRvCj4+IGJlIGF0IG9yIGNsb3NlciB0byB0aGUgcHJlc2VudGF0aW9u
IGxheWVyLiBGcm9tIFhlbidzIHBlcnNwZWN0aXZlCj4+IHRoZSByZXF1ZXN0IGZvciBpbmZvcm1h
dGlvbiB3YXMgX2luZGVlZF8gZGVuaWVkLgo+Pgo+Pj4+IFRoZSByZWFzb24gZm9yIHRoaXMgKHdo
aWNoIG91Z2h0IHRvIGJlIG9idmlvdXMsIGJ1dCBJIGd1ZXNzIG9ubHkgdG8KPj4+PiB0aG9zZSB3
aG8gYWN0dWFsbHkgZG8gY3VzdG9tZXIgc3VwcG9ydCkgaXMgYmFzaWMgaHVtYW4gcGh5c2lvbG9n
eS4KPj4+PiAiZGVuaWVkIiBtZWFucyBzb21ldGhpbmcgaGFzIGdvbmUgd3JvbmcuwqAgSXQgc2Nh
cmVzIHBlb3BsZSwgYW5kIGNhdXNlcwo+Pj4+IHRoZW0gdG8gc2VlayBoZWxwIHRvIGNoYW5nZSBm
aXggd2hhdGV2ZXIgaXMgYnJva2VuLgo+Pj4KPj4+IFRoaXMgc2VlbXMgbGlrZSBhIHJlYXNvbmFi
bGUgYXJndW1lbnQgdGhhdCAiPGRlbmllZD4iIGNhdXNlcyBpc3N1ZXMuCj4+PiBCdXQgdGhhdCBk
b2Vzbid0IGNoYW5nZSB0aGUgZmFjdCB0aGF0ICIiIGFsc28gY2F1c2VzIGlzc3Vlcy4KPj4+Cj4+
PiBXaGF0IGFib3V0IGNoYW5naW5nIHRoZSBzdHJpbmcgdG8gIjxidWlsZC1pZCBoaWRkZW4+IiBv
ciBzb21ldGhpbmcgbGlrZQo+Pj4gdGhhdD/CoCBUaGF0IG1ha2VzIGl0IG1vcmUgY2xlYXIgd2hh
dCB3b3VsZCBoYXZlIGJlZW4gaW4gdGhhdCBwbGFjZSwgYW5kCj4+PiAiaGlkZGVuIiBpcyBhIGxv
dCBsZXNzIHNjYXJ5IHRoYW4gImRlbmllZCIuCj4+Cj4+IEkgY291bGQgbGl2ZSB3aXRoIHRoaXMu
IEJ1dCAoanVkZ2luZyBmcm9tIHRoZSBwaWN0dXJlIHRoYXQgd2FzCj4+IHByb3ZpZGVkIGVhcmxp
ZXIgb24pIGl0IHdvdWxkIHN0aWxsIHJlcXVpcmUgZmlsdGVyaW5nIGF0IG9yIGNsb3NlCj4+IHRv
IHRoZSBwcmVzZW50YXRpb24gbGF5ZXIsIGFuZCBieSBjaGFuZ2luZyB0aGUgcHJpb3IgPGRlbmll
ZD4gdG8KPj4gZGlmZmVyZW50IGFuZCB2YXJ5aW5nIHN0cmluZ3MgbWF5IG1ha2UgdGhhdCBqb2Ig
aGFyZGVyIChhbGJlaXQKPj4gcGVyaGFwcyB0aGV5IGNvdWxkIGxvb2sgZm9yIGFueSA8Li4uPiku
Cj4gCj4gSSdkIGdvIHdpdGggIjxoaWRkZW4+IiBvciAiPE5JTD4iLiAiPGJ1aWxkLWlkIGhpZGRl
bj4iIGFzIHZhbHVlIGZvciB0aGUKPiBidWlsZC1pZCBpcyBzaW1pbGFyIHRvICJMQ0QtZGlzcGxh
eSIuIEFuZCBpdCB3aWxsIGNlcnRhaW5seSBub3QgYmUgdGhlCj4gY29ycmVjdCB2YWx1ZSBmb3Ig
b3RoZXIgaGlkZGVuIGl0ZW1zLiA6LSkKClRoZSBpZGVhIGlzIHRoYXQgaW4gYSBsb2csIGlmIHlv
dSBzZWUgYSBidWlsZGlkIGluIGNvbnRleHQsIHlvdSBjYW4KdXN1YWxseSBmaWd1cmUgb3V0IHdo
YXQgaXQgaXMganVzdCBieSBsb29raW5nIGF0IGl0OyBpLmUuLjoKClhlbiA0LjEzLjEgOGEyYTI0
ZjRlMQoKU28gd2hpY2ggaXMgYmV0dGVyPwoKMS4gWGVuIDQuMTMuMQoKMi4gWGVuIDQuMTMuMSA8
aGlkZGVuPgoKMyBYZW4gNC4xMy4xIDxidWlsZGlkIGhpZGRlbj4KCjQgWGVuIDQuMTMuMSA8TklM
PgoKSSBkb24ndCBsaWtlIDEgb3IgNC4gIEkgY291bGQgbGl2ZSB3aXRoIDIgSSBndWVzcy4KCiAt
R2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
