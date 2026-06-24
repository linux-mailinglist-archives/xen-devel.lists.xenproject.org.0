Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dZKoChzuO2owfggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 16:47:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F126BF497
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 16:47:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=J+HbnCPv;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1345063.1604068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcOsq-00065x-KZ; Wed, 24 Jun 2026 14:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345063.1604068; Wed, 24 Jun 2026 14:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcOsq-00063n-HZ; Wed, 24 Jun 2026 14:47:20 +0000
Received: by outflank-mailman (input) for mailman id 1345063;
 Wed, 24 Jun 2026 14:47:19 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcOsp-00063h-9E
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 14:47:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcOsn-00GBLg-UO
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 16:47:17 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bede5-5cb7-0a2a0a5109dd-0a2a4507e656-34
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 16:47:17 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bedf5-9c8e-0a2a45070019-d1558031dc93-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 16:47:17 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-49258ac7294so7484455e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 07:47:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fc47720sm809664825e9.0.2026.06.24.07.47.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 07:47:16 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782312437; x=1782917237; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gn7qNh4hUu63X5G5nP0M8Z4qlGZDt0v0FFzHvFsi8JQ=;
        b=J+HbnCPvogQKnl4NlnpugOiKcVHw1005uA7whlFQ0KVoTTfCk/pf5jqlWmHLZtlQKh
         6CZ6KZOe2D6up0MQPC0O0qBUeB/c2hVLvf4MRWU6nM7K53OYhkg/HtolTF0TcLPNYnaG
         Shb5dXLvvYLzH1ZpUr4T2s6T4UV7L8eh++s4F/7QGEAZLvxjyp5YSnnV+b0GRMgx1UHN
         NI1OzfgOIV93t8ahQL6QKed+udg+hubBupoxq+E0glkn/RGyPiX0zFmdXFclBrbwPKYr
         LPr9kjE9tfn5pVqFRYRO14KE6FOsb2gHOna0XzqWZsUCgr/CeKQZoUJ5RhpyWENSCcsW
         40kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782312437; x=1782917237;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gn7qNh4hUu63X5G5nP0M8Z4qlGZDt0v0FFzHvFsi8JQ=;
        b=qOjhyQCtWMl6kkyWhr7W1M67/YKSbKeRA5PrBqKi/nzgCW3UZUhUOA6hRAgqo+jW40
         IQdXeUuZ9i49JKjJnk8Y1ldnPUWJRBZQhgzxw7if3pZyQBfdgDBjn4gjeW9yVphKBoYz
         oNr1hJ2V4Ei4ktRolddW9jAN9FId9O+fHlI9RalsMjDpgW8xEAJ6nUuV6Zej3tiCXMvx
         /uUjLtvGI8ENkroxOV17KDul56v9sf42QoMd9jdOcQixdPh4QS51L53OXe8rilm5PTMl
         t+6m4S0N8+CiRp70czDyDpO5LzT3cTKSxhKqbczNF1+pUx+JLxpPPtwnp7yP5MBRDFuC
         KqEQ==
X-Forwarded-Encrypted: i=1; AFNElJ8PS+aRasWi3XzGC7Qc7ExL4jbKveBFMd0TuQuJnHVAdh0IDnEiJHIQsY72ep2jo7DLJM+mbOaDoVs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLYYMi/ok7WsNMgxCNYleyL3FWRFlnn4goAuQdbYKWecLdi4iy
	KCa69BxVdQFMdRCMSHFBFNNLt0AYttsdmiWfVGLaAVq94InV7OyE38QZU+Ej2Eq/1A==
X-Gm-Gg: AfdE7cnt6FBujD03kjCQrPnkI0gukprvTSX29O8fjOhJSl8YLAonMI59sWlBM5q4Oj8
	G1Q4nsF7T5n5wfKLv1vKOHHw0+ciw6BNyZTF027hDMJFLOtgb+dXmIjc6oexhgaSAG7yv1emtiz
	RCm3i7bnEl/aWy/f2vzJ/0E5cFMFtJA4zKzFp+6K+AronY1CEfQEREjoijuVNL17sB1jaYq+6o9
	ShpqyDUFz83o6PhkZXLgQ3FlWQl0FVu9sEKi4lT46paXyczyqpHIMyr2s8o8H/iK0jz9ku91Ia7
	tfb237DUCpEYMQiOozLFAHraY2BriV5BaVB5WurZHZNMh4NFovu/6ro6JHkyk0QzKTQE2Yce7Iv
	y4cvhY0afeg5k0MetlIf9ejzFS6hlx+6lluzRMk6XqnIpL8AsoaEDrIU8z+my3bUYN+2AZWWiSh
	Z8Kp2OjlwQuM5NzWQD+5Sw67Q4kuVlFFWdAkMMMNlkPrN4rQbV+1IG7nsu27oXqHLaXnQg6mQn+
	a/A
X-Received: by 2002:a05:600c:1daa:b0:490:da12:f1fa with SMTP id 5b1f17b1804b1-4926087853cmr47525835e9.31.1782312437207;
        Wed, 24 Jun 2026 07:47:17 -0700 (PDT)
Message-ID: <a7ce9d22-7ab9-4638-8ffd-2ffb9bc55df9@suse.com>
Date: Wed, 24 Jun 2026 16:47:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/fred: Send an EVENT_CHECK IPI on exit from NMI
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260624142338.653064-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260624142338.653064-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1782312437-FCD2C25E-EB3720A7/0/0
X-purgate-type: clean
X-purgate-size: 696
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74F126BF497

On 24.06.2026 16:23, Andrew Cooper wrote:
> --- a/xen/arch/x86/x86_64/entry-fred.S
> +++ b/xen/arch/x86/x86_64/entry-fred.S
> @@ -20,6 +20,12 @@ FUNC(entry_FRED_R3, 4096)
>          GET_STACK_END(14)
>          movq    STACK_CPUINFO_FIELD(current_vcpu)(%r14), %rbx
>  
> +        /* NMIs need special handling on return to guest. */
> +        movzbl  UREGS_ss + 6(%rsp), %eax
> +        and     $0xf, %eax
> +        cmp     $X86_ET_NMI, %al
> +        je      nmi_exit_to_guest
> +
>          jmp     test_all_events

Actually, how about shrinking this to just

        test    %al, %al
        jnz     nmi_exit_to_guest

by having entry_from_pv() return a boolean?

Jan

