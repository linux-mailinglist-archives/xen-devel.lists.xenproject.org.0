Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA61B053D6
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 09:56:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043679.1413680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaW6-0001Do-Sl; Tue, 15 Jul 2025 07:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043679.1413680; Tue, 15 Jul 2025 07:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaW6-0001Bf-Og; Tue, 15 Jul 2025 07:55:58 +0000
Received: by outflank-mailman (input) for mailman id 1043679;
 Tue, 15 Jul 2025 07:55:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/5o=Z4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubaW4-00010L-R5
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 07:55:56 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22a7d44e-6151-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 09:55:55 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a57c8e247cso3407431f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 00:55:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4365e47sm108429535ad.248.2025.07.15.00.55.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 00:55:53 -0700 (PDT)
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
X-Inumbo-ID: 22a7d44e-6151-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752566154; x=1753170954; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ky6Jb4MAlTKnzH/ihGxJbi1jX6rGawpTI8ROLj5HBjs=;
        b=ZEYKIUhEhgLEfdmg61TmszltgUPernzvxpMRlViAPyrHSkW13KB4Q/5MRCeagr7bJ8
         awSLAqALGYY63/iAWPefGfyDT81If6RGPKGn8XuGpdI/F38eIB4lc+TreAy2QiWIM17e
         xj0qqu/uW3MAI6Z4rfEo0YcgRHnbwV8pOmw2KS5klRpvuX0T/rDMhAKGJmIcG0697Luz
         DIX/3BUeGEnLYOfbAIx7RokeFtyRbEPvtfQo25MPzbMKV2TA0JKvLKYQwQaThugsiFf/
         zrB3EdShhbQPW891U8e7XFrBd3eiWUofWU3LlKRAXkfamm/RVh4NrarllGqyws6Jie8/
         G2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752566154; x=1753170954;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ky6Jb4MAlTKnzH/ihGxJbi1jX6rGawpTI8ROLj5HBjs=;
        b=ELOctKyM4GeYK3kpLf5Fj1Zqrt5T5HO34ADPsRJD0kZe6epQJIBEBN1UkynlwLbTKV
         HrrfwzW1LEZ/g1MrNNwN3dXbl/wdQb/ln1IlpMGh8dN+2MldSQSDjj+h8ZwcbNkqLHhk
         TNVuhGn1uN7UzXiHutTFRCQXKqnXnkRzG9wxrF3Fjc1JtIuV9oSHgFPYYFrFGq61MIiz
         GWyKAm7YA0Yir1x5hA7jv2uWfZQRe4qbodZA4ZUW0Ddix6zXsHso5c7jIDPlii0l9ESK
         Y3UkQDSgsmTt742FvyAgdVUoIua+SwL0avVMxXWSmMoyWabsM4J0hMoSZOdTANzj1/5V
         E5Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXeYuVkwQbqG/Iw+8cJMrfut8NTBqJQICiNyMrKlaXqFQntnnPtY5Kq2JDICerd8SAjq0n/h8n6Hfk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyG/K7FCizhtkZ2uzpQEHLbISP3TmWO+c0+5vpgx/WFrFP803sg
	9L1cI8GbIBjbillOoq8h8Ky5XvuEc1NxOwb97AWPHmjbcjcPiSCk4bYUaKTVbVIuUQ==
X-Gm-Gg: ASbGncu7j3zENt+umMIji2U3F3mtNRyuOPDj4hUWlHNDzZpdL0eEx9xhk+ItclbcTS1
	dlBet1U5gcskxLckSmWtcsGD9aeSbkMDY2u382M4j9VvOY56y8J/2OGqPc/uDjamc8BHPsh2y1g
	51y2A8bo5hSMY4l4ulFDw+pOYmui8/cucKXQWVERP1ibylyI9/1ZkZNQOnJAzXOT+4YIRznqP4i
	rk0UbkrRA2vcT/4jJOkTUfvpeOmP7kwAKNVehdJZFN4v0fkm9Xgr0vYTszINrDjcCHkPlAtvoTM
	jBjwsoa7gl/1EWOUiJRJKC/n8dqsKuK44JUyhrkGycrnFyKOqbY4Vgn2TqHYSkoF0icbbvdZ/e8
	xY/uw/mrkqFAxmOnNR9jKK40Wwq8rQkDXgCobQy/M1cUX+8JN1OldbxjXODCXFKARYwJewKsf7b
	Rz4hfbWRs=
