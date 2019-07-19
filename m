Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDB36E408
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 12:13:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoPpx-0001tL-1p; Fri, 19 Jul 2019 10:10:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9kIP=VQ=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hoPpw-0001tG-C3
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 10:10:00 +0000
X-Inumbo-ID: 5c4f28b6-aa0d-11e9-b193-0bf225fbabc6
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c4f28b6-aa0d-11e9-b193-0bf225fbabc6;
 Fri, 19 Jul 2019 10:09:57 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aIvcDoP/0oD8BjNxjKp/cEJGTszpSSeV1veecSQSLbQeCQVfyeJ0X+CQDEOsplMlNK95PwRy9I
 cz1hUPhgMH7V+8zugLW6ehgRwKHh/j6XkoqAj2QezR2sUYI14jiIn35UCEjNztp/ywRbvnV2zT
 3JyMeJolEC3ah/2YmNwuEQppIjzDomwLZSTLdZcYCXcC/0L1hyFyvt97VBBDPoKd1jmFj+6GKy
 t2voY3wodLEVe08/EtKNGRothO2W0BDkmx3fSD0E4Hr4t8j3cTlKFoMpfITkKShcaf9Ru7chQ3
 5tY=
X-SBRS: 2.7
X-MesageID: 3283246
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,281,1559534400"; 
   d="scan'208";a="3283246"
To: Nicolas Belouin <nicolas.belouin@gandi.net>
References: <20190718215428.6727-1-george.dunlap@citrix.com>
 <854f62f4-000c-d090-320e-5097887e02b4@gandi.net>
 <643C0338-ACDB-4581-A16C-0DFCC22C7C07@citrix.com>
 <FBF82058-59FC-40B7-859C-A42D6756CC05@citrix.com>
 <3591522b-2724-61d5-3ab2-240f41a2e2ce@gandi.net>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <595cd2a7-382b-0800-c6de-096c2317d5d0@citrix.com>
