Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEn+HJNm12myNggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 10:42:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D85133C7DD6
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 10:42:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276861.1562167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkyB-0008Nj-2q; Thu, 09 Apr 2026 08:42:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276861.1562167; Thu, 09 Apr 2026 08:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkyA-0008Ki-W9; Thu, 09 Apr 2026 08:42:34 +0000
Received: by outflank-mailman (input) for mailman id 1276861;
 Thu, 09 Apr 2026 08:42:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAky9-0008Ka-Bl
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 08:42:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAky8-00CmoR-HC
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 10:42:32 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d76671-e002-0a2a0a5209dd-0a2a4501cffa-24
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 10:42:32 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d76678-6fc9-0a2a45010019-d155802dd550-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 10:42:32 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-488ba840146so5390095e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 01:42:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ccf9b919sm37485315e9.0.2026.04.09.01.42.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 01:42:31 -0700 (PDT)
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
        d=suse.com; s=google; t=1775724152; x=1776328952; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SCR40k7aRHl+E+LEkRO6IHy6bxKDBGVW779or3apk+k=;
        b=T4+RB5Pxp+/Qeayclikip2dvFY/pz2hQKNQBHqIKzqL8uyui3BHKHYtyUlzKG84arg
         R3z6cP+LHtI4ZwPo1Pmxgxx3AjynNYzpWcWVuhyTobFYy1TnRJpIYnfYArv1G2LN6Zdh
         lotePXA631+u/qjWuX+RTenT4ehnfC/WuR3vyrdepuAbDCFRRj239/FUjMAW00fUn6wx
         IS7uCPROlvYDzGts3dqsxxAZeve3w7JRFYmJvMSCvHLgcifWF9cg/MfHlONfKfeGPqwI
         1MjgYm5hzGPVAOPXTkx4X/FjWf4RrXZa44K93B/Li/AxokJCSuq1ZtGk+yFk9or+jr7u
         LjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775724152; x=1776328952;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCR40k7aRHl+E+LEkRO6IHy6bxKDBGVW779or3apk+k=;
        b=lcavm/YV2NO58t1hF7CddX+1UHmVuIZ/NHwnoocsxCgQq4H/xNy14xdtgVCMhaxkS+
         I5gqXEMEtda+01Ozva/FMDz6kZblOzUct87TDCSEzM0lbJQszIu6Guv8twPUw3mihP8g
         mkAamHiP33B9y0powpznzD9r42Mv16z/6DqoC2W3Peljb45RUk/qsk01DO9ODlPO1Dtl
         TXP4cH8CMFNs3D3B1a3rmwSDNgm8ef6bkaIVz5xE7ijRLOeVWQBEhb9ks8ezaMHm1qIy
         0vh66g+eq9PlH/tiR7P1SmvGzmBetDRJ2M0cVbBxoGW4NyxDUub6U6RJOUwRneNHzYIQ
         B+2g==
X-Forwarded-Encrypted: i=1; AJvYcCUPAhDtC28uTMI2GBP7mUW4vvxmKKGZ9joCnDHsthtGMI+rqylVuxrjfBmZxIvka9Iwg7JrM9LD1Bo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3Kh/pozrjComU1aJaSCFwlRRTwMWIJ97oczuHzKzTNJ7mENgv
	RDkOA99OVGKq6Ay+LB4F5goowjItkV9h8FDfstNjVhcbJeOhRI3TCgyMaHoBGc8TBA==
