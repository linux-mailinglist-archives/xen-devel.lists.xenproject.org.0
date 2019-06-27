Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DD357ADA
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 06:54:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgMOA-0003WI-Dq; Thu, 27 Jun 2019 04:52:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=peA9=U2=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1hgMO8-0003WD-6s
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 04:52:00 +0000
X-Inumbo-ID: 4b75f07d-9897-11e9-8980-bc764e045a96
Received: from mail-yb1-xb41.google.com (unknown [2607:f8b0:4864:20::b41])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4b75f07d-9897-11e9-8980-bc764e045a96;
 Thu, 27 Jun 2019 04:51:58 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id e197so813061ybb.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2019 21:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=KLNVr68Mr/5v5++S3sCjoA/ypvzuAao+zMmrWE/LuHA=;
 b=F6TnC5xT4scapeoYuktyW8HlWFJyPYG28t9IxPPm/tMuzc6GJTD+VYv6CUafQ4lDKV
 5MgXcnzGRp/Cab5mYzzvo12i3/qjccUMIhPMhsclm9Ua3PzoOl8bS3SdEXaeUZv2vBml
 XmY8ZtlXyVIEDT0dTGMO6DBj9L1toEFB4HYsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=KLNVr68Mr/5v5++S3sCjoA/ypvzuAao+zMmrWE/LuHA=;
 b=rs0vtOnDv4cadCth6ejfIXPi7jpfQy32+3dQ6XzIbprKPC2zojHLsFfTkcRuGijQu1
 D+OBArdMZcBdiss2xl2QDets549qQ7soTr06Cw5uEWAh6o8d/GTTqf2Hs5PO3BEHQR0E
 yN8nEu4oxHi+BAY2OKdVAGxRUGgaCaRoqPlmbJiHaZostS1uEu0GIaKYsJ3GyLwU0jRa
 afFYpvcy8Hu9ok7ILUcQWDruqLruMiiVVuHrOLfdbbjoVBHu4YFy7Z9p81HMMxxEGRtY
 vr6+s6StrzaRwoaNbH6iGQp0s6005A/CR7C+/iw9kBVtOVj3sTwfb3cTBWT/u+32XWl3
 Y+2w==
X-Gm-Message-State: APjAAAU2X6pCckPVe8S3LeUAMzoqPzlHHgIyjmJZetInPkbT59ku4HNa
 Np5jqGVWaR0gtdF64JRnZrGy4Q==
X-Google-Smtp-Source: APXvYqzOnUvSEy5yALjFxDouB+xipwcpr1loKhb5c4dCaC8ZKK7N3ZoAXs+JUAAJuoO29UTbS4oNiQ==
X-Received: by 2002:a25:2085:: with SMTP id g127mr1386224ybg.442.1561611118272; 
 Wed, 26 Jun 2019 21:51:58 -0700 (PDT)
Received: from doug-macbook.localdomain
 ([2600:1700:7b90:52f0:b860:465b:6d69:7b92])
 by smtp.gmail.com with ESMTPSA id p17sm278774ywp.96.2019.06.26.21.51.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Jun 2019 21:51:57 -0700 (PDT)
