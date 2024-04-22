Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9125A8ACA92
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 12:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709866.1108881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryqtL-0000PD-MD; Mon, 22 Apr 2024 10:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709866.1108881; Mon, 22 Apr 2024 10:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryqtL-0000MU-JI; Mon, 22 Apr 2024 10:27:19 +0000
Received: by outflank-mailman (input) for mailman id 709866;
 Mon, 22 Apr 2024 10:27:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jl0+=L3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ryqtJ-0000MJ-Lc
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 10:27:17 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e385ca36-0092-11ef-b4bb-af5377834399;
 Mon, 22 Apr 2024 12:27:15 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41a7820620dso2964275e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 03:27:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u20-20020a05600c139400b0041906397ab7sm12416325wmf.3.2024.04.22.03.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 03:27:14 -0700 (PDT)
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
X-Inumbo-ID: e385ca36-0092-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713781635; x=1714386435; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WisiX6+jcyLG2U2fy5jIdMkkxNbr2eYg1+N5ikjIce8=;
        b=JOi2qE21akuk0JkJRDtcT2c1A8iFlXJVJk0zameUOpVvFZ8C6iRrYW1ZIDinHjE2YG
         Xce71bc0tmBK+27j0Evgz+Ax9hTUNXDFr73usHyJRpfLa23sPTagwfIg952p+O2npKzC
         7QiH1hQJ4RsB1H98Or4d9RbntUwyKOkqK0a831NfX3voz+XwSP/oKNZxyyTCW4I02Q07
         EizyHxbXDSxenuWLdaRBm4oRSl760VBRFFBV/Lrs6+7SdSIyzW4TPlCvD1iKInRNZ/xL
         2OzWUB0ASo5u92AZLfwCHRU0X0YLkxVx30EXMZIpHPbd/G/mioetqjJRxdHtA7EhHERT
         uOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713781635; x=1714386435;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WisiX6+jcyLG2U2fy5jIdMkkxNbr2eYg1+N5ikjIce8=;
        b=WAiD5wKJbdH3ZB/hpIMsk6NkWIQX+KwiPwcztYoy4yOxge4wS2aCq47OEXXIyomcZs
         inDQDuws+U2lKf49TUnn1OffRtywb9+ekeQGwQ11cMlIk0SVCF6pPZXDgOtxWh5/Dkuq
         PbS6ufrA91lT0ZltrSMFsxioftcnSWF5TeaJelFDn6968c2x9fhw+x8786GJK0uazmj5
         eehpOHqS+uuDn2xIJAeT/M4Z3gobcyjkyGuITdGPQGbe2hWeB1l1t9eOJZyJ+XWJGlTi
         w4nKkWZzEoHinAUUlRJdFfR9jCbsljwOgqwf2rp7DlDv+Cf5w9+w18J0IlL9MXKgl76+
         7wTg==
X-Forwarded-Encrypted: i=1; AJvYcCVX7LfD3/PSsmRVuIsoiqMqGtZ2kFoJp6PGVVZEooI60Y+Gw0Y1vuKODswlrYqzZ0w4xQgbenkgubYU/sgH/7LsJOuKL6T+c5C6sgivKg8=
X-Gm-Message-State: AOJu0Yw+GXeVLcsjn3En+BaNusH+8S56f8FaPgtgCZA1BEEsCTpMkwM1
	WEwezmBNduxfV+ywsR7p6bolzGrtuPLCGudzWHOY8LIh06jSFIF90RxPgYUSW8lqnF5Ku5U5Zh8
	=
X-Google-Smtp-Source: AGHT+IH1SX99MexRBvNyavhjrPD4EQOfZ4U7hreXbpmYTR/kW8zyJ4kKEUrKLDqVz7pizbpvHau/nw==
X-Received: by 2002:a05:600c:46cc:b0:418:f991:8ad4 with SMTP id q12-20020a05600c46cc00b00418f9918ad4mr7689405wmo.6.1713781635015;
        Mon, 22 Apr 2024 03:27:15 -0700 (PDT)
Message-ID: <c850946d-2679-4711-84ec-7442c3ce918b@suse.com>
Date: Mon, 22 Apr 2024 12:27:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/pvh: zero VGA information
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240422095216.20211-1-roger.pau@citrix.com>
 <20240422095216.20211-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20240422095216.20211-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.04.2024 11:52, Roger Pau Monne wrote:
> PVH guests skip real mode VGA detection, and never have a VGA available, hence
> the default VGA selection is not applicable, and at worse can cause confusion
> when parsing Xen boot log.
> 
> Zero the boot_vid_info structure when Xen is booted from the PVH entry point.
> 
> This fixes Xen incorrectly reporting:
> 
> (XEN) Video information:
> (XEN)  VGA is text mode 80x25, font 8x16
> 
> When booted as a PVH guest.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



