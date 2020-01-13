Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E868138FB4
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 12:03:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iqxTE-0001sz-49; Mon, 13 Jan 2020 11:01:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4NfF=3C=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1iqxTD-0001su-94
 for xen-devel@lists.xen.org; Mon, 13 Jan 2020 11:01:19 +0000
X-Inumbo-ID: 00f80992-35f4-11ea-a985-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00f80992-35f4-11ea-a985-bc764e2007e4;
 Mon, 13 Jan 2020 11:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578913270;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=c/JXaReP+KS0ZDIQjNJonf1oAOSBIfpo/2Qn+8o8oYI=;
 b=NTnhTDomohivgxru2Af0JIrBlehMO4USrAgzPwxG1BSRzjYmby8yj/ad
 3Cnx+1Y3IZuNIsKXjWlVVha9HQ6DpbtcY6pls7xEZUlL107EBxiWArz4m
 RLUc1eO2mDmpjil2whPlj/OnbLzpjZSbLRHuZmRYlFQVY3TRNyCUiIIYi w=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5gsUTWJYxP/9orlL7Yi5gske6hoNXTNHtS5fMWbD+yoc3SWylALFE7IpfnlR9Wwh8CyfBszeMQ
 gNe0qFczw+MZhxeZCRbc8HMuFDNs9Y0jCRH9tmbDj9zf/izVz8tn7z4lt6uRRJ3RHZdnVR44gm
 0t29PKf2cXJlb0jUgKjgNRiaNXPuaVbHpKbKvehKXQY5ci2QKv0qWRWbPC9Y/3vxzN+S1Qcsxe
 wUXoSOZZu8kgYsPBKowaCSzW6JbgfJXPj0YL9rNzaAfKx4foTy6iIYgtXtoX3yzvlWvWaxuTKK
 KfI=
X-SBRS: 2.7
X-MesageID: 10814571
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,428,1571716800"; d="scan'208";a="10814571"
To: Andrew Cooper <andrew.cooper3@citrix.com>, <xen-devel@lists.xen.org>
References: <20200110103723.29538-1-sergey.dyasli@citrix.com>
 <e79ec88a-8261-39e0-6c18-a1db5af85b6a@citrix.com>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <658f33a2-100a-d5dc-9435-191ab72b7db6@citrix.com>
Date: Mon, 13 Jan 2020 11:01:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <e79ec88a-8261-39e0-6c18-a1db5af85b6a@citrix.com>
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
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Doug
 Goldstein <cardoe@cardoe.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMDEvMjAyMCAxMTowMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMC8wMS8yMDIw
