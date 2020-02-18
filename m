Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B325162F9E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 20:17:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j48Jw-0004J3-7w; Tue, 18 Feb 2020 19:14:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6oMY=4G=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1j48Ju-0004Iy-VD
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 19:14:10 +0000
X-Inumbo-ID: d7668bd4-5282-11ea-ade5-bc764e2007e4
Received: from mail-pf1-x441.google.com (unknown [2607:f8b0:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7668bd4-5282-11ea-ade5-bc764e2007e4;
 Tue, 18 Feb 2020 19:14:10 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id i6so11143854pfc.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2020 11:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q7rUwdi0prvNk3ZvYSJ53p/vwPF2xCpbk/nQYIhptts=;
 b=Kv01+6EWIvqV9yQSEqUsC3rTBZa7c1WzfCmgv2bIZrqwVkO8twS/S5VAPA/cgZVb1O
 puglKsjeHyv79HOEzfko58vPsYbbt5ouVSKjQURoxFvn7hxwtVo8imM9YdWxspZQew96
 3Yx9SbbGDHOG7hyTg8r+JRErWg9JSm8eRaZZLa7TtR7YQ//MP7+Hz2JrcDLws49S8Kki
 5KSEwH2kQvrT11kEwoj5o3/+7QMXpYUZeWO2PT26q/nO+5VLTK7xU+BL5SLE5XhtGutw
 H6ieaSmWX+Zr4N9UWA9wIo88kDKX1hVmJqpHRcgaeHO185lmqHovUj+WffPEaSdvsZYw
 iO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q7rUwdi0prvNk3ZvYSJ53p/vwPF2xCpbk/nQYIhptts=;
 b=MX3qF0LxuOz6yIAmM5URgTVvU5HARtnhT+1rCM3GT8aID4rgI9Buu7NNyav/P0ZLS6
 gFKVqLlOayrgwmfGXNHTWBJXFxU/pDLbHePZaWj5+VPqq5wzDg21BfHYQ/PkNseon0eM
 POYmHa1Pt24RuCmU9ldJuAU+MUK7jzSscTpYqMVgfiw6UgwW2J2SRbvT08snS1BZ399m
 vt+okgLuaYkdOE0Fk6ERGsocx6P7yYS8CWWnqxRAODGUxf95CO9ojzwyLb02aHvVa3So
 o2YIdKYWDFXKOECi0lbxVPunTecrAwa48pm0QjkzjdQMEVtq+RMwoQsYKSPJvD6kN1lf
 Ip0A==
X-Gm-Message-State: APjAAAWzPX2UKgu5eclZYUPIX/nvilKykrql/VBHm66baWYoGKXIu5NY
 bGrbAggg23kP3mytUJf1ObE5iQ==
X-Google-Smtp-Source: APXvYqwrVMs0yh7CDR2NFVCdL3eYWxKYDhRdf9ecfSKiuilKs1u6UAQfvxQI6D9fsMIalDTt0BqZkQ==
X-Received: by 2002:a63:c643:: with SMTP id x3mr22957967pgg.299.1582053249684; 
 Tue, 18 Feb 2020 11:14:09 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 m187sm5572153pga.65.2020.02.18.11.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2020 11:14:09 -0800 (PST)
To: Stefan Weil <sw@weilnetz.de>, Peter Maydell <peter.maydell@linaro.org>
References: <20200218132023.22936-1-philmd@redhat.com>
 <87e06de3-179b-54a1-3451-39a0a30b65f0@weilnetz.de>
 <CAFEAcA9Jr2Yi1K8_9MGUJYt8C=OcKbWDh1UJjTQG1EspLux3JQ@mail.gmail.com>
 <eed26f29-6cbd-7663-7f30-39596bb70422@weilnetz.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d0eab4fe-14ec-70a0-6917-8fc097265bf7@linaro.org>
Date: Tue, 18 Feb 2020 11:14:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <eed26f29-6cbd-7663-7f30-39596bb70422@weilnetz.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] Avoid cpu_physical_memory_rw() with a
 constant is_write argument
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMi8xOC8yMCAxMDo1OSBBTSwgU3RlZmFuIFdlaWwgd3JvdGU6Cj4gUGVyc29uYWxseSBJIGxp
a2UgdGhlIHdheSBob3cgdGhlIHN0YW5kYXJkIEMgbGlicmFyeSBoYW5kbGVzIHN1Y2gKPiBwb2lu
dGVycyBmb3IgZnVuY3Rpb25zIGxpa2UgbWVtY3B5LCBmcmVhZCwgZndyaXRlIGFuZCBvdGhlcnMu
Cj4gCj4gVGhlcmVmb3JlIEkgc3VnZ2VzdCB0byB1c2UgYGNvbnN0IHZvaWQgKmAgYW5kIGB2b2lk
ICpgIGFuZCB0byBhdm9pZCB0eXBlCj4gY2FzdHMuCgpTZWNvbmRlZC4KCgpyfgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
