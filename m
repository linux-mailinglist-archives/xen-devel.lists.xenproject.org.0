Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D90C4B73
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 12:30:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFbrB-0004Tr-Ai; Wed, 02 Oct 2019 10:27:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lglc=X3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iFbr9-0004Tk-R1
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 10:27:39 +0000
X-Inumbo-ID: 42069ba6-e4ff-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 42069ba6-e4ff-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 10:27:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 42A3DB090;
 Wed,  2 Oct 2019 10:27:38 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1569957357-20803-1-git-send-email-igor.druzhinin@citrix.com>
 <ad5d3685-f2f8-28d4-d8e6-a985988061cd@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6a7cc757-8ceb-10f6-512b-91d8a4d22b08@suse.com>
Date: Wed, 2 Oct 2019 12:27:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ad5d3685-f2f8-28d4-d8e6-a985988061cd@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/crash: force unlock console
 before printing on kexec crash
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
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com, wl@xen.org,
 andrew.cooper3@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTAuMTkgMTI6MjUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDAxLjEwLjIwMTkgMjE6
MTUsIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+PiBUaGVyZSBpcyBhIHNtYWxsIHdpbmRvdyB3aGVy
ZSBzaG9vdGRvd24gTk1JIG1pZ2h0IGNvbWUgdG8gYSBDUFUKPj4gKGUuZy4gaW4gc2VyaWFsIGlu
dGVycnVwdCBoYW5kbGVyKSB3aGVyZSBjb25zb2xlIGxvY2sgaXMgdGFrZW4uIEluIG9yZGVyCj4+
IG5vdCB0byBsZWF2ZSBmb2xsb3dpbmcgY29uc29sZSBwcmludHMgd2FpdGluZyBpbmZpbml0ZWx5
IGZvciBzaG90IGRvd24KPj4gQ1BVcyB0byBmcmVlIHRoZSBsb2NrIC0gZm9yY2UgdW5sb2NrIHRo
ZSBjb25zb2xlLgo+Pgo+PiBUaGUgcmFjZSBoYXMgYmVlbiBmcmVxdWVudGx5IG9ic2VydmVkIHdo
aWxlIGNyYXNoaW5nIG5lc3RlZCBYZW4gaW4KPj4gYW4gSFZNIGRvbWFpbi4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4gCj4g
VGhpcyBzaG91bGQgaGF2ZSBiZWVuIENjLWVkIHRvIErDvHJnZW4gKG5vdyBkb25lKSwgZm9yIGhp
bSB0byByZWxlYXNlLWFjawo+IGl0LgoKQWxyZWFkeSBkb25lIHZpYSBJUkMKCgpKdWVyZ2VuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
