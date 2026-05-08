Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKT8Fph+/WnnegAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 08:11:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C20494F2467
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 08:11:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303206.1576699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLEQc-0005at-Rq; Fri, 08 May 2026 06:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303206.1576699; Fri, 08 May 2026 06:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLEQc-0005Yt-PA; Fri, 08 May 2026 06:11:14 +0000
Received: by outflank-mailman (input) for mailman id 1303206;
 Fri, 08 May 2026 06:11:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wLEQb-0005Yn-IJ
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 06:11:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLEQa-001eul-GG
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 08:11:12 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fd7e72-bab6-0a2a0a5309dd-0a2a450399de-42
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 08:11:12 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fd7e7f-672d-0a2a45030019-d155dd2da5bc-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 08:11:11 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-441209fb77eso990530f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 23:11:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548eb75c29sm1902038f8f.9.2026.05.07.23.11.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 23:11:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1778220671; x=1778825471; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Arhe0IY7Yg8LUTmLKE0FMC8sOVWLSnJTpAFxjFXGbeI=;
        b=fDO1pB0afcZqq8PHKE2Gy9y/L2kAT+ZpoTDiO6SmHqbn44n/ScDMayVgSIjTI6Kyd4
         aErzYgBO4qHqDuf1FFShGHFjNkQJ8atbbDb0rZ6C/6abCMHjHSDjfPr0YWuEPccR8PUt
         sIg+RnYwBdCYGBmNFydLAgAUlB+kPd0cqOZ60P72Dtf9s8I5XWa9A+/4rCdf1NDN6nJK
         WXvMZ6rJxNqcjVkcY58n8wHnVug5LGQK3fH2UsjLaz9PiQ5/rkeI5CH0+u529CKMz6pd
         R/wjNwIYadJbpyQFeLR4aobSg36WiKAOYqXnr37cxS7nFD5fy+2YNV00YRT8QkT9Ha/N
         Z8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778220671; x=1778825471;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Arhe0IY7Yg8LUTmLKE0FMC8sOVWLSnJTpAFxjFXGbeI=;
        b=dhcN/QdTYIKH7Gz9zSiKPJxtbidCAn0PcBs1OQcPL5NJe9eImJB3bJsBqpaR59LTH5
         S8Q9xNGD283gWB72WIhA/tY0BdJju8OsBdjl0z/lDANZchnmDTB9RHBYUC7OgeNcLfII
         wVoZT8Twkex1twuYw67Z8GAXnjDqeHF36Xo13STDaJRK+woMpclvebBs5CGMw+ccA+4H
         BveRF+3CFDQSYlespthWa5d2PkFPg5q1TNdDmxmoKJdGuJ9A+gzjAJqp1zMcrqFnZkrl
         u/rqcpvZjZUrZchMBwAh8a07DSrIFsUKiiV2w104WPyUWdc4yjmBttuKqC18WRnWmN6g
         alsg==
X-Gm-Message-State: AOJu0YxkuiCoWlYd9uBT3GvgqIGNHayggEtkHUKq0rYQ8rNqzBdJBmYs
	6Eaj1KY0l4wQqJof8dpBFjJtzd7Mw6SDQ+jwFjixzZw5zkcmPmqytadUnzDAzmcUte4mnAU0gQF
	ku9U=
X-Gm-Gg: Acq92OE00bsCdXr+d5+z/uujHphyshvmVzSvojV7dJ1nEuSJ0M4c9osYRpp0l8HuIxL
	cd7u+SUoy1jgDE8CmN8MlB8JgO534p019Rr/EAxCcvUjzThugxpU6VXrmd5abiLeeJS7aWB8BVl
	D36/3bWxSHAWLf2wjvIS6umo3MpsCo/UfqKLB4WQ7BtR7tTmqCqmCXEKeJMHwS52JGaXBUQfBRA
	m4/TbJyl0I+8fOrz6gSDDeTWKzEC5nRenxiNEfjHuLK9EM8vRqbSL+C1ZJyrULdEiwEWLgzjz4j
	a1HaRsWl6QX1lRixkgFur0DBizjWAy9x4PJGiuoj5HnWD3piNJ6dNUBjA2ld/UVuDQ8204bGyS5
	+R9P479efef2YpFVslMEHZWLRKACc1saNPPp4/JUSdkCcvazgusb7WEeav3n4N08iHFk3FaLpCm
	ltRiS4yfUAqy1TzIo1TSJrz5ttU9i7I/pwcbxx316xgG2fduwx0bkDAgN4NfZTFJB1AWXJQzMhg
	dLG0TcqyaslLnabo3M+4IqpWg==
