Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA7317DAA
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 18:04:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOP0o-0007HU-HJ; Wed, 08 May 2019 16:01:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O+xT=TI=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hOP0m-0007HP-Ae
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 16:01:40 +0000
X-Inumbo-ID: 8f32fc70-71aa-11e9-843c-bc764e045a96
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8f32fc70-71aa-11e9-843c-bc764e045a96;
 Wed, 08 May 2019 16:01:38 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id f1so2153876lfl.6
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2019 09:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JkcXrB2giEU5g5bp5MqkGoHIhKUHzLbauDagA5cDBd4=;
 b=U6/pgGyccQYaLXihKc0XFdax7SwWyyN4lkUIh8qbR3BI2bFcFCSQmgnNr9ll8lgjzn
 qQ9EG1HEi7+MEzi3nCWf2LfOVOm/aBhEvd3pt45bIHEYjrSQ4ZB5XDF5QH/u9o0Ako+V
 AVqm9LM1x28moEmljq9NLQa8dqoOwQRuoVNo6yQr9KZt4U0yMOJ4KdHkRcM67ia0tUoo
 KvtJGvX+hnNC8yDTpfZnZ4pbuusHDdMxwthyrXvKqknOP2NMZJBNdbuMFxDuWtJ0M6LF
 R4VwJq0meP/cU5vTwot2hTnAGEugXBi0d4RythEux7seKSAJpeP11H3tvMPCkUKOCBpE
 E8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JkcXrB2giEU5g5bp5MqkGoHIhKUHzLbauDagA5cDBd4=;
 b=o046NamQFzoc+e5Ho7i48U6D5ak2TbBgEA1LrcUzKQuVrObwX1hwsrMW/jvVFdfLit
 Vo5oMonwUfDGSXzYb4W6xuQ6dv/bho+h6AJJ2sH4VmAvGWyFG1Vn+QiyGsfB/YFQk9U8
 WDskcrddBRhF5jKy5KKFwdLWlEpK48M2G3XkLzXhkcsQS4cmXVd1Ef7HON5Sw9Vh8sha
 Tkib/Jt1Fj/sXeZZK86wKGm2hFYKbiaesr0QK8Qw7aV/jrh1YI5EmLOmmMN7EZ0QZNcI
 Fk83ajWos+pCnue4urlDwL+g87mgyGgHp1ZEvECaDnRUNMoItsthTjhIYKuWqyOwmGlk
 W73Q==
X-Gm-Message-State: APjAAAV77uzgJeLuY4QGuCd7DKqfQ0P511Xh5R5uaCy0AkUrPToigieS
 zYVON8kayTgm5RirRRWgyRY=
X-Google-Smtp-Source: APXvYqxrWefciysnIrawDLMgR9PWvpYG1Dyf8rYEL8FhqULxEZ7kD9EkLBt1QgS+ocIVldQCxIOGUQ==
X-Received: by 2002:ac2:44ac:: with SMTP id c12mr103832lfm.155.1557331296620; 
 Wed, 08 May 2019 09:01:36 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 d80sm5120766lfd.90.2019.05.08.09.01.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 May 2019 09:01:35 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <fa126315-31af-854e-817a-8640b431c82b@arm.com>
 <CAC1WxdiMzAq5hRC-mhRQuFDs7z_Hj5w7VAy52ec87SJQOGmp3w@mail.gmail.com>
 <a28f95a1-d9da-2caf-f4b4-013100176b02@arm.com>
 <090ce8cc-f329-fe54-4894-b7f12e3cd5a6@gmail.com>
 <3d5ccdcb-d777-e75b-f4bd-38d2d470a754@arm.com>
 <0bd113db-7851-df02-90d1-2a79bd4bedaf@gmail.com>
 <98200ea9-c21e-9d58-498d-468764209972@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <b7cb8324-45ae-8840-b73e-c7dd508e954e@gmail.com>
