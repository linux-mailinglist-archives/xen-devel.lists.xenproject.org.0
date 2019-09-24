Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBFDBD0D9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 19:44:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCopD-0005h7-UA; Tue, 24 Sep 2019 17:42:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rtbr=XT=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iCopC-0005h2-F3
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 17:42:06 +0000
X-Inumbo-ID: 9f8f7fe4-def2-11e9-9625-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id 9f8f7fe4-def2-11e9-9625-12813bfff9fa;
 Tue, 24 Sep 2019 17:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569346925;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=orTkE4e0dU/FKiZia6kKFIC+l6rq2xYOwovli1tdQEI=;
 b=c+jkVYhBEVUZK7Yh3b7+s8eHGEQ9Wp7u1nfNFd9tA0Tyma6HS30BvR2g
 Pnkd5/+M7S7UI1Sp75m/XiYrkVeOEk5vcUqtivQXcjZNfxD4KqH98Xh42
 8Bt0Og4FXK3eybJp7L3ktAfgmSns3iVfN3FCa5VIbtymvrJAL0gkhJF+B w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RFmgmTdtH8PIVj92RvA6L2FuY51X7g7AKSyrXLlWV0oJFuOrYx9W4q9APSYHfHLIL5G96QgC2e
 cqi7G9qB4p/yp+horsOaxZLp7phSttGUSn80K1rdctE+y910JB7K76rUwLzHFKdBKNX3D0bd9n
 mk/0tv8PXmC50oN1SPLSDCEpdLnhIirJaHNX7o0fHLPrz+JsBpcZwhTS6ZT99ouDrfYQmccuxf
 oL5ez9dLZtv2R0HRZaE0xuyPUIveGKkSUXwxmovALsNGkyv2w8G+bIGKByvolux9BaSPXR82PY
 ESM=
X-SBRS: 2.7
X-MesageID: 6340068
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,544,1559534400"; 
   d="scan'208";a="6340068"
To: Dario Faggioli <dfaggioli@suse.com>, Sergey Dyasli
 <sergey.dyasli@citrix.com>, Juergen Gross <jgross@suse.com>,
 <xen-devel@lists.xenproject.org>
References: <20190914085251.18816-1-jgross@suse.com>
 <12d5ec32-8f7f-1cba-183c-d61dd8c4c10a@citrix.com>
 <655618d04190c02caaee22327ea439e332bd9f78.camel@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <7d45379d-5dbe-77ca-c1a2-6011dc4ba90d@citrix.com>
Date: Tue, 24 Sep 2019 18:42:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <655618d04190c02caaee22327ea439e332bd9f78.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 00/47] xen: add core scheduling support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQvMDkvMjAxOSAxODoyOSwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gVHVlLCAyMDE5
LTA5LTI0IGF0IDEyOjE1ICswMTAwLCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+PiBIaSBKdWVyZ2Vu
LAo+Pgo+PiBBZnRlciBhbiBleHRlbnNpdmUgdGVzdGluZyBvZiB5b3VyIGpncm9zczEvc2NoZWQt
djMgYnJhbmNoIGluIFhlblJULAo+PiBJJ20gaGFwcHkgdG8gc2F5IHRoYXQgd2UndmUgZm91bmQg
bm8gZnVuY3Rpb25hbCByZWdyZXNzaW9ucyBzbyBmYXIKPj4gd2hlbiBydW5uaW5nIGluIHRoZSBk
ZWZhdWx0ICh0aHJlYWQvY3B1KSBtb2RlLgo+Pgo+PiBIb3BlZnVsbHkgdGhpcyBnaXZlcyBzb21l
IGxldmVsIG9mIGNvbmZpZGVuY2UgdG8gdGhpcyBzZXJpZXMgYW5kIHRoZQo+PiBwbGFuIGFib3V0
IGluY2x1ZGluZyBpdCBpbnRvIDQuMTMgWzFdCj4+Cj4gVGhhbmtzIGEgbG90IGZvciBkb2luZyB0
aGlzLCBhbmQgZm9yIGxldHRpbmcgdXMga25vdy4KCkFkZGl0aW9uYWxseSwgd2UndmUgZ290IHBl
cmZvcm1hbmNlIHRlc3QgcmVzdWx0cyB0b2RheSBhbmQgdGhleSBzaG93ZWQKbm8gbm90aWNlYWJs
ZSByZWdyZXNzaW9ucyBpbiB0aHJlYWQgbW9kZSBhZ2FpbnN0IDQuMTMgd2l0aG91dApjb3JlLXNj
aGVkdWxpbmcgcGF0Y2hlcy4KCj4gQ2FuIEkgYXNrIHdoZXRoZXIgdGhlIHRlc3RzIHdlcmUgZG9u
ZSB1c2luZyBDcmVkaXQyIChpLmUuLCB1cHN0cmVhbQo+IGRlZmF1bHQpIG9yIENyZWRpdDEsIGFz
IHNjaGVkdWxlcj8KPgpUaGF0IHdhcyBDcmVkaXQxIHRoYXQgd2UgdXNlIGluIHRoZSBwcm9kdWN0
LgoKSWdvcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
