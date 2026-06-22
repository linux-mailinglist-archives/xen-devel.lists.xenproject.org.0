Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ewEkAno3OWroogcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 15:24:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 624096AFCF7
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 15:24:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="EITnw/pR";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1343733.1602955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbecz-0007cY-Tk; Mon, 22 Jun 2026 13:23:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343733.1602955; Mon, 22 Jun 2026 13:23:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbecz-0007Zm-Qd; Mon, 22 Jun 2026 13:23:53 +0000
Received: by outflank-mailman (input) for mailman id 1343733;
 Mon, 22 Jun 2026 13:23:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wbecy-0007Zg-1v
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 13:23:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbecx-00AoOA-AT
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 15:23:51 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a39375c-e002-0a2a0a5209dd-0a2a4501b44a-26
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 15:23:51 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a393766-e031-0a2a45010019-d1558033f172-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 15:23:51 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-490b64c8311so42121055e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 06:23:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49240eef2basm315229095e9.2.2026.06.22.06.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 06:23:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1782134630; x=1782739430; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RSUxxVcc4GHtmUwFICunZAmmezn6f02s/adPA71Q1nI=;
        b=EITnw/pRlbXeWiL7+P/qlHPSY+FXNs6culknKuDx6rhmlSF5WRfEjEMUOx8Hp1gawq
         MrFrXTdL4yapImPA4W7zvZhivPJPUn5W9xhZKIndcnQnLAYmTesCjTcparG7SYQzFKCj
         hR7B+8XPqASw3UyOSI0scugZTnnLaszChecle6XvX++xy99YsmSdG+9pZCIiE6o7pYdu
         ur9WP3LdaWmFne2NW66rcLyr9SgYMmkg/5tKw6mlhCJWQm1KoIXkwKw0sMQRxaDtg3yb
         MKwXHzc3t254S2TTDaDQisXiThJlkwvlVdsN/ffJw8sg8QPsr0xxGnfHcswBlQFutLoQ
         zQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782134630; x=1782739430;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSUxxVcc4GHtmUwFICunZAmmezn6f02s/adPA71Q1nI=;
        b=O7PKRX/CwH00+HYhoIxD1pKiorue/AjVCXI9MKDgqLxAGn1WcALEyn7rfRp79vv8U1
         /a5H3PiFFpozSceYS/mD4/GxrRPtXJhF5sXTI7BI2hFeA67Xgd148uNmswCD+0xe6Uo6
         3crHVKE5D0oiWcfomU0JKJXDZKvHvEzn9wybD/UZqqTw7ANOy31kBkYI+LGkf1QNswuq
         VwttKLaP7JZyGwNbOIRYs8q4yfcQIjPUD4huKFoE9UCaGdZoHbRkpD1H2Bv9d1aw7oNW
         IKoGKWFrBpAaTPbi5HR2/DdhzJqX7VfBDTWzQOsmXdnYUlhUeognhqDg4jYo5H93xFbp
         EqPg==
X-Forwarded-Encrypted: i=1; AFNElJ8ixs4h/zyViKZ8k65fDpSw/9/PA0fBMqoIEjC1dYANLuWfGnPJCZmmIAUwfZJ95zbwwGKJUmN+D7g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwggvX9g+erjTOSQ1xPCQB562aTWi2N4qGw42Q7KHWgnAJCt4Sb
	/tCLBqFbbKQLGGmtMEskLQQxF81dXgddTIeiHD6YdPOd3roWyUy+jXPyvGfKTBRMJw==
