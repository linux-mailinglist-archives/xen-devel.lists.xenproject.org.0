Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 317DBB11BA
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 17:03:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8QZm-0006rY-Lj; Thu, 12 Sep 2019 15:00:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8QZl-0006k1-1S
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 15:00:01 +0000
X-Inumbo-ID: fcc6f37f-d56d-11e9-959c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fcc6f37f-d56d-11e9-959c-12813bfff9fa;
 Thu, 12 Sep 2019 14:59:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9EFB7ACB7;
 Thu, 12 Sep 2019 14:59:57 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1568272949-1086-1-git-send-email-chao.gao@intel.com>
 <1568272949-1086-11-git-send-email-chao.gao@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <af231298-4f87-615f-0b52-3466c717358d@suse.com>
Date: Thu, 12 Sep 2019 16:59:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1568272949-1086-11-git-send-email-chao.gao@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v10 10/16] microcode: unify ucode loading
 during system bootup and resuming
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAwOToyMiwgQ2hhbyBHYW8gd3JvdGU6Cj4gRHVyaW5nIHN5c3RlbSBib290
dXAgYW5kIHJlc3VtaW5nLCBDUFVzIGp1c3QgbG9hZCB0aGUgY2FjaGVkIHVjb2RlLgo+IFNvIG9u
ZSB1bmlmaWVkIGZ1bmN0aW9uIG1pY3JvY29kZV91cGRhdGVfb25lKCkgaXMgaW50cm9kdWNlZC4g
SXQKPiB0YWtlcyBhIGJvb2xlYW4gdG8gaW5kaWNhdGUgd2hldGhlciAtPnN0YXJ0X3VwZGF0ZSBz
aG91bGQgYmUgY2FsbGVkLgo+IFNpbmNlIGVhcmx5X21pY3JvY29kZV91cGRhdGVfY3B1KCkgaXMg
b25seSBjYWxsZWQgb24gQlNQIChBUHMgY2FsbAo+IHRoZSB1bmlmaWVkIGZ1bmN0aW9uKSwgc3Rh
cnRfdXBkYXRlIGlzIGFsd2F5cyB0cnVlIGFuZCBzbyByZW1vdmUKPiB0aGlzIHBhcmFtZXRlci4K
PiAKPiBUaGVyZSBpcyBhIGZ1bmN0aW9uYWwgY2hhbmdlOiAtPnN0YXJ0X3VwZGF0ZSBpcyBjYWxs
ZWQgb24gQlNQIGFuZAo+IC0+ZW5kX3VwZGF0ZV9wZXJjcHUgaXMgY2FsbGVkIGR1cmluZyBzeXN0
ZW0gcmVzdW1pbmcuIFRoZXkgYXJlIG5vdAo+IGludm9rZWQgYnkgcHJldmlvdXMgbWljcm9jb2Rl
X3Jlc3VtZV9jcHUoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50
ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
