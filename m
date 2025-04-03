Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25024A7A1CF
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 13:26:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936635.1337828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Ii3-0000eu-LJ; Thu, 03 Apr 2025 11:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936635.1337828; Thu, 03 Apr 2025 11:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Ii3-0000cI-HJ; Thu, 03 Apr 2025 11:26:11 +0000
Received: by outflank-mailman (input) for mailman id 936635;
 Thu, 03 Apr 2025 11:26:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JbNy=WV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u0Ii3-0000cB-0U
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 11:26:11 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71512916-107e-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 13:26:10 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso4093925e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 04:26:10 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ea8d16d35sm57505485e9.0.2025.04.03.04.26.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 04:26:09 -0700 (PDT)
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
X-Inumbo-ID: 71512916-107e-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743679570; x=1744284370; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iBrHNkWoU3ZZbH3T0ZM+qxY1/3nVB4MF8Xos+HBI8rI=;
        b=IO91cUeh4zqk1RPRPq2uvhGgBNzmS55OjD0iR6NH0FnYWvOUe70gQA/pamU1U2rjQs
         IqrH4zqrzjbIhSMdtdXbrrYQRafbWDuBST2XwL3KBv2oagJ8jFSZ3qk7V1cxRRu76IxA
         kNcaokqFM9F7CA9iXnLqUWXSRUqulMovvVMgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743679570; x=1744284370;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBrHNkWoU3ZZbH3T0ZM+qxY1/3nVB4MF8Xos+HBI8rI=;
        b=QcaeW7JYfdc0xug6o8XSkUt9YPPCWWPiQRMPK+DafL7Du7Gojmpyao0EDtZiVrAD9A
         3Y7lsMru0IPV8uHApHRZ/gMESCkYMQwhNBQ5q/FkYLFT7HVIdq758/Pb1czIfRRXrskC
         MKBHEPpCaOo+yNGYfPOnMX8gTOyefGe/oCNpQDtioujhdjrKaQBqh4Fzm0Z7N/xIQSt7
         vCMPCDUwFXKrG83t1EQoVlXWQ90XI3wi9MmYSLoze38M3ih6trMhGQlXOT/NtHQBUxSa
         eAND4InjK34shlNNWBc6QAWBdgAmt61BIHDiZpCo2Zm/x1XJxkR5cWgzl/S8PG/IW01l
         7Eyg==
X-Forwarded-Encrypted: i=1; AJvYcCXqnc5NXL3I/EvyLpeyiDQ6xUrSk6Eor9t7gH/OeTlOxCxggRakT9PMXMLH4ySUaWcWdxdXdxt5sxs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNukR0o/FLcRzJxz1nwkdd3HQ+rSqJtNtmSV/fSDtD9bvADo7y
	Lm3MMcOK4VWhxUdtj/OcYmNGZ1OoX7BiQbNUVPOpgkW2vUwAT1ClzOyN4tjK7co=
X-Gm-Gg: ASbGncsd+YxmE0fGc85lf7+pHjJbS2vu61SQNbvEC2xXG+r8guQzG4MW9Pq026kR05Y
	7OgCaJwrXvh3Wd8SCzIwcHDjcun6MPeikbhNAhxxgtkBdUHro1HQOtVcn5ST+2eXY8ISvYvElDq
	jSGZTaraze0FG+3Uvsyb6YyBfYdd8At84WwIgb7Sor36mOBR9qXfNU8T9JqYCw19zkyD37AZeUr
	bmIwBQ8Fd1e5yynsQJnDmRQEo1RCTywsyvn3GsbmZcCfmhyDt9bonRAa1KTjRrV0DYx1FT/556s
	kDpIlG7xWTI0pNXPP0HvYNZauZU9OsQeRzj5rmqJozWjSQCosMmVYHjOUlRIKSLaBQuk4UL46s5
	L5VYOlzQM2F/295ZAI25/
X-Google-Smtp-Source: AGHT+IEKpmebTPscJZbYsdnm0wFFYi9AXYi57sZ5ogUayL4xv2t+HVU68rzCBaHlmkr2jbAlJCqtNg==
X-Received: by 2002:a05:600c:4514:b0:43d:209:21fd with SMTP id 5b1f17b1804b1-43eb5c96d6emr53688875e9.30.1743679569625;
        Thu, 03 Apr 2025 04:26:09 -0700 (PDT)
Message-ID: <c5ef5d60-3149-4f8f-b48b-f04300962bc4@citrix.com>
Date: Thu, 3 Apr 2025 12:26:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] time: drop cast from NOW()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <e14bbf31-24cf-4b82-9b2e-a473ad16d008@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e14bbf31-24cf-4b82-9b2e-a473ad16d008@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/04/2025 12:25 pm, Jan Beulich wrote:
> It gives the wrong impression of there being a type change, when
> get_s_time() really returns s_time_t itself (kind of naturally given its
> name).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

