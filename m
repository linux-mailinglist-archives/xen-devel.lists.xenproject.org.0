Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A76E4915EFE
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 08:39:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747226.1154578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLzps-0002zA-Rf; Tue, 25 Jun 2024 06:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747226.1154578; Tue, 25 Jun 2024 06:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLzps-0002w7-Nq; Tue, 25 Jun 2024 06:39:24 +0000
Received: by outflank-mailman (input) for mailman id 747226;
 Tue, 25 Jun 2024 06:39:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sC98=N3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLzpr-0002w1-4M
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 06:39:23 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8070a1d-32bd-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 08:39:22 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2e72224c395so56267851fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 23:39:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c819dbb7c6sm7815005a91.40.2024.06.24.23.39.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 23:39:21 -0700 (PDT)
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
X-Inumbo-ID: a8070a1d-32bd-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719297562; x=1719902362; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kJ7WN2BRd8DKoq+sO+eGPVnq8Mr5H95ZdlQpaZkE/W0=;
        b=BLoQ+VbUd2PkdQW8hYEkLnPaDRB+49HsKOfJGap9/NuRb97t5mb5O/fxp7TAKUkQIY
         LNPUPfvXNF3wQFPClSHXPun+N1Av73pNI5Hu3MtcbY2EqsQ7bwPjEdcC69qdigwF94+6
         O+CK3cvSTe9N/5kWAFRChfbeqxV48zdExdD1GgsbzCaHfDA+RH6qbiAC0fST36LCgBHJ
         phu2XdiG8G0kR+iCIXVh8QUohAZPAe/opTiDq4rGFa5r7RoVfu4OKSJHqs2dvjijKCDl
         r7sz+GWOwAwKEYqMlnIOgGdqMqPDWdwCxwV07SgH94HzA+2uo/wWTclresga7GoZpikZ
         tXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719297562; x=1719902362;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJ7WN2BRd8DKoq+sO+eGPVnq8Mr5H95ZdlQpaZkE/W0=;
        b=dEFrEEfBnmlaBp35s48yOcRUzfo3EdC1u1X6c7GThSWRvDOLS88gM1ukYINHUp8YF8
         v5vTWX+Spk/ACDnbtfWBkLfsWumqAtwcFF1of3snUGN0zU/HcP7xzZgIu8b8yCZ5IZLh
         CKmbRuU2hvS3PzMUpeceOkml5J9Fe4IoXIxT128KrITV2kMuyX++q4OdKjk1lrUMGdak
         J+Xfa8DBE0DhKPjgr+DbUZEXHNahrBSAKX1YnYKOCSO5KJOkxCcIq5kkf8DBaZuuI2FI
         L19YEUWNYbTaggR9P+TbaaE03pHEleAs68dJied5i+29sC0FGMzgc+3E8D+EBeYggryL
         Scpg==
X-Gm-Message-State: AOJu0Yx5iN6ZgmsvHDAdDt8dWwLyykBWR8FNZgaMi2Y8xiJODlufTECz
	UREeCUR3ruqnwJ5xXVuomYu8z3GduuGFDzTnygmd2Vt6qA/4BnsuZRaSmbqCog==
X-Google-Smtp-Source: AGHT+IH05DqY8aGMNJpGTW85wmbo+60/5Jb1KF4e/tf+/AfTszuclizxwt1e4ya5GUG2boEuXjcA9Q==
X-Received: by 2002:a05:651c:210a:b0:2ec:6639:1208 with SMTP id 38308e7fff4ca-2ec66391319mr22108231fa.19.1719297561640;
        Mon, 24 Jun 2024 23:39:21 -0700 (PDT)
Message-ID: <88127f41-a3e3-4d05-b9f2-3e4117bf1503@suse.com>
Date: Tue, 25 Jun 2024 08:39:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 0/6][RESEND] address violations of MISRA C Rule
 20.7
To: Stefano Stabellini <sstabellini@kernel.org>, oleksii.kurochko@gmail.com
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <cover.1718378539.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2406241743480.3870429@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2406241743480.3870429@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 02:47, Stefano Stabellini wrote:
> I would like to ask for a release-ack as the patch series makes very few
> changes outside of the static analysis configuration. The few changes to
> the Xen code are very limited, straightforward and makes the code
> better, see patch #3 and #5.

While continuing to touch automation/ may be okay, I really think time has
passed for further Misra changes in 4.19, unless they're fixing actual bugs
of course. Just my personal view though ...

Jan

> On Mon, 17 Jun 2024, Nicola Vetrini wrote:
>> Hi all,
>>
>> this series addresses several violations of Rule 20.7, as well as a
>> small fix to the ECLAIR integration scripts that do not influence
>> the current behaviour, but were mistakenly part of the upstream
>> configuration.
>>
>> Note that by applying this series the rule has a few leftover violations.
>> Most of those are in x86 code in xen/arch/x86/include/asm/msi.h .
>> I did send a patch [1] to deal with those, limited only to addressing the MISRA
>> violations, but in the end it was dropped in favour of a more general cleanup of
>> the file upon agreement, so this is why those changes are not included here.
>>
>> [1] https://lore.kernel.org/xen-devel/2f2c865f20d0296e623f1d65bed25c083f5dd497.1711700095.git.nicola.vetrini@bugseng.com/
>>
>> Changes in v2:
>> - refactor patch 4 to deviate the pattern, instead of fixing the violations
>> - The series has been resent because I forgot to properly Cc the mailing list
>>
>> Nicola Vetrini (6):
>>   automation/eclair: address violations of MISRA C Rule 20.7
>>   xen/self-tests: address violations of MISRA rule 20.7
>>   xen/guest_access: address violations of MISRA rule 20.7
>>   automation/eclair_analysis: address violations of MISRA C Rule 20.7
>>   x86/irq: address violations of MISRA C Rule 20.7
>>   automation/eclair_analysis: clean ECLAIR configuration scripts
>>
>>  automation/eclair_analysis/ECLAIR/analyze.sh     |  3 +--
>>  automation/eclair_analysis/ECLAIR/deviations.ecl | 14 ++++++++++++--
>>  docs/misra/deviations.rst                        |  3 ++-
>>  xen/include/xen/guest_access.h                   |  4 ++--
>>  xen/include/xen/irq.h                            |  2 +-
>>  xen/include/xen/self-tests.h                     |  8 ++++----
>>  6 files changed, 22 insertions(+), 12 deletions(-)
>>
>> -- 
>> 2.34.1
>>


