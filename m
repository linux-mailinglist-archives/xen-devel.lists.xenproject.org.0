Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C868A744D8
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 08:59:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930255.1332908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty4cn-0003Ew-7U; Fri, 28 Mar 2025 07:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930255.1332908; Fri, 28 Mar 2025 07:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty4cn-0003D3-3J; Fri, 28 Mar 2025 07:59:33 +0000
Received: by outflank-mailman (input) for mailman id 930255;
 Fri, 28 Mar 2025 07:59:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZL4=WP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ty4cl-0003Cx-2a
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 07:59:31 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 913fd5c7-0baa-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 08:59:25 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so17454975e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 00:59:25 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b66ab86sm1898941f8f.51.2025.03.28.00.59.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Mar 2025 00:59:24 -0700 (PDT)
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
X-Inumbo-ID: 913fd5c7-0baa-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743148765; x=1743753565; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1HWdcbQIfQsIZH9p0OTMRoXaVQYlgR9J2Ux0C/iuIis=;
        b=SnX5Fetiqem4JkqidjJhuVA6r6A00GeiSkAeDLjvkeS4ctBfjs6VknuO2MpOfDEf/C
         v3ULFI9NGZOlYJ1brtJfUMnGOwurgoNaT6m/K5LTHDhJWydcVUtkhFnwIoQ3GaImOBjt
         /AYoNeRgfCYrfZLLkOylaMVeqYFkRGAihHawg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743148765; x=1743753565;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HWdcbQIfQsIZH9p0OTMRoXaVQYlgR9J2Ux0C/iuIis=;
        b=VfdzRvlIxuqIBS1nTg40O4DOG0LRtmTG/kyuUYnQ7vsKGY3uPrOQQyBTzQRERGg83N
         +NkkPw9ePj1knv7T4wAcDfkEx28SyVo6OKtkZrb/O+ZlkjOi/DQ3FcXuU0CZ7lVpC6Dz
         AKORqgy05QcMghb6GvOxHTEMEaG32VrRyU5aqvcPnOJrKY0HvD1QCSrGuX6HCFUrPYFU
         6FgDV28Q04IgUXbpHg+Nk4r+Z0J+QHUgoemFBfTNqE4zwk8EpXuALs1wYay8L4gClazS
         nQOZNBjRhwwuWBAjmeZx/Uy+YXCwjo8veain8NNNhcTmnZkhI7h6KyvXEcemENWKrNwm
         JP7A==
X-Forwarded-Encrypted: i=1; AJvYcCUXplqsIa+Qa1lQxp408ZsduMbWkLiLJybEXfezvca+WgI70Kdn4z+C/ZKGsw2vdlL65fylKk5bW28=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yza1mPGVKOo1AJtyM/V+s+uiLDt+SSISFdlxyr2GN4QZ++D1bzL
	/yPSSe+tAAOi1VkPDLBaL3JJX23vOF2xHh30VZcFYQKvUwZmieVKOUxQJaMu59k=
X-Gm-Gg: ASbGncuWMB92PMHObpKmkHoWGJs8eEV8wfVZXpVcAZiVKMHdODknwjyn6PelDFsytTz
	fWY8lYZT/Hoq9yTK94jFZyFPCBCtDo0wC8RziGehQ7/zsnwwpnDxnSMge6fbxYxhSk9Qgy4CApl
	kN/26Y6VqBzHVcgOo5aYdxo4XzkcPJYLBrteauubqFjmOGdGyhHKQchR7KBwatu/djY5RuKbRyr
	DBUxB+2r6CSWjk0G0T8SUVVgdu607ACfosr6qyZIyZhBN5CMyTgYAC3Zv4hunzlFYQ0OWv2pL7E
	5Z+EekNYsTHcTVanV0+iKUDj4CRDKbOAT92kfd7uJi2usQNXdTHaV6RIdqN+iwUF4TjdGrzN0PB
	BzeZf/v+6hA==
X-Google-Smtp-Source: AGHT+IEaEXp2iM++Bx7LTK0sKmKpPI+RCeTXJqETUBSn1akd98XdsI3S7pA9zskAc+uRIP0n96DPyw==
X-Received: by 2002:a05:600c:228f:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-43d853fd624mr55361925e9.18.1743148765305;
        Fri, 28 Mar 2025 00:59:25 -0700 (PDT)
Message-ID: <0db68d90-fa7e-46d1-98dc-8b4692918285@citrix.com>
Date: Fri, 28 Mar 2025 07:59:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] CHANGELOG: Minimum toolchain requirements for x86 and
 ARM
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250327153725.401451-1-andrew.cooper3@citrix.com>
 <5d34510a-2f31-4295-b42d-a4e035dd4559@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5d34510a-2f31-4295-b42d-a4e035dd4559@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/03/2025 4:05 pm, Oleksii Kurochko wrote:
>
>
> On 3/27/25 4:37 PM, Andrew Cooper wrote:
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Julien Grall <julien@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> v2:
>>  * State x86 and ARM, rather than implying all architectures.
>> ---
>>  CHANGELOG.md | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>> index 35ab6749241c..8f6afa5c858a 100644
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -7,6 +7,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>  ## [4.21.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
>>  
>>  ### Changed
>> + - The minimum toolchain requirements have increased for some architectures:
>> +   - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
>> +   - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
>>  
>>  ### Added
>>   - On x86:
> LKGTM: Oleksii Kurochko <oleksii.kurochko@gmail.com>

May I interpret this as Acked-by: ?

~Andrew

