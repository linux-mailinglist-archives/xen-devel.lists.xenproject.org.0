Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D315ABA742
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 02:13:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987866.1373102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG5B5-0004qI-TS; Sat, 17 May 2025 00:13:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987866.1373102; Sat, 17 May 2025 00:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG5B5-0004nB-Q1; Sat, 17 May 2025 00:13:23 +0000
Received: by outflank-mailman (input) for mailman id 987866;
 Sat, 17 May 2025 00:13:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dgwh=YB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uG5B3-0004n4-Uk
 for xen-devel@lists.xenproject.org; Sat, 17 May 2025 00:13:21 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcfa20be-32b3-11f0-9ffb-bf95429c2676;
 Sat, 17 May 2025 02:13:20 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a1c85e77d7so1756989f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 17:13:20 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca5a84csm4436355f8f.31.2025.05.16.17.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 17:13:18 -0700 (PDT)
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
X-Inumbo-ID: bcfa20be-32b3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747440799; x=1748045599; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qv+jkjlo6UD/rwczhf5/ZHkOayfPbwj7hg0EpuHNAzA=;
        b=CCmYuakkT1lpjXSALkFYLtZ+HiPGviTpj1vh1l1+V3Ohsx448Txmy+2UHbTada4Kqq
         YUVYww0VTeczO0vyVBpF1MiuR0x6UEG7wXCiqbWc8BdoOeQ7F17Fb12zk4rvB7pc2HUS
         daqqpyv5EeoAZPG2wrOlgt3CAFx0x7w08mjIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747440799; x=1748045599;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qv+jkjlo6UD/rwczhf5/ZHkOayfPbwj7hg0EpuHNAzA=;
        b=w6VZnWxX+ZH7dfguNQuMpytaY0mOpdjZAQfm9igQSX9dHng8x9bUrtrtYCz70ntTMX
         OgLqL7VhwT0dUnxCxWHckbeWiwxNp+Rc+MLXQG1+C6d7p7gjnal5Qes+3GPAZOy8zl+F
         WE5qJSzcYum5/RDzVP6+gziRV1P597xiifTolx6nhAF1CrP6+iueBSM6pxip1m8u3qN+
         LbN8CLKSG35QyVfW0uL951/aKRq15baLPn1OpDS68qU8Nzoqogf3o0IIIppNFK/kJ+74
         xItTSmIyyhalhq7HCC/5ar5JvlMtjt/FdFYkSVzVdml7/T5RFU6mGUxlUCL6w+TJvGaV
         8Ctg==
X-Forwarded-Encrypted: i=1; AJvYcCVME9wjW0CgOCnHLQNFUt6nODGYaUFr/tUcPOtsVc6zWtwzPa+PiQTjK4CBP1gNv5WXhsL0eQvkha0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBkIIo3ElpjEK9/MuhYxkPWE4V5Tf6DUrmT2o4AuOmfnF/4uFt
	+AYfBkmTw5rxrlrQlsfwqI8a2P7AxvJT2C6iFW/kAZz92aWhvRiQbbODvFeQHL76ngc=
X-Gm-Gg: ASbGnctchNnVinMZeFgjA9UI3/L59A5zAQJvH/xP90maAdc3LOmNyjN1NyVEVn/moBY
	qn1Npj5Ip3rW+VOKDbVyMbPe6teF/tYZ0L+2G/0Q1fMvwUh4HZqqsCSkQxmjMMEM9vzLf4xSDc8
	meRuOQ/qZ/4+gVSnwUgsobV0yFOE4YsmmzLNqfItP+sFp3pLbUqsTo4X6ZUKOZUG9bW+YSo+l+Q
	jGy15m2W7giXfiqiip5iGJnL9cHpk57vjFkvwpT6w4IBKkWUotJhul49AOacOPUhmDU1Iv97RFw
	qmu0Xx8RnzbyFyBTJyQ9xwyXc+aD27Boeqnq76UiGKrtwrXhQRJHgcGsUod5C9gZNxfzUmNZDLb
	1k+KQHRZpwXktWqTR
X-Google-Smtp-Source: AGHT+IHVv2KRAkGNad7cFQrd/ryIf6BvqE2XXZ+OAyl0DVfcaLWNiCETa4kBw9vGleKYvR1jolUIkA==
X-Received: by 2002:a05:6000:430d:b0:3a1:fed3:7108 with SMTP id ffacd0b85a97d-3a3600da40fmr4291621f8f.40.1747440799577;
        Fri, 16 May 2025 17:13:19 -0700 (PDT)
Message-ID: <fa4f43d2-90a8-432e-8ae7-af7e8195dc53@citrix.com>
Date: Sat, 17 May 2025 01:13:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] xen: refactor include guards
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, jbeulich@suse.com, julien@xen.org,
 roger.pau@citrix.com, sstabellini@kernel.org, bertrand.marquis@arm.com,
 Federico Serafini <federico.serafini@bugseng.com>
References: <d1bcab8a-873c-42ed-b7e8-071c009bcc3a@citrix.com>
 <20250517001005.860657-1-stefano.stabellini@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250517001005.860657-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/05/2025 1:10 am, Stefano Stabellini wrote:
> From: Federico Serafini <federico.serafini@bugseng.com>
>
> Refactor inclusion guards:
> 1) use a syntax that is more likely to be recognized by static
>    analyzers;
> 2) follow the CODING_STYLE.
>
> No functional change.
>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

