Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B7518CCA8
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 12:20:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFFfL-0007kw-PT; Fri, 20 Mar 2020 11:18:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sjin=5F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jFFfK-0007kp-Pr
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 11:18:14 +0000
X-Inumbo-ID: 7c53f4fc-6a9c-11ea-bd28-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c53f4fc-6a9c-11ea-bd28-12813bfff9fa;
 Fri, 20 Mar 2020 11:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584703092;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RDnYTMijHNJ+p8cS6TNhIAMMPcnqq3ig0zDhOdFMnwo=;
 b=da5bEynvQfWlD5WOapDKbA742HvXZIC9GnlXuhneEJMdy75tA27fm+8/
 4CB+usXNdBmwnn0TtkZuzEitilUVRYq9pW0sVn5iw9a2arYHubtp92Dhr
 Ei5H4Il71/ai/8g6mtGMe2AGG2ZRPNP/JHSXD+v961tDAFuRrd6HL07Tf w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vBEISOabAXRJaAY/W2RWGt64M4Kr/efYf9WEGThwByvG6bIb940erPEff2x2FB1B2fDBaM5xuT
 /mNycNLO83gezT/vJMoYrNn3iZfoBQ3YCrunUOaAhw81p5kSt+EUfSUiXEt2pjRDHA7Yca+XK+
 9QNdjkEB3+lUuixPAzn8Fn1mLZi8bmOT6QmIFMhsPlZdgzkXtM1+HY2YZ1sZfZZzWCVDe2wIyW
 jsRQu41I2TrPUEdpYDFhPl4r96AWmZK+rYxODtLFFP4CIxCztJPkftVO/EjDB3sQ/7GVUCTZc/
 HGQ=
X-SBRS: 2.7
X-MesageID: 14679215
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,284,1580792400"; d="scan'208";a="14679215"
Date: Fri, 20 Mar 2020 12:18:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200320111804.GW24458@Air-de-Roger.citrite.net>
References: <20200319184305.GR24458@Air-de-Roger.citrite.net>
 <910d5530-893d-9401-46f6-4da22a400ce4@xen.org>
 <1fc54578-2b48-a713-f216-0c6fda205c9a@suse.com>
 <20200320090155.GS24458@Air-de-Roger.citrite.net>
 <75d1fe33-2ccd-234d-8bcf-5a167cf4145f@xen.org>
 <20200320094214.GT24458@Air-de-Roger.citrite.net>
 <20200320100033.GU24458@Air-de-Roger.citrite.net>
 <98a586a1-24e4-2839-270c-49dde5ed0cbf@xen.org>
 <20200320102422.GV24458@Air-de-Roger.citrite.net>
 <93c0f6c4-ac3b-0748-0f44-23c8d683f0c3@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <93c0f6c4-ac3b-0748-0f44-23c8d683f0c3@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v7 1/3] x86/tlb: introduce a flush HVM ASIDs
 flag
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>, Jan
 Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXIgMjAsIDIwMjAgYXQgMTA6MzY6NDlBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpLAo+IAo+IE9uIDIwLzAzLzIwMjAgMTA6MjQsIFJvZ2VyIFBhdSBNb25uw6kgd3Jv
