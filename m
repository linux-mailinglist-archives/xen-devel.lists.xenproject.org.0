Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2616892BE16
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 17:20:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756342.1164922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRCcS-0003uW-0t; Tue, 09 Jul 2024 15:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756342.1164922; Tue, 09 Jul 2024 15:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRCcR-0003sH-UU; Tue, 09 Jul 2024 15:19:03 +0000
Received: by outflank-mailman (input) for mailman id 756342;
 Tue, 09 Jul 2024 15:19:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cUMd=OJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sRCcQ-0003sB-MV
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 15:19:02 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 917e22b0-3e06-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 17:19:00 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a77abe5c709so650273266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 08:19:00 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a86f62bsm85205566b.199.2024.07.09.08.18.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 08:18:57 -0700 (PDT)
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
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 917e22b0-3e06-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720538340; x=1721143140; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s5Mk7IGcFNKWg7WV1x2+iacTKlJrxVFxONSphyOKE14=;
        b=bVO2aNbw0yKd62OrDctbum7GQz/PU/14SuW+pWZHbWYnrXStuljAvWok0+85exSPwL
         Zq06dWwFhStmXBzLjMwwgkCxH41G2zr04Esj8RtFFIVxhW2MU3ZBMZmQkCYANvmTGEfL
         75oytpUJXpfRFpMKYzKUWEloYud3yH+cMdTQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720538340; x=1721143140;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5Mk7IGcFNKWg7WV1x2+iacTKlJrxVFxONSphyOKE14=;
        b=WwLu5h6rKUh6HuF+D4DpOB7PEKbHRXuL7lJ53Nbp4li0JeMqN0nJia5Rc1Lb7PjgV3
         0p/ULQ96Q0FDA5kzmt/1/WMO6qzT31jXxdXzkrjU0I0VAXggCCOtq4B1Iybhm21LsImf
         Qc64OjKZCbI4YUhq51Y/QRDNMHq9aUuDWxMURtvyEzHvBgY58fzo1pMqGCSan4+VF27N
         CZJMziAZ8eVPKxu8i28OCBUBavGXRx+hEffK3FmPvoGUf37mmR6C18tB8nOOfWo4IStG
         /W5py4KeJ4yXVcN0bn4tXP6jyClOUphF4klCASrYxyeJOndMVFAS/pgOVODIHgBIgSko
         qUCg==
X-Forwarded-Encrypted: i=1; AJvYcCXsP6vpttldOVYS7MccRet3rq3HE9gTg6kyRLDXpWU0cFPVZV8K2lVsr02B5gsASpl65zkCXwPsX+eT3Tp9A2Ji2Aa3l9g1YxKeNnfQLok=
X-Gm-Message-State: AOJu0YxH4jPK5jrlX3Lxb2uJ8r1RliKXMXJto5rjbqgQiLg6q3152UAU
	1LAe4ZXJq6c3pvWYX19J2Go3hWJZiDyxw72q8+zcmWNlFrjtwsOHGWqyPFMn3gU=
X-Google-Smtp-Source: AGHT+IE4lE8WdhnPQwHXfTKCn1P/gp09PrNcjf0NNTbq+7mcLZEJgijQFMlR2I9wSDFRbXCGbVZDyA==
X-Received: by 2002:a17:907:774d:b0:a6f:af58:efac with SMTP id a640c23a62f3a-a780b6b1aeamr162575266b.25.1720538339840;
        Tue, 09 Jul 2024 08:18:59 -0700 (PDT)
Message-ID: <627b5c3f-be81-42c5-aa99-fa9ff463f072@citrix.com>
Date: Tue, 9 Jul 2024 16:18:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Build system mess in stubdom
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Juergen Gross <jgross@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony@xenproject.org>, Charles Arnold <CARNOLD@suse.com>
References: <44679adf-e657-4d38-b1e3-2bebb34f57a0@citrix.com>
 <ad9b8dab-3f1c-4f26-845b-af88f96ee1ee@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ad9b8dab-3f1c-4f26-845b-af88f96ee1ee@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/07/2024 3:55 pm, Jan Beulich wrote:
> On 09.07.2024 15:49, Andrew Cooper wrote:
>> I'm trying to investigate why stubdom/ is fatally failing now with a
>> rebuilt ArchLinux container (GCC 14).
>>
>> It is ultimately:
>>
>>> ../../../../../newlib-1.16.0/newlib/libc/reent/signalr.c:61:14: error:
>>> implicit declaration of function ‘kill’; did you mean ‘_kill’?
>>> [-Wimplicit-function-declaration]
>>>    61 |   if ((ret = _kill (pid, sig)) == -1 && errno != 0)
>>>       |              ^~~~~
>>> make[7]: *** [Makefile:483: lib_a-signalr.o] Error 1
>> which doesn't make sense, but is a consequence of the ifdefary in
>> newlib/libc/include/_syslist.h
> Charles, who is looking after our Xen packages, had run into exactly this.
> His workaround patch (added to the list of patches applied on top of
> newlib by stubdom/Makefile) is below, but in the given form I didn't expect
> it would be upstreamable. The diagnostics by the compiler may be a little
> misleading ...
>
> Jan

Looking through newlib's upstream, I'm going to experiment with updating
to 4.4.0 (Dec 2023).

It's the most recent version, and it's marginally ahead of a very large
number of "make build work with GCC 14" commits.

I feel this is going to be less effort than continuing to duct tape an
obsolete version for newer compilers.

~Andrew

