Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE5F35F2F
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 16:26:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYWpn-0006Ta-TA; Wed, 05 Jun 2019 14:24:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hlgX=UE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hYWpm-0006T1-9a
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 14:24:10 +0000
X-Inumbo-ID: 9468720d-879d-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9468720d-879d-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 14:24:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8546EAE84;
 Wed,  5 Jun 2019 14:24:07 +0000 (UTC)
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <alpine.DEB.2.21.1905281546410.16734@sstabellini-ThinkPad-T480s>
 <4cfc2555-8933-b036-7068-470c388a665f@oracle.com>
 <alpine.DEB.2.21.1906031124300.14041@sstabellini-ThinkPad-T480s>
 <25ba38d9-3b9a-a748-714a-25ed207ce090@oracle.com>
 <alpine.DEB.2.21.1906040949090.14041@sstabellini-ThinkPad-T480s>
 <4e4bef15-3e0a-c4a3-7b82-ddadb687e684@oracle.com>
 <20190605141354.GA16635@char.us.oracle.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <9d5a5e02-842f-fd2e-1b85-dd8a68600704@suse.com>
Date: Wed, 5 Jun 2019 16:24:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605141354.GA16635@char.us.oracle.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2] xen/swiotlb: don't initialize swiotlb
 twice on arm64
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
Cc: xen-devel@lists.xenproject.org, Julien.Grall@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDYuMTkgMTY6MTMsIEtvbnJhZCBSemVzenV0ZWsgV2lsayB3cm90ZToKPiBPbiBUdWUs
IEp1biAwNCwgMjAxOSBhdCAwMzo0MTo0MFBNIC0wNDAwLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6
Cj4+IE9uIDYvNC8xOSAxMjo1MSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4gT24g
TW9uLCAzIEp1biAyMDE5LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+Pj4gT24gNi8zLzE5IDI6
MjUgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+Pj4gT24gVHVlLCAyOCBNYXkgMjAx
OSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+Pj4+Pj4gT24gNS8yOC8xOSA2OjQ4IFBNLCBTdGVm
YW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+Pj4+Pj4gRnJvbTogU3RlZmFubyBTdGFiZWxsaW5pIDxz
dGVmYW5vc0B4aWxpbnguY29tPgo+Pj4+Pj4+Cj4+Pj4+Pj4gT24gYXJtNjQgc3dpb3RsYiBpcyBv
ZnRlbiAobm90IGFsd2F5cykgYWxyZWFkeSBpbml0aWFsaXplZCBieSBtZW1faW5pdC4KPj4+Pj4+
PiBXZSBkb24ndCB3YW50IHRvIGluaXRpYWxpemUgaXQgdHdpY2UsIHdoaWNoIHdvdWxkIHRyaWdn
ZXIgYSBzZWNvbmQKPj4+Pj4+PiBtZW1vcnkgYWxsb2NhdGlvbi4gTW9yZW92ZXIsIHRoZSBzZWNv
bmQgbWVtb3J5IHBvb2wgaXMgdHlwaWNhbGx5IG1hZGUgb2YKPj4+Pj4+PiBoaWdoIHBhZ2VzIGFu
ZCBlbmRzIHVwIHJlcGxhY2luZyB0aGUgb3JpZ2luYWwgbWVtb3J5IHBvb2wgb2YgbG93IHBhZ2Vz
Lgo+Pj4+Pj4+IEFzIGEgc2lkZSBlZmZlY3Qgb2YgdGhpcyBjaGFuZ2UsIGl0IGlzIHBvc3NpYmxl
IHRvIGhhdmUgbG93IHBhZ2VzIGluCj4+Pj4+Pj4gc3dpb3RsYi14ZW4gb24gYXJtNjQuCj4+Pj4+
Pj4KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhp
bGlueC5jb20+Cj4+Pj4+PiBIYXMgdGhpcyBiZWVuIHRlc3RlZCBvbiB4ODY/Cj4+Pj4+IFllcywg
SSBtYW5hZ2VkIHRvIHRlc3QgaXQgdXNpbmcgUUVNVS4gVGhlcmUgYXJlIG5vIGVmZmVjdHMgb24g
eDg2LCBhcwo+Pj4+PiB0aGUgY2hlY2sgaW9fdGxiX3N0YXJ0ICE9IDAgcmV0dXJucyBmYWxzZS4K
Pj4+PiBJIHdvbmRlciB0aG91Z2ggd2hldGhlciB0aGlzIGlzIGFsd2F5cyB0aGUgY2FzZS7CoCBX
aGVuIHdlIGFyZSBjYWxsZWQKPj4+PiBmcm9tIHBjaV94ZW5fc3dpb3RsYl9pbml0X2xhdGUoKSBm
b3IgZXhhbXBsZS4KPj4+IEluIHRoYXQgY2FzZSwgcGNpX3hlbl9zd2lvdGxiX2luaXRfbGF0ZSgp
IGlzIGNhbGxlZCBieQo+Pj4gcGNpZnJvbnRfY29ubmVjdF9hbmRfaW5pdF9kbWEsIHdoaWNoIGRv
ZXM6Cj4+Pgo+Pj4gCWlmICghZXJyICYmICFzd2lvdGxiX25yX3RibCgpKSB7Cj4+PiAJCWVyciA9
IHBjaV94ZW5fc3dpb3RsYl9pbml0X2xhdGUoKTsKPj4+IAkJaWYgKGVycikKPj4+IAkJCWRldl9l
cnIoJnBkZXYtPnhkZXYtPmRldiwgIkNvdWxkIG5vdCBzZXR1cCBTV0lPVExCIVxuIik7Cj4+PiAJ
fQo+Pj4KPj4+IHBjaV94ZW5fc3dpb3RsYl9pbml0X2xhdGUoKSBpcyBvbmx5IGNhbGxlZCB3aGVu
IHN3aW90bGJfbnJfdGJsKCkgcmV0dXJucwo+Pj4gMC4gSWYgc3dpb3RsYl9ucl90YmwoKSByZXR1
cm5zIDAsIGNlcnRhaW5seSB0aGUgc3dpb3RsYiBoYXMgbm90IGJlZW4KPj4+IGFsbG9jYXRlZCB5
ZXQsIGFuZCB0aGUgaW9fdGxiX3N0YXJ0ICE9IDAgY2hlY2sgYXQgdGhlIGJlZ2lubmluZyBvZgo+
Pj4geGVuX3N3aW90bGJfaW5pdCB3aWxsIGFsc28gZmFpbC4gVGhlIGNvZGUgd2lsbCB0YWtlIHRo
ZSBub3JtYWwKPj4+IHJvdXRlLCBzYW1lIGFzIHRvZGF5LiBJbiBzaG9ydCwgdGhlcmUgc2hvdWxk
IGJlIG5vIGVmZmVjdHMgb24geDg2Lgo+Pgo+Pgo+PiBPSywgdGhhbmtzLgo+Pgo+PiBSZXZpZXdl
ZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KPiAKPiBQ
dXNoZWQgaW4gZGV2ZWwvZm9yLWxpbnVzLTUuMiBhbmQgd2lsbCBldmVudHVhbGx5IG1vdmUgaXQg
dG8gc3RhYmxlIGFuZCBwdXNoIHRvIExpbnVzIG5leHQtd2Vlay4KPiAKPiBBcmUgdGhlcmUgYW55
IG90aGVyIHBhdGNoZXMgSSBzaG91bGQgcGljayB1cD8KPiAKCkkgdGhpbmsgYXQgbGVhc3QgdGhl
IGZpcnN0IHR3byBwYXRjaGVzIGZyb20gbXkgc2VyaWVzOgoKaHR0cHM6Ly9wYXRjaGV3Lm9yZy9Y
ZW4vMjAxOTA1MjkwOTA0MDcuMTIyNS0xLWpncm9zc0BzdXNlLmNvbS8KCmFyZSByZWFkeSB0byBn
byBpbi4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
