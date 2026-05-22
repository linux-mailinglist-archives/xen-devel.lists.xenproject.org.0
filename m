Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LRoCdg+EGrzVAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 13:32:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F37D5B30B9
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 13:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316691.1586052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQO6Q-0004JE-Rd; Fri, 22 May 2026 11:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316691.1586052; Fri, 22 May 2026 11:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQO6Q-0004Hm-Nu; Fri, 22 May 2026 11:31:42 +0000
Received: by outflank-mailman (input) for mailman id 1316691;
 Fri, 22 May 2026 11:31:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wQO6P-0004Hg-3S
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 11:31:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQO6O-006HyH-1b
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 13:31:40 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a103e87-5cb7-0a2a0a5109dd-0a2a450cae20-48
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 13:31:39 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a103e9b-62f1-0a2a450c0019-d155dd36a864-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 13:31:39 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-44dd5cb0f81so5566419f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 04:31:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d70d89sm3734890f8f.37.2026.05.22.04.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 04:31:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1779449499; x=1780054299; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cS+xhpdW4/9T0o18/WwgltAV9N9KT6izsx/rOGJbAS4=;
        b=dOc09XxzvMNazY4jE/VCZiogCSGkOES6p8fnFFz5hYKMBMjWp6tKYa87Igvsy5rgjd
         xzPuzdDpIHUcKm/6gJTftmRdx3M6JeqVwlKjgoR50lRa3zyYZ7ehxLxcv9tz5a0k8nRH
         t6A4YiSk6I0U/hp/Uvpkxucw66la/05sFSqVbGlZuL1q7HgYpiIOAUUCH+V5kMuME/9S
         mELmwyNvfx5ywRSL+U0s/tr6oJLsoPsJWMpLFqQRBB2WoPd9T8BctW2I1R1YKNMZZL4w
         pls2HJcFjghixys647aVGrthGwumjz9ZR+KsoKiImNorUUfDkQX0jq2cnxGH5vyKleGM
         SQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779449499; x=1780054299;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cS+xhpdW4/9T0o18/WwgltAV9N9KT6izsx/rOGJbAS4=;
        b=Ml3S+uqVqfjW5lxqOau2vlf9agxAe/o8I+cOpAY0m+jXHk6lE7dptCBaGhxhRkKAXI
         8nCf/euK8Z7dMjx5je+zqvJIsbWO7e4USLx8LooT9L23zQbVQE//3eiciid9kGFJ6+lC
         IYWlcep4LdicNAxXFPB9pk6f/oY1G0o0Rggk4hK7O2eoMCZVaS7f0ST0ex5cbJhGENbw
         6FBQTMybZzVJxGVyA97S5DV2ikTtoPyyrrIZkMhH4w/P1PcpYp4kXzhK+To+HjTp+cjH
         qCZcKY81Zi1oWIH+vd9MrMOgGieTkvhz21Ozf8BAp9XlkDPU6QvxXZvNRj8FhwOklM+S
         J8Aw==
X-Forwarded-Encrypted: i=1; AFNElJ/8TkQyw35Mxm28UPKGSPcSJhe33mxJ6ktsbR04Jf2IqM0KDIGsn3MPvUzxy8dRcZEHL7q4JsG/N3A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWcJyScErM8+YVWoEW7W5SLc1neJ6DWS1Hs8/SqoUG5YiuzyKc
	HTzQ9LLMvEmJZkJj0ApV2/s8uuIDfU92Au1YncVsF6srstBbEJ+M57Jp8TXjDGP38w==
X-Gm-Gg: Acq92OHRdEea5K+qGRnYCAR7uO61cukKZzwnvVzowntC6KY4FrlQ4iwDVL+vp9KTfnd
	US0UPdax+YQYFbZ1Hc69EXVoXjedjeg8V/Opwtb1DIndTG6aMiiddRMXvI4X1OHOBf+ShvQUHNe
	AYJEjPAkks+6bDR6gNSxBiLeYWs2ckQdG28u56LDg/Pkxfexo2IJJxCjQ6VFKaELkwOcKnK7Z68
	1LMURDpcp6sg/cyfnUaivZc3HUipr7HY0eojfJABOZcZ4t1WQAJILoK/9hiy1Fo38Z9kBubgZna
	JofSxpZenufuA3XZHCwRfFjHsGn5wcw2SOjQ6V+hqqZpj3POjGYnUyPdMYtu6hhK1dRYq6rzOI7
	A7uw4hiKKUOgNkYeP6/sr6ta4IwOR3TwpnXnW3m7sQU+fpmA7KEGFS21a9MH31Ewc+2CljCa6XQ
	wMAE75gq+Z5dPA0P6MFJhc8EfQGVN0XJqFkr0Uf/fz6x4ICRS1VxKuEnE8d9j3klvLnnMF0j+Ui
	cb8HLeH1s0hJVE=
X-Received: by 2002:a5d:5d81:0:b0:45e:91c1:2518 with SMTP id ffacd0b85a97d-45ea31a1efemr10182196f8f.19.1779449499176;
        Fri, 22 May 2026 04:31:39 -0700 (PDT)
Message-ID: <8c394056-36a8-426c-8c09-ec7594202b4a@suse.com>
Date: Fri, 22 May 2026 13:31:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.22 PATCH] xen/gnttab: Fix TOCTOU race in
 gnttab_set_version()
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20260522105709.25073-1-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260522105709.25073-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1779449499-E0F62CF5-C4D05F02/0/0
X-purgate-type: clean
X-purgate-size: 957
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,epam.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,xen.org,gmail.com,kernel.org,epam.com,lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:oleksii.kurochko@gmail.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Oleksandr_Tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7F37D5B30B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22.05.2026 12:57, Alejandro Vallejo wrote:
> Move first read of gt->gt_version inside the critical region of the
> rwlock, otherwise concurrent gnttab operations (silly as they would be)
> may get mutually confused as to the actual current version.
> 
> Fixes: c1488502c949("grant-tables: do not fail attempts to...")
> Reported-by: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> There are a number of lockless reads of gt_version (e.g: right after unlock),
> but they aren't very worrying because they are effectively snapshots of the
> instantaneous version. I'd feel better if they were all atomic_read(), but all
> Xen ports guarantee atomic access on aligned 4 octet fields, so I couldn't be
> bothered to go chase them.

Sooner or later we will want to deal with all (latent) problems of this kind.

Jan

