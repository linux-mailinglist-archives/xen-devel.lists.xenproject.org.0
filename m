Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9573A58D88
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 09:02:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906131.1313580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trY5G-0003h4-5U; Mon, 10 Mar 2025 08:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906131.1313580; Mon, 10 Mar 2025 08:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trY5G-0003eB-2o; Mon, 10 Mar 2025 08:01:58 +0000
Received: by outflank-mailman (input) for mailman id 906131;
 Mon, 10 Mar 2025 08:01:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sahL=V5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1trY5E-0003e5-If
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 08:01:56 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id edb1d3ca-fd85-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 09:01:53 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3913958ebf2so1673313f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 01:01:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ce3d5a0e2sm83720525e9.12.2025.03.10.01.01.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 01:01:52 -0700 (PDT)
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
X-Inumbo-ID: edb1d3ca-fd85-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741593713; x=1742198513; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X6dywhLknJ5/bp1jnLsBbaDdFkSHw7wfUPhMm6JROLU=;
        b=WVCYUC18cM8leOuqlOsUpzshuN6uKS8044rnktD79zPM1luYmZ5xjSliZXDyKP31jp
         kucLN0g0ifA5zuOSB9OMnMTXmnQq26zs32db7+ZIF8tlsVtklKqpTzxjNJ2QWsVIJqv4
         WvwrIH6oQUD+HkbroHr6wRcQj3JUSNHUVUoIRK09TooPpmBIRmm8jdo7m6VU/fViTSzQ
         0gT5V9zfIC9kd3LTglC8jjgnwk31Y6IHLDhs6uKOMFN40ORq7nxZQgacNQY1Rbu3F2dq
         s0SSOZFjXFHE4gTDpYb9dop/6xFXBmYKoWTimyVKA/Nt1r7EVqCr1t9tsdCHS8sOG7+i
         OcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741593713; x=1742198513;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6dywhLknJ5/bp1jnLsBbaDdFkSHw7wfUPhMm6JROLU=;
        b=O7LmQg0Bb67+SIo0EFd92iOUT/0tpiVzXwlosD75/0yIS7HC5qURg1350faEdohFa8
         vyLfZFDrxa0N2QrsHljs29kup/XP1Kr6bj9wxIQWFS0x7kARulQqDeJsKtXf2KGEdZXB
         hHAsCaDbYf4x57QMaDFrsrvlh+ke9ze586Hyu8dIm8Wo7UKUkTaUTzC7bdWOs+OtVBMR
         /fikVcicEjQtZA1LPX7so6ory1iTzZaIdj9yQ0s6OW18dsgTlBOm/Ghw6zvysCLqSigA
         tfe9xyasx9gqVSxes5IaaElfPE5IjeAyORSK9juYHDld+nPzMQE0yqX8XxnKF9AuoYV1
         w6SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR7XFFFilYzSGJ2uemRCq8ZpWpUOa1nnBPVNLcZwqbYKOMoKenOZ7Fx5wOA4ZA63FvKRqSRYT183U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzrBHjh+oz7kCbwYQ/v5UM6TtlCDlB6SyBtVAii6JACOnmFAoz3
	E7/QDX0U+SuGEDtH39txRmN0CtEBJ0wTKcBzQmslg+HPd9DDnl4wsWtxtWnBSg==
X-Gm-Gg: ASbGnctd8Nx0SDvwpxEalkmgzpqkss6jgxE1WQ6eAOovq1Mvr58T+CmkQWGVwyzeL5H
	GQRf7leE5h+AYEPp7vdK4VbAkodTDHkYqI/jwwbksp6gxhLddZDuRDRaVWB9QCNgtiOdiih0uuJ
	xiSn3I6WGvRehwkLEQmXZL8dCPsGFfwHpnWvvD0eTM2rZbJ/p0n/YdG0Nt8wPjpdjaNF2v6VINo
	MNbVh9d6ulw+2isfnIO5BKSut7Sf19rYHXWNzIGAd+rivYleH4fR2C7BKrrwcimd5b2A2/lxmqr
	XYVvtum2axMEjEuKzkCmDz6REawQ/SuE87qwV70Yz7wM5Bwdd7keZsDbkMJC/5hi8fwPLsfklZR
	24AucaHynvx7y2QNn5nEIUon0Tp0pVg==
X-Google-Smtp-Source: AGHT+IFOeBvAbtevo82oJPiWzlLCN/WWVbfnW4MXo5Ae/anx0+GRq84j5hYFyQiJPlTJwl5v6is7kg==
X-Received: by 2002:a5d:64a4:0:b0:390:fbdd:994d with SMTP id ffacd0b85a97d-39132d45d52mr7254346f8f.27.1741593712801;
        Mon, 10 Mar 2025 01:01:52 -0700 (PDT)
Message-ID: <93fdeea0-495a-40c7-936c-749e75a3d728@suse.com>
Date: Mon, 10 Mar 2025 09:01:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/23] xen/arm: dom0less seed xenstore grant table entry
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-9-jason.andryuk@amd.com>
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
In-Reply-To: <20250306220343.203047-9-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 23:03, Jason Andryuk wrote:
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -4346,6 +4346,16 @@ static void gnttab_usage_print(struct domain *rd)
>          printk("no active grant table entries\n");
>  }
>  
> +void gnttab_seed_entry(struct domain *d, int idx, domid_t be_domid,

Can idx be negative? If not, unsigned int please.

Furthermore, as with any additions to common code, please keep in mind
Misra: We better wouldn't gain new unreachable code for certain configs,
even if - didn't check - the respective rule continues to be non-blocking.

> +                       uint64_t frame, unsigned int flags)
> +{
> +    struct grant_table *gt = d->grant_table;

This looks like it could be pointer-to-const. Same apparently for the d
function parameter. Question is - would it perhaps make sense to have
const struct grant_table *gt be the function parameter in the first place?

> +    shared_entry_v1(gt, idx).flags = flags;
> +    shared_entry_v1(gt, idx).domid = be_domid;
> +    shared_entry_v1(gt, idx).frame = frame;
> +}

In common code there shouldn't be an assumption that gnttab v1 is in use.

Jan

