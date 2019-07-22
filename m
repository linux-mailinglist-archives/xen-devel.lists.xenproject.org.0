Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 842826FBF1
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 11:14:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpUMc-0006HM-P5; Mon, 22 Jul 2019 09:12:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZN+7=VT=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hpUMb-0006HH-IG
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 09:12:09 +0000
X-Inumbo-ID: c757cca0-ac60-11e9-8980-bc764e045a96
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c757cca0-ac60-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 09:12:08 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id r15so9078326lfm.11
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2019 02:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5AHWCmH5REw0gXnT9xOFRUVFyqxKM762+DPJHsmDMQA=;
 b=COb8NtzlBdf4U4mgXsPhuhV5JYLaDmBhqM+oaiaDYzbdljNC/Am/EFjpaSo/lTS9EM
 f7nL65fD1L+sh6swYmSNwcMkchdyWrweYNjhoW57831bPf6puWlgz8uIlvSPof4eFEIE
 BspnjCLJxJE8CinmYxS18zX0eEMB023ACWs5tvdBav5kbD0rBcQPsmqGX/Uxus/1omY2
 pRx/v7+bzckwklpr0aAZ2xCgOePiJYOuiKfSwpDfrq5Ps2Bt7WgeUYNPqzm/xo4werS6
 bHayEyX9FU0HPBnYjD4+VUmXiQNWarKg+7B4+3Y4RHtd+x7U0a3ETpMfcqsa6U4gLqJH
 7NCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5AHWCmH5REw0gXnT9xOFRUVFyqxKM762+DPJHsmDMQA=;
 b=XdWM6qqyscIfUVOU83dASRtREcfg5ufAO0hf0HbiX8X7Ygn262WUgYoohMXKqj8na7
 K8fM+vXiMOyTNqvXZhAY3t0Rvhw/jCcU1dSJmyeFRuQxD45k7ed/MDpZs8ZAsRW3Hhbk
 ScL32V6nvxCvAWAE1V9ezLKb9yZfKvacd7EbhCpAwikFajvbDeq0azZpl2I4fnqPrtHa
 oszq9ie56aZjdVGhfSyFPKkvpHUZ2bVielrol701o7EW+PCbrcayaZRa5g39tybxV75u
 J9HJ2qjSO9i180sotshrT8WbUJ0JIjupK1XP9/jVJ+ObxWPM131GTdtCAJhloDK39OC4
 4A/Q==
X-Gm-Message-State: APjAAAXULo3+ZttXWzOmeqx2skb8zn2kFqOLmWgUJS+hRU+p8veA0WFN
 bBHkLf80kFIDdIx0JhdJzpo=
X-Google-Smtp-Source: APXvYqw7pGVb2D1XPJdriQJ47rTS5tnwhH+0+fzW8+URbiaEs5F2QSEDi0B2IWwh8gbhCxmjOhyYnA==
X-Received: by 2002:ac2:4351:: with SMTP id o17mr10653082lfl.100.1563786726569; 
 Mon, 22 Jul 2019 02:12:06 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 199sm7456540ljf.44.2019.07.22.02.12.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 02:12:05 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <1563469897-2773-1-git-send-email-andrii.anisov@gmail.com>
 <581a9cc4-5ba7-717e-faf3-ac52d529d61d@citrix.com>
 <e3d349b3-76bc-677e-5209-fb09fc9b3ea7@gmail.com>
 <7b6d8734-8302-25a2-fe2a-e12bb1f53472@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <6690685e-2626-c261-4817-241e8ef9efe4@gmail.com>
