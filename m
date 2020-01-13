Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B3B139572
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 17:05:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir2AS-0002q4-H2; Mon, 13 Jan 2020 16:02:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A39C=3C=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ir2AQ-0002pz-NL
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 16:02:14 +0000
X-Inumbo-ID: 10104ba4-361e-11ea-8293-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 10104ba4-361e-11ea-8293-12813bfff9fa;
 Mon, 13 Jan 2020 16:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578931334;
 h=to:cc:from:subject:message-id:date:mime-version:
 content-transfer-encoding;
 bh=eq21YSl67r+e1drRr4fNty7Zo4reRYZ3Y6D14S01rv8=;
 b=A/ClgQdWPxDzdbnwM1quDuNmWfCl6TtAn1SVHb6bR7wYHapw38o0maMD
 USZCtDbiaa5Nzqe9Ba/5l1iAfamfBBT8T+BRWGHnQYIQ1bgl/cYqc73l2
 xTjruLfAAoym1jBzgS06TpsGlODA66P+gCsQWsBNJZV/gLUaMj5LDmlR7 c=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FGCqgyC/0FXfEVRh3vwoIs9zeJyt/vkdHBd3A7lEOz9YTzPEJFfL3Jpdyw9cvAxYx42nc9GU46
 rFrUP7LFgGQw5kuZUEN7//XSHu1H1bPB8jD9jtPmoyUqi5mEfjBiG/5Ulz8U7zQfuGSOYjU96V
 ostkESyp6cACOH1xEmnWF8piVdSPf+ePw6B5HMROJ1MOtciLH64SiAa9kfoOs312dA7lXDJ7d0
 LSIivcdvmc41I+oCi+yAfb7NNJytinvBecURQfzjNvPm6GL2vcS4upqOyf1sMZaurOHol3bQqF
 IG8=
X-SBRS: 2.7
X-MesageID: 11209481
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,429,1571716800"; d="scan'208";a="11209481"
To: xen-devel <xen-devel@lists.xenproject.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <8b795995-4f61-af08-2ead-5a841cb709f0@citrix.com>
Date: Mon, 13 Jan 2020 16:02:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: [Xen-devel] EFI development issues
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
Cc: Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpNeSByZWNlbnQgYm9vdCBwYWdldGFibGUgY2hhbmdlcyBoYXZlIGNhdXNlZCBtZSB0
byB3b3JrIHdpdGggdGhlIEVGSQpidWlsZCBvZiBYZW4gcmF0aGVyIG1vcmUgdGhhbiBwcmV2aW91
c2x5LgoKRmlyc3QsIHRoZXJlIGlzIGEgZGVwZW5kZW5jeSB0cmFja2luZyBidWcgaW4gdGhlIGJ1
aWxkIHN5c3RlbS7CoCBFZGl0cyB0bwp4ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmggZG9uJ3Qg
Y2F1c2UgeGVuLmVmaSB0byBiZSByZWdlbmVyYXRlZC7CoCBGcm9tCndoYXQgSSBjYW4gdGVsbCwg
dGhlIGZpbGUgZG9lc24ndCBldmVuIGdldCByZWNvbXBpbGVkLCBiZWNhdXNlIHN5bnRheAplcnJv
cnMgZXZlbiBnbyB1bm5vdGljZWQuCgpTZWNvbmQsIGFuZCB0aGUgbWFpbiBwb2ludCBvZiB0aGUg
ZW1haWwuCgpUaGUgRUZJIGNvZGUgaGFzIHNvbWUgbG9naWMgd2hpY2ggZG9lczoKCmlmICggIWJh
c2VfdmlkZW8gKQp7CsKgwqDCoCAuLi4KCsKgwqDCoCBpZiAoIGJlc3QgIT0gU3RkT3V0LT5Nb2Rl
LT5Nb2RlICkKwqDCoMKgIMKgwqDCoCBTdGRPdXQtPlNldE1vZGUoU3RkT3V0LCBiZXN0KTsKfQoK
anVzdCBiZWZvcmUgcHJpbnRpbmcgb3V0IHRoZSBYZW4gYmFubmVyLsKgIFRoaXMgaGFzIGEgc2lk
ZSBlZmZlY3Qgb2YKY2F1c2luZyBhbGwgZnVydGhlciB1c2Ugb2YgU3RkT3V0L1N0ZEVyciB0byBj
ZWFzZSB3b3JraW5nLCBhbmQKaW50ZXJmZXJpbmcgY29tcGxldGVseSB3aXRoIGRlYnVnZ2luZyBh
Y3Rpdml0aWVzLsKgIChXYWl0aW5nIGZvciBhCmtleXByZXNzIG9uIFN0ZEluIGhvd2V2ZXIgZG9l
cyB3b3JrLCB3aGljaCBpcyBob3cgSSBldmVudHVhbGx5IGRpYWdub3NlZAp0aGF0IGl0IHdhcyBh
biBvdXRwdXQgcHJvYmxlbS4pwqAgU2tpcHBpbmcgdGhpcyBsb2dpYyBhbGxvd3MgZGVidWdnaW5n
IHRvCndvcmsuCgpUaGUgY29kZSBhcHBlYXJlZCBpbiBiZjY1MDFhNjIgIng4Ni02NDogRUZJIGJv
b3QgY29kZSIgYW5kIGhhcyBubwpzcGVjaWZpYyBkZXNjcmlwdGlvbiBvZiB3aGF0IGl0IGlzIGRv
aW5nIGFuZC9vciB0cnlpbmcgdG8gYWNoaWV2ZS4KCkl0IGlzIGFsc28gbm90IGVudGlyZWx5IGNs
ZWFyIHdoeSBpdCBpcyBnYXRlZCBvbiBoYXZpbmcgYSBjZmcgZmlsZSBpbgp0aGUgZmlyc3QgcGxh
Y2UgKGMvcyAsYzM4Y2Y4NjVlYzgsIG5vdCB0aGF0IHRoZXJlIGlzIGFkZXF1YXRlIGNvbnRleHQK
Zm9yIHdoeSkgb3Igd2h5IHRoZXJlIGlzIGEgWGVuIGNvbW1hbmQgbGluZSBhcmd1bWVudCAiLWJh
c2V2aWRlbyIKaW50cm9kdWNlZCBpbiB0aGUgYmVnaW5uaW5nIHRvIHNraXAgdGhpcyBiZWhhdmlv
dXIuCgpBcyBhIHBvaW50IG9mIHJlZmVyZW5jZSwgSSBkb24ndCBzZWUgTGludXggbWFraW5nIGFu
eSBTZXRNb2RlIGNhbGxzLgoKV2hhdCBpcyB0aGUgcHVycG9zZSBvZiBjaGFuZ2luZyB0byBhIGRp
ZmZlcmVudCBtb2RlP8KgIENlcnRhaW5seSBhcyBmYXIKYXMgc2VyaWFsIGNvbnNvbGVzIGdvLCBz
dGlja2luZyB3aXRoIHRoZSBtb2RlIHRoZSBsb2FkZXIgdXNlcyBjZXJ0YWlubHkKZmVlbHMgbGlr
ZSBhIHNhZmVyIG9wdGlvbi4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
