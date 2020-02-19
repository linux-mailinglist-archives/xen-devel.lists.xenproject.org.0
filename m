Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC78716450A
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 14:10:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4P4L-0004R8-PI; Wed, 19 Feb 2020 13:07:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gcDT=4H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j4P4K-0004R3-W2
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 13:07:13 +0000
X-Inumbo-ID: bd28fa72-5318-11ea-8358-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd28fa72-5318-11ea-8358-12813bfff9fa;
 Wed, 19 Feb 2020 13:07:11 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w15so461877wru.4
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2020 05:07:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JHaGXinZHCufqjp0ivBaCObEiJZopX4gtjvH+dS6QOE=;
 b=lEPWkhwB9KtVdNb+wND9/7rzFYnaEPcl3thzvuoHJtAyzjcMd0TX4J2O17ljqvVIt9
 OyWFIGBoWFq5kooaUgHmBUA+tgVUA6p6V996H6RjyO8S6Nw8rtuv6vH0Npqh2BPwZbDm
 Hr6PrBRKiNlScuwIJSExlglIqjl8ALHBB6U4sGOIlnTxJ/i+6ZpLFSg6M3BdWcf7tCL5
 CberLBBCAkzUenZOAQiDNjEb+vc4Hb8CVlPRV7Fws9uYAxtoZ64Cg3ic8dOeZArVwR/A
 2gtK3T9pQmDVy6SI0ElY4GAdqFhCS57z5rgJdixEzrsZJrDBHUtzTV0Jq0sosntXOU/R
 90gw==
X-Gm-Message-State: APjAAAU01csj0OIkIHUvjnJrjod1FDGyK6AdQ/DJWdDn2nQEqwQYDxbg
 2FScUTfK81PxxViVppu1LtY=
X-Google-Smtp-Source: APXvYqxKrNDdOtys1sZS1oP15z/NhKKkTsOSeHxHBxcPl2Jh8tHaVK8wu6FrxMT2LfHh/taGmnIVHw==
X-Received: by 2002:a5d:610a:: with SMTP id v10mr35017660wrt.267.1582117630253; 
 Wed, 19 Feb 2020 05:07:10 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id r1sm2840905wrx.11.2020.02.19.05.07.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2020 05:07:09 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <6d0074de-972a-317c-9df6-f4ece26febf4@suse.com>
 <06b8eb42-09e0-2607-36fc-b551f45e4fdf@citrix.com>
 <f65a3f96-0b67-a0c6-85ec-a9c06f237458@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <dc463b32-9dcc-61ff-b4a5-b6d75c4f6099@xen.org>
Date: Wed, 19 Feb 2020 13:07:08 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <f65a3f96-0b67-a0c6-85ec-a9c06f237458@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2] sysctl: use xmalloc_array() for
 XEN_SYSCTL_page_offline_op
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxOS8wMi8yMDIwIDEyOjQ5LCBKYW4gQmV1bGljaCB3cm90ZToKPiBKdWxpZW4sCj4gCj4g
T24gMTguMDIuMjAyMCAxNzo1MywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTgvMDIvMjAy
MCAxNjo1MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBUaGlzIGlzIG1vcmUgcm9idXN0IHRoYW4g
dGhlIHJhdyB4bWFsbG9jX2J5dGVzKCkuCj4+Pgo+Pj4gQWxzbyBhZGQgYSBzYW5pdHkgY2hlY2sg
b24gdGhlIGlucHV0IHBhZ2UgcmFuZ2UsIHRvIGF2b2lkIHJldHVybmluZwo+Pj4gdGhlIGxlc3Mg
YXBwbGljYWJsZSAtRU5PTUVNIGluIHN1Y2ggY2FzZXMgKGFuZCB0cnlpbmcgdGhlIGFsbG9jYXRp
b24gaW4KPj4+IHRoZSBmaXJzdCBwbGFjZSkuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pgo+PiBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAKPiBJIG5vdGljZSB5b3UndmUgY29tbWl0dGVk
IHRoaXMsIGJ1dCBzb21laG93IHlvdSd2ZSBsb3N0IEFuZHJldydzCj4gYWNrLiBJIGRvbid0IHRo
aW5rIGl0IHdhcyBpbnRlbmRlZCBieSB0aGUgcmVjZW50IGNoZWNrLWluIHBvbGljeQo+IGNoYW5n
ZSBmb3IgY29tbWl0cyB0byBnbyBpbiB3aXRob3V0IHN1aXRhYmxlIGFja3MgKGlpcmMgSSBkaWQK
PiBub3RpY2UgYSBmZXcgb3RoZXJzIHJlY2VudGx5IGFzIHdlbGwsIGFsYmVpdCBub3Qgb25lcyBj
b21taXR0ZWQKPiBieSB5b3UpLgoKSW4gdGhpcyBjYXNlLCB0aGlzIHdhcyBhIGxhY2sgb2YgYXR0
ZW50aW9uIHdoaWxlIGNvbW1pdHRpbmcgdGhlIHBhdGNoLgoKTWlzdGFrZXMgY2FuIGhhcHBlbiBh
bmQgdGhpcyBoYXMgbm90aGluZyB0byBkbyB3aXRoIGEgY2hlY2staW4gcG9saWN5LgpZb3Ugd2ls
bCBuZXZlciBiZSBhYmxlIHRvIGZ1bGx5IHByZXZlbnQgYW55IG1pc3Rha2VzIHVudGlsIHlvdSBy
ZW1vdmUgCnRoZSBodW1hbiBmcm9tIHRoZSBlcXVhdGlvbi4gUGxlYXNlIHByb3ZpZGUgc2NyaXB0
cyB0aGF0IGZ1bGx5IGF1dG9tYXRlIAp0aGUgY29tbWl0dGVycyBqb2IgaWYgeW91IGFyZSBjb25j
ZXJuIGFib3V0IHRoaXMuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
