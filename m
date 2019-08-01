Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 199BB7DE50
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 16:57:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htCTf-0007kE-TT; Thu, 01 Aug 2019 14:54:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q0EE=V5=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1htCTe-0007k9-9c
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 14:54:46 +0000
X-Inumbo-ID: 4c13e4e7-b46c-11e9-8980-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4c13e4e7-b46c-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 14:54:44 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 62so45613747lfa.8
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 07:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=UA5UAwmLTb63h7/JkM1ir1h8yUywVdCBn9m2AAV/ZH4=;
 b=a6fg1L45YNygW1btCSH4x1EoWKTTQuDZzeQ6DGPuSeDtfEVEAcRnCdr1Yh6W7HirpY
 wwVmCc1aUetOC7PV0IYTbvz5Sv9oGUGrP/XdCW7f0564A69EzooFWqcP/kFIrcB8bYSL
 +/6Y6qEcyBPqr/158mesQ5rLBI1Ra6kZ2+vR1qDTahkZnz7f8Ldi/2PLIqTQu21q5EXk
 Ke4cV4ccCJdmxHQGej4SQZU/N34/NUmBDUmO3HXb345Bt/p21v+V7KlImHh3aivEFs8N
 kcJEPho1bH1P0qwohB0tgCfaiGUBix0jj5KuOhf/2WF++Xr1q7cmakPefOHrrboXFXK4
 +Yjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=UA5UAwmLTb63h7/JkM1ir1h8yUywVdCBn9m2AAV/ZH4=;
 b=lkFLq2fvEJ0819/Iz5K2Zj6PoVUq8Bu1VS1qhzhUcViw5DFziPTDEFN/Gcl3Z2t7cL
 nWU4iVWr5wIYP9TH90rwg27juJanOHZ0sjWUiqq87XA79lwfBiL7oa3WNhZLSoSpEjQC
 6bVOtM0pFa44+DLupDkSgRKWLNrD+ZPIxbfSBYUl5nyiv/L+vilYh1hbkpjOAxocnImi
 wuyFKfuZiXAe/hnHLVSAT0xST8dt6EYuvx+D8Fz85prf67shaJqoZHW7mjp5t7ZQmm69
 KilqRs0qHf0/SNuhJDLwdUUd+lG7b336vh+5DpAYnhhRuPMGHSX6oc6uJzuVGtT0E1Oj
 KJqA==
X-Gm-Message-State: APjAAAUgqV9U/dXyDGceEuCWB1pW3h6EaGHSq28KEjLIgQEcTQGveZHU
 G6c8urNRARKOPy+SEh912NWPOrlGJlU=
X-Google-Smtp-Source: APXvYqxBnEV0VcIqP98gBCe59qmPtu+bAcwF8byRi/3Wtqw3JS/H73YQMX3AxP66jMD8GqeElcx6KA==
X-Received: by 2002:ac2:5382:: with SMTP id g2mr59676401lfh.92.1564671283149; 
 Thu, 01 Aug 2019 07:54:43 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id 27sm9323685ljv.21.2019.08.01.07.54.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Aug 2019 07:54:42 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <eba016be-a084-5a6b-f47f-cede44199f7a@gmail.com>
 <20190801141434.lkwslwmkujfn5vef@Air-de-Roger>
 <afe06b62-dfdb-6a15-2e48-463f1685e9e3@gmail.com>
 <4fd1f35c-ae72-0ea3-eb95-b3f5091bed1d@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <5e9ddd34-30d4-118a-ed76-89a11e3c7adf@gmail.com>
Date: Thu, 1 Aug 2019 17:54:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4fd1f35c-ae72-0ea3-eb95-b3f5091bed1d@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Question] Proper location for Linux error code
 (-EPROBE_DEFER) in Xen
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDAxLjA4LjE5IDE3OjM0LCBKYW4gQmV1bGljaCB3cm90ZToKCkhpIEphbgoKPiBPbiAwMS4w
OC4yMDE5IDE2OjMxLCBPbGVrc2FuZHIgd3JvdGU6Cj4+ICAgwqBUaGlzIGlzIG5lZWRlZCBmb3Ig
dGhlIHVwY29taW5nIFYyIG9mIHRoZSBJUE1NVSBkcml2ZXIgKEFSTSkgWzFdIHdoaWNoIG1heSBy
ZXF1ZXN0Cj4+ICAgwqBkZWZlcnJlZCBwcm9iaW5nIChyZXR1cm5zIC1FUFJPQkVfREVGRVIpIGRl
cGVuZGluZyBvbiB3aGF0IGRldmljZSB3aWxsIGJlIHByb2JlZCB0aGUgZmlyc3QKPj4gICDCoChS
b290IGRldmljZSBtdXN0IGJlIHJlZ2lzdGVyZWQgYmVmb3JlIENhY2hlIGRldmljZXMuIElmIG5v
dCB0aGUgY2FzZSwKPj4gICDCoGRyaXZlciB3aWxsIGRlbnkgZnVydGhlciBDYWNoZSBkZXZpY2Ug
cHJvYmVzIHVudGlsIFJvb3QgZGV2aWNlIGlzIHJlZ2lzdGVyZWQpLgo+Pgo+PiBBcyB3ZSBjYW4n
dCBndWFyYW50ZWUgYSBmaXhlZCBwcmUtZGVmaW5lZCBvcmRlciBmb3IgdGhlIGRldmljZSBub2Rl
cyBpbiBEVCwgd2UgbmVlZCB0byBiZSByZWFkeSBmb3IgdGhlIHNpdHVhdGlvbiB3aGVyZSBkZXZp
Y2VzIGJlaW5nIHByb2JlZAo+PiBpbiAiYW55IiBvcmRlci4gU28sIGZyYW1ld29yayAoZHJpdmVy
cy9wYXNzdGhyb3VnaC9hcm0vaW9tbXUuYykgd2lsbCBiZSBtb2RpZmllZCBhIGJpdCB0byBiZSBh
YmxlIHRvIGhhbmRsZSAtRVBST0JFX0RFRkVSIHJldHVybmluZyBieSBkcml2ZXIuCj4gSSdtIHN1
cmUgdGhpcyBjYW4gYmUgaGFkIHdpdGhvdXQgaW50cm9kdWNpbmcgYSBuZXcgZXJyb3IgY29kZS4K
CkJ5IHJldXNpbmcgZXhpc3Rpbmcgb25lIChFQUdBSU4gY29tZXMgdG8gbWluZCk/CgoKPgo+IEph
bgoKLS0gClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlzaGNoZW5rbwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
