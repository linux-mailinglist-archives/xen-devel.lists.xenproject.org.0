Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E739D13BD73
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 11:30:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irfsr-00030E-Be; Wed, 15 Jan 2020 10:26:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9sUE=3E=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1irfsp-000308-2T
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 10:26:43 +0000
X-Inumbo-ID: 80e56ff8-3781-11ea-ac27-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80e56ff8-3781-11ea-ac27-bc764e2007e4;
 Wed, 15 Jan 2020 10:26:34 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j42so15138755wrj.12
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2020 02:26:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Nlx+kOPMhTDJNdtbZo7sO7PZFtfiB14K/qcDScMWqmE=;
 b=ssqjCCcgyl9wdVV6aDfZUdi8G+c6VthVe8J2dOireL3FRdcQzwOYabfVD6TsN4HoDI
 g7q+0/fq/C2j2w+jRSmSchqzdeK9D8W1VQf3V0TDt2piAwq3iux9R4zTNCpFSnk7791c
 GDLfhYADUpedPaGznRzfrukN0khMRBjpwmzw1xxQBCnzhLbWda+JGhuWxUgUle/8KyLE
 xmgcg7/Ms6N4ITnp48V5kp4N0kq3idrbjgtHyXrcJNBdRciNrB55hk8td/aIEGmv7pM3
 QkjID3Ceyi+bXp4eFJRIkldTx3UF8k/DRAikkjba1dxMhPLfgd7yEormYzyHREb9MNnB
 Ulsw==
X-Gm-Message-State: APjAAAV3aI+/fUmu1YPtB+vpuCTS8TzRZ8dbm6rMbX4lxWwFzsm8NzI5
 9nnzw4bN4MbpBFerJebjFjo=
X-Google-Smtp-Source: APXvYqzgbyPWMHaH+0oCc2DMZ6/XOh7bo1CZzr2x/C+sECMRSVTlJVGnRNnIMkJNrV2plxNzLMPdDw==
X-Received: by 2002:adf:f78e:: with SMTP id q14mr7646125wrp.186.1579083993712; 
 Wed, 15 Jan 2020 02:26:33 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id j2sm23059498wmk.23.2020.01.15.02.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 02:26:33 -0800 (PST)
To: David Woodhouse <dwmw2@infradead.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "Xia, Hongyan" <hongyxia@amazon.com>
References: <dbdedd077330af79c13ba5ed38b0aec0b7128886.camel@infradead.org>
 <4e3b0050ff7a8d1e40015181026562211e75c401.camel@infradead.org>
 <1743ee7c-e238-8b77-d40f-bd0e3d6bb0ed@xen.org>
 <b24cf0a1b56f56167f51d5dd86fd81afb48a377c.camel@infradead.org>
 <e49ed1b9-23cc-5c24-0b83-565a1d833de2@xen.org>
 <a52142eed9e59446f8a02798ab643b01a5ab7a1c.camel@infradead.org>
 <52fb69c3-64b6-2b67-9647-340110b27289@xen.org>
 <7f8fdfdf68daca5b156984412bdfc41c9970419b.camel@infradead.org>
From: Julien Grall <julien@xen.org>
Message-ID: <61d3344e-4c78-e134-2709-069eaae23c1c@xen.org>
Date: Wed, 15 Jan 2020 10:26:32 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7f8fdfdf68daca5b156984412bdfc41c9970419b.camel@infradead.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [RFC PATCH 0/3] Live update boot memory management
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
 paul@xen.org, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNS8wMS8yMDIwIDA3OjQwLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6Cj4gT24gVHVlLCAy
MDIwLTAxLTE0IGF0IDE2OjI5ICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBUaGF0J3Mg
dGhlIHBvaW50IGluIGFwcGVuZGluZyBhbiBJTkRfV1JJVEU2NCBvcGVyYXRpb24gdG8gdGhlIGtp
bWFnZQo+Pj4gc3RyZWFtLiBUaGUgYWN0dWFsIHdyaXRlIGlzIGRvbmUgaW4gdGhlIGxhc3QgZ2Fz
cCBvZiBrZXhlY19yZWxvYygpCj4+PiBhZnRlciBYZW4jMSBpcyBxdWllc2NlbnQsIG9uIHRoZSB3
YXkgaW50byBwdXJnYXRvcnkuCj4+Cj4+IEkgd2FzIG5vdCBzdXJlIHdoYXQgeW91IG1lYW50IGJ5
IElORF9XUklURTY0LiBNYXliZSBJIHNob3VsZCBoYXZlIGFza2VkCj4+IGl0IGZpcnN0IDopLiBU
aGFuayB5b3UgZm9yIHRoZSBleHBsYW5hdGlvbiEKPiAKPiBEb24ndCB5b3Ugb2Z0ZW4gZmluZCBh
biBlbWFpbCBpcyBtYWRlIGVhc2llciB0byB1bmRlcnN0YW5kIGJ5IHRoZQo+IGFkZGl0aW9uIG9m
IGEgZmV3IGxpbmVzIG9mIHVuaWZpZWQgZGlmZiBvZiBhc3NlbWJsZXIgY29kZS4uLj8KCkl0IGRl
ZmluaXRlbHkgaGVscHMuIEkgdGVuZCB0byBwcmVmZXIgZGlmZiBvdmVyIGEgbG9uZyBwYXJhZ3Jh
cGggdHJ5aW5nIAp0byBleHBsYWluIHRoZSBzYW1lIDopLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
