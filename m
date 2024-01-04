Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E5C824771
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 18:26:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661870.1031614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLRU2-0006pO-Tn; Thu, 04 Jan 2024 17:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661870.1031614; Thu, 04 Jan 2024 17:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLRU2-0006mo-R9; Thu, 04 Jan 2024 17:26:18 +0000
Received: by outflank-mailman (input) for mailman id 661870;
 Thu, 04 Jan 2024 17:26:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wSyo=IO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rLRU0-0006lw-UG
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 17:26:16 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c8902ad-ab26-11ee-9b0f-b553b5be7939;
 Thu, 04 Jan 2024 18:26:14 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40d604b4b30so10227365e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 09:26:14 -0800 (PST)
Received: from [192.168.86.29] ([90.242.36.164])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c450e00b0040d6d755c90sm6330811wmo.42.2024.01.04.09.26.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 09:26:13 -0800 (PST)
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
X-Inumbo-ID: 5c8902ad-ab26-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704389174; x=1704993974; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zl3s3dm8rgvRqhVkji3JDLLBa2an6jmyOkMJ3GTxoiQ=;
        b=umwUSr7sI6VH3u99zZ94mmPzPwmm2BY6eBCH6MS06AQ4yZneIjA1gislW39Oulu/W4
         GIueG/0/yThJVGCDsF3qkAWEu8CXedA7bBXrkuR7d5NZUaYjbuQyMpHxZq04Wu2D6A0V
         zNIeaM8u4MBj8x8w1SstFRFxQvjL+/yeoKhhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704389174; x=1704993974;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zl3s3dm8rgvRqhVkji3JDLLBa2an6jmyOkMJ3GTxoiQ=;
        b=NM22tCOv3UREL6ak27VgTFCuGWuBswztmZNFceSiWmMWY5Rime5RjhKvVM9WvVxTU2
         LOxfWDEe/Z1RhF3wvgvGyPhP/3huO0mWkNtBqbxHUkcFptNyPmi8IU/gE+8XQWhppYAH
         c0HenAmrz30p0P/k8P1zvGz0SHRdNS+fdH5ghtaXbTtBKs8sUxjIkuf0oJgaNyNYQ5O4
         Cja0IKPAsxb9qXlOExNQG0Ek9SZjeb2A3BNCtdFR9ZD7P1mwRLY7kKxLbK6W9qJIJLqh
         +5QfFhLtDa36LNDo0E/bDGXAMDbtnSxT9PlwuhBQN+DzqV+UI//i0UKLEUiBvRmJtvxx
         a2tg==
X-Gm-Message-State: AOJu0YyL2RF1RLJCidJWqAeTzs4lCvqJq1himQqcL6q/3vyVIc25oQUS
	LjzRzQsyBQT6SySo1VH/CqDbfUE55tRN3qnuF4NUpSV6aIOMMA==
X-Google-Smtp-Source: AGHT+IE89bsOaI0SdhH2tMVtXiL5KJu0ZMySsYAIDo5PQrmJfDDQXJesU+7YhAtKGOYrMUkRD5pEXg==
X-Received: by 2002:a05:600c:1f88:b0:40d:5c50:f76f with SMTP id je8-20020a05600c1f8800b0040d5c50f76fmr574673wmb.158.1704389173981;
        Thu, 04 Jan 2024 09:26:13 -0800 (PST)
Message-ID: <b19936ee-a5cd-4b3a-8435-9fc3151fc7ef@citrix.com>
Date: Thu, 4 Jan 2024 17:26:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mwait-idle: fix ubsan warning
Content-Language: en-GB
To: Tamas K Lengyel <tamas.lengyel@intel.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <f0ac3890b5e2e1e98bfd3fe5fffcf3c3c031e12c.1704388276.git.tamas.lengyel@intel.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f0ac3890b5e2e1e98bfd3fe5fffcf3c3c031e12c.1704388276.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/01/2024 5:13 pm, Tamas K Lengyel wrote:
> Fix warning:
> (XEN) UBSAN: Undefined behaviour in arch/x86/cpu/mwait-idle.c:1300:44
> (XEN) left shift of 15 by 28 places cannot be represented in type 'int'
>
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> Fixes: 5a211704e88 ("mwait-idle: prevent SKL-H boot failure when C8+C9+C10 enabled")

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

It's perhaps worth saying this is in sklh_idle_state_table_update()
which is why it only manifests on a single CPU.  Happy to adjust on commit.

All other uses of this constant shift right first, and then mask, hence
why they don't trip UBSAN.

~Andrew