Date: Wed, 8 May 2019 19:01:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <98200ea9-c21e-9d58-498d-468764209972@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/2] Introduce runstate area registration
 with phys address
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVsaWVuLAoKCk9uIDA4LjA1LjE5IDE3OjMxLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4g
SSBoYXZlbid0IHNlZW4gdGhlbSB3aXRoIG5va3B0aSBwbGF0Zm9ybSBzbyBmYXIuIEkgYW0gY3Vy
aW91cyB0byBrbm93IHdoYXQgaXMgeW91ciBjb25maWd1cmF0aW9uIGhlcmUuCgpYRU4gNC4xMiB3
aXRoIG91ciBwYXRjaGVzLiBUaGluIERvbTAgaXMgYSBnZW5lcmljIGFybXY4IExpbnV4LCBMSyA0
LjE0Ljc1IHdpdGggcGF0Y2hlcyBmcm9tIFJlbmVzYXMgYW5kIHVzLgpEb21EIGlzIExLIDQuMTQu
NzUgd2l0aCBIVyBhc3NpZ25lZCBhbmQgZHJpdmVycy4gTEsgY29uZmlncyB5b3UgY2FuIGZpbmQg
b24gbXkgZ29vZ2xlIGRyaXZlIFsxXS4KClRob3NlIGZhdWx0cyBmaXJlIG9ubHkgZm9yIERvbUQg
KG9uIGl0cyBzdGFydCkuCgo+IHZjcHVfc2hvd19leGVjdXRpb25fc3RhdGUoY3VycmVudCkgc2hv
dWxkIGRvIHRoZSBqb2IgaGVyZS4KCkhlcmUgaXQgaXM6CgooWEVOKSBkMXYyIHBhciAweDgwOQoo
WEVOKSBkMXYyOiBGYWlsZWQgdG8gd2FsayBwYWdlLXRhYmxlIHZhIDB4ZmZmZjgwMDAyZmY2NjM1
NwooWEVOKSAqKiogRHVtcGluZyBEb20xIHZjcHUjMiBzdGF0ZTogKioqCihYRU4pIC0tLS1bIFhl
bi00LjEyLjAgIGFybTY0ICBkZWJ1Zz1uICAgTm90IHRhaW50ZWQgXS0tLS0KKFhFTikgQ1BVOiAg
ICAyCihYRU4pIFBDOiAgICAgMDAwMGZmZmZiZDI4ZGM4OAooWEVOKSBMUjogICAgIDAwMDBmZmZm
YmQyOGU2NzQKKFhFTikgU1BfRUwwOiAwMDAwZmZmZmU5ODkwNDEwCihYRU4pIFNQX0VMMTogZmZm
ZjAwMDAwODAzYzAwMAooWEVOKSBDUFNSOiAgIDQwMDAwMDAwIE1PREU6NjQtYml0IEVMMHQgKEd1
ZXN0IFVzZXIpCihYRU4pICAgICAgWDA6IDAwMDAwMDAwMDAwMDAwMDAgIFgxOiAwMDAwZmZmZmU5
ODkwN2JjICBYMjogMDAwMGZmZmZlOTg5MDQzMAooWEVOKSAgICAgIFgzOiAwMDAwMDAwMDAwMDAw
MDAwICBYNDogMDAwMDAwMDAwMDAwMDAwMCAgWDU6IDAwMDAwMDAwMDAwMDAwMDAKKFhFTikgICAg
ICBYNjogMDAwMDAwMDAwMDAwMDAwMSAgWDc6IDAwMDBmZmZmZTk4OTA3YjggIFg4OiAwMTAxMDEw
MTAxMDEwMTAxCihYRU4pICAgICAgWDk6IDAwMDAwMDAwMDAwMDAwMDAgWDEwOiAwMDAwZmZmZmU5
ODkwNTcwIFgxMTogMDAwMDAwMDAwMDAwMDAyMAooWEVOKSAgICAgWDEyOiAwMDAwMDAwMDAwMDAw
MDAwIFgxMzogMDAwMDAwMDAwMDAwMDAwMCBYMTQ6IDAwMDAwMDAwMDAwMDAwMTUKKFhFTikgICAg
IFgxNTogMDAwMDAwMDAwMDAwMDAwYSBYMTY6IDAwMDBmZmZmYmQ2NTAyYzggWDE3OiAwMDAwZmZm
ZmJkMjhlNjYwCihYRU4pICAgICBYMTg6IDAwMDBmZmZmZTk4OTAyY2YgWDE5OiAwMDAwZmZmZmU5
ODkwN2I4IFgyMDogMDAwMGZmZmZlOTg5MDdiOAooWEVOKSAgICAgWDIxOiAwMDAwZmZmZmJkNjUz
MDAwIFgyMjogMDAwMGZmZmZlOTg5MDZmOCBYMjM6IDAwMDAwMDAwMDAwMDAwMWUKKFhFTikgICAg
IFgyNDogMDAwMGZmZmZlOTg5MDZhOCBYMjU6IDAwMDBmZmZmYmQ1ODQwMDAgWDI2OiAwMDAwYWFh
YWM4NzM2ZjY4CihYRU4pICAgICBYMjc6IDAwMDBmZmZmYmQ1ODQ5NzggWDI4OiAwMDAwMDAwMDAw
MDAwMDAyICBGUDogMDAwMGZmZmZlOTg5MDQxMAooWEVOKQooWEVOKSAgICBFTFJfRUwxOiAwMDAw
ZmZmZmJkMmI0Njk4CihYRU4pICAgIEVTUl9FTDE6IDU2MDAwMDAwCihYRU4pICAgIEZBUl9FTDE6
IDAwMDBmZmZmYmQ1MjUwMTQKKFhFTikKKFhFTikgIFNDVExSX0VMMTogMzRkNWQ5MWQKKFhFTikg
ICAgVENSX0VMMTogMzRiNTUwMzUxMAooWEVOKSAgVFRCUjBfRUwxOiAwMDAwMDAwMDZjMDU2MDAw
CihYRU4pICBUVEJSMV9FTDE6IDAwMDMwMDAwNDEyZDgwMDAKKFhFTikKKFhFTikgICBWVENSX0VM
MjogODAwMjM1NTgKKFhFTikgIFZUVEJSX0VMMjogMDAwMjAwMDczZmVkNjAwMAooWEVOKQooWEVO
KSAgU0NUTFJfRUwyOiAzMGNkMTgzZAooWEVOKSAgICBIQ1JfRUwyOiAwMDAwMDAwMDgwNzg2NjNm
CihYRU4pICBUVEJSMF9FTDI6IDAwMDAwMDAwNzgxODQwMDAKKFhFTikKKFhFTikgICAgRVNSX0VM
MjogNWEwMDBlYTEKKFhFTikgIEhQRkFSX0VMMjogMDAwMDAwMDAwMDAzMDAxMAooWEVOKSAgICBG
QVJfRUwyOiBmZmZmMDAwMDA4MDA1ZjAwCihYRU4pCihYRU4pIE5vIHN0YWNrIHRyYWNlIGZvciBn
dWVzdCB1c2VyLW1vZGUKCkJUVywgd2UgaGF2ZSBhbm90aGVyIHB1YmxpYyBob2xpZGF5IHRvbW9y
cm93LCBzbyBJJ2xsIGdldCBiYWNrIHRvIHlvdSBvbiBGcmlkYXkuCgpbMV0gaHR0cHM6Ly9kcml2
ZS5nb29nbGUuY29tL2RyaXZlL2ZvbGRlcnMvMVNYMEZoQU9LcmtGZGJORUxGdUJVdDdmbUxaS2I4
WG1LP3VzcD1zaGFyaW5nCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
