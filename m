Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4592C24C29
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 12:04:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT1aD-00039l-4a; Tue, 21 May 2019 10:01:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wdSZ=TV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hT1aA-00039g-WC
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 10:01:19 +0000
X-Inumbo-ID: 5fb0df98-7baf-11e9-8980-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5fb0df98-7baf-11e9-8980-bc764e045a96;
 Tue, 21 May 2019 10:01:17 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id m15so5972886ljg.13
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2019 03:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dhLHJp8nvlz4l4nWJyCx7dwWgySL3Hm8Qww0sYcJAIw=;
 b=JKZ8kKmHhNb4SGpWMNDgUl9GqhZBqNYMEG66+R5o5Kym7ILqrHVsvTVow7GnwBqPne
 lx3dFDLZ+whYVjjJkKouazerUm47D6KsixakSbnun9qz7L80Ac1co34q7hIj2mgcFsok
 aF0a4vguHCSOGlaYHgUwr9c7mswJnqm2aZBloqjirEMXePrVyRyPoL5BJdIkUrmzQsaw
 o8mRRi1FNpgKHI5Bd3N/mRt5PKvUZ0cHgidQ9aa8//Y/is90jb7hCCpsyLF+bmtzLYOf
 EcONd2Kd+rkeYy72CITJCIqJYHQulFn8tWOdUuLLWWvyDfacOjeGFMkka5Joyq0Vri1l
 99bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dhLHJp8nvlz4l4nWJyCx7dwWgySL3Hm8Qww0sYcJAIw=;
 b=Gw9sVp0u7MoXicFXa9G1Bd4wFhUqzbNZRBpKVTjHFira/c9uk3FcYPNy7QlvbIvlom
 AQT5juUfMU9PY1nZi0LBVrrKpF2WtEtQeCVEpeqAHgQqOcj275JGl1nd28OrguBckwxA
 DxkdDOhcQl3U+PTiHbEz8+hrS/TrWDxH2I7JLpg2EcMs0ctY6huDqegqQ/FT04BPLOu3
 TOg77aekgQyX+tKOkBBWPCnF6f8eiT9t2zvN1gpdF9LLZxu1I73cbibXvhRZSwFMY68b
 o5kSHn9X1vK96E9M8k4wgDmDwWSp8HCyenhTSJKngJMdo5AZUqPDsTKtvp41EAigG5v9
 4ECw==
X-Gm-Message-State: APjAAAXsJO4C3ex04psPJmHbYe2sKyFVKCeQFIv/inltxfkeNsn5rWfp
 NLgz6yDI8xVcLjSpSsh+PtsxW6pUVtA=
X-Google-Smtp-Source: APXvYqzGdoQX169iEKNbkFEXAqFWbN8kr0u8Bcn1fLN7l7X2oJcSWHe3eFVKAPZIFVoIr9YBo52LOg==
X-Received: by 2002:a2e:818b:: with SMTP id e11mr40575703ljg.82.1558432875627; 
 Tue, 21 May 2019 03:01:15 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 c8sm2607405ljk.77.2019.05.21.03.01.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 May 2019 03:01:14 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-2-julien.grall@arm.com>
 <alpine.DEB.2.21.1905201443320.16404@sstabellini-ThinkPad-T480s>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <af657af7-ad1e-1f23-95d6-3d8e133af686@gmail.com>
Date: Tue, 21 May 2019 13:01:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1905201443320.16404@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 01/19] xen/const: Extend
 the existing macro BIT to take a suffix in parameter
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
Cc: Andrii_Anisov@epam.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr_Tyshchenko@epam.com, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMS4wNS4xOSAwMDo0MywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IE9uIFR1ZSwg
MTQgTWF5IDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gQXJtIGN1cnJlbnRseSBwcm92aWRl
cyB0d28gbWFjcm8gQklUIGFuZCBCSVRfVUxMIHRoYXQgYXJlIG9ubHkgdXNhYmxlCj4+IGluIEMg
YW5kIHJldHVybiByZXNwZWN0aXZlbHkgdW5zaWduZWQgbG9uZyBhbmQgdW5zaWduZWQgbG9uZyBs
b25nLgo+Pgo+PiBFeHRlbmRpbmcgdGhlIG1hY3JvcyB0byBkZWFsIHdpdGggYXNzZW1ibHkgd291
bGQgYmUgYSBuaWNlIGJlbmVmaXRzIGFzCj4+IGl0IGNvdWxkIHJlcGxhY2UgdGhlIGNvbW1vbiBw
YXR0ZXJuIHRvIGRlZmluZSBmaWVsZHMgKEFDKDEsIHNmeCkgPDwgWCkKPj4gZWFzaWVyIHRvIHJl
YWQuCj4+Cj4+IFJhdGhlciB0aGFuIGV4dGVuZGluZyB0aGUgdHdvIG1hY3JvcywgaXQgd2FzIGRl
Y2lkZWQgdG8gZHJvcCBCSVRfVUxMKCkKPj4gYW5kIGV4dGVuZCB0aGUgbWFjcm8gQklUKCkgdG8g
dGFrZSBhIHN1ZmZpeCAoZS5nIFUsIFVMLCBVTEwpIGluCj4+IHBhcmFtZXRlci4gVGhpcyB3b3Vs
ZCBhbGxvdyB0byB1c2UgZGlmZmVyZW50IHN1ZmZpeCB3aXRob3V0IGhhdmluZyB0bwo+PiBkZWZp
bmUgbmV3IG1hY3Jvcy4KPj4KPj4gVGhlIG5ldyBleHRlbmQgbWFjcm8gaXMgbm93IG1vdmVkIGlu
IGluY2x1ZGUveGVuL2NvbnN0Lmggc28gaXQgY2FuIGJlCj4+IHVzZWQgYnkgYW55b25lIGluIFhl
biBhbmQgYWxzbyBhdm9pZCB0byBpbmNsdWRlIGJpdG9wcy5oIGluIGFzc2VtYmx5Cj4+IGNvZGUu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
CiAgClJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoK
LS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
