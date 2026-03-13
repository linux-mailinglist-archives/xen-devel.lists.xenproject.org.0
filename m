Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +K6sM867s2nEaQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:25:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAEA27EBF7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:25:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253314.1549589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0wt8-0007cx-FP; Fri, 13 Mar 2026 07:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253314.1549589; Fri, 13 Mar 2026 07:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0wt8-0007a7-Bm; Fri, 13 Mar 2026 07:24:50 +0000
Received: by outflank-mailman (input) for mailman id 1253314;
 Fri, 13 Mar 2026 07:24:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0wt7-0007Zw-7u
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 07:24:49 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b695261c-1ead-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 08:24:46 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48534b59cf3so16376535e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 00:24:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854e2537c3sm181300245e9.15.2026.03.13.00.24.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2026 00:24:45 -0700 (PDT)
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
X-Inumbo-ID: b695261c-1ead-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773386686; x=1773991486; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GGhBrb7u1rRYduAazJAX011huIjgs2Tgg7Xm7GSHAKM=;
        b=YTzzdQrwELeXHMD+gbOfVQLDYbLHUe1dftVf3DOafw3Upus8rqGOJFBBSV2DLtwSC1
         XQjgdjC/Su5Wl/pX2QpOI77tJwrmkpB9uLvee38j4L5St8feUOKYyQypRKOAEEDITWcN
         NXS5WzSSTXw68VIer8hRkpO6uFv/L43emJNwvTs+UfCeyS08yRZ1g8aXulQvETbGWfIu
         hcD3DdUvf/16y7nBVRdwBpUURV7fkwQlEwMMXmSHbElNzPpWWDOFuykfpvSwgKzDB3JU
         rDDC8pGXHEcud726JPMT06+j4gdToinLJc09xTdi0rRnWRj7SHmGfSX57zJgKUTp+mUi
         46wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773386686; x=1773991486;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGhBrb7u1rRYduAazJAX011huIjgs2Tgg7Xm7GSHAKM=;
        b=Tsr+3pEwaHbcoMeMzbEEkG8ScDD8WXekpTe7fIdE1defq7eJCid2E+U1U+uR1f+Yp9
         OZDVomQfjm9T+vZXzg2AojGc3urBdBEqwL1C5rjDmdr5BdQ+NtsNHXnOI379O5rPqG2h
         eRXYXLNepA6CCDKJ4N7I0reTUuMyyC9nJhGTSUXh56BYUnGanLmsl+jj7vGOMbEa0Dfg
         5rftboXO23I7GVRIk5O1CQtJNRvU/bcOcvuhDDQwHUZ8YZDpGB3jULzvHxyCINHj4sfa
         iD1X63DkfcPHI4AU4vVPmW7ChUcOvP91B4npOLOZD+6UvPHIxcqqReo25H8G6rkrmtSo
         ogcA==
X-Forwarded-Encrypted: i=1; AJvYcCWDWswI1Soi40oF2dE4J8o2wCtl2gd5/4liNeutYO4jDOEkhfIIy2iNQyIPKZgyk8mtczgjFinV6LA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLK7DA+OW9b9C2/fDFv1p2Xsi5cxzTUP6m6p/WX4MreQJONdaf
	2gCWDUCQ97mvjKYQq09fRfat2NLVFqV0Bk0DCwANbIP5ANj3OdHE3m6nK4FWk9OEpg==
X-Gm-Gg: ATEYQzzue0549zNlld650++ZEp7u/0fNMvZLojfJBBlgVV0jqpAsNBXTHYpYEn7TfVC
	bmEaHwzynUOgebHi+tuLiGnehCcRFH4kdaKY9qP9KsBtn5/a4tRIP+BYfZa6ACIX9xTX+WsDAau
	lFn07oOTgLMUUEXl9Dg5zGGP46b8OBEKDL8xRSVm7KeWxKUHypJImrI9MdvYaQUZ1m8YP74e4Ci
	R1gxFAMpuLNRUGP0sGZQ7Ot9lpxz5Boy7LzMbfn+LHcLsIyu0IsM3C+oJDs6TxQuB2D2tI1Uqk6
	4lmuhNBTGzYGpVBQioSSakZtPsrhQX9SfKXo3iKS7sGKLodCAYbuN1LGruKRoc3xjXc4scWqn8d
	J3VX0rNnqTpNxhUAorL4Fy3kz7itrP/XhSgUCNSrzR2wNebgGIcZRhJ1uNozsuwVm7JHqLL8kil
	loal2LiVzATPLA8duBw7CiBjVB0AnEBn9d9ESen7mqplfxpjJ76tvUAzcz0vX9tPLZo/aXmg+Ll
	N9bZH7AmYliLGg=
X-Received: by 2002:a05:600c:4f8f:b0:485:3423:727d with SMTP id 5b1f17b1804b1-4855670c095mr33038965e9.26.1773386686185;
        Fri, 13 Mar 2026 00:24:46 -0700 (PDT)
Message-ID: <9b6f5586-d941-4c26-a089-1a4b04be5bf4@suse.com>
Date: Fri, 13 Mar 2026 08:24:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v v2 5/7] x86: Remove x86 prefixed names from x86/cpu/
 files
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <20260312204339.740403-1-kevin.lampis@citrix.com>
 <20260312204339.740403-6-kevin.lampis@citrix.com>
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
In-Reply-To: <20260312204339.740403-6-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.lampis@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7EAEA27EBF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12.03.2026 21:43, Kevin Lampis wrote:
> struct cpuinfo_x86
>   .x86        => .family
>   .x86_vendor => .vendor
>   .x86_model  => .model
>   .x86_mask   => .stepping
> 
> No functional change.
> 
> This work is part of making Xen safe for Intel family 18/19.
> 
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


