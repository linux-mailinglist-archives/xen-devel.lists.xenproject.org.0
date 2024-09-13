Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26859978883
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 21:09:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798442.1208682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spBfF-0000Dj-O9; Fri, 13 Sep 2024 19:09:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798442.1208682; Fri, 13 Sep 2024 19:09:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spBfF-0000BA-KP; Fri, 13 Sep 2024 19:09:05 +0000
Received: by outflank-mailman (input) for mailman id 798442;
 Fri, 13 Sep 2024 19:09:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mG44=QL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1spBfE-0000Av-Rd
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 19:09:04 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3c87862-7203-11ef-99a2-01e77a169b0f;
 Fri, 13 Sep 2024 21:09:03 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c26311c6f0so3223061a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 12:09:03 -0700 (PDT)
Received: from [172.31.47.100] ([193.118.249.27])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd8cddesm7930441a12.88.2024.09.13.12.09.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 12:09:02 -0700 (PDT)
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
X-Inumbo-ID: a3c87862-7203-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726254542; x=1726859342; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oyrv/otV4YlBU8m9SrBrqp5wCfnHXk4Xemi18QkUdcg=;
        b=M8k5invB/s+VZGhknYoF+J8bkUkTEJQecn/UBAtvUK1LbTtIkZsoPwF0EQ0Wt3MELm
         JIdHDaTaYCmtSu/gECQ6Twrs2houlXPgj00IBgMP3bv9dNhuoKNPR9k6T4bEUUEPgQ2L
         rGICXhQBP/C7SL3Jxe9r9HPqfhp9WuaY7328tiWDHi1hG/gkcgolZcC5PMsqVKiiQt0i
         I1/a57AScvcK2mQJsZNGNIYyK3va4W2nWgHjksORYJWOhVo5TJMH6l4hdabN/VeNfMZh
         SigSiZrnJ2I0GgKBBXI5/8LTfaqXxlWqHhVR1BCZbppZY961JteQNM4WwfePtRUCHw2V
         aXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726254542; x=1726859342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oyrv/otV4YlBU8m9SrBrqp5wCfnHXk4Xemi18QkUdcg=;
        b=g6ub731TQCBxevGY+D955ldHKE91MMfEqai3fEaYD1nyQj6cjILyxsiEGYBr+xDazz
         BYvMNC1UU+Y/D/B0FzR+LIqzLKl4/Cq1+vOpHKVUQqKUBmUVr7vQnxQVc8mcYaazDEas
         cow076TRp6qjK7Fp508oQPtfCAfm6IrGcbxMtyN9cKqRndDzsUNRat2R8embHQwGjhv+
         akWm/0H098NMuzn+y4LlEG62OJw9XmNDTo0VTlNCETz0QQFHYGsujReB9T9MIwP/vQ4m
         e7Qrwm0gX7hIdgZFWALm+1xe7uwuPhJFIW97dbllbKiehW4BM9bwmKVvt79FngqJ4LCp
         d9VA==
X-Forwarded-Encrypted: i=1; AJvYcCWOU5+pz104cdwVXhw9LM1sf+lL96HN1ZoaPkvpZsZZwk3JcfVZOgleSs1v7QW8CJAm1UZ09zMlyz0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUGa6RIWlshMHFN2JM0nhBBfcmoWHAdNlO8/aLofJ/AadH2wxl
	UpHBTy0LDdoj8E7iV+8qEXj1KmVrbpQ4/r3ytYuInMa7/9nr25trBxOgydyF2g==
X-Google-Smtp-Source: AGHT+IEU/++TCNlP1JnQX+Gw/+AdYIbo5GX4AptREqq1IRqcYDY4c6/PdV88B9cSXfXITjv0Mt/TNw==
X-Received: by 2002:a05:6402:1f0e:b0:5be:fa43:8017 with SMTP id 4fb4d7f45d1cf-5c413e1eecbmr5784638a12.16.1726254542449;
        Fri, 13 Sep 2024 12:09:02 -0700 (PDT)
Message-ID: <f60ae654-b893-4262-bb96-ae611492af55@suse.com>
Date: Fri, 13 Sep 2024 21:09:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/ucode: Make Intel's microcode_sanity_check() stricter
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240913142142.1912844-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20240913142142.1912844-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.09.2024 16:21, Andrew Cooper wrote:
> From: Demi Marie Obenour <demi@invisiblethingslab.com>
> 
> The SDM states that data size must be a multiple of 4, but Xen doesn't check
> this propery.
> 
> This is liable to cause a later failures, but should be checked explicitly.
> 
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/cpu/microcode/intel.c
> +++ b/xen/arch/x86/cpu/microcode/intel.c
> @@ -155,10 +155,13 @@ static int microcode_sanity_check(const struct microcode_patch *patch)
>      uint32_t sum;
>  
>      /*
> -     * Total size must be a multiple of 1024 bytes.  Data size and the header
> -     * must fit within it.
> +     * The SDM states:
> +     * - Data size must be a multiple of 4.
> +     * - Total size must be a multiple of 1024 bytes.  Data size and the
> +     *   header must fit within it.
>       */
>      if ( (total_size & 1023) ||
> +         (data_size & 3) ||
>           data_size > (total_size - MC_HEADER_SIZE) )

And luckily get_totalsize() guarantees total_size > 0, for this
subtraction not to underflow. Maybe worth also mentioning in the
comment as you adjust it anyway.

Jan

