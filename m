Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CifBqCf2GnegAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 08:58:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4B03D300B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 08:58:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278371.1563232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB5oH-00074G-QM; Fri, 10 Apr 2026 06:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278371.1563232; Fri, 10 Apr 2026 06:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB5oH-00072N-Nr; Fri, 10 Apr 2026 06:57:45 +0000
Received: by outflank-mailman (input) for mailman id 1278371;
 Fri, 10 Apr 2026 06:57:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wB5oF-00072H-Dl
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 06:57:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB5oE-007iaH-2z
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 08:57:42 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d89f5c-2eae-0a2a0a5409dd-0a2a450bbb04-46
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:57:41 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d89f65-bca8-0a2a450b0019-d1558034cd63-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:57:41 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso17642605e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 23:57:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63deb904sm5559337f8f.9.2026.04.09.23.57.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 23:57:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1775804261; x=1776409061; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f1uZRKE0vMOsIRtnx7CSz/HSJXcNTmDwzx0blnuaCuA=;
        b=dODGtxWc5tvevES785vqt660wSDJh4pm19H/Us/Rc/9FBGIAZF0mgz9sDDOlYuYvym
         ei5CsTooh0c8kTyjfRmmH4GXoZwt9rrXwfgohNgXGMOfFqQbWOFvtCifsQvj10uceC52
         Ip7SZDdRaoSxW54icSEVkLcF2fpTLrFcrobYepdz/YP7Mq8OBJk/V0IAaikqJrFTaeFC
         XVU6yXVr93ndqZ71b3ypUaFgwTrhIvFLQx/yhTrameHCu3dDAcs5ITWFCC+g9s84+ulV
         7Ao6f9qyZXbEp7ot+kOT0eTb97A/MenJqk0BwzO1XxrftG6P4WckB+Fu3UuSFiEif9ns
         iU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775804261; x=1776409061;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1uZRKE0vMOsIRtnx7CSz/HSJXcNTmDwzx0blnuaCuA=;
        b=Bvqm05MvXMCAo5ij5iG/Rl0j6gHkjgTdaw+7omcT6ombw/RbeobIKFNCxiPm9S2Ke4
         W7EGiVoVEbNYKHoSUy8bqZ7WQYqFUN0SZLHTSxHA2s5v1lqa1OZT1LnVfAsz0WPScz1j
         l5uIBWAty42O3PEbgu7YxLyrDmCCjjyh2u5faG/Af9GZnX8NnTXmbkLgl3XySN77nwC3
         5NjgK/uI92NePlxHzV5R6+5KgVnSGU6q0Mt93ezm9SeiM2a5BUFESKF1mHpcgUqxWK7g
         /jKwKOX4PscHuCi8VGBqnwUbTw6W4TkwPGNuwdburH/AINso0/eMiIih8rS7ZXrdhw7z
         Qonw==
X-Gm-Message-State: AOJu0Yx5dbxdwf3u4dEmvOHsdU2DUHFd4P5CEo5peQHDIMi/IrHp1018
	ZppqMpRgh50Pwfm5icWWAWYrWjHKepQWJ/2uPUGtrWycxykJA3yaNEelqSD9G+PP2Q==
X-Gm-Gg: AeBDies203R/qI/nkwCRGxReiiaUOtdWmubbgQvm+Mp/1br9vVEjIxlPHTgLrwF8TGh
	Uo9CBYJvRCBoVy9xo08Lmxbs4m1PCKk/FGNumQCgrgomr2z3LXwHpS7wVqOQDteu5W0LPQW6SwK
	+K4oPxYIiP8hkrVX/W31j/1Cjvpk1K8w2sQOSTdtjHB4RKyNKAqzwyWAMmHypS4fVIc1lRzyxyy
	t4vZP3ZfTAc472DSPFWDIg3mEqfMoAn8ssRLB0/MiMeyL/rMrslS4ksVfnBNSYrABi1RoS/o6W+
	Nko2jZCav3AIJCWma+nK6ZSC5KbylJRyuGC9Wf6Y1q2QBBBrvD5hjkQHkCXtSys10904E0QN7WT
	iVZyKeGdNh7X2yKeZP6OziPzK+lRIcEeCGIviFnYLKKBB/spnc52WzkUJowTMnmAc6jXl/vYXC6
	g0crmnYaKg47GhaVpsZKVJD+mVv3Esm7v6zbDaJK2DlnjWJBGBPQ9Silkwvg22pG1Nq4bqq/J4y
	HMdQ09X1OC5DoU=
