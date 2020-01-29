Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4B014CC34
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 15:19:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwo9n-0003dT-EZ; Wed, 29 Jan 2020 14:17:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TfIU=3S=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iwo9l-0003dO-NK
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 14:17:25 +0000
X-Inumbo-ID: 11d3890c-42a2-11ea-8396-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11d3890c-42a2-11ea-8396-bc764e2007e4;
 Wed, 29 Jan 2020 14:17:24 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id w1so18655627ljh.5
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 06:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b5jbDYM2faUbgBeq+jGJI7q5ug1uDUQWuBxlPp3LgiA=;
 b=PSUpFkAqpuVaDfO/z9YyMcz/EAmh16fMWNZM1s1vzbp5A8j+w7lPGd4gJALbiSAfXK
 bTz6kGJSqe/yyCy2+MR6OvYiZnnLDdsdCFSpZw8OP5hCNGKZzp5hy/s1ulmvifLLE1dy
 7fWTs+dYdf0vFhMdwK0PDL6fqlnwDU21eZLBA5R6Ugzlw7bdbT5Kf/ZjrU/aceNRxGhK
 4SuDxGlTEBfJoBfhIxJUfzj8wuG5U+JVv5TpZXW710wdWKKMG9FlqqGWH427UV9DKTO0
 0D/HD+L+jS99TUUzXd3T0kZANtAsiv9DyBTuY/dP6dxRogvYzjhDFzwSVoNqHdNw8Hfn
 C/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b5jbDYM2faUbgBeq+jGJI7q5ug1uDUQWuBxlPp3LgiA=;
 b=U/3cgY9Ltnc8SsaLU3hSj1zoTA0tnETUQDeQbnwB+1ptofUQbRsuG8pSgsXMNhkImo
 NrFL7C8bG9isVK+FoOhBtayR7xcA+cPn3gTwAwUiIr9T6VNIACgzHcTnrJl8FJYoDkGZ
 EodtgYfsTOzVp/tK8bHkRFpqVxMQh0W/ZWlEuYKLE2aoSp8d+Crcejy3QyBil7sA8DD8
 /QY13E3kNPb5wEnOzhW8LwmnkP4RYZoOhnRK8D2DauxKuTwzjdkChytw7yT+O0cFL7un
 st7n29xVXuVAKBoVlFZGB7iTdHMP/NvNlL1+IzGL86HJ9X5I1q3QSP9QjphIG+3CKNYn
 WU/g==
X-Gm-Message-State: APjAAAU+eCFpAn4Kc18gkbrHzUmyOynskvPx/lQ6y2ZWQcAjmBl63mL6
 /A58277UqemwjyBNfQz3ZdLOeSUFgbb9ARPwykk=
X-Google-Smtp-Source: APXvYqzmEFswUohjKVzD3pw7LXcpegsQ2O25DsNqNIpdEExbjN3OvQ6Y4LfhT9YxiAqMT73dksk3fDxCuWavD+PsZ2M=
X-Received: by 2002:a2e:9ad1:: with SMTP id p17mr16889939ljj.26.1580307443402; 
 Wed, 29 Jan 2020 06:17:23 -0800 (PST)
MIME-Version: 1.0
References: <20200117155734.1067550-1-george.dunlap@citrix.com>
 <20200117155734.1067550-8-george.dunlap@citrix.com>
 <CAEBZRSc_+G6itzyNGMd7GO5eC6aOZ3zE7vopQmTiQ5CnG+6VYw@mail.gmail.com>
 <4db0f4fa-98db-33d6-5be5-f6ea59096166@citrix.com>
 <CAEBZRSe8Hz7iu7B+2-X3BV8qS9sneRr8Qanb-y6uDh6vYbuk0Q@mail.gmail.com>
In-Reply-To: <CAEBZRSe8Hz7iu7B+2-X3BV8qS9sneRr8Qanb-y6uDh6vYbuk0Q@mail.gmail.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Wed, 29 Jan 2020 09:17:12 -0500
Message-ID: <CAEBZRSfAiD3xgRQNHryEqAaP+_idQFA+8Fhk7qSo2Xq81rgudQ@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v3 8/8] RFC: Sketch constructors,
 DomainCreateNew
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBJICp0aGluayogdG8gZ3VhcmFudGVlIHRoYXQgbGlieGxfPHR5cGU+X2luaXQoKSBoYXMgYmVl
biBjYWxsZWQgd2hlbgo+IHVubWFyc2hhbGluZywgd2Ugd291bGQgbmVlZCB0byBnZW5lcmF0ZSBV
bm1hcnNoYWxKU09OIGZ1bmN0aW9ucyB0bwo+IGltcGxlbWVudCBqc29uLlVubWFyc2hhbGVyLiBF
LmcuLDoKPgo+IGZ1bmMgKGRkICpEZXZpY2VEaXNrKSBVbm1hcnNoYWxKU09OKGRhdGEgW11ieXRl
KSBlcnJvciB7Cj4gICAgICAgICBpZiBkZCA9PSBuaWwgeyAvLyBPciBtYXliZSB0aGlzIGlzIHRo
ZSAnaW5pdGlhbGl6ZWQnIGNoZWNrIHlvdSBtZW50aW9uZWQKCkVyciwgSSBtZWFuIGBpZiBkZCA9
PSAoRGV2aWNlRGlza3t9KWAuIFdlIHdhbnQgdG8gY2hlY2sgaWYgdGhlIHZhbHVlCnRoYXQgZGQg
cG9pbnRzIHRvIGlzIHRoZSBEZXZpY2VEaXNrIHplcm8gdmFsdWUuCgotTlIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
