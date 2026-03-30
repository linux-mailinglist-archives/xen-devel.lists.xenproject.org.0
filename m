Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIomK1NqymnG8gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 14:19:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2687035AEE0
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 14:19:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267536.1557007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7BaK-0007a6-B0; Mon, 30 Mar 2026 12:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267536.1557007; Mon, 30 Mar 2026 12:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7BaK-0007XL-7e; Mon, 30 Mar 2026 12:19:12 +0000
Received: by outflank-mailman (input) for mailman id 1267536;
 Mon, 30 Mar 2026 12:19:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7BaJ-0007Wn-9T
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 12:19:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7BaI-00GVhU-LZ
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 14:19:10 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ca6a2b-5cb7-0a2a0a5109dd-0a2a450a90f8-46
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 14:19:10 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69ca6a3e-1772-0a2a450a0019-d155dd2be49e-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 14:19:10 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-43cf906b007so793057f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 05:19:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf21ebef9sm19603760f8f.13.2026.03.30.05.19.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 05:19:09 -0700 (PDT)
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
        d=suse.com; s=google; t=1774873150; x=1775477950; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VHI1Wz8teT2f6WnrsYQ7cdBVIyJmSpTgTKdO+a+m1Ec=;
        b=WgBz3yGoE9mQf07x0lDWO0PxpsZlMWD+lWJjGELoOHPEM+Vaxfr7L8dklG1ZYhUCyw
         3U6cq9JjsWw9fXKLUJYZcsjVFfaEzl1Dj/wkzkyNpvvGMgOWI+l1q8Mq1VW+jBn88TT5
         Fww4On005HWnjSb+ls30m0f9NjphLRl9Z6KLPNLH2ZMs7mwKNIBYgZoyDXhHRBjuAgD3
         PEIHniYU48Bi5Z2Z8z6cXQrdSpJGMeBQHyVu7lDob0fE9nlfHjfWsNPEEaknnASeyDg5
         0vH0kdLc4sUNf5WS/T7IG+tolwJK4qyefuzfcuXF79CACW5VbGh3uzD01kuMAaAbOn13
         24ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774873150; x=1775477950;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHI1Wz8teT2f6WnrsYQ7cdBVIyJmSpTgTKdO+a+m1Ec=;
        b=QuUYEL6I69sBuBWv7Rm/EOAlPY3XOoeKA1m2oAEeZNg35u7SfZxJMJLf19zJMp0sGB
         iIkYK1f4kq+4I1qzOJZjnzgwUTUs123R4CtJn20Csg83exyvw5PMEYv6oeFOFsmo4IuZ
         ujEA2emrmKsgQqtXtpUtDieD0WoyhLD0h98IxYAlPGiin83DHVwcFJwQ6BD5S345jJ7j
         bDlRSyyAjnma2mzT7kqAewfjGKcgjkQvn5kXiawTqTusRovchlurA1BU4MyQbr+L86f1
         NSMTzOxGkkVZXHeBPULoxx1Qreo/57Co0Ew9nb0wzx58xqtc/MH8uRGjzHd0PzrK6Qlo
         Xusw==
X-Forwarded-Encrypted: i=1; AJvYcCVUWYkvFusZRaJyrPiyh3yswM0+MfI/6ygpyUktxvj3XHfFzJ+lYQZI0O8GNbMNl0Xx3zkSpy2D8+8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZaWhYfY/0okDCigt7Df5GRAbA96sRVUwfVoRDK5Bavf1AYEnD
	gLMHxe5nAuxWdtMgF5ON8yNNlhIpbtp8CtiMsbDkUDq0MjrH1EmVcrWVrWQ1DCeluw==
X-Gm-Gg: ATEYQzy7QUWHgn1GObjWBGnwftJT1REQjCBgCTLIW20Ix0sQmOdJdmBWpX3AO5UL1dL
	5miDTsD/B2S995lgHgDPYiVrARb75UuHkt4ZZYB9bIVRny7uPKbrGntW8H33PZOY4kZ8c1/HkVi
	PwfCZVLDiowD0PETwI9w2o0d3LCNXcYriW9TNxGd/LANdXDyLO0lmNzCWSBLNRKKJSbY/u7t7gw
	MNG5Y1tnbn0aHRseYJV6adwcGMVl7SysnIRMXedl/rp6qTrZFzHYB/ngaYTK3TswkA7TF7E8gGk
	9rUHJ6u6B+fkU+0m2eBoqCpTY9ej8Sqo1ZRPgQs+XWJudzQC7DXA6VQOji95drpnb8WzNPzPaPK
	mSFTD/i9jHmEIo3I0MFTgz4xO4FWd2b8pWM4w4ea0QrdcW28FD0IFG8FWf+5BVC7ERp3TC4xLVo
	vREirM+hT91bAO8J06Vq9Tf+39ZKbtz3GsEwq5Vn0jdztkXecWQ+XaUkmVSo13STefdjE2rEHBc
	VcLjiJx7Uefwd8=
X-Received: by 2002:a05:6000:2283:b0:43c:fe0e:5bb8 with SMTP id ffacd0b85a97d-43cfe0e5e2dmr7159925f8f.35.1774873149805;
        Mon, 30 Mar 2026 05:19:09 -0700 (PDT)
Message-ID: <e37330f7-96ca-41a9-81b1-14d7f3947dd6@suse.com>
Date: Mon, 30 Mar 2026 14:19:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] Kconfig: Make cpu hotplug configurable
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1774871881.git.mykyta_poturai@epam.com>
 <f3c523ef5b94e930902016d69b440032c9e6c3bd.1774871881.git.mykyta_poturai@epam.com>
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
In-Reply-To: <f3c523ef5b94e930902016d69b440032c9e6c3bd.1774871881.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1774873150-51A8B900-D08F5966/0/0
X-purgate-type: clean
X-purgate-size: 1487
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid,epam.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2687035AEE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30.03.2026 13:59, Mykyta Poturai wrote:
> For the purposes of certification, we want as little code as possible to
> be unconditionally compiled in. Make CPU hotplug and SMT operations
> configurable to ease the process. This will also help with introducing
> CPU hotplug on Arm, where it needs to be configurable.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

Looks largely okay from a technical pov; one nit and one (repeated) remark
below.

> --- a/xen/arch/x86/sysctl.c
> +++ b/xen/arch/x86/sysctl.c
> @@ -53,6 +53,11 @@ static long cf_check smt_up_down_helper(void *data)
>      unsigned int cpu, sibling_mask = boot_cpu_data.x86_num_siblings - 1;
>      int ret = 0;
>  
> +    if ( !IS_ENABLED(CONFIG_CPU_HOTPLUG) )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return -EOPNOTSUPP;
> +    }
>      opt_smt = up;

Another blank line above this one perhaps?

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -637,6 +637,14 @@ config SYSTEM_SUSPEND
>  
>  	  If unsure, say N.
>  
> +config CPU_HOTPLUG
> +	bool "CPU online/offline support"
> +	depends on X86
> +	default y
> +	help
> +	  Enable support for bringing CPUs online and offline at runtime. On
> +	  X86 this is required for disabling SMT.

The name of this option may need input from others; I'm not quite convinced
that this is a good name, as there's no true "hot-plugging" involved here.
IOW I fear the present name is misleading.

Jan

