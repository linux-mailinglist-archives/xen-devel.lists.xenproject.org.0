Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E06A16F8EE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 09:07:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6rfm-0007J7-9n; Wed, 26 Feb 2020 08:04:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TmNR=4O=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j6rfk-0007J2-M2
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 08:04:00 +0000
X-Inumbo-ID: 8b787196-586e-11ea-8cb6-bc764e2007e4
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b787196-586e-11ea-8cb6-bc764e2007e4;
 Wed, 26 Feb 2020 08:04:00 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id c26so2631299eds.8
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2020 00:04:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vQcSG4lDvGPQaX61AteEqTGycPZkMgQ6SU249Kwvn/w=;
 b=luRzJiR2hEj2lsG3Te433ZHG/EoD7s8qRupzqBS7trcI4DQAcYyIDdfNbzUeacd2dy
 DuCKKBcxmpJrofZ3dd1MYb2aLpuiSPjBV9vBTBcOpncXYuUGwNwu+Tzg813Dt19cTGq1
 /hc/Za60OrUv0eBvi8JmVF+6y2wwUoEQiE8xv6V9Y+6gsnQ0eDorUerb6nOLjagezp9A
 eESze5rlX563zBC0r8g1ZaQudJGSUFS+xH6NNfROHSs9X2otZihl3J/ov2SY5P8AlzpK
 /cmWyn9UuSz4L/c/nU6PHbqf8JUxAyump3LBrxDtICDsu3JQQ1JmdodfJG4d9dJquN6G
 /dSA==
X-Gm-Message-State: APjAAAVLwtCHaMWDBxxkQyrZKCsREE7g73ss+qWa6SiIq/1meQV2vKbN
 JLzDYUEmB6zRnrs4VpwSB1w=
X-Google-Smtp-Source: APXvYqw6gyEJGXHJvjIbFbbKnomToF+gjHu8SvxZu7nd7YCqjvn7UU5V+Rc786fSoK+swFUrBqfg1Q==
X-Received: by 2002:a17:906:716:: with SMTP id
 y22mr3323107ejb.106.1582704239452; 
 Wed, 26 Feb 2020 00:03:59 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-226.amazon.com.
 [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id e21sm48861eds.36.2020.02.26.00.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 00:03:58 -0800 (PST)
To: Paul Durrant <pdurrant@amazon.com>, xen-devel@lists.xenproject.org
References: <20200225095357.3923-1-pdurrant@amazon.com>
 <20200225095357.3923-2-pdurrant@amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <061d6292-dfea-1a21-f3ba-3a27946dad7c@xen.org>
Date: Wed, 26 Feb 2020 08:03:57 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200225095357.3923-2-pdurrant@amazon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 1/2] domain: introduce
 alloc/free_shared_info() helpers...
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNS8wMi8yMDIwIDA5OjUzLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gLi4uIGFuZCBz
YXZlIHRoZSBNRk4uCj4gCj4gVGhpcyBwYXRjaCBtb2RpZmllcyB0aGUgJ3NoYXJlZF9pbmZvJyBm
aWVsZCBvZiBzdHJ1Y3QgZG9tYWluIHRvIGJlCj4gYSBzdHJ1Y3R1cmUgY29tcHJpc2luZyBhbiBN
Rk4gYW5kIGEgdmlydHVhbCBhZGRyZXNzLiBBbGxvY2F0aW9ucyBhcmUKPiBzdGlsbCBkb25lIGZy
b20geGVuaGVhcCwgc28gdGhlIHZpcnR1YWwgYWRkcmVzcyBzdGlsbCBlcXVhdGVzIHRvCj4gdmly
dF90b19tZm4oKSBjYWxsZWQgb24gdGhlIE1GTiBidXQgc3Vic2VxdWVudCBwYXRjaCB3aWxsIGNo
YW5nZSB0aGlzLgo+IEhlbmNlIHRoZSBuZWVkIHRvIHNhdmUgdGhlIE1GTi4KPiAKPiBOT1RFOiBX
aGlzdCBkZWZpbmluZyB0aGUgbmV3IGhlbHBlcnMsIHZpcnRfdG9fbWZuKCkgaW4gY29tbW9uL2Rv
bWFpbi5jCj4gICAgICAgIGlzIG1hZGUgdHlwZSBzYWZlLgo+ICAgICAgICBUaGUgZGVmaW5pdGlv
biBvZiBubWlfcmVhc29uKCkgaW4gYXNtLXg4Ni9zaGFyZWQuaCBpcyBhbHNvIHJlLQo+ICAgICAg
ICBmbG93ZWQgdG8gYXZvaWQgb3Zlcmx5IGxvbmcgbGluZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTog
UGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgoKUmV2aWV3ZWQtYnk6IEp1bGllbiBH
cmFsbCA8amdyYWxsQGFtYXpvbi5jb20+CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
