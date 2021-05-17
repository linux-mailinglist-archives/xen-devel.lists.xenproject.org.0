Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F30386DDD
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 01:43:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128532.241291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1limtG-0007wG-Ky; Mon, 17 May 2021 23:43:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128532.241291; Mon, 17 May 2021 23:43:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1limtG-0007t5-Hj; Mon, 17 May 2021 23:43:14 +0000
Received: by outflank-mailman (input) for mailman id 128532;
 Mon, 17 May 2021 23:43:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X6rY=KM=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1limtF-0007sz-1z
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 23:43:13 +0000
Received: from mail-ot1-x331.google.com (unknown [2607:f8b0:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac17041e-42ae-4a64-a6b3-5bc24904251d;
 Mon, 17 May 2021 23:43:12 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 n32-20020a9d1ea30000b02902a53d6ad4bdso7102957otn.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 May 2021 16:43:12 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id 9sm3045457oie.51.2021.05.17.16.43.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 16:43:11 -0700 (PDT)
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
X-Inumbo-ID: ac17041e-42ae-4a64-a6b3-5bc24904251d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=MyBYGXe0dG09ETtSlfZDNaPmp0kxxQmpe+PbWLlzy4c=;
        b=mgLv5OfD2ycIN0KxRISg4k0gn5vjkyhkWmFeh/j7OJeMZ9usQe/l6+95iajvHV9Pz9
         YIB/ScvDeIS81UZRt5yTYPIYN2yG04qRIZAVZ1ym7xVjZLBGxyk9jOAOPlzN0L86qFok
         KEUYFQZnYjZ/35LzGpJ3I1iqI+cqX7LLPqGlG7hZMCmXTWxEwZTyoT2wtb+KtQeztzRG
         1X48GuK0RRXyWqumE2mUnxRd1z5cWYAJ4NCVHYkT2sRhpnRst0XDwJkQTlHpoPWB5XXQ
         zF8BUB9uOvKOzd4a43vQHF8kSOsPVN7fmIBUrMl6UDOtUlnDqqZC+kBvZ2Ry62C69sgZ
         ZXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=MyBYGXe0dG09ETtSlfZDNaPmp0kxxQmpe+PbWLlzy4c=;
        b=JcppIzHKRtZzo/7p97eTILCgtb+6Lg6Ne0TSCIowvbhNDaRWooN8R9rDi7pisSjU29
         a0Y9TLetOU/hdcX/+A1LOM/4L8ZH1/UBKpchn9Q7o40ICHRTG2EzXcb1WcPpKFZ8gD6X
         URUenGrIP2mfYAUn6AtDfqCBJMSLU3TZGrmMKwEEZAAqsFEksGOKpTtSCC8B/681+NNJ
         2Lx9Ip2ohCLDM2ndKVO+0cm97kGXhJQKn9N5yEQdRBAKxLFTWATn122PgwhVa/3/JRYf
         +JTE5Dwrr2t4KKMek4aRSnmqyfa45DGV0zPkw63VPmPLewQ8w9ox4Z9MbMp9lhOVFyHK
         fQPA==
X-Gm-Message-State: AOAM530gvi7EEs6FbVnEeTMpX1SprznQk1OH3cyNL4c0Pp7JK6RYIer/
	m3P8V8YyuiaLJqfwPgqdJ24nGSCbzoOA8A==
X-Google-Smtp-Source: ABdhPJzdUt0Fo0OgFQ6Iu/Lf7MWF3l4+O2bTmQvkryQ3aEUA80Uk5NsYhsRGQL/rANUfdqrARjezPg==
X-Received: by 2002:a05:6830:410d:: with SMTP id w13mr1734902ott.173.1621294991812;
        Mon, 17 May 2021 16:43:11 -0700 (PDT)
Subject: Re: [PATCH v3 1/5] xen/char: Default HAS_NS16550 to y only for X86
 and ARM
To: Jan Beulich <jbeulich@suse.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1621017334.git.connojdavis@gmail.com>
 <3960a676376e0163d97ac02f968966cdfaccbf75.1621017334.git.connojdavis@gmail.com>
 <76b5e429-a0b0-b8a2-cd31-85cbb4da8680@suse.com>
From: Connor Davis <connojdavis@gmail.com>
Message-ID: <86738c5c-28b2-b82f-0ff4-ac84cb03a64b@gmail.com>
Date: Mon, 17 May 2021 17:43:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <76b5e429-a0b0-b8a2-cd31-85cbb4da8680@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/17/21 5:56 AM, Jan Beulich wrote:
>> --- a/xen/drivers/char/Kconfig
>> +++ b/xen/drivers/char/Kconfig
>> @@ -1,6 +1,6 @@
>>   config HAS_NS16550
>>   	bool "NS16550 UART driver" if ARM
>> -	default y
>> +	default y if (ARM || X86)
> ... this approach doesn't scale very well. You would likely have
> been hesitant to add a, say, 12-way || here if we had this many
> architectures already. I think you instead want
>
>   config HAS_NS16550
>   	bool "NS16550 UART driver" if ARM
> +	default n if RISCV
>   	default y
>
> which then can be adjusted back by another one line change once
> the driver code actually builds.
>
> Jan

Agreed, I will update this in the next version.


Thanks,

Connor


