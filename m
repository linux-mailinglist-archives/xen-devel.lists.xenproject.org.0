Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFE916EC1D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 18:08:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6den-0004Qy-Uu; Tue, 25 Feb 2020 17:06:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=g8Eh=4N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6dem-0004Qr-BH
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 17:06:04 +0000
X-Inumbo-ID: 19fdd74a-57f1-11ea-9340-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19fdd74a-57f1-11ea-9340-12813bfff9fa;
 Tue, 25 Feb 2020 17:06:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C4AA8AD14;
 Tue, 25 Feb 2020 17:06:01 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200224104645.96381-1-roger.pau@citrix.com>
 <20200224104645.96381-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <136b7e48-7a74-40f2-a394-8305904ff14f@suse.com>
Date: Tue, 25 Feb 2020 18:06:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200224104645.96381-4-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/5] x86: track when in #MC context
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDIuMjAyMCAxMTo0NiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEFkZCBoZWxwZXJz
IHRvIHRyYWNrIHdoZW4gZXhlY3V0aW5nIGluICNNQyBjb250ZXh0LiBUaGlzIGlzIG1vZGVsZWQK
PiBhZnRlciB0aGUgaW5faXJxIGhlbHBlcnMuCgpTYW1lIGNvbmNlcm4gcmVnYXJkaW5nIHRoZSBu
YW1lIGFzIGZvciBOTUksIGkuZS4gcGVyaGFwcwppbl9tY2VfaGFuZGxlcigpIGhlcmUuIChOb3Rl
IGFsc28gdGhlIGFkZGVkICdlJywgd2hpY2ggSSB0aGluawp3b3VsZCBtYWtlIGZvciBzbGlnaHRs
eSBsZXNzIGluIHJpc2sgb2YgYmVjb21pbmcgYW1iaWd1b3VzCm5hbWVzLikgSXQgbWF5IGJlIHdv
cnRod2hpbGUgYWxzbyB0YWxraW5nIGFib3V0IHRoZSBwb3NzaWJsZQooaW4gdGhlb3J5KSBuZXN0
aW5nIGhlcmUsIGFzIHlvdSBkbyBpbiB0aGUgTk1JIHBhdGNoCmRlc2NyaXB0aW9uLiAoSW4gcHJh
Y3RpY2UgbmVzdGluZyBvZiAjTUMgaXMgZmF0YWwsIGJlY2F1c2Ugb2YKdGhlIHN0YWNrIHN3aXRj
aCB3ZSByZXF1ZXN0IHdoZW4gdGhlIGhhbmRsZXIgZ2V0cyBpbnZva2VkLgpCdXQgdGhpcyBpcyBz
b21ldGhpbmcgdGhhdCBjb3VsZCBiZSBjaGFuZ2VkLCBzbyBhc3N1bWluZyBoZXJlCnRoYXQgbmVz
dGluZyBpcyBwb3NzaWJsZSBzZWVtcyBhcHByb3ByaWF0ZSB0byBtZS4pCgpKYW4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
