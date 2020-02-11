Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4611598E2
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 19:41:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1aRm-0008AY-SJ; Tue, 11 Feb 2020 18:39:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0zdE=37=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j1aRm-00089z-4e
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 18:39:46 +0000
X-Inumbo-ID: df685feb-4cfd-11ea-b61d-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df685feb-4cfd-11ea-b61d-12813bfff9fa;
 Tue, 11 Feb 2020 18:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581446384;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=OOZ6ETFSVmbaWuplDjSipueOACchZhqx5ziFzO1Nw8Y=;
 b=AxAK9dvYDY1EwS3803X5eh+enL7yEuXJ6skb8OxIM47ePDd69xrSyZ/s
 MDaztzpEzoivxwO89n5NeV06GnSmlEkF2AJ7RMP/RcJsqDlKvJpVlGkBt
 TlBxTjF9ROr8zy2Y4OChSOSyjj9pmtn967MUP6dM8jeAtBKiPQHnfptDV 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SuVKUo5sQhbG1d/AQVrlGV6nr/vuG5MUXM6u+PTSCJyY2yx3hMtRPjGQD6l2chDE4KgNWD2U6t
 XAO70LQUDjdsAbnQ5UP3CDBeGz8bC2kyvswC7IjbJPVef0gTVDKVSyI3FU5LZ3VxLRLbZeoTcx
 8XyTdSJCLdO3fRB6fAGQwJAA5TRhJXlfm5SZ2FBLNywbeY/Yg+JwbnIFN/xNOuOZ4Kb/QaMTH6
 0JSmzTn9FaiZneiAAkCVvksCNcCU2FaBQfkjt4MZVD/zOmK/tG0KuhPRdgQTG8Ob+48Mxq8d9c
 wS8=
X-SBRS: 2.7
X-MesageID: 12659225
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12659225"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <2b7826d9-8822-97c8-0637-03bcb98d6418@citrix.com>
 <20200211160149.GL4679@Air-de-Roger>
 <7edfe77a-183b-8927-ffe7-d0ba2bd939e2@citrix.com>
 <20200211164215.GN4679@Air-de-Roger>
 <975f1878-aab4-caa1-6c2e-67cf3cf70ade@citrix.com>
 <20200211181120.GO4679@Air-de-Roger>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <24c2a9b8-a6f3-2db4-6f96-cba0d57e34f7@citrix.com>
Date: Tue, 11 Feb 2020 18:39:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200211181120.GO4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] PV Shim ballooning
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMDIvMjAyMCAxODoxMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIEZl
YiAxMSwgMjAyMCBhdCAwNToyOTowOVBNICswMDAwLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPj4g
T24gMTEvMDIvMjAyMCAxNjo0MiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIFR1ZSwg
RmViIDExLCAyMDIwIGF0IDA0OjI5OjM2UE0gKzAwMDAsIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+
Pj4+IEFncmVlLiBCdXQgYXMgSSBzYWlkIEknbSBub3QgYXdhcmUgb2YgYW55IGd1ZXN0IHRoYXQg
dmlvbGF0ZXMgdGhlCj4+Pj4gaW52YXJpYW50IG9mIGRlY3JlYXNlX3Jlc2VydmF0aW9uKCkgYmVp
bmcgdGhlIGxhc3QgY2FsbC4KPj4+Cj4+PiBNYXliZSB3ZSBjb3VsZCBwaWdneWJhY2sgb24gd2hl
dGhlciBhIHBhZ2UgaXMgcmVtb3ZlZCBmcm9tIHRoZSBkb21haW4KPj4+IGRvbWhlYXAgYW5kIHVz
ZSB0aGF0IGFzIGEgc2lnbmFsIHRoYXQgdGhlIHBhZ2Ugc2hvdWxkIGJlIGJhbGxvb25lZAo+Pj4g
b3V0Pwo+Pj4KPj4+IFRoZXJlJ3MgYWxyZWFkeSBhbiBhcmNoX2ZyZWVfaGVhcF9wYWdlIHRoYXQn
cyBjYWxsZWQgd2hlbiBhIHBhZ2UgaXMKPj4+IHJlbW92ZWQgZnJvbSBhIGRvbWFpbiwgd2hpY2gg
bWlnaHQgYmUgc3VpdGFibGUgZm9yIHRoaXMuIEl0IHdvdWxkCj4+PiBob3dldmVyIGltcGx5IG1h
a2luZyBhbiBoeXBlcmNhbGwgZm9yIGV2ZXJ5IHBhZ2UgdG8gYmUgYmFsbG9vbmVkIG91dC4KPj4K
Pj4gSSB0ZXN0ZWQgdGhhdCAtIGRvZXNuJ3Qgd29yayAtIHRvbyBtYW55IGh5cGVyY2FsbHMgbWFr
ZSBiYWxsb29uaW5nIHRha2UKPj4gYWdlcy4gVGhpcyBzaW1wbHkgY2Fubm90IGJlIGRvbmUgb24g
cGFnZS1ieS1wYWdlIGJhc2lzLgo+IAo+IFdoeSBub3QgcGxhY2UgdGhlbSBvbiBhIGxpc3QgKGlu
IGFyY2hfZnJlZV9oZWFwX3BhZ2UpIGFuZCBkbyB0aGUgZmx1c2gKPiBlaXRoZXIgYWZ0ZXIgYSB0
aW1lb3V0IG9yIHdoZW4gaXQgZ2V0cyB0byBhIGNlcnRhaW4gbnVtYmVyIG9mCj4gZWxlbWVudHM/
CgpIb3cgZG8geW91IGtub3cgdGhhdCAiY2VydGFpbiBudW1iZXIgb2YgZWxlbWVudHMiPyBIb3cg
ZG8geW91IGtub3cgd2hhdAp0aW1lb3V0IGlzIGp1c3QgcmlnaHQ/IFRoaXMgYWxsIHNlZW1zIGxp
a2UgaXQgd2lsbCBpbnRyb2R1Y2UgbW9yZSBwcm9ibGVtcwp0aGFuIHNvbHZlLgoKV2hhdCBpZiBp
bnN0ZWFkIHdlIHBsYWNlIHRoZW0gb24gYSB0ZW1wIGxpc3QgaW4gTDEgZGVjcmVhc2VfcmVzZXJ2
YXRpb24oKQphbmQgdGhlbiB3aWxsIGp1c3QgbW92ZSB0byBhbm90aGVyIGxpc3QgYXMgc29vbiBh
cyB0aGV5IGFyZSBmcmVlZCwKdGhlbiBwYXNzIHRoZSB3aG9sZSBsaXN0IHRvIEwwIGFzIHNvb24g
YXMgdGhlIGZpcnN0IGxpc3QgaXMgZW1wdHk/CgpJZ29yCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