X-Google-Smtp-Source: AGHT+IFwyJ22pJlsm5jnSo/rz5FzQ19qZo/WMA4SNuME3e8o3qBS9XKscGNCLNMhhSsefCHl5Q87Wg==
X-Received: by 2002:a05:6000:4b13:b0:3a4:d8f2:d9d with SMTP id ffacd0b85a97d-3b5f2e1baadmr12185672f8f.38.1752566154433;
        Tue, 15 Jul 2025 00:55:54 -0700 (PDT)
Message-ID: <0686ad8e-749f-45ca-a273-5f4ae718e8b9@suse.com>
Date: Tue, 15 Jul 2025 09:55:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] xen/arinc653: fix delay in the start of major
 frame
To: Anderson Choi <anderson.choi@boeing.com>
Cc: matthew.l.weber3@boeing.com, joshua.c.whitehead@boeing.com,
 Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 xen-devel@dornerworks.com, xen-devel@lists.xenproject.org
References: <c3234cf8d5fb5da84e10ebdb95250c594f644198.1752197811.git.anderson.choi@boeing.com>
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
In-Reply-To: <c3234cf8d5fb5da84e10ebdb95250c594f644198.1752197811.git.anderson.choi@boeing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.07.2025 05:16, Anderson Choi wrote:
> ARINC653 specificaion requires partition scheduling to be deterministic
> and periodic over time.
> 
> However, the use of current timestamp (now) as the baseline to calculate
> next_major_frame and next_switch_time introduces a delay in the start of
> major frame at every period, which breaks determinism and periodicity in
> partition scheduling.
> 
> For example, we observe 3.5 msec of accumulated delay at the 21st major
> frame with the following configuration.
> 
> Target : qemuarm64
> xen version : 4.19 (43aeacff86, x86/IRQ: constrain creator-domain-ID assertion)
> dom1 : 10 msec runtime
> dom2 : 10 msec runtime
> 
> $ a653_sched -p Pool-arinc dom1:10 dom2:10
> 
> 0.014553536 ---x d?v? runstate_change d1v0 runnable->running //1st major
> frame
> 0.034629712 ---x d?v? runstate_change d1v0 runnable->running //2nd major
> frame
> <snip>
> 0.397747008 |||x d?v? runstate_change d1v0 runnable->running //20th
> major frame
> 0.418066096 -||x d?v? runstate_change d1v0 runnable->running //21st
> major frame
> 
> This is due to an inherent delta between the time value the scheduler timer
> is programmed to be fired with and the time value the schedule function
> is executed.
> 
> Another observation that breaks the deterministic behavior of partition
> scheduling is a delayed execution of schedule(); It was called 14 msec
> later than programmed.
> 
> 1.530603952 ---x d?v? runstate_change d1v0 runnable->running
> 1.564956784 --|x d?v? runstate_change d1v0 runnable->running
> 
> Enforce the periodic behavior of partition scheduling by using the value
> next_major_frame as the base to calculate the start of major frame and
> the next domain switch time.
> 
> Per discussion with Nathan Studer, there are odd cases the first minor
> frame can be also missed. In that sceanario, iterate through the schedule after resyncing
> the expected next major frame.
> 
> Signed-off-by: Anderson Choi <anderson.choi@boeing.com>
> Suggested-by: Nathan Studer <nathan.studer@dornerworks.com>

Nit: (Most) tags in chronological order, please.

Jan

