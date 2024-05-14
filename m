Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 401708C58FB
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 17:44:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721658.1125254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6uJy-0002WM-Do; Tue, 14 May 2024 15:44:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721658.1125254; Tue, 14 May 2024 15:44:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6uJy-0002UT-B1; Tue, 14 May 2024 15:44:06 +0000
Received: by outflank-mailman (input) for mailman id 721658;
 Tue, 14 May 2024 15:44:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0FJY=MR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s6uJw-0002UN-6q
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 15:44:04 +0000
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [2607:f8b0:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9069469-1208-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 17:44:02 +0200 (CEST)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3c999556297so2590111b6e.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 08:44:02 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf33f1a5sm570691885a.131.2024.05.14.08.43.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 08:43:59 -0700 (PDT)
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
X-Inumbo-ID: c9069469-1208-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715701441; x=1716306241; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uTkAbNEdl0lHbYWjk3Nr8h08VnGBDx80LnEL1ULdfWM=;
        b=F4MX+30S4mPIhVNg38gfRmec+NsSuznANOZ9xPmG43EB5rN4/uGM9CAN9oToK3KS33
         eiUmYr5c7scLRl8ngv8L7vp3evAi7yddje7azdZUTj9aVEldpfltFnZr4N8WmH2CB8w8
         I5ecHguhzQUwRvn2VvxrZ0mhXBTbICW6slInI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715701441; x=1716306241;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTkAbNEdl0lHbYWjk3Nr8h08VnGBDx80LnEL1ULdfWM=;
        b=IYoMCTxWggcb4gI5WW6rJAeW17WMnWqG6oZDKom1lv+8FVxPbAJysiOsVZvi9BQGxA
         dNNuXGlI49c1s0u9hGRSweHMMneER4hdFM4ko31vYGQwvgXUBCFzmWyAzXC7pGQFE8RC
         9xeXy2bN6V2tc6ULtrirzboSXuR5SbJhNnNfy+uLN/dx+BmtiNg2/pty8ModwxNGarIE
         ZgDv3f7+/24nD+pFRo+FfYKKBjh8yMw7o5k9MbNsUIpV5E2i6W3HRmdDsVuQLeg0v0Ak
         Twxjs+I92sUsHpGK5CWG/m/+V1j1hoTL/1Tq1CkOBaulz+QlSK3ZjSL9WbL8sxOoWSpm
         2eyw==
X-Forwarded-Encrypted: i=1; AJvYcCU7TdMPfnr9hl3wCiWl+iDy9KCOLqHTzWJPxepDq3D/spDEmv3hm97gvd3MkYlGbfy7mpEaBIRgGGH5wgW5SODyIe6tBEbXCdG07ES0lSg=
X-Gm-Message-State: AOJu0YzHO0+8ezABMOvQzez/9cDb2TctqX4brczLWteRZ41uIBhg/Goh
	ce0K2ps5XAfYOl2eloeUUEXE8BZ0QgVXO2vJbTdtMowJyo9Hd1kOV3F1TllBIAw=
X-Google-Smtp-Source: AGHT+IHX8HhQDqPVX8X4NsPcU75FMtU4ifuRqzGmZ/gM3oMymo7snynAS5ditVMdhLjxi4aHvX0Ybg==
X-Received: by 2002:a05:6808:18a7:b0:3c9:9517:e0ab with SMTP id 5614622812f47-3c997072211mr17629639b6e.32.1715701440386;
        Tue, 14 May 2024 08:44:00 -0700 (PDT)
Message-ID: <bba91b8b-b1cc-4054-96e8-80a63a3b808a@citrix.com>
Date: Tue, 14 May 2024 16:43:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Proposal to Extend Feature Freeze Deadline
To: "Oleksii K." <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: committers@xenproject.org, Henry Wang <xin.wang2@amd.com>,
 kelly.choi@cloud.com
References: <a72f75b9edc4255761ff676d6a09a966290a24df.camel@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a72f75b9edc4255761ff676d6a09a966290a24df.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/05/2024 4:40 pm, Oleksii K. wrote:
> Hello everyone,
>
> We're observing fewer merged patches/series across several
> architectures for the current 4.19 release in comparison to previous
> release.
>
> For example:
> 1. For Arm, significant features like Cache Coloring and PCI
> Passthrough won't be fully merged. Thus, it would be beneficial to
> commit at least the following two patch series: 
> [1]https://lore.kernel.org/xen-devel/20240511005611.83125-1-xin.wang2@amd.com/
>   
> [2]https://lore.kernel.org/xen-devel/20240424033449.168398-1-xin.wang2@amd.com/
>
> 2. For RISC-V, having the following patch series [3], mostly reviewed
> with only one blocker [4], would be advantageous (As far as I know,
> Andrew is planning to update his patch series):
> [3]https://lore.kernel.org/xen-devel/cover.1713347222.git.oleksii.kurochko@gmail.com/
> [4]
> https://patchew.org/Xen/20240313172716.2325427-1-andrew.cooper3@citrix.com/
>
> 3. For PPC, it would be beneficial to have [5] merged:
> [5]
> https://lore.kernel.org/xen-devel/cover.1712893887.git.sanastasio@raptorengineering.com/
>
> Extending the feature freeze deadline by one week, until May 24th,
> would provide additional time for merges mentioned above. This, in
> turn, would create space for more features and fixes for x86 and other
> common elements. If we agree to extend the feature freeze deadline,
> please feel free to outline what you would like to see in the 4.19
> release. This will make it easier to track our final goals and
> determine if they are realistically achievable.
>
> I'd like to open the floor for discussion on this proposal. Does it
> make sense, and would it be useful?

Considering how many people are blocked on me, I'd welcome a little bit
longer to get the outstanding series/fixes to land.

~Andrew

