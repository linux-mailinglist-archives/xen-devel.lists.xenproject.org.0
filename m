Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3529320D3
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 09:00:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759329.1169001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTcAV-0005sT-1f; Tue, 16 Jul 2024 07:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759329.1169001; Tue, 16 Jul 2024 07:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTcAU-0005qE-VD; Tue, 16 Jul 2024 07:00:10 +0000
Received: by outflank-mailman (input) for mailman id 759329;
 Tue, 16 Jul 2024 07:00:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I1NN=OQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTcAT-0005pp-Lw
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 07:00:09 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09055bc4-4341-11ef-8776-851b0ebba9a2;
 Tue, 16 Jul 2024 09:00:07 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2eede876fcbso30728931fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jul 2024 00:00:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cacd6dabe5sm7512301a91.44.2024.07.16.00.00.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 00:00:06 -0700 (PDT)
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
X-Inumbo-ID: 09055bc4-4341-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721113207; x=1721718007; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n2twh2KkMEpGiZboJMD9rY8s/U262qrt8nFUXCMOtXo=;
        b=CiBLvypoHdExfxTWbQaOiuPQ7+c67eQQ2HxZ+FK3A5A5OcUCBzGSBnOxx4/t7AJz1l
         oveCwhrHAJYTQZu9viyQ3PfviXKcZoAxtW4hbNLc0M6co3UYkl3Dmq5S64AXb5qm8qks
         1MX/QwY+N+YvKkI5Jkwyf1L7JmMvTgpX0lP3+b3ymPS1YjMN1ttJfRynzZnPkKbrlg0r
         pQd1nSVecF+l5sCgR+D+xSw6ZTp/ZxtdZ9flYnPWgWfsBWTDw+U1ZhC/Flzq8crcJMo0
         HMmWGD8ZjwakrgLC6nAH/hvHL7mh+ARyH0wBPm/olhklKIrftgwAT99Ho5d7CBJDTFav
         PWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721113207; x=1721718007;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2twh2KkMEpGiZboJMD9rY8s/U262qrt8nFUXCMOtXo=;
        b=TvS0EWA0fkx40VnzBQ2bZ63ACV/klmpdUeOj9mpvIaG6blpF428S+YgBnZltKeSgiu
         +cQTeKLfh5uQqKUW8lnn4iqu3JYFWU0alrENnmg0PIJfza73fgTVamP1t/HSa7oxwq/S
         b+7RGSwXDwLbI+BCfrK1UNyZI3n5aM7Z453Pxe6I7Xl9GL3Ngne3Jg6RpzJidE297FKG
         Rt/hAhcUX15veTpwEufzQtNXvTECizsIcbAtzKA8aeq2qBbGWodeU78XbN3vF1KtdcR1
         quwA/zqwwjF1jIHCRv1vRjkMCmtzDn7PYRUdurIWb1VKZLfz9m/WNpcLhOpfT6uV+G7l
         ncyA==
X-Forwarded-Encrypted: i=1; AJvYcCVqaJTd7cJGtaVn7gAeV/Sph52yhuxdLvl9qSqofLC7R6W1qmIOGnAoG0Loc82mW8Q3knbZCTb5+I5uSBDOWk77VqNb/FXNWQmfkoSYpEI=
X-Gm-Message-State: AOJu0YwGEgywl9DI+tOJ/CNPpkQyF4wxu/eh8OvtNhG6QSjiOsdepcnK
	iXwL6fjMsimx/DonZ/XSu3Ohp7gaV9mMte6YqFliYBzsgu6sSi+CNMyuY4kWZg==
X-Google-Smtp-Source: AGHT+IGrxGzx/XAas/dC46XuRLiRKlbLlqqk7bRqz95T+DI1mbdDbhz6vfNdKrHmKcIe6oNJAHEYjA==
X-Received: by 2002:a05:651c:1023:b0:2ee:8eb6:ff62 with SMTP id 38308e7fff4ca-2eef415b53cmr9008221fa.8.1721113206944;
        Tue, 16 Jul 2024 00:00:06 -0700 (PDT)
Message-ID: <704db9f3-e143-4a52-a0da-30443a128519@suse.com>
Date: Tue, 16 Jul 2024 08:59:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Resend XEN PATCH v4 0/9] x86: address some violations of MISRA C
 Rule 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1721050709.git.federico.serafini@bugseng.com>
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
In-Reply-To: <cover.1721050709.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.07.2024 18:48, Federico Serafini wrote:
> This patch series fixes a missing escape in a deviation and addresses some
> violations.
> 
> Federico Serafini (9):
>   automation/eclair: fix deviation of MISRA C Rule 16.3
>   x86/cpuid: use fallthrough pseudo keyword
>   x86/domctl: address a violation of MISRA C Rule 16.3
>   x86/vpmu: address violations of MISRA C Rule 16.3
>   x86/traps: address violations of MISRA C Rule 16.3
>   x86/mce: address violations of MISRA C Rule 16.3
>   x86/hvm: address violations of MISRA C Rule 16.3
>   x86/mm: add defensive return
>   x86/mpparse: address a violation of MISRA C Rule 16.3

And what exactly was this resend about? Even sent as reply to the original
submission, rather than as a plain new thread, thus resulting in everything
being mixed up into a single thread?

Jan

