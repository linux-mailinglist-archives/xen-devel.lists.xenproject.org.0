Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA04413A3D9
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 10:31:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irIVH-00060L-29; Tue, 14 Jan 2020 09:28:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZPm=3D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irIVF-00060G-Js
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 09:28:49 +0000
X-Inumbo-ID: 4439e128-36b0-11ea-8354-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4439e128-36b0-11ea-8354-12813bfff9fa;
 Tue, 14 Jan 2020 09:28:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D9E8CAEE0;
 Tue, 14 Jan 2020 09:28:46 +0000 (UTC)
To: Jason Andryuk <jandryuk@gmail.com>
References: <339bee59-b89b-b3fc-fb7d-114e8ffe1716@suse.com>
 <e06491b8-58cc-46b1-3f79-d06d6765d089@suse.com>
 <aa06aa23-d108-671e-74cc-5fd50c848792@citrix.com>
 <CAKf6xpuHqJiMjkkx=bttN4LWBbtOdcu_=SPoqaC+3kg=osAC4g@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <caa5e3c5-a315-53ba-13de-b355beb6ab2d@suse.com>
Date: Tue, 14 Jan 2020 10:28:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAKf6xpuHqJiMjkkx=bttN4LWBbtOdcu_=SPoqaC+3kg=osAC4g@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/HVM: use single (atomic) MOV for
 aligned emulated writes
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDEuMjAyMCAyMDo0MCwgSmFzb24gQW5kcnl1ayB3cm90ZToKPiBPbiBGcmksIERlYyAy
NywgMjAxOSBhdCAxMTowOSBBTSBBbmRyZXcgQ29vcGVyCj4gPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+IHdyb3RlOgo+Pgo+PiBPbiAyMC8xMi8yMDE5IDE2OjIzLCBKYW4gQmV1bGljaCB3cm90
ZToKPj4+IE9uIDE2LjA5LjIwMTkgMTE6NDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IFVzaW5n
IG1lbWNweSgpIG1heSByZXN1bHQgaW4gbXVsdGlwbGUgaW5kaXZpZHVhbCBieXRlIGFjY2Vzc2Vz
Cj4+Pj4gKGRlcGVuZGVuaW5nIGhvdyBtZW1jcHkoKSBpcyBpbXBsZW1lbnRlZCBhbmQgaG93IHRo
ZSByZXN1bHRpbmcgaW5zbnMsCj4+Pj4gZS5nLiBSRVAgTU9WU0IsIGdldCBjYXJyaWVkIG91dCBp
biBoYXJkd2FyZSksIHdoaWNoIGlzbid0IHdoYXQgd2UKPj4+PiB3YW50L25lZWQgZm9yIGNhcnJ5
aW5nIG91dCBndWVzdCBpbnNucyBhcyBjb3JyZWN0bHkgYXMgcG9zc2libGUuIEZhbGwKPj4+PiBi
YWNrIHRvIG1lbWNweSgpIG9ubHkgZm9yIGFjY2Vzc2VzIG5vdCAyLCA0LCBvciA4IGJ5dGVzIGlu
IHNpemUuCj4+Pj4KPj4+PiBTdWdnZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgo+Pgo+PiBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KPiAKPiBTaG91bGQgeGVuL2FyY2gveDg2L21tL3NoYWRvdy9odm0uYzpodm1f
ZW11bGF0ZV93cml0ZSgpIGJlIHNpbWlsYXJseSBjaGFuZ2VkPwoKUHJvYmFibHkuIENhcmUgdG8g
bWFrZSBhIHBhdGNoPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
