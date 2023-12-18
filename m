Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D338170CA
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 14:47:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655971.1023876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFDxE-00029K-8h; Mon, 18 Dec 2023 13:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655971.1023876; Mon, 18 Dec 2023 13:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFDxE-00027W-67; Mon, 18 Dec 2023 13:46:44 +0000
Received: by outflank-mailman (input) for mailman id 655971;
 Mon, 18 Dec 2023 13:46:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFDxC-00027Q-Ux
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 13:46:42 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de66a8d0-9dab-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 14:46:39 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c3ceded81so29512405e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 05:46:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g17-20020a05600c311100b0040c4535f1a2sm34130079wmo.39.2023.12.18.05.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 05:46:38 -0800 (PST)
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
X-Inumbo-ID: de66a8d0-9dab-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702907199; x=1703511999; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GPT9cYcQOYxA2APCAUIcMSqmKhgOl8CMbnj43hfLWpg=;
        b=BYasl/R15PizbHEqD5BydYHdUkMymx2VOpVa5mvjYtQd2rejKUzmqK1y6VQO6+wYG5
         yle/DXBRqf3Qwh0JZbBnQtHnINHmLzQW+jV3HKb9R5DlysHMqNZDHMRurwXYLMdXoTxf
         S/ZtGBy0xzXMiFM5xPecLr5U4hIXN/U/lTrtYgpgTXxAt8SrAIoBf9vq/lcOxRu+P3Uu
         4U/4uPwdE4xatL7qG+v+iPgm4ByfaqgIAOgQqJX1kCohjG7wvLBDoOYAN8T+h115zDuw
         KKPjjQV2aXjttTlW7Dgyex2WB1XbzMRRJSK8sD+iejEmCPMkPg4Q500Fwfnq5gpSYiDS
         ieBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702907199; x=1703511999;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GPT9cYcQOYxA2APCAUIcMSqmKhgOl8CMbnj43hfLWpg=;
        b=SaY3RvBixepjpGrKQy6otPVC+j7a5J1bAfCCY7wZuBb9+LSelEPZZjO+6Q63SqmFd2
         /CfXZbC9awUsOitc0LjrTpq7aW7hnx202K8T6PKZj6p7k8CWA74/JYWZ0tq84/LPaGoy
         E1YhEmDq/pHbU4iTP7nL4IxihtV2H0tH36hxtEQYcak4cVGzNrqIFnfRev96ozymrWUf
         hQylsusfE3fg607ZTtZ7cCP5UhCkrEFtiDYuwvBc9hf4TQyMUDW7a1Xf2Yw+Xwg/6tWJ
         WgAVmZvSsm0xTJfjhoFsWsRW/iqJ7PEcptvc2M5KpygUfgG/h8MHgmgCRWIW6eloaXh/
         Hi5w==
X-Gm-Message-State: AOJu0YynR6ZN46cWaJBSfGbR2Ocrbcoqzwj5JwMsuGIGX9nSKYVUATbP
	TCmlDQztR45CpX03m3dQe65d
X-Google-Smtp-Source: AGHT+IHam7tjrsJWy9K4GXvfmVwPjac37c0wnvg2KB1BcokUCgQGIqTOtz5f8fPyFSgz/Kbw4RrfBQ==
X-Received: by 2002:a05:600c:2a41:b0:40c:236f:612 with SMTP id x1-20020a05600c2a4100b0040c236f0612mr8396831wme.124.1702907198717;
        Mon, 18 Dec 2023 05:46:38 -0800 (PST)
Message-ID: <1c00c3ba-4d10-4cdc-ae2e-ca2fb2157be6@suse.com>
Date: Mon, 18 Dec 2023 14:46:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] x86/spec-ctrl: add logic to issue IBPB on exit to
 guest
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <31da79de-bd6b-af95-793a-c16516992bc7@suse.com> <ZYA3Db53Z3fvBlwn@macbook>
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
In-Reply-To: <ZYA3Db53Z3fvBlwn@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.12.2023 13:11, Roger Pau Monné wrote:
> Hello,
> 
> I'm not as expert as Andrew in all the speculation stuff, but I will
> try to provide some feedback.
> 
> On Tue, Feb 14, 2023 at 05:10:42PM +0100, Jan Beulich wrote:
>> In order to be able to defer the context switch IBPB to the last
>> possible point, add logic to the exit-to-guest paths to issue the
>> barrier there, including the "IBPB doesn't flush the RSB/RAS"
>> workaround. Since alternatives, for now at least, can't nest, emit JMP
>> to skip past both constructs where both are needed. This may be more
>> efficient anyway, as the sequence of NOPs is pretty long.
> 
> Could you elaborate on the reason why deferring the IBPB to the exit
> to guest path is helpful?  So far it just seem to make the logic more
> complex without nay justification (at least in the changelog).

I've added "(to leave behind as little as possible)" ahead of the 1st
comma - is that sufficient, do you think?

>> ---
>> I have to admit that I'm not really certain about the placement of the
>> IBPB wrt the MSR_SPEC_CTRL writes. For now I've simply used "opposite of
>> entry".
> 
> Maybe it would easier to just add the MSR_PRED_CMD PRED_CMD_IBPB write
> to the vmcs MSR load list?
> 
> It's a one-time only AFAICT, as you would only want to do this for
> context-switch AFAICT.

That would be a back and forth of adding and removing the MSR to/from
that list then, which I'm not convinced is helpful. With these special
MSRs I would further be uncertain as to their effect when used via one
of these lists.

Jan

