Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A40934ADE
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 11:26:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760323.1170133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUNOw-0001Jx-EJ; Thu, 18 Jul 2024 09:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760323.1170133; Thu, 18 Jul 2024 09:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUNOw-0001IM-Bg; Thu, 18 Jul 2024 09:26:14 +0000
Received: by outflank-mailman (input) for mailman id 760323;
 Thu, 18 Jul 2024 09:26:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sUNOu-0000hm-RZ
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 09:26:12 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6011bea-44e7-11ef-bbfd-fd08da9f4363;
 Thu, 18 Jul 2024 11:26:12 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ebe40673e8so8917231fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 02:26:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cb77a55bfesm152010a91.26.2024.07.18.02.26.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 02:26:11 -0700 (PDT)
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
X-Inumbo-ID: c6011bea-44e7-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721294772; x=1721899572; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=52IvWEgtK2wuF5TGeiD6QwAwWM+5hNcAQTVsv8nZvmM=;
        b=aCeeCzWx2cXF+UdzTK9P1BeTNPMZocIvVV1f4n8xGNmomPDDv/TRMRW82hwGcYW8lJ
         kuDndMIrmqsaS65PwlPVh89umRzqrHeYc42GODWTQhtoCnNLtfgsm7Ju7AQvnm+zqa68
         5280TvDuHfP9RB+hgVzd+bYDnwHxSXRVRD11CIzCcyKP+Os1c/qhD0JijpX+GUy7Oep9
         tdL8+JO0EHXuFWDFGKphJJBAnZGSDt7ilK+tfLLAm+ggLTWzSdDla2jZX28Z8r0ZfyiY
         WxMvrTTHqSDOdRUkP6BuOIBjAcHGv2mMnKh1Rd0h0Cd45jqQVn6YHrpIaEuXYKYijOXZ
         dwEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721294772; x=1721899572;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52IvWEgtK2wuF5TGeiD6QwAwWM+5hNcAQTVsv8nZvmM=;
        b=uexboU8kQHzDYBT1qmeQsRrRqo/r0pyuTMZ9/5zFYQU8k1k5+e43IQCZpf1TMF70Pu
         moxZSlxrmiD2TiutBhl7XAdIuA5lZx+CdogdEX1QqSqiwHLFRiM22vLLdxZXl3i82hgf
         DSRz4oSpwKGCXp8aya0Gq3WRxb5rmR4IE7+Zhwq+UrPLRAJRFIPNxz9RexBn+H1eSe+4
         rwQihQ+6gLck9Qhfc3H+PlXnAuF4li/zWmQozIekLNHnZfbYm4Gl2EQ0gfi+51I2Mm+Q
         jyEhlIgh5pIVSicB0AnfGp3GKlBSB7W4/2BB5Wq/GWOByZ0i3Y6PhR9YTjjT59V5k0q3
         Crew==
X-Forwarded-Encrypted: i=1; AJvYcCUZe9PPR/hv9tDPFyVsLhx4JpZHUGCploZjaraJNTCKVSjySJMHuJxfPOBxU2q3+7ke7VPIpCaaxw2yX+HO7wPfQW2hLY9lFrIckuaf2O8=
X-Gm-Message-State: AOJu0YzyT9Hv27goFyvwWuWrOluLwxRjcIRqxWyg2D5TX1ocQqNWKCLv
	oN2L8xNbixWNSh2sDkrunixSduFRPLcWWGTkTJDNmKZPjtEEHnOtP+WukRp8jw==
X-Google-Smtp-Source: AGHT+IGHnrLzHOtmBbaaYHi38hRuxpBG9GEHcl6PhravbG/zao/VppQNo4HZ/ZauQ07IykoItEYlog==
X-Received: by 2002:a2e:81d5:0:b0:2ec:4487:6a8f with SMTP id 38308e7fff4ca-2ef05d2f53amr12672161fa.37.1721294771734;
        Thu, 18 Jul 2024 02:26:11 -0700 (PDT)
Message-ID: <aee63222-5394-4ff7-9b15-bf9bfd6c11df@suse.com>
Date: Thu, 18 Jul 2024 11:26:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/mm: Move base_disallow_mask into __ro_after_init
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240717161415.3586195-1-andrew.cooper3@citrix.com>
 <20240717161415.3586195-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240717161415.3586195-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.07.2024 18:14, Andrew Cooper wrote:
> base_disallow_mask is calculated once in arch_init_memory() and never changes
> thereafter.  Write-protect it at runtime.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



