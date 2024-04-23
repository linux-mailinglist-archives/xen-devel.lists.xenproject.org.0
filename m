Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6DA8AE85F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 15:38:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710639.1109961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzGLw-0001Xg-Ua; Tue, 23 Apr 2024 13:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710639.1109961; Tue, 23 Apr 2024 13:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzGLw-0001Uu-Rq; Tue, 23 Apr 2024 13:38:32 +0000
Received: by outflank-mailman (input) for mailman id 710639;
 Tue, 23 Apr 2024 13:38:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ck89=L4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzGLv-0001Uj-0q
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 13:38:31 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c49e040b-0176-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 15:38:29 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-343e46ec237so4802634f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 06:38:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f17-20020a05600c4e9100b004182b87aaacsm20337472wmq.14.2024.04.23.06.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 06:38:28 -0700 (PDT)
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
X-Inumbo-ID: c49e040b-0176-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713879508; x=1714484308; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B2diVjbF4sgf3A2o6JPixdohkCOCnMsj39VWdEppLsc=;
        b=SX5b1z9pGbd0Sz8RF99YOOiSlWQRNL5ur+0ndhs/WxA6spJoyg2O/tVJWRfpv25pKC
         13Z09jVvhovHOhwmHSBZNC0O3BpEnsakRdRZMhKp3jF2/9uRt/RTXcAxGaTuf3ya+hPz
         DqdOXGlhaDkp0V/IUNlOxD/ZPOgXcvu7KiJDhG2zT05UnM7AG4P3wlPVDil1WzXwkQr0
         cdPPAdc1tkqliO8nzQc8tDjKbrTEhYaQKDzJ7Ez4t2igKTW+4O3GMjhjKfYPlHIAKr01
         OqA+NUgn3YWTo1dbCYFBs0zpqshuZb2chJyLKZ+34xoLZfJtFe/eX6I8ykMamjSJoUc9
         uIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713879508; x=1714484308;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B2diVjbF4sgf3A2o6JPixdohkCOCnMsj39VWdEppLsc=;
        b=WuWk1av8us1dh9I/BHul0bEBZ8z97PP0RRQeqCLlHKq0AodwlDt4YM4CNrwMkXCNo1
         Nt3dVOPoCGsvrDIho/kijdoRMEZuzDKIoyYOXULIJyD0yQOvOXyLNM70/yusGjVuyzwR
         ny2HZihZa2NMTp4Nj1v4xhQeFONmk2rHv+F10WI+0O6W0dmSRHN+OyFZ6BGLf6tE8gaJ
         8qEQ65ym9BqeybT9c02YCZHyrqsUfXDbDJ0YJbw8akXj7dEvBC4Y3UOwEiu9TTr/B1Fw
         GNiKGll1MGRtHBR/+ozViH1QavlyYOI2IZB9qG9DglbFLU/bNjxwBzE02fFnlaXYR38E
         ETAw==
X-Forwarded-Encrypted: i=1; AJvYcCU2yBKGM/MmekGyEgJtCHw5OWGB6V6KUdp2fwEURiA+1MNnVnm5Z7PP6O/pjC+F/p5qEIAc7G1/6PA6bUOYr5YWnqte4Wu/GoYbWSrV6OU=
X-Gm-Message-State: AOJu0YyrELMQbHlfH04/B5zcuPTnatfJ97FXuXo+npbrQuvSjn12UNOI
	2uPXadRf6t8ikkOn3tNzGBWW2i0xbOJPwxmhXusoqelYxtaS3a4HYU/T+0vdmg==
X-Google-Smtp-Source: AGHT+IH4Wx5LpAyGmmVjXEVqgzed+DD6QvuV4FYNkqSD+QU98twadyVCnQk7p0UGSoiJojfzAYPnAA==
X-Received: by 2002:a5d:64c3:0:b0:34a:751e:24b4 with SMTP id f3-20020a5d64c3000000b0034a751e24b4mr11341313wri.42.1713879508332;
        Tue, 23 Apr 2024 06:38:28 -0700 (PDT)
Message-ID: <7bbc733e-2630-4970-8ee1-dea3843c516b@suse.com>
Date: Tue, 23 Apr 2024 15:38:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] livepatch: introduce --force option
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20240423131249.29825-1-roger.pau@citrix.com>
 <20240423131249.29825-3-roger.pau@citrix.com>
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
In-Reply-To: <20240423131249.29825-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2024 15:12, Roger Pau Monne wrote:
> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -2125,7 +2125,8 @@ int livepatch_op(struct xen_sysctl_livepatch_op *livepatch)
>  {
>      int rc;
>  
> -    if ( livepatch->pad )
> +    if ( livepatch->flags & ~LIVEPATCH_FLAGS_MASK &&

With parentheses added here (which presumably could be done while
committing)
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

