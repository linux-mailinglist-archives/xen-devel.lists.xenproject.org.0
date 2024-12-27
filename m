Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 898E39FD293
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2024 10:34:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863410.1274829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tR6js-0003rZ-SJ; Fri, 27 Dec 2024 09:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863410.1274829; Fri, 27 Dec 2024 09:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tR6js-0003pP-PV; Fri, 27 Dec 2024 09:34:36 +0000
Received: by outflank-mailman (input) for mailman id 863410;
 Fri, 27 Dec 2024 09:34:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tR6jr-0003pC-81
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2024 09:34:35 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7a34e96-c435-11ef-99a3-01e77a169b0f;
 Fri, 27 Dec 2024 10:34:33 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso47534195e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Dec 2024 01:34:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366e210cecsm223981735e9.2.2024.12.27.01.34.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Dec 2024 01:34:32 -0800 (PST)
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
X-Inumbo-ID: c7a34e96-c435-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1735292073; x=1735896873; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ykhvyOHewNbrDgJmTnfvEQHtptra29c6/y+MVTkzqV8=;
        b=M4prf9TtvZ9xjuFdSEE5gTiE9FOa7qFCSUoU7ziM3KrESXwcZEvUHKPpOtyh1Jsyge
         5LTSl2Q+uJucRi5x0vs1c9bGYk7w20/yZ9BEH5DdxaumWqZRsdOI2OYFRNI4shPcFbXi
         A73J+3oae/Fyxv+aAbkmlJzYS3ndfY/U4w6RWtmYHl/NHlstWQ3TCfKhTHc2lRJbnWO+
         Sd39OZ4sMCPflI5cj9g5Svtdl8ITxeWpYM9QzaXUEqqlkAPLLCsfZl4PZz5NeuzsEGda
         V1RU8AQ6KQuH1pXNZBqYXs9F/+iHEX8RGbbNP2QscsDL+uCIVW1B7ZMoYAJLNRzBxllC
         DVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735292073; x=1735896873;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykhvyOHewNbrDgJmTnfvEQHtptra29c6/y+MVTkzqV8=;
        b=AznWWLpA/utGuP3GLhiT6eePKmvjEf6qC7wJ/7gw4/qpKnSeGsvpObk0OA+WI7rbPq
         QRaUk/5Wo3dhSq4lxFr0ZXo9ATJ+5C/OvkDURaCwEIyc6msC80Ytr4mQ2y5CvEn+VQao
         g3vifwRa51/zW0yt2DIhnhhoXFZL4D51foTadoVWga/nkgwrxTWdZg11UxT2qFG0v3v/
         9FdBSLyf+M4kPOPd7QKMrgB0piiFp1zI4Sb/i8/Wd5L2H+Dmm0QqirXekKbOaD9jsY5w
         AAU3PKdnviysci+m54P1Jcrg1Nf7D0ERQoPcWKruZnqtaTsi5z8lhms4X8JgsLDZUkiZ
         I7Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWDERLLIR+SBD2ObNcEinMKrhM6x+eCDnuBWQSuBnEQP/sDxI+Naf3LTi+VANBN96spB79dgIxDXVk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEjqSbhG0SGbPr/YMkcZWO/kjv4m40x4HfgLIZBdDYvoO3Autz
	7ylY9zsrPO0u5aaWRbD9UwCeXRFBrylDUrdiHKONZ6RJeAlTl7TIoJPvlFHOs03ZSIXnKLADjWE
	=
X-Gm-Gg: ASbGncsyIxeovHaZfWlM/FGB4LNrEV7w34TOiyK/dxkN6U8DYMQTwE5rDTn3rYXwcRL
	igGSeDav3+vryROCedn51EKmeDT2l1o8WFlNEoCjT1w15DNex3pYLfwecRo6xcgUTxoH6hF/h7T
	rmhFqO+KX3GPIzIsPPZqKilsmTCCLsEtnTz6bLE0MhGGozeKo4Rw7jbU58k+oU+Y/e20hwcGGsI
	XiewIvMtaDdHiasOsklu//T858mpkOCLoKn4+Oy7BSKO6OxtRrV5/f0Jb4mV/h1DnwDM84p+x9H
	xgHX2jApz9YBncqEcB59EulNCv/nvVhpBlmINFwCYg==
