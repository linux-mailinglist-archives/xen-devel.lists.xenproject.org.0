Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA8264DAB
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 22:46:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlJRH-0003TZ-O9; Wed, 10 Jul 2019 20:43:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ivr2=VH=gmail.com=denisobrezkov@srs-us1.protection.inumbo.net>)
 id 1hlJRF-0003TT-J3
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 20:43:41 +0000
X-Inumbo-ID: 65b065eb-a353-11e9-8980-bc764e045a96
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 65b065eb-a353-11e9-8980-bc764e045a96;
 Wed, 10 Jul 2019 20:43:40 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id m10so3474630edv.6
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jul 2019 13:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ftXkBekAAbAqYM00d0AYhqd9O5B+nwznEPVANAyoFzg=;
 b=gfROEJLRg2C7wOQofDkABefI/MtizDsA6RQB1EaSuR0MxfAIZvXIOlEmZZx1fpdLHP
 fp5XDv6TmgQzEt6hftiGTMLlaZge2384Z21b7ncisPfAzJatUSesk015zOYZklINDOpV
 CcggngvxIL/x0OaB8YyiL0Gg4OttBDduwuevFNYPAnLTCdrmWlEjtbdad+xEk14LdFC6
 bK+YIgDVwwIQTWbX/eZU3Q9AGzutza1dcqhNOFIETBdgHbXZSEmvn+ypsEAZ4d20FWYJ
 JZHQRHuWF0r/6To4380LS7iy9oPaEX5KrtqVEK5FAgBR1O+74I6au+UbrBeCFZJrXJn3
 ZBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ftXkBekAAbAqYM00d0AYhqd9O5B+nwznEPVANAyoFzg=;
 b=kTEwoIfp5jzVI9gEAIQ55+QVDW+RraT2glG7pUt3jFKPb8etbqhVwaemFn0kM63gq5
 yBPTNsqIeH8iL/Nc2tlqakEFFsvOBO4itBBopoLnzL9SFtFFTU8wcrZuEronXksm6AwI
 A3eHyXcG27gIjcrA4ttiAiy96Vp60kiy3C2MIKXkSuhjT+fIKkIkU3Uo5JqWkzAzTnOa
 aiRBExZzJUGv2PfTrRVGNcRbqSRuqTDdiFKcjBauHgeyrRfCZELZwBfqze1FoqWQyuXZ
 +CTLbNV+FyHVAwYjjDDoonFsef8/IHaij0U7WfVcV6YXGGfYLC/WIPkAQaIUlK10M1re
 g0Tw==
X-Gm-Message-State: APjAAAWI00aqDHIjmsG2NxV5i2d7PjYACRirqHl6AvXbVGNHO/iWywrO
 ecDq9hFrMq/ZLAB5lbvUJMg=
X-Google-Smtp-Source: APXvYqy7Lf1Xl8wLZJT89+0pkSQzTJlmtf9y97V2k8GLwGInCz7swfQaEXOXYyz55IkWoJ2aXm1q3g==
X-Received: by 2002:a50:fd10:: with SMTP id i16mr22640789eds.97.1562791419041; 
 Wed, 10 Jul 2019 13:43:39 -0700 (PDT)
Received: from ?IPv6:2001:16b8:6621:9400:1e4b:d6ff:fef9:46e6?
 (200116b8662194001e4bd6fffef946e6.dip.versatel-1u1.de.
 [2001:16b8:6621:9400:1e4b:d6ff:fef9:46e6])
 by smtp.gmail.com with ESMTPSA id k10sm1033593eda.9.2019.07.10.13.43.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 13:43:38 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <25386cfa-d0b7-83fe-4d87-5af3459d54bd@gmail.com>
 <alpine.DEB.2.21.1907101447440.12168@sstabellini-ThinkPad-T480s>
 <23ac4d9b-8cbe-7c43-5c28-30b2e7cbbdeb@gmail.com>
 <alpine.DEB.2.21.1907101512230.12168@sstabellini-ThinkPad-T480s>
