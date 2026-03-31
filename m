Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JG7J6iFy2l4IgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:28:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7B1366185
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:28:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268722.1557942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7USF-0001hB-KN; Tue, 31 Mar 2026 08:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268722.1557942; Tue, 31 Mar 2026 08:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7USF-0001e8-H7; Tue, 31 Mar 2026 08:28:07 +0000
Received: by outflank-mailman (input) for mailman id 1268722;
 Tue, 31 Mar 2026 08:28:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7USE-0001e2-53
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 08:28:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7USD-00FgBQ-2s
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 10:28:05 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cb8593-bab6-0a2a0a5309dd-0a2a4501daaa-12
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:28:04 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69cb8594-6400-0a2a45010019-d1558032e452-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:28:04 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-487012ce896so33211725e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 01:28:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887a630901sm18481995e9.0.2026.03.31.01.28.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 01:28:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1774945684; x=1775550484; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HctX+JDtCnX93Jc66Wju0t0pUUK8/Z+cQxl2U4t7RMs=;
        b=OaiVqeZNlTeZMuzRmxags8SPQeWCKE2KgVKQN/DfxRNArMbWoAGaRQKRM8yQLwz/6A
         a8V2ZZ4EfL2KmIZaep+IGOs7p+b6xyoDrZu+7lN01wrj4Odll4FWbsdO5FG96o1ksOhI
         3oVxo8u1t1nd8lNHC1IxPxWTU2K5txCD35G0iqnIDRnqHmKQsJmidfDsm+sAdIqJTyv1
         qbXFrg8M2nCZu00fImxPnLGPeXttFqNqm3ozBYw5ViPg670uL20vaMXLgfJYAxPnnnPe
         sMJlRASMEyPmKlz+BL6eoUh9LlfYtw5gJ2eoVzwXGpFjbjcXZvQ9t6Zw+KttHy1rEuS8
         e2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774945684; x=1775550484;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HctX+JDtCnX93Jc66Wju0t0pUUK8/Z+cQxl2U4t7RMs=;
        b=r4Z1Cw7JMMTu0h9ttq0MgkOWoqUKMhuQeG2EVeVrpeRi2onFVYEiTiUYXCoz+S6xPw
         1LLDGFPW4qosBRT9S0ZtaKGU2fa57LCI9KwctSjh/D90knWq+PbEN6oSSDdwrmAfYy77
         J4iGtvdckG0w9ORCopyqLUjzxj1DaEanDtMTwuAE1a5AbrBley6zt4ctui9JEgEaOgqH
         zLlqPu3WjrRVM6oKPxHSpJXRG9FGH/qDP9tymyO8IPV8jskZPC5t7byXGONfbScValTV
         dvTD1cnId26AyQA/LTlHKb5DacT5bNW7UiRdVcNvZy5fbuEu+U+oW5CxOJXbxHiKDbjL
         AjyA==
X-Forwarded-Encrypted: i=1; AJvYcCXq2PuqHRK/obUVwrg5THsVkl2sEFxrCG+e9UHwWJLftZFokIZe83UM4keVNL7NTk+siy0DCxOcVNM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTXTA29aET5QUttnzIUZD2FqLcAIdEMxnEwu5lkxSkdPzurGJ6
	f6yk9nqBz2XF5RQJH0MQyXrjVakX2ZdFv+f+SNIOMyG3pnaVEMQUfippaLSVQQoqXw==
X-Gm-Gg: ATEYQzxtBNzhRGAgjweV0DLksyoee6jF1mJJue9XMfH1EdawgzSomJ5ggGYR2wsgYmy
	WfLB44YYSpm7DSxlK6ZEwoXKaRopjPcceS74Gde9ZnP/dUx5kA4UI4HX722BYTgS5dbm1qc/7EV
	i5HAeUrLa/vzqYWs+GUI6OdlwPiY+VlUf0+fkkNQTg5Aj3HNJLB8mTXXbvqP1iMjdhdHZiXVkr+
	wuBX0k9rS/po7qK00QE0znlJnA+IsMN9mgpMbxSaPorA9HNN/9n2/6NTRWDhU0bYDqCoyyZEL0Z
	B+dprfZ09xM3hW25TVsMbHqEWU69oudsIPi7X4Y6IRxKwW5+XKmcXo3x32WHBrUVvPmcJPEWgy8
	3hpXDgr7f5LIAfffUCEp/FA6Sppcvdq3sCw9Um6oc/BpO8KEf5Yj95obaIy1TSZOdcJTYZPh8J1
	HC76Gh6Fq2dgt1SzsK7bKwJexq1L5RjjtCssUhcwYQpbUfULfVh0TSa+3FmKanSLyakdSSbHTHS
	hDPKcuiB12PbnE=
X-Received: by 2002:a05:600c:c081:b0:485:4453:401d with SMTP id 5b1f17b1804b1-48727d5a269mr196208995e9.2.1774945684294;
        Tue, 31 Mar 2026 01:28:04 -0700 (PDT)
Message-ID: <fd0eaa65-afaa-40bc-b1dc-476431577a3f@suse.com>
Date: Tue, 31 Mar 2026 10:28:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/pv: Provide better SYSCALL backwards compatibility
 in FRED mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260331082142.13254-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260331082142.13254-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1774945684-218FDDF3-5FC47879/0/0
X-purgate-type: clean
X-purgate-size: 1287
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0F7B1366185
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31.03.2026 10:21, Andrew Cooper wrote:
> In FRED mode, the SYSCALL instruction does not modify %rcx/%r11.  Software
> using SYSCALL spills %rcx/%r11 around the invocation, which is why FRED not
> doing this goes largely unnoticed.
> 
> Nevertheless, there is a difference in the guest immediately following cases
> where Xen would use SYSRET in non-FRED mode.  These are:
> 
>  * HYPERCALL_iret with VGCF_in_syscall set.
>  * Delivery to a registered entrypoint.  In the PV ABI this is always SYSRET'd
>    to, with %rcx/%r11 provided on the stack.
> 
> Debugging or snapshotting activities will observe the stale contents of
> %rcx/%r11 in FRED mode, rather than the %rip/eflags value they'd have in
> IDT mode.  Manually adjust them when SYSRET would have been used.
> 
> Regarding the choice of instructions in eretu_exit_to_guest(), a branch would
> be a context dependent 50/50 split (i.e. increased chance of mispredict), and
> only saves one instruction.  The CMOVs read the same cacheline that ERETU is
> about to process, so are as close to free as we can reasonably get.
> 
> Fixes: 76193ef47d91 ("x86/pv: System call handling in FRED mode")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


