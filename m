Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +JXPAXaGQ2qYaAoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 11:03:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B586E1E1C
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 11:03:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=KEU9zEqv;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1348554.1606288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weUNP-00087q-DD; Tue, 30 Jun 2026 09:03:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348554.1606288; Tue, 30 Jun 2026 09:03:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weUNP-00086S-9q; Tue, 30 Jun 2026 09:03:31 +0000
Received: by outflank-mailman (input) for mailman id 1348554;
 Tue, 30 Jun 2026 09:03:29 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weUNN-00086M-UE
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 09:03:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weUNN-007E9b-Av
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 11:03:29 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43865d-e002-0a2a0a5209dd-0a2a4507a63c-8
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 11:03:29 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a438661-9c8e-0a2a45070019-d155dd2cf1fe-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 11:03:29 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-475881b9a4bso635019f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 02:03:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47560effc81sm5967397f8f.0.2026.06.30.02.03.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 02:03:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1782810209; x=1783415009; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YMdurrCjkAFB6kLU4mJ9X8JsRPtQFSzhWnqZcgecDy4=;
        b=KEU9zEqv30VOMNMOjspRc3VYBLAt2m23oRdDTph+iBfIqf/6vMWPnsNBOx6k8tMUYQ
         WzeATvTLJ4pTTYjWvQuVmJAq6sNyyM+2/fJFwEVbKR/pGCwW5QZevULwtiLxoRJInFLO
         2zqDRQjx+3BIrabepeHlZ2a7pNxg6pIGbjocyT4P66QvJjFu60BI/rckzeREKnCzpqgx
         wUZ6ml1mjPdWtVGY2axgeoTztUTzQMLCFOzqH59E7ZgoDF2JGF5/xWEhLsp3miaxJzMG
         nZWIQND6fugqQnKPhyIcztl2raLxuDs+ECamVatomjlOSfuHBj5NxAs+EsAz310dQbFN
         4MqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782810209; x=1783415009;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YMdurrCjkAFB6kLU4mJ9X8JsRPtQFSzhWnqZcgecDy4=;
        b=lfb1pxYiFQJIlPMk7t2GQheDzgttmVhDYt3zGP6rL4ldKR+97u9yvGkC98PFdb/csr
         9/t2gB91j0NIqCgvgk6eaWV0uyqToYrHzrVmBjSzyErYwDoBKEb+L9wbYeKOiHTFRFDM
         bNJt2h7bF3VeekmaiA54BxDLnxIjTuVhR9mwooajc7y8sVpPZ3Cq7CJ7d3qjhc/PBn30
         TNk4famY4aiBWOFEYqmXIBW/GizV7beanPe5nKS/gePBlrGFCKCsEZU7nu615cGYiGH7
         NDXNZoui3DCWmY3xfqfz5jkcGPr23PwU9TebjGR+RUjVC1PBpw7BaUeYbcBnEWk6tW1s
         BfkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp3wxqont43fPUiUxaF9qx1YQiLvoYG6XELoqeVLppJSh4LpK3hKRbSgtJ1MQRXLW0uIcYAmKr1JlM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywod4fHRq3BtZUI0Uo2BGqM+UJVlH+VTAZx5RpfZql6bJV1PtYW
	bXdzY3cVP0mQxAcfge08zgswCp81W1VkEorCxcj59O/tDf2f2xNRSD7oEggwNc7Ayw==
X-Gm-Gg: AfdE7cl3Noer3tw6FO5tmOuJv47tbpV+BFyHceLvMpJQAIf5U272WLrmIdYg50UlQFC
	jqhLREc4wL8X/6pZe6uw3Igp2hxj3Sc12ZeB7ndjePiTT/6t2pqquVU5Hv0FMz8W8nZYpyjQYyX
	K0D9mxyZ+3J7tWBJWdmCFzL+gQzO/MSk83+/tr3uQp1P+TSYun4Y2/e/JW79U+3/ErzYsBy6px6
	W0xFY++ILpCZdcmYJBD9/e49h6uShn0cIMRZcpm9FR0Z/Kepg6PdNw+kvIXdfXXOoKcJYv8FFC0
	+TcdNUNDU5w5HDJy3hoqm2DuvdlQdyYzS9aZzB6Tza6PPYAxbEm+lGuMJBPq4K2dF5U+XLlAPHi
	JQLb4TLuTCerJjFZvmc/UBJLNV2AYjRW1rpQGnOjUbFlyy8UFSVi4Weu838G7J6T3Ti4E2QBmd+
	CS+4zQY46/V0rms+v/A5HZDFdml2piNETXJVqkm2h+qfG2fhTtY9YsELWa5uI6PIRYjof9Y1B1q
	AuM
X-Received: by 2002:a5d:5d04:0:b0:460:1301:dec6 with SMTP id ffacd0b85a97d-475506e994fmr3868390f8f.10.1782810208580;
        Tue, 30 Jun 2026 02:03:28 -0700 (PDT)
Message-ID: <575c07f0-0a11-4c14-8603-c02301d94e2c@suse.com>
Date: Tue, 30 Jun 2026 11:03:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2] xen/mm: Remove INVALID_{MFN,GFN}_INITIALIZER
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260630083441.726684-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260630083441.726684-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1782810209-7C72925E-84B20A27/0/0
X-purgate-type: clean
X-purgate-size: 755
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vates.tech,amd.com,xen.org,citrix.com,kernel.org,epam.com,arm.com,gmail.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59B586E1E1C

On 30.06.2026 10:34, Andrew Cooper wrote:
> These existed to work around a bug in older GCC when using struct-casting for
> variable initialisation.  However, our baseline toolchain is new enough to not
> suffer this bug.
> 
> Removing these resolves two MISRA Rule 9.2 violations which exist in release
> builds of Xen only, where "= { ... }" is disallowed for simple scalar
> initialisation.
> 
> The BUILD_BUG_ON() in xenmem_add_to_physmap() cannot stay as it is, because
> INVALID_GFN is not an Integer Constant Expression.  Replace it BUILD_ERROR()
> which is the nearest available alternative.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