X-Google-Smtp-Source: AGHT+IFMTvahqmi+mfJ6vdv8zj4sbZQpZdyy13XgxuG5nDmt9NhyncaOOtDL6yyC0PrdTbpAGjldhQ==
X-Received: by 2002:a05:600c:3b23:b0:431:60ec:7a96 with SMTP id 5b1f17b1804b1-43668b49950mr188242485e9.25.1735292072835;
        Fri, 27 Dec 2024 01:34:32 -0800 (PST)
Message-ID: <7503184b-58b7-4a07-86a6-b3d3eed0c587@suse.com>
Date: Fri, 27 Dec 2024 10:34:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/spec-ctrl: Support for SRSO_U/S_NO and
 SRSO_MSR_FIX
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241220193424.470994-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241220193424.470994-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.12.2024 20:34, Andrew Cooper wrote:
> AMD have updated the SRSO whitepaper[1] with further information.  These
> features exist on AMD Zen5 CPUs and are necessary for Xen to use.
> 
> The two features are in principle unrelated:
> 
>  * SRSO_U/S_NO is an enumeration saying that SRSO attacks can't cross the
>    User(CPL3) / Supervisor(CPL<3) boundary.  i.e. Xen don't need to use
>    IBPB-on-entry for PV64.  PV32 guests are explicitly unsupported for
>    speculative issues, and excluded from consideration for simplicity.
> 
>  * SRSO_MSR_FIX is an enumeration identifying that the BP_SPEC_REDUCE bit is
>    available in MSR_BP_CFG.  When set, SRSO attacks can't cross the host/guest
>    boundary.  i.e. Xen don't need to use IBPB-on-entry for HVM.
> 
> Extend ibpb_calculations() to account for these when calculating
> opt_ibpb_entry_{pv,hvm} defaults.  Add a `bp-spec-reduce=<bool>` option to
> control the use of BP_SPEC_REDUCE, with it active by default.
> 
> Because MSR_BP_CFG is core-scoped with a race condition updating it, repurpose
> amd_check_erratum_1485() into amd_check_bp_cfg() and calculate all updates at
> once.
> 
> Xen also needs to to advertise SRSO_U/S_NO to guests to allow the guest kernel
> to skip SRSO mitigations too:
> 
>  * This is trivial for HVM guests.  It is also is accurate for PV32 guests
>    too, but we have already excluded them from consideration, and do so again
>    here to simplify the policy logic.
> 
>  * As written, SRSO_U/S_NO does not help for the PV64 user->kernel boundary.
>    However, after discussing with AMD, an implementation detail of having
>    BP_SPEC_REDUCE active causes the PV64 user->kernel boundary to have the
>    property described by SRSO_U/S_NO, so we can advertise SRSO_U/S_NO to
>    guests when the BP_SPEC_REDUCE precondition is met.
> 
> Finally, fix a typo in the SRSO_NO's comment.
> 
> [1] https://www.amd.com/content/dam/amd/en/documents/corporate/cr/speculative-return-stack-overflow-whitepaper.pdf
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> I cannot say anything more about the SRSO_U/S_NO vs SRSO_MSR_FIX interactions
> in public.  The safety for PV guests depends on details not covered in the
> whitepaper.
> 
> v3:
>  * Rewrite commit message and comments quite a lot.
> 
> This patch was originally for-4.19.  Zen5 CPUs are now in the world and Xen is
> unsafe on them without this patch.
> 
> I technically have enough tags to commit it, and it's long overdue, but I
> think it would be wise to see if the new wording is clearer to others.

It is to me; thanks for making these adjustments.

As to said implementation detail: I suppose we can only hope that yet newer
implementations won't break this.

Jan

