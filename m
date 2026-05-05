Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGYYJbzG+WkwEAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 12:30:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 093884CB542
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 12:30:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300506.1575038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKD2W-0002Hc-Md; Tue, 05 May 2026 10:30:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300506.1575038; Tue, 05 May 2026 10:30:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKD2W-0002FI-Ik; Tue, 05 May 2026 10:30:08 +0000
Received: by outflank-mailman (input) for mailman id 1300506;
 Tue, 05 May 2026 10:30:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKD2V-0002FC-19
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 10:30:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKD2U-00DY4H-DL
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 12:30:06 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f9c6ac-2eae-0a2a0a5409dd-0a2a45038164-10
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:30:06 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f9c6ae-672d-0a2a45030019-d1558030e0fd-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:30:06 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so80549635e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 03:30:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8eb69698sm608584765e9.1.2026.05.05.03.30.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2026 03:30:05 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777977006; x=1778581806; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uuV7z0kmdkdxTSrHgtdR7USEvqeS6gyo1MoXeaoOgVs=;
        b=c/zbOHVOfsMPCdy/ePeCQj7S6jl4nTlcr69zANyIrOj7BCRbvIRTTlZ4dABmMhpFdM
         jzy5FbHG71ZcpzunP9ZNDOgv4KCfWLuP2aR7gwEz/GAHQn5aV6NTSFKYo970GmDyWpzg
         xXyAbYPXtKNt3lleYm4sJXt7Pb5q5uSD6rwjpyUlqvYN/+OjmVhrI+7BQeOR0v0wLg6t
         ZQEcnD0So2n07iailIGlzign6PuDU8HhQIC/NMsNK3z5oVZO/YtO5/1MCfCy15pA5igO
         yf7zLcN90XoENyZ+QAFt0ZWsJ2XdoLGYQiAtK/VMeejyPTqKI0Ob5NQlRaOOD69meYlL
         O8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777977006; x=1778581806;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuV7z0kmdkdxTSrHgtdR7USEvqeS6gyo1MoXeaoOgVs=;
        b=swAbAugBkwRXoVpkUPiwz1ICH8pXSNrzdJQEynKckjlJy0ljWJd7U2Pvx0Xu0FWpQ2
         OqtPjgCLkYmHR0bdeLttCLfFBb8zcA/GDRIN5I1Gl6IvTnejeJ9fTeFAlSHuSyZbq/CI
         jBJhDyHTMb98eaqFov9NuGBZdL3TW63wVuFf0q8U0T/QRYdck4btKYSNRxQfDKv1Xjcp
         X01BuEjpiDneRIuWxqsVgt3652/Wro8v8PYDrUdZIVrBLEIADcFEzNOcNpLn36TdPSqw
         Xf8UlzeuPxa5RLNjPsMqnL96wI+JJSdq+3cLHqPgrChkuE9/lWelv3eEMLxzvTOFvqND
         wI3g==
X-Forwarded-Encrypted: i=1; AFNElJ/0iQUWxVMahE0Ftg8AHE9yh+9gry/ilghr0wQObQOxV1n6AsmixziUbylT/X8Nmp4IUeMrQ8uHFLc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPLU6hWnHHErg9PiAVLePc9RFk/+Ygkv4Ywc8QdF2am/eC/ffW
	fUoWLLhVnffJpXbaVJzMrkE8dN5MmwYMjB4R78ZXFt5S5za5Cegq14XhWPsckp+D9Q==
X-Gm-Gg: AeBDieunLz5SGCg+KjdyS/PzlzQ9k9Mfb2Tvj0+Q1tCtRJfNFLRbKc5gJk1T4U/2B9D
	OXiW5rmcrSeRxpJLdvTrRjnrx8jmM9ZZ8CX6VZK6OgEXz2AjAdlVKKT4NhPsj5yIenQh347pIqA
	h8eMUOtZjRlE5axQgZsKYx3EGzRc2fwElaYcbKFuG7gKZsazXSvUW/oaOvoncTT+EnLv6pbOywd
	5iV8tWPe04xqq6zKtVIwIg4TBuo58wXRU7OxBC2k6bDkbyeYEJNC8MNquwipF7m+kShh4VbBxVB
	ocjoM4lD9nDKOnYXEIGB+dDLggVlqCvZsbjsSMsPtd2RS1Piv7Y1ZLK+f7aJHAnwzlG+qxED0dz
	49nJDqGvZfcMQo4rvhGjrXrqjtDinyap6JT9Ee0Ts9USMaGukVmm1S6NRLayFeTIUvJNZwUTHIb
	LOZ/LHTJ/LRFnfHKHycLiHbgm2SILf02sXVSLDf1MkAPA+A5XEIxzDmOelO5ubXYu+xb8R7OCMi
	WIMViyIUNP1GwgC7XEOfHl/CSBL281k5mmr
X-Received: by 2002:a05:600c:821b:b0:489:1d23:4524 with SMTP id 5b1f17b1804b1-48a9852f4demr218897575e9.5.1777977005648;
        Tue, 05 May 2026 03:30:05 -0700 (PDT)
Message-ID: <0b311682-9633-4aa0-8067-534456c7b848@suse.com>
Date: Tue, 5 May 2026 12:30:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/7] common: Track latest pCPU that ran the vCPU
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1776259594.git.teddy.astie@vates.tech>
 <f127344e083d224d2203b83c701375ca15e6368b.1776259594.git.teddy.astie@vates.tech>
 <a191bebd-aa7a-46e4-b3f2-a7a93c389480@suse.com>
 <1777976230.8631fc262581453bbf619ec5b2062170.19df7a441f3000f373@vates.tech>
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
In-Reply-To: <1777976230.8631fc262581453bbf619ec5b2062170.19df7a441f3000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1777977006-A1370938-D556029C/0/0
X-purgate-type: clean
X-purgate-size: 1511
X-Rspamd-Queue-Id: 093884CB542
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 05.05.2026 12:17, Teddy Astie wrote:
> Le 04/05/2026 à 17:51, Jan Beulich a écrit :
>> On 15.04.2026 15:32, Teddy Astie wrote:
>>> Track on which pCPU each vCPU of a domain ran. This will
>>> be used to know whether a TLB flush is required or not
>>> when the vCPU is migrated on another pCPU.
>>
>> Somewhat related tracking already exists - see the dirty_cpumask field.
> 
> I've seen it, but I'm not sure how it can be leveraged here.
> 
> I will try to take a closer look if that could be used instead.
> 
>> But what title and description say doesn't match ...
>>
>>> @@ -977,6 +978,8 @@ void asmlinkage svm_vmenter_helper(void)
>>>   
>>>       svm_sync_vmcb(curr, vmcb_needs_vmsave);
>>>   
>>> +    curr->domain->latest_vcpu[cpu] = curr->vcpu_id;
>>
>> ... the implementation anyway: You track which vCPU last ran on a given
>> pCPU. Since the same pCPU may have run multiple vCPU-s which then weren't
>> scheduled again, you lose data afaict.
>>
> 
> I mixed up the wording. But the implementation is the proper intent.
> 
> It's more
> 
>    Track which vCPU of the domain each pCPU ran.

Okay, yet then (as already pointed out) how do you know vCPU0 ran last on
a given pCPU if after its de-scheduling vCPU1 (of the same domain) was
put there. Your track record (after de-scheduling vCPU1) will say only
vCPU1; information on vCPU0 will be lost. Yet then, as also indicated,
it's not quite clear to me how exactly you mean to leverage this tracking.

Jan