From: Denis Obrezkov <denisobrezkov@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=denisobrezkov@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <e7104450-54ae-6720-9d9f-f4e8889946c8@gmail.com>
Date: Wed, 10 Jul 2019 22:43:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1907101512230.12168@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [GSoC-2019] About the crossbar and xen
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>, Hunyue Yau <hy-gsoc@hy-research.com>,
 Iain Hunter <drhunter95@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA3LzEwLzE5IDEwOjE3IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
V2VkLCAxMCBKdWwgMjAxOSwgRGVuaXMgT2JyZXprb3Ygd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiA3
LzEwLzE5IDk6NDkgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4KPj4+Cj4+PiAgIHBo
YW5kbGUgPSA8MHgwMDAwMDAwMj47Cj4+Pgo+Pj4gSSB0aGluayB0aGF0IG1lYW5zIHRoYXQgaW50
ZXJydXB0cyBnbyB0byB0aGUgR0lDIHZpYSBDcm9zc2JhcjsgaS5lLiB0aGUKPj4+IHBhcmVudCBp
bnRlcnJ1cHQgY29udHJvbGxlciBvZiBDcm9zc2JhciBpcyB0aGUgR0lDLgo+Pj4KPj4gQnV0IHRo
ZSBjcm9zc2JhcidzIGludGVycnVwdC1wYXJlbnQgbm9kZSBpcyAweDAwMDAwMDA4IGFuZCBwaGFu
ZGxlIHZhbHVlCj4+IDB4MDAwMDAwMDggYmVsb25ncyB0bwo+PiBpbnRlcnJ1cHQtY29udHJvbGxl
ckA0ODI4MTAwMCB7Cj4+IAkJY29tcGF0aWJsZSA9ICJ0aSxvbWFwNS13dWdlbi1tcHUiLCAidGks
b21hcDQtd3VnZW4tbXB1IjsKPj4KPj4gRm9yIG1lIGl0IGxvb2tzIGxpa2UgaW50ZXJydXB0cyBm
cm9tIGNyb3NzYmFyIGdvZXMgdG8gd3VnZW4gYW5kIHRoZSBmcm9tCj4+IHd1Z2VuIHRvIEdJQy4g
QnV0IEkgZG9uJ3QgcXVpdGUgdW5kZXJzdGFuZCBpdC4KPiAKPiBIaSBEZW5pcywKPiAKPiBJIG9u
bHkgcmVhZCB5b3VyIGVtYWlsIGFuZCBnb3QgYSBwYXJ0aWFsIHBpY3R1cmUuIEkgcmVhZCB0aGUg
ZnVsbCBkZXZpY2UKPiB0cmVlIG5vdyBhbmQgdGhlIGhpZXJhcmNoeSBpcyBhcyBmb2xsb3c6Cj4g
Cj4gLSBjcm9zc2JhciByb3V0ZXMgdG8gcGhhbmRsZSA4Cj4gLSBwaGFuZGxlIDggaXMgb21hcDUt
d3VnZW4tbXB1IGFuZCByb3V0ZXMgdG8gcGhhbmRsZSAyCj4gLSBwaGFuZGxlIDIgaXMgdGhlIEdJ
Qwo+IAo+IFNvOgo+IAo+IGNyb3NzYmFyIC0+IG9tYXA1LXd1Z2VuLW1wdSAtPiBHSUMKPiAKSSBh
bSBpbnRlcmVzdGVkIHdoZXRoZXIgd2Ugc2hvdWxkIGRvIHNvbWV0aGluZyB3aXRoIG9tYXA1LXd1
Z2VuLW1wdS4gSQpmb3VuZCB0aGF0IGNyb3NzYmFyIGlzIGNvbm5lY3RlZCB0byBHSUMuIEFuZCBv
biBzb21lIHNjaGVtZXMgaW4gdHJtIGl0CmlzIGNvbm5lY3RlZCB2aWEgb21hcDUtd3VnZW4tbXB1
LiBTbywgaXQgaXMgbm90IGNsZWFyIGZvciBtZSB3aGV0aGVyIGl0CnNob3VsZCBiZSBoYW5kbGVk
IGluIHhlbi4KLS0gClJlZ2FyZHMsIERlbmlzIE9icmV6a292CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
