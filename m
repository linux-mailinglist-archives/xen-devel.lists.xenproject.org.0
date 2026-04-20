Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKnhLvUb5mlurwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 14:28:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE7142AA90
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 14:28:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285774.1567018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEnji-0004qI-9L; Mon, 20 Apr 2026 12:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285774.1567018; Mon, 20 Apr 2026 12:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEnji-0004ns-61; Mon, 20 Apr 2026 12:28:22 +0000
Received: by outflank-mailman (input) for mailman id 1285774;
 Mon, 20 Apr 2026 12:28:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wEnjh-0004nk-CL
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 12:28:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEnjg-000Hjp-ER
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 14:28:20 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e61be4-bab6-0a2a0a5309dd-0a2a45048326-4
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 14:28:20 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e61be4-1dec-0a2a45040019-d155802eb53a-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 14:28:20 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-488b150559bso22925645e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 05:28:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb78becdsm130262635e9.5.2026.04.20.05.28.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 05:28:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1776688100; x=1777292900; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0d//JYtNktUN440nEjo/g7SWFPBqv6FcWXq+gb4h1zY=;
        b=NPNPIFQa7KnKHq6yekHmu3qHS1LJYtX9d7QwjO4uHA4D4vQjF1K1rIL1+tJVvMdXaV
         7hMqlF9C6YPWqa0VfoIE9sTFQj5aggFyDJJ3UQnMROcB8p+Idm9ftAgRi13tLzcaHUEY
         0It89YO8vgC1nBhHKH1OqG2nVzBn6Rsh6giGb8iPCdeS5JEeON3hrQcEh9C9WdzhCcHV
         EMKQo/stA3NmHk+t0DB8yAJSdeREZNOmxd+6bWmIfpPucI3b7wt4Ml4GbASgE5gVk6qM
         vJILVTmpeM8RdaNR9gxukA+VEo41BEe/qTC3wLqCiyeIu7mY7d072krJqbdgIIgPo0A7
         D1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776688100; x=1777292900;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0d//JYtNktUN440nEjo/g7SWFPBqv6FcWXq+gb4h1zY=;
        b=A7m+WbE1Uk3AMOT6IJ/hcWsSgQiU5aGulCM6l9yKy8zuA6mDAi85Zwau2e15/eN3RE
         j+ZfW6ZDezF//VsYyJgLRqe5P5SVZVCoDJyDt9phR2lJnp6tRoHPJDe+0jVWIZgDyi8A
         F1BxnOsuJVkmruLh7evOJHhNLm92/+drZIS7w172sFNo6eTi5XaDCrukYC5XqLo4AwQ+
         yeGdm40HvKT412cGnLw4LBmpze/t74021je8XPIw2HHZNkm2rDDjkF+w8Ivx+xiD11b4
         O1vcF48Hcf5wBvW5dCqRanOZduyS0qJBqDqn3SslL7eqg7pTjuv1N8mhGwGWChqmi20p
         hNCA==
X-Forwarded-Encrypted: i=1; AFNElJ/PmZM6YZncaeUV+U/MhSYm467ebkOMH6a6Z8u27qTKKqzcpPz2J50+Rn9DERB9wR2DzGO+BN+o+9k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+BpTfO5qUBgNvpTKjXcYhRNX/RoZGcCD5ww7f3HUix9TLRq4/
	ANTxfXIomFAR+RigZIaItLpzoQMg+/3ZBv7rrJN5Vw4pnvKTpCT5hS6ySI/1/33dQw==
X-Gm-Gg: AeBDietE6N/SIa4i7IQ2ryPesaMUSDQuXoRgyAuJL0SbKitlfgPMQZTOjV34KMM2amq
	PUqqyGT/tTnZ6jORFMr4EL6Ni+laYKxoX/jMI3Sr34CCXBzA46jnWh5rnkX2PYoqgcwLTWvC8j5
	48R4rVwVpHzrXXzqxDYICp71d2CQcyWzkGyYezipSUWIPwiz7gs8A4kdUHu0DGZ+SlMzJwMaI7H
	Oubu/f38YbpKr8l6e/7Ioea1tX7O2M7XNK43YMdr7L0SWGgzLS69T5KkHJ9R4Uf7onx5hblh+eY
	fA8Cd8+GOIgJMcE+00rj0jO9SMVEvJwyJ7qgO+FfZHrGkVl3HP1TrFfqY9sbBtwKhddJbq+2Ag/
	hOw713QSm7JrynxNCiGlHNLxpRSCu8QbtsVwxxmSl4a2ShjZzZEnBxbbewrHwBpOHUec3HWYume
	yBu3Rea8Pc3FS/Ip94ef+LEWgs9RbNmaAmQrKRHoVzdS5uJL8b8a9i0CQ4qi5QZW441F2H0ZIgW
	yQ4jKMs11pgNGHYzo2YR5e4Bg==
X-Received: by 2002:a05:600c:4c08:b0:489:1c1f:35f1 with SMTP id 5b1f17b1804b1-4891c1f3850mr30176225e9.4.1776688099722;
        Mon, 20 Apr 2026 05:28:19 -0700 (PDT)
Message-ID: <ef1e2846-2f75-4358-a6ed-a7d45e617fea@suse.com>
Date: Mon, 20 Apr 2026 14:28:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arinc653: don't assume Dom0 is the control domain
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <89d17a24-0a1f-4f3f-ac2f-f3701a8d78dd@suse.com>
 <4a4c011e-9666-4416-be1b-33d1dcad5afe@suse.com>
 <73e51afc-ae7c-4d08-9054-75dab660bf42@suse.com>
 <ca934061-f3e2-4511-bdad-465c4f2d0de1@suse.com>
 <fa04f9e1-bc9e-4b34-84f4-dc7ca8999eb3@amd.com>
 <4dfd48a9-37c1-4f28-87f3-19646a339b08@suse.com>
 <7ea3a5d8-f9ff-4296-9b3e-07b9ba184e6f@amd.com>
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
In-Reply-To: <7ea3a5d8-f9ff-4296-9b3e-07b9ba184e6f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1776688100-2AB633FF-CE5717FF/0/0
X-purgate-type: clean
X-purgate-size: 253
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:nathan.studer@dornerworks.com,m:stewart@stew.dk,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2FE7142AA90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07.04.2026 13:27, Stewart Hildebrand wrote:
> I think the patch is good as is, but I just want to give it a few more days to
> give Nate or others a chance to chime in. I'll follow up next week if there's no
> further discussion.

Ping.

Jan

