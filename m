Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6922B9B92B0
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2024 14:56:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829144.1244226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6s7z-0000lJ-EC; Fri, 01 Nov 2024 13:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829144.1244226; Fri, 01 Nov 2024 13:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6s7z-0000jN-BK; Fri, 01 Nov 2024 13:55:51 +0000
Received: by outflank-mailman (input) for mailman id 829144;
 Fri, 01 Nov 2024 13:55:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nn37=R4=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1t6s7y-0000jH-AY
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2024 13:55:50 +0000
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe7aff45-9858-11ef-99a3-01e77a169b0f;
 Fri, 01 Nov 2024 14:55:46 +0100 (CET)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43161e7bb25so15610115e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 01 Nov 2024 06:55:46 -0700 (PDT)
Received: from ?IPV6:2a02:8012:3a1:0:4ddd:1dd:c52d:25b6?
 ([2a02:8012:3a1:0:4ddd:1dd:c52d:25b6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd947c26sm95136475e9.26.2024.11.01.06.55.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Nov 2024 06:55:45 -0700 (PDT)
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
X-Inumbo-ID: fe7aff45-9858-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIwOS44NS4xMjguNDciLCJoZWxvIjoibWFpbC13bTEtZjQ3Lmdvb2dsZS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6ImZlN2FmZjQ1LTk4NTgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNDY5MzQ2LjgwODcwOSwic2VuZGVyIjoianVsaWVuLmdyYWxsLm9zc0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730469346; x=1731074146;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DQCRFSxv5Y2IplxAHG0o5lc6I02Qv0u03rbfYv++cL0=;
        b=ugy2/amxsRK5J9RbU+1JmJAhCAg1HMSZZXqmxgo/rehuh4NaMbmURUthyuHib89r+1
         nO5yLgmguUb3krGIc7PwuTphBEQml83UOtH7CgdTkjutK5C8wXnM5qn/BP3PDKo+IulM
         uDWrPjzlWtmzRtOVSn33dlfqEq8ixcYt7JrtFpSJSLHHEhznR1zE2MvmXs7CVErxDl0s
         t6PQVxkbzpnQhBIaJww9MNQUDe0yIjuBdraKRIZ8CFi2iSzGuQkEFf0X5deI7t+yqXoj
         zwXQ4h2SOebyi05LaMK2DmUjV1yYWeaNmnHxpqaV8+tyxc+2l9HtxFdrG/5XqdLbTS66
         IF6w==
X-Forwarded-Encrypted: i=1; AJvYcCV9uenEFYzFoAPivgawbNI1qfCDWKwDOe6SvnEFiCq3cdxBX1mogPPUwhGZSz3qx5zWQwChZl6dQB0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVQfoukwoegQ9ZpdkdXjQFrHG66b3Gz3/hywbZg2RJ6ZIFv6dS
	zIzZXVD8tjVRq03TtTNlNO75Nb6r1Smvn8Zrt0zC8ePB732hPIsb
X-Google-Smtp-Source: AGHT+IGeWKkyyADBHcgCbEgWOJdYpOmkB/Kw6RzgzGvGqicU7E4TZuw9h/jHc1KaZCxpqjqiBzaukQ==
X-Received: by 2002:a05:600c:198a:b0:431:6153:a258 with SMTP id 5b1f17b1804b1-431bb9855f6mr100841555e9.13.1730469345904;
        Fri, 01 Nov 2024 06:55:45 -0700 (PDT)
Message-ID: <3d8c7aa6-500d-4bab-9804-0c41ffb4fd52@xen.org>
Date: Fri, 1 Nov 2024 13:55:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] xen/arm: Skip initializing the BSS section when it
 is empty
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
 <20241028124547.1371867-2-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241028124547.1371867-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 28/10/2024 12:45, Ayan Kumar Halder wrote:
> If the BSS section is empty, then the function should return.
> If one does not check whether the BSS section is empty or not, then there is a
> risk of writing 0s outside of BSS section (which may contain critical data).
> 
> Fixes: dac84b66cc9a ("xen: arm64: initial build + config changes, start of day code")
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


