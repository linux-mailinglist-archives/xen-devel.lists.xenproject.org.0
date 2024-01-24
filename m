Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6AB83AFA7
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 18:23:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671171.1044382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSgxr-0007dM-OL; Wed, 24 Jan 2024 17:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671171.1044382; Wed, 24 Jan 2024 17:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSgxr-0007bd-Kz; Wed, 24 Jan 2024 17:23:03 +0000
Received: by outflank-mailman (input) for mailman id 671171;
 Wed, 24 Jan 2024 17:23:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zgc/=JC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rSgxq-0007bX-N2
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 17:23:02 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3994c39c-badd-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 18:23:01 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-338aca547d9so4572787f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 09:23:01 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 p12-20020adfce0c000000b0033865f08f2asm14302733wrn.34.2024.01.24.09.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 09:23:00 -0800 (PST)
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
X-Inumbo-ID: 3994c39c-badd-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706116981; x=1706721781; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SSA19w1x/UH79pVuEe9Q4jKlI9k5zfXjQivwqOoSS7A=;
        b=Si+zwmEQ2i42td8Z7XwjLbnMs9UunxeOcGWpfaJTEGznWir8Ztd96Gm3uxpjNbDwXX
         7V6PPSJOgqETVBi8/2h5oX8ACnWQ3F0dRx3X1wVX8qLXfZ0DKDoaS2HrS36qiXHwcsSb
         5m4xJnh297kaCaKxaSDoARoacSWkU038qD1aY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706116981; x=1706721781;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SSA19w1x/UH79pVuEe9Q4jKlI9k5zfXjQivwqOoSS7A=;
        b=dmPrBsk7m7ldSWTCHDQdPEsnnNqXrVRvgE4vUZYGNEmEwlmn5cbin80MZjF7xg7Yse
         SJJW2T/8MueTt385Lf+3P6L849gJnzR/wm/K85mAMEx/Ln2NcEtPSZPoik/H+mJeOIQL
         12yMTRWgcBYflKTJGpKjOmlqbnLwVbZpyDiWK8DThwn4LhAGZYDoTA/l4FAd2kk0L6pJ
         Owrwjry6e4dKgEZzeZME8/7/m2hi91fa54Fa/0vaHnXvk9j9DqjptGWmBMfq3JHHzr3V
         o0aYy7m+V0KQYM0+uZSJbRKxUbz/M+M8/XN80i7xkqs7OIV2SvA1Qd9z2MxZH8zZgx4j
         /uOw==
X-Gm-Message-State: AOJu0YwFZUNfgvvMWpcfFlaTioOrq6fv/8X2HTP9jd3O7Ij6b200ItUs
	zB2xq3m3IheDSn/OsOFqHRnWmPEplE61ENW9UbLRCB56CpqEGX4RBJci4yA+hvc=
X-Google-Smtp-Source: AGHT+IExbcQrFYV6R4dq4zoUhgDJjX6ZEZnJEfRumv6lx9rb770xm3jd+iu8DqjOXdPk72oZ6ni7bw==
X-Received: by 2002:a5d:6705:0:b0:337:32ef:177b with SMTP id o5-20020a5d6705000000b0033732ef177bmr374706wru.38.1706116980787;
        Wed, 24 Jan 2024 09:23:00 -0800 (PST)
Message-ID: <95a1f94e-7c82-4996-8f24-87c6628bc81a@citrix.com>
Date: Wed, 24 Jan 2024 17:23:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Fix stability of the Raw CPU Policy rescan
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240123205948.1782556-1-andrew.cooper3@citrix.com>
 <090f64ae-ecf3-4edc-a6c6-8be3a09ea1ba@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <090f64ae-ecf3-4edc-a6c6-8be3a09ea1ba@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/01/2024 3:37 pm, Jan Beulich wrote:
> On 23.01.2024 21:59, Andrew Cooper wrote:
>> Always run microcode_update_helper() on the BSP, so the the updated Raw CPU
>> policy doesn't get non-BSP topology details included.
> Wouldn't it be better (and consistent with ...
>
>> Have calculate_raw_cpu_policy() clear the instantanious XSTATE sizes.  The
>> value XCR0 | MSR_XSS had when we scanned the policy isn't terribly interesting
>> to report.
> ... this) to purge these details from the raw policy as well then?

I did spend some time considering this.

Rerunning on the same CPU is more resilient to new topology leaves, so
we'd want to be doing that irrespective.

The XCR0/XSS state really is transient, and the useful information is
everywhere else in leaf 0xd.

>
>> When CPUID Masking is active, it affects CPUID instructions issued by Xen
>> too.  Transiently disable masking to get a clean scan.
>>
>> Fixes: 694d79ed5aac ("x86/ucode: Refresh raw CPU policy after microcode load")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Irrespective of the question above, I'm also okay with the change as is:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

