Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A65497D5C3
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 08:48:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ht4qX-0001Ni-1u; Thu, 01 Aug 2019 06:45:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=d+It=V5=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1ht4qV-0001Nd-Kx
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 06:45:51 +0000
X-Inumbo-ID: ff228435-b427-11e9-8980-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ff228435-b427-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 06:45:49 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id i21so68219147ljj.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2019 23:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=otYYfVkbUpO3XH8YY3WoZCCDHE4RvsmqG7w109RLdfY=;
 b=H/bc4sgyVHG5NXNj0pv6/f1A3OPJmAsV7Rf8T0fkdvCMPLiDoT9dYLmxuj7lHmWXg3
 JWDySlycrm6k5W0vZNvFWMLClo88jI5khA4au2DfcuX9Lw45iOgH1xGHlxVVk04xsAq/
 iGnaXev2kHwirhnQmEDu4uCfFksszUJyA9eX8D/5GDOrQ3W4rBzLGYHDeLeSzAlP0qbW
 6U8nC78TqPz901UhnEkDFNFE7OGhlOJm/6JKtG+Ega7p6qpAE5Z9VQ3iiIQJDru//f/J
 HXYS/8w+HNuQa3Eps3eNAmTTvYZQRg4kO3AfvWiSUNulcqvvyqyeD1o8FAe+Th3WYdIq
 Uyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=otYYfVkbUpO3XH8YY3WoZCCDHE4RvsmqG7w109RLdfY=;
 b=hK1XYQf/F524fob0bkQY1/ogTPvEUm0tD6w/Th3f5iQdgBbLtFdfCbDbvtnU7lZa9Y
 3tqzOnz2EuI6w4+cxqrSKfgB9XANInAxm+l5pje7n7OevB6Mjw8Zl7Y/nOEuC6Tj0UA9
 +dOXGtv6bLKicxm8SNE5tsh2WDLYLto/OcIt+lvistBu5P0+DHBnGz1IAws047jNfN41
 25lXr5siMzBc1jXcTmDYi2YRR++U0KFzkvnKeCjcgcwqBgmiCFbkrp9mqejOkj/mbljR
 HrMghJn8EjfW4J8SjYKe6qeo6+2ZtcICSxJMzhevRctg10gqsumZjkulNMpsgk1+XqcV
 wkIg==
X-Gm-Message-State: APjAAAWbMLJvW+XSigU2i/MMLP8Du8r9Ove4LJFtVUElPZY23DBZO6tg
 vBA4MLQs/PjSLlQwiRodI/M=
X-Google-Smtp-Source: APXvYqwNwviJ0m2Av6lYakFLspbz8PBbhNEZRK02uDGovArLfl4gIqiltTGKOgYm9FPj9FK4Um/HqQ==
X-Received: by 2002:a2e:8801:: with SMTP id x1mr65362979ljh.1.1564641948189;
 Wed, 31 Jul 2019 23:45:48 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 q22sm14630792lje.75.2019.07.31.23.45.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 23:45:47 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-2-git-send-email-andrii.anisov@gmail.com>
 <ad2a343e-1a65-6569-17a2-e5b676908e49@arm.com>
 <de4feda4-d8b6-4922-26f5-ea3d3f940563@gmail.com>
 <2da153e4-2e11-18af-5a0d-cdc12beaf858@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <be1d31db-60d6-6e05-e50d-d5bc6963d9e7@gmail.com>
