Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9693179F30C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 22:44:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601623.937729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgWhv-0005kl-0K; Wed, 13 Sep 2023 20:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601623.937729; Wed, 13 Sep 2023 20:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgWhu-0005hl-Tg; Wed, 13 Sep 2023 20:43:30 +0000
Received: by outflank-mailman (input) for mailman id 601623;
 Wed, 13 Sep 2023 20:43:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VJSs=E5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qgWht-0005hd-4a
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 20:43:29 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30c0d3cc-5276-11ee-8787-cb3800f73035;
 Wed, 13 Sep 2023 22:43:27 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-401c90ed2ecso2761795e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Sep 2023 13:43:27 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v13-20020a05600c214d00b003fc16ee2864sm85104wml.48.2023.09.13.13.43.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 13:43:26 -0700 (PDT)
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
X-Inumbo-ID: 30c0d3cc-5276-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694637806; x=1695242606; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2cP/HuQGwBjPzdptzfINxiTBZUDLm/3WoHcnGK2QCIo=;
        b=otS/6kGEp986MLYDhZHUU5SYd/MvM/+OaZ+Hb9BUFYw+lJidEMfRXo+PwjDGStNP6Z
         0vPUje6f9nIczGvLg699+JmjrSSKwCI1x1B9VH1WABOlFtMnXscG8sluvADA6QHR2Vr6
         raTCCHgbKuaOvN/icOCgepyCovKZUw3krDLBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694637806; x=1695242606;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2cP/HuQGwBjPzdptzfINxiTBZUDLm/3WoHcnGK2QCIo=;
        b=Knv6xpHRvZdL3IlMatuFXgnaF+1QrdBJkIFuM2RZtWo/ceefrGRVboA8/7+DsAAWtn
         k1c9mWBcMzr2G6B4SzV/Fzr9w0F7B9P1ljKRI/SUSTEiny9xPZPMiKlGiPxbL4+5ZrZ2
         iwW7pElzpYCZCb4KcN7GUwSQWUMr/S55hRUQ01gzHqYyo5732NUwp1/YNBirSCdRwO5E
         mxp+LXABBK2kIinU4u9ITdApfIaqJeI1oCiwQscjwnNbpBYJYw5U4M/3UJWYWLtNDCnb
         F9/128x40GsDvZaRjkiUVaMlEaFmIG+tuiA4aMARwg7+5fTMWFXrIy46+uE9wCZIYIHD
         KNJQ==
X-Gm-Message-State: AOJu0YyvAkikOUj1DOGXrqzaU4zIMtU7asE61uJtinZlGY994/oVO9+N
	+QghgvLrsbQ47lDiN4DOVbyBTquwpiCa5QpFeJU=
X-Google-Smtp-Source: AGHT+IFdXudZT/AlBlIydwwpcRT/G/fYgzJUS5xpbRFdmTNvJ37l6oE3SHcUeGzxL/g1n0MwXLghXg==
X-Received: by 2002:a1c:4b0a:0:b0:3ff:28b8:c53d with SMTP id y10-20020a1c4b0a000000b003ff28b8c53dmr2848643wma.33.1694637806632;
        Wed, 13 Sep 2023 13:43:26 -0700 (PDT)
Message-ID: <a4f616f2-d371-0cf8-6173-4231d3d4b8eb@citrix.com>
Date: Wed, 13 Sep 2023 21:43:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 8/8] x86/spec-ctrl: Mitigate the Zen1 DIV leakge
Content-Language: en-GB
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
 <20230913202758.508225-9-andrew.cooper3@citrix.com>
In-Reply-To: <20230913202758.508225-9-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/09/2023 9:27 pm, Andrew Cooper wrote:
> @@ -955,6 +960,40 @@ static void __init srso_calculations(bool hw_smt_enabled)
>          setup_force_cpu_cap(X86_FEATURE_SRSO_NO);
>  }
>  
> +/*
> + * Div leakage is specific to the AMD Zen1 microarchitecure.  Use STIBP as a
> + * heuristic to select between Zen1 and Zen2 uarches.
> + */
> +static bool __init has_div_vuln(void)
> +{
> +    if ( !(boot_cpu_data.x86_vendor &
> +           (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
> +        return false;
> +
> +    if ( (boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18) ||
> +         !boot_cpu_has(X86_FEATURE_AMD_STIBP) )
> +        return false;

Bah - this serves me right for positing before waiting for CI to check
that Naples picks the right default.  The STIBP check is backwards and
will mix up Zen1/2.

I'm going to create real is_zen{1,2}_uarch() helpers in amd.h to avoid
opencoding this heuristic yet again.  I highly doubt this will be the
final time we need it.

~Andrew

