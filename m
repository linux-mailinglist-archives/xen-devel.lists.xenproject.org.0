Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2D3273D5B
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 10:34:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKdkJ-0006JQ-79; Tue, 22 Sep 2020 08:33:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sTxr=C7=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kKdkH-0006JH-Lx
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 08:33:53 +0000
X-Inumbo-ID: 59dd0eb8-793c-4ea0-a77e-e1343b128238
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 59dd0eb8-793c-4ea0-a77e-e1343b128238;
 Tue, 22 Sep 2020 08:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600763632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qvyUjkv8t4H1ij6w8DYR8/i335Zbxq6HBGLdSo8YFhw=;
 b=gU+mKxjG9wVGzPG+30pB5c3gluqP3T/cRoNBU5lU4CWr08njdfFQacDILyOLXqpTdk5rRp
 lQ48ZoDm6Oi7vxjrRZcizA4WqHrPDd0aADRPkYTiEWNptyfYXbfPZ/+2YxyeaMzUVnAXj+
 lLIE1GPCEMNCIVSQOtBDeMjdCONQlLY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-30yeWSDQN-u1ziDFut7PrA-1; Tue, 22 Sep 2020 04:33:50 -0400
X-MC-Unique: 30yeWSDQN-u1ziDFut7PrA-1
Received: by mail-wr1-f71.google.com with SMTP id d13so686903wrr.23
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2020 01:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=qvyUjkv8t4H1ij6w8DYR8/i335Zbxq6HBGLdSo8YFhw=;
 b=UUeHKPRHpD2+8KmRZvsCPyzyRy34rMMId3ysOUsQEgpxm0ehLLak/ql55FlEljrgWq
 tdz9xDlK+KpejQdhUWUWn9K7yq7jhPkWO8n1ieCy2pOF7aR0RAm0OBNrJFRoYuAaYlO2
 j+gtL0xCTb38Se7EjwKfD/bWZGtU9wwQ8/cei22uGzA/rHcDQLe1Y4kjq121xTSQlnKO
 IugMgHOCTR0nn1YhlDVaT7K9S/9R9/DQwmTd7jOo5toCmLlkTa8YnezJ0puMwcT8fR3Z
 ITbEEQDNAMNhBdtOluGuc+MNdsE/47KJAK+dP93ps9yDbok2iXnjq3gIJgdA/GNt7Vof
 GnEA==
X-Gm-Message-State: AOAM531XIKWgT3O9PFXkfViKIWWkflQTRcenZLxtzatDQqmsLT0TI5qb
 f3c3NzlwKNDbP2hk1KxHj7B6BmSyYY3Y8uQLFRnZdU+6gSfSqdWDo9yBEgSfTJLEtfDILpaogET
 eBosrouPIy5iYWA86iXoibOxY7hU=
X-Received: by 2002:a1c:59c2:: with SMTP id n185mr3236267wmb.43.1600763629026; 
 Tue, 22 Sep 2020 01:33:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6dFnNm36FEIqnuuXGz9nWZ1QUfl3u3gn03+FQFA+/1aED+MOKkBn5JsSaaGBStLCkBvBNiw==
X-Received: by 2002:a1c:59c2:: with SMTP id n185mr3236220wmb.43.1600763628785; 
 Tue, 22 Sep 2020 01:33:48 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id l17sm3448412wme.11.2020.09.22.01.33.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 01:33:47 -0700 (PDT)
Subject: Re: [PATCH] qemu/atomic.h: prefix qemu_ to solve <stdatomic.h>
 collisions
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: fam@euphon.net, peter.maydell@linaro.org, sheepdog@lists.wpkg.org,
 kvm@vger.kernel.org, david@redhat.com, jasowang@redhat.com,
 yuval.shaia.ml@gmail.com, mdroth@linux.vnet.ibm.com, jcmvbkbc@gmail.com,
 Alistair.Francis@wdc.com, kraxel@redhat.com, chenhc@lemote.com,
 sstabellini@kernel.org, berto@igalia.com, sagark@eecs.berkeley.edu,
 ysato@users.sourceforge.jp, quintela@redhat.com, jslaby@suse.cz,
 mst@redhat.com, armbru@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, aleksandar.qemu.devel@gmail.com, thuth@redhat.com,
 marcandre.lureau@redhat.com, mjrosato@linux.ibm.com,
 aleksandar.rikalo@syrmia.com, ehabkost@redhat.com, sw@weilnetz.de,
 pl@kamp.de, dgilbert@redhat.com, paul@xen.org, anthony.perard@citrix.com,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, namei.unix@gmail.com,
 qemu-riscv@nongnu.org, sunilmut@microsoft.com, jsnow@redhat.com,
 zhang.zhanghailiang@huawei.com, rth@twiddle.net, kwolf@redhat.com,
 berrange@redhat.com, qemu-block@nongnu.org, kbastian@mail.uni-paderborn.de,
 cohuck@redhat.com, laurent@vivier.eu, mreitz@redhat.com, palmer@dabbelt.com,
 pbonzini@redhat.com, xen-devel@lists.xenproject.org, aurelien@aurel32.net
References: <20200921162346.188997-1-stefanha@redhat.com>
 <160072176188.21069.7427016597134663502@66eaa9a8a123>
 <20200922081705.GB201611@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <f70c3ae8-330f-af43-0005-86b4d3fabb2e@redhat.com>
Date: Tue, 22 Sep 2020 10:33:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200922081705.GB201611@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 9/22/20 10:17 AM, Stefan Hajnoczi wrote:
> On Mon, Sep 21, 2020 at 01:56:08PM -0700, no-reply@patchew.org wrote:
>> ERROR: Macros with multiple statements should be enclosed in a do - while loop
>> #2968: FILE: include/qemu/atomic.h:152:
>> +#define qemu_atomic_rcu_read__nocheck(ptr, valptr)      \
>>      __atomic_load(ptr, valptr, __ATOMIC_RELAXED);       \
>>      smp_read_barrier_depends();
>>
...
>> WARNING: Block comments use a leading /* on a separate line
>> #7456: FILE: util/rcu.c:154:
>> +        /* In either case, the qemu_atomic_mb_set below blocks stores that free
>>
>> total: 7 errors, 4 warnings, 6507 lines checked
> 
> These are pre-existing coding style issues. This is a big patch that
> tries to make as few actual changes as possible so I would rather not
> try to fix them.

What I do with automated patches triggering checkpatch errors:

- run automated conversion
- fix errors until checkpatch is happy
- run automated conversion inversed
- result is the checkpatch changes, commit them
- run automated conversion again, commit