Date: Thu, 1 Aug 2019 09:45:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2da153e4-2e11-18af-5a0d-cdc12beaf858@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 1/6] xen/arm: Re-enable interrupt later in the
 trap path
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVsaWVuLAoKT24gMzAuMDcuMTkgMjM6MTAsIEp1bGllbiBHcmFsbCB3cm90ZToKCj4+
IEluIHRoaXMgc2VyaWVzIEkgdGhpbmsgSSBuZWVkIGludGVycnVwdHMgbG9ja2VkIHVudGlsIEkg
c3RhcnQgdGltZSBhY2NvdW50aW5nIGZvciBoeXBlcnZpc29yLiBUaW1lIGFjY291bnRpbmcgaXMg
c3RhcnRlZCBieSBgdGFjY19oZWFkKClgIGZ1bmN0aW9uLiBJIHByZWZlciB0byBoYXZlIGl0IGNh
bGxlZCBmcm9tIEMsIGJlY2F1c2UgaXQgaXMgbW9yZSBjb252ZW5pZW50IGFuZCBvYnZpb3VzIGZv
ciB0aG9zZSB3aG8gYXJlIGxlc3MgZmFtaWxpYXIgd2l0aCB0aGUgQVJNIGNvZGUuCgpIZXJlIGlz
IHRoZSBxdWVzdGlvbiB0byB5b3U6IHdoYXQgaXMgdGhlIGJlc3QgcGxhY2UgKGFuZCB3YXkpIHRv
IHN0YXJ0IGh5cGVydmlzb3IgdGltZSB0cmFja2luZz8KCj4+Cj4+PiBSZXNlbmRpbmcgdGhlIHBh
dGNoIHdpdGhvdXQgdGhpbmdzIGFkZHJlc3NlZCBpcyBvbmx5IGdvaW5nIHRvIG1ha2UgaXQgd29y
c3QuCj4+Cj4+IEknbSBzdGlsbCBjb252aW5jZWQgdGhlIHBhdGNoIHdvdWxkIGltcHJvdmUgaW50
ZXJydXB0IGxhdGVuY3kgZm9yIGhpZ2ggaW50ZXJydXB0IHJhdGUgdXNlIGNhc2VzLgo+PiBCdXQg
SSB1bmRlcnN0YW5kIHRoYXQgSSBoYXZlIG5vIGV4cGVyaW1lbnQgdG8gcHJvdmUgdGhlIGVmZmVj
dCwgc28gSSdtIG5vdCB3aWxsaW5nIHRvIHB1c2ggdGhyb3VnaCB0aGUgcGF0Y2guCj4gCj4gVGhl
IG9ubHkgdGhpbmcgSSBhc2sgaXMganVzdGlmaWNhdGlvbiBpbiB5b3VyIGNvbW1pdCBtZXNzYWdl
IHJhdGhlciB0aGFuIHRocm93aW5nIHRoaW5ncyBhbmQgZXhwZWN0aW5nIHRoZSByZXZpZXdlciB0
byB1bmRlcnN0YW5kIHdoeSB5b3UgZG8gdGhhdC4gSSB3b3VsZCByZWNvbW1lbmQgdG8gcmVmcmVz
aCB5b3Vyc2VsZiBob3cgdG8gc3VibWl0IGEgcGF0Y2ggc2VyaWVzIFsxXS4KCkknbGwgZm9sbG93
IHlvdSByZWNvbW1lbmRhdGlvbi4KCj4+IEFsc28sIEkgaGF2ZSBhIHF1ZXN0aW9uIHRvIHlvdSBh
Ym91dCBhbm90aGVyIGFzcGVjdCBvZiB0aGlzIHBhdGNoLiBJbiB0aGUgZnVuY3Rpb24gYGVudGVy
X2h5cGVydmlzb3JfaGVhZCgpYCB0aGVyZSBpcyBhIGNoZWNrIGZvciBhIGRpc2FibGVkIHdvcmth
cm91bmQgYW5kIHR1cm5pbmcgaXQgb24uIElmIHdlIGhhdmUgdGhlIGludGVycnVwdHMgZW5hYmxl
ZCB1bnRpbCB0aGVyZSwgd2UgaGF2ZSBnb29kIGNoYW5jZXMgdG8gZ28gdGhyb3VnaCB0aGUgaW50
ZXJydXB0IHByb2Nlc3NpbmcgYGRvX0lSUSgpYCBiZWZvcmUgV0EgZW5hYmxlZC4gSXMgaXQgc3Rp
bGwgT0s/Cj4gCj4gSG1tbSwgdGhhdCdzIGNvcnJlY3QuCgpTb3JyeSBJIGRpZCBub3QgZ2V0IHlv
dXIgcG9pbnQuIFdoYXQgZXhhY3RseSBpcyBjb3JyZWN0PyBNeSBvYnNlcnZhdGlvbiBvZiB0aGUg
c2NlbmFyaW8gd2hlcmUgd2UgY2FuIGdvIHRocm91Z2ggdGhlIGJpZyBwaWVjZSBvZiB0aGUgaHlw
ZXJ2aXNvciB3aXRob3V0IFdBIGVuYWJsZWQ/IE9yIHByb2Nlc3NpbmcgSVJRcyB3aXRob3V0IFdB
IGVuYWJsZWQgaXMgdGhlIGNvcnJlY3Qgd2F5IHRvIGRvPwoKLS0gClNpbmNlcmVseSwKQW5kcmlp
IEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
