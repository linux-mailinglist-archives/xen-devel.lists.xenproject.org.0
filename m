Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2167986899C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 08:09:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685871.1067282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rerZy-0003wj-14; Tue, 27 Feb 2024 07:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685871.1067282; Tue, 27 Feb 2024 07:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rerZx-0003uY-Ue; Tue, 27 Feb 2024 07:08:41 +0000
Received: by outflank-mailman (input) for mailman id 685871;
 Tue, 27 Feb 2024 07:08:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HnYt=KE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rerZv-0003uS-VF
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 07:08:40 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 069bbf77-d53f-11ee-98f5-efadbce2ee36;
 Tue, 27 Feb 2024 08:08:36 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-512e4f4e463so4659680e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 23:08:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p2-20020a50c942000000b005657eefa8e9sm470760edh.4.2024.02.26.23.08.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 23:08:35 -0800 (PST)
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
X-Inumbo-ID: 069bbf77-d53f-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709017716; x=1709622516; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6DiqyyY8kH1DhXKFE72nnr45e75sN0m/Xzifq4aTt88=;
        b=CegvHst+cRPeHD6DTPGU5SIbhG8UB5VNzeFJ3sEVZbs+2KrG40/LukpChZi3qesHAF
         r2iKZLdL0+Kn8oHaPAbfkdV1l/T7zNiVJ80m5TJ33A9cmvj57pYVn8RPn1J1FbTGhAOd
         77fisg+tKkWhcgFWRIsJcP+5sXrnUu+0KFrwYsZ8lW+QPURuy39AdVi2c0WhFDe7zK1o
         MXxMZzD2PjbhfJPiQVnFJnl16/yVtm1zak4f6E/zkFY0wgv9yp+QbCb0/SFxElgcfVuQ
         q9QRgw3+6ESZ3YoLKPYngdM6fJLAUFoH1pSYxhBEUIO5xiNia7NRNfC2uxnUXcvW0Wot
         9r8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709017716; x=1709622516;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6DiqyyY8kH1DhXKFE72nnr45e75sN0m/Xzifq4aTt88=;
        b=mV4lMtCvHnz3CynicY5KYnxZSIpDSVa6JByMse2FK6XDglGVinBWanB1E8dSzwf2M5
         qpY7XW/8fYPhQcvt30YonzVyWeqLmJAv+XUaFPTDlwTOlPbHrrtgjbZDenX+Eyg2r/ed
         /8LzexcTMKscxs2SMQoQ3gSi1Bhx2oozFb1C9yGyCtpfikJVywhjzepiHduBrAH4f66b
         pO/hOfkDDxGOfkBkZfsVCPcFWKoCARE97CCnFjeGTqHrsnaujHunRdTDZL7U4L9fLJDs
         65NuAXkW73w0mn2b1XzvrrzXKp2edajPrKw90bUKmEywP74YqgW6uQqe0qkkbVJZY+yZ
         MufQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZVfEbK32kzlJ3LflATTMEYjCqLUa81b8sGM1fDaZYLimPs+LH6T91neoqbNjPq5CEaK+GQX9vFWBIlCXftvBmUYswkAdmN3rlcnqvgIw=
X-Gm-Message-State: AOJu0YzbU+WR5cSob4rerlkwoQMv8X0eS97Q1er8cE/5mab1awGMltmU
	nf98nHHRitiFpyixkGl9Gm+abSr41rJebVju2PrWOakB8qNbWNfqWVx9kEp+Og==
X-Google-Smtp-Source: AGHT+IFCWGZHenn+WrfpOmvRrRI2L5wJT0U/zuBZZmpyqx4Bj9DjOkbZ6vAlOJqZDnAh5Q/xPNolvA==
X-Received: by 2002:ac2:4d04:0:b0:513:1330:3700 with SMTP id r4-20020ac24d04000000b0051313303700mr94659lfi.20.1709017716096;
        Mon, 26 Feb 2024 23:08:36 -0800 (PST)
Message-ID: <9fce0592-8b10-4b82-bcc6-38d6b32010a1@suse.com>
Date: Tue, 27 Feb 2024 08:08:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/2] xen/console: drop return value from
 consoled_guest_rx/tx
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
References: <cover.1708680104.git.nicola.vetrini@bugseng.com>
 <4998ec735bd7e5a50a229507e2b92ae56ec1ba4b.1708680104.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2402231456350.754277@ubuntu-linux-20-04-desktop>
 <004877c8-9aea-44b9-aa93-65665b0d3a8d@suse.com>
 <b417d7a330addd295b3cbbbac4bed2a4@bugseng.com>
 <a8bab8eb-a735-4440-a075-7c62a12d4e4d@suse.com>
 <alpine.DEB.2.22.394.2402261448170.247676@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2402261448170.247676@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2024 23:49, Stefano Stabellini wrote:
> On Mon, 26 Feb 2024, Jan Beulich wrote:
>> On 26.02.2024 09:23, Nicola Vetrini wrote:
>>> On 2024-02-26 09:00, Jan Beulich wrote:
>>>> On 23.02.2024 23:56, Stefano Stabellini wrote:
>>>>> On Fri, 23 Feb 2024, Nicola Vetrini wrote:
>>>>>> These functions never saw a usage of their return value since
>>>>>> they were introduced, so it can be dropped since their usages
>>>>>> violate MISRA C Rule 17.7:
>>>>>> "The value returned by a function having non-void return type shall 
>>>>>> be used".
>>>>>>
>>>>>> No functional change.
>>>>>>
>>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>>
>>>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>>>
>>>> The cleanup is certainly okay, but would one of you mind clarifying in 
>>>> how
>>>> far this code is relevant for certification? I don't expect there are 
>>>> plans
>>>> to run shim Xen in any projected production uses for which 
>>>> certification is
>>>> relevant? (The subject prefix is also unnecessarily wide here, when 
>>>> it's
>>>> only daemon code which is affected, not console code in general.)
>>>>
>>>
>>> I agree on the subject prefix being too wide. The configuration that 
>>> uses consoled_guest_tx is #ifdef-ed for x86, so even in configurations 
>>> that may never reach this condition this is relevant, unless its #ifdef 
>>> is restricted to cases where the call may actually be reachable.
>>
>> Hmm, I see. There are contradicting goals here then: It being just X86 is
>> to reduce the risk of someone overlooking a build breakage they may
>> introduce. Whereas for certification it's quite the other way around: We'd
>> like to "hide" as much code as possible.
>>
>> Really I would have been inclined to suggest to drop the #ifdef, if
>> possible even without replacing by IS_ENABLED(), but instead leveraging
>> that pv_shim ought to be compile-time false whenever CONFIG_PV_SHIM=n.
> 
> This is OK
> 
> 
>> After all that's a pattern we've been trying to follow. But with your
>> observation is becomes questionable whether extending use of IS_ENABLED()
>> is actually going to be helpful. Stefano - perhaps something to discuss
>> on one of the next meetings?
> 
> Yes. I checked with the safety manager and his opinion is that
> IS_ENABLED() is OK to use as a way to disable code from a safety
> perspective.

Yet unlike when #ifdef is used, such code would remain visible to e.g.
Eclair even after the preprocessing step. Note the context in which
I'm bringing this up - if IS_ENABLED() was properly used here (and as
tightly as possible), the tool would still have complained, aiui.

Jan