X-Received: by 2002:a05:6000:ec7:b0:452:f380:5508 with SMTP id ffacd0b85a97d-452f38056f9mr6299278f8f.0.1778220671255;
        Thu, 07 May 2026 23:11:11 -0700 (PDT)
Message-ID: <84e74842-9a2e-42ce-9ec9-2892156353b1@suse.com>
Date: Fri, 8 May 2026 08:11:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CI: collect certain intermediate files as artifacts
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <6d9345e7-7ad9-48f4-8447-3a955305430a@suse.com>
 <alpine.DEB.2.22.394.2605061748080.1744448@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2605061753050.1744448@ubuntu-linux-20-04-desktop>
 <540ef3bd-6fc6-4cf1-a1fe-3def9cfcc114@suse.com>
 <alpine.DEB.2.22.394.2605071441490.1779943@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2605071441490.1779943@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1778220671-3A965938-79FB9B79/0/0
X-purgate-type: clean
X-purgate-size: 3429
X-Rspamd-Queue-Id: C20494F2467
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,gitlab.com:url];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 07.05.2026 23:44, Stefano Stabellini wrote:
> On Thu, 7 May 2026, Jan Beulich wrote:
>> On 07.05.2026 02:54, Stefano Stabellini wrote:
>>> On Wed, 6 May 2026, Stefano Stabellini wrote:
>>>> On Wed, 6 May 2026, Jan Beulich wrote:
>>>>> When one of the linking passes fails, additional intermediate files are
>>>>> still in place. Having them available for analysis of the underlying
>>>>> problem can be pretty helpful. Collect some into a new intermediates/
>>>>> directory. (Nothing new will be collected if linking succeeds.)
>>>>>
>>>>> While there also make sure xen-syms is collected (into binaries/). This
>>>>> is rather more useful for analysis of possible problems than its stripped
>>>>> counterpart.
>>>>>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>> ---
>>>>> As the issue this is meant to help with didn't re-occur with this in
>>>>> place, the new logic wasn't really tested yet.
>>>>
>>>> It looks OK but please provide a link to a successful pipeline
>>
>> Well, I had it in use in
>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2503967215
>> but does that count, when the issue the change is for didn't really occur?
>> For now I can't test the additions without having a way to trigger that
>> symbol table issue (or any other problem at one of the linking stages).
>> Short of artificially breaking things, that is.
> 
> Please break it on purpose. Just push to a temporary branch.
> 
> 
>>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>> Thanks, but the above wants clarifying first, and the below suggests you
>> actually meant to take back the R-b.
>>
>>> Actually, I see that the build script is run with bash -ex so I wonder
>>> if collect_xen_artefacts would even run if make fails. I think we need: 
>>>
>>> trap collect_xen_artefacts EXIT
>>
>> I don't feel comfortable making such a change. Furthermore it's unrelated,
>> as it would mean that on other build failures successfully created final
>> binaries wouldn't be collected either (after all on x86 it may be only one
>> of the two links that failed). Plus then it would likely want doing
>> differently, by making the EXIT hook invoke a new
>> collect_xen_intermediates(), leaving collect_xen_artefacts() unaltered
>> (except for the xen-syms addition there)?
> 
> "trap collect_xen_artefacts EXIT" was just a quick suggestion to explain
> the type of change that would be needed to make this work, because as I
> understand it, it does not work now.
> 
> From your comment I don't understand if you think that the patch as is
> would work as intended or you agree with my comment that it would not
> work.

Given the -e passed to bash, I don't expect it to work as is. However, I
question this behavior. Exiting on error may be okay for any of the
preparatory commands, but exiting on failure of make feels dubious [1].
Hence I'm unsure which way to deal with that aspect (i.e. I'd prefer to
latch the main make's status, collect artifacts, and then exit the
script with make's status).

Somewhat related: Why is it that collect_xen_artefacts is invoked three
times, rather than just once at the very bottom of the script? At which
point it wouldn't even need to be a function.

Jan

[1] E.g. a failed tools build may also be easier to analyze if the
already built components (libraries in particular) were collected.