X-Gm-Gg: AfdE7cllZC0+KCOWfbEIuOAKg4w5bcA0vLRHPQ9lfLfnZAWxbwKs6Fqju2x4phuGVmY
	YAvcBlWfrlW8nT1MIGprFEXyuVlrlJS1miktzed/S3lQYY7BzyiAj/S9EQ4MqOYATlB6vtFsVCZ
	Z0kyHwaEV2y4qjgvctJx2y4Uz39D/+TwdrJrRhw5fzaw0DXZ4qIDJMFOjMVEBXp1AiLV9pYUJkr
	t3HYZfGh+FsEgsTXpV2U+TrdhF8gY/yAA4TjKa2Q6hojjaRKml6qRhvPMfZ8YQWIjxqXuVudN9e
	lYGqNyige8sDXeALp+/JKU3ytO1A5LEuCtEN04tKtBEqO4eIiwZE+4HVea+gmRWhfU/P4baU74x
	RN6dxl2Q4mK0PlthZIyTxXML0v1NwBdicuen6biCG4qd/hzCl9VJo4EwGYWBMmUwP/JAvnnORxL
	YuLlcXs6PcMHybUwWvYn51bDKUJFgHKfMwPAaMyH/+5PpJ3jErydVigPJJKsmSc6GzAWvxUOyrc
	ho3
X-Received: by 2002:a05:600c:19d4:b0:492:5068:61fc with SMTP id 5b1f17b1804b1-49250686272mr115645195e9.19.1782134630360;
        Mon, 22 Jun 2026 06:23:50 -0700 (PDT)
Message-ID: <3ac358bd-f668-47a1-9350-122405604164@suse.com>
Date: Mon, 22 Jun 2026 15:23:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/sched: Link CPU topology to scheduler
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Mykyta_Poturai@epam.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20260617071206.265599-1-taka@valinux.co.jp>
 <20260617071206.265599-3-taka@valinux.co.jp>
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
In-Reply-To: <20260617071206.265599-3-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1782134631-CD3B8E30-B38B805E/0/0
X-purgate-type: clean
X-purgate-size: 1961
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 624096AFCF7

On 17.06.2026 09:12, Hirokazu Takahashi wrote:
> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -19,6 +19,7 @@
>  #include <xen/softirq.h>
>  #include <xen/time.h>
>  #include <xen/trace.h>
> +#include <xen/cpu-topology.h>
>  
>  #include <asm/div64.h>
>  
> @@ -37,6 +38,8 @@ static unsigned int cpu_nr_siblings(unsigned int cpu)
>  {
>  #ifdef CONFIG_X86
>      return cpu_data[cpu].x86_num_siblings;
> +#elif defined(CONFIG_CPU_TOPOLOGY)
> +    return cpu_topology[cpu].num_siblings;

Would this better be the other way around (first the generic thing, then the
x86 one)?

> --- a/xen/drivers/acpi/topology.c
> +++ b/xen/drivers/acpi/topology.c
> @@ -22,6 +22,9 @@ void __init acpi_init_cpu_topology(void)
>      {
>          struct cpu_topology *topo = &cpu_topology[cpu];
>  
> +        topo->phys_core_id = cpu;
> +        topo->num_siblings = 1U;

In the interest of readability suffixes may better be omitted from literal
numbers when they aren't really needed. Which, btw, doesn't extend to ..

> --- a/xen/include/xen/cpu-topology.h
> +++ b/xen/include/xen/cpu-topology.h
> @@ -10,6 +10,10 @@ struct cpu_topology {
>      cpumask_t thread_sibling;
>      cpumask_t core_sibling;
>      cpumask_t cluster_sibling;
> +    unsigned int phys_core_id;
> +    unsigned int phys_cluster_id;
> +    unsigned int phys_socket_id;
> +    unsigned int num_siblings;
>  };
>  
>  
> @@ -18,10 +22,16 @@ struct cpu_topology {
>  extern struct cpu_topology *cpu_topology;
>  void init_cpu_topology(void);
>  
> +#define cpu_to_core(cpu)   (cpu_topology[cpu].phys_core_id)
> +#define cpu_to_socket(cpu)   (cpu_topology[cpu].phys_socket_id)
> +
>  #else /* CONFIG_CPU_TOPOLOGY */
>  
>  static inline void init_cpu_topology(void) {}
>  
> +#define cpu_to_core(cpu)   (0U)
> +#define cpu_to_socket(cpu) (0U)

... such uses (in particular stub/fallback ones) in header files.

Jan

