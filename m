Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JYUEZyy4Gm8kwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 11:57:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AFC40CA64
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 11:57:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283177.1565453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDJTH-0007TD-Ad; Thu, 16 Apr 2026 09:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283177.1565453; Thu, 16 Apr 2026 09:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDJTH-0007QY-7n; Thu, 16 Apr 2026 09:57:15 +0000
Received: by outflank-mailman (input) for mailman id 1283177;
 Thu, 16 Apr 2026 09:57:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDJTG-0007QS-0g
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 09:57:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDJTE-005Qct-Lj
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 11:57:12 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0b278-e002-0a2a0a5209dd-0a2a450797b0-2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 11:57:12 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0b278-229c-0a2a45070019-d155dd31d8c0-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 11:57:12 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-43cfce3a195so4773139f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 02:57:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead3d5fd6sm12936089f8f.24.2026.04.16.02.57.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 02:57:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1776333432; x=1776938232; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P1MHw5bnb5+l/wRUhSLooZGFlX+KiX8AA9aEuHgJljo=;
        b=Fr9lS9hlpQ+iUUtFK5r1Hfik4CEaaiqRI1NM/BgM0JP44egJnKsVJzfOnCGaMCmyoR
         LPBDpK28gUtfseUAm7G0sUOYeCjg6CyH4xh8qbjADVNLbvcrWsluop9C+K/+WiHCRTU0
         rlG81xay8IWi3A0aGRmDcNnBk/BbQVgaEPENt7AZHbJsJM10gyxkLo3qQwSskhVrYwzl
         3zY5Fk4JPPfxS0VvP0xUIwxN72LwrG4KPmNn+JVuTeZHJwHdRJqnR1/5r5Nqfd9BdIlZ
         MjNJIdozrq8RJ1hmVOiibqtv5gsDuf7ZSFMGbbhIYmLJeltq1WnqMVZiK4P5Yv5Atm6W
         clDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776333432; x=1776938232;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1MHw5bnb5+l/wRUhSLooZGFlX+KiX8AA9aEuHgJljo=;
        b=SYBYER4BrYheimWrKXbLPt8Wf+PNQ4cC7pzTOiKhUTr8RuSpydY3NB4+//eWRabrro
         oPd0bL6DYHcj3tMc28Gj+BPHO9pg0wHI3+svHygKGJbvq3G8Fs47m5QFJ1sN+Y80EcyC
         WNC8cjEiwehMyB9KY5BpRqF1i3ZQ6dzgtuUIs4Fhx9ivKjpocQMRl1vFw+r7xJQZMkVk
         ExbjaRSLU8L5DZ795pSSjvBK010DcueokRBO9PFSVKbrOUacMJnQpYj3u4csKk5y0JNe
         KCjjBMCjUJ6Gbg8QEK6mgHfsXkav4BpXK9b5QpuvJpEKmQZ/rdjeDXtt0HC4PgBY2bEP
         9ueA==
X-Forwarded-Encrypted: i=1; AFNElJ/249jgSgig79TMJEPoHybo5kX4G6Lbp94meRMtBLwmUs8rmJZCSK71XqBgEmyX6FNX67iMUsd/iA4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNT7Cv7QaBiRPYF5CnFc2kFYUjDU6PpRRHrv6jLvyn9tkCAtyV
	AAIGIG14MAsF9wjK7n2h801r+EN63txf0FQYzWQOTw21xc0iVf69yqeEzqbzlCGTQw==
X-Gm-Gg: AeBDietvsk+UAsEFbNJu+hPPhvR6S/0wbTSRMHgc436FXjOK+Nz9HzC8cPdHY/UowHK
	x53EisdvMqdiKZfgB0MSrZp0fPFIUEXZGEsNuhnmAqNHH3eeHNnQt1IZ0QRtz2Q2pLaacgCAWMC
	3a+W8eZ408YJ6MoW1E3o8mHso0uPymmyXf+TNWgsUTYZb2FGEQ9ARGIQ4zT6rU9mmL9lLLg1jx6
	3SR7y17X4Tl47JLtPoGLMubAuPfkzymAW/+xCLaKYAaNNQg1EYTdtIqRDsdUtjRlegGXOF6ij18
	TOkMGkuDQ8/poXxSBkL8ertgrl8FWS/qotDnchmtjjVfb9LegTyIAOwUD/GIGs+aZoCJpt1XEqO
	CoBq1mUELJGHiVavOhMZMKRrWESo+Yq51p7S9xmgoY919UFpbipHebN74CmxfJd53+IskOgSe9V
	cHTW6Keg4vWAWqiH3IIsFoQh8m8RPlflEylG2KAbnhVxteyE83CfmggOfAO/fB+rWzPIim03h0H
	1foODON4gD1IcblM8PZPWRIdQ==
X-Received: by 2002:a05:6000:18a6:b0:43e:a638:250e with SMTP id ffacd0b85a97d-43ea6382616mr16084712f8f.3.1776333431866;
        Thu, 16 Apr 2026 02:57:11 -0700 (PDT)
Message-ID: <344987b1-a293-400d-8c45-af98119f07fe@suse.com>
Date: Thu, 16 Apr 2026 11:57:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] vtd: Drop dead check for permissions in lookup_page
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <815edfd0db90859a4ce270d833d9d721ff66e31c.1775814143.git.teddy.astie@vates.tech>
 <4f9e6615-b9ab-4c2e-9345-100e73eebbb3@suse.com>
 <70023321-c799-456f-920f-af7a7344de34@vates.tech>
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
In-Reply-To: <70023321-c799-456f-920f-af7a7344de34@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1776333432-15A59C48-634A5507/0/0
X-purgate-type: clean
X-purgate-size: 839
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 84AFC40CA64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16.04.2026 11:15, Teddy Astie wrote:
> Le 16/04/2026 à 10:23, Jan Beulich a écrit :
>> On 10.04.2026 12:09, Teddy Astie wrote:
>>> `val` comes from `addr_to_dma_page_maddr()` which is a pagetable
>>> paddr and doesn't leak the PTE flags in it.
>>
>> Did you read the comment ahead of the function, in particular the part about
>> the caller passing 0 for "target"?
>>
> 
> Ah ok, the "full PTE contents below PADDR_BITS limit" also includes the 
> R/W flags, but only in that case.
> 
> While I'm on it, there is a corner case here where "full PTE content" is 
> also at the same time a error condition of this function (if PTE mfn == 
> 0, we have val < PAGE_SIZE; yet the mapping exists), but that's not the 
> problem this patch is fixing.

Not PTE will have MFN == 0. On x86 at least, MFN 0 is special.

Jan

