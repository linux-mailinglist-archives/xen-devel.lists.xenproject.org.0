Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJbXCh6h1GlEwAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 08:15:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 889303AA2B8
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 08:15:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274438.1560543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9zhy-0002hH-8V; Tue, 07 Apr 2026 06:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274438.1560543; Tue, 07 Apr 2026 06:14:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9zhy-0002eI-1U; Tue, 07 Apr 2026 06:14:42 +0000
Received: by outflank-mailman (input) for mailman id 1274438;
 Tue, 07 Apr 2026 06:14:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w9zhx-0002eC-6i
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 06:14:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w9zhv-002tEl-VH
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 08:14:39 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d4a0cb-2eae-0a2a0a5409dd-0a2a45028af4-32
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 08:14:39 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d4a0cf-42fa-0a2a45020019-d155dd33d9ec-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 08:14:39 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-43d02a71526so2627876f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 23:14:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4f5016sm50588982f8f.33.2026.04.06.23.14.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2026 23:14:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1775542479; x=1776147279; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tV1fizWcuooj1WZi3D6VF5H/rrwxbj+in7H8cAwzJ9M=;
        b=LBiDHuOGKQy+c5JXjhwrKgPBon0bFP3yXlXD9vm5pw1qpjdN/EK6mJxClQ3qU6QceL
         c7ONpPWbqqjZS08k9LhWDSFqofTWy1raPvou6K7TQidHGrESK/a06+IIwv2bxMD2ps5V
         g+qsijrcA7vl0A6/FoPspIt3LTmHLOm8bC+AKuXGM8N1X3TkAgYcsZ293l42QdEuU65S
         YBMZIL/ImYo22n2JB4OoYT/o8Vm4cXL/5CzdDygFPaHX1XA0JfbPXQcRPfTgDK5HpZXj
         kyYy++kUiNOoYTbJzCNyfe6oLBagdF5VFYXGzYM1UA8gDjTMdWhsedYpuMwAuoQtlMM2
         PH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775542479; x=1776147279;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tV1fizWcuooj1WZi3D6VF5H/rrwxbj+in7H8cAwzJ9M=;
        b=UZYb/kaBgy/gkjPtE35mvojAL77AN5BjgYi5VdpAlo/OudfDoczOQ6AwBktzGeYBZp
         /zpswLI1TWuiKogP4xLzx/ukrFjlw5oXAoKbrAZ/kNpR7XoeFl7ItcQfLbs/DI8kZ4sB
         AuK8ZFcyEnzs6wcoVRlRUos3ZN5od9pAqaW02y3kprXQlio47tM6WSNEs9MA/6/cdB/I
         ctdu/0qdfGh/yVhTPk/357svCAWpHjZp5bxuaCnQwItsWDfbaBiMnMDu0BOVl6CjLD7C
         gIE1M7gUHb65lbidLHS+oVSAALa2ZCMwz3OVOVhVh2SxsD0s8/2TUxukqoWhaNi9re6J
         aNnQ==
X-Gm-Message-State: AOJu0YyoWgKyoxu1+5/pG28KFEkxDmAk70coX2KNqk5tU6PqwxRQA3tz
	IWTMzFHwvRiYznXIfy+6/cub4TstPuhCowdPW3s+YNM6d84aB2Hi44Wmknc/qKho8A==
X-Gm-Gg: AeBDietTBI2EVxk0O82bEdtUag00uHLLBuHuAQTy+aH1WRjjcOMQMjNj9id4Z7FkJk+
	TPb3Esu8CMpl33nDTKZP2WL7KHR9fQUD1TG2smCkL/mlnSabxdehcCI6NyY+f5Rd3HuepigWX80
	E34E5Wff9ZRA49kBORuWdofevJkDr5fPnU/bLlev9tLmhsyIZEjyACmHJjdSDrfy9avvp3JcNUc
	z5fM7ap8AmisqA6sEAVwFG1tyTC9y/Hc6p7phgLc+XkeHnddl3s1e8lLfR+7LxZjW5j71dj2VOQ
	Ca2QI/psU5FKpP6YQLAOagqkpyapjz3uhJfFiObVz6TCzA5dpVavy/st14upkQZWppO7dQTAqft
	sXA36ZeTTYdJ4bPdJuopp4ksTrxm9JlpraCdPucJimh4Al6T5YvM1qCvsm07N74LBtfuhUDZbSl
	/VhGxlTyDtSs5T1bfMZH+tbOqTpmBRtz/tKcOgxOlDdL8QCvZQ42VwZWrQ1LXbNsYp/+fT1gzMn
	tGokU9GODykCQw=
X-Received: by 2002:a05:6000:186c:b0:43b:41df:705e with SMTP id ffacd0b85a97d-43d2930fc4fmr22489562f8f.49.1775542478909;
        Mon, 06 Apr 2026 23:14:38 -0700 (PDT)
Message-ID: <b6e53859-70fd-49b0-a7f0-eb53386349df@suse.com>
Date: Tue, 7 Apr 2026 08:14:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Slow (higher scheduling latency?) system after S3 - regression
 4.17 -> 4.19 ?
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?B?SsO8cmdlbiBHcm8=?=
 =?UTF-8?B?w58=?= <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <aPzBO_eW8mQHM66u@mail-itl> <acQzzlXNDxNq885V@mail-itl>
 <29775afa-e17b-4c44-a2a8-4ef4bc7cdf0f@suse.com> <acUqOL232lp-Lw1v@mail-itl>
 <cbed767b-4ac4-4989-8778-43ff321ae977@suse.com> <acVWX8vkhZiFfonP@mail-itl>
 <88c65ec7-b7f7-4d8b-a453-d707440b43cb@suse.com> <acZ8ez4dmQay1JSw@mail-itl>
 <ac5l-HgbDRcVkiWb@mail-itl> <ac_Gu2lm4Jnoz7WN@mail-itl>
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
In-Reply-To: <ac_Gu2lm4Jnoz7WN@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1775542479-447CBCD1-BC2D604D/0/0
X-purgate-type: clean
X-purgate-size: 855
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 889303AA2B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 03.04.2026 15:55, Marek Marczykowski-Górecki wrote:
> On Thu, Apr 02, 2026 at 03:02:15PM +0200, Marek Marczykowski-Górecki wrote:
>> On Fri, Mar 27, 2026 at 01:47:55PM +0100, Marek Marczykowski-Górecki wrote:
>>> Some further observation, this time regarding timers:
>>
>> In the meantime Roger suggested it might be about C-states. So, I just
>> tried booting with max_cstate=0. I got this:
> 
> We had a design session on this issue, and managed to find (thanks Roger!)
> that adding:
> 
>     tsc_mode='always_emulate'
> 
> to the domU config fixes the issue. Now, the question is how to fix it
> properly...

Seeing also the remarks on Matrix, what we will hence need to figure is what
TSC parameters (of the system and/or the VM) change across suspend. As per
Matrix everything looked at so far was apparently stable.

Jan

