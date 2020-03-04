Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85973179216
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 15:12:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9UiG-0001we-3i; Wed, 04 Mar 2020 14:09:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bsO7=4V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9UiE-0001wW-BZ
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 14:09:26 +0000
X-Inumbo-ID: c11ace3a-5e21-11ea-a3e6-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c11ace3a-5e21-11ea-a3e6-12813bfff9fa;
 Wed, 04 Mar 2020 14:09:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1BC8EB2ED;
 Wed,  4 Mar 2020 14:09:25 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200304140021.55777-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b015065a-2ea3-cd2e-bcfc-ae41015d0a91@suse.com>
Date: Wed, 4 Mar 2020 15:09:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200304140021.55777-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] iommu: fix check for autotranslated
 hardware domain
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amzn.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDMuMjAyMCAxNTowMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFRoZSBjdXJyZW50
IHBvc2l0aW9uIG9mIHRoZSBjaGVja19od2RvbV9yZXFzIGlzIHdyb25nLCBhcyB0aGVyZSdzIGEK
PiBpc19pb21tdV9lbmFibGVkIGF0IHRoZSB0b3Agb2YgdGhlIGZ1bmN0aW9uIHRoYXQgd2lsbCBw
cmV2ZW50IGdldHRpbmcKPiB0byB0aGUgY2hlY2sgb24gc3lzdGVtcyB3aXRob3V0IGFuIElPTU1V
LCBiZWNhdXNlIHRoZSBoYXJkd2FyZSBkb21haW4KPiB3b24ndCBoYXZlIHRoZSBYRU5fRE9NQ1RM
X0NERl9pb21tdSBmbGFnIHNldC4KPiAKPiBNb3ZlIHRoZSBwb3NpdGlvbiBvZiB0aGUgY2hlY2sg
c28gaXQncyBkb25lIGJlZm9yZSB0aGUKPiBpc19pb21tdV9lbmFibGVkIG9uZSwgYW5kIHRodXMg
YXR0ZW1wdHMgdG8gY3JlYXRlIGEgdHJhbnNsYXRlZAo+IGhhcmR3YXJlIGRvbWFpbiB3aXRob3V0
IGFuIElPTU1VIGNhbiBiZSBkZXRlY3RlZC4KPiAKPiBGaXhlczogZjg5ZjU1NTgyN2EgKCdyZW1v
dmUgbGF0ZSAob24tZGVtYW5kKSBjb25zdHJ1Y3Rpb24gb2YgSU9NTVUgcGFnZSB0YWJsZXMnKQo+
IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoK
UmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
