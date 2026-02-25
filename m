Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KTsK+YYn2n3YwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 16:44:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20167199DDE
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 16:44:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240879.1542127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvH3k-0004xK-3d; Wed, 25 Feb 2026 15:44:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240879.1542127; Wed, 25 Feb 2026 15:44:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvH3k-0004uq-0N; Wed, 25 Feb 2026 15:44:20 +0000
Received: by outflank-mailman (input) for mailman id 1240879;
 Wed, 25 Feb 2026 15:44:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vvH3i-0004uk-AQ
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 15:44:18 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d450023c-1260-11f1-9ccf-f158ae23cfc8;
 Wed, 25 Feb 2026 16:44:11 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48374014a77so72192695e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Feb 2026 07:44:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d4c95dsm38399331f8f.33.2026.02.25.07.44.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 07:44:10 -0800 (PST)
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
X-Inumbo-ID: d450023c-1260-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772034251; x=1772639051; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qf1diTV+XMTRLAJu58Llknk3XAlVZyP3bnTceXRXR5E=;
        b=OJLvr6RKYYvDju+X6IQCbkVujE+Q5DiDwuR3mtmpHam7nmLVMcWdrb9iVRuocKtEKy
         GHcOR9ou8GD5CdsBDBN5yWRg60bSf69INWzNjRAHU8OlV3IYfrStlXbxBg7MrpcFUOes
         uR+EW1Ob5WhrjF4145oP0gJ65Mb8Jj9tVLCs+jXtiTW5PwM63Q3SlDVhkXdFAfC3ZVjv
         QGI61/GS0RH0ys66vmPtHRj2vXzVUh2Zezhif6AQfU59CGUUIcD9Ii+eY/fyiGxOD+PL
         YQ9Uix9Uf9H+8pSk4TBUBvYXUzQmRh+3nXaPMPUPQDhJE+RZFlzfl2NowMi3jtBXoFTT
         LAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772034251; x=1772639051;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qf1diTV+XMTRLAJu58Llknk3XAlVZyP3bnTceXRXR5E=;
        b=onvLfLDQOxYGR+3Zkb9vDjwn3HQhC9FMxqQvyh9jr13HLVz8eonEZy/tTlSodwtWzn
         5G1ATwwDrSTxRCVedjN0OqhpEHnB0YJe0J7y3TxQ7KF7TzUxe6A9CLKs23lCPTI+GfS6
         f6P1eecWKhOJPLjGHiD9E1AMkwXbX6afd9BznMm6SIjB9lNVopCMDBBnt/dl+kb2tHMn
         3J3bsSQACVLuwpaqcD5DsMqzUF6e2a9cz1qLiQTanrUY1Y7zGnI5HopP1w7ZPbiPzvtu
         eFubKBtq/M3wPqR0ijDH/r4cGmsC4Wi8MoDjhyX+5H0SPIJvchiz6Oj1KGe8kVfd+HFh
         oXsA==
X-Forwarded-Encrypted: i=1; AJvYcCUbBBQCoYCjMf1Ui1etLs4r0HrMHr3XbllQ4YmQpQHYAdGBLAyLuF2sWN66QeMxqjXk6g6vTAaSzaA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTdwfavLs5GTRmGmilRCiiHoSoXFsR/4TmdCvdxpsGxCaplRHj
	7Q4vppN0945TZBeK/nUSkb4qutWmxikJ7QW1a2hWgKWFkykqihoEINObufYbh3THyA==
X-Gm-Gg: ATEYQzxJoRnXiC+5T2JanrSjH1/jXgXxJzrFIl/6griecp7TKiJzBHQ2/nIF3d9pYt0
	hDjrKQ1f3TxRWWitCEmdM0EqJFhrriZa9ka66e1EAZypR3d+weOMRt5fpMeHx02uTsMEwefsOpC
	f08lOnHVzJsShhEhPGro2vtt2/vDp4veOuvmkCg+v8BMSnnYbSPvU9bQ3qO85H4Z8Po9UoOzPdW
	7GswP86zfkhLboC2nzQUlci0sYZbsE33/YqCUdkDFlST5WsCG7G/PZbV47zfe7GB5gKdzJRZfL8
	2Vs41DVW+6IBy9eJmYVdc6Hq3RaBTBblSF8Cs6HDOB2gwCUZG3fhHYgTK0obLvp2RjuFtFLjNXH
	T1xT8TWJ8K5imNXGfzOfL+xHP1ji1f+XZtmxlhhNGhOgMjyQAkdwNlQuSJQ57RTBzYKKcS/RgmL
	+wzHNI6MqlPyn2ykRU9+OfM3d5yEcxUmcArLbcx1nsRiuIquOOxPk79fU9SZ6FWMhLm4h0Hpvkd
	lO40acQ1B4IL0o=
X-Received: by 2002:a05:600c:3105:b0:477:7bca:8b2b with SMTP id 5b1f17b1804b1-483c12c7d04mr32760355e9.15.1772034250998;
        Wed, 25 Feb 2026 07:44:10 -0800 (PST)
Message-ID: <1d832f36-d22e-42c6-996c-d09c06376b8b@suse.com>
Date: Wed, 25 Feb 2026 16:44:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/vpci: do not use pci_sanitize_bar_memory for domU
To: Ariadne Conill <ariadne@ariadne.space>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Steven Noonan <steven@edera.dev>, xen-devel@lists.xenproject.org
References: <20260224231235.6277-1-ariadne@ariadne.space>
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
In-Reply-To: <20260224231235.6277-1-ariadne@ariadne.space>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,edera.dev:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ariadne@ariadne.space,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:steven@edera.dev,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 20167199DDE
X-Rspamd-Action: no action

On 25.02.2026 00:12, Ariadne Conill wrote:
> From: Steven Noonan <steven@edera.dev>
> 
> This function should only be used for the hardware domain, because it
> compares addresses against the host e820 map.

The same is true for its sibling function, pci_check_bar(). For both the
question is whether skipping is the right thing, or whether for DomU-s
checking against their memory map is what is needed instead.

> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -394,13 +394,15 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              }
>          }
>  
> -        rc = pci_sanitize_bar_memory(bar->mem);
> -        if ( rc )
> -        {
> -            gprintk(XENLOG_WARNING,
> -                    "%pp: failed to sanitize BAR#%u memory: %d\n",
> -                    &pdev->sbdf, i, rc);
> -            return rc;
> +        if (is_hardware_domain(pdev->domain)) {

Nit: Style (see surrounding code you alter).

> +            rc = pci_sanitize_bar_memory(mem);
> +            if ( rc )
> +            {
> +                gprintk(XENLOG_WARNING,
> +                        "%pp: failed to sanitize BAR#%u memory: %d\n",
> +                        &pdev->sbdf, i, rc);
> +                return rc;
> +            }

To avoid the need for re-indentation here (reducing churn) you may want
to leverage that rc is 0 ahead of the call to pci_sanitize_bar_memory().
I.e. you could make just the call conditional, without touching anything
else.

Jan

