Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68212FB56F
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 17:43:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUvhh-00053j-Fv; Wed, 13 Nov 2019 16:41:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G7aE=ZF=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1iUvhf-00053e-LV
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 16:41:11 +0000
X-Inumbo-ID: 65b52620-0634-11ea-b678-bc764e2007e4
Received: from mail-lj1-x22e.google.com (unknown [2a00:1450:4864:20::22e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65b52620-0634-11ea-b678-bc764e2007e4;
 Wed, 13 Nov 2019 16:41:10 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id n21so3292027ljg.12
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2019 08:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GhAkD8hzO9fLzCeGw8sROnz68K8O+Q/dc4DOdR2GgoI=;
 b=u1YI0Qc9pXhyIrYZsHBRmYPJt/SfQLvP8WreIFkFH0K71akTE+bqR6MmHCfX5Tp25l
 A/vvgb7bGbDjKOeLw5eIdoyoGKzp9lvPkByu+FDudfFAXPNEjp8e8ZYU8sfd/uCFEqvT
 6rQQ+DzmjZasJ3QOOZntUifmZk/tENvdMyCpx+g4EKKyUk/PA37ugpKsJe9etbrHpvd5
 ZQf9zD63SA90FmkoCvbYp855dIyU0GnE1JuM3o6o56XhtZMafedCR/M+F9cvlvHhQLHJ
 x2rr9cuAZtVTjIUA/5tNbDCEyDR/y6rdrSQ+bpS1t1Snuh51gPEqiaQGa3jtSK70xkEE
 VOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GhAkD8hzO9fLzCeGw8sROnz68K8O+Q/dc4DOdR2GgoI=;
 b=Kl40y0lpD+UqyZnwIh2JaE/sJuEYAF4G54TiWpYEjbNj5SFFWMeed0mizEpivPioE5
 YBeG+0nwb/3WvMCx19eP0UTBwZ80lDrXtd85wwmSdCSZcmgbogt8wgg8Z4hB4Tx0C0kX
 LPaL7ZD77wYgDWIyWrN9qMlEkTIKlcm+WPK4zkipQLLhOT2G8ZYNkBkuJMWACa3W3xyc
 lEp74YHpohVyBDxRHmCB7A8C/OMprQ6mxCOJbJ08/QsMPvMhNvJBjM3dc7oRJE8PXt7n
 j4kJwwnCUEceJtB8QV2h/jKKtS/sy/vvIsRRxikQkvIrIiNvMHw0IB1hg7Cf6xECTK7D
 +mVQ==
X-Gm-Message-State: APjAAAXXdxnFQV04/TmDnVW87KMSR5trrfHLSY7hDXERwFeXEAHvmrCL
 /RSornxYqnQRCcoPEhz+bHk=
X-Google-Smtp-Source: APXvYqx19702mfUkfhBxlE0KRJNPPQDgxzTlCPeDbP6Y+522TAQOxP6OK0KHTXk7IntV7hr6DBimjA==
X-Received: by 2002:a2e:b0d3:: with SMTP id g19mr3200138ljl.135.1573663269645; 
 Wed, 13 Nov 2019 08:41:09 -0800 (PST)
Received: from [10.17.180.84] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 y18sm1283353lja.12.2019.11.13.08.41.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Nov 2019 08:41:08 -0800 (PST)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-7-git-send-email-andrii.anisov@gmail.com>
 <alpine.DEB.2.21.1911111254510.2677@sstabellini-ThinkPad-T480s>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <b72146f4-9a01-b7d4-c191-4211b58fb406@gmail.com>
Date: Wed, 13 Nov 2019 18:41:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1911111254510.2677@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 6/7] arm: Introduce dummy empty functions for
 data only C files
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
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gU3RlZmFubywKCk9uIDExLjExLjE5IDIyOjU3LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3Jv
dGU6Cj4gT2ggbWFuLCB0aGlzIGlzIHRydWx5IGhvcnJpYmxlLgoKSSBmZWVsIHlvdXIgcGFpbi4K
Cj4gCj4gSWYgd2UgcmVhbGx5IGhhdmUgdG8gZG8gdGhpcyBwbGVhc2U6Cj4gCj4gLSB1c2UgdGhl
IHNhbWUgZHVtbXkgZnVuY3Rpb24gbmFtZSBpbiBhbGwgZmlsZXMKCk5vLCBiZWNhdXNlCgo+IC0g
dGhlIGZ1bmN0aW9uIHNob3VsZCBiZSBzdGF0aWMKCnRob3NlIGZ1bmN0aW9ucyB3aWxsIG5vdCBo
YW5kbGUgdGhlIGNhc2UgaWYgYXJlIHN0YXRpYy4KCkFSTSBjb21tZW50ZWQgdGhlIGlzc3VlIGlu
IHRoZSBjb3JyZXNwb25kZW50IHN1cHBvcnQgY2FzZToKCiJBIGtub3duIHdvcmthcm91bmQgaXMg
dG8gZWRpdCB0aGUgc291cmNlIGZpbGUgYW5kIGFkZCBhbiB1bnVzZWQgZW1wdHkgZnVuY3Rpb24s
IGFzIHlvdeKAmXZlIGFscmVhZHkgZm91bmQuIEJ5IGRlZmF1bHQsIGFuIHVudXNlZCBlbXB0eSBm
dW5jdGlvbiBzaG91bGQgYmUgcmVtb3ZlZCBmcm9tIHRoZSBmaW5hbCBpbWFnZSBieSB0aGUgdW51
c2VkIHNlY3Rpb24gZWxpbWluYXRpb24gZmVhdHVyZSBvZiB0aGUgbGlua2VyLCBzbyBpdCBzaG91
bGRu4oCZdCBoYXZlIGEgY29kZSBzaXplIGltcGFjdC4KCkEgY29tbWFuZC1saW5lIG9wdGlvbiB3
b3JrYXJvdW5kIGlzbuKAmXQgYXZhaWxhYmxlLiBXZeKAmWxsIG5vdyBzZXQgdGhpcyBjYXNlIHRv
IGEg4oCcRGVmZWN0L0VuaGFuY2VtZW504oCdIHN0YXRlIHdoaWxlIHRoZSBpc3N1ZSByZW1haW5z
IHVuZml4ZWQsIGFuZCB3aWxsIGtlZXAgeW91IHVwZGF0ZWQgYWNjb3JkaW5nbHkuIgoKCj4gLSBo
aWRpbmcgdGhlIGZ1bmN0aW9uIHdpdGhpbiBhICNpZmRlZiBBUk1DQyBibG9jawo+IC0gcG90ZW50
aWFsbHkgaGlkZSB0aGUgd2hvbGUgaG9ycmlibGUgaGFjayBiZWhpbmQgYSAjZGVmaW5lIHNvIHRo
YXQgaXQKPiAgICB3b3VsZCBiZWNvbWUgYXQgdGhlIGNhbGwgc2l0ZToKPiAKPiAgICtBUk1DQ19E
VU1NWV9GVU5DX0hBQ0soKQoKVGhpcyBpcyBxdWl0ZSByZWFzb25hYmxlLgoKLS0gClNpbmNlcmVs
eSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