X-Gm-Gg: AeBDietDnoRMVZW3hcbHmY2AtRWp0fB6nW4EOEjzZVTnYhRm7cPAz2EpreY+UzuKA/4
	qQemIrUy0Ve/Po8daUTKmmLBaZNnRuuExEZiWx5xmnHiHhBfM98wnb0nom9UmxtDhGjQgDFe0zK
	0eGArCuLEnbtGTBZhF7zPJblx9dBaMg0v7e9+n7mYLJWP1ryjHpMC6eM5RxmszvLxPNmp4+CBAx
	J7VMOhIve8HImExhcaacTeXWSPD0uaOMEtOkCKzSFwbX82+A1lWuHw1A1+RTsZLyhBcfFla4Utj
	cFJJO7BWzBVxoEVZWNf5DOr3l4tNF9eYD1M7rO3ElmZjtxgPhGBq/+Q/YFx7Ha2RqX6yNbCDNnq
	3mMXRe3KHYsTvBl5Fhi9a5Z8prADdgEnJYz77SACs/AvFdwOGtxDDM0n5Q/Qurvmk3T8yC356/O
	Mr7PI6i+K/cD9kmRxBMgmOuAldFuz58/SxfNZ8Fc7hdhpoJnxr1SQulk0NYogxYjXhDi+8qJCzs
	+kBDDe6MZndCs0=
X-Received: by 2002:a05:600c:4448:b0:488:ac01:72b6 with SMTP id 5b1f17b1804b1-488ccfe63eemr35792415e9.21.1775724151760;
        Thu, 09 Apr 2026 01:42:31 -0700 (PDT)
Message-ID: <2ab2425b-6795-4e55-975e-271a22ef1063@suse.com>
Date: Thu, 9 Apr 2026 10:42:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86: prefer shadow stack for producing call traces
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f064c3af-c22a-40e0-a268-ee37e34297a3@suse.com>
 <4bcc73db-38da-446e-b277-cf94c49002a1@suse.com>
 <7ca7679f-c160-44c2-98ed-f1b1761255d4@citrix.com>
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
In-Reply-To: <7ca7679f-c160-44c2-98ed-f1b1761255d4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1775724152-14EE3185-049B8097/0/0
X-purgate-type: clean
X-purgate-size: 2259
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
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
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D85133C7DD6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08.04.2026 19:53, Andrew Cooper wrote:
> On 08/04/2026 1:23 pm, Jan Beulich wrote:
>> Shadow stacks contain little more than return addresses, and they in
>> particular allow precise call traces also without FRAME_POINTER.
> 
> Do you have an example of what such a backtrace now looks like ?

I don't have one to hand, but I'll add an example for v3.

>> ---
>> While the 'E' for exception frames is probably okay, I'm not overly
>> happy with the 'C' (for CET). I would have preferred 'S' (for shadow),
>> but we use that character already.
>>
>> As an alternative to suppressing output for the top level exception
>> frame, adding the new code ahead of the 'R' output line (and then also
>> ahead of the stack top read) could be considered.
>>
>> Perhaps having a printk() for the PV entry case is meaningless, for
>> - no frame being pushed when entered from CPL=3 (64-bit PV),
>> - no entry possible from CPL<3 (32-bit PV disabled when CET is active)?
>> In which case the comment probably should just be "Bogus." and the code
>> merely be "break;".
> 
> Yes, PV32 doesn't exist when CET-SS is active, and PV64 doesn't push a
> frame.  regs->ssp will point to the supervisor token (IDT delivery) or
> on the boundary with the regular stack (FRED).

Okay, I'll change that then as indicated.

>> Quite likely a number of other uses of is_active_kernel_text() also want
>> amending with in_stub().
> 
> There are very few things which can exist on a shadow stack.
> 
> 1) Tokens (supervisor, restore or prev)
> 2) Return address
> 3) Old-SSP
> 4) Old-CS
> 
> Intel recommend not allowing code or stacks to be in the bottom 64k of
> the address space to prevent type confusion between Old-CS and the other
> values.  Xen matches this expectation, but it might be wise to check for
> it explicitly.

What exactly do you mean here? Neither is_active_kernel_text() nor
in_stub() nor the further "!((val ^ *ptr) >> (PAGE_SHIFT + STACK_ORDER))"
(which I only now notice can't be quite right, as val was read from *ptr;
I think (unsigned long)ptr is meant instead) would yield true there. If,
as per above, in the remaining else we'll have just "break", what would
such a separate check be good for?

Jan

