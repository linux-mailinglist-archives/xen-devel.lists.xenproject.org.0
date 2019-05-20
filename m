Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4C4239EC
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 16:26:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSjD2-0006eR-Ia; Mon, 20 May 2019 14:24:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TkHb=TU=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hSjD0-0006dM-7s
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 14:24:10 +0000
X-Inumbo-ID: eddf076e-7b0a-11e9-8980-bc764e045a96
Received: from mail-ed1-f67.google.com (unknown [209.85.208.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id eddf076e-7b0a-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 14:24:09 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id g57so24104522edc.12
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2019 07:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:cc:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q1arsWTAd8vNbykE6Ge3tNNkPuFvR31/4m+O5I48s8w=;
 b=UFw/MC3lHEbTf0YfpPCNYRHuVWTVXvPneRM8mmVKQl6j44WTdGCAf2EhkuuqrNW9og
 TvIyHYJtUQOnYm9t4AwG8yJVPGKfIbdQCEkYbOt3kT9qkyNlFV7tRkFlAxFdyOgX0/ai
 ZwOL5Vv2tgNq7IMZYCuOvtBC3XdKNOE3FjwUWQ75SSMsrb4z6I1BrtgizuNZ0HTCOdyC
 JN3uk7QTNmLG5XLMZr8u8fwkJ/9jrUANJzuM/i/9QxZDwtpALVCODXxUq16InFaaqnEt
 75LEhXKnUMRKrSWuaaj2bNjxZIQSGLatSyOdTnmGHid/LrgCGNy139Q94WYMRiYhLxJM
 0DCg==
X-Gm-Message-State: APjAAAVRUXKvF50aNbCIo8XMFrzqj5VbCwNuczkbSWFITNzBdgIg7Hgj
 rZp/+jnfUEm43rdeBs+VYsU=
X-Google-Smtp-Source: APXvYqyZaGtCfjb4tSz4eEkbxNOaiqBgJ319NfvGalT3xtp7nJUvkIP5okazozXGzGdiydS07Ed5wQ==
X-Received: by 2002:a17:906:c52:: with SMTP id
 t18mr59197835ejf.53.1558362247889; 
 Mon, 20 May 2019 07:24:07 -0700 (PDT)
Received: from [10.80.2.73] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id mh2sm3139717ejb.33.2019.05.20.07.24.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 07:24:07 -0700 (PDT)
To: Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>
References: <20190517170555.17423-1-wei.liu2@citrix.com>
 <23778.45224.28897.55507@mariner.uk.xensource.com>
From: Wei Liu <wl@xen.org>
Message-ID: <9454fe63-9870-5795-beae-7f4dda4684b1@xen.org>
Date: Mon, 20 May 2019 15:24:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <23778.45224.28897.55507@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] libxl: fix libxl_domain_need_memory after
 899433f149d
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Olaf Hering <olaf@aepfle.de>, wl@xen.org,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMC8wNS8yMDE5IDE0OjUwLCBJYW4gSmFja3NvbiB3cm90ZToKPiBXZWkgTGl1IHdyaXRl
cyAoIltQQVRDSF0gbGlieGw6IGZpeCBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnkgYWZ0ZXIgODk5
NDMzZjE0OWQiKToKPj4gQWZ0ZXIgODk5NDMzZjE0OWQgbGlieGwgbmVlZHMgdG8ga25vdyB0aGUg
Y29udGVudCBvZiBkX2NvbmZpZyB0bwo+PiBkZXRlcm1pbmUgd2hpY2ggUUVNVSBpcyB1c2VkLiBU
aGUgY29kZSBpcyBjaGFuZ2VkIHN1Y2ggdGhhdAo+PiBsaWJ4bF9fZG9tYWluX3NldF9kZXZpY2Vf
bW9kZWwgbmVlZHMgdG8gYmUgY2FsbGVkIGJlZm9yZQo+PiBsaWJ4bF9fZG9tYWluX2J1aWxkX2lu
Zm9fc2V0ZGVmYXVsdC4KPj4KPj4gVGhpcyBpcyBmaW5lIGZvciBsaWJ4bCBjb2RlLCBidXQgaXQg
aXMgcHJvYmxlbWF0aWMgZm9yCj4+IGxpYnhsX2RvbWFpbl9uZWVkX21lbW9yeSwgd2hpY2ggaXMg
dGhlIG9ubHkgcHVibGljIEFQSSB0aGF0IHRha2VzIGEKPj4gYnVpbGRfaW5mby4gVG8gYXZvaWQg
YnJlYWsgaXRzIHVzZXJzLCBwcm92aWRlIGEgY29tcGF0aWJpbGl0eSBzZXR0aW5nCj4+IGluc2lk
ZSB0aGF0IGZ1bmN0aW9uLgo+IAo+IFRoaXMgbG9va3MgcGxhdXNpYmxlIHRvIG1lLiAgSSBzZWUg
dGhhdCB0aGlzIGZ1bmN0aW9uIGFscmVhZHkgbWFrZXMgYQo+IGNvcHkgb2YgdGhlIGJfaW5mbywg
c28gd2UgZG8gbm90IGVuZCB1cCBhY2NpZGVudGFsbHkgbGVha2luZyB0aGlzIG5ldwo+IGRlZmF1
bHQgc2V0dGluZyB0byB0aGUgY2FsbGVyLgo+IAo+IEFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiAKClRoYW5rcy4KCkkgaGF2ZSBmaXhlZCB1cCB0aGUg
aXNzdWVzIFJvZ2VyIGFuZCBBbmR5IGZvdW5kIGFuZCBwdXNoZWQgdGhpcyBwYXRjaC4KCldlaS4K
Cj4gVGhhbmtzLAo+IElhbi4KPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKPiBYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
