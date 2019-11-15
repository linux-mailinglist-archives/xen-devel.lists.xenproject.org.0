Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C72DFE1BA
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 16:45:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVdkO-0007b4-Rc; Fri, 15 Nov 2019 15:42:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bLue=ZH=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iVdkN-0007az-Nk
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 15:42:55 +0000
X-Inumbo-ID: 93b3d2ca-07be-11ea-a276-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93b3d2ca-07be-11ea-a276-12813bfff9fa;
 Fri, 15 Nov 2019 15:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573832570;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Uukcvvjp/nr5ajG2QE3EKsRDI5hCYFiq+GlZ6ne+68Q=;
 b=F54VBHTbe9Mxsog0m37cozo1E2tUaB8wcA7jcK921HzIjLDzEAvzxBwF
 839O0XZG+xS9ihpifp1w9W8cF8COCNCDQLe6HabNN3K5khdHRIleQgVLn
 ZmFqt6VYePuuJIPx0W2C7LgaWImNoTOlp68RlqVBdR1rrJguw2qA7a72X o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aq+G6IBp15IiEd7fK9spkRV88X9w4Gy/quRzBUk1myA01kQwfv1An+lyXS3ycwSQRUZSMezk0s
 xm6SzLj8QMjCVgMbriYgR+7nkf310Md8qWjcZ1w3FyvOWPhhu8jNygGK6jjaPv7Ij8aGHEjcXM
 X7lF1twDLGtXQ3jWe/xugjrlu3sHg1nGqC772Y/d1qGTWmM9fNyTdeKRdNvgOTnP1fo+x88EWC
 IbuVrLXIK0T52f/8osgc7yUf3mI9Y9CiuPfQhhEGA8sQ7iShiWZg7gAheu12IRMHl6YlUoi8hk
 LkY=
X-SBRS: 2.7
X-MesageID: 8389867
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; 
   d="scan'208";a="8389867"
To: Nick Rosbrook <rosbrookn@gmail.com>
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
 <5773984ae9308500183adde21cf25837bba39f7f.1570456846.git.rosbrookn@ainfosec.com>
 <ce6a58af-d269-5b70-b1bc-df5a7620c4b5@citrix.com>
 <CAEBZRSeDo2RO-VptW8hYOzh93M04pxxVL16dqoAcrLGm0MbFuA@mail.gmail.com>
 <9576102c-c20f-7d65-5b93-bd2632fde462@citrix.com>
 <CAEBZRSe_jGO3Gi1DPb9-mGoLKODTP4i02EPogSN5xD-sgvcUig@mail.gmail.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <08de2754-c742-06df-3ac9-72ca81019e08@citrix.com>
