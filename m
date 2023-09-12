Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E4079D0F4
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 14:25:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600449.936075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg2S7-0007DO-04; Tue, 12 Sep 2023 12:25:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600449.936075; Tue, 12 Sep 2023 12:25:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg2S6-0007AU-TO; Tue, 12 Sep 2023 12:25:10 +0000
Received: by outflank-mailman (input) for mailman id 600449;
 Tue, 12 Sep 2023 12:25:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mt1s=E4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qg2S5-0007AO-46
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 12:25:09 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6872f6c6-5167-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 14:25:07 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3ff7d73a6feso58646915e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Sep 2023 05:25:07 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 o7-20020a05600c378700b003fe4548188bsm15958689wmr.48.2023.09.12.05.25.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 05:25:06 -0700 (PDT)
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
X-Inumbo-ID: 6872f6c6-5167-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694521507; x=1695126307; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xJNrf6Zxy/uko3JYPqMu/axYZtuBEtpz+ynXNMvatDc=;
        b=syrY/uHFzYhuHHlKKMMZWY+piYXpMqOB4RWPXvf9m97cr8cwjalRKEMLUj7IvVUDdm
         FnbLcyaFvE3pkSg7loTdJUNFsJ+B2UynZ8VNVCSHlxRLM4F4UiFgm9BCCNNSNPSKkIz1
         PFWsr81RP3xHVDQqpUSUtjXwnYYkzutpqIu0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694521507; x=1695126307;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJNrf6Zxy/uko3JYPqMu/axYZtuBEtpz+ynXNMvatDc=;
        b=nnS7T0GrryMTWWnXY9n/5nNrzVzphljtgWkWBkGCkwxeVhQbyPgdfCa1wzrRTE3u3i
         6ieTDle3DeIA9z9u3mOwtKwa+XyNd0ZYpWAElzlP3X4wvI1o97SyQ48zWNGqVbjO6O4u
         laRpdozsByOc3wlmvCMtO5mBzCoqRPPGpa2oPojqGISOijRgxklIA5clWinomE2Glvk+
         ljKe7nXeUN4H2k/vxdiVI9VK882PCKi4zLGtd0xnk3L0Ahj7CUk+bq0akBXcediUHhxQ
         rVoCA4NaQH4jtIHNpwKcjIo22oud+NmMKUUGGrVQ2dQkHI6d3cJF/3/ArflMuroOwf6B
         CF8g==
X-Gm-Message-State: AOJu0Yxq8UekweoV9angZdIbvP/YUUkt8zAnu3Y9IUKEBd/FTFwfjAt1
	eP9/gLgk3dPuWHsDrWSVQ3eGVA==
X-Google-Smtp-Source: AGHT+IFKfAJ1TxXIuNMILZs8KM7B/ex+DzqO+Mfengk6xC8R3x38C5sYNUkzSa5dnPzQETmvGHJb8Q==
X-Received: by 2002:a7b:c8c3:0:b0:401:b3a5:ebf8 with SMTP id f3-20020a7bc8c3000000b00401b3a5ebf8mr11200382wml.16.1694521506752;
        Tue, 12 Sep 2023 05:25:06 -0700 (PDT)
Message-ID: <3bf11a57-d3f0-7dcc-b31e-8ecb598346bc@citrix.com>
Date: Tue, 12 Sep 2023 13:25:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2 5/5] README: update to remove old note about the
 build system's python expectation
Content-Language: en-GB
To: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 George Dunlap <george.dunlap@cloud.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1694450145.git.javi.merino@cloud.com>
 <2b98d4409f0220c5b24517c5b230344228717eb8.1694450145.git.javi.merino@cloud.com>
In-Reply-To: <2b98d4409f0220c5b24517c5b230344228717eb8.1694450145.git.javi.merino@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/09/2023 5:51 pm, Javi Merino wrote:
> The configure script tests for the availability of python3, python and
> python2 in that order and sets PYTHON to the first one found in path.
> You don't need to have a symlink to python.

I think this was fixed by 5852ca48526316918cd82fba1033a6a5379fbc4c
"build: fix tools/configure in case only python3 exists"

> Signed-off-by: Javi Merino <javi.merino@cloud.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'm happy to fix the commit message on commit.

