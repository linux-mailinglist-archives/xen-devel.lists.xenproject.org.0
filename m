Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBZXDCcYD2qVFQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 16:35:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9621A5A763B
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 16:35:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315298.1585117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ4U8-0007ol-SW; Thu, 21 May 2026 14:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315298.1585117; Thu, 21 May 2026 14:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ4U8-0007nK-PR; Thu, 21 May 2026 14:34:52 +0000
Received: by outflank-mailman (input) for mailman id 1315298;
 Thu, 21 May 2026 14:34:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wQ4U7-0007nC-OK
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 14:34:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ4U6-00GuRf-Mx
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 16:34:50 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f1804-e002-0a2a0a5209dd-0a2a4503e8ac-10
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 16:34:50 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f180a-672d-0a2a45030019-d155dd31e818-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 16:34:50 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-44e5624c053so3847223f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 07:34:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eaa9358d0sm3008572f8f.26.2026.05.21.07.34.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 07:34:49 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779374090; x=1779978890; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FHpTqvrtPipZsB8bxnLfRL1iHtLkmSgdn8fCyGOIxnQ=;
        b=fATTcVep2AAy10mzBnl4lC0edj6oi3fFv34Kyl7H+16BlZY9mfOvsooxFkhwnOwz6q
         0T2pCE66DoNH3Xduhn0qS6b+X8L4fiTZKLYUnCBWeXzHTuxAAAjHg7lhaCSa+Zbw09zD
         RribNquJx/2/Fp0NAj5Xqe2mcIQHDopD++us4YXU5sUynwZKD2MG2PY6+RkWx1Cf+qM3
         0BLVn3De+6sixZ/JmylkOTXGMV5A/UMmQCrt6eKDd0+uy3cA9QdjMcjUHjeW/miiwjBO
         Zr3QYT4rKNXgNi9HeydCLw4/5wgSWmLUpBrGtEa0EiAQifDvCuv7MhbYJT611xdlAaTs
         ry4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374090; x=1779978890;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHpTqvrtPipZsB8bxnLfRL1iHtLkmSgdn8fCyGOIxnQ=;
        b=gBd6Wp0L8n21Nl6PHhB74c6JIIRpJ9IIpm0psYqn9teLxhzwFDufXFtEwSxypJTPPw
         FlLqP+na6Qeu9tL9p+HstmAgrHU/n/yBW7+aCXzW6bdF7jWWyitDkkJPHyAvfk95084h
         iyAI0kQZKKQBE3yOlphtWHNcLIgPLjxj4tPUJySljPfA1c6BhTLlx7LIeKzwY5G6qXdF
         NEN5ihqrSM88AXbUsk0FpARYW3sdICqiTG3OsAzcqrZ7b2gpEBzxoIP+Ce1v+2R1oAFG
         eVq1nZXXCB1RmVITqLRqWQmWep0WzA8GzAkqxx9s5xwuD5BXnLdkv5qESsbNiCEV7BHL
         /tYw==
X-Forwarded-Encrypted: i=1; AFNElJ+Cq3jaerPWvCcy6YroEHCuEWArjQsfqu192AO1MNI1/i6DXmuX8+6HebixGRiGn04VUwCAoDZ2Ioc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzuNS3C2FEucnQ4FDAi9N3NDRVyFPpkZi6qmEj0K88xfBEFHfZZ
	jsPeGN1+RLd3aXMiAdyb3iLJKZMMuaCOdBdLv09ONSb4ZROxTneI8RfMhwCDZwS4Gg==
X-Gm-Gg: Acq92OFu/uCIS9XtxzC1oQQId2gffMSFitOUq5zpx93EUBufym9UtVMh2nICdg0MVbp
	lwXU4g7a8eH8SkwZCpwtS4KHJkXz2AUDHKToqvjY5ax9zKHSepGWvMawVYHh5zr2XSDVXJF5NbA
	bOBH+zMwY67ECj1iQh52+1qOXg987Hptq3WNq2EotQ8mvCRh8NwEW6LHqfNhXaiHYd53zUPtLg2
	crfqbbTJN9tlMFDB0xIvnfBj1CCgTnJQqGH6NaLd3KI399BqfYY7f3YQtc13dXpMWZcZhmxoxQw
	acqCEwyC3V9d7S6KAHWOUwVMViXNLHQWP2va8F+ZF33B/B87UggN2ExbxQxjUH8h7S0xOtxBD4t
	4zqXVmNMepQMAUKO9uHNdb6qRNzHvA6+Gd7oKNsauo/DjHTxB6xt+cI48bGQYyEVS3Mkh5mVRyi
	MhYmVDUWFmnbm1DoeqR3XeB36gI2wB30NNbdhfj52saQGDytHziD8KCnHHnUE7K9pGzxOYyWcS7
	3D5fjEFkp8aaUM=
X-Received: by 2002:a05:600c:4a1a:b0:490:31e:d6fd with SMTP id 5b1f17b1804b1-490360a6470mr29609585e9.25.1779374089739;
        Thu, 21 May 2026 07:34:49 -0700 (PDT)
Message-ID: <d87a4771-b2c7-4696-a45e-726821bf1963@suse.com>
Date: Thu, 21 May 2026 16:34:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22? 0/2] x86: don't exclude time.c from scanning
From: Jan Beulich <jbeulich@suse.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2ad2b572-45b4-42a5-9b7a-80eebfacc80e@suse.com>
Content-Language: en-US
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
In-Reply-To: <2ad2b572-45b4-42a5-9b7a-80eebfacc80e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1779374090-39D7B938-62073F65/0/0
X-purgate-type: clean
X-purgate-size: 329
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:nicola.vetrini@bugseng.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,gitlab.com:url,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9621A5A763B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21.05.2026 14:25, Jan Beulich wrote:
> 1: x86/time: address Misra C:2012 rule 8.3
> 2: x86/time: don't exclude from Eclair scanning
> 
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2543286982

With the quick R-b from Nicola (thanks much!), what's you're view towards
including this in 4.22?

Jan

