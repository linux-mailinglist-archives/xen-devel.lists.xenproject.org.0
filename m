Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAC93B886
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 17:51:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haMYD-0005J3-0b; Mon, 10 Jun 2019 15:49:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NKNi=UJ=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1haMYB-0005Ix-2d
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 15:49:35 +0000
X-Inumbo-ID: 5737f2d0-8b97-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5737f2d0-8b97-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 15:49:34 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id s21so8450766lji.8
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2019 08:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2TZELXk3X3SbDF7mSP4AUViGdtfWNxghcg83RGkoDps=;
 b=a0TRlWFbYnA+j+7wViNAiDfixDllu2hCs107x+cP2+vZHDZGpgUEGbvvY/FnucYBJ9
 jM6FkPeiRqvgHCN57Flsxy4n02fRlglnuWg5B1B/Bmhx5aGkrp1u8yqCgB+g5xyfLHSb
 2n3+thGTVv+StPD4ossfyDLQ5NmdBRWEMTrCeqhsXyoT0yaeLpaD+oB3nJj3n5QNaLe0
 Lxh50vm3tZvJdv8KM90is5CuZfDYyF8Pyt66vvg2OTfFNkZBteBPLqEHk0JUuftDg9Nx
 oYMw3oFpJsLQ7JmtcwSiN0cAwE37Aypn+zMdBLUDjnMYgi8gWTqgrS501Ggt9lem//3s
 WxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2TZELXk3X3SbDF7mSP4AUViGdtfWNxghcg83RGkoDps=;
 b=Vp2XlfXEbboMGobfIY2eP2kz0r+XSTujQAxstUzRIqNeC4BrAv/j8J62Q8d9fNKZNH
 OCTnr3/g/loDEcVeuQVKq7osDILwWHBRkom7/C7R0wFyJiu/H9Hd8Xaxgm0zXZO+bPd1
 Fn/+y1XNKElrNissf13x9bmlLiKbiD55BHzXEUWB5vUcuL37PIR3NzxjhU4FxG+V2eh8
 miMBa28s362HImvOiEF62IXrMmkWNliEcaKm7uJ5GvVFZhGpI4tvv5bKFvXQ0NlEOOO3
 Zd+snL7Zcaj20ZAN0a+nbByhbjbF+PaY8bKv0NpnvgSzLCE+YqiMTCIclVzSPj5wLuDw
 JNOA==
X-Gm-Message-State: APjAAAUJhdPhbowcWEi1aXtLletZncualIaLa6GL/dOXZ7Ai4Xedm85E
 m+dSEZlOMNomtElRl6pWNEo=
X-Google-Smtp-Source: APXvYqwjz1QyeJtpNM3X1djl/3gLCqkh6ml9l5VIaC+7JWlZtfDkPONRAzjFN2A4PibWGQWCRi0F+Q==
X-Received: by 2002:a2e:6e01:: with SMTP id j1mr36132951ljc.135.1560181772550; 
 Mon, 10 Jun 2019 08:49:32 -0700 (PDT)
Received: from [10.17.180.34] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 s20sm2044952lfb.95.2019.06.10.08.49.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 08:49:30 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1558949370-14331-1-git-send-email-andrii.anisov@gmail.com>
 <d63ff1d7-963a-bd1a-7835-ee5b30504628@arm.com>
 <20d30591-bc90-5321-2de9-a11f7d36cb11@gmail.com>
 <f0e27dd4-fc59-05d8-e910-b63c0d398c00@arm.com>
 <c0de5da0-9986-ea97-b7d3-6902bd789c19@gmail.com>
 <4d27c123-826d-ad07-ed0a-e7a7517fca62@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <1388d47c-efd1-b30b-9847-92c343964dfa@gmail.com>
