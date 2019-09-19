Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20662B78E9
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 14:10:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAvDH-0000AV-KD; Thu, 19 Sep 2019 12:07:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C8m3=XO=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iAvDF-0000AB-ON
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 12:07:05 +0000
X-Inumbo-ID: fe795a6e-dad5-11e9-b76c-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe795a6e-dad5-11e9-b76c-bc764e2007e4;
 Thu, 19 Sep 2019 12:07:05 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m7so3349992lji.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2019 05:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=XD4C2mgINYiVzYLd69P1Xmr3K+Ipq2GYpFYMfXaDmM4=;
 b=Fnzt9JuoG+IfpKwezRVbABRcl/gU5cIWRQM4O0x29fc/JJpeawkVVkc92Sg6QN11YZ
 CZ2ZubPATsvFtFq0oTxggPdQ7MMnhgHMjWYyIdK6MB7nppe/F57vavmbuJFvS2iplBLf
 W1pMJX4uIFyBVd7IR/3aXFzNpeld9i+pSjFfmq7aNQchmBsGCoY+1o5MXmyvI8hUIlCP
 VVNQkSiSHyj9Hhw/W2KgJYSeRKlrfQlX+luCq+ZUTNSgxhy9vIcH6oftXWeJUzJiY5As
 EQYStMO1bWVoTW+SMV6ikoHhy/VcW76UL17ENhmJ5qStzLkE3z2Dvr85MNCDEkVT/HAj
 hrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=XD4C2mgINYiVzYLd69P1Xmr3K+Ipq2GYpFYMfXaDmM4=;
 b=NG7INpOnEnNWEPBtxWmIhfraIWs6j2k+SdAJB3UQMYfn8tnGCMB+F8ZKLtj6hge5Xk
 g25RN2bcf6lBTI4III1igD7J52uzRU0FZMP1r5eKHSNaDCO/chX0CA/6Upyw8MfGrilu
 ESuDCHxoCFDS3Kkdh51FB/JFLDTVm76zpaX8HumL0futTUGUAaa5ndmxrnvloOFfzFPw
 /PgAYuAxZ/YeWJlvt7tMABTRxp6Gkr3YnZQJj99a0gYLsvlFhyY5Ay+cquK7xODeYzUC
 iaVvxQtiTKKXaSufJGpGbt5ilR3viHryDHI/pnUh3kREaWBCgvylGAcyU/jdxXVBD254
 JK3g==
X-Gm-Message-State: APjAAAXzByzU3WM43LbJps3lm7YTfqqpRZK/GB+b6LTxJKdD+WN0WICx
 JedVn/BMgIU2PxpLRQkzaT/oUoqj7tA=
X-Google-Smtp-Source: APXvYqzfthFcQSehDJkq2XTFIF4cfUV5CtHHTnKgmgGJXeE3jfGFUSbd0sh8195+E5Q12JAjaxvuHw==
X-Received: by 2002:a05:651c:154:: with SMTP id
 c20mr4628120ljd.83.1568894823708; 
 Thu, 19 Sep 2019 05:07:03 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id y20sm1616044ljj.89.2019.09.19.05.07.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Sep 2019 05:07:03 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-7-git-send-email-olekstysh@gmail.com>
 <0cdbf4a2-a769-f62c-a547-5c7ad87f0fc3@suse.com>
 <12f7d629-59c9-5922-0217-02c9d610bc28@gmail.com>
 <f10cc304-96f8-f942-0ef2-0a9d4544f288@suse.com>
 <f8ab5e72-2475-3884-c23f-84d07eba11ba@gmail.com>
 <f243004b-9069-566c-1e8c-ba49e401c98d@arm.com>
 <69614adc-d2fb-ea4f-7659-3f65e40116a3@suse.com>
 <f17ed0cd-5401-e3d6-86a7-7067edaeec39@gmail.com>
 <afc9b503-665a-5168-5b80-87867d3e5902@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <79893d3f-d61e-632a-0e1a-c46b99e4c714@gmail.com>
