Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32447FB5DD
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 18:04:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUw1I-0007DC-3M; Wed, 13 Nov 2019 17:01:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SDLk=ZF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUw1G-0007D6-1x
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 17:01:26 +0000
X-Inumbo-ID: 39bb5b68-0637-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39bb5b68-0637-11ea-9631-bc764e2007e4;
 Wed, 13 Nov 2019 17:01:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AB317ADDD;
 Wed, 13 Nov 2019 17:01:24 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c46e975b-ef68-f09a-2790-3c4fb503cbf9@suse.com>
Date: Wed, 13 Nov 2019 18:01:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86: fix clang .macro retention check
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
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgd2VyZSB0d28gcHJvYmxlbXMgaGVyZTogVGhlIGZpcnN0IGNsb3NpbmcgcGFyZW50aGVz
ZXMgZ290IHBhcnNlZApieSBtYWtlIHRvIGVuZCB0aGUgJChjYWxsIGludm9jYXRpb24sIGFuZCB0
aGUgZXNjYXBpbmcgb2YgdGhlIHF1b3Rlcwp3YXNuJ3QgcmlnaHQgZWl0aGVyLCBhcyB0aGVyZSdz
IG5vd2hlcmUgdGhleSB3b3VsZCBnZXQgdW4tZXNjYXBlZC4KClNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tClRoaXMgbmVlZHMgdG8gYmUgdGVzdGVkIGlu
IGFuIGVudmlyb25tZW50IHdoZXJlIHRoaXMgd2FzIGFjdHVhbGx5IGZvdW5kCnRvIG1hdHRlcjsg
SSBjYW4ndCBzZWUgaG93IGl0IGNhbiBoYXZlIHdvcmtlZCBpbiBpdHMgZm9ybWVyIHNoYXBlLiBJ
CmFsc28gZG9uJ3QgdW5kZXJzdGFuZCB3aHkgdGhlIHNhbWUgY29tbWl0IGludHJvZHVjaW5nIHRo
ZSBjaGVjayB0aGF0CmdldHMgZml4ZWQgaGVyZSBwdXQgdGhlIC5za2lwIGNoZWNrIGluIHhlbi9S
dWxlcy5tayAtIHRoZSBvbmx5IHVzZSBvZgouc2tpcCB0aGF0IEkgY2FuIHNwb3QgaXMgaW4geDg2
IGNvZGUuCgotLS0gYS9Db25maWcubWsKKysrIGIvQ29uZmlnLm1rCkBAIC02LDYgKzYsOCBAQCBl
bmRpZgogCiAjIENvbnZlbmllbnQgdmFyaWFibGVzCiBjb21tYSAgIDo9ICwKK29wZW4gICAgOj0g
KAorY2xvc2UgICA6PSApCiBzcXVvdGUgIDo9ICcKICMnIEJhbGFuY2luZyBzcXVvdGUsIHRvIGhl
bHAgc3ludGF4IGhpZ2hsaWdodGluZwogZW1wdHkgICA6PQotLS0gYS94ZW4vYXJjaC94ODYvUnVs
ZXMubWsKKysrIGIveGVuL2FyY2gveDg2L1J1bGVzLm1rCkBAIC04Miw2ICs2NCw2IEBAICQoY2Fs
bCBhcy1vcHRpb24tYWRkLENGTEFHUyxDQywiLmluY2x1ZGUKICMgQ2hlY2sgd2hldGhlciBjbGFu
ZyBrZWVwcyAubWFjcm8tcyBiZXR3ZWVuIGFzbSgpLXM6CiAjIGh0dHBzOi8vYnVncy5sbHZtLm9y
Zy9zaG93X2J1Zy5jZ2k/aWQ9MzYxMTAKICQoY2FsbCBhcy1vcHRpb24tYWRkLENGTEFHUyxDQyxc
Ci0gICAgICAgICAgICAgICAgICAgICAiLm1hY3JvIEZPT1xuLmVuZG1cIik7IGFzbSB2b2xhdGls
ZSAoXCIubWFjcm8gRk9PXG4uZW5kbSIsXAorICAgICAgICAgICAgICAgICAgICAgIi5tYWNybyBG
T09cbi5lbmRtIiQkKGNsb3NlKTsgYXNtIHZvbGF0aWxlICQkKG9wZW4pIi5tYWNybyBGT09cbi5l
bmRtIixcCiAgICAgICAgICAgICAgICAgICAgICAtbm8taW50ZWdyYXRlZC1hcykKIGVuZGlmCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
