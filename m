Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D71CFDE36
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 13:44:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVavw-0000xS-6C; Fri, 15 Nov 2019 12:42:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bLue=ZH=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iVavu-0000xG-Gp
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 12:42:38 +0000
X-Inumbo-ID: 672c9d54-07a5-11ea-b678-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 672c9d54-07a5-11ea-b678-bc764e2007e4;
 Fri, 15 Nov 2019 12:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573821758;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=cR1WHk0SWfMCTCACw43XYxGYZXWJ8QdHQo+I2joFNxU=;
 b=FuFZ7lIaFINm4y5/tF7L9fKrjvHS6WKD4G9+5PuCzNDIslutz2PG67Q8
 +cPuA6vQHo2/71doX3SUNwH+1NnJw5Dk/m08dYJMscDalUqbgvm8yg6Ye
 rt/Qb9RuGC4+Mu472IgbpdAEf9wvwWY92vlM+bqHKItg5V1mWuGm0FbJ/ A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kC0rW+sPeESfnUotrEZwgxwinO6++oCV0hyEHum0I+lf0qaOflgva/KAABfyfPvD/CA0rGKDgX
 RJUHMP/e9EJHVsyV7rIlUr6ZA9ui0C2uGXmDG1NeOU3t6/G6oOoqCLFSXUBVUKkxvHdRoEhXAM
 KDqeVnX0CBmYGy9rLoBoK95sMl5tmesK/ypJQ2PYbjzkVA2zKgbuYXMNVllyPHnuR7C/uo0JzB
 bIbOAriirxDScndvJnvcRH78HsqIm2lrCrHAcma+rA69AmOmgbVgE/REyvoagCXC+eYqQHQhl8
 4xQ=
X-SBRS: 2.7
X-MesageID: 8381844
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; 
   d="scan'208";a="8381844"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 <xen-devel@lists.xenproject.org>
References: <20191115105739.20333-1-george.dunlap@citrix.com>
 <eff4cd42-fb53-9e26-050f-6e1c5225613d@suse.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <af754aa9-4fdd-b4b6-bc71-e0db4708970d@citrix.com>
