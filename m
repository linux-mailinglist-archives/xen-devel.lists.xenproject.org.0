Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1107097EBFF
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 15:04:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802044.1212149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssiip-0007B9-Us; Mon, 23 Sep 2024 13:03:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802044.1212149; Mon, 23 Sep 2024 13:03:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssiip-00078e-S1; Mon, 23 Sep 2024 13:03:23 +0000
Received: by outflank-mailman (input) for mailman id 802044;
 Mon, 23 Sep 2024 13:03:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ssiin-00078Y-QE
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 13:03:21 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34494d87-79ac-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 15:03:19 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a90349aa7e5so645020766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 06:03:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612e519esm1239008666b.176.2024.09.23.06.03.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 06:03:17 -0700 (PDT)
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
X-Inumbo-ID: 34494d87-79ac-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727096598; x=1727701398; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p6OBO1qSf9Tm8/+Jr2pT4kfiGQ4jK12fIwtOpviyqmI=;
        b=OuIg8QW38GCPBXnFR1RR+6gS0uvoj0Px8BppY50Ow4w4R4WRLCXw0AqLJP5fH6mgXI
         JLmIfaNd6582/U7iRI6y7flikzkPpbYdETAaTMOvUiTv8Q4/q3URMGiaQnp9dcc5/yJd
         4HPAXV58+cc2ECtfRlZ7sFlepijn4cpORZYXgRegfgeFeXIeaenMTQJ7cEtoz/QH67u9
         2zVfdcAL3y5ZwBtMymeKYpw0wu/mn4Lgg4ITdVboaqAgfAQnylunGis/7Z2ef3QWNPAh
         L3IJikAGTGs2OFSpgcXbS4qXMRBklaJYjE+UuybVQC6h+eftf+DPUE3xnsogiMWVroyw
         4Ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727096598; x=1727701398;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6OBO1qSf9Tm8/+Jr2pT4kfiGQ4jK12fIwtOpviyqmI=;
        b=tTHKyJoKW87Zcq/1KJLfgrizdojNxu1C15I5GVbi1oM3pmEvHzj+pMYJx9uLm23or9
         1LQJO3ZfeDHdJ5fCNWxIU/iS80a5dTMfkTxD855A2PP7FvOYgWzWfAJNx0fsqyiOcbIT
         KU8i6PXtfPDft8NV7dn/vT4BPaZMcRxYU7ApNPT1NzFZ5ocMNmO54YKyew9ifat0GwZI
         A5ytfbaRqYxUQMWfdbKIzTSi6ziI6w+jyAhLMePeTmRj3RpAJFLJe3pHoYaMeK/57yAn
         yk9i1nDPVdWjY0PpN6Iaj14sy3LujwAAAH16oS+rsad5bvTVe/mMr2/yVcmjS8B6K4Fa
         B4UA==
X-Gm-Message-State: AOJu0YwFDuVah9kssEMKqZudslCXbQiiKvddXRbql2yg9/AIheIWad9f
	dseMiHDcqWGL2LJHo8CiPwZRbPq8z5fitn27eP/JEaegx3GcwM1MW1VMfgQ57A==
X-Google-Smtp-Source: AGHT+IGQqJHP3vY2w1/r8OkM/ihxXcAfloHo73QI43+pwpAv1wq1/ggYX2v7bs32txxk84Y1+wGQGg==
X-Received: by 2002:a17:906:fe02:b0:a86:ac91:a571 with SMTP id a640c23a62f3a-a90d599afe2mr1278370466b.56.1727096598472;
        Mon, 23 Sep 2024 06:03:18 -0700 (PDT)
Message-ID: <4fbfcaf2-f317-4b4f-9655-0f0c9e1e453b@suse.com>
Date: Mon, 23 Sep 2024 15:03:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/traps: Re-enable interrupts after reading cr2 in
 the #PF handler
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240918130554.97345-1-alejandro.vallejo@cloud.com>
 <Zu2Cyan46VVs2oef@macbook.local> <D4DL2FFRNE6R.XTS6NS9L1PHX@cloud.com>
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
In-Reply-To: <D4DL2FFRNE6R.XTS6NS9L1PHX@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.09.2024 12:14, Alejandro Vallejo wrote:
> On Fri Sep 20, 2024 at 3:12 PM BST, Roger Pau Monné wrote:
>> On Wed, Sep 18, 2024 at 02:05:54PM +0100, Alejandro Vallejo wrote:
>>> Moves sti directly after the cr2 read and immediately after the #PF
>>> handler.
>>
>> I think you need to add some context about why this is needed, iow:
>> avoid corrupting %cr2 if a nested 3PF happens.
> 
> I can send a v3 with:
> 
> ```
>   Hitting a page fault clobbers %cr2, so if a page fault is handled while
>   handling a previous page fault then %cr2 will hold the address of the latter
>   fault rather than the former. This patch makes the page fault path delay
>   re-enabling IRQs until %cr2 has been read in order to ensure it stays
>   consistent.

And under what conditions would we experience #PF while already processing
an earlier #PF? If an interrupt kicks in, that's not supposed to by raising
any #PF itself. Which isn't to say that the change isn't worthwhile to make,
but it would be nice if it was explicit whether there are active issues, or
whether this is merely to be on the safe side going forward.

>   Furthermore, the patch preserves the invariant of "IRQs are only re-enabled
>   if they were enabled in the interrupted context" in order to not break
>   IRQs-off faulting contexts.

This last part is just stating the obvious then, in that you're not breaking
existing behavior? Seems a little odd to have in this form then.

Jan