Date: Fri, 19 Jul 2019 11:09:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <3591522b-2724-61d5-3ab2-240f41a2e2ce@gandi.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] golang/xenlight: Add libxl_utils support
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8xOS8xOSAxMTowMyBBTSwgTmljb2xhcyBCZWxvdWluIHdyb3RlOgo+IAo+IAo+IE9uIDcv
MTkvMTkgMTA6NTAgQU0sIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+Cj4+PiBPbiBKdWwgMTksIDIw
MTksIGF0IDk6NDcgQU0sIEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+Pgo+Pj4KPj4+Cj4+Pj4gT24gSnVsIDE5LCAyMDE5LCBhdCA4OjM0IEFNLCBOaWNv
bGFzIEJlbG91aW4gPG5pY29sYXMuYmVsb3VpbkBnYW5kaS5uZXQ+IHdyb3RlOgo+Pj4+Cj4+Pj4K
Pj4+Pgo+Pj4+IE9uIDcvMTgvMTkgMTE6NTQgUE0sIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+Pj4+
IFRoZSBHbyBiaW5kaW5ncyBmb3IgbGlieGwgbWlzcyBmdW5jdGlvbnMgZnJvbSBsaWJ4bF91dGls
cywgbGV0J3Mgc3RhcnQKPj4+Pj4gd2l0aCB0aGUgc2ltcGxlIGxpYnhsX2RvbWlkX3RvX25hbWUg
YW5kIGl0cyBjb3VudGVycGFydAo+Pj4+PiBsaWJ4bF9uYW1lX3RvX2RvbWlkLgo+Pj4+Pgo+Pj4+
PiBOQiB0aGF0IEMuR29TdHJpbmcoKSB3aWxsIHJldHVybiAiIiBpZiBpdCdzIHBhc3NlZCBhIE5V
TEw7IHNlZQo+Pj4+PiBodHRwczovL2dpdGh1Yi5jb20vZ29sYW5nL2dvL2lzc3Vlcy8zMjczNCNp
c3N1ZWNvbW1lbnQtNTA2ODM1NDMyCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IE5pY29sYXMg
QmVsb3VpbiA8bmljb2xhcy5iZWxvdWluQGdhbmRpLm5ldD4KPj4+Pj4gU2lnbmVkLW9mZi1ieTog
R2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgo+Pj4+PiAtLS0KPj4+Pj4g
djM6Cj4+Pj4+IC0gV2lyZSBpbnRvIGJ1aWxkIHN5c3RlbQo+Pj4+PiAtIEFkZCByZWZlcmVuY2Ug
dG8gQy5Hb1N0cmluZygpIGhhbmRsaW5nIE5VTEwgdG8gY29tbWl0IG1lc3NhZ2UKPj4+Pj4KPj4+
Pj4gTmljb2xhcywgY291bGQgeW91IHRlc3QgdG8gc2VlIGlmIHRoaXMgYWN0dWFsbHkgd29ya3Mg
Zm9yIHlvdT8KPj4+PiBUZXN0ZWQgaXQsIGl0IHdvcmtzLgo+Pj4+Cj4+Pj4gSSBtdXN0IGNvbmZl
c3MgSSBkbyBub3QgdXNlIHRoYXQgaW1wb3J0IHBhdGggYXMgdGhlIG5ldyBtb2R1bGVzIG1lY2hh
bmlzbQo+Pj4+IGludHJvZHVjZWQgaW4gR28xLjExIGRvd25sb2FkcyBhbmQgY29tcGlsZSBhIHZl
cnNpb25lZCBjb3B5IG9mIGV2ZXJ5Cj4+Pj4gZGVwZW5kZW5jeSBwZXIgcHJvamVjdCwgYW5kIHRo
aXMgYmVoYXZpb3IgaXMgaW5jb21wYXRpYmxlIHdpdGggdGhlIGJ1aWxkCj4+Pj4gc3lzdGVtIHVz
ZWQgaGVyZS4KPj4+IEl04oCZcyBwb3NzaWJsZSB0aGF0IHNvbWV0aGluZyBmdW5kYW1lbnRhbGx5
IGhhcyBjaGFuZ2VkLCBidXQgSSBzdXNwZWN0IHRoYXQgcmF0aGVyIHlvdSBkb27igJl0IHF1aXRl
IHVuZGVyc3RhbmQgaG93IHRoZSBjdXJyZW50IGJ1aWxkIHN5c3RlbSBpcyBzdXBwb3NlZCB0byB3
b3JrLiAgKEluIHdoaWNoIGNhc2UgYSB3cml0ZS11cCBpbiB0aGUgdHJlZSB3b3VsZCBwcm9iYWJs
eSBiZSB1c2VmdWwuKQo+Pj4KPj4+IEdvIGhhcyBhbHdheXMgaW5zaXN0ZWQgdGhhdCB0aGVyZSBi
ZSBubyBiaW5hcnkgY29tcGF0aWJpbGl0eSBiZXR3ZWVuIHZlcnNpb25zOyBzbyBpdOKAmXMgYWx3
YXlzIGJlZW4gbmVjZXNzYXJ5IHRvIHJlLWNvbXBpbGUgYWxsIHlvdXIgbGlicmFyaWVzIHdoZW4g
dXBncmFkaW5nIGZyb20gKHNheSkgMS44IHRvIDEuOS4gIFdoaWNoIG1lYW5zIHRoYXQgYW55IHVz
ZWFibGUgZGlzdHJpYnV0aW9uIG11c3QgYWxzbyBpbmNsdWRlIGFsbCB0aGUgc291cmNlIGZpbGVz
IG5lY2Vzc2FyeSB0byByZWNvbXBpbGUgd2hlbiB5b3UgYnVtcCB0aGUgdmVyc2lvbiBudW1iZXIu
Cj4+Pgo+Pj4gU28gdGhlIGNvcmUgbWVjaGFuaXNtIG9mIHRoZSDigJxpbnN0YWxs4oCdIGlzIGFj
dHVhbGx5IHRvIGNvcHkgYWxsIHRoZSBzb3VyY2UgZmlsZXMgbmVjZXNzYXJ5IGludG8gdGhlIHJp
Z2h0IGxvY2FsIGRpcmVjdG9yeSBzdWNoIHRoYXQgdGhlIGdvIGNvbXBpbGVyIGNhbiBmaW5kIHRo
ZW07IEFUTSB0aGlzIGlzIC91c3Ivc2hhcmUvZ29jb2RlL2dvbGFuZy54ZW5wcm9qZWN0Lm9yZy94
ZW5saWdodAo+PiBOaXQ6ICBUaGlzIG9mIGNvdXJzZSBzaG91bGQgaGF2ZSBhIGBzcmMvYCBiZXR3
ZWVuIGBnb2NvZGUvYCBhbmQgYGdvbGFuZy54ZW5wcm9qZWN0Lm9yZy9gLgo+Pgo+PiBOQiBhbHNv
IHRoYXQgdGhpcyBuYW1pbmcgc2NoZW1lIHdhcyBkZXNpZ25lZCBzbyB0aGF0IGF0IHNvbWUgcG9p
bnQgaW4gdGhlIGZ1dHVyZSwgd2UgY291bGQgYWN0dWFsbHkgaG9zdCB0aGUgeGVubGlnaHQgcGFj
a2FnZXMgYXQgdGhlIFVSTCBwcm92aWRlZC4KPj4KPj4gIC1HZW9yZ2UKPj4KPiAKPiBUaGlzIG5l
dyBtZWNoYW5pc20gb2YgbW9kdWxlcyBpcyBkZXNjcmliZWQgaGVyZToKPiBodHRwczovL2dvbGFu
Zy5vcmcvY21kL2dvLyNoZHItTW9kdWxlc19fbW9kdWxlX3ZlcnNpb25zX19hbmRfbW9yZQo+IAo+
IFRoZSBtb2R1bGUgc3lzdGVtIGlzIGludGVuZGVkIHRvIHN1cGVyc2VkZSB0aGUgR09QQVRIIGFw
cHJvYWNoIGFuZAo+IHByb3ZpZGUgYSB3YXkgdG8gZ2V0IHZlcnNpb25lZCBkZXBlbmRlbmNpZXMs
IGFzIHN1Y2gKPiBpdCBkb2VzIG5vdCByZWx5IG9uIEdPUEFUSCBhdCBhbGwgYW5kIGRvZXNuJ3Qg
dXNlIHNvdXJjZXMgb3IgY29tcGlsZWQKPiBwYWNrYWdlcyBwcmVzZW50IGluIEdPUEFUSCBlbGVt
ZW50cyBzdWNoIGFzIC91c3Ivc2hhcmUvZ29jb2RlCj4gYW5kIHN5c3RlbWF0aWNhbGx5IGZldGNo
IChhdCB0aGUgYXNrZWQgdmVyc2lvbikgYW5kIGNvbXBpbGUgYSBjb3B5IG9mCj4gdGhlIGRlcGVu
ZGVuY3kgYXMgaXQgbWlnaHQgYmUgYSBkaWZmZXJlbnQgdmVyc2lvbiBmcm9tIHRoZSBvbmUKPiBp
biBHT1BBVEguCj4gCj4gQXMgZmFyIGFzIEkgdHJpZWQsIEkgaGF2ZSBiZWVuIHVuYWJsZSB0byBi
dWlsZCBteSBtb2R1bGUgZXZlbiB3aXRoIHRoZQo+IGxpYnJhcnkgaW5zdGFsbGVkLgo+IEkgaGF2
ZSB0byB1c2UgeGVuYml0cy54ZW4ub3JnL2dpdC1odHRwL3hlbi5naXQvdG9vbHMvZ29sYW5nL3hl
bmxpZ2h0IChvcgo+IG9uZSBvZiBpdHMgbWlycm9yKSBpbiBvcmRlciB0byBidWlsZCB0aGUgbW9k
dWxlIHVzaW5nIHRoZSBuZXcKPiBtZWNoYW5pc20gKHRoZSBnb2xhbmcueGVucHJvamVjdC5vcmcv
eGVubGlnaHQgd29ya3Mgd2hlbiBidWlsZGluZyB3aXRoCj4gbW9kdWxlcyBtb2RlIGRpc2FibGVk
KS4KCkkgdG9vayBhIGxvb2sgYXQgdGhlIG1vZHVsZSBzdHVmZiB3aGVuIGl0IGNhbWUgb3V0LCBh
bmQgSSB3YXMgbmV2ZXIgYWJsZQp0byBtYWtlIHNlbnNlIG9mIGhvdyBpdCB3YXMgc3VwcG9zZWQg
dG8gd29yay4KCjxyYW50Pk9uIHRoZSB3aG9sZSwgaXQgc2VlbXMgdGhleSBiYXNpY2FsbHkgaGF0
ZSB0aGUgaWRlYSBvZiBkaXN0cm8KcGFja2FnZXMsIGFuZCBzZWVtIGludGVudCBvbiBicmVha2lu
ZyB0aGVtIHdoZW5ldmVyIHBlb3BsZSBtYW5hZ2UgdG8Kc3RhcnQgdG8gZ2V0IHRoZW0gd29ya2lu
Zy48L3JhbnQ+CgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