Date: Fri, 15 Nov 2019 15:42:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAEBZRSe_jGO3Gi1DPb9-mGoLKODTP4i02EPogSN5xD-sgvcUig@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 11/24] golang/xenlight: define
 CpuidPolicyList builtin type
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, kerriganb@ainfosec.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMTUvMTkgMzoyNiBQTSwgTmljayBSb3Nicm9vayB3cm90ZToKPj4gSWYgd2UgZG8gaGF2
ZSB0byBrZWVwIHRoZSBDIHBvaW50ZXIgYXJvdW5kIGZvciBzb21lIHJlYXNvbiwgSSB0aGluawo+
PiB1c2luZyBTZXRGaW5hbGl6ZXIgaXMgYSBuZWNlc3NhcnkgYmFja3N0b3AgdG8ga2VlcCB0aGUg
bGlicmFyeSBmcm9tCj4+IGxlYWtpbmcuICBJdCdzIGFsbCB3ZWxsIGFuZCBnb29kIHRvIHNheSwg
Ik1ha2Ugc3VyZSB5b3UgY2FsbCBEaXNwb3NlKCkiLAo+PiBidXQgSSB0aGluayBmb3IgYSBHQydk
IGxhbmd1YWdlIHRoYXQncyBqdXN0IGdvaW5nIHRvIGJlIHRvbyBlYXN5IHRvCj4+IGZvcmdldDsg
YW5kIGl0IHdpbGwgYmUgYSBodWdlIHBhaW4gZm9yIGxvbmctcnVubmluZyBwcm9jZXNzZXMuCj4g
Cj4gSSB1bmRlcnN0YW5kIHlvdXIgbW90aXZhdGlvbiBmb3Igd2FudGluZyB0byBtYWtlIHRoaXMg
Zm9vbC1wcm9vZiwgYnV0Cj4gdGhlcmUgYXJlIHBsZW50eSBvZiBjb21tb24gZXhhbXBsZXMgaW4g
R28gd2hlcmUgaXQncyB3ZWxsLXVuZGVyc3Rvb2QKPiB0aGF0IGlmIEkgY2FsbCBgTmV3Rm9vYCB0
aGVuIEkgbmVlZCB0byBgZm9vLkNsb3NlKClgIChkZWZlcidkIG9yCj4gb3RoZXJ3aXNlKS4gSSBk
b24ndCB0aGluayB0aGF0IGFsb25lIGlzIGEgZ29vZCBlbm91Z2ggYXJndW1lbnQgZm9yCj4gdHVy
bmluZyB0byBTZXRGaW5hbGl6ZXIuIEJ1dCwgSSdtIGNlcnRhaW5seSBub3QgYWR2b2NhdGluZyBm
b3IgdGhlCj4gRGlzcG9zZSBvcHRpb24gZWl0aGVyIC0gYXMgSSBzYWlkIEkgdGhpbmsgdGhhdCB3
b3VsZCBiZSB1bmZvcnR1bmF0ZQo+IGZyb20gYW4gQVBJIHBlcnNwZWN0aXZlLgo+IAo+PiBJZiB3
ZSBkaWRuJ3QgaGF2ZSB0aGlzIHR5cGUgYXMgYSB0eXBlLCB3ZSdkIGhhdmUgdG8gYXZvaWQgc29t
ZWhvdwo+PiBleHBvc2luZyB0aGUgdXNlciB0byB0aGUgZnVuY3Rpb25zIHdoaWNoIHRha2UgYW5k
IHVzZSBpdC4gIFRoZSBtYWluCj4+IHBsYWNlIGl0J3MgdXNlZCBBVE0gaXMgaW4gRG9tYWluQnVp
bGRJbmZvLiAgV2UgY291bGQgZXhwbG9yZSB3aGV0aGVyIGl0Cj4+IHdvdWxkIGJlIHByYWN0aWNh
bCB0byAiaW1wbGVtZW50IiBDcHVpZFBvbGljeUxpc3QgYXMgYSBzdHJpbmcsIGFuZCB0aGVuCj4+
IGhhdmUgdG9DKCkgY2FsbCBsaWJ4bF9jcHVpZF9wYXJzZV9jb25maWcoKS4gIE9idmlvdXNseSB0
aGF0IG1lYW5zCj4+IGZyb21DKCkgd291bGQgZmFpbDsgYnV0IEknbSBub3Qgc3VyZSBEb21haW5C
dWlsZEluZm8gaXMgcmVhbGx5IGEKPj4gc3RydWN0dXJlIHBhc3NlZCAib3V0IiBvZiBsaWJ4bCBh
bnl3YXkuCj4gCj4gSXQncyBzb3VuZGluZyBtb3JlIGFuZCBtb3JlIGxpa2Ugd2UgbmVlZCBhIHdh
eSB0byBnaXZlIHR5cGVzIGFuCj4gImV4cG9ydGVkL3VuZXhwb3J0ZWQiIGF0dHJpYnV0ZSBpbiB0
aGUgSURMLgo+IAo+IFdoeSBleGFjdGx5IHdvdWxkIGZyb21DIGJlIGRvb21lZCB0byBmYWlsPyBK
dXN0IGJlY2F1c2UgdGhlcmUgaXMgbm8KPiBgbGlieGxfY3B1aWRfdG9fc3RyaW5nYCBvciBvdGhl
cndpc2U/CgpTb3JyeSwgSSB3YXMgdHlwaW5nIHRoaXMgaW4gYSBiaXQgb2YgYSBydXNoIGF0IHRo
ZSBlbmQgb2YgdGhlIGRheQp5ZXN0ZXJkYXkuIDotKQoKWWVzLCB0aGF0J3Mgd2hhdCBJIG1lYW50
OiBUaGVyZSdzIGJhc2ljYWxseSBubyB3YXkgdG8gcmVhZCBhIHBvbGljeSBmcm9tCmxpYnhsIGFu
ZCB0aGVuIHBhc3MgaXQgYmFjayB0byBsaWJ4bCAoc2luY2UgdGhlcmUncyBubyB3YXkgdG8gY29u
dmVydApsaWJ4bF9jcHVpZF9wb2xpY3lfbGlzdCA9PiBDcHVpZFBvbGljeUxpc3QgPT4gbGlieGxf
Y3B1aWRfcG9saWN5X2xpc3QKYWdhaW4pLgoKQnV0IGF0IHRoZSBtb21lbnQsIGEgc3RyaW5nIGlz
IHRoZSAicHJlZmVycmVkIGZvcm0gb2YgbW9kaWZpY2F0aW9uIiBhcwppdCB3ZXJlOyBzbyBpZiBz
dWNoIGEgcmVhZC1tb2RpZnktd3JpdGUgZmVhdHVyZSB3ZXJlIGltcGxlbWVudGVkLCBsaWJ4bAp3
b3VsZCBuZWVkIHRvIGFkZCBsaWJ4bF9jcHVpZF90b19zdHJpbmcgYW55d2F5LiAgKE9yIGdpdmUg
c29tZSBvdGhlcgptb2RpZmlhYmxlIGZvcm0uKQoKPiBJbiBhbnkgY2FzZSwgSSB0aGluayBkZWZp
bmluZyBpdAo+IGFzIGEgc3RyaW5nIG1heSBiZSBhIGdvb2QgaW50ZXJtZWRpYXRlIG9wdGlvbiBm
b3Igbm93IChldmVuIGlmIGl0Cj4gbWVhbnMgZnJvbUMgaGFzIHRvIGJlIGEgbm8tb3ApLiBUaGF0
IHdheSB3ZSBjYW4gZW5zdXJlIGNhbGxzIHRvCj4gYGxpYnhsX2NwdWlkX2RpcG9zZWAgYXMgdXN1
YWwuCgpZZXMsIGxldCdzIGRvIHRoYXQuCgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
