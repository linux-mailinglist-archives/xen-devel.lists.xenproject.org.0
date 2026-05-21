Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGK6AQIqD2q3HQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:51:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B705A8A85
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:51:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315467.1585278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5g5-0007hK-6f; Thu, 21 May 2026 15:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315467.1585278; Thu, 21 May 2026 15:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5g5-0007ei-3m; Thu, 21 May 2026 15:51:17 +0000
Received: by outflank-mailman (input) for mailman id 1315467;
 Thu, 21 May 2026 15:51:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wQ5g3-0007eb-Ns
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 15:51:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ5g2-003eSf-PA
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 17:51:14 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f29f2-2eae-0a2a0a5409dd-0a2a4503c5f6-0
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:51:14 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f29f2-672d-0a2a45030019-d155dd29dd1a-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:51:14 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-44a74032ff8so4640194f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 08:51:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eaa93633esm3582915f8f.29.2026.05.21.08.51.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 08:51:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1779378674; x=1779983474; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PieY2pQCCzUH4HvZvOpg+9b6oKl0+43Sg85jO+kPtXM=;
        b=M4JGarKCbyyapYgoWHiopSMictMEXSAIXPhe7YRcej2nDvDZ4/sIw5yieosLDnNDNb
         XgEHHbWFIsCF+T9e/Ny8W8bg2L3z7CP62oaosecqShB7pwgNOy1yVE15rvTzxSPRdauu
         DIC1mdfh1tyelKq0xCaXHEpdq/Is5B4pP8x9natH5fMSs1WlYK/vgfwiGXpjLQbstXtL
         6Az+Wxz2ohswuy2bDrkMDz2uLQ30AgveGscT9lUfwa0Un9JslHSyRXWh4lp+p+Ka2rJp
         hmA2+h2E5rCtRPAm+ZoSiOmexrGhZWmYiuq69qAJTRHLyYr5x+wG7HtvY8LEHFMp/YhY
         eNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779378674; x=1779983474;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PieY2pQCCzUH4HvZvOpg+9b6oKl0+43Sg85jO+kPtXM=;
        b=SP+kvJZTjR059Uh+0Yr5vZfTOWt6YYGU0xRJd5IO7Q840XXO/u3xkkiwmVdUWedDgj
         fGipxQux89ZojC1ts4BBNcKieQkPNJctFXglPA3lV7AFtTXGkLZZoCKQ3+FfIw9lfdsL
         DTuImJi1JuSZp5CMIyWcLRZ4zzBNcHQZ2IANGAjXDxL0ozFms/vQLD1KUzSSn4Qm0Mzy
         yGhzCFyiAp/hMLu6fytCN3frutLPFXrqLOJC+h/hOO23uDqqNhEXSSFAQ4rv6u6YIIgG
         pW9+AoGOzwDYWYA5P4P6dvedVD46IvxQavxmbAATeBNntzc7U93l3zfiCQJr2dzXelFQ
         39PA==
X-Forwarded-Encrypted: i=1; AFNElJ/dsnJbvryu6P1JolAmPr4U4AeA8s4vp07hBrnWQcFlX/dtXw95opo5+XAo4qj1vYfAayLFLDvgUj4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwRR/Y+X6RyPyMKR8gfT77+K0dO7X0prO9j75YSdQ4YQU8j2pGK
	PMv6j4Dq/oLoiv0aIUJJ8n2G0wlcabc3zUwJUswj+a9m2hWMe1IOsUjR6h4v/0NgzQ==
X-Gm-Gg: Acq92OFxw58SCOjB/xdUTKnkNHKnW7dJDuR0DMQhxikhSI651VypfHJXYb7TGldp6SC
	3yfyGkCgW0iJqVlUlwa17V4suc4XH0LQVc7+PYVfMxACH7CUq7DhuorP7viEjblLk+11ughCNaM
	Jz3LXJs5anUZ7jqzuO78r257mE4xoRipdZH7TJ06Hg1WdIdG+g8SNa9jNcABXgF3h7th+xqbnZJ
	dpqlNzlX/dlDOuQkt+nLohUcAstZcuUZiL98SipOVRQv0keivL7Gd7T9QnpTb7GqvHDwOSrtflh
	S8H5be32oCkv4EJP61ACBy1/2opOpVHrvPsdXYVsKhHDxnzinR/W/G9iinXWwAsWCX8ImHXkOPn
	uLAIwjZOwOe0V7wVxVwNVds9jZc9e4VhQ/XPLkxVz0Jauqdx8U+y6dJprgsKqhl/mJ7Byu6Pbg9
	phlvGGb2Sa74PHXoenfltJGyWeRaWIRMo+1bPxOZwWiaOd3x2MaJboaay5HpKYowvkefoWAbU7s
	kwzkoorzGh3aXE=
X-Received: by 2002:a05:6000:25f5:b0:45e:8547:f217 with SMTP id ffacd0b85a97d-45ea410993cmr4707466f8f.37.1779378674189;
        Thu, 21 May 2026 08:51:14 -0700 (PDT)
Message-ID: <ca7c7f2b-ab85-44ec-a62f-1bab60d045d6@suse.com>
Date: Thu, 21 May 2026 17:51:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v6] x86/svm: Support vNMI on capable hardware
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260514175623.1869042-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260514175623.1869042-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1779378674-3BF6A938-3CD94CD7/10/73395122804
X-purgate-type: spam
X-purgate-size: 1848
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,gmail.com,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,vates.tech:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:abdelkareem.abdelsaamad@citrix.com,m:teddy.astie@vates.tech,m:jason.andryuk@amd.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 67B705A8A85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 14.05.2026 19:56, Andrew Cooper wrote:
> From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
> 
> Starting with Zen4, AMD CPUs can virtualise NMIs for a guest.  On older
> hardware, determining when an NMI is safe to deliver is a challenge and Xen
> does not handle all corner cases correctly.
> 
> With vNMI, there is an enablement bit and two new bits of state in the VMCB; a
> pending bit, and a blocked bit.  These directly map to the CPU state for
> handling NMIs, and are maintained by hardware during the running of the vCPU.
> 
> When vNMI is enabled, have svm_{get,set}set_interrupt_shadow() work in terms
> of the vnmi_blocking bit rather than the IRET intercept.  This allows an
> emulated IRET instruction to re-enable NMIs.
> 
> When injecting a new NMI, simply set the vnmi_pending bit; hardware will
> deliver the NMI to the guest at the next suitable juncture.
> 
> One complication is that, when delivering a second NMI before the first has
> completed, the mix between common HVM logic and SVM specific logic will try to
> open an NMI window, malfunctioning as it does so.  When vNMI is enabled, short
> circuit this to not consider NMIs blocked.
> 
> Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Teddy Astie <teddy.astie@vates.tech>
> CC: Jason Andryuk <jason.andryuk@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> For 4.22.  This is somewhat overdue and makes a concrete improvement to NMI
> handling on recent AMD hardware.

In particular with this remark in mind - should I perhaps pull this over onto
4.21 as well? Or are there dependencies I'm overlooking?

Jan

