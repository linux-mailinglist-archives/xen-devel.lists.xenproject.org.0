Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C31A792287
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 14:22:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595664.929283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdV4Q-00038h-V9; Tue, 05 Sep 2023 12:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595664.929283; Tue, 05 Sep 2023 12:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdV4Q-00035J-Rd; Tue, 05 Sep 2023 12:22:14 +0000
Received: by outflank-mailman (input) for mailman id 595664;
 Tue, 05 Sep 2023 12:22:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddRg=EV=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qdV4P-0002LV-1b
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 12:22:13 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6d9c0e9-4be6-11ee-9b0d-b553b5be7939;
 Tue, 05 Sep 2023 14:22:11 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b703a0453fso37143391fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Sep 2023 05:22:11 -0700 (PDT)
Received: from [192.168.1.34] ([37.69.27.38]) by smtp.gmail.com with ESMTPSA id
 p1-20020a05600c204100b003fedcd02e2asm16736177wmg.35.2023.09.05.05.22.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Sep 2023 05:22:08 -0700 (PDT)
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
X-Inumbo-ID: d6d9c0e9-4be6-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693916529; x=1694521329; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mr+5ZH3u0P7meL1erw8CVa+r7WQNyOC0HPVh5GzsMyI=;
        b=ItLRG3QIQiU4PGGgQwRFSIUv3X3LnFsvujA5hzIIVqQ6As/7SgcqpETFAMvl8QkTQU
         4YxznEtlzagcY0GVxJzzU4ROp8OwRXe7rQffaDkexBRXzMqNReRYitfNOBYTm5FXh+Fr
         ZfEp6R8atll0hWDU9KndDxWHzpWXgh2ArGvFWlAPStbgeIFmjGV/aUvIhUm2N0EAqgko
         T1XXYN4kn5EqqLNNmfeEvPsfvuy4/Nq+wdYRGr70A9A09ZfQ3UjYN0G/SRu8q9RrEfzl
         HXg1Lp4XuAbAy3czR1lcPFa4CUqX4K01ZQRygfFKH9JdcdUDKdQZD28uqZMaxYE8jwm1
         ct/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693916529; x=1694521329;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mr+5ZH3u0P7meL1erw8CVa+r7WQNyOC0HPVh5GzsMyI=;
        b=S579oZ0R+lhvQ/58FrIhgNFjmGSDv9ov7d+khJUP7dOykrmZJGQ68m+2S4YOuTgUjv
         VYsS3tI63A9QAumJQw9E79bbQRdLfKhc0e82PzmZjp10QeNhATbWGSG0Rlf7tWfS5rd9
         XA1G2APcWN4zm4N0GLH+TgW2hhaH9PMN/9F9mS6SzbBui/782PpqM0cvcUMY4qPxaUOS
         OIdvmfg4k0sIcPCaqlq/5zMYgPohfIf3iGVOEF9FPwU+YWYHMXhwqWrp3yKlhExdCmqG
         POb8YN0p3IcVrov5WyVPhvjdWh2WnXm6lh3I8PYbKqJ3CvU9YT5CSHBd7qqTohMv0U1X
         q0yg==
X-Gm-Message-State: AOJu0YwLEhhO958nLA5Iv9ij4ze6j3qKrLa3dbsnVDBsL6ipt+3IHhaG
	7+1QDY1vfQJ2neVewrY6GsAFpQ==
X-Google-Smtp-Source: AGHT+IE7HDyJrQysj8lLFxucXBzfwzRVMvTQ/15XtAR24Yz+30WKWUxDpf4WkHmXZ2rT25oZ7Mr2+g==
X-Received: by 2002:a2e:9c90:0:b0:2bd:16ed:517f with SMTP id x16-20020a2e9c90000000b002bd16ed517fmr9368897lji.4.1693916529093;
        Tue, 05 Sep 2023 05:22:09 -0700 (PDT)
Message-ID: <3621d12e-67ab-4286-b319-fac2cc77a763@linaro.org>
Date: Tue, 5 Sep 2023 14:22:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v4 0/3] sysemu/accel: Simplify sysemu/xen.h
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, Anthony Perard
 <anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>
References: <20230905122100.5787-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230905122100.5787-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/9/23 14:20, Philippe Mathieu-Daudé wrote:
> Trivial cleanups which simplify "sysemu/xen.h".
> 
> Philippe Mathieu-Daudé (3):
>    sysemu/xen: Remove unuseful CONFIG_USER_ONLY header guard
>    sysemu/xen: Remove unreachable xen_ram_alloc() code
>    sysemu/xen: Allow elision of xen_hvm_modified_memory()
> 
>   include/exec/ram_addr.h |  8 ++++++--
>   include/sysemu/xen.h    | 24 +++---------------------
>   2 files changed, 9 insertions(+), 23 deletions(-)

Oops, this isn't v4. v1 coming...


