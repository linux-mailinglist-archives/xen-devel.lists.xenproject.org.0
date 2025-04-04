Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9EFA7BA76
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 12:14:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938055.1338871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0e3P-0006C2-5N; Fri, 04 Apr 2025 10:13:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938055.1338871; Fri, 04 Apr 2025 10:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0e3P-00069y-2H; Fri, 04 Apr 2025 10:13:39 +0000
Received: by outflank-mailman (input) for mailman id 938055;
 Fri, 04 Apr 2025 10:13:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9O5F=WW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u0e3N-00069q-Kr
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 10:13:37 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 754c1ef2-113d-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 12:13:30 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39c13fa05ebso1131732f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Apr 2025 03:13:30 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301b9d55sm3915740f8f.42.2025.04.04.03.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 03:13:29 -0700 (PDT)
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
X-Inumbo-ID: 754c1ef2-113d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743761610; x=1744366410; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yGUsM5+jPzlnfJ5bAbq9/oKLsYAhkdxGHQHjv8Nnp/k=;
        b=Jx0ReJ1cpl6SNUfpHIeLm9tiQqKs2lkRHn0HLsAsKyrcWqqtjcqMdMR4+BS1Ozr4CM
         0h/seKl+riVzvb2li9Yvn9hvoJ6M0q6GN/jCjJPUQWmK0Ka/x5L9Lfy0p/ly1XfRvRDM
         40RwioP4heH/4clknApo0OPaHY0R9V4AZryHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743761610; x=1744366410;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGUsM5+jPzlnfJ5bAbq9/oKLsYAhkdxGHQHjv8Nnp/k=;
        b=XKFD7RY44X9wTF/I3RPRkXl5V4ArQoBoqozvFQfDRI999bhL+rgKFI8MQa2M6xTVFz
         S42QKANR59M7stBYi966NgAmBaD8HGzujLeWPAIMyk5FqY9WkZSnwpdYApRH3BNNjbkS
         Mqmh+kU1GkZpUK8mjTRr79qFTdWiJLks6TtD5lUzcjlZMzvm+7Le0OPljeOsGKGi/7/j
         WJC56PFyZr84YmG5j0EP3kQO7Vpi7J2hSwjX9eWCxIR03aLlk3HRwrbXEproum01uck+
         4kFVscarC4mgyetRsd93cxyVGS2CoyDFUEzpqapuhK3bKaQuPsDlvV0Uj4OwJvKPdcWK
         oWBg==
X-Forwarded-Encrypted: i=1; AJvYcCVwFmo8g+PLVKLPz+jv2uYSQZ52ZcK4PGxCcMHoM9L40oSyhT2RBEIzntv8/jFpfCi6gA8Jko7YPpw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/xSNbS3w+FoCWpUoNh/E203V13Uorg5fnupUy817J2fzIOVFs
	aDd21HijYy5gysMxsPJH/tlJDSg1X/rQnreK/OPdlNcJFPILVqwfe89mGX1Bsls=
X-Gm-Gg: ASbGncuZi6vtYaNMgv1pkArUhXSJHUjh6i+zlGuptqxktLZcebO+NTr6Dn4CKh9uwND
	fHfHj1X8LAzIcCla+m2hpUHraJELzfbQg0g9hodaYVeCfKDe7s2qgmX2qfJcaiWPDQcyUK+WLqk
	VxN3eYk6EinkSmuv+H1LNCVPFbRrBp+BY62MHT9YcWj7yH2qdxXAy97jZR3zUNrHtq481b/sKZJ
	eYslTboXdbXuGMBd1zNlMgYm5YB0jnQZrVLBJ4rVqfIPf1KJhs0IeXSUm+eMmIcJOR733mAwmt3
	Dh498KgC0Rf9IZ2MsDbMPQDbu32v1N6Ev8n930cHI7anIyUvNYok6IOiFzSo7Gmfo/VSuzVtsUE
	FtvFsSUysSg==
X-Google-Smtp-Source: AGHT+IHJJNPW2W105EM5DK6F+bhsO5kf+WWcf/t540sAKpSVBUDw7Klv3H30ZCpqHF31QfIH8y+w2w==
X-Received: by 2002:a05:6000:4283:b0:391:40bd:6222 with SMTP id ffacd0b85a97d-39cb35958femr2009722f8f.22.1743761610247;
        Fri, 04 Apr 2025 03:13:30 -0700 (PDT)
Message-ID: <16da47b7-f11c-4cc5-aa60-70aa32932910@citrix.com>
Date: Fri, 4 Apr 2025 11:13:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: drop XSAVEOPT and CLWB build flags
To: Jan Beulich <jbeulich@suse.com>,
 "Alexander M. Merritt" <alexander@edera.dev>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <3de09e4e2a3320e0f314803e349fbe6520d04b12.1743719892.git.alexander@edera.dev>
 <046801a7-1990-4629-a8ec-395c7fb233af@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <046801a7-1990-4629-a8ec-395c7fb233af@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/04/2025 8:21 am, Jan Beulich wrote:
> On 04.04.2025 01:22, Alexander M. Merritt wrote:
>> The new toolchain baseline knows both the XSAVEOPT and CLWB instructions.
>>
>> Resolves: https://gitlab.com/xen-project/xen/-/work_items/205
>> Signed-off-by: Alexander M. Merritt <alexander@edera.dev>
>> ---
>>  xen/arch/x86/arch.mk              |  2 --
>>  xen/arch/x86/flushtlb.c           | 28 +---------------------------
>>  xen/arch/x86/include/asm/system.h |  7 -------
>>  3 files changed, 1 insertion(+), 36 deletions(-)
> For XSAVEOPT there's more work to do, even if not connected via HAVE_AS_XSAVEOPT.
> Look for "xsaveopt" (case-insensitively) in xstate.c. Imo (just like was asked
> for for the RDRAND counterpart patch) this wants doing all in one go.

I've got a different task pending for xsave.  It's a bit more involved
than simply dropping the -D's.

We'll get to it.

~Andrew

