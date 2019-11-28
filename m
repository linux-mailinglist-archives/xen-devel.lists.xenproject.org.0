Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C7C10CE6A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 19:14:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaOHt-0002fk-Tz; Thu, 28 Nov 2019 18:13:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iWZv=ZU=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1iaOHs-0002fa-6P
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 18:13:08 +0000
X-Inumbo-ID: b18557d2-120a-11ea-a55d-bc764e2007e4
Received: from mail-io1-xd42.google.com (unknown [2607:f8b0:4864:20::d42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b18557d2-120a-11ea-a55d-bc764e2007e4;
 Thu, 28 Nov 2019 18:12:52 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id x21so29835674ior.2;
 Thu, 28 Nov 2019 10:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=HrXAeNRavtrNwfJt1woj+FSD5vWMNwFbf70UfxaD7IY=;
 b=LfPcXuCmF7AJjxnlcuoqczyfyQMh1ECXE7svGvSCdxF1qy67kE2MTa1raH7kTVsjAN
 Q1d3TPvN9nXsc1z01mA+DgRYrW4ow+dM9XxJd+DHchMtN762OsdLt/0W5sOHvLPVKURq
 Hoybu1rqG9c90XVvjPjol96gtGueJVcgwrnb8YlCMUaRyMCqUeBymwb8WYcn6WotapeY
 aE0JzqmoYVTHVxOQVvz7bEDR+xjMJZ9Jexekf9F9EPVJBiRTo4dz6hb5j8qiHC7bFMv9
 G8CLobUcXDX9y17yH20/JaWeya3Qd6ER0lmfmxxIThtiIw0iPDNQGvVAs+giDi5sauml
 3hFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=HrXAeNRavtrNwfJt1woj+FSD5vWMNwFbf70UfxaD7IY=;
 b=NCtxyreObPYmc8I+Q+ECrqaXgISwcXi2runWzwQzlTReVVGMUVwMa4yfLMjAYOHcQt
 JVibxAw0wEfA/srJDuSBODvr5V0C7ZCsXXHp8LjwiCLxz13jvalGZ4ilmn5m9xzpHSEx
 C0fktmLgdWluKUVneuxId70XEu042NlsFFiuUK4tVNZKgdHvEhi+V4eYuBUo3Ivt3F/o
 R8Wt1knIhVkpcr8d9cDHUuld6m0kicX6TnlEYx8lkmSW3s0bceH2NHXo1FVneAarxF84
 sHRbf7rIn0zRXFHql6P+/mKxcrsQVWnHL0lfGrutXxhAiCC7W9XM3z7z6biYNfvkxwH2
 27Ug==
X-Gm-Message-State: APjAAAX+98W0ECb44WhJGHKD5uwBF/g6zg9nwabC7bWlDyrYJ4PKUi6K
 E7zVmpWvnCAdaKk1pCNZJCldm/vo
X-Google-Smtp-Source: APXvYqyHa7pV97fkp+6+5nGwFkW9jr7x0nkUy8/yTfUqhPuRYRkFL/fOgdpq+UKX5MrLiJyKerlVwQ==
X-Received: by 2002:a5e:9918:: with SMTP id t24mr1706252ioj.266.1574964772037; 
 Thu, 28 Nov 2019 10:12:52 -0800 (PST)
Received: from [100.64.73.55] ([173.245.215.240])
 by smtp.gmail.com with ESMTPSA id h6sm899897iom.43.2019.11.28.10.12.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2019 10:12:51 -0800 (PST)
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 28 Nov 2019 13:12:50 -0500
Message-Id: <10E1B547-180B-4620-9E4A-62C5B0DB2B93@gmail.com>
References: <909826df-25c1-6d7c-75d9-470365d2ecf6@suse.com>
In-Reply-To: <909826df-25c1-6d7c-75d9-470365d2ecf6@suse.com>
To: Jan Beulich <JBeulich@suse.com>
X-Mailer: iPhone Mail (17B111)
Subject: Re: [Xen-devel] [PATCH v2 4/6] Add Code Review Guide
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
Cc: Lars Kurth <lars.kurth@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Lars Kurth <lars.kurth@citrix.com>, xen-api@lists.xenproject.org,
 minios-devel@lists.xenproject.org, committers@xenproject.org,
 mirageos-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 win-pv-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTm92IDI4LCAyMDE5LCBhdCAwNToxMiwgSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29t
PiB3cm90ZToKPiAKPiDvu79PbiAyOC4xMS4yMDE5IDAxOjU0LCBTdGVmYW5vIFN0YWJlbGxpbmkg
d3JvdGU6Cj4+PiBPbiBUaHUsIDI2IFNlcCAyMDE5LCBMYXJzIEt1cnRoIHdyb3RlOgo+Pj4gRnJv
bTogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPgo+Pj4gCj4+PiBUaGlzIGRvY3Vt
ZW50IGhpZ2hsaWdodHMgd2hhdCByZXZpZXdlcnMgc3VjaCBhcyBtYWludGFpbmVycyBhbmQgY29t
bWl0dGVycyBsb29rCj4+PiBmb3Igd2hlbiByZXZpZXdpbmcgY29kZS4gSXQgc2V0cyBleHBlY3Rh
dGlvbnMgZm9yIGNvZGUgYXV0aG9ycyBhbmQgcHJvdmlkZXMKPj4+IGEgZnJhbWV3b3JrIGZvciBj
b2RlIHJldmlld2Vycy4KPj4gCj4+IEkgdGhpbmsgdGhlIGRvY3VtZW50IGlzIG1pc3NpbmcgYSBj
b3VwbGUgb2YgdGhpbmdzOgo+PiAKPj4gLSBhIHNpbXBsZSBvbmUgbGluZSBzdGF0ZW1lbnQgdGhh
dCBwb3NzaWJseSB0aGUgbW9zdCBpbXBvcnRhbnQgdGhpbmcgaW4KPj4gIGEgY29kZSByZXZpZXcg
aXMgdG8gaW5kZW50aWZ5IGFueSBidWdzIGluIHRoZSBjb2RlCj4+IAo+PiAtIGFuIGV4cGxhbmF0
aW9uIHRoYXQgcmVxdWVzdHMgZm9yIG1ham9yIGNoYW5nZXMgdG8gdGhlIHNlcmllcyBzaG91bGQg
YmUKPj4gIG1hZGUgZWFybHkgb24gKGkuZS4gbGV0J3Mgbm90IGNoYW5nZSB0aGUgYXJjaGl0ZWN0
dXJlIG9mIGEgZmVhdHVyZSBhdAo+PiAgdjkgaWYgcG9zc2libGUpIEkgYWxzbyBtYWRlIHRoaXMg
Y29tbWVudCBpbiByZXBseSB0byBwYXRjaCAjNS4gSSdsbAo+PiAgbGV0IHlvdSBkZWNpZGUgd2hl
cmUgaXMgdGhlIGJlc3QgcGxhY2UgZm9yIGl0Lgo+IAo+IFRoaXMgbmVlZHMgYmFsYW5jaW5nLiBQ
ZW9wbGUgY3J1Y2lhbCB0byB0aGUgZXZhbHVhdGlvbiBvZiBhIG5ldwo+IGZlYXR1cmUgYW5kIGl0
cyBpbXBsZW1lbnRhdGlvbiBzaW1wbHkgbWF5IG5vdCBoYXZlIHRoZSB0aW1lIHRvCj4gcmVwbHkg
cHJpb3IgdG8gdjkuIFdlJ3ZlIGhhZCBzaXR1YXRpb25zIHdoZXJlIHBlb3BsZSBwb3N0ZWQgbmV3
Cj4gcmV2aXNpb25zIGV2ZXJ5IG90aGVyIGRheSwgc29tZXRpbWVzIGV2ZW4gbW9yZSB0aGFuIG9u
ZSBwZXIgZGF5Lgo+IAo+IEFzIGluZGljYXRlZCBpbiBzZXZlcmFsIG90aGVyIGNvbnRleHRzIGJl
Zm9yZSAtIGltbyBwZW9wbGUgbm90Cj4gaGVscGluZyB0byBzaG91bGRlciB0aGUgcmV2aWV3IGxv
YWQgc2hvdWxkIGFsc28gbm90IGhhdmUgdGhlCj4gZXhwZWN0YXRpb24gdGhhdCB0aGVpciAobGFy
Z2UpIGNvbnRyaWJ1dGlvbnMgd2lsbCBiZSBsb29rZWQgYXQKPiBpbiBkdWUgY291cnNlLiAKClRv
IG1ha2UgdGhpcyBhY3Rpb25hYmxlLCB3ZSBjb3VsZCBoYXZlOgoKLSByZXZpZXdlciBkZW1hbmQg
aW5kZXg6ICBhdXRvbWF0ZWQgaW5kZXggb2Ygb3BlbiBwYXRjaGVzIHN0aWxsIGluIG5lZWQgb2Yg
cmV2aWV3LCBzb3J0ZWQgYnkgZGVjcmVhc2luZyBhZ2UKCi0gcmV2aWV3IGZsb3cgY29udHJvbDog
IGVhY2ggbmV3IHBhdGNoIHN1Ym1pc3Npb24gY2l0ZXMgb25lIHJlY2VudCByZXZpZXcgYnkgdGhl
IHBhdGNoIHN1Ym1pdHRlciwgZm9yIGEgcGF0Y2ggb2YgY29tcGFyYWJsZSBzaXplCgotIHJldmll
d2VyIHN1cHBseSBncm93dGg6ICBhIGJvb3RzdHJhcHBpbmcgZ3VpZGUgZm9yIG5ldyByZXZpZXdl
cnMgYW5kIHN1Ym1pdHRlcnMsIHdpdGggcGF0dGVybnMsIGFudGktcGF0dGVybnMsIGFuZCBleGFt
cGxlcyB0byBiZSBlbXVsYXRlZAoKUmljaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
