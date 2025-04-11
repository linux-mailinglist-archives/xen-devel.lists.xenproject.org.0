Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 324B9A85848
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 11:45:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946946.1344673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Awt-00075B-GK; Fri, 11 Apr 2025 09:45:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946946.1344673; Fri, 11 Apr 2025 09:45:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Awt-00072L-BZ; Fri, 11 Apr 2025 09:45:23 +0000
Received: by outflank-mailman (input) for mailman id 946946;
 Fri, 11 Apr 2025 09:45:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cS7z=W5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u3Aws-00072B-9f
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 09:45:22 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae716b21-16b9-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 11:45:20 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39727fe912cso812055f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 02:45:20 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96c661sm1475904f8f.29.2025.04.11.02.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 02:45:19 -0700 (PDT)
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
X-Inumbo-ID: ae716b21-16b9-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744364720; x=1744969520; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mKecQun321AZ7oeyF7BQqpB66S55cbVec74U3ZW3G3Y=;
        b=kLjbhLlSnXaKRyP3yOScALEKctbRQuE3E6uuQfknlReZHmcavKruWu3oFgdEvUva4E
         OKplJrGUtzss//8LXepkdb3mukrjqKWH48qhxIiNAkQN5GFa2cgOoMWDgRYgXzjPpWwI
         reWiIGV50yGAsYavepknNgN+YDqtjl/OkEoGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744364720; x=1744969520;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKecQun321AZ7oeyF7BQqpB66S55cbVec74U3ZW3G3Y=;
        b=oAtmJJaO7GvuCQUBZHPI0y5Skbbbhvw/gB8IHuOYAMvolY/pgzuS3FEKg9sJwq0vOb
         NsRspy/VKwUnaWqZBxvBiO+RsQGe6Y77t7CtGP/lihTLbuZ3HzYm7IzRnWVgqPNLAtQW
         R7E9+NPg98Db7omIxI8DZ9VgwlPXGq24XGUJXZXV0qz6GT6YyYCNpAj7x8FP9246JLh9
         oKI9SkVaTcgWVTq2fAW4Y8ttMdBwl+1lUqonNyHr0tjb0nKfkyS8IfmH2ktGI0jOutCb
         44/FjZjrf3Fm5alJtdZAUQ/e7EMIJ3tqCh0PFaGFSF/uMyIEdyacPk5keRVD4LDHRznG
         8dEg==
X-Gm-Message-State: AOJu0YxtpoZecObeEpgylal72HyioKmWpnQSI7/Q/Jj06cG9ANRU1Nde
	1+gYV+ULlMUn8c4SPG8RehJaphJpC5lP1WXzNsMLUPzV6Gjsj8rflSQHngRznp4=
X-Gm-Gg: ASbGncvM5dZtCQ8PZHQ7w4mMzzTb4WrZAA+tBh/tKts0LdMc6QmGcM6BmLaV/22XPN+
	RHkTQ2S/WjHYqyHB0gu3zHe2RgMXyJXlrd90OtzVBlhBkU5uH/sy3nLIQ2htvANtRFaGD3FP4/J
	kk4vPc4bngiPzJLcJ3BcDi0Xn4tvBKJ5NfSdtt5RIq4afPMldP5M8NQzirM0bEgxDfNH//LIwys
	Xtb30fPiWxO9ZV4ZjawjaO2m0VlcXmv4thNwytoyB9puSTOxxx1HUpF6wPFhOLQn2EsFWKylqNl
	SplJH8vqDXst535rXmS6vpGgUerl019dtjD3FDND0NyTru8K0WYyoM/GJqvvBXRUsIUDe8Sw+eK
	dtyUPrw==
X-Google-Smtp-Source: AGHT+IER6Gy8/Y9RMtPcI/ypkMCUojIoBQlubediLHUDTlf8rB/mCFuaOy4oBGOwRQzCWqew+OomPQ==
X-Received: by 2002:a5d:64a9:0:b0:39c:1efb:ec8e with SMTP id ffacd0b85a97d-39ea51d3205mr1457098f8f.6.1744364719687;
        Fri, 11 Apr 2025 02:45:19 -0700 (PDT)
Message-ID: <157661de-3f3f-4408-9a56-6c2269cf5b0a@citrix.com>
Date: Fri, 11 Apr 2025 10:45:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] Clean up Gitlab yaml
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
 <20250409163702.2037301-5-andrew.cooper3@citrix.com> <Z_eYagfQ8vlMYenK@l14>
 <51de54c6-4540-4b84-ad96-9d2edc487016@citrix.com> <Z_jid7eTY7EPIoWu@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z_jid7eTY7EPIoWu@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/04/2025 10:35 am, Anthony PERARD wrote:
> On Thu, Apr 10, 2025 at 11:11:49AM +0100, Andrew Cooper wrote:
>> Which is another thing I haven't posted, because it turns out our
>> docker-in-docker only works for x86, not for ARM.
> Fixed! I've installed `qemu-user-static` on the runner
> which run jobs with tag `container-builder`.

Oh excellent.

https://gitlab.com/xen-project/hardware/test-artifacts/-/jobs/9691896141
was happy.

~Andrew

