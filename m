Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFBF13D781
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 11:07:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is20z-0001tU-HC; Thu, 16 Jan 2020 10:04:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=03Je=3F=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1is20x-0001tP-F6
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 10:04:35 +0000
X-Inumbo-ID: 96738e76-3847-11ea-86de-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 96738e76-3847-11ea-86de-12813bfff9fa;
 Thu, 16 Jan 2020 10:04:31 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b19so3048773wmj.4
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2020 02:04:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/pebVXctaG1SKwFv5JCkDp0R4PSWkmgat4FAXYGXAqs=;
 b=WGiJldbztQV31ruWxeJEVQXeqgRy2/hwkg5mz4l+K5SLnvstp4TZZR+I7yof7M6sac
 /MDin5cSbfycloy7/KB+ZsienA5l2U+HmR7sZaCPHN9BHV88GhVd01YEVMok/FI305wD
 +LfpOZcuXLLfruE+Jz9byjwJcBT305MZhbjOgdF2S1192a3NI07LwsEZzYdsYgwYXH5L
 KqWmex5Wx39/5qqMpGd7Owb5QtRvDBm+N//dRkhtz6snWrAKC0blYRH/6+qp+r86JkYR
 f9UKs9KWUR+ag4uZyyKk7j1D+9RolcgGftRjDbQ1arm+pipkVpXMcaTLb1DunZig/fjX
 tTuw==
X-Gm-Message-State: APjAAAVLq9m/K9Tp3vuNjn3M/O47GEtaLqOEjvI5TJcDiKnKlsXRU18Y
 JJHlP8szP005yVd0iqRYYUs=
X-Google-Smtp-Source: APXvYqyAf+2Td06owCc1wWdFKlA066HhRZ87qw+uMrC03BmN/B4It9IxCoWj9ZjyINHiSAo18xzRRg==
X-Received: by 2002:a7b:c151:: with SMTP id z17mr5245536wmi.137.1579169070477; 
 Thu, 16 Jan 2020 02:04:30 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-226.amazon.com.
 [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id k7sm3904215wmi.19.2020.01.16.02.04.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2020 02:04:29 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200115184418.21365-1-andrew.cooper3@citrix.com>
 <c42a1292-d7e9-fe23-1a44-866c2c7c5c9e@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c8f32fd7-10ed-3ba4-694d-626c72203717@xen.org>
Date: Thu, 16 Jan 2020 10:04:28 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <c42a1292-d7e9-fe23-1a44-866c2c7c5c9e@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/vcpu: Improve sanity checks in
 vcpu_create()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxNi8wMS8yMDIwIDA5OjU1LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAxNS4wMS4y
MDIwIDE5OjQ0LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBUaGUgQlVHX09OKCkgaXMgY29uZnVz
aW5nIHRvIGZvbGxvdy4gIFRoZSAoIWlzX2lkbGVfZG9tYWluKGQpIHx8IHZjcHVfaWQpIHBhcnQK
Pj4gaXMgYSB2ZXN0aWdpYWwgcmVtbmFudCBvZiBhcmNoaXRlY3R1cmVzIHBvaXNpb25pbmcgaWRs
ZV92Y3B1WzBdIHdpdGggbm9uLU5VTEwKPj4gcG9pbnRlcnMuCj4+Cj4+IE5vdyB0aGF0IGlkbGVf
dmNwdVswXSBpcyBOVUxMIG9uIGFsbCBhcmNoaXRlY3R1cmVzLCBhbmQgZC0+bWF4X3ZjcHVzIHNw
ZWNpZmllZAo+PiBiZWZvcmUgdmNwdV9jcmVhdGUoKSBpcyBjYWxsZWQsIHdlIGNhbiBwcm9wZXJs
eSByYW5nZSBjaGVjayB0aGUgcmVxdWVzdGVkCj4+IHZjcHVfaWQuCj4gCj4gSSBndWVzcyB0aGlz
IGlzIG1lYW50IHRvIGJlIHRydWUgb24gdG9wIG9mIHlvdXIgQXJtIHNpZGUgY2hhbmdlCj4gd2hp
Y2ggaGFzbid0IGJlZW4gY29tbWl0dGVkIHlldD8gQW5kIHBlcmhhcHMgYmV0dGVyICIuLi4gc3Rh
cnRzCj4gb3V0IGFzIE5VTEwgb24gYWxsIC4uLiI/CgpJIGNhbiBjb21taXQgdGhlIHR3byB0b2dl
dGhlci4KCj4gCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgoKQ2hlZXJzLAoK
LS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
