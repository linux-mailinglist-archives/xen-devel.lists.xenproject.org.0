Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF41948C46
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 11:42:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772654.1183106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbGhU-0002l2-7D; Tue, 06 Aug 2024 09:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772654.1183106; Tue, 06 Aug 2024 09:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbGhU-0002jF-4d; Tue, 06 Aug 2024 09:41:52 +0000
Received: by outflank-mailman (input) for mailman id 772654;
 Tue, 06 Aug 2024 09:41:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kFQN=PF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sbGhT-0002j9-0f
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 09:41:51 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a1d8706-53d8-11ef-8776-851b0ebba9a2;
 Tue, 06 Aug 2024 11:41:48 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5a10835487fso823354a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2024 02:41:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b83a03b403sm5901370a12.42.2024.08.06.02.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Aug 2024 02:41:47 -0700 (PDT)
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
X-Inumbo-ID: 1a1d8706-53d8-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722937308; x=1723542108; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+oKCBMhcstSt6SQLNCOfWe2M0/48UJUJ+Kv4HPbMB6I=;
        b=fML2BoKyhUg/fcP8FUi7/MFVGZl9fdTlcCPuACsv0VKocDgMIWuUR9rCuN09yb2zvZ
         bRl5LJ0cC1W7OIuj5T1sPCupm0l651M8C6sPehC/BJ/FPjnTZsYWuY9O+REucYh6kJtm
         BNssg1prlhoeHLMhWLtJNhzoH91F/Ik18BiQAfhQri2FbI0ZjjWsi5w35oIrbR5b29dp
         kBXbhURorVSlzA9HWG+u1v2CYEBsdbu4Em0dtgxS8YwdSSmm34nrCfFakZpHAn2Tp0Zn
         a9Wp2k9xyUkNCR6dfKKI9NQKxfyNAMbSWzW1eOWT1mCVfAipZ+orE8owCmkryCJqF2Q0
         YcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722937308; x=1723542108;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+oKCBMhcstSt6SQLNCOfWe2M0/48UJUJ+Kv4HPbMB6I=;
        b=rgfQIP44xMbKRq1VIwJTuPx/RmaN+1qsTxranIfgBzaveePWIKaZaWavgPF34mgMSm
         hYib0ojsGh7vbHITZYuje1rxB6KvAhYrQoUNkuKtHse706UoTpfBtdD9cbEG3169rrZI
         ppNM7+kjnqQmZckqbwl2HSQ7vMLdS0VNgoDFIBjkfoqHQ7cICArq+mP2+oLaj+soNI6A
         4+gL+FGhRe7rV9rNbKkB8fdXQNafOOq58U58sYE2PWTd1skSB3X5x/NHMR3nXHVkcmhV
         OUMOTZtynNqBmRJvMCxN9vClIubmDqXLm3A+ciYToJPBSzSJ8xbjHnSDaJ/RnufT3u4e
         NgIA==
X-Gm-Message-State: AOJu0YyNh+hz0Cli/VnFSrMenm0RnnNz+MT+l/LRHzcP+a6L8jbVksUE
	th2B8Kz2ritPJomtQtwWu+jf9U/doiUZBGgWrZPfWswJHPoMq0nUF8i0YPDXGA==
X-Google-Smtp-Source: AGHT+IE6fq8HD4NSbz8vcAeFRzV3yTYDi5hZsFC4DojON+D7JYm3i1KjExmZFB1lCw5LlTLyHOSrmw==
X-Received: by 2002:a05:6402:c08:b0:5b9:3846:8bab with SMTP id 4fb4d7f45d1cf-5b938469427mr7871938a12.14.1722937308279;
        Tue, 06 Aug 2024 02:41:48 -0700 (PDT)
Message-ID: <01c81e66-a921-458c-bf9e-fe1bd9054936@suse.com>
Date: Tue, 6 Aug 2024 11:41:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Help with Understanding vcpu xstate restore error during vm
 migration
To: Fonyuy-Asheri Caleb <fonyuy-asheri.caleb@inria.fr>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <60751777.2038091.1720694327760.JavaMail.zimbra@inria.fr>
 <1557490999.4048664.1721029086794.JavaMail.zimbra@inria.fr>
 <77f1ff6e-a7dd-45c8-b706-429674b559f2@suse.com>
 <ece26efe-c1af-4fd2-910d-01a33beda5cc@citrix.com>
 <120712863.15929301.1722927890402.JavaMail.zimbra@inria.fr>
 <0f69e94a-5720-4f1f-b51d-b4fb2c6bbe0b@suse.com>
 <674914344.15937452.1722929654769.JavaMail.zimbra@inria.fr>
 <c4dac0ae-a8f4-4121-ad2e-f7cd61b6e3a8@suse.com>
 <349786242.15991470.1722936605909.JavaMail.zimbra@inria.fr>
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
In-Reply-To: <349786242.15991470.1722936605909.JavaMail.zimbra@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.08.2024 11:30, Fonyuy-Asheri Caleb wrote:
> Seems there's more to this than I think. Here's the entire information about my setup. 
> 
> Source Server: 
>    Processor: Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz
>    Xsave dependences(based on xen gen-cpuid.py): 
>                      'fma', 'avx', 'f16c', 'avx2', 'avx512f', 'avx512dq', 'avx512cd', 
>                       'avx512bw', 'avx512vl', 'xsaveopt', 'xsavec', 'xgetbv1', 'xsaves', 
>                       'pku', 'avx512_vbmi2', 'vaes', 'vpclmulqdq', 'avx512_vnni', 'avx512_bitalg', 
>                       'avx512_vpopcntdq'
> 
> 
> Target Server:
>    Processor: Intel(R) Xeon(R) Gold 6130 CPU @ 2.10GHz
>    Xsave dependencies: 
>              'fma', 'avx', 'f16c', 'avx2', 'mpx', 'avx512f', 'avx512dq', 
>              'avx512cd', 'avx512bw', 'avx512vl', 'xsaveopt', 'xsavec', 'xgetbv1', 'xsaves', 'pku'
> 
> Operating System: Debian12 (on both source and target servers)
> Guest OS: Ubuntu 18.04 (PV)
> 
> Xen version: 4.18.3-pre (commit 01f7a3c792241d348a4e454a30afdf6c0d6cd71c)
> 
> 
> So I have the following which are available on my source server but not on the target server: 
> 'avx512_vbmi2', 'vaes', 'vpclmulqdq', 'avx512_vnni', 'avx512_bitalg', 'avx512_vpopcntdq'

None of these require extra state (i.e. registers), hence ...

> Per my current understanding, I would expect more xstates on the VM than supported on the target
> server and hence a failure with xstate verification when restoring CPU state. 

... no extra "xstates" (as you name it).

> However migrating a guest from Source to target works. 
> 
> Note that these extra avx512 features are all visible to the guest I migrate.

Ah yes. While that's a bug, it's a known one I think, awaiting further work
that Andrew has been meaning to do for quite some time, yet always getting
preempted by security stuff and other emergencies. For guests to migrate
safely, I think right now it is required that you limit features visible to
them on the source host.

Jan

