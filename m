Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGy5HADDgGl3AgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 16:30:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0412CE407
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 16:30:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218703.1527549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmvrx-0005rq-KF; Mon, 02 Feb 2026 15:29:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218703.1527549; Mon, 02 Feb 2026 15:29:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmvrx-0005pd-H1; Mon, 02 Feb 2026 15:29:41 +0000
Received: by outflank-mailman (input) for mailman id 1218703;
 Mon, 02 Feb 2026 15:29:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bi8a=AG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vmvrv-0005pU-TO
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 15:29:39 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7192ee0-004b-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Feb 2026 16:29:29 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4801d7c72a5so36454675e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Feb 2026 07:29:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-482da8eb486sm116694315e9.2.2026.02.02.07.29.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 07:29:27 -0800 (PST)
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
X-Inumbo-ID: f7192ee0-004b-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770046169; x=1770650969; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rKNCIdpPq/tuIdCIDyIiLj7kZ34g6C5eqDuZl6x1E4Q=;
        b=BC6et0N6YJZM5myo8qfQtn+oGdy5MZc+683uO/poAlxhyznEnrPaE0EVCwuuOwWTs4
         jxu7imRahhdFrNwxVUNybG5WBzs6+DazCPFq4JIlE/u/n0L1ro65KuewpMihmIMum/Um
         BcORaCpxQp/IZmEOmCAf6xpd7e9LapIvKz+FOaZPT3qNkm9V+xm8EbrIZ3v9WX4QYZkK
         PMLxOu2wzG/YTAz9vdXYqJOIn6+r+y7YD79xV8Ywhwrb0OIQZhY9B7bnHTQ7eVdbhjoq
         7HMMBJ7oifGYN0Kom2+0c0xsfjY+SQINaHyAXthdAdNeX3RmHkwwOcUIpfZdKmGkS5cn
         UXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770046169; x=1770650969;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKNCIdpPq/tuIdCIDyIiLj7kZ34g6C5eqDuZl6x1E4Q=;
        b=AyN66Cuc6003Te+7rX3ma2vUM7L6KteetmtShLGECDCCYH6xaI92bLgnxR9NpBRJoM
         npCngQIygY16i/KGRiDTkc9qZGYWmd5ZT+qcIJFo0N3FfDxF7VQDILHZ0d9OUaLZ3Vfl
         GubKW1actORoEo4S4s+hrWTmL+ZHjDdZz1yQg9Dzhus4BIhmUeVtKzo4PvqTZJ60XmHa
         JsFXeDR3bb977ngqwVM6ZFsbBIM+EslYGfxyNaHolgIAW1IUTAD/epsRvzDFXyG5Yu68
         RZeDCdW9CDuuLjS/m4rxWSmi7WigbakXVLZ4BeotJtvvALg1FLEC/QkNuYc5yEhDU/ph
         PL/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJqrpmFvkSuFrYPSpOXG+GSwO1RP1nwEJWN/uiwxttAnv1mgNgM6aqM4GDrpheYQUU6dDPnNJTzIA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+fiepD7Ix2hzQGnXgysmSt6Ro1WVzA10bRqgBPICN3HIbqtFC
	xOCaVs+8q2xJTCEsFaKuHi5oHf4N8rygcfsLjj2R4ULPxzG2nBtawmehQnO7BIX2UA==
X-Gm-Gg: AZuq6aIu/pOPlgmpMGFtr3JmeQJHvTBLm+S6qVOvI8u0OLhniQx0SI6vvGAolxgD0K4
	emKYDlEr1Egu/YHpxgdkzcvKB/DRejfCsxg0TpEBI0GOjFgiwCzzii5+DUR46WOabPhllwiaifS
	1q9Qq+Xa0XE7xWLAmw9sziguwCGCoKsDg0d0QP4TBS22KyY3ni2cFAqD7Hw7Nz++CdQxLhtfx7m
	9GFP6+kWr1scblLpSbEtnaa3qaMjGBRKFOT6xLSokvo9zD0XOc5gHToI+4MYI6qwgls7Q7CRdf0
	lyioevwrhjkt+NfRGsXm+qpW+RWi7CpYBOrpMkTOuZ4Yc5LKeUVhIquKXTerbUEGeNzBe0SXQMB
	mDeTbxMrYtJL6goUUBaZuQwiqaS47ou3EGK8eRVcnFBywCpMl/CE9YnrwNAYmqzaXaJq0ycQ2fv
	NgigNYfQdOhqg+5UD8L9EoG1t2meoy+KI94cM+tetJTLarmYd9K7WnDM/RD/AGpuz+p4S/+9x0n
	Dx0Lj+eUT2YNA==
X-Received: by 2002:a05:600c:608e:b0:45c:4470:271c with SMTP id 5b1f17b1804b1-482db4d8210mr135858435e9.18.1770046168779;
        Mon, 02 Feb 2026 07:29:28 -0800 (PST)
Message-ID: <d473449c-a71e-416b-bfe2-2befafe051a0@suse.com>
Date: Mon, 2 Feb 2026 16:29:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] xen/mm: remove aliasing of PGC_need_scrub over
 PGC_allocated
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <20260130145726.85907-1-roger.pau@citrix.com>
 <20260130145726.85907-2-roger.pau@citrix.com>
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
In-Reply-To: <20260130145726.85907-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,raptorengineering.com,wdc.com,gmail.com,lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid,citrix.com:email];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D0412CE407
X-Rspamd-Action: no action

On 30.01.2026 15:57, Roger Pau Monne wrote:
> Future changes will care about the state of the PGC_need_scrub flag even
> when pages have the PGC_allocated set, and hence it's no longer possible to
> alias both values.  Also introduce PGC_need_scrub to the set of preserved
> flags, so it's not dropped by assign_pages().
> 
> No functional change intended, albeit the page counter on x86 looses a bit.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