dGU6Cj4gPiBPbiBGcmksIE1hciAyMCwgMjAyMCBhdCAxMDowODozM0FNICswMDAwLCBKdWxpZW4g
R3JhbGwgd3JvdGU6Cj4gPiA+IEhpLAo+ID4gPiAKPiA+ID4gT24gMjAvMDMvMjAyMCAxMDowMCwg
Um9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gPiBPbiBGcmksIE1hciAyMCwgMjAyMCBhdCAx
MDo0MjoxNEFNICswMTAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4gPiA+ID4gT24gRnJp
LCBNYXIgMjAsIDIwMjAgYXQgMDk6MTI6MTZBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+
ID4gPiA+ID4gPiBIaSBSb2dlciwKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IE9uIDIwLzAzLzIw
MjAgMDk6MDEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gT24gRnJpLCBN
YXIgMjAsIDIwMjAgYXQgMDg6MjE6MTlBTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiA+
ID4gPiA+ID4gPiBPbiAxOS4wMy4yMDIwIDIwOjA3LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+
ID4gPiA+ID4gPiA+IEhpLAo+ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gT24g
MTkvMDMvMjAyMCAxODo0MywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gPiA+ID4gPiA+
ID4gPiBPbiBUaHUsIE1hciAxOSwgMjAyMCBhdCAwNjowNzo0NFBNICswMDAwLCBKdWxpZW4gR3Jh
bGwgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gT24gMTkvMDMvMjAyMCAxNzozOCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gT24gVGh1LCBNYXIgMTksIDIwMjAgYXQg
MDQ6MjE6MjNQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gPiAgICDCoCA+PiBXaHkgY2FuJ3QgeW91IGtlZXAgZmx1c2hfdGxiX21hc2soKSBoZXJlPwo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gQmVjYXVzZSBm
aWx0ZXJlZF9mbHVzaF90bGJfbWFzayBpcyB1c2VkIGluIHBvcHVsYXRlX3BoeXNtYXAsIGFuZAo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBjaGFuZ2VzIHRvIHRoZSBwaHltYXAgcmVxdWlyZSBhbiBB
U0lEIGZsdXNoIG9uIEFNRCBoYXJkd2FyZS4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gSSBhbSBhZnJhaWQgdGhpcyBkb2VzIG5vdCB5ZXQgZXhwbGFpbiBtZSB3
aHkgZmx1c2hfdGxiX21hc2soKSBjb3VsZCBub3QgYmUKPiA+ID4gPiA+ID4gPiA+ID4gPiA+IHVw
ZGF0ZWQgc28gaXQgZmx1c2ggdGhlIEFTSUQgb24gQU1EIGhhcmR3YXJlLgo+ID4gPiA+ID4gPiA+
ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gPiA+IEN1cnJlbnQgYmVoYXZpb3IgcHJldmlvdXMgdG8g
dGhpcyBwYXRjaCBpcyB0byBmbHVzaCB0aGUgQVNJRHMgb24KPiA+ID4gPiA+ID4gPiA+ID4gPiBl
dmVyeSBUTEIgZmx1c2guCj4gPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+ID4g
Zmx1c2hfdGxiX21hc2sgaXMgdG9vIHdpZGVseSB1c2VkIG9uIHg4NiBpbiBwbGFjZXMgd2hlcmUg
dGhlcmUncyBubwo+ID4gPiA+ID4gPiA+ID4gPiA+IG5lZWQgdG8gZmx1c2ggdGhlIEFTSURzLiBU
aGlzIHByZXZlbnRzIHVzaW5nIGFzc2lzdGVkIGZsdXNoZXMgKGJ5IEwwKQo+ID4gPiA+ID4gPiA+
ID4gPiA+IHdoZW4gcnVubmluZyBuZXN0ZWQsIHNpbmNlIHRob3NlIGFzc2lzdGVkIGZsdXNoZXMg
cGVyZm9ybWVkIGJ5IEwwCj4gPiA+ID4gPiA+ID4gPiA+ID4gZG9uJ3QgZmx1c2ggdGhlIEwyIGd1
ZXN0cyBUTEJzLgo+ID4gPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gPiA+IEkgY291
bGQga2VlcCBjdXJyZW50IGJlaGF2aW9yIGFuZCBsZWF2ZSBmbHVzaF90bGJfbWFzayBhbHNvIGZs
dXNoaW5nIHRoZQo+ID4gPiA+ID4gPiA+ID4gPiA+IEFTSURzLCBidXQgdGhhdCBzZWVtcyB3cm9u
ZyBhcyB0aGUgZnVuY3Rpb24gZG9lc24ndCBoYXZlIGFueXRoaW5nIGluCj4gPiA+ID4gPiA+ID4g
PiA+ID4gaXQncyBuYW1lIHRoYXQgc3VnZ2VzdHMgaXQgYWxzbyBmbHVzaGVzIHRoZSBpbi1ndWVz
dCBUTEJzIGZvciBIVk0uCj4gPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gPiBJIGFn
cmVlIHRoZSBuYW1lIGlzIGNvbmZ1c2luZywgSSBoYWQgdG8gbG9vayBhdCB0aGUgaW1wbGVtZW50
YXRpb24gdG8gdW5kZXJzdGFuZCB3aGF0IGl0IGRvZXMuCj4gPiA+ID4gPiA+ID4gPiA+IAo+ID4g
PiA+ID4gPiA+ID4gPiBIb3cgYWJvdXQgcmVuYW1pbmcgKG9yIGludHJvZHVjaW5nKSB0aGUgZnVu
Y3Rpb24gdG8gZmx1c2hfdGxiX2FsbF9ndWVzdHNfbWFzaygpIG9yIGZsdXNoX3RsYl9hbGxfZ3Vl
c3RzX2NwdW1hc2soKSkgPwo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBBbmQgdGhp
cyB3b3VsZCB0aGVuIGZsdXNoIF9vbmx5XyBndWVzdCBUTEJzPwo+ID4gPiA+ID4gPiA+IAo+ID4g
PiA+ID4gPiA+IE5vLCBJIHRoaW5rIGZyb20gSnVsaWVuJ3MgcHJvcG9zYWwgKGlmIEkgdW5kZXJz
dG9vZCBpdCBjb3JyZWN0bHkpCj4gPiA+ID4gPiA+ID4gZmx1c2hfdGxiX2FsbF9ndWVzdHNfbWFz
ayB3b3VsZCBkbyB3aGF0IGZsdXNoX3RsYl9tYXNrIGN1cnJlbnRseSBkb2VzCj4gPiA+ID4gPiA+
ID4gcHJldmlvdXMgdG8gdGhpcyBwYXRjaCAoZmx1c2ggWGVuJ3MgVExCcyArIEhWTSBBU0lEcyku
Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBJdCBsb29rcyBsaWtlIHRoZXJlIG1pZ2h0IGJlIGNv
bmZ1c2lvbiBvbiB3aGF0ICJndWVzdCBUTEJzIiBtZWFucy4gSW4gbXkKPiA+ID4gPiA+ID4gdmll
dyB0aGlzIG1lYW5zIGFueSBUTEJzIGFzc29jaWF0ZWQgZGlyZWN0bHkgb3IgaW5kaXJlY3RseSB3
aXRoIHRoZSBndWVzdC4KPiA+ID4gPiA+ID4gT24gQXJtLCB0aGlzIHdvdWxkIGJlIG51a2U6Cj4g
PiA+ID4gPiA+ICAgICAgLSBndWVzdCB2aXJ0dWFsIGFkZHJlc3MgLT4gZ3Vlc3QgcGh5c2ljYWwg
YWRkcmVzcyBUTEIgZW50cnkKPiA+ID4gPiA+ID4gICAgICAtIGd1ZXN0IHBoeXNpY2FsIGFkZHJl
c3MgLT4gaG9zdCBwaHlzaWNhbCBhZGRyZXNzIFRMQiBlbnRyeQo+ID4gPiA+ID4gPiAgICAgIC0g
Z3Vlc3QgdmlydHVhbCBhZGRyZXNzIC0+IGhvc3QgcGh5c2ljYWwgYWRkcmVzcyBUTEIgZW50cnkK
PiA+ID4gPiA+IAo+ID4gPiA+ID4gQUZBSUNUIEFTSUQgZmx1c2ggb24gQU1EIGhhcmR3YXJlIHdp
bGwgZmx1c2ggYW55IG9mIHRoZSBhYm92ZSwgd2hpbGUKPiA+ID4gPiA+IFZQSUQgZmx1c2ggb24g
SW50ZWwgd2lsbCBvbmx5IGZsdXNoIHRoZSBmaXJzdCBpdGVtIChndWVzdCBsaW5lYXIgdG8KPiA+
ID4gPiAKPiA+ID4gPiBTb3JyeSwgZG9pbmcgdG9vIG1hbnkgdGhpbmdzIGF0IHRoZSBzYW1lIHRp
bWUuIE9uIEludGVsIFZQSUQgZmx1c2hlcwo+ID4gPiA+IHdpbGwgZ2V0IHJpZCBvZiBndWVzdCB2
aXJ0dWFsIHRvIGd1ZXN0IHBoeXNpY2FsIG9yIGhvc3QgcGh5c2ljYWwsIGJ1dAo+ID4gPiA+IG5v
dCBvZiBndWVzdCBwaHlzaWNhbCB0byBob3N0IHBoeXNpY2FsLCB5b3UgbmVlZCBhbiBFUFQgZmx1
c2ggdG8KPiA+ID4gPiBhY2NvbXBsaXNoIHRoYXQuCj4gPiA+IEFyZSB5b3Ugc3VnZ2VzdGluZyB0
aGF0IG9uIHg4NiwgZmx1c2hfdGxiX21hc2soKSB3b3VsZCBub3QgbnVrZSB0aGUgZ3Vlc3QKPiA+
ID4gcGh5c2ljYWwgdG8gaG9zdCBwaHlzaWNhbCBlbnRyaWVzPyBJZiBzbywgaG93IGlzIGl0IG1l
YW50IHRvIGJlIHNhZmU/Cj4gPiAKPiA+IFlvdSBpc3N1ZSBFUFQgZmx1c2hlcyBpbiB0aGF0IGNh
c2Ugd2hlbiBhbiBFUFQgbW9kaWZpY2F0aW9uIGlzCj4gPiBwZXJmb3JtZWQuCj4gCj4gSSBhbSBn
ZXR0aW5nIG1vcmUgYW5kIG1vcmUgY29uZnVzZWQgd2l0aCB0aGUgZ29hbCBvZiBmbHVzaF90bGJf
bWFzaygpIGluCj4gY29tbW9uIGNvZGUuCj4gCj4gTG9va2luZyBhdCB0aGUgQXJtIGNvZGUsIHRo
ZSBQMk0gY29kZSBzaG91bGQgYWxyZWFkeSBmbHVzaCBhcHByb3ByaWF0bHkgdGhlCj4gZ3Vlc3Qg
VExCcyBiZWZvcmUgZ2l2aW5nIGJhY2sgYSBwYWdlIHRvIHRoZSBhbGxvY2F0b3IuCj4gCj4gU28g
d2hhdCBhcmUgd2UgdHJ5aW5nIHRvIHByb3RlY3QgYWdhaW5zdCB3aXRoIHRoZSBjYWxsIG9mIGZs
dXNoX3RsYl9tYXNrKCk/CgpTbyBvbiB4ODYgdGhlcmUgYXJlIHR3byBjb21wbGV0ZWx5IGRpZmZl
cmVudCBuZXN0ZWQgcGFnZSB0YWJsZQp0ZWNobm9sb2dpZXMsIE5QVCBmcm9tIEFNRCBhbmQgRVBU
IGZyb20gSW50ZWwuIEVQVCBkb2Vzbid0IHJlcXVpcmUgYQpWUElEIGZsdXNoIHdoZW4gbW9kaWZ5
aW5nIHRoZSBuZXN0ZWQgcGFnZSB0YWJsZXMgKGl0IHJlcXVpcmVzIGFuIEVQVApmbHVzaCksIE9U
T0ggQU1EIE5QVCByZXF1aXJlcyBhbiBBU0lEIGZsdXNoIHdoZW4gbW9kaWZ5aW5nIHRoZSB0YWJs
ZXMsCmFuZCB0aGlzIHNlZW1zIHRvIGJlIGltcGxlbWVudGVkIGluIGNvbW1vbiBjb2RlIGZvciBw
b3B1bGF0ZV9waHlzbWFwLgoKT24geDg2IHBvcHVsYXRlX3BoeXNtYXAgY291bGQgYWxzbyBnZXQg
cmlkIG9mIHRoZSBmbHVzaCwgc2luY2UgdGhlIE5QVApjb2RlIGFscmVhZHkgcGVyZm9ybXMgYW4g
QVNJRCBmbHVzaCB3aGVuIG1vZGlmeWluZyBhIG5lc3RlZCBwYWdlIHRhYmxlCmVudHJ5LCBidXQg
dGhhdCdzIHBhcnQgb2YgYW5vdGhlciBwYXRjaC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