X-Received: by 2002:a05:600c:5299:b0:487:1fb4:7e1 with SMTP id 5b1f17b1804b1-488d6875f3emr21072235e9.22.1775804261298;
        Thu, 09 Apr 2026 23:57:41 -0700 (PDT)
Message-ID: <f9874489-5692-4735-8db4-d320142af9f7@suse.com>
Date: Fri, 10 Apr 2026 08:57:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/common: llc-coloring: Fix off-by-one in
 parse_color_config()
To: Luca Fancellu <Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20260409113934.197619-1-michal.orzel@amd.com>
 <20260409113934.197619-3-michal.orzel@amd.com>
 <EEF7C308-F25C-46BA-9663-BA789B49429C@arm.com>
 <db87a55a-5bd2-44ab-8814-1ffec91d1b40@suse.com>
 <9A42538E-AB13-488E-9AEF-39CD7E8D3131@arm.com>
 <6093D2A3-1823-4587-BB81-4593AD060D71@arm.com>
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
In-Reply-To: <6093D2A3-1823-4587-BB81-4593AD060D71@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1775804261-EFF462A1-6FB5FD03/0/0
X-purgate-type: clean
X-purgate-size: 2537
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7F4B03D300B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.04.2026 15:34, Luca Fancellu wrote:
>> On 9 Apr 2026, at 13:52, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>> On 9 Apr 2026, at 13:48, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 09.04.2026 14:22, Luca Fancellu wrote:
>>>>> On 9 Apr 2026, at 12:39, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>
>>>>> The check uses >= to compare the total number of colors against
>>>>> max_num_colors (which is ARRAY_SIZE of the colors array).  This
>>>>> incorrectly rejects input that would exactly fill the array.
>>>>>
>>>>> For example, with NR_LLC_COLORS=16, specifying 1 color for Xen and 15
>>>>> for dom0 would fail.
>>>>>
>>>>> Change >= to > so that exactly filling the array is permitted.
>>>>>
>>>>> Fixes: 95ef5ddf8a ("xen/arm: add Dom0 cache coloring support")
>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>> ---
>>>>
>>>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>>>
>>> Did you see Andrew's reply? If that earlier (recent) commit was wrong, I
>>> think a 2nd Fixes: tag may be needed here. For now I can't help the
>>> impression though that there might have been a re-basing mistake, where
>>> that re-base may have wanted to result in this patch dissolving into
>>> nothing. Yet of course I'm all ears to learn otherwise.
>>
>> Oh, no I didn’t see that! Thanks for pointing that out, I will have a closer look.
> 
> 
> I had a closer look, I feel that the patch is ok and commit cba8a584de171c8c4510709c2edc9f1cf86b21ab
> was missing this corner case.

If anything, that part of the change there was outright wrong (and hence, as
said, a 2nd Fixes: tag [actually, see below, simply another one] is needed).
With overflow excluded,

    (*num_colors + (end - start + 1)) > max_num_colors

is the same as

   (*num_colors + (end - start)) >= max_num_colors

i.e. the state before that change, isn't it?

And yes, now that I look again I think I agree that I screwed up there. Yet
then the (imo) better fix would be to undo that change, rather than switching
from >= to > . That's one less calculation overall. Michal?

Jan

> Let’s say max_num_colors = 8 (array capacity), *num_colors = 4 so we stored already 4 entries and the
> next parsed range gives start = 4, end = 7: 
> 
> (*num_colors + (end - start + 1)) >= max_num_colors will compute as
> (4 + (7 - 4 + 1)) >= 8 which will be
> 8 >= 8 that will be true and the input will be rejected, instead of being a valid entry.
> 
> Did I miss anything?
> 
> Cheers,
> Luca
> 


