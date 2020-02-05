Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF2D153326
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 15:37:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izLlC-0004aW-Je; Wed, 05 Feb 2020 14:34:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2f8c=3Z=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1izLlA-0004aR-Qy
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 14:34:32 +0000
X-Inumbo-ID: 9f62358e-4824-11ea-8396-bc764e2007e4
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f62358e-4824-11ea-8396-bc764e2007e4;
 Wed, 05 Feb 2020 14:34:32 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id t23so2742227wmi.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2020 06:34:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+IRV33qFE8Nx0Zn/Ro4tJyX0wuPd8744Smr6oO2cmL4=;
 b=pc9liWVY2JbKzC525TkI2hjORKSMxMQN9KSm13TdRouOJ7oZ4+RQ3R3SdqMczv28om
 bg7bIs5yg7vLTW6FrjJmRO0fP/kRoqMGpvx4U8k4xmw2yHUsMUJE6urK2U3QPXmthzuj
 nCx8C8lIYtO3klw2Mn6Uetxir9UYDVskxgrN3wC0WEQv7XYSuCDuGet9/PhkexAhYeoH
 P9+FLZvWijaGQ09Xu/7DZe2OFYnl1/9inBw4ZHeCwMFqJTx4tpS57Kjb6AlnNiEKnsvf
 2DJ9gXmvBz2Yo308qWEzw1Le+006uE1vog5SAuOPH0THSKIfeu3z8EnqXjUi908Nc7ON
 X6cg==
X-Gm-Message-State: APjAAAUyB6xgP+VBf4kpyygEVYOvFay+uhD4jeq1lAEwTOjOn5YTUroH
 prCVWzYo56RAc20Pj7DBR4I=
X-Google-Smtp-Source: APXvYqw3X30QrD0l9gNdOACEHyjkAsCUnQTMdSLBrIcDwbDjpkQoeY83AHzBrW5H6JYWdlvxQMa6og==
X-Received: by 2002:a1c:6389:: with SMTP id x131mr5947045wmb.174.1580913271394; 
 Wed, 05 Feb 2020 06:34:31 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id q10sm8048700wme.16.2020.02.05.06.34.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 06:34:30 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <730add36-bfa0-e1bb-e2cb-b5570540688c@suse.com>
 <4cf07838-40ff-a941-159a-263c9305b89d@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c2e44382-18b1-f62e-a2a8-98974c040069@xen.org>
Date: Wed, 5 Feb 2020 14:34:29 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <4cf07838-40ff-a941-159a-263c9305b89d@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 4/6] sysctl: use xmalloc_array() for
 XEN_SYSCTL_page_offline_op
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
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ilja Van Sprundel <ivansprundel@ioactive.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMDUvMDIvMjAyMCAxMzoxNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhpcyBp
cyBtb3JlIHJvYnVzdCB0aGFuIHRoZSByYXcgeG1hbGxvY19ieXRlcygpLgo+IAo+IEFsc28gYWRk
IGEgc2FuaXR5IGNoZWNrIG9uIHRoZSBpbnB1dCBwYWdlIHJhbmdlLgoKSXQgZmVlbHMgdG8gbWUg
dGhhdCB0aGUgY29tbWl0IG1lc3NhZ2UvdGl0bGUgc2hvdWxkIGZvY3VzIG9uIHRoZSBzYW5pdHkg
CmNoZWNrLiBUaGUgeG1hbGxvY19hcnJheSgpIGlzIGp1c3QgYSBjbGVhbnVwIGlzICJsZXNzIGlt
cG9ydGFudCIuCgpBcmd1YWxseSB0aGUgY2xlYW4tdXAgc2hvdWxkIGJlIGluIGEgc2VwYXJhdGUg
cGF0Y2ggYnV0IEkgY2FuIGFwcHJlY2lhdGUgCnRoZXkgYXJlIHNvbWV3aGF0IHJlbGF0ZWQuCgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiAt
LS0gYS94ZW4vY29tbW9uL3N5c2N0bC5jCj4gKysrIGIveGVuL2NvbW1vbi9zeXNjdGwuYwo+IEBA
IC0xODcsMTMgKzE4NywxNyBAQCBsb25nIGRvX3N5c2N0bChYRU5fR1VFU1RfSEFORExFX1BBUkFN
KHhlCj4gICAgICAgICAgIHVpbnQzMl90ICpzdGF0dXMsICpwdHI7Cj4gICAgICAgICAgIG1mbl90
IG1mbjsKPiAgIAo+ICsgICAgICAgIHJldCA9IC1FSU5WQUw7Cj4gKyAgICAgICAgaWYgKCBvcC0+
dS5wYWdlX29mZmxpbmUuZW5kIDwgb3AtPnUucGFnZV9vZmZsaW5lLnN0YXJ0ICkKPiArICAgICAg
ICAgICAgYnJlYWs7Cj4gKwo+ICAgICAgICAgICByZXQgPSB4c21fcGFnZV9vZmZsaW5lKFhTTV9I
T09LLCBvcC0+dS5wYWdlX29mZmxpbmUuY21kKTsKPiAgICAgICAgICAgaWYgKCByZXQgKQo+ICAg
ICAgICAgICAgICAgYnJlYWs7Cj4gICAKPiAtICAgICAgICBwdHIgPSBzdGF0dXMgPSB4bWFsbG9j
X2J5dGVzKCBzaXplb2YodWludDMyX3QpICoKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAob3AtPnUucGFnZV9vZmZsaW5lLmVuZCAtCj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBvcC0+dS5wYWdlX29mZmxpbmUuc3RhcnQgKyAxKSk7Cj4gKyAgICAgICAgcHRy
ID0gc3RhdHVzID0geG1hbGxvY19hcnJheSh1aW50MzJfdCwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIChvcC0+dS5wYWdlX29mZmxpbmUuZW5kIC0KPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvcC0+dS5wYWdlX29mZmxpbmUuc3RhcnQgKyAx
KSk7Cj4gICAgICAgICAgIGlmICggIXN0YXR1cyApCj4gICAgICAgICAgIHsKPiAgICAgICAgICAg
ICAgIGRwcmludGsoWEVOTE9HX1dBUk5JTkcsICJPdXQgb2YgbWVtb3J5IGZvciBwYWdlIG9mZmxp
bmUgb3BcbiIpOwo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
