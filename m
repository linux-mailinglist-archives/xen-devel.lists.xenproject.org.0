Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4029152D1
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 17:47:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746816.1154020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLluy-00086a-2d; Mon, 24 Jun 2024 15:47:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746816.1154020; Mon, 24 Jun 2024 15:47:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLlux-000848-V4; Mon, 24 Jun 2024 15:47:43 +0000
Received: by outflank-mailman (input) for mailman id 746816;
 Mon, 24 Jun 2024 15:47:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLluw-00083G-Nh
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 15:47:42 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16b3b7b0-3241-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 17:47:40 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ebec2f11b7so49166511fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 08:47:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb2f1187sm64526695ad.56.2024.06.24.08.47.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 08:47:39 -0700 (PDT)
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
X-Inumbo-ID: 16b3b7b0-3241-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719244060; x=1719848860; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7JRcrAWp5h3pOTBs7DVDBCcz9m6iqDl9lmBU5DVdBDM=;
        b=f9JTnjTR+gIJ0Z+dppSgvna5L4Y7N9FITrtV4glHN0m24g+frQ15MgVGz0yrPnR4gA
         v2fUKgZ0mJOH3n2/39jG4Njw31oL5cAyt889ZdgLM02vFbZJ4P4Tz+gegmv8bYQOQVrq
         UmlxCrIMw+1zkOiPLQfa3YJ4+Hi3EhhMJVT64QGPVNqTYNVttvu4QsTLJJ1pxGL2x9ho
         tvLJ2groAsgW1pOjhYyIieHLOkCOvLRuBE+rGhh6aIO/2t43oiUHMjqMauHP7EAKTd6h
         V4bSKbzFy1WleIwiQCE2k8Focsv3qZ59sJ1x2bxJU0h3kxkIT9YQytVm48ct2LyWsT5/
         A3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719244060; x=1719848860;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JRcrAWp5h3pOTBs7DVDBCcz9m6iqDl9lmBU5DVdBDM=;
        b=uxRMm4mMTrRYq4M7fotTsbhjMUibGf30PeaRFyxmUcqHdjfM+vDL/mGpUBkUo6IZQ7
         o+3jm48sImczRgAMXDDytowJjRdn48l0e9dPIyJ/PWoay09QxYYaOmm23VleQIwwrsXk
         fV9lfArTP1yOP/AyT/VtqYMo4mSGc+rSfyZgdLSPmdJLjA7eLDqJqthJix3JAK6v4zf9
         O55PiVfuzVdliZfy8CWX3C3GPxkvSu63FNrqMG8HwPhZ3pj7Wnm0JOKrI47aQ8zKG9zO
         RNbolGtFRU9MJv8dESGzfIDcqW9cMiSIx62GPNsFSqDu1Yn8haoq7DUbLUELHCJtWQcL
         U1CA==
X-Forwarded-Encrypted: i=1; AJvYcCXJKyvwN8p2N5k29yfzKwTNIaZePY9uPPmbuCQu9/hajfJx99km7/bwe1R8dFZvFTGyos8eLaX+yscepkeLxpYpU67uHlKVRoyTdzvjVtg=
X-Gm-Message-State: AOJu0Yz1e0LORjNdqfiPd4VOVHTiC31y9q31rhcqc+WAVaAiu3SPx8lR
	gFOCn/UfK8DROuySalOUv3Kgc8/B2kybsbtfnYFITkJtvVAUHHLESRt8ANM0jA==
X-Google-Smtp-Source: AGHT+IHERRDc/GJv6QVJ5Koy78QfIpyzuPSlfZxQHStwZXkzMCGDYccvU5DqoRK4AbRBBmgOwY6R1A==
X-Received: by 2002:a2e:91d5:0:b0:2ec:2b25:3c8e with SMTP id 38308e7fff4ca-2ec5b388402mr29281841fa.39.1719244060239;
        Mon, 24 Jun 2024 08:47:40 -0700 (PDT)
Message-ID: <122c0fcd-fdb8-47c0-a6e9-e044d49710c9@suse.com>
Date: Mon, 24 Jun 2024 17:47:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 13/13] x86/vlapic: address a violation of MISRA C
 Rule 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1719218291.git.federico.serafini@bugseng.com>
 <0aa39166696e46b6bb45a0f7b5ac06bfd9fdda8e.1719218291.git.federico.serafini@bugseng.com>
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
In-Reply-To: <0aa39166696e46b6bb45a0f7b5ac06bfd9fdda8e.1719218291.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2024 11:04, Federico Serafini wrote:
> Add missing break statement to address a violation of MISRA C
> Rule 16.3: "An unconditional `break' statement shall terminate every
> switch-clause".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



