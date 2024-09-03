Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7B096A0BC
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 16:34:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789312.1198900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slUbP-0005Wx-Jq; Tue, 03 Sep 2024 14:33:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789312.1198900; Tue, 03 Sep 2024 14:33:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slUbP-0005Tp-Fr; Tue, 03 Sep 2024 14:33:51 +0000
Received: by outflank-mailman (input) for mailman id 789312;
 Tue, 03 Sep 2024 14:33:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7TnF=QB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slUbN-0005Ql-S8
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 14:33:49 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84c8091b-6a01-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 16:33:42 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2f029e9c9cfso67301901fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 07:33:42 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feb453sm689104266b.36.2024.09.03.07.33.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 07:33:41 -0700 (PDT)
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
X-Inumbo-ID: 84c8091b-6a01-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725374022; x=1725978822; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B0HA04jPBd8dsLLwirkm2FRyQoKOzWjVPIfVdtLylAQ=;
        b=aieu7GQikl8OUK7CvHhOYF/nZn/3Z6G32npGY8M4bOUHMXJurPTkSFJx4FpNk2dNJ2
         KvUt8jF29MSvQuO7pHtHEi1/Ot8ZKEwe9Mzj/E837sKb+PR+wpOXP+rACYpDO4DXjvUg
         v/Gn/4J3HGq34AEXzZIoelFsWvVyxSJOzUIMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725374022; x=1725978822;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0HA04jPBd8dsLLwirkm2FRyQoKOzWjVPIfVdtLylAQ=;
        b=ta6W/yLQktAxyJ3G8LSS35wXId1PgZrHEFTQzvUJMJDSbHJ+c6SgCL+jWC27YJyjVJ
         Q1MdxFFBbj4SlaUA7gt0bbQbkkUorqVWanR2DQVSNGPNSuWMUSAyGZRQxZLYZTdizQZ8
         L7/tncotbR3AnbZSWPJ6Kxoa7/ztBaWEklAUsneJOrnim0RwLuidGMRlp+GU0+ZN9n+Z
         i0CbjCna4BQAavGOnaJy5w9fTdf8gKrdZPU1tlDx0aojDRh07vwEkH/Mz+pGPBMWGLBY
         oaBu6A4mRjLFEiUXVPjcwBxlH5lIZ/B3Pq7OOgq2kPjw8o8EigCbJhTbR+X3Fr0jl7Up
         JDdw==
X-Forwarded-Encrypted: i=1; AJvYcCXH+AH0SbKlvxU1ifRuWmIXZh5zgxnA1QKoeAwgx103JN/PFaF9l6dXiTVmOpVFCcAuN/qu4oMS+fY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCpVBlZrlJTEgV8KFZOqyOFMD6mYh7zXeX3Kv9dXvjmsWV8whq
	z3vDOY/wU0tKQBUQyQ1f494V7ozW77m0LaOsBe2C5/7zckEBdURJQ9mpkN/J0ALjVd7dF6vJtPk
	E
X-Google-Smtp-Source: AGHT+IHqmUTsBxmPwnd+KUQH1njGG0XEQMs3/8/xvKYdCAFYYFgU1q4PTdvRxCxQ6DpKx/q0OonhIw==
X-Received: by 2002:a2e:4a11:0:b0:2f3:f1ee:2256 with SMTP id 38308e7fff4ca-2f6108ae2demr121094241fa.44.1725374021568;
        Tue, 03 Sep 2024 07:33:41 -0700 (PDT)
Message-ID: <8b34106b-7dec-4de8-9479-ae38625c5658@citrix.com>
Date: Tue, 3 Sep 2024 15:33:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/boot: Fix include paths for 32bit objects
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240903104940.3514994-1-andrew.cooper3@citrix.com>
 <20240903115334.3526368-1-andrew.cooper3@citrix.com>
 <2115ac3a-84d3-427a-8601-c37e4732089a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2115ac3a-84d3-427a-8601-c37e4732089a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/09/2024 3:32 pm, Jan Beulich wrote:
> On 03.09.2024 13:53, Andrew Cooper wrote:
>> Most of Xen is build using -nostdinc and a fully specified include path.
>> However, the makefile line:
>>
>>   $(head-bin-objs): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
>>
>> discards XEN_CFLAGS and replaces them with CFLAGS_x86_32.
>>
>> Reinstate -nostdinc, and copy all -I (and -Wa,-I) arguments from XEN_CFLAGS.
> And the files in boot/ indeed need the -Wa,-I? I'd favor us not propagating
> such without actually being required for a particular reason.

Hmm ok fine, I'll strip that back out as both you and Roger have asked
for it.

I'm still waiting on Gitlab CI, so haven't pushed yet.

~Andrew

