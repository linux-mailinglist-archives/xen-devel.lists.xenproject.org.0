Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E721309E3F
	for <lists+xen-devel@lfdr.de>; Sun, 31 Jan 2021 19:55:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79395.144501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Hs4-0003ZF-IX; Sun, 31 Jan 2021 18:54:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79395.144501; Sun, 31 Jan 2021 18:54:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Hs4-0003Yq-Ee; Sun, 31 Jan 2021 18:54:52 +0000
Received: by outflank-mailman (input) for mailman id 79395;
 Sun, 31 Jan 2021 18:54:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jslU=HC=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1l6Hs2-0003Yl-Sr
 for xen-devel@lists.xenproject.org; Sun, 31 Jan 2021 18:54:50 +0000
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 918c4d15-c36d-4d18-841f-c2fdd8c55c98;
 Sun, 31 Jan 2021 18:54:49 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id c4so11558350wru.9
 for <xen-devel@lists.xenproject.org>; Sun, 31 Jan 2021 10:54:49 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id w129sm19274346wmb.11.2021.01.31.10.54.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 10:54:47 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
X-Inumbo-ID: 918c4d15-c36d-4d18-841f-c2fdd8c55c98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FR1Qgn3KJQlZYF2cn6BPEB2wNOofYOMOINr06XrBFiY=;
        b=GjTFCFkHrS2IgKKCd7vdSkEuYzQZIa01Miw6JpYkLB0r/vPHzlMFUexuGXOBLuz2sm
         zYBj0l5sLm0kMQdXDq4BiM7Pq83FnjG4YkktMvWblRWBjqu3d87CVD93RRHCZFJ0kB+4
         FDu5nv/PQbEAoEctMF7rlyPdZzeInG6bMk8QZgx0S2GMlGboWsTzkVVSOrZtpSnQU5/N
         9tCQfpZYAuRsKLYuuTadPa9Ax0KnlQQzUKpO8uPJ5Q7AlRsgLvZwjzV9z2XWOjF2BBgt
         5+vSeyUGv6NDj6h3ebTIGjpFN+ajHlFGdSNt1oGj7UOvLnACunHfD13HswWqvhs4dzkR
         zxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FR1Qgn3KJQlZYF2cn6BPEB2wNOofYOMOINr06XrBFiY=;
        b=eCVN9TEb8giwm4g7TcOltuBat41TqEF1H0HCDBHPy7mHaiAq4sPWViLW30rHqfI1kB
         2FKNkx5nISXcAbIlawHgVNKH5w9NBh9qcS52/P1atZITICck5DPzNVRzGtEEteJqO8Uc
         9Vi3+v3tKCwkg0SRQf/qhfLi7qLq+fb7M1aAjspuwUWjwDufczG8MnwBYbRmQihbfHIJ
         agRKAWk4tXVNIQ9Jv9lyC2WHAbwzXH3iq9ikgDMqZmPdueXLggz6f4a0y3H4WDcayEoM
         q4pUBaDZmf6KGUWn6eq70vtlU1G9u0TlMpdMkK8nC/sfBHlQVsXC0aCbWOQoHXECcvKr
         osGA==
X-Gm-Message-State: AOAM5325TXfyhx89qv0GGyDD7DN6fJysMylVyYXxF493uHm8ljamnnAI
	GJLkoFHtwxHZBSQ+IY5Xs9A=
X-Google-Smtp-Source: ABdhPJzUkcPB+r3xOLKZAYbK/j8OsewAgS73QOlIP8attOclSPS7y7JkgnNYKWVwwvcwMJbgH5iDRw==
X-Received: by 2002:adf:8145:: with SMTP id 63mr14199539wrm.8.1612119288945;
        Sun, 31 Jan 2021 10:54:48 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 1/4] meson: Do not build Xen x86_64-softmmu on Aarch64
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210131141810.293186-1-f4bug@amsat.org>
 <20210131141810.293186-2-f4bug@amsat.org>
 <6ea50cf0-344d-cf9b-0a20-0444b3764f2d@citrix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c7e1fc51-bc83-9a1d-408b-5e0731c29f5e@amsat.org>
Date: Sun, 31 Jan 2021 19:54:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <6ea50cf0-344d-cf9b-0a20-0444b3764f2d@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 1/31/21 3:45 PM, andrew.cooper3--- via wrote:
> On 31/01/2021 14:18, Philippe Mathieu-Daudé wrote:
>> The Xen on ARM documentation only mentions the i386-softmmu
>> target. As the x86_64-softmmu doesn't seem used, remove it
>> to avoid wasting cpu cycles building it.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> As far as I understand, it only gets used at all on ARM for the
> blkback=>qcow path, and has nothing to do with I440FX or other boards. 
> i.e. it is a paravirt disk and nothing else.

Yeah the PIIX3 part is messy, this is easier to select I440FX which
provides all the required dependencies. TBH I'd rather invest my
time in other tasks, and the Xen folks don't seem interested in getting
this improved. I only did that series to reply to Paolo and pass over
to Alex Bennée.

> xenpv should not be tied to i386-softmmu in the first place, and would
> remove a very-WTF-worthy current state of things.  That said, I have no
> idea how much effort that might be.

Here the problem isn't much Xen but the rest of x86 machines in QEMU.

Regards,

Phil.

