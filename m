Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OwXM3Ynemlk3QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 16:12:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2549AA3945
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 16:12:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215786.1525908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl7Dh-00076p-Kf; Wed, 28 Jan 2026 15:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215786.1525908; Wed, 28 Jan 2026 15:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl7Dh-00074L-Ht; Wed, 28 Jan 2026 15:12:37 +0000
Received: by outflank-mailman (input) for mailman id 1215786;
 Wed, 28 Jan 2026 15:12:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3VuQ=AB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vl7Df-00074E-RQ
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 15:12:35 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5e2d4df-fc5b-11f0-b160-2bf370ae4941;
 Wed, 28 Jan 2026 16:12:34 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47ee2715254so36737225e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jan 2026 07:12:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806ce56490sm65364435e9.12.2026.01.28.07.12.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 07:12:33 -0800 (PST)
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
X-Inumbo-ID: c5e2d4df-fc5b-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769613154; x=1770217954; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gqk/3qhGKK2Wg6hpidOyJwFjnch4eVq5JiUVPloTqZc=;
        b=Zy0KJYui1NcmuqvTE9dsiWOU3EVK6TbdRoNqSBE31E0A478g4dfCk8pIzYKD4RAzCJ
         xwt/Pxs2/xDyTiqHNERTkC/N79gdDfKea2QWqLlwO1pPCugXNqkyFku/F65pbherzNZe
         EmPmyhaFUXwtQw1y3U8Cfak+DyHX0Aea/4oJ/aX1+28wfi4wnI6cdANeQk3IixXnSwos
         sOwoeMb/tXldyuU2XdN/em59TOpJ0PVLXCxRCOl2w3rwdE2gTpOKFIjvr8tm8jMaji+I
         kv8BDT9oy9J9izIjUyVjCP4KIvi6j9EHpcw5PUxd3NNhSNIFyCyNL0/r+o/YEdi6Eh2z
         phKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769613154; x=1770217954;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gqk/3qhGKK2Wg6hpidOyJwFjnch4eVq5JiUVPloTqZc=;
        b=heWoWRhfXUv4L+AMni9/zy1NjMBE79L2WZjlPl0aISuKu0t3sw9HfDc71GkZ4LOrFm
         nMKawVqz+5rbRup5hQ0/1TNoLxaF51o6fFGVN3tSzwoBTXDLhRHtd0IFHknJXv6H3FDR
         fq+88hxFTgwX8TbB4J9aC8KngoWWb1Wx8ZhXM4jqgPMbsiSx0CMFQ1v6UjbKnu4c4b7V
         RGh8eMzn5vH1Ay4OJZULV8r76/sUGINGGIG6Dc3fp5kr2uRYRMwc4rtz017U3Dhor2yh
         nV1qPzPXa9DL1JzEYQjb7WIrkdNl8IlKRXqXNcY+iL2KIRCFc83Oy2d640FfDF9AMZEY
         aRoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTY7mKN8eU2b0O2vYWOqeaEoVXULHr7SZC4qhlDXEP5P43+QUVmAZOMtUNJTK7FMmc3JHdY77zuiU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUpFhNYRI/beJopCbuHL5xUzMDP8E55bzrpafyHCZwlxQ+HVTU
	l+TckPPsAW+DTheM0p/M2zdWzMX/4zgg+FPdlVj44x7VJ59a4DxKwThdZD0qYbbIKw==
X-Gm-Gg: AZuq6aLZOHZQ4842FO2RfqQ6mFF5WnbQAE6Axo8H1e5oKr+h6MCGm0BHBHZDs2g5XiH
	Monrzp8bmqqKODRAP0e6M+0NM6CRS2YOf02lA5e8NKB1nSiFL5QtpzOXGlOW9pE9F8PnKw5QrMf
	K+LjTSAFfGQl970stLOUmMmezWQFNOjpEYEPYUuac+nTPj2WqM/KjDgB/BIFVMW5RPsxDY1glXE
	FZgN6b4QETdROhgJIqizMkPcdY1eKH2htSeK+3BdNqCTg9M2yr4qejgzcQX3ccrB/Faf7e5S+RZ
	KFFEZE2+dET4f7g2p9LdY0030hRFZLdNABIZi2XZeWSLPkHn0b7ZnF+xo9C4N/1gCYBHshikRAr
	5XAMc15fuW2pjVP3F91dfHZXvGrw59gNzM55chitLEjopHCGCcfaWmWweONiYZdKDx61J0ryph2
	iUfWLWe7+/oXcHqiNicP9DlfdHU5M1A9952Bl0bcyc0AeAFVMVxSfrWBTllbmt3Gx5A48/3geQ4
	Os=
X-Received: by 2002:a05:600c:a08c:b0:480:1c53:208b with SMTP id 5b1f17b1804b1-48069c9bbb9mr63070515e9.36.1769613153677;
        Wed, 28 Jan 2026 07:12:33 -0800 (PST)
Message-ID: <91c71a0c-4345-4fae-912b-ae7c9d2160e7@suse.com>
Date: Wed, 28 Jan 2026 16:12:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] xen: enable dom0less guests to use console_io
 hypercalls
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: grygorii_strashko@epam.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com,
 jason.andryuk@amd.com, victorm.lira@amd.com, andrew.cooper3@citrix.com,
 sstabellini@kernel.org, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2601221704110.7192@ubuntu-linux-20-04-desktop>
 <20260123010640.1194863-2-stefano.stabellini@amd.com>
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
In-Reply-To: <20260123010640.1194863-2-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stefano.stabellini@amd.com,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2549AA3945
X-Rspamd-Action: no action

On 23.01.2026 02:06, Stefano Stabellini wrote:
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -829,6 +829,8 @@ static int __init construct_domU(struct kernel_info *kinfo,
>  
>      rangeset_destroy(kinfo->xen_reg_assigned);
>  
> +    d->console->input_allowed = true;

Why for all of the domains? Shouldn't this be a per-domain setting?

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -612,10 +612,18 @@ static void __serial_rx(char c)
>      if ( !d )
>          return;
>  
> -    if ( is_hardware_domain(d) )

This check is fully lost; shouldn't it be replaced by ...

> +#ifdef CONFIG_SBSA_VUART_CONSOLE
> +    /* Prioritize vpl011 if enabled for this domain */
> +    if ( d->arch.vpl011.base_addr )
> +    {
> +        /* Deliver input to the emulated UART. */
> +        rc = vpl011_rx_char_xen(d, c);
> +    }
> +    else
> +#endif

...

    if ( d->input_allowed )

the latest here (not sure about the vpl011 intentions in this regard)?

>      {
>          /*
> -         * Deliver input to the hardware domain buffer, unless it is
> +         * Deliver input to the focus domain buffer, unless it is
>           * already full.
>           */

As said there, imo this change belongs in the earlier patch.

Jan

