Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 917D4C3364
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 13:54:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFGgZ-0003eC-Tx; Tue, 01 Oct 2019 11:51:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=emkH=X2=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iFGgY-0003e7-US
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 11:51:18 +0000
X-Inumbo-ID: c6c0d64a-e441-11e9-96f8-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by localhost (Halon) with ESMTPS
 id c6c0d64a-e441-11e9-96f8-12813bfff9fa;
 Tue, 01 Oct 2019 11:51:17 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id h7so15134151wrw.8
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2019 04:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6C81664m4MK1DyFZmVVri+/wp7mnWEMeXZTJK8bPi1A=;
 b=o4bIHFyn6rVbLARv0KNbVz8tlRV1MRJ5q8DSOEZp+P+/BlFwAK5rysxcqpbkcA5avG
 zJ50SgEWARJ56zHcMSWdrV+qvFw3ive9qLPbbpdmvalTb4JT5POLdOXdQFCkOr8HQTbF
 L0XDZb074gs/suk5NM+3v8gHZQIdpI9peVc6mDwnl6CYXknwOq/Sa0vrncLCNLMrSrg+
 6s0ReVQm5X0FIBNFJCNAXarJ7B5v77of2geNNNxnXVRkl8/jAu1d8D8R3IOE8AqCqkCn
 KPbTWclaFxHIvyVHLD+K0Z/6lGtXK5lCZc4qddLl7bQ3zgs8nBEKs/0FK6OeZi6NMrbG
 IHkA==
X-Gm-Message-State: APjAAAWGn+63BcO6WatTyaYbZ/Rj4JoE5pdW+/4V73ZGVH/3JrVYG9Ni
 oH4yX8lcKdIO/HwClDsbUqA=
X-Google-Smtp-Source: APXvYqxV1gks/WQTlO4ZoHiozcihrdyc5YKcVsKGrIpt7Mxheyeokde4Uj7OrqKTx4Y5LuTwhUgLFQ==
X-Received: by 2002:adf:e5c2:: with SMTP id a2mr18636287wrn.320.1569930676694; 
 Tue, 01 Oct 2019 04:51:16 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id c8sm11996469wrr.49.2019.10.01.04.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 04:51:16 -0700 (PDT)
Date: Tue, 1 Oct 2019 12:51:14 +0100
From: Wei Liu <wl@xen.org>
To: Hongyan Xia <hongyax@amazon.com>
Message-ID: <20191001115114.yim3dbmbmbeirxmy@debian>
References: <cover.1569833766.git.hongyax@amazon.com>
 <4429f3d4cb3075d3dc2f30b3f8273e3620b8d995.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4429f3d4cb3075d3dc2f30b3f8273e3620b8d995.1569833766.git.hongyax@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2 22/55] x86_64/mm: switch to new APIs in
 paging_init
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
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMTE6MzM6MTRBTSArMDEwMCwgSG9uZ3lhbiBYaWEgd3Jv
dGU6Cj4gRnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IEhvbmd5
YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Cj4gCj4gLS0tCj4gQ2hhbmdlZCBzaW5jZSB2MToK
PiAgICogdXNlIGEgZ2xvYmFsIG1hcHBpbmcgZm9yIGNvbXBhdF9pZGxlX3BnX3RhYmxlX2wyLCBv
dGhlcndpc2UKPiAgICAgbDJfcm9fbXB0IHdpbGwgdW5tYXAgaXQuCgpIbW1tLi4uIEkgd29uZGVy
IHdoeSBYVEYgZGlkbid0IGNhdGNoIHRoaXMuCgpJZiB3ZSByZWFsbHkgd2FudCB0byBnbyBhbGwg
dGhlIHdheSB0byBlbGltaW5hdGUgcGVyc2lzdGVudCBtYXBwaW5ncwpmb3IgcGFnZSB0YWJsZXMs
IHRoZSBjb2RlIHNob3VsZCBiZSBjaGFuZ2VkIHN1Y2ggdGhhdDoKCjEuIGNvbXBhdF9pZGxlX3Bn
X3RhYmxlX2wyIHNob3VsZCBiZSBjaGFuZ2VkIHRvIHN0b3JlIG1mbiwgbm90IHZhLgoyLiBtYXAg
YW5kIHVubWFwIHRoYXQgbWZuIHdoZW4gYWNjZXNzIHRvIHRoZSBjb21wYXQgcGFnZSB0YWJsZSBp
cwogICByZXF1aXJlZC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
