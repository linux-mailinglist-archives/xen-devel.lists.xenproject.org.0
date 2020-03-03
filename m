Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E17141773A7
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 11:14:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j94Wz-0000PL-OH; Tue, 03 Mar 2020 10:12:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wYci=4U=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j94Wx-0000PG-Pv
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 10:12:03 +0000
X-Inumbo-ID: 6c9f2a14-5d37-11ea-a0dc-12813bfff9fa
Received: from mail-ed1-f67.google.com (unknown [209.85.208.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c9f2a14-5d37-11ea-a0dc-12813bfff9fa;
 Tue, 03 Mar 2020 10:12:02 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id dc19so3552407edb.10
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2020 02:12:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QFxG9RCA40BrkjxxC1U2JfSdDk/sXGRl4lMZI+3OtTI=;
 b=bGRxDOBCwyOgEQGHyr7bzLeadZIay+1dd/UqGAVouECdVxgoUFUNmKvvrRVqcrVhrl
 n24PTDrl9q1e+hhIfdr3QgrKa15viIUlbJINdJl9xIIKNmayRqH3TsgOcbSYPAJq/5w7
 8QkQ9Quj+4hV+0aktFjBTlW16fV3xld9rywTnGhuSQYo+WTd3PdeEetq/vXJpAZW67uv
 Ut25NqGhbcSTOI+xP8pG4UnmnuWvqtmTSDN7AykRU7ZDnfX6wnn+MNI+dT2ESQDCt+hz
 do45m726lKyX9TTCfvHMPpj0ZN4QHRAnv0eh0mSWFRsq7o6s05GekNo+C5QSYcaFCP3f
 wh8g==
X-Gm-Message-State: ANhLgQ2rKO8kR9FEf9/DumtXM9CV2yLLpnSbu4a6fgPR7OJfLCk6R9Og
 +5lWXgReMtRk4A9TAA/A1yA=
X-Google-Smtp-Source: ADFU+vv1ScCTAYe2G90HyG56h26u7ytSes9n9XZ4/8Se5c6R9tx9vXtqxhfkY00XY6UOqxDWzuhJPQ==
X-Received: by 2002:a50:ec89:: with SMTP id e9mr3297178edr.123.1583230321762; 
 Tue, 03 Mar 2020 02:12:01 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-230.amazon.com.
 [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id by19sm635002ejc.85.2020.03.03.02.12.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2020 02:12:00 -0800 (PST)
To: Dongli Zhang <dongli.zhang@oracle.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20200303015859.18813-1-dongli.zhang@oracle.com>
 <20200303015859.18813-2-dongli.zhang@oracle.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4c2594c8-9146-fbd9-6074-9c8366afb391@xen.org>
Date: Tue, 3 Mar 2020 10:11:59 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200303015859.18813-2-dongli.zhang@oracle.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 2/2] xenbus: req->err should be updated
 before req->state
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
Cc: jgross@suse.com, boris.ostrovsky@oracle.com, sstabellini@kernel.org,
 joe.jin@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwMy8wMy8yMDIwIDAxOjU4LCBEb25nbGkgWmhhbmcgd3JvdGU6Cj4gVGhpcyBwYXRj
aCBhZGRzIHRoZSBiYXJyaWVyIHRvIGd1YXJhbnRlZSB0aGF0IHJlcS0+ZXJyIGlzIGFsd2F5cyB1
cGRhdGVkCj4gYmVmb3JlIHJlcS0+c3RhdGUuCj4gCj4gT3RoZXJ3aXNlLCByZWFkX3JlcGx5KCkg
d291bGQgbm90IHJldHVybiBFUlJfUFRSKHJlcS0+ZXJyKSBidXQKPiByZXEtPmJvZHksIHdoZW4g
cHJvY2Vzc193cml0ZXMoKS0+eGJfd3JpdGUoKSBpcyBmYWlsZWQuCgpUaGUgbWVtb3J5IGJhcnJp
ZXIgYmVsb3cgbG9va3MgZ29vZC4gSG93ZXZlciwgYXMgbWVudGlvbm5lZCBpbiBwYXRjaCAjMSwg
CmJhcnJpZXIoKSBpcyBub3QgdGhlIGNvcnJlY3QgYmFycmllciB0byBwYWlyIHdpdGggdmlydF93
bWIoKS4KCj4gCj4gU2lnbmVkLW9mZi1ieTogRG9uZ2xpIFpoYW5nIDxkb25nbGkuemhhbmdAb3Jh
Y2xlLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfY29tbXMuYyB8IDIg
KysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19jb21tcy5jIGIvZHJpdmVycy94ZW4veGVuYnVzL3hl
bmJ1c19jb21tcy5jCj4gaW5kZXggODUyZWQxNjFmYzJhLi5lYjUxNTFmYzhlZmEgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19jb21tcy5jCj4gKysrIGIvZHJpdmVycy94
ZW4veGVuYnVzL3hlbmJ1c19jb21tcy5jCj4gQEAgLTM5Nyw2ICszOTcsOCBAQCBzdGF0aWMgaW50
IHByb2Nlc3Nfd3JpdGVzKHZvaWQpCj4gICAJaWYgKHN0YXRlLnJlcS0+c3RhdGUgPT0geGJfcmVx
X3N0YXRlX2Fib3J0ZWQpCj4gICAJCWtmcmVlKHN0YXRlLnJlcSk7Cj4gICAJZWxzZSB7Cj4gKwkJ
Lyogd3JpdGUgZXJyLCB0aGVuIHVwZGF0ZSBzdGF0ZSAqLwo+ICsJCXZpcnRfd21iKCk7Cj4gICAJ
CXN0YXRlLnJlcS0+c3RhdGUgPSB4Yl9yZXFfc3RhdGVfZ290X3JlcGx5Owo+ICAgCQl3YWtlX3Vw
KCZzdGF0ZS5yZXEtPndxKTsKPiAgIAl9Cj4gCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
