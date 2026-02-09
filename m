Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LB1MxQOimlrGAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:40:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 401AE11298A
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:40:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225775.1532349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUJX-0005je-Em; Mon, 09 Feb 2026 16:40:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225775.1532349; Mon, 09 Feb 2026 16:40:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUJX-0005h9-BX; Mon, 09 Feb 2026 16:40:43 +0000
Received: by outflank-mailman (input) for mailman id 1225775;
 Mon, 09 Feb 2026 16:40:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpUJV-0005h1-EK
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:40:41 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d564b8d-05d6-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 17:40:33 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-4362197d174so2700418f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 08:40:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296b2facsm28295237f8f.9.2026.02.09.08.40.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 08:40:32 -0800 (PST)
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
X-Inumbo-ID: 0d564b8d-05d6-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770655232; x=1771260032; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zxdl78zFgRanrjsBv8rgM0aFo9htNRT0OBLPTkd7KB0=;
        b=Uhumbi/AdRT8NqYQhzoPdbEQOBhFZgAsn/Je4hat03lfoqfe+sI/otYAnx5Vs9CYDd
         nb5281HzokpwZ4ElDyAi6AJ+wxEFrCGGetD0zWRP1MrH3YuzcVcd0cJ9KE0Fz+dHI+qy
         zH63nc603I4gEiq7NwVv1VMUohU/1kKLGx41i1QwSWV831M4Qbk0z/yr5md3bSKSE6lw
         xezrTdSVyl90TPq8j54QhIrlZ4VpUQtAvBfVjG0cBNcQD5fDpSvVP1qeAl6YJoaVelOg
         mz34TbM8kbmNu/FRVrY13hZbS6jc6QgarsyGHa8CEAgIAo/zQjVg13cZP2EgHdxcAWq/
         BM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770655232; x=1771260032;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxdl78zFgRanrjsBv8rgM0aFo9htNRT0OBLPTkd7KB0=;
        b=s1fKfM9r80Ybn6CVm8n3x0CO12sgBVHrGYdSK8Csxcnj7KO0eX3xSvZdRCLbxAEyXc
         4Gc8a2jnOwIIn5QaZK8qK8TdCUKb0UZfBB48E98tRzndSy7f6y7rsXsgOm42FhiF1Fse
         +6h1rYx2KF5DuPEDyaehKF5mY/mAzsIExbTGfzzCq6MV7W1UZbGOX55ff7J0TLoISiSx
         27ifcWrbOHWnDmgc8MRbmEOqou333WjYofzU1Hxqe/IjucOlxNCZptZwjZcioPJ57GW+
         CS/WozEG183ZpiiXFs9QD+GO01ETDMSaS6HW6QfRuDTQqmaI5n5kzgW9735E6Yq5ZgQV
         7jdA==
X-Forwarded-Encrypted: i=1; AJvYcCVUoDZ5kXgyaRuAsmaVlmioLeTEaezainx0vColeM2Hr5q+bCE4rra6fF/oHAYrEVKKKk5jY1pe6r8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpihBuEzglf/r8XEvN08xpOBrcN2Kre6A4RXYbu9mnqRx3ykXl
	uoDVpoYViCys4NqOLI1Th5w7PCv6HxthglEP4vHPOtRDY4ABCM7rte6Yu7T8Me7pIg==
X-Gm-Gg: AZuq6aJR8IU7REx9tuK2oCfB3mUfVGBAfSnz6/PIjNFQjUfTwOphnzj1eXoxb4BEkhi
	87FlS6cM/8C21YU61+4rSyyLMSI6kvyKAcxLffqLDAtYLUvwwh6Yz8kLhob+ATOnN1j5AWz/s+P
	UEeVbchirLziuBBLvVQzzIJg2LnpIrUtxzZD8B2UxpdX40cjwBIKSoQIIMDZVYRTk0lK3k+OLzN
	kYLVM0mUoblFo6kc3IumALhXfCK4sMLer2O/lSB4F8xxWJMmka8C4fu4OQhw7KzGEuRAkLJtgeG
	PPf4LSoSsUybJjbESHTJNusmNB4wil/nFDJZBX8yyfAw0ykEhpv/Mps0p1cZmgrjKVYC1o2jozK
	JtWu26nIPe2rkouj7Ysom57A1Mao34QId59P+YrrurOdUonQ3ew6q0MrbjfMOHp0+IrLzJ/M4P6
	OVfIwlHdiyD4XgQHSW2qdZAaHGUskdD17iEhzNA3UzhfiMB7n358KrHbY9IQsA8l45ruOeIkgdW
	/k=
X-Received: by 2002:a05:6000:200e:b0:436:10bc:d718 with SMTP id ffacd0b85a97d-43629385b22mr17326357f8f.57.1770655232309;
        Mon, 09 Feb 2026 08:40:32 -0800 (PST)
Message-ID: <3b452d1a-97c9-41d8-9687-36b702309f47@suse.com>
Date: Mon, 9 Feb 2026 17:40:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] xen/console: promote conring{,_size} to
 __ro_after_init
To: dmukhin@xen.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20260205013606.3384798-1-dmukhin@ford.com>
 <20260205013606.3384798-4-dmukhin@ford.com>
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
In-Reply-To: <20260205013606.3384798-4-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,ford.com:email];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@xen.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 401AE11298A
X-Rspamd-Action: no action

On 05.02.2026 02:36, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Both conring{,_size} should be RO after initialization is completed.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Ah yes, that's one of those things mentioned for patch 1.
Acked-by: Jan Beulich <jbeulich@suse.com>
preferably with ...

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -346,8 +346,8 @@ size_param("conring_size", opt_conring_size);
>  #define _CONRING_SIZE       (1U << CONFIG_CONRING_SHIFT)
>  #define CONRING_IDX_MASK(i) ((i) & (conring_size - 1))
>  static char __initdata _conring[_CONRING_SIZE];
> -static char *__read_mostly conring = _conring;
> -static uint32_t __read_mostly conring_size = _CONRING_SIZE;
> +static char *__ro_after_init conring = _conring;
> +static uint32_t __ro_after_init conring_size = _CONRING_SIZE;

... the type here also changed to unsigned int (as set forth by ./CODING_STYLE).
Happy to adjust while committing.

Jan

