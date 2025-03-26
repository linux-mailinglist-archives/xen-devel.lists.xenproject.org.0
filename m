Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AA0A71880
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 15:29:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927887.1330640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txRkX-000447-EH; Wed, 26 Mar 2025 14:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927887.1330640; Wed, 26 Mar 2025 14:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txRkX-00042r-BW; Wed, 26 Mar 2025 14:28:57 +0000
Received: by outflank-mailman (input) for mailman id 927887;
 Wed, 26 Mar 2025 14:28:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txRkV-0003uH-ST
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 14:28:55 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4f444f0-0a4e-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 15:28:54 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-391342fc0b5so5273922f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 07:28:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9e6767sm17378192f8f.66.2025.03.26.07.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 07:28:52 -0700 (PDT)
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
X-Inumbo-ID: a4f444f0-0a4e-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742999333; x=1743604133; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BUfy8qftYVHn7/b16DFSQfFUOc8ljg2sj5ZAD9BLnrE=;
        b=FUISjdho1TkOTmKPZVwpy59ecMr/fvS7OtdN6J8svElbf0LKiblikPMulIM0q2xRmM
         SZY/JT2enm6eAgujp3j2g9uYfwmUU2q4Cb2X2ayRJ5VqqIPrd4e24uI4Ejgx4NMdFg/Y
         0JXa37ZONZk9dP8jy1u0OhcjGq3xj0b1IzG6DrMHOX1MlSPevlaYrgqh7PlUrAA8DMno
         Vl0g3HlG4Srinh5dRr0ujA6EnFCoqNKVCAyXkwfu/uFV9+qIt8aiKKc1U2zaHhtwxwxF
         y8KY07cPq9sgnzlhHoxDSATkCF+uhYL131M3UkDt4nHMMge/KbynrePDgHkjbNByAdOP
         CM3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742999333; x=1743604133;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUfy8qftYVHn7/b16DFSQfFUOc8ljg2sj5ZAD9BLnrE=;
        b=jQWsBCJ2xCuIBIjSwN+hD4FU0eicHdHJq6jhf7XwiAY2rNcxWnrWTn1RqlDaU4t+Jl
         fsBWFY99BUy7HV9F+801FtnczExveRl6mwiCoYdlgMOo/dGUhBZ49PsESyhRe6bh3Vho
         0ZU5qVFoh5IMXEfou4RlgCNI5xDfEe7WfJXwk6klUD9OizATvBB1BVmFrGDS8fCb1RKC
         1jbcH8RpCTajfw4WGz4ZjkXuFG6OGGmRsqivJMk9MmANuOmz6OepYh7vJCi33EuKPV8w
         ljpAXkkZRTENZOLHMJu7ZaljcTYX84jpix2xP/jC1lxYoReXe+pWaPumRuCb0rmNu7Nm
         ePlw==
X-Forwarded-Encrypted: i=1; AJvYcCUAVK8mCUekEx4lF8mU1B2voMRjjUQQOYqwXRniy8N5QxvZ2/+CSDU/qatmS6shx9Il/HGzoIvyo0E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygOu+RT8MTONQBwuu6ANaQsW5ReqrUtHwL0HZqeLKaj07vum54
	p3uzQ9+sKQf6yhAUwyGQu0L6IbKmRPeIPZZlmxn5TqOurHA3VBOR1YyjZJn71w==
X-Gm-Gg: ASbGncuQkZHuocT4nrERvX4ewKM4vcXx2J7Bvm1PbnrQ5W190ZEc7BOBexthZ7n6tNX
	4PJlZjoQbJ+jeyZlBFl0uKNN+zxQtfgd/+iiH8W+bCqZnvfOVQQYrmIjQIl7Dq+m3fiUXrRI4aN
	+o7GIKEHemcF3GsKFevklGKBOm0Xqsjn9nRghpWRw0Kia7aJ49xxa4STjcwy6r9Vd1MnntCMD28
	m0AqeZ0+DD4TgBp2j4bCuGMS+p52musOQArLueNqnTKZk8y4aQT1ub1SEoyf39bSLsZ6OXv+xGW
	UlFdZQbMrj/e8kkNuvyURGMJZyQGd+dcSbV5djBE3JdBWq+4RrzWrQ6o8iUYjRH/d/crVDYEt8a
	5gxy8DOU2SWhtg0EsJLWBAqQtkKuJQQ==
X-Google-Smtp-Source: AGHT+IFVW/d9ZoN5MnRye5q81busFUlszje1JhW4SWbqYP3jjM/f4HiMEDk+OHAGii1SXIw13xnIkA==
X-Received: by 2002:a05:6000:1faf:b0:38f:577f:2f6d with SMTP id ffacd0b85a97d-3997f8f8bf3mr19492707f8f.2.1742999333415;
        Wed, 26 Mar 2025 07:28:53 -0700 (PDT)
Message-ID: <7ffe0195-6613-4133-85d4-269a9aca8e00@suse.com>
Date: Wed, 26 Mar 2025 15:28:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/8] xen/console: introduce console_set_focus()
To: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250318233617.849903-1-dmukhin@ford.com>
 <20250318233617.849903-8-dmukhin@ford.com>
 <ghk1LVqSlfRNlEVBf6gQ3AdtBxBBtVSHp_Q69C-vkC1y5wexc4AF-SYXzRIFOaIhnIFZsuAorjAWCRqDDsyb-x0mcVzn2fFS-KWzd3qaW-U=@proton.me>
Content-Language: en-US
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
In-Reply-To: <ghk1LVqSlfRNlEVBf6gQ3AdtBxBBtVSHp_Q69C-vkC1y5wexc4AF-SYXzRIFOaIhnIFZsuAorjAWCRqDDsyb-x0mcVzn2fFS-KWzd3qaW-U=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.03.2025 20:53, Denis Mukhin wrote:
> On Tuesday, March 18th, 2025 at 4:37 PM, dmkhn@proton.me <dmkhn@proton.me> wrote:
>> +/*
>> + * Switch console focus.
>> + * Rotates input focus among Xen, dom0 and boot-time created domUs while
>> + * skipping switching serial input to non existing domains.
>> + */
>> +static void console_switch_focus(void)
>> +{
>> + const domid_t n = domid_top + 1;
>> + domid_t i = ( console_focus == DOMID_XEN )

Same issue here as ...

>> @@ -1158,8 +1145,8 @@ void __init console_endboot(void)
>> register_irq_keyhandler('G', &do_toggle_guest,
>> "toggle host/guest log level adjustment", 0);
>>
>> - / Serial input is directed to DOM0 by default. */
>> - console_switch_focus();
>> + if ( opt_conswitch[1] != 'x' )
>> + console_set_focus( get_initial_domain_id() );
> 
> Forgot to drop extra spaces around the function parameter.

... you noticed here.

Jan