Date: Thu, 19 Sep 2019 15:07:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <afc9b503-665a-5168-5b80-87867d3e5902@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 6/8] iommu/arm: Add lightweight
 iommu_fwspec support
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpLCBhbGwuCgoKCj4+Cj4+Pj4+Pj4+PiArc3RydWN0IGlvbW11X2Z3c3BlYyB7Cj4+Pj4+Pj4+
PiArwqDCoMKgIC8qIHRoaXMgZGV2aWNlJ3MgSU9NTVUgKi8KPj4+Pj4+Pj4+ICvCoMKgwqAgc3Ry
dWN0IGRldmljZSAqaW9tbXVfZGV2Owo+Pj4+Pj4+Pj4gK8KgwqDCoCAvKiBJT01NVSBkcml2ZXIg
cHJpdmF0ZSBkYXRhIGZvciB0aGlzIGRldmljZSAqLwo+Pj4+Pj4+Pj4gK8KgwqDCoCB2b2lkICpp
b21tdV9wcml2Owo+Pj4+Pj4+Pj4gK8KgwqDCoCAvKiBudW1iZXIgb2YgYXNzb2NpYXRlZCBkZXZp
Y2UgSURzICovCj4+Pj4+Pj4+PiArwqDCoMKgIHVuc2lnbmVkIGludCBudW1faWRzOwo+Pj4+Pj4+
Pj4gK8KgwqDCoCAvKiBJRHMgd2hpY2ggdGhpcyBkZXZpY2UgbWF5IHByZXNlbnQgdG8gdGhlIElP
TU1VICovCj4+Pj4+Pj4+PiArwqDCoMKgIHVpbnQzMl90IGlkc1sxXTsKPj4+Pj4+Pj4+ICt9Owo+
Pj4+Pj4+PiBOb3RlIHRoYXQgeW91IGFidXNlIHhyZWFsbG9jX2ZsZXhfc3RydWN0KCkgd2hlbiB1
c2luZyBpdCB3aXRoIHN1Y2gKPj4+Pj4+Pj4gYSB0eXBlOiBUaGUgbGFzdCBmaWVsZCBpcyBfbm90
XyBhIGZsZXhpYmxlIGFycmF5IG1lbWJlci4gQ29tcGlsZXJzCj4+Pj4+Pj4+IG1pZ2h0IGxlZ2l0
aW1hdGVseSB3YXJuIGlmIHRoZXkgY2FuIHByb3ZlIHRoYXQgeW91IGFjY2Vzcwo+Pj4+Pj4+PiBw
LT5pZHNbMV0gYW55d2hlcmUsIGRlc3BpdGUgeW91IChwcmVzdW1hYmx5KSBoYXZpbmcgYWxsb2Nh
dGVkIAo+Pj4+Pj4+PiBlbm91Z2gKPj4+Pj4+Pj4gc3BhY2UuIChJIGhhdmVuJ3QgYmVlbiBhYmxl
IHRvIHRoaW5rIG9mIGEgd2F5IGZvciB0aGUgbWFjcm8gdG8KPj4+Pj4+Pj4gYWN0dWFsbHkgZGV0
ZWN0IGFuZCBoZW5jZSByZWZ1c2Ugc3VjaCB3cm9uZyB1c2VzLikKPj4+Pj4+PiBJbmRlZWQsIHlv
dSBhcmUgcmlnaHQuIEkgYW0gaW4gZG91YnQsIHdoZXRoZXIgdG8gcmV0YWluIHBvcnRlZCBmcm9t
Cj4+Pj4+Pj4gTGludXggY29kZSAoaWRzWzFdKQo+Pj4+Pj4+Cj4+Pj4+Pj4gYW5kIG1lbnRpb24g
YWJvdXQgc3VjaCBhYnVzZSBvciBjaGFuZ2UgaXQgdG8gZGVhbCB3aXRoIHJlYWwgCj4+Pj4+Pj4g
ZmxleGlibGUKPj4+Pj4+PiBhcnJheSBtZW1iZXIgKGlkc1tdKS4gQW55IHRob3VnaHRzPwo+Pj4+
Pj4gSSdtIG9mIHRoZSBzdHJvbmcgb3BpbmlvbiB0aGF0IHlvdSBzaG91bGQgc3dpdGNoIHRvIFtd
IChvciBhdAo+Pj4+Pj4gbGVhc3QgWzBdKSBub3RhdGlvbi4KPj4+Pj4gSSBnb3QgaXQuIFdlbGws
IHdpbGwgc3dpdGNoIHRvIGlkc1tdIGlmIHRoZXJlIGFyZSBubyBvYmplY3Rpb25zLgo+Pj4+IEkg
c3VzcGVjdCB0aGUgcmF0aW9uYWxlIHRvIHVzZSAxIHJhdGhlciB0aGFuIDAgaXMgdG8gYXZvaWQg
dGhlIAo+Pj4+IHJlLWFsbG9jYXRpb24gaW4KPj4+PiB0aGUgY29tbW9uIGNhc2Ugd2hlcmUgYSBk
ZXZpY2UgaGFzIGEgc2luZ2xlIElELgo+Pj4+Cj4+Pj4gSSB3b3VsZCBsaWtlIHRvIHJldGFpbiB0
aGUgc2ltaWxhciBiZWhhdmlvci4gVGhlIGlkc1sxXSBpcyBwcm9iYWJseSAKPj4+PiB0aGUgbW9z
dAo+Pj4+IHByZXR0eSB3YXkgdG8gZG8gaXQuCj4+Pj4KPj4+PiBBbm90aGVyIHNvbHV0aW9uIHdv
dWxkIHRvIHVzZSB4bWFsbG9jX2J5dGVzKCkgZm9yIHRoZSBpbml0aWFsIAo+Pj4+IGFsbG9jYXRp
b24gb2YKPj4+PiB4bWFsbG9jX2J5dGVzKCkuCj4+PiBXaHkgbm90IHVzZSB4bWFsbG9jX2ZsZXhf
PHdoYXRldmVyPigpIG9uIHRoZSBmaXJzdCBhbGxvY2F0aW9uLCB0b28/Cj4+IEhtbSwgd2h5IG5v
dD8gTG9va3MgbGlrZSB0aGUgeG1hbGxvY19mbGV4X3N0cnVjdCBmaXRzIGhlcmUuCj4+Cj4+IFRo
ZSBmaXJzdCBhbGxvY2F0aW9uIHdvdWxkIGJlOgo+Pgo+PiBmd3NwZWMgPSB4bWFsbG9jX2ZsZXhf
c3RydWN0KHN0cnVjdCBpb21tdV9md3NwZWMswqAgaWRzLCAxKTsKPj4KPj4KPj4gVGhlIHJlLWFs
bG9jYXRpb24gZm9yIHRoZSBkZXZpY2VzIHdpdGggc2luZ2xlIElEIHdvdWxkIGRvIGVmZmVjdGl2
ZWx5IAo+PiBub3RoaW5nIChhc3N1bWluZyB0aGF0IF94cmVhbGxvYyB3aWxsIHJlY29nbml6ZSB0
aGF0IHNpemUgaXMgdGhlIHNhbWUpOgo+Pgo+PiBmd3NwZWMgPSB4cmVhbGxvY19mbGV4X3N0cnVj
dChmd3NwZWMsIGlkcywgZndzcGVjLT5udW1faWRzICsgbnVtX2lkcyk7Cj4+Cj4+Cj4+IEp1bGll
biwgd2hhdCBkbyB5b3UgdGhpbms/Cj4KPiBJIGFtIGhhcHB5IHdpdGggdGhhdC4gVGhlIGZpcnN0
IGFsbG9jYXRpb24gd291bGQgbmVlZCBhIGNvbW1lbnQgb24gdG9wIAo+IGV4cGxhaW5pbmcgdGhl
IHJlYXNvbiBvZiB0aGUgIjEiLgoKU3VyZSwgd2lsbCBhZGQuCgoKCi0tIApSZWdhcmRzLAoKT2xl
a3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