Date: Mon, 22 Jul 2019 12:12:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7b6d8734-8302-25a2-fe2a-e12bb1f53472@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] vunmap: let vunmap align virtual address by
 itself
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
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDE5LjA3LjE5IDEyOjUxLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEN1cnJlbnRseSB2dW5t
YXAoKSBpcyBjYWxsZWQgZnJvbcKgIGZyb20geGVuL2FyY2gvYXJtL2NwdWVycmF0YS5jIHdpdGgg
YW4KPiAKPiBzL8KgIGZyb20vLwo+IAo+PiBhZGRyZXNzIHBvdGVudGlhbGx5IG5vdCBwYWdlIGFs
aWduZWQuIEluc3RlYWQgb2YgZml4aW5nIHRoYXQgaW4gQVJNIGNvZGUsCj4gCj4gcy9BUk0vQXJt
Lwo+IAo+PiB3ZSBsZXQgdnVubWFwKCkgbWFraW5nIGFsaWdubWVudCBieSBpdHNlbGYgYW5kIHN0
cmlwcGluZyBvdGhlciBleGlzdGluZwo+PiB2dW5tYXAoKSBjYWxscyBmcm9tIHByaW9yIG1hc2tp
bmcuIFRoaXMgbWFrZXMgaXQgY29uc2lzdGVudCB3aXRoIGhvdwo+PiB7LHVufW1hcF9kb21haW5f
cGFnZSgpIGN1cnJlbnRseSB3b3Jrcy4KPiAKPiBUaGUgY29tbWl0IG1lc3NhZ2UgZG9lcyBub3Qg
c3RhdGUgd2hhdCBjb3VsZCBnb2VzIHdyb25nIGlmIHRoZSBwYWdlIGlzIG5vdCBhbGlnbmVkLiBT
byBob3cgYWJvdXQ6Cj4gCj4gU2luY2UgY29tbWl0IDljYzA2MThlYjAgInhlbi9hcm06IG1tOiBT
YW5pdHkgY2hlY2sgYW55IHVwZGF0ZSBvZiBYZW4gcGFnZSB0YWJsZXMiLCB0aGUgTU0gY29kZSBy
ZXF1aXJlcyB0aGUgdmlydHVhbCBhZGRyZXNzIHRvIGJlIHBhZ2UtYWxpZ25lZC4gQXMgdGhlIHZ1
bm1hcCgpIGhlbHBlciBpcyBkaXJlY3RseSB1c2VkIHRoZSB2aXJ0dWFsIGFkZHJlc3MgcGFzc2Vk
IGJ5IGl0cyBjYWxsZXIsIHRoaXMgbm93IGltcGxpZXMgdGhlIGNhbGxlciBzaG91bGQgcGFzcyBh
IHBhZ2UtYWxpZ25lZCB2aXJ0dWFsIGFkZHJlc3MuCj4gCj4gT25lIG9mIHRoZSBjYWxsZXIgaW4g
eGVuL2FyY2gvYXJtL2NwdWVycmF0YS5jIG1heSBhY3R1YWxseSBwYXNzIGFuIHVuYWxpZ25lZCBh
ZGRyZXNzIHJlc3VsdGluZyB0aGUgdnVubWFwKCkgdG8gc2lsZW50bHkgZmFpbCBhbmQgcG90ZW50
aWFsbHkgbWFraW5nIGZ1dHVyZSB1c2VyIG9mIHZtYXAoKSB0byBmYWlsICh0aGUgTU0gY29kZSBk
b2VzIG5vdCBhbGxvdyB0byByZXBsYWNlIGV4aXN0aW5nIG1hcHBpbmcpLgo+IAo+IEluIGdlbmVy
YWwsIGl0IHdvdWxkIGJlIGJldHRlciB0byBoYXZlIHZ1bm1hcCgpIG1vcmUgcmVzaWxpZW50IHRv
IHVuYWxpZ25lZCBhZGRyZXNzLiBTbyB0aGUgZnVuY3Rpb24gaXMgbm93IHBhZ2UtYWxpZ25pbmcg
dGhlIHZpcnR1YWwgYWRkcmVzcy4KPiAKPiBOb3RlIHRoYXQgZm9yIG11bHRpLXBhZ2VzIHZpcnR1
YWwgbWFwcGluZywgdGhlIGFkZHJlc3Mgc2hvdWxkIHN0aWxsIHBvaW50IGludG8gdGhlIGZpcnN0
IHBhZ2UuIE90aGVyd2lzZSwgdnVubWFwKCkgbWF5IG9ubHkgcGFydGlhbGx5IHJlbW92ZSB0aGUg
bWFwcGluZy4KCkknbSBvayB3aXRoIHRoYXQuCgoKPiBXaHkgZGlkIHlvdSByZW1vdmUgdGhlIGZv
bGxvd2luZyBsaW5lOgo+ICDCoC0gc3RyaXAgYWxsIGV4aXN0aW5nIHZ1bm1hcCgpIGNhbGxzIGZy
b20gcHJpb3IgbWFza2luZwoKQmVjYXVzZSBJIGFscmVhZHkgbWVudGlvbmVkIGl0IGluIHRoZSBt
YWluIGJvZHkgb2YgbXkgbWVzc2FnZS4KCj4gYWRkcmVzcyBwb3RlbnRpYWxseSBub3QgcGFnZSBh
bGlnbmVkLiBJbnN0ZWFkIG9mIGZpeGluZyB0aGF0IGluIEFSTSBjb2RlLAo+IHdlIGxldCB2dW5t
YXAoKSBtYWtpbmcgYWxpZ25tZW50IGJ5IGl0c2VsZiBhbmQgc3RyaXBwaW5nIG90aGVyIGV4aXN0
aW5nCj4gdnVubWFwKCkgY2FsbHMgZnJvbSBwcmlvciBtYXNraW5nLgoKWWV0LCB3aXRoIHlvdXIg
dGV4dCBib3RoIG5vdGVzIGFyZSBuZWVkZWQuCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
