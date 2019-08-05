Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DC281FA1
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 16:59:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hueQ6-0003Yh-PD; Mon, 05 Aug 2019 14:57:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dpjS=WB=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hueQ5-0003Yc-LS
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 14:57:05 +0000
X-Inumbo-ID: 48f7e032-b791-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 48f7e032-b791-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 14:57:03 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2gwTBm5nJ8UTlzNBHFfvbzjaFLiFGvC595IT8ycC6sdGhbZCV0R79Zj+83ioI8lI36YqvSw01f
 oD/mE5bZfpIfrzbog8uNjM/KFN8F7OEKZS3j9nFxo/+NCiU8/aWoxmL93+7yMBmquChSkPbmg1
 OLyvv6vsalkNZDyAk9SRQAM3trgoTpnNnHrCXBQUa2b3HYp+vNOcQjP/opLOvp4CDo64FPiP6S
 FZSjFyUU3rsfXW2hrAE73JYFCdc9kEj0is5Qw+jT9LMa4Q3j5YHRllvTfgVJka5PttU+8lwkyA
 MRg=
X-SBRS: 2.7
X-MesageID: 3911103
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,350,1559534400"; 
   d="scan'208";a="3911103"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23880.17310.533723.275468@mariner.uk.xensource.com>
Date: Mon, 5 Aug 2019 15:56:30 +0100
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
In-Reply-To: <23752.8472.14097.76030@mariner.uk.xensource.com>
References: <20190429224252.29000-1-marmarek@invisiblethingslab.com>
 <23752.8472.14097.76030@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2] python: Adjust xc_physinfo wrapper for
 updated virt_caps bits
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtQQVRDSCB2Ml0gcHl0aG9uOiBBZGp1c3QgeGNfcGh5
c2luZm8gd3JhcHBlciBmb3IgdXBkYXRlZCB2aXJ0X2NhcHMgYml0cyIpOgo+IE1hcmVrIE1hcmN6
eWtvd3NraS1Hw7NyZWNraSB3cml0ZXMgKCJbUEFUQ0ggdjJdIHB5dGhvbjogQWRqdXN0IHhjX3Bo
eXNpbmZvIHdyYXBwZXIgZm9yIHVwZGF0ZWQgdmlydF9jYXBzIGJpdHMiKToKPiA+IENvbW1pdCBm
MDg5ZmRkZDk0ICJ4ZW46IHJlcG9ydCBQViBjYXBhYmlsaXR5IGluIHN5c2N0bCBhbmQgdXNlIGl0
IGluCj4gPiB0b29sc3RhY2siIGNoYW5nZWQgbWVhbmluZyBvZiB2aXJ0X2NhcHMgYml0IDEgLSBw
cmV2aW91c2x5IGl0IHdhcwo+ID4gImRpcmVjdGlvIiwgYnV0IHdhcyBjaGFuZ2VkIHRvICJwdiIg
YW5kICJkaXJlY3RpbyIgd2FzIG1vdmVkIHRvIGJpdCAyLgo+ID4gQWRqdXN0IHB5dGhvbiB3cmFw
cGVyIHRvIHVzZSAjZGVmaW5lcyBmb3IgdGhlIGJpdHMgdmFsdWVzLCBhbmQgYWRkCj4gPiByZXBv
cnRpbmcgb2YgYm90aCAicHZfZGlyZWN0aW8iIGFuZCAiaHZtX2RpcmVjdGlvIi4KPiA+IAo+ID4g
U2lnbmVkLW9mZi1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZp
c2libGV0aGluZ3NsYWIuY29tPgo+IAo+IEFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4KCkkgdGhpbmsgdGhpcyBpcyBhIGJhY2twb3J0IGNhbmRpZGF0ZSBm
b3IgNC4xMiwgc2luY2UgZjA4OWZkZGQ5NCB3YXMgaW4KNC4xMi4gIEFtIEkgcmlnaHQgPwoKSWFu
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
