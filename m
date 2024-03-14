Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBA787C22C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 18:41:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693422.1081476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkp52-00033x-Gs; Thu, 14 Mar 2024 17:41:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693422.1081476; Thu, 14 Mar 2024 17:41:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkp52-00031k-EL; Thu, 14 Mar 2024 17:41:24 +0000
Received: by outflank-mailman (input) for mailman id 693422;
 Thu, 14 Mar 2024 17:41:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rR1U=KU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rkp50-00031Y-BR
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 17:41:22 +0000
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [2607:f8b0:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 115416ac-e22a-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 18:41:21 +0100 (CET)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6e46dcd8feaso946462b3a.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 10:41:21 -0700 (PDT)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n29-20020a634d5d000000b005d6a0b2efb3sm980651pgl.21.2024.03.14.10.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 10:41:18 -0700 (PDT)
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
X-Inumbo-ID: 115416ac-e22a-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710438079; x=1711042879; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v76VnWZ6f97ShybuKoxCi8k8XuPkC78HnVbwJkhJRPY=;
        b=LRS9DN15CLZd/d98/uufTLmwO3Idf6pJeFetOaTJEhrNRSQsOLLv7yE0GowKvk0TVd
         CabmBW5or3kpU6sUGY2h/rOF4h+p19/apPzVJURJQ7tgCJTs0xXZECW2y0HETwJbQYQA
         y3QQT7QMo9cC/aAfUeA7jMoodkLnf2i3yVKNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710438079; x=1711042879;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v76VnWZ6f97ShybuKoxCi8k8XuPkC78HnVbwJkhJRPY=;
        b=uk2AubAI5JTt0lU6IyVhF4v6ge41S0IJnMTTYFT9YF4zG5HghhkxNjhKQhBedmjjDj
         PoUAFDc9HP8PQj0uG1ak1+erYAQLoP773WWGGzLtIpHhy7eCx0eHsnIGYfzdNIsdiFh+
         LkbQSasbwU+0UpT0BjGjy78C8RvkDg7jPpwZn2JaBv5y+AyTRC8AMc01s7MGUWF+TPTd
         8WMQ8nBez3V7DSqSTp22B54WGesf4eGTrn3vblAe1cGsJZOm8Zer6TmzKLenP/gYw7Gf
         At++6LjBG1syJmvxejRRKlAiX9vFUdR92ivJycyEpIa1kmytRT54Y/ck4QB+g8Z9z2N9
         wWFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnBTRBiCaAA/XmvD/5iHacE+PO+e5hgbvbuHGUKNYBSdfWofy7wb142A4PlDspplCpd4u0re2aslGbeTVNYFycMmpxpdwinSSVxb8BF58=
X-Gm-Message-State: AOJu0YzkF4liCZojnKSz3Xt7blbNqhhvdb2n5l7CtpIcL6I8ZQOeGIsx
	FRq2odN0eWTt5/VGrmC05dTYnUA4o8SRozBy0KhTOI51js0lLkTV7MQIyFsZCUkfQbKuq/au3iy
	j
X-Google-Smtp-Source: AGHT+IF7PNftTWyEd0v9bJWucwC5vdX0x/vYEz/y2VtT9d+wBFcv8CqyMXezUKYl2QwMrPw+8vxKkw==
X-Received: by 2002:a05:6a20:4289:b0:1a3:113a:bbd5 with SMTP id o9-20020a056a20428900b001a3113abbd5mr2818937pzj.40.1710438079583;
        Thu, 14 Mar 2024 10:41:19 -0700 (PDT)
Message-ID: <fdb6c565-b846-434d-8f4f-fd6cba4d17e3@citrix.com>
Date: Thu, 14 Mar 2024 17:41:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] SUPPORT.MD: Fix matrix generation after 43c416d0d819 and
 77c39a53cf5b
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, ayan.kumar.halder@amd.com,
 Julien Grall <jgrall@amazon.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20240314173929.12040-1-julien@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240314173929.12040-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/03/2024 5:39 pm, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
>
> The script docs/support-matrix-generate throw the following error on the
> latest staging.
>
> MDCCSR_EL0
> DBGDTR_EL0
> DBGDTRTX_EL0
> DBGDTRRX_EL0
> DBGDSCRINT
> DBGDTRTXINT
> DBGDTRRXINT
> ^ cannot parse status codeblock line:
> MDCCSR_EL0
>  ? at docs/parse-support-md line 172, <F> chunk 1.
>
> With the current indentation, it looks like the script thinks this is
> a status code block.
>
> Solve the issue by switching to a bullet list.
>
> Fixes: 43c416d0d819 ("xen/arm: arm64: Add emulation of Debug Data Transfer Registers")
> Fixes: 77c39a53cf5b ("xen/arm: arm32: Add emulation of Debug Data Transfer Registers")
> ---

You need a SoB somewhere, but Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com>

