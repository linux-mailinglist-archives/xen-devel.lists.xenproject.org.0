Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E44114EAA
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 11:02:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idANo-0000k8-Bi; Fri, 06 Dec 2019 09:58:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z/5o=Z4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1idANn-0000k3-7c
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 09:58:43 +0000
X-Inumbo-ID: fbb82ac8-180e-11ea-a4aa-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fbb82ac8-180e-11ea-a4aa-bc764e2007e4;
 Fri, 06 Dec 2019 09:58:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7A522AC53;
 Fri,  6 Dec 2019 09:58:41 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191205223008.8623-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <36c45366-35e2-68a9-fbc7-01fd935bf720@suse.com>
Date: Fri, 6 Dec 2019 10:58:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191205223008.8623-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/6] xen: Support continuations from tasklets
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMTIuMjAxOSAyMzozMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBGcm9tIHRlc3Rpbmcg
dGhpcyBzZXJpZXMsIEkgaGF2ZSByZS1jb25maXJtZWQgdGhlIHByZXZpb3VzIHJlcG9ydGVkCj4g
b2JzZXJ2YXRpb24gdGhhdDoKPiAKPiAgICMgd2hpbGUgOjsgZG8geGVuLWhwdG9vbCBzbXQtZW5h
YmxlOyB4ZW4taHB0b29sIHNtdC1kaXNhYmxlOyBkb25lCj4gCj4gaW4gZG9tMCBldmVudHVhbGx5
IGNhdXNlcyB0aGUgc2VyaWFsIGNvbnNvbGUgdG8gY2Vhc2Ugd29ya2luZyAod2VkZ2UgbWlkd2F5
Cj4gdGhyb3VnaCBwcmludGluZyBhIGxpbmUpLgo+IAo+IFRoZXJlIGFyZSBzcG9yYWRpYyAiQnJv
a2UgYWZmaW5pdHkgZm9yIElSUTI2LCBuZXc6IGZmZmYiIG1lc3NhZ2VzLCBidXQgdGhlCj4gc2Vy
aWFsIGFsd2F5cyBzZWVtcyB0byBicmVhayBzaG9ydGx5IGFmdGVyIHRoZSBmaXJzdCAiQnJva2Ug
YWZmaW5pdHkgZm9yCj4gSVJRMzAsIG5ldzogZmZmZiIuICBCb3RoIElSUXMgYXJlIG5vbi1kZXNj
cmlwdCBQQ0ktTVNJLy1YIGludGVycnVwdHMgYm91bmQgdG8KPiBkb20wLgoKQW5kIG5laXRoZXIg
SVJRMzAgbm90IElSUTI2IGFyZSB0aGUgc2VyaWFsIG9uZXM/IEFuZCBzZXJpYWwgZG9lcwp1c2Ug
YW4gSVJRIChpLmUuIGlzbid0IHJ1bm5pbmcgaW4gcG9sbGluZyBtb2RlKT8gSSdsbCBzZWUgaWYg
SQpjYW4gcmVwcm8gKGFuZCB0aGVuIG1heWJlIGJlIGFibGUgdG8gZGVidWcpLgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
