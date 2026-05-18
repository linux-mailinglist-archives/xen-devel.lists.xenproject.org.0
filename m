Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJF1M24pC2pAEAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 16:59:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF6556F6A8
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 16:59:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311991.1582158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOzRa-0004pZ-VV; Mon, 18 May 2026 14:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311991.1582158; Mon, 18 May 2026 14:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOzRa-0004nc-Ss; Mon, 18 May 2026 14:59:46 +0000
Received: by outflank-mailman (input) for mailman id 1311991;
 Mon, 18 May 2026 14:59:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wOzRZ-0004nU-A6
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 14:59:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOzRY-00AOzl-MR
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 16:59:44 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0b295a-2eae-0a2a0a5409dd-0a2a4506855c-2
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 16:59:44 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0b2960-7371-0a2a45060019-d155dd35f1f4-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 16:59:44 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-452169ae568so1547807f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 07:59:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a19b1dsm37194254f8f.17.2026.05.18.07.59.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 07:59:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1779116384; x=1779721184; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q/jgVQNwwGbjxwH6m6gTJxvvfLrZQBTyNw14kYHwtUk=;
        b=GuJUGb+SgcuKnqjZb8Mq0itT9O5D44W4vE99JAo8tmgG9NPsemTpQF/x+0MIhBZZrm
         WsIEk2TilDwfjMuJ2/rOn66sCz9TkdozbEuaGTlSAuBF8UN8uaaKn9hkMgsGNxcZUNm/
         YNxNFysgZ/GWeXjH4AVhNpJXpmL48v/1xCuSO6KIQyXQMUKkpNhb9lfuzOZAbYPoJIa+
         eIuW6NF2lrVkrermPLMKPQmRgFTvcgxgRyYCVJfvJ9C+kpxGjJpuzHEipTRwqyNdEQJj
         UchJMz2srFji2ctuiRAhReVybZ50PU45ZLU4UPkHrKdt8fNp8c9rdCwIdfHHUl9YOH3h
         auVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779116384; x=1779721184;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/jgVQNwwGbjxwH6m6gTJxvvfLrZQBTyNw14kYHwtUk=;
        b=DcsWiXSMik29cwYSkXv6q9aJKaAEp75BA+E04VxxOpah5bznjHYUCJdYWz4jM+OBg/
         qQnyqr5pVvaPEzTyLymPnrRDknwcXFQQ5Hk13c7qLd97sSgGuXP5XU1bgNsh5Ca01Rfr
         l09MXIvMdl0SYi2ds92DFEhKCLASBEtzMOg/T7AUQ5mLjf9vs8NK+DCYh7y4RcrEPljA
         z3MRSinLk2CyHyRmtXs7znefd80dcEJJGf+tI/v2m6lPBrQ+G5qw2xf6z8AHjgXHQa0D
         KZmis2JLEeo6FSkPEehMNdGCEO/fjb+SWaSStBEWcj2/eOr1wQfS793UviK8MObB3qzO
         9Jbg==
X-Gm-Message-State: AOJu0YwTyasMnJ9HuesGaKJl/0rUw+kf4R5MVMKcdy6v93W59r1ORLeQ
	KVKYJVjC27/lQP9SYdtPBJt/kc3jg0Vt2Ex87c+/1OaSEnm/0YHAXD6cQjArotoDXEffM9XDCvG
	OSWY=
X-Gm-Gg: Acq92OEUfWRuItMLHkpNLfgE3uxadRUZnGSsGUNd0mh1GttBrlwljUKzIrYRUt+zCHb
	bjoGn8iFg71mstlTmZ1vLPN2MSMIc8odPB6EFW3Sngw/j2gKEao1R2Skf4nKbGZRlHPjYQaBpwR
	4lFxGXeNn2xindoXkEKlIWDGbxOHINMWI9hcNNDuqZx8pHk7svd2j2ZBQNZqoELE1ak5VFNYmAo
	mSTlR1hhhDHAY3FeD+9McCMgcU/9BlXPUSx+CAXKKXIWjwArHc9niXPU74w+BjJeokL97aFwGCv
	QWRBrPAYQJBBvpjzQP3bjbm3MsVcn0rRghGZbphGPJkn9nrtpIb9+ikIi/DDSYjovGD//LCM65z
	68wEwq/P3fYk7VxpbeFv0JX+P5a3QBHDb/wda5TozSdslz9pyRDtwntLi2n4SanN4ua2weiR+oI
	n9Bllg++Dxe69BZ66wHbjs/NnTs2gyRnC9L2/g6jsPFGLsHbXEV+NT/e0sMscQpoY/f7ADpNnr/
	FAWejjAHfnaj1o=
X-Received: by 2002:a05:6000:220c:b0:43d:7d6f:f529 with SMTP id ffacd0b85a97d-45e5c608ed6mr25367670f8f.31.1779116384034;
        Mon, 18 May 2026 07:59:44 -0700 (PDT)
Message-ID: <93e1e5a0-95b0-4494-b661-b6d583864c16@suse.com>
Date: Mon, 18 May 2026 16:59:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/MCE: adjust ID2COOKIE() for Misra C:2012 rule 11.2
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <ad17d551-139b-4edb-b820-6ab12a4d70fe@suse.com>
 <0f3b4071c849c17b1150eeb3fa084639@bugseng.com>
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
In-Reply-To: <0f3b4071c849c17b1150eeb3fa084639@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1779116384-8C87AD75-EC539A68/0/0
X-purgate-type: clean
X-purgate-size: 469
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nicola.vetrini@bugseng.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bugseng.com:email,suse.com:email,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5EF6556F6A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18.05.2026 16:35, Nicola Vetrini wrote:
> On 2026-05-18 11:51, Jan Beulich wrote:
>> ... ("Conversions shall not be performed between a pointer to an
>> incomplete type and any other type"): Add an intermediate cast to
>> unsigned long.
> 
> Stale comment I presume.

Indeed, forgot to edit it again after the failed attempt.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Thanks.

Jan

