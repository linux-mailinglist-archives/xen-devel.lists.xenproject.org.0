Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 552F9B0A2B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 10:23:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8KKV-0000lF-3s; Thu, 12 Sep 2019 08:19:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8KKU-0000lA-GX
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 08:19:50 +0000
X-Inumbo-ID: 16745df8-d536-11e9-83e4-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16745df8-d536-11e9-83e4-12813bfff9fa;
 Thu, 12 Sep 2019 08:19:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E4C6BAF3F;
 Thu, 12 Sep 2019 08:19:48 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190911200504.5693-1-andrew.cooper3@citrix.com>
 <20190911200504.5693-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <523f8f8d-8517-be28-b3d9-8ae7cca6ddec@suse.com>
Date: Thu, 12 Sep 2019 10:19:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190911200504.5693-6-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 5/8] tools/libxc: Rework xc_cpuid_set() to
 use {get, set}_cpu_policy()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMjAxOSAyMjowNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgcHVycG9zZSBv
ZiB0aGlzIGNoYW5nZSBpcyB0byBzdG9wIHVzaW5nIHhjX2NwdWlkX2RvX2RvbWN0bCgpLCBhbmQg
dG8gc3RvcAo+IGJhc2luZyBkZWNpc2lvbnMgb24gYSBsb2NhbCBDUFVJRCBpbnN0cnVjdGlvbi4g
IFRoaXMgaXMgbm90IGFuIGFwcHJvcHJpYXRlIHdheQo+IHRvIGNvbnN0cnVjdCBwb2xpY3kgaW5m
b3JtYXRpb24gZm9yIG90aGVyIGRvbWFpbnMuCj4gCj4gT2J0YWluIHRoZSBob3N0IGFuZCBkb21h
aW4tbWF4IHBvbGljaWVzIGZyb20gWGVuLCBhbmQgbWl4IHRoZSByZXN1bHRzIGFzCj4gYmVmb3Jl
LiAgUHJvdmlkZSByYXRoZXIgbW9yZSBlcnJvciBsb2dnaW5nIHRoYW4gYmVmb3JlLgoKQW5kIHRo
aXMgcGFzc2luZyB0aHJvdWdoIG9mIGhvc3QgdmFsdWVzIGlzIG1lYW50IHRvIHN0YXkgbG9uZwp0
ZXJtPyBTaG91bGRuJ3QgdGhpcyByYXRoZXIgYmUgcGFzc2luZyB0aHJvdWdoIG9mIG1heC1wb2xp
Y3kKdmFsdWVzLCB3aXRoIG1heC1wb2xpY3kgbG9uZyB0ZXJtIHdpZGVyIHRoYW4gZGVmYXVsdC1w
b2xpY3k/IFRoZQpjaGFuZ2UgaXRzZWxmIGxvb2tzIGdvb2QgdG8gbWUsIGJ1dCBiZWZvcmUgZ2l2
aW5nIG15IFItYiBJJ2QKbGlrZSB0byB1bmRlcnN0YW5kIHRoaXMgYXNwZWN0LgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