Date: Mon, 10 Jun 2019 18:49:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <4d27c123-826d-ad07-ed0a-e7a7517fca62@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] gic: drop interrupts enabling on
 interrupts processing
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
Cc: Andre Przywara <andre.przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVsaWVuLAoKT24gMzEuMDUuMTkgMjA6MTEsIEp1bGllbiBHcmFsbCB3cm90ZToKCj4g
SGVyZSBteSB0YWtlIG9uIHRoZSBjb21taXQgbWVzc2FnZToKPiAKPiBnaWNfaW50ZXJydXB0KCkg
d2FzIGltcGxlbWVudGVkIHVzaW5nIGEgbG9vcCB0byBsaW1pdCB0aGUgY29zdCBvZiB0aGUgdHJh
cCBpZiB0aGVyZSBhcmUgbXVsdGlwbGUgaW50ZXJydXB0cyBwZW5kaW5nLgo+IAo+IEF0IHRoZSBt
b21lbnQsIGludGVycnVwdHMgYXJlIHVubWFza2VkIGJ5IGdpY19pbnRlcnJ1cHQoKSBiZWZvcmUg
Y2FsbGluZyBkb197SVJRLCBMUEl9KCkuIEluIHRoZSBjYXNlIG9mIGhhbmRsaW5nIGFuIGludGVy
cnVwdCByb3V0ZWQgdG8gZ3Vlc3RzLCBpdHMgcHJpb3JpdHkgd2lsbCBiZSBkcm9wcGVkLCB2aWEg
ZGVzYy0+aGFuZGxlci0+ZW5kKCkgY2FsbGVkIGZyb20gZG9faXJxKCksIHdpdGggaW50ZXJydXB0
IHVubWFza2VkLgo+IAo+IEluIG90aGVyIHdvcmRzOgo+ICDCoMKgwqAgLSBVbnRpbCB0aGUgcHJp
b3JpdHkgaXMgZHJvcHBlZCwgb25seSBoaWdoZXIgcHJpb3JpdHkgaW50ZXJydXB0IGNhbiBiZSBy
ZWNlaXZlZC4gVG9kYXksIG9ubHkgWGVuIGludGVycnVwdHMgaGF2ZSBoaWdoZXIgcHJpb3JpdHku
Cj4gIMKgwqDCoCAtIEFzIHNvb24gYXMgcHJpb3JpdHkgaXMgZHJvcHBlZCwgYW55IGludGVycnVw
dCBjYW4gYmUgcmVjZWl2ZWQuCj4gCj4gVGhpcyBtZWFucyB0aGUgcHVycG9zZSBvZiB0aGUgbG9v
cCBpbiBnaWNfaW50ZXJydXB0KCkgaXMgZGVmZWF0ZWQgYXMgYWxsIGludGVycnVwdHMgbWF5IGdl
dCB0cmFwcGVkIGVhcmxpZXIuIFRvIHJlaW5zdGF0ZSB0aGUgcHVycG9zZSBvZiB0aGUgbG9vcCAo
YW5kIHByZXZlbnQgdGhlIHRyYXApLCBpbnRlcnJ1cHRzIHNob3VsZCBiZSBtYXNrZWQgd2hlbiBk
cm9wcGluZyB0aGUgcHJpb3JpdHkuCj4gCj4gRm9yIGludGVycnVwdHMgcm91dGVkIHRvIFhlbiwg
cHJpb3JpdHkgd2lsbCBhbHdheXMgYmUgZHJvcHBlZCB3aXRoIGludGVycnVwdHMgbWFza2VkLiBT
byB0aGUgaXNzdWUgaXMgbm90IHByZXNlbnQuIEhvd2V2ZXIsIGl0IG1lYW5zIHRoYXQgd2UgYXJl
IHBvaW50bGVzcyB0cnkgdG8gbWFzayB0aGUgaW50ZXJydXB0cy4KPiAKPiBUbyBhdm9pZCBjb25m
bGljdGluZyBiZWhhdmlvciBiZXR3ZWVuIGludGVycnVwdCBoYW5kbGluZywgZ2ljX2ludGVycnVw
dCgpIGlzIG5vdyBrZWVwaW5nIGludGVycnVwdHMgbWFza2VkIGFuZCBkZWZlciB0aGUgZGVjaXNp
b24gdG8gZG9fe0xQSSwgSVJRfS4KCkl0IGlzIE9LIHdpdGggbWUuCgpBcmUgeW91IHdhaXRpbmcg
ZnJvbSBtZSBtb3JlIG9mCgo+IFsgRGV0YWlscyB0byBiZSBhZGRlZCBvbmNlIHlvdSBnaXZlIG1v
cmUgZ3JvdW5kIF0KCj8KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
