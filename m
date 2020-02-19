Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B8D164AF5
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 17:50:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4SWB-0003zM-F5; Wed, 19 Feb 2020 16:48:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tz6x=4H=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j4SWA-0003z9-CE
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 16:48:10 +0000
X-Inumbo-ID: 9b53aa2c-5337-11ea-83ca-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b53aa2c-5337-11ea-83ca-12813bfff9fa;
 Wed, 19 Feb 2020 16:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582130888;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=zL3VyyAbddP7FegWLv7Nz3U0L9kCGcjyfqzYjbkoV8k=;
 b=RycHmePySnzExk9LqwaLBv366eDp3c5FpYP+GseRXBUH8zN9sTi8lqIN
 kcE2s8oA+bRlDs4F3HLD6zbOP4lsG60FKqe73AO1XaZ8eSsdSb84Srkki
 NPJpFygN8UnEiLB24LAeQuH1Je8VtRGKhbPJFAClXILJ9119t4OaR7Twi M=;
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
IronPort-SDR: 4zJoz6VcS38KU80Spccaqu0CXNVBX+sGrQqKhVGeTkvhipijolrj4LjvaT+b8mr9edKZlu0B04
 uINgShD3K4xqk6LrJ0pz1/LPpBRSlkxhdwQ4pdfEEgQ5Zk5BoQocfmR2lBV6NkP5S3jHnHQc+A
 TeIbzjvL+/SqoS1uHmV5yhk4YlVczmfpkZfuLLeDaEPH+gVoIxSbJkZEmoeBEsfVtBhNM3FXiN
 5tLogpMzVr/LQGpfE1Zc/1C06Eo2019pxPf7PzacTZoUm4ggd7KVY2RO2E9LN3pOD/yMybXRMg
 bwg=
X-SBRS: 2.7
X-MesageID: 13061066
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,461,1574139600"; d="scan'208";a="13061066"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20200218122114.17596-1-jgross@suse.com>
 <8f900180-718c-e0e4-a638-c1404e00058f@citrix.com>
Message-ID: <8641e973-2ba0-cf09-85da-4ff72bddc723@citrix.com>
Date: Wed, 19 Feb 2020 16:48:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8f900180-718c-e0e4-a638-c1404e00058f@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/4] xen/rcu: let rcu work better with
 core scheduling
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDIvMjAyMCAxMzoxNSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMTgvMDIvMjAy
MCAxMjoyMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gVG9kYXkgdGhlIFJDVSBoYW5kbGluZyBp
biBYZW4gaXMgYWZmZWN0aW5nIHNjaGVkdWxpbmcgaW4gc2V2ZXJhbCB3YXlzLgo+PiBJdCBpcyBy
YWlzaW5nIHNjaGVkIHNvZnRpcnFzIHdpdGhvdXQgYW55IHJlYWwgbmVlZCBhbmQgaXQgcmVxdWly
ZXMKPj4gdGFza2xldHMgZm9yIHJjdV9iYXJyaWVyKCksIHdoaWNoIGludGVyYWN0cyBiYWRseSB3
aXRoIGNvcmUgc2NoZWR1bGluZy4KPj4KPj4gVGhpcyBzbWFsbCBzZXJpZXMgcmVwYWlycyB0aG9z
ZSBpc3N1ZXMuCj4+Cj4+IEFkZGl0aW9uYWxseSBzb21lIEFTU0VSVCgpcyBhcmUgYWRkZWQgZm9y
IHZlcmlmaWNhdGlvbiBvZiBzYW5lIHJjdQo+PiBoYW5kbGluZy4gSW4gb3JkZXIgdG8gYXZvaWQg
dGhvc2UgdHJpZ2dlcmluZyByaWdodCBhd2F5IHRoZSBvYnZpb3VzCj4+IHZpb2xhdGlvbnMgYXJl
IGZpeGVkLgo+Pgo+IAo+IEluaXRpYWwgdGVzdCBvZiB0aGUgZmlyc3QgMiBwYXRjaGVzIGlzIHBy
b21pc2luZy4gV2lsbCBydW4gbW9yZSB0ZXN0cwo+IG92ZXIgbmlnaHQgdG8gc2VlIGhvdyBzdGFi
bGUgaXQgaXMuCgpJIHN0cmVzcy10ZXN0ZWQgaXQgb3ZlciBuaWdodCBhbmQgaXQgc2VlbXMgdG8g
d29yayBmb3Igb3VyIGNhc2UuCgpUZXN0ZWQtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpo
aW5pbkBjaXRyaXguY29tPgoKSWdvcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
