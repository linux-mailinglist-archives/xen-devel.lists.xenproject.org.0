Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE589146E4C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 17:27:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iufH7-00077S-32; Thu, 23 Jan 2020 16:24:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l7XC=3M=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1iufH5-00077N-DH
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 16:24:07 +0000
X-Inumbo-ID: c20e48fc-3dfc-11ea-9fd7-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c20e48fc-3dfc-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 16:23:58 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1579796638; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=fVpHuoTkTrbVWh3XddeuxzlDd9LRmhvOLhmvt2RImNw=;
 b=YHkRO/3WTCt9Yz8nKUB9Ars2vRZE+isalBxYIZumwLSGaV4hx6UHkLoSg6uNRUQgf4PyTZ1c
 lzYHR1xTfi4/VVa0bOUz2yVwIyBse+hHmcUUdZesfHpMBbm/td5/qo2VSti/k3vQbgAVFQbJ
 GiRscCr95ZGEtpW7TbinDgy11RY=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mxa.mailgun.org with ESMTP id 5e29c89d.7f02cce441b0-smtp-out-n02;
 Thu, 23 Jan 2020 16:23:57 -0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id a5so3212181wmb.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2020 08:23:57 -0800 (PST)
X-Gm-Message-State: APjAAAWCZSoDaCbCT3X6aUo3g8D1iBifm1lN9wchDHJhuspDUkh728Rt
 ZSNR3sYdfef4cB+C/BdD3bg8QGvnasZ3H0fwCeM=
X-Google-Smtp-Source: APXvYqzqCPX6r/tHs6CXfahLpZU3usqo7D2eMk9crdi4tJ+wQpZZLknGcttewra1XgbWyvi1t/H5+Lq4n31tJM0Eryc=
X-Received: by 2002:a05:600c:d6:: with SMTP id
 u22mr5038954wmm.77.1579796635824; 
 Thu, 23 Jan 2020 08:23:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1579628566.git.tamas.lengyel@intel.com>
 <59bdc31b9fcffc92c5a8817aeba8eaa2de75a43c.1579628566.git.tamas.lengyel@intel.com>
 <f95e2a51-b866-dc6e-aa10-d81a3f5fd2c3@citrix.com>
In-Reply-To: <f95e2a51-b866-dc6e-aa10-d81a3f5fd2c3@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 23 Jan 2020 09:23:18 -0700
X-Gmail-Original-Message-ID: <CABfawhmFrebRs47jQQ_8r2aMsjyWDZH=DLnVuniD3sporPN=rQ@mail.gmail.com>
Message-ID: <CABfawhmFrebRs47jQQ_8r2aMsjyWDZH=DLnVuniD3sporPN=rQ@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v5 10/18] x86/mem_sharing: Convert
 MEM_SHARING_DESTROY_GFN to a bool
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMjMsIDIwMjAgYXQgOToxNCBBTSBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gMS8yMS8yMCA1OjQ5IFBNLCBUYW1hcyBLIExl
bmd5ZWwgd3JvdGU6Cj4gPiBNRU1fU0hBUklOR19ERVNUUk9ZX0dGTiBpcyB1c2VkIG9uIHRoZSAn
ZmxhZ3MnIGJpdGZpZWxkIGR1cmluZyB1bnNoYXJpbmcuCj4gPiBIb3dldmVyLCB0aGUgYml0Zmll
bGQgaXMgbm90IHVzZWQgZm9yIGFueXRoaW5nIGVsc2UsIHNvIGp1c3QgY29udmVydCBpdCB0byBh
Cj4gPiBib29sIGluc3RlYWQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVs
IDx0YW1hcy5sZW5neWVsQGludGVsLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4KPiBCdXQgaXMgdGhlcmUgYSBwYXJ0aWN1bGFyIGFkdmFudGFn
ZSB0byBnZXR0aW5nIHJpZCBvZiB0aGUgYml0ZmllbGQ/Cj4KPiBZb3UncmUgdGhlIG1haW50YWlu
ZXIsIHNvIGl0J3MgeW91ciBkZWNpc2lvbiBvZiBjb3Vyc2UuICBCdXQgaWYgaXQgd2VyZQo+IG1l
IEknZCBsZWF2ZSBpdCBhcyBhIGJpdGZpZWxkIHNvIHRoYXQgYWxsIHRoZSBiaXRmaWVsZCBjb2Rl
IGlzIHRoZXJlIGlmCj4gaXQncyBuZWVkZWQgaW4gdGhlIGZ1dHVyZS4gIEZsaXBwaW5nIGl0IHRv
IGEgYm9vbCwgd2l0aCB0aGUgcmlzayBvZgo+IGZsaXBwaW5nIGl0IGJhY2sgdG8gYSBiaXRmaWVs
ZCBsYXRlciwgc2VlbXMgbGlrZSBwb2ludGxlc3MgY2h1cm4gdG8gbWUuCj4KPiAoQWx0aG91Z2gg
cGVyaGFwcyB0aGUgcmVhc29uIHdpbGwgYmVjb21lIGV2aWRlbnQgYnkgdGhlIHRpbWUgSSBnZXQg
dG8KPiB0aGUgZW5kIG9mIHRoZSBzZXJpZXMuKQoKUHJvdmlkZWQgaXRzIGJlZW4gbWFueSB5ZWFy
cyBzaW5jZSB0aGlzIGNvZGUgaGFzIGJlZW4gYWRkZWQgd2l0aCBubwpuZWVkIGZvciBhbnkgZXh0
cmEgYml0cywgYW5kIHdpdGggbm8gZXhwZWN0YXRpb25zIHRoYXQgdGhpcyB3b3VsZApjaGFuZ2Ug
YW55IHRpbWUgc29vbiwgSSB3b3VsZG4ndCB3b3JyeSBhYm91dCB0aGF0LiBUcnVlLCB0aGVyZSBp
cyB2ZXJ5CmxpdHRsZSBkaWZmZXJlbmNlIGJldHdlZW4ga2VlcGluZyB0aGUgY29kZSBhcy1pcyB2
cyBjb252ZXJ0aW5nIGl0IHRvCmJvb2wsIGJ1dCBJTUhPIGl0IG1ha2VzIHRoZSBjb2RlIGVhc2ll
ciB0byBmb2xsb3cgd2l0aG91dCB5b3UKd29uZGVyaW5nIHdoYXQgbWlnaHQgYmUgdGhvc2Ugbm9u
LWV4aXN0ZW50IHNpdHVhdGlvbnMgdGhhdCB3YXJyYW50ZWQKaXQgdG8gYmUgYSBiaXRtYXAgdG8g
YmVnaW4gd2l0aC4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
