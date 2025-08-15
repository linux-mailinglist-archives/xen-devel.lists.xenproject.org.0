Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BB1B28219
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 16:40:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083551.1443147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umvbe-000146-0D; Fri, 15 Aug 2025 14:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083551.1443147; Fri, 15 Aug 2025 14:40:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umvbd-00012K-Ti; Fri, 15 Aug 2025 14:40:33 +0000
Received: by outflank-mailman (input) for mailman id 1083551;
 Fri, 15 Aug 2025 14:40:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFbR=23=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umvbc-00012E-PH
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 14:40:32 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cad2201e-79e5-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 16:40:30 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45a1b0c8867so15569075e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 07:40:30 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1b26a3dcsm34707745e9.2.2025.08.15.07.40.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 07:40:29 -0700 (PDT)
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
X-Inumbo-ID: cad2201e-79e5-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755268830; x=1755873630; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UJa7e5ne+kx7WHlNm9CeGyUQLRt59v+cocjtp3Oyxcs=;
        b=nDHypn0PGi/BIU3GgcpSc/8zOBmhtJ7W5FS6MKuD+1+YCM0IzVII2sJzckjTpteeu8
         Ff8o209Ze0skraaF0X6mwJlXwip4FvhudVgi+DqBAFY6/LpX38qY9AxQl9mU2bjMPKEq
         1Q9U1/IX1zDMzw+Q6BYWTAWKObzgk7KMO10ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755268830; x=1755873630;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJa7e5ne+kx7WHlNm9CeGyUQLRt59v+cocjtp3Oyxcs=;
        b=v6SemP81zcrkw+EAham1lQogd9iip2MpypivFz1qyxLEwddKjl2rCCCk39sPDg9Ftl
         2t/8Ux4d1UB+Tr01RJzXB0Dr+gxakdd2QS2WSbeR3+vq1/dIxbVRNwSjYJqwLFFGZmk9
         SDhxQkA4JQGBEfd/VgAITVIvj4XKWnD2Jv4ldVXAnTcW6SB44G2iBHTK03fjHZabcPs2
         lgPKcIlxLhuAYD8gqnRYT/6lLoJEgpPCURhyMWiPMVQNJ+opJ9L/K8qNwi0f2E0DwAHH
         r4BQExY8kjbvhfGglcyGvFTiYR4lKa1Dgqp1mKpLzkpyHUT3SNi0C15qmkPdULGs+PXS
         XCbA==
X-Forwarded-Encrypted: i=1; AJvYcCW99mj4CAgPFjuEl1+fz085tkZxN8MLFMOurkvkhJIGnxLqA2p7ZIX1Fnz4jxo8na+HIn6b8JoYjIU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7qagaklPxSL0YK+G89xLxlbf+5i0r+3x/fLswMErIJ1ntHDJz
	1HI2e02MB3PmiY5k+UPbqK2PLb3mwVdqggTCinK9kpOYSDs8puX3sNIRVYlQpEIrVqM=
X-Gm-Gg: ASbGnctocSJcRZiVM62k1XI2Knb7DrrgSpU8MCirluwuG9cGd0RCP5Szrfy+S/QzCug
	DOjkxbHKjv76MmrS0Vrf5ORVWWpP/AK9H97sZgkDthLRrPq9geTWRRXwrwePmzMSPi8NvgsWj0l
	yKjRX5D8rZB91u0W9vVNpG8i8iYF3iFvCR5ColyKypPEDmK1ZfgfdDlvQcOLTLICK8NXfu5Hqua
	Q/FDYC95iIi49iG7pc7Jo5hS7GWMFzkzSCM0UgyZDU3/JVLIq+CDKIxs2KT8kebWzMW8xRVK+jS
	Ik0jTlFM5Hk9LhcuQyP8ZPpuZpOqC2oGgVEX5RUxXVZhzDrvFW4L1Ph3UTpbMXOP9v4vnpqGkjs
	rQycddsshtWOZQQ4FKvTNpEtGW3tqkW9XBucK5p7QbL1BjkuWpQRKxgesd+Zh3nchOsnttr+qqT
	BuMUM=
X-Google-Smtp-Source: AGHT+IGWn95w2UK9mUjmyjMFz61hi350Sdtu3y6aixIW9Nqgx5C54+Z0pMZQxp6uGx2qZXmVAtdjIg==
X-Received: by 2002:a05:600c:3b1f:b0:459:4441:1c07 with SMTP id 5b1f17b1804b1-45a21844b9cmr19942635e9.20.1755268830099;
        Fri, 15 Aug 2025 07:40:30 -0700 (PDT)
Message-ID: <70779bfb-f65e-41c3-abe3-09ef7b13d758@citrix.com>
Date: Fri, 15 Aug 2025 15:40:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xl: hide xenstore-features behind option
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20250815143236.27641-1-jgross@suse.com>
 <3ef1fc73-601c-4de0-b94e-bbf9cc27d081@citrix.com>
 <1704c30a-49fc-49fd-bb2f-a90f7f834761@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1704c30a-49fc-49fd-bb2f-a90f7f834761@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/08/2025 3:39 pm, Jürgen Groß wrote:
> On 15.08.25 16:36, Andrew Cooper wrote:
>> On 15/08/2025 3:32 pm, Juergen Gross wrote:
>>> In order to be able to use "xl info" before Xenstore has been started
>>> or after it has crashed, hide obtaining the available Xenstore features
>>> behind the new option "-x".
>>>
>>> Fixes: ecce7970cfe7 ("tools/xl: add available Xenstore features to
>>> xl info output")
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
>> Probably ought to be Reported-by Ross Lagerwall.  He did all the hard
>> work debugging this; I just insisted that the conversation move onto
>> Matrix.
>>
>> For the change itself, Reviewed-by: Andrew Cooper
>> <andrew.cooper3@citrix.com>
>
> Thanks.
>
> Should I send V2 with the "Reported-by" corrected, or can this be done
> when committing?

Happy to fix on commit.

~Andrew

