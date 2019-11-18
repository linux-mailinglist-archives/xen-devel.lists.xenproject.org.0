Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE08FFE39
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 07:13:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWaDW-00084A-Cw; Mon, 18 Nov 2019 06:08:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EeMw=ZK=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iWaDV-000845-8d
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 06:08:53 +0000
X-Inumbo-ID: e48f7f20-09c9-11ea-a2d5-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e48f7f20-09c9-11ea-a2d5-12813bfff9fa;
 Mon, 18 Nov 2019 06:08:52 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id a15so17911869wrf.9
 for <xen-devel@lists.xenproject.org>; Sun, 17 Nov 2019 22:08:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HSqhQ9C44kP7V7MAADbz1mC1XZJWlwAuSfsw5ohkw4g=;
 b=TGNMJRkANFJDZiXYYjH7f5KQSgphWepG2yfyR4m5P1FnfAcs1z//1xzLOGvJ68XEdA
 Hs4EGw/ygPxWM0sHBtfjm8faZfTgu3eeIde49Axc61FZIUe9t98Q0PgEir31NUJ5MmrE
 beD3CaZzF9taPHKKMzBloP1D1Y7XEQI3QMXhkdLM8cFTJ+IF4nilvcJAUfKthoDosMXH
 gceD+RLSD4QifJ0c3maSrlhyVUhgv8UL1i7KqCnAwbLQYuO5Dwt99uXp5odgO2iD9eF8
 67vDJ48cXtUYbDEhB76jyRHyBpYuMUkNUs/KkWds1Oal+MOC2UUXwpSIsguUOJ1MPWUJ
 2dyQ==
X-Gm-Message-State: APjAAAWNePU7IBokd4rrxc52HLlfLfIPKWAIDOQVUo/g+l/43inmDzBX
 PVcqASp755XXnc9IuDyYl38=
X-Google-Smtp-Source: APXvYqzux+1bQdaE8WwD9V8CGx0rO21Ngw9X6NslbIEDpvuirlkO/g7dqelaE9Pd7Zmb2bvJ74RvQQ==
X-Received: by 2002:a5d:51c9:: with SMTP id n9mr10800992wrv.6.1574057331247;
 Sun, 17 Nov 2019 22:08:51 -0800 (PST)
Received: from [192.168.1.155]
 (cpc91200-cmbg18-2-0-cust94.5-4.cable.virginm.net. [81.100.41.95])
 by smtp.gmail.com with ESMTPSA id n65sm20235164wmf.28.2019.11.17.22.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Nov 2019 22:08:50 -0800 (PST)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-2-git-send-email-andrii.anisov@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ab7926ed-3aa9-6194-ce45-c9cbf726852d@xen.org>
Date: Mon, 18 Nov 2019 06:08:47 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1573031953-12894-2-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [RFC 1/7] xen: clang: Support correctly
 cross-compile
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwNi8xMS8yMDE5IDA5OjE5LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEZyb206IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gCj4gQ2xhbmcgdXNlcyAiLXRhcmdl
dCIgb3B0aW9uIGZvciBjcm9zcy1jb21waWxhdGlvbi4KCldoaWxlIEkgYXBwcmVhY2lhdGUgeW91
IHdhbnQgdG8gY2FycnkgdGhpcyB3b3JrLCB0aGVyZSB3ZXJlIGEgbGVuZ2h0eSAKZGlzY3Vzc2lv
biB3aGVuIEkgc2VudCB0aGUgcGF0Y2ggKHNlZSBbMV0pLiBUaGlzIHNob3VsZCBoYXZlIGJlZW4g
CmFkZHJlc3NlZCBiZWZvcmUgcmVzZW5kaW5nIGl0IChldmVuIHBhcnQgb2YgYW4gUkZDKS4KCkJ1
dCwgQUZBSUNULCB5b3UgZG9uJ3QgdXNlIGNsYW5nPXkgZm9yIHRoaXMgc2VyaWVzLiBTbyB3aHkg
ZGlkIHlvdSAKaW5jbHVkZSBpdCBpbiB0aGlzIHNlcmllcz8KCkNoZWVycywKClsxXSA8MjAxOTAz
MjcxODQ1MzEuMzA5ODYtMi1qdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IC0tLQo+ICAgY29uZmlnL1N0
ZEdOVS5tayB8IDkgKysrKysrKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9jb25maWcvU3RkR05VLm1rIGIvY29u
ZmlnL1N0ZEdOVS5tawo+IGluZGV4IDAzOTI3NGUuLjQ4YzUwYjUgMTAwNjQ0Cj4gLS0tIGEvY29u
ZmlnL1N0ZEdOVS5tawo+ICsrKyBiL2NvbmZpZy9TdGRHTlUubWsKPiBAQCAtMSw4ICsxLDEzIEBA
Cj4gICBBUyAgICAgICAgID0gJChDUk9TU19DT01QSUxFKWFzCj4gICBMRCAgICAgICAgID0gJChD
Uk9TU19DT01QSUxFKWxkCj4gICBpZmVxICgkKGNsYW5nKSx5KQo+IC1DQyAgICAgICAgID0gJChD
Uk9TU19DT01QSUxFKWNsYW5nCj4gLUNYWCAgICAgICAgPSAkKENST1NTX0NPTVBJTEUpY2xhbmcr
Kwo+ICtpZm5lcSAoJChDUk9TU19DT01QSUxFKSwpCj4gK0NDICAgICAgICAgPSBjbGFuZyAtdGFy
Z2V0ICQoQ1JPU1NfQ09NUElMRTotPSkKPiArQ1hYICAgICAgICA9IGNsYW5nKysgLXRhcmdldCAk
KENST1NTX0NPTVBJTEU6LT0pCj4gK2Vsc2UKPiArQ0MgICAgICAgICA9IGNsYW5nCj4gK0NYWCAg
ICAgICAgPSBjbGFuZysrCj4gK2VuZGlmCj4gICBMRF9MVE8gICAgID0gJChDUk9TU19DT01QSUxF
KWxsdm0tbGQKPiAgIGVsc2UKPiAgIENDICAgICAgICAgPSAkKENST1NTX0NPTVBJTEUpZ2NjCj4g
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
