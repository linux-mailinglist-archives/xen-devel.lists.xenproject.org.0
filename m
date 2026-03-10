Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGflLX/rr2nkdAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 10:59:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 258A3248F96
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 10:59:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249937.1547302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vztrt-00088R-PU; Tue, 10 Mar 2026 09:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249937.1547302; Tue, 10 Mar 2026 09:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vztrt-000869-Mh; Tue, 10 Mar 2026 09:59:13 +0000
Received: by outflank-mailman (input) for mailman id 1249937;
 Tue, 10 Mar 2026 09:59:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vztrs-000863-4U
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 09:59:12 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c92d1449-1c67-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 10:59:10 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-439b2965d4bso7424736f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 02:59:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad977f8sm34419385f8f.9.2026.03.10.02.59.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 02:59:09 -0700 (PDT)
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
X-Inumbo-ID: c92d1449-1c67-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773136750; x=1773741550; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qTdWkCNeBclAJHTd440+WKj08O236iton84b7CEgDhg=;
        b=GTAVKkZTRMFi9tYJvgoigzjFI+U9g2cgXLdYUOiDzsM94/+9K7CRHt5Uo904YapJ0u
         pY6c1cvTkxXq5FuYKatjQVni0KkSzj1wom2ih6jhw9pGp16hD5zFQVTaG+rYGApjTw6+
         mRkHUSNe/SaWe+Zg4hpfUhm0x7md73KEsv2NBMRub9uMwHJrdBM/NHAl1Wk18nwSm1C0
         QvBbNpP40nlHxs5FNaS63xkKKw7l2cNXxV1WaqCPjxS9NCanEIU+eLnMl9sTYPu/Swzt
         w7okz8JcwXb8OE4c0hv3M6ZjLmuNGvirzTzCFPJ16JNec2WPstbAaVmHy9S/DnD9hC+v
         0TmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773136750; x=1773741550;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTdWkCNeBclAJHTd440+WKj08O236iton84b7CEgDhg=;
        b=GClrN/B//LQRrJVpFVEOB8byRXNMKoMwPzW6PK4vgIcX4gu4ejY4i/4g6MOEysO14Q
         LYrc2HE8731Rwi+O6pqceCDhv6AAKq6TPm4+yBHc5KpkEz3MID2Kt/ORnE7DbD+py2EY
         g6tTxkvwQn4kh8i6aLEi8dAsqGHL6wTmimCPA7EXna9JZ7AOZ5lnxzIv0TjIqwBj7mpS
         hY3nonFinXu9hbBbdqKl/Rv5Osf+x+gB+o/YgAUR50K5T5hYKIfYzpXTVHWfQQLQAALu
         qK0Yvl7Mahdr+7FzHAmjkvEoHNrFCPsbriVnzMlSDfgJOiTjmrJ9X3VzE4aIIt0hmmYB
         cZlw==
X-Forwarded-Encrypted: i=1; AJvYcCVa+WefBrHLkB2iYKKY1GKIwdcJV3JGhhMO6cz/TLGMvwFUzePY0G5bvmGUD4eAARg1DR7rwWxenlY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxg+xwxdW4lR6GaWOhGI6h42oLvGz72cxS5r2OS9E3oa7YYxQok
	e8+cEpgcj7i8t2aR0LePTmghAy3z9iXdj6ZNImH6zUvbEGfPo31vf7M9aTLW+kZAAQ==
X-Gm-Gg: ATEYQzzFbxGDIL/984jeN61AoyXaHzbUt8E0u2g81Jc+ZRFucUItbwNrs2XibDMPluX
	PNogLnfnhsEF0wLCZfe6+GVBgwQPIgXhAvJrSdmgO/sK6VF264WWJXH2jOxEsbFDdatzD2HzJJ1
	L5U8uKeMOApRh5nM0dKiwFHmahDv3W8BWO+eGP2/uZ4k2BQJfZPbTOWqk+cMGIyO6VXP7baCql4
	2JRi03PCRDDZcZz+wV/NAo9SsUopwoQH8yY6IFfRZv05d+BhWQ9pjWcclfZ/wjNBo4vw9uuL+vL
	OPi4UnR5a8siV0I4NUNiUa1U8cf84n9ewfTJe+F4iMgafaFd7k+V/8JIq79nWPrYWyPKHhtasOd
	uWl5gUf9lE9l9LxBvFba7tHGjvGheg4VT/HMkCyZtdG/VOC9dZpbYm6UjHwJvrod8Zju7sKT7uz
	5LtSo8LNXJp3c08KCIWIZG/RVPeGwiu1Qe4Q/U3mf0YBvxDEWILrcVIP4zI4+ll2p+qsxQ+eSwV
	OzjDPMefBcmhbs=
X-Received: by 2002:a05:600c:a115:b0:485:3b5b:eb8 with SMTP id 5b1f17b1804b1-4853b5b108emr88886155e9.26.1773136750263;
        Tue, 10 Mar 2026 02:59:10 -0700 (PDT)
Message-ID: <ccffd248-0b64-404b-b531-918b34a01b15@suse.com>
Date: Tue, 10 Mar 2026 10:59:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] x86: Remove x86 prefixed names from acpi code
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <20260304195350.837593-1-kevin.lampis@citrix.com>
 <20260304195350.837593-3-kevin.lampis@citrix.com>
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
In-Reply-To: <20260304195350.837593-3-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 258A3248F96
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
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
X-Rspamd-Action: no action

On 04.03.2026 20:53, Kevin Lampis wrote:
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
> ---
> Inside do_get_hw_residencies()
> there is an explicit check for `c->family != 6`
> Do we need to add family 18/19 support here?

I think there is more stuff to add there, as the last addition looks to have
been quite a while back. But "yes" to the question. However, ...

> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -178,10 +178,11 @@ static void cf_check do_get_hw_residencies(void *arg)
>      struct cpuinfo_x86 *c = &current_cpu_data;
>      struct hw_residencies *hw_res = arg;
>  
> -    if ( c->x86_vendor != X86_VENDOR_INTEL || c->x86 != 6 )
> +    /* XXX Does this need to be extented to include fam 18/19? */
> +    if ( c->vendor != X86_VENDOR_INTEL || c->family != 6 )
>          return;

... I'd prefer if such a comment could be avoided, ideally by covering the
case (in a separate change).

> @@ -1059,8 +1060,7 @@ static void acpi_processor_power_init_bm_check(struct acpi_processor_flags *flag
>       * is not required while entering C3 type state on
>       * P4, Core and beyond CPUs
>       */
> -    if ( c->x86_vendor == X86_VENDOR_INTEL &&
> -        (c->x86 > 0x6 || (c->x86 == 6 && c->x86_model >= 14)) )
> +    if ( c->vendor == X86_VENDOR_INTEL && c->vfm >= INTEL_CORE_YONAH )
>              flags->bm_control = 0;
>  }

Again a check that likely can simply be dropped (in a separate change, possibly
together with those other droppings suggested in reply to patch 1)?

With the adjustments:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

