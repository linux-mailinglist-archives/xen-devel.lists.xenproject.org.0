Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0808AA38F35
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 23:42:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890964.1300085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk9oK-0001nf-Pr; Mon, 17 Feb 2025 22:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890964.1300085; Mon, 17 Feb 2025 22:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk9oK-0001km-Md; Mon, 17 Feb 2025 22:41:56 +0000
Received: by outflank-mailman (input) for mailman id 890964;
 Mon, 17 Feb 2025 22:41:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xGAw=VI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tk9oJ-0001kg-02
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 22:41:55 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6207c218-ed80-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 23:41:53 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-38f2b7ce319so2819415f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 14:41:53 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d8dd6sm13490158f8f.62.2025.02.17.14.41.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 14:41:51 -0800 (PST)
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
X-Inumbo-ID: 6207c218-ed80-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739832112; x=1740436912; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NZNKC2+fTy8/BdsOQHOtcvBMqsUW2Uv4hdTDTKqhsLg=;
        b=I1xVtxm4diIVFKVWGB8L7a5sPmIPScFJHhgOUAz/NM88ZFpqbMrp+r2WJY3A+fpoXX
         UHcPBWSUOlJ3ocbVM1Ro1A5gDtEkofGeL2pR7S82/cpLWFih7ZWNNz2TbYduXy+2O4MW
         oWbUnlm55cmh4XaR8o+ncbxt1Qf5FZnyswRx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739832112; x=1740436912;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZNKC2+fTy8/BdsOQHOtcvBMqsUW2Uv4hdTDTKqhsLg=;
        b=Mk6KA3+H/77bTWvzvS9+43IgB67rxMPWKb2vevCFG3wpDP0wplbYHa9D3tx7yHICIr
         nhpctqNaq84fjPgb0/5UR/bgtlLqj5p2ffOCMwndvcUzHuK/UL/9FH5FxNk/j8IyWY9q
         jd3eDp5ZmzpHU4P+Xd3fdxKa7HjQsWkyPBDU7xg7G5mxZe27Du7p5Q4yltqpW3hP1Wb4
         BRtMyaevp/AOuYATF9o8IkPfeTI6mr46xc9KMRHDITwW+vJjjSnFdlHvcBgZkwAuCO7y
         nQWrNgP+H6iol7KitIP8jN8kwgiBQIqDQUIOYp7HbyNEuRc4vK4goRxIOYrpnlhVSWjG
         Wbuw==
X-Forwarded-Encrypted: i=1; AJvYcCUnuMfq2kFwLM98DH3Y9VppIdkjqyDCV1M9dZaKTRLSK0bJTlO7uaa8qmLj57pfNWy2ZT9uTwUaU9g=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywz15VDqvX/GZwjvpfJo36QxFytLYEuZF7xjzEXPkZce2cP9swj
	I+yMVnFjTRHRQjTi4qidbsRpkCvQOXDexZnIiMbnKxrzPmwG8TAY5zp44YfuhJs=
X-Gm-Gg: ASbGncvf3CoaniNnnh3RKciEjkSEGaQLWCJ32T8QEfGPEURgi3ovts1t/ZyZEGDkvWU
	fhhZzU0NerThns0teSexKskfVXue6wA63qvt/CiEkDNkuFT/i0nrQ2Mn2hCDEKKYclyYhG7MNyV
	Lqprz8d7OYUcsCqpBfgr0u8qci/c/YLdVV+2pIXN1AIVvHujz2VTGCMMszlAbFK+JtCekW2PYXy
	vZrT34MTgthkgg+YdntRebW6GAQv3COtA/Sppco/1dtRMj+hUQD0b/rtodmnLxWY6YUarrX7PQj
	mK7ftY725BDQ+y05Gm4VyeJQkSmPEeMEC4gE+M7w1Wisu2aRC0RKkd0=
X-Google-Smtp-Source: AGHT+IFFAZcOgNKcgX8iFkt1qcoVIODluY8+RDqEILiSUcFax//f1+sou2mg3bzGKcwDmi8e10SbcQ==
X-Received: by 2002:a5d:64c7:0:b0:38f:2766:759f with SMTP id ffacd0b85a97d-38f33f4ac56mr12314417f8f.41.1739832112402;
        Mon, 17 Feb 2025 14:41:52 -0800 (PST)
Message-ID: <aba8c80c-442a-4b3a-a283-729c341d6ede@citrix.com>
Date: Mon, 17 Feb 2025 22:41:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 for-4.20] xen/memory: Make resource_max_frames() to
 return 0 on unknown type
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250217223402.167514-1-olekstysh@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250217223402.167514-1-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/02/2025 10:34 pm, Oleksandr Tyshchenko wrote:
> diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/test-resource.c
> index 1b10be16a6..521c1fc51a 100644
> --- a/tools/tests/resource/test-resource.c
> +++ b/tools/tests/resource/test-resource.c
> @@ -123,6 +123,16 @@ static void test_gnttab(uint32_t domid, unsigned int nr_frames,
>          fail("    Fail: Managed to map gnttab v2 status frames in v1 mode\n");
>          xenforeignmemory_unmap_resource(fh, res);
>      }
> +
> +    /*
> +     * If this check starts failing, you've find the right place to test your

s/find/found/

Can fix on commit, if Oleksii is happy for this to go into 4.20.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

