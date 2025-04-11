Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A86A86766
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 22:40:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947899.1345501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3LAy-0005Pm-JZ; Fri, 11 Apr 2025 20:40:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947899.1345501; Fri, 11 Apr 2025 20:40:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3LAy-0005Nh-GZ; Fri, 11 Apr 2025 20:40:36 +0000
Received: by outflank-mailman (input) for mailman id 947899;
 Fri, 11 Apr 2025 20:40:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cS7z=W5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u3LAx-0005Nb-Gg
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 20:40:35 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 371f13c9-1715-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 22:40:33 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-391342fc0b5so1775506f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 13:40:33 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf4458a8sm3191239f8f.99.2025.04.11.13.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 13:40:32 -0700 (PDT)
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
X-Inumbo-ID: 371f13c9-1715-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744404033; x=1745008833; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/jhkdQYzSi2KV1XIfQ25etCfDjFCQLLMxRgqOhVmfbk=;
        b=MkF/mE4Azj/A7jbt/IoWYVQV2CakbWhx8whSY9FUO9c1ZyelxWvx0z9YTvQJ4kpcus
         2xGtASKX7RfVBZIXWH9sk8YhNhF8J7WHGaYWKN+hKnWtfKaxvF7K7N/L2LUm/XPJoBZF
         ZCtcpr+xlyRp3w5rwMHfAYUaDLeCNlpmpq+M0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744404033; x=1745008833;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jhkdQYzSi2KV1XIfQ25etCfDjFCQLLMxRgqOhVmfbk=;
        b=kvZvCFmu7U/hQTKtuG9/Rh4l4SrMqisQJFVZen6p3Op4u/Qp4EBRKKiN2OeMZi+zf3
         /DbWkCoe9MlB6Xylc5yX4P0gsQLoJqI8vfhyGj9P8sICW3btRLkp9n8F5ZNvUhbfw9OB
         4iJkAsC7MY+7BjEIvKw51QybPizZGg5PvfVL/SEAB4hAKyKjezeCAMSKZeOyYgxvh77k
         SWjvrMC+E+9OZHBAO5pcfQbsyQIB27b+Z7M1iDQrGwX5XOzHtgl9MoK9xYQxin6lWwgf
         Wqf6Zn4KN1NGb3jnxvRLM7KdOPgzL3hDlsQ0qn5UutVSX/t8HbDlCgMjcXAIeSa4esYy
         6t+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpyE5WU3u8VrxboL14TpzoE96V/1hjHPauxhc630YNvn5QCWJxgujO8fc/mgOFg7IM8MTvaft5+r8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxj9dIXZ5Y9NAnhxWQc/s9SWZ+c2GhPAV0QHBy1Om8QF8FhFTwM
	FHU4EXk/BKyUDS8cZlKD8iP0IJWwrlkh/qJ7tAdXakbdTRZSQZQJDz0PYCLl9vkTWDedPvK/2O5
	sF2A=
X-Gm-Gg: ASbGnctwUg6kn3mzkL26ZCgR7CUpDuqQHByKzXqvjPJ3ESOfwZyqr6TDX79lE+vJCOj
	A3iwdhugV1bmXBEElQbERnhYmpIyeRRmDrWD/WxJSA6VJ5JmyloqriGzdK8jwVTp24STO0Au51R
	P/QdrHBFMH7DujN90PUFGPe78nKgekKuI0ufGjalxI6+h/cDcgNKYO5vrtMzS5XHUSI3Lf/QRNy
	3XayPwAGbahuccDOmvrdjr/X3UiFyWc0nGjOZuTJ2TRuSbEu2+71a18yozpegjTPpf5h5XKAW3m
	u9F0NttB8xHirXkbvxh1Q8WfYogvpWD0iRt6k+alXL64iHkoubQv0S2qfugskt2W7zzNtSUBpqH
	bZPNWmw==
X-Google-Smtp-Source: AGHT+IGd8P4AgZgVdN+aNRRRavW0QQ+G8dloJ3221pXYb6klRgveiEITpMR/TqoeYiOJiVT5zLxu0g==
X-Received: by 2002:a05:6000:1448:b0:39c:140b:feec with SMTP id ffacd0b85a97d-39ea51f4081mr4166508f8f.7.1744404032940;
        Fri, 11 Apr 2025 13:40:32 -0700 (PDT)
Message-ID: <fde17938-a7e9-4e31-9b77-77080525294e@citrix.com>
Date: Fri, 11 Apr 2025 21:40:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] CI: switch qubes runners to use console.exp
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.146eb3617cc9cf442dd4fc7a0a8950fb1bc191c8.1744403499.git-series.marmarek@invisiblethingslab.com>
 <668fb90bbc5e418f6aea85e81d90343d834a066f.1744403499.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <668fb90bbc5e418f6aea85e81d90343d834a066f.1744403499.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/04/2025 9:32 pm, Marek Marczykowski-Górecki wrote:
> diff --git a/automation/scripts/console.exp b/automation/scripts/console.exp
> index 834a08db1b95..bdb1dd982003 100755
> --- a/automation/scripts/console.exp
> +++ b/automation/scripts/console.exp
> @@ -45,6 +49,15 @@ if {[info exists env(BOOT_MSG)]} {
>      expect -re "$env(BOOT_MSG)"
>  }
>  
> +if {[info exists env(WAKEUP_CMD)]} {
> +    expect -re "$env(SUSPEND_MSG)"
> +
> +    # keep it suspended a bit, then wakeup
> +    sleep 30

Do we need 30s here?  Couldn't we get away with 10?

Either way, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