Date: Wed, 26 Jun 2019 23:51:57 -0500
From: Doug Goldstein <cardoe@cardoe.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190627045157.7cs4ic3ic2wxo7ft@doug-macbook.localdomain>
Mail-Followup-To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20190626173615.12419-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626173615.12419-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] xen/Kconfig: Fix -Wformat-security when
 compiling with Clang
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDY6MzY6MTVQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBDbGFuZyBvYnNlcnZlczoKPiAKPiB0b29scy9rY29uZmlnL2NvbmYuYzo3NzoxMDoK
PiB3YXJuaW5nOiBmb3JtYXQgc3RyaW5nIGlzIG5vdCBhIHN0cmluZyBsaXRlcmFsIChwb3RlbnRp
YWxseSBpbnNlY3VyZSkKPiAgICAgICBbLVdmb3JtYXQtc2VjdXJpdHldCj4gICAgICAgICAgICAg
ICAgIHByaW50ZihfKCJhYm9ydGVkIVxuXG4iKSk7Cj4gICAgICAgICAgICAgICAgICAgICAgICBe
fn5+fn5+fn5+fn5+fn5+fgo+IAo+IEFuZCBpdCBpcyBhYnNvbHV0ZWx5IGNvcnJlY3QuICBnZXR0
ZXh0KCkgY2FuIGVhc2lseSByZXR1cm4gYSBzdHJpbmcgd2l0aCBhICUKPiBpbi4KPiAKPiBUaGlz
IGNvdWxkIGJlIGZpeGVkIGJ5IHN3aXRjaGluZyB0byB1c2luZyBwcmludGYoIiVzIiwgXyguLi4p
KSwgb3IgYnkKPiBzd2l0Y2hpbmcgdG8gcHV0cygpIChhcyB0aGVyZSBpcyBubyBmb3JtYXR0aW5n
IGdvaW5nIG9uKSwgYnV0IHRoZSBiZXR0ZXIKPiBvcHRpb24gaXMgZm9sbG93IExpbnV4IGFuZCBy
ZW1vdmUgbG9jYWxpc2F0aW9uIHN1cHBvcnQuCj4gCj4gTGludXggY2hhbmdlc2V0OiA2OTRjNDlh
N2MwMWNjODcxOTRiZTQwY2IyNjQwNGI1OGI2OGMyOTFjCj4gQXV0aG9yOiBTYW0gUmF2bmJvcmcg
PHNhbUByYXZuYm9yZy5vcmc+Cj4gRGF0ZTogICBUdWUgTWF5IDIyIDIwOjM2OjEyIDIwMTgKPiAK
PiBrY29uZmlnOiBkcm9wIGxvY2FsaXphdGlvbiBzdXBwb3J0Cj4gCj4gVGhlIGxvY2FsaXphdGlv
biBzdXBwb3J0IGlzIGJyb2tlbiBhbmQgYXBwZWFycyB1bnVzZWQuCj4gVGhlcmUgaXMgbm8gZ29v
Z2xlIGhpdHMgb24gdGhlIHVwZGF0ZS1wby1jb25maWcgdGFyZ2V0Lgo+IEFuZCB0aGVyZSBpcyBu
byByZWNlbnQgKDUgeWVhcnMpIGFjdGl2aXR5IHJlbGF0ZWQgdG8gdGhlIGxvY2FsaXphdGlvbi4K
PiAKPiBTbyBsZXRzIGp1c3QgZHJvcCB0aGlzIGFzIGl0IGlzIG5vIGxvbmdlciB1c2VkLgo+IAo+
IFN1Z2dlc3RlZC1ieTogVWxmIE1hZ251c3NvbiA8dWxmYWxpemVyQGdtYWlsLmNvbT4KPiBTdWdn
ZXN0ZWQtYnk6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IFNpZ25l
ZC1vZmYtYnk6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+
Cj4gCj4gW1BvcnRlZCB0byBYZW5dCj4gUmVwb3J0ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CgpJIGhhdmVuJ3QgYnVpbHQgdGhpcyBsb2NhbGx5IGJ1dCBv
dmVyYWxsIEkgdGhpbmsgdGhpcyBpcyBhIGdvb2QgYmFja3BvcnQKdG8gZG8uIEluIHRoZSBwYXN0
IHRoZXJlIHdlcmUgYSBsb3Qgb2YgY29uY2VybnMgYWJvdXQgdGhlIHNpemUgb2YgdGhlCktjb25m
aWcgY29kZSBiYXNlIHRoYXQgd2Ugd2VyZSBicmluZ2luZyBpbnRvIHRoZSB0cmVlIGFuZCBzb21l
IG9mIHRoZQpmdW5jdGlvbmFsaXR5IHRoYXQgc2VlbWVkIGxlc3MgdGhhbiBuZWNlc3NhcnkuIFRo
ZSBhcHByb2FjaCB3YXMgdGFrZW4gdG8KYWx3YXlzIGJhY2twb3J0IGZyb20gTGludXggdG8gZWFz
ZSB0aGUgbWFpbnRlbmFuY2UgYnVyZGVuIGZvciBYZW4gYnV0IGEKYmFja3BvcnQgbGlrZSB0aGlz
IHNlZW1zIGxpa2UgaXQgYWNoaWV2ZXMgYm90aCBnb2Fscy4KCkFja2VkLWJ5OiBEb3VnIEdvbGRz
dGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
