Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB161806D89
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 12:12:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649115.1013489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAppN-0004Br-Cf; Wed, 06 Dec 2023 11:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649115.1013489; Wed, 06 Dec 2023 11:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAppN-00049J-9f; Wed, 06 Dec 2023 11:12:29 +0000
Received: by outflank-mailman (input) for mailman id 649115;
 Wed, 06 Dec 2023 11:12:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rHB2=HR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rAppL-00048i-0i
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 11:12:27 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 554417ba-9428-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 12:12:24 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-332f90a375eso589703f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 03:12:24 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b5-20020adfe645000000b00333404e9935sm9938644wrn.54.2023.12.06.03.12.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 03:12:23 -0800 (PST)
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
X-Inumbo-ID: 554417ba-9428-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701861144; x=1702465944; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=woWun1nYZKtC0D0Mup/SX8NKJuEau8JFuQ5hWyX6e0A=;
        b=FUSjHRZzUSlU0dtmi3XsgXFfQeDVHVpAQoXEunAK3FtMaMoQ7iEbuzsSeubMkqXhwB
         eEhO8jqPDERU/WBYeCWx47pdCvfRRj4n5+OxbsTlBiZeyB6S72zdh4xPJBRwkp7qhe1q
         /RDhG6GejqJbLrYwzDy2DJOZSgPdmkt+TDois=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701861144; x=1702465944;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=woWun1nYZKtC0D0Mup/SX8NKJuEau8JFuQ5hWyX6e0A=;
        b=MlQUCyI/7nyDNieo57aVJSn5ksNmnGhrbKH+KLFzJ5CzaYnAIg30vE5qX4DSV1JWcp
         cmA/iueyhMS193tPwUgwo0kUfsJHPTofdbNOpa0OV1PzxKFcusekKYSZVRKQIZbFvw5P
         6Drk6e6fxSpTGI7tTdnbGygn4XKDV4VDgoVMsnMmEUx3tnIT1dTeZyrbK5Q9cv+0sEeA
         Nw1FeCkgQcTS71Qv+pXamtmNVtIxkDVJuQLsSvHKYB/fz8NEdqy01ZrpUulj3ofnzmuR
         Qd4c3cIIXH/E8nlGgTEdijpXgclJ7ynmy0XrGpc5njCZS/U817g19LMJ9ojUf2xON6aQ
         BUIg==
X-Gm-Message-State: AOJu0YxQXP8lNmIEsIv+NMGml93mcwOKo1JGHVC2jykMyKnI2tylmGkL
	/gGN6DsjYzcg1gcQc/53Oa6Sjw==
X-Google-Smtp-Source: AGHT+IFIRk1sEBKPHFDxfaxGWo4VNiVfJxspTaLgm+PG2aa0K7BEiTiFx0OKSOlHM4Gg9hO4FsNCBg==
X-Received: by 2002:adf:ce83:0:b0:333:e8d:99d8 with SMTP id r3-20020adfce83000000b003330e8d99d8mr446563wrn.36.1701861144115;
        Wed, 06 Dec 2023 03:12:24 -0800 (PST)
Message-ID: <4c702b55-08ad-46db-8b0e-8f2b63b64d2b@citrix.com>
Date: Wed, 6 Dec 2023 11:12:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Only compile the hypervisor with
 -Wdeclaration-after-statement
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>, George Dunlap
 <george.dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>,
 Juergen Gross <jgross@suse.com>, Alexander Kanavin <alex@linutronix.de>,
 xen-devel@lists.xenproject.org
References: <20231205183226.26636-1-julien@xen.org>
 <c7d844ea-139e-416f-bb8e-51e63c0fe3ed@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c7d844ea-139e-416f-bb8e-51e63c0fe3ed@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/12/2023 8:52 am, Jan Beulich wrote:
> On 05.12.2023 19:32, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Right now, all tools and hypervisor will be complied with the option
>> -Wdeclaration-after-statement. While most of the code in the hypervisor
>> is controlled by us, for tools we may import external libraries.
>>
>> The build will fail if one of them are using the construct we are
>> trying to prevent. This is the case when building against Python 3.12
>> and Yocto:
>>
>> | In file included from /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/Python.h:44,
>> |                  from xen/lowlevel/xc/xc.c:8:
>> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/object.h: In function 'Py_SIZE':
>> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/object.h:233:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
>> |   233 |     PyVarObject *var_ob = _PyVarObject_CAST(ob);
>> |       |     ^~~~~~~~~~~
>> | In file included from /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/Python.h:53:
>> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/cpython/longintrepr.h: In function '_PyLong_CompactValue':
>> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/cpython/longintrepr.h:121:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
>> |   121 |     Py_ssize_t sign = 1 - (op->long_value.lv_tag & _PyLong_SIGN_MASK);
>> |       |     ^~~~~~~~~~
>> | cc1: all warnings being treated as errors
>>
>> Looking at the tools directory, a fair few directory already add
>> -Wno-declaration-after-statement to inhibit the default behavior.
>>
>> We have always build the hypervisor with the flag, so for now remove
>> only the flag for anything but the hypervisor. We can decide at later
>> time whether we want to relax.
>>
>> Also remove the -Wno-declaration-after-statement in some subdirectory
>> as the flag is now unnecessary.
> With all these removals, don't you need to add the option centrally
> somewhere? Or else are you sure that no compiler version, including
> distro-customized ones, would ever come with the warning enabled by
> default?

declaration-after-statement being permitted is covered by the -std we
choose.

No distro is plausibly going to ship a compiler which takes -std=gnu99
and has declaration-after-statement forced off if in that configuration.

~Andrew