Date: Fri, 15 Nov 2019 12:42:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <eff4cd42-fb53-9e26-050f-6e1c5225613d@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC] x86: Add hack to disable "Fake HT" mode
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
Cc: Steven Haigh <netwiz@crc.id.au>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Andreas Kinzler <hfp@posteo.de>, Jan Beulich <jbeulich@suse.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMTUvMTkgMTI6MjMgUE0sIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4gT24gMTUuMTEuMTkg
MTE6NTcsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+IENoYW5nZXNldCBjYTJlZWU5MmRmNDQgKCJ4
ODYsIGh2bTogRXhwb3NlIGhvc3QgY29yZS9IVCB0b3BvbG9neSB0byBIVk0KPj4gZ3Vlc3RzIikg
YXR0ZW1wdGVkIHRvICJmYWtlIHVwIiBhIHRvcG9sb2d5IHdoaWNoIHdvdWxkIGluZHVjZSBndWVz
dAo+PiBvcGVyYXRpbmcgc3lzdGVtcyB0byBub3QgdHJlYXQgdmNwdXMgYXMgc2libGluZyBoeXBl
cnRocmVhZHMuwqAgVGhpcwo+PiBpbnZvbHZlZCAoYW1vbmcgb3RoZXIgdGhpbmdzKSBhY3R1YWxs
eSByZXBvcnRpbmcgaHlwZXJ0aHJlYWRpbmcgYXMKPj4gYXZhaWxhYmxlLCBidXQgZ2l2aW5nIHZj
cHVzIGV2ZXJ5IG90aGVyIEFQSUNJRC7CoCBUaGUgcmVzdWx0aW5nIGNwdQo+PiBmZWF0dXJlc2V0
IGlzIGludmFsaWQsIGJ1dCBtb3N0IG9wZXJhdGluZyBzeXN0ZW1zIG9uIG1vc3QgaGFyZHdhcmUK
Pj4gbWFuYWdlZCB0byBjb3BlIHdpdGggaXQuCj4+Cj4+IFVuZm9ydHVuYXRlbHksIFdpbmRvd3Mg
cnVubmluZyBvbiBtb2Rlcm4gQU1EIGhhcmR3YXJlIC0tIGluY2x1ZGluZwo+PiBSeXplbiAzeHh4
IHNlcmllcyBwcm9jZXNzb3JzLCBhbmQgcmVwb3J0ZWRseSBFUFlDICJSb21lIiBjcHVzIC0tIGdl
dHMKPj4gY29uZnVzZWQgYnkgdGhlIHJlc3VsdGluZyBjb250cmFkaWN0b3J5IGZlYXR1cmUgYml0
cyBhbmQgY3Jhc2hlcwo+PiBkdXJpbmcgaW5zdGFsbGF0aW9uLsKgIChMaW51eCBndWVzdHMgaGF2
ZSBzbyBmYXIgY29udGludWVkIHRvIGNvcGUuKQo+Pgo+PiBBICJwcm9wZXIiIGZpeCBpcyBjb21w
bGljYXRlZCBhbmQgaXQncyB0b28gbGF0ZSB0byBmaXggaXQgZWl0aGVyIGZvcgo+PiA0LjEzLCBv
ciB0byBiYWNrcG9ydCB0byBzdXBwb3J0ZWQgYnJhbmNoZXMuwqAgQXMgYSBzaG9ydC10ZXJtIGZp
eCwKPj4gaW1wbGVtZW50IGFuIG9wdGlvbiB0byBkaXNhYmxlIHRoaXMgIkZha2UgSFQiIG1vZGUu
wqAgVGhlIHJlc3VsdGluZwo+PiB0b3BvbG9neSByZXBvcnRlZCB3aWxsIG5vdCBiZSBjYW5vbmlj
YWwsIGJ1dCBleHBlcmltZW50YWxseSBjb250aW51ZXMKPj4gdG8gd29yayB3aXRoIFdpbmRvd3Mg
Z3Vlc3RzLgo+Pgo+PiBIb3dldmVyLCBkaXNhYmxpbmcgdGhpcyAiRmFrZSBIVCIgbW9kZSBoYXMg
bm90IGJlZW4gd2lkZWx5IHRlc3RlZCwgYW5kCj4+IHdpbGwgYWxtb3N0IGNlcnRhaW5seSBicmVh
ayBtaWdyYXRpb24gaWYgYXBwbGllZCBpbmNvbnNpc3RlbnRseS4KPj4KPj4gVG8gbWluaW1pemUg
aW1wYWN0IHdoaWxlIGFsbG93aW5nIGFkbWluaXN0cmF0b3JzIHRvIGRpc2FibGUgIkZha2UgSFQi
Cj4+IG9ubHkgb24gZ3Vlc3RzIHdoaWNoIGFyZSBrbm93biBub3QgdG8gd29yayB3aXRob3V0IGl0
IChpLmUuLCBXaW5kb3dzCj4+IGd1ZXN0cykgb24gYWZmZWN0ZWQgaGFyZHdhcmUsIGFkZCBhbiBl
bnZpcm9ubWVudCB2YXJpYWJsZSB3aGljaCBjYW4gYmUKPj4gc2V0IHRvIGRpc2FibGUgdGhlICJG
YWtlIEhUIiBtb2RlIG9uIHN1Y2ggaGFyZHdhcmUuCj4gCj4gSG1tLCBob3cgaXMgdGhpcyBnb2lu
ZyB0byB3b3JrIHdpdGggbGlidmlydD8gQUZBSUsgbGlidmlydGQgcnVubmluZyBhcwo+IGEgc2lu
Z2xlIHByb2Nlc3MgaXMgY3JlYXRpbmcgYWxsIGd1ZXN0cy4gU28gd2l0aCB0aGlzIGFwcHJvYWNo
IHlvdSdkCj4gZWl0aGVyIG5vdCBiZSBhYmxlIHRvIHVzZSBsaWJ2aXJ0ZCwgb3IgeW91J2QgaGF2
ZSB0byBkaXNhYmxlICJGYWtlIEhUIgo+IGZvciBhbGwgZ3Vlc3RzLCBwcm9iYWJseSBieSBtb2Rp
ZnlpbmcgdGhlIGxpYnZpcnRkIHNlcnZpY2UgZGVmaW5pdGlvbi4KCklmIHdlIHdlbnQgdGhlIGN1
cnJlbnQgcm91dGUsIHllcywgdGhhdCdzIHdoYXQgd291bGQgbmVlZCB0byBiZSBkb25lLgpBbnl0
aGluZyBlbHNlIHdvdWxkIHJlcXVpcmUgY2hhbmdpbmcgdGhlIGludGVyZmFjZSwgd2hpY2ggd291
bGQgcmVxdWlyZQpjaGFuZ2VzIHRvIGxpYnZpcnQgYW55d2F5LgoKPj4gUmVwb3J0ZWQtYnk6IFN0
ZXZlbiBIYWlnaCA8bmV0d2l6QGNyYy5pZC5hdT4KPj4gUmVwb3J0ZWQtYnk6IEFuZHJlYXMgS2lu
emxlciA8aGZwQHBvc3Rlby5kZT4KPj4gU2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxhcCA8Z2Vv
cmdlLmR1bmxhcEBjaXRyaXguY29tPgo+PiAtLS0KPj4gVGhpcyBoYXMgYmVlbiBjb21waWxlLXRl
c3RlZCBvbmx5OyBJJ20gcG9zdGluZyBpdCBlYXJseSB0byBnZXQKPj4gZmVlZGJhY2sgb24gdGhl
IGFwcHJvYWNoLgo+Pgo+PiBUT0RPOiBQcmV2ZW50IHN1Y2ggZ3Vlc3RzIGZyb20gYmVpbmcgbWln
cmF0ZWQKPj4KPj4gT3BlbiBxdWVzdGlvbnM6Cj4+Cj4+IC0gSXMgdGhpcyB0aGUgcmlnaHQgcGxh
Y2UgdG8gcHV0IHRoZSBgZ2V0ZW52YCBjaGVjaz8KPj4KPj4gLSBJcyB0aGVyZSBhbnkgd2F5IHdl
IGNhbiBtYWtlIG1pZ3JhdGlvbiB3b3JrLCBhdCBsZWFzdCBpbiBzb21lIGNhc2VzPwo+Pgo+PiAt
IENhbiB3ZSBjaGVjayBmb3Iga25vd24tcHJvYmxlbWF0aWMgbW9kZWxzLCBhbmQgYXQgbGVhc3Qg
cmVwb3J0IGEKPj4gwqDCoCBtb3JlIHVzZWZ1bCBlcnJvcj8KPiAKPiBDYW4ndCB3ZSBqdXN0IGRp
c2FibGUgIkZha2UgSFQiIGF1dG9tYXRpY2FsbHkgb24gdGhvc2UgbW9kZWxzPyBUaGlzCj4gd291
bGQgYXV0b21hZ2ljYWxseSBtYWtlIG1pZ3JhdGlvbiB3b3JrLCB0b28uCgpXaGF0IGlmIHNvbWVv
bmUgaXMgdXNpbmcgb25seSBMaW51eCBndWVzdHMgb24gYSBSeXplbiAzeHh4IGJveCB3aXRoCjQu
MTIuMT8gIElmIHRoZXkgbmFpdmVseSB1cGRhdGUgdG8gNC4xMyB3aXRob3V0IGdvaW5nIHRocm91
Z2ggYSB2ZXJzaW9uCnRoYXQgaGFzIHRoaXMgYmFja3BvcnQsIHRoZXknbGwgZ2V0IHRoZSB3cm9u
ZyBDUFVpZCBvbiB0aGUgcmVjZWl2aW5nCnNpZGUgYW5kIG1pZ3JhdGlvbiB3aWxsIGZhaWwuCgpU
aGVyZSB3YXMgYWxzbyBjb25jZXJuIGFib3V0IGRpc2FibGluZyB0aGUgIkZha2UgSFQiIGFjcm9z
cyB0aGUgYm9hcmQgb24KdGhlIGFmZmVjdGVkIENQVXMgLS0gaXQgaGFzbid0IGJlZW4gd2VsbC10
ZXN0ZWQgb24gTGludXgsIGFuZCBzbyBpdCdzCm5vdCBjbGVhciB3aGV0aGVyIHRoZXJlIHdpbGwg
YmUgaXNzdWVzIG9yIG5vdC4gIChJZiB0aGlzIHdhcyBjaGVja2VkIGluCmJhY2sgaW4gSnVuZSBp
dCB3b3VsZCBiZSBhIGRpZmZlcmVudCBtYXR0ZXIuKQoKIC1HZW9yZ2UKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