IDEwOjM3LCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+PiBIaWRlIHRoZSBmb2xsb3dpbmcgaW5mb3Jt
YXRpb24gdGhhdCBjYW4gaGVscCBpZGVudGlmeSB0aGUgcnVubmluZyBYZW4KPj4gYmluYXJ5IHZl
cnNpb246IFhFTlZFUl9leHRyYXZlcnNpb24sIFhFTlZFUl9jb21waWxlX2luZm8sIFhFTlZFUl9j
aGFuZ2VzZXQuCj4+IEFkZCBleHBsaWNpdCBjYXNlcyBmb3IgWEVOVkVSX2NvbW1hbmRsaW5lIGFu
ZCBYRU5WRVJfYnVpbGRfaWQgYXMgd2VsbC4KPj4KPj4gSW50cm9kdWNlIHhzbV9maWx0ZXJfZGVu
aWVkKCkgdG8gaHZtbG9hZGVyIHRvIHJlbW92ZSAiPGRlbmllZD4iIHN0cmluZwo+PiBmcm9tIGd1
ZXN0J3MgRE1JIHRhYmxlcyB0aGF0IG90aGVyd2lzZSB3b3VsZCBiZSBzaG93biBpbiB0b29scyBs
aWtlCj4+IGRtaWRlY29kZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IER5YXNsaSA8c2Vy
Z2V5LmR5YXNsaUBjaXRyaXguY29tPgo+PiAtLS0KPj4gdjEgLS0+IHYyOgo+PiAtIEFkZGVkIHhz
bV9maWx0ZXJfZGVuaWVkKCkgdG8gaHZtbG9hZGVyIGluc3RlYWQgb2YgbW9kaWZ5aW5nIHhlbl9k
ZW55KCkKPj4gLSBNYWRlIGJlaGF2aW91ciB0aGUgc2FtZSBmb3IgYm90aCBSZWxlYXNlIGFuZCBE
ZWJ1ZyBidWlsZHMKPj4gLSBYRU5WRVJfY2FwYWJpbGl0aWVzIGlzIG5vIGxvbmdlciBoaWRlZAo+
Pgo+PiBDQzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPj4gQ0M6
IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KPj4gQ0M6IElhbiBK
YWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+PiBDQzogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgo+PiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KPj4g
Q0M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPj4gQ0M6
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPj4gQ0M6IFdlaSBM
aXUgPHdsQHhlbi5vcmc+Cj4+IENDOiBEYW5pZWwgRGUgR3JhYWYgPGRnZGVncmFAdHljaG8ubnNh
Lmdvdj4KPgo+IEkgcmVhbGlzZSB0aGVyZSBhcmUgYXJndW1lbnRzIG92ZXIgaG93IHRvIGZpeCB0
aGlzLCBidXQgd2UgKHRoZSBYZW4KPiBjb21tdW5pdHkpIGhhdmUgYWxyZWFkeSBmKmNrZWQgdXAg
b25jZSBoZXJlLCBhbmQgdGhpcyBpcyBkb2luZyBzbyBhCj4gc2Vjb25kIHRpbWUuCj4KPiBOYWNr
Lgo+Cj4gRml4aW5nIGl0IGFueXdoZXJlIG90aGVyIHRoYW4gWGVuIGlzIHNpbXBseSBub3QgYXBw
cm9wcmlhdGUuCj4KPiBUaGUgcmVhc29uIGZvciB0aGlzICh3aGljaCBvdWdodCB0byBiZSBvYnZp
b3VzLCBidXQgSSBndWVzcyBvbmx5IHRvCj4gdGhvc2Ugd2hvIGFjdHVhbGx5IGRvIGN1c3RvbWVy
IHN1cHBvcnQpIGlzIGJhc2ljIGh1bWFuIHBoeXNpb2xvZ3kuCj4gImRlbmllZCIgbWVhbnMgc29t
ZXRoaW5nIGhhcyBnb25lIHdyb25nLiAgSXQgc2NhcmVzIHBlb3BsZSwgYW5kIGNhdXNlcwo+IHRo
ZW0gdG8gc2VlayBoZWxwIHRvIGNoYW5nZSBmaXggd2hhdGV2ZXIgaXMgYnJva2VuLgoKQnV0IHRo
ZSBwYXRjaCB0YWtlcyBjYXJlIG9mIHRoYXQgYnkgcmVtb3ZpbmcgImRlbmllZCIgZnJvbSBETUkg
dGFibGVzLgpGdW5jdGlvbmFsbHkgaXQgc2hvdWxkIGhhdmUgdGhlIHNhbWUgZWZmZWN0IGFzIHYx
IHRvIG9yZGluYXJ5IGd1ZXN0cy4KCj4gSXQgaXMgbm90IGFwcHJvcHJpYXRlIGZvciBpdCB0byBm
aW5kIGl0cyB3YXkgaW50byB0aGUgZ3Vlc3QgaW4gdGhlIGZpcnN0Cj4gcGxhY2UsIGFuZCB0aGF0
IGluY2x1ZGVzIHR1cm5pbmcgdXAgaW4gYGRtZXNnYCBhbmQgb3RoZXIgbG9ncywgYW5kCj4gZXhw
ZWN0aW5nIGd1ZXN0IHJ1bnRpbWUgdG8gZmlsdGVyIGZvciBpdCBpcyBjb21wbGV0ZSBub25zZW5z
ZS4KCmBkbWVzZ2Agd2lsbCBoYXZlIG9ubHkgWGVuIG1ham9yIHZlcnNpb24gKGUuZy4gWGVuIDQu
MTMpIHdpdGggdGhpcyBwYXRjaAphcHBsaWVkLiBFdmVuIGlmIHRoZXJlIGV4aXN0cyBhIHRvb2wg
d2hpY2ggdXNlcyB4ZW5fdmVyc2lvbiBoeXBlcmNhbGwKZm9yIGluZm9ybWF0aW9uIGdhdGhlcmlu
ZywgaXQgd291bGQgc2hvdyB5b3UgIjxkZW5pZWQ+IiBmb3IgZmllbGRzIGxpa2UKY29tbWFuZGxp
bmUgYW5kIGJ1aWxkX2lkIGFscmVhZHkgKHdpdGhvdXQgdGhlIHBhdGNoKS4gU28gZXh0ZW5kaW5n
IHRoaXMKYmVoYXZpb3VyIGZvciBvdGhlciBzZW5zaXRpdmUgZmllbGRzIGlzIG5vdCBhIHJlZ3Jl
c3Npb24gSU1ITy4KCj4gQXMgc2FpZCBzZXZlcmFsIHRpbWVzIGJlZm9yZSwgdGhlIGVtcHR5IHN0
cmluZyBpcyBjb21wbGV0ZWx5IGZpbmUgQUJJCj4gd2lzZSwgZG9lc24ndCBjb25mdXNlIGN1c3Rv
bWVycywgYW5kIHJlYWxseSByZWFsbHkgZG9lcyB3b3JrIGluIHByYWN0aWNlLgoKSSBhZ3JlZSB3
aXRoIHRoZSBvdGhlciBvcGluaW9uIHRoYXQgcmV0dXJuaW5nIGFuIGVtcHR5IHN0cmluZyBpcyB0
b28KYW1iaWd1b3VzLiBJJ2QgcHJlZmVyIHRvIHJldGFpbiB0aGUgY3VycmVudCBiZWhhdmlvdXIg
d2l0aCAod2hhdGV2ZXIpCm5vbi1lbXB0eSBkZXNjcmlwdGl2ZSBzdHJpbmcuCgotLQpUaGFua3Ms
ClNlcmdleQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
