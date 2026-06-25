Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sdJ5FitQPWqb1AgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 17:58:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B68BF6C73C9
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 17:58:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=eI17pX0G;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1345771.1604515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcmTA-0006Ij-MV; Thu, 25 Jun 2026 15:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345771.1604515; Thu, 25 Jun 2026 15:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcmTA-0006Fz-Jf; Thu, 25 Jun 2026 15:58:24 +0000
Received: by outflank-mailman (input) for mailman id 1345771;
 Thu, 25 Jun 2026 15:58:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcmT8-0006Em-MI
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 15:58:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcmT8-00Dx70-2g
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 17:58:22 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3d5001-e002-0a2a0a5209dd-0a2a4506c372-48
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 17:58:21 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3d501d-08de-0a2a45060019-d1558032a82d-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 17:58:21 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-490b8ac62baso10620955e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 08:58:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492691f60bcsm3998665e9.1.2026.06.25.08.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 08:58:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1782403101; x=1783007901; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H7bSvGIPZxGW6MLYYg2d4bLpUbLQynRVhiLMNkDxye4=;
        b=eI17pX0GAMqR7ATcH9p8A0volmz+YcWXYv1SamBEz0cuk1vjMYpvmW+AmGeU4Wi4rz
         WRDQovS1LKIOecJDo2m/1n8cMRyKkIDj4mTW8jUMRxJSixj5dAkTLwq3GAp16pGHN65I
         D7xJscgORoKy/5qbEyxBAcG5VQ6ki7llCwtJ9sMW0jYuCj/BPvykYkRDpDXQe5tzwlxe
         XnV+vnCSe+6O+aFC6L4d4yk7fQWzUQZnlmq0KT5SIa9i2sjWgknk/8NnQyoeWd10onMU
         UxNhF+7OhAtj9GBfrRazj56bMNyPsmXvjeBvXE/xuLvUifLqWF9ugdxPXqiB29I0KRXx
         xFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782403101; x=1783007901;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7bSvGIPZxGW6MLYYg2d4bLpUbLQynRVhiLMNkDxye4=;
        b=ZGGZrRZjH7qU54BZlExhWsA4mgV77rSl79TBN++B/sabsWZr/n4YbKkiFP6s6dsvrm
         yvsnndha0DR1iYmQTSEbVhTn7nOkIA3agonnRk2VtlSWd+D8BqtH4x+oLbkUiZeRoSie
         NzOKR9UUEWHThF/eu+vVAL4YIlYqixgz9qQ3scaZ9+ClKEwSid3zlz6UHpaFy4zhMC+T
         pJEwXaHsCeQKu5Uw+LUEmyN8nDUp+tRJwgvytMGRsjIpjrZtaPk7va1Ej278bUPv9S2K
         pMtMLwMVWwIn4f8kpDtO1/6bAvRw2vUpLz8NFBlsFowMXV9KkMVFg3IPhQofmmrWesBn
         gSog==
X-Forwarded-Encrypted: i=1; AFNElJ+yVhSfe7v7BigFBLgxI+M/LjhBfcz9voxTwUfxDsvS79qCNWr3J4pxCMBC+gghzFjyeEhsgSzhjJQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEJekyn+vFOOT+t8Adp9h4Ps0k1+ci4UAK9CerBAS0wqe8Y8/p
	YU9skCiUet/eECN6TnFEOlkjVpoPP+VgYB0E/hWXbArwNVT3Zlz8cBkANF3kBMfGtg==
X-Gm-Gg: AfdE7cmbpvLbyLc1NK7jc4iti4cEp1nb3athDOo3hIMCAcmSp1OV8J8AjALdotVkATH
	RLHqXJzY3Sjfg6EeXwGl/4yTufmGPtE+FUzUuEDFZtpstGBhTnhf1KMoypGHOD7pcGDtY1GFYCU
	iR563W7SntHkR+HE8HiD0et2Aao7gkDRPhvZE99aUmuIzElYK5SdTeJm7BngRgW6FDFXjYbX83d
	XRLz9MuiQ2uuArKMvQP9SAOUBBcBJnMSMHyTGNReV1r0Sw2LXW5Yib3DjWCXLJI5WWj6n1z/SOM
	m/jHbG89dv/2fw/1FNqIKnmrLyA2paovhC/OOGNlSjf4vC/pFmpImKqeXNWmTLkFVPbXFd5P8n3
	nmOvG+8p1DeyPpsG7KKDGyVsgYccKGWZzjCo6+cWDlglVwXYT84M9hYDBfobPILB0fFL9QqR/ZV
	f4jfJes2rPT6dMXADPLzvdKfOvctWg6WDVSFI5d/NylL8Io+HeKA0wFHdNaLLmPYfIrpDyIxM+L
	ULd
X-Received: by 2002:a05:600c:8b63:b0:490:e19b:9632 with SMTP id 5b1f17b1804b1-492664294b3mr39234155e9.17.1782403101450;
        Thu, 25 Jun 2026 08:58:21 -0700 (PDT)
Message-ID: <9a94b240-b75e-4201-be05-ddfef16f5c6c@suse.com>
Date: Thu, 25 Jun 2026 17:58:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] x86/passthrough: Introduce pt_irq_bind_msi() as
 canonical MSI bind path
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
 <1777298080.8631fc262581453bbf619ec5b2062170.19dcf3882f5000f373@vates.tech>
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
In-Reply-To: <1777298080.8631fc262581453bbf619ec5b2062170.19dcf3882f5000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1782403101-C5D3D68D-C8B4BABA/0/0
X-purgate-type: clean
X-purgate-size: 2179
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
X-Rspamd-Queue-Id: B68BF6C73C9

On 27.04.2026 15:54, Julian Vetter wrote:
> @@ -448,13 +451,29 @@ int pt_irq_create_bind(
>      switch ( pt_irq_bind->irq_type )
>      {
>      case PT_IRQ_TYPE_MSI:
> -        return pt_irq_bind_msi(d, pirq,
> -                               pt_irq_bind->u.msi.gvec,
> -                               pt_irq_bind->u.msi.gflags &
> -                                   ~XEN_DOMCTL_VMSI_X86_UNMASKED,
> +    {
> +        uint32_t gflags = pt_irq_bind->u.msi.gflags;
> +        uint64_t msi_addr;
> +        uint32_t msi_data;
> +
> +        msi_addr = MSI_ADDR_HEADER |
> +                   MASK_INSR(MASK_EXTR(gflags, XEN_DOMCTL_VMSI_X86_DEST_ID_MASK),
> +                             MSI_ADDR_DEST_ID_MASK) |
> +                   (gflags & XEN_DOMCTL_VMSI_X86_RH_MASK ?
> +                    MSI_ADDR_REDIRECTION_LOWPRI : MSI_ADDR_REDIRECTION_CPU) |
> +                   (gflags & XEN_DOMCTL_VMSI_X86_DM_MASK ?
> +                    MSI_ADDR_DESTMODE_LOGIC : MSI_ADDR_DESTMODE_PHYS);
> +        msi_data = pt_irq_bind->u.msi.gvec |
> +                   MASK_INSR(MASK_EXTR(gflags, XEN_DOMCTL_VMSI_X86_DELIV_MASK),
> +                             MSI_DATA_DELIVERY_MODE_MASK) |
> +                   (gflags & XEN_DOMCTL_VMSI_X86_TRIG_MASK ?
> +                    MSI_DATA_TRIGGER_LEVEL : 0);
> +
> +        return pt_irq_bind_msi(d, pt_irq_bind->machine_irq,
> +                               msi_addr, msi_data,
>                                 pt_irq_bind->u.msi.gtable,
> -                               !!(pt_irq_bind->u.msi.gflags &
> -                                  XEN_DOMCTL_VMSI_X86_UNMASKED));
> +                               !!(gflags & XEN_DOMCTL_VMSI_X86_UNMASKED));
> +    }
>  
>      case PT_IRQ_TYPE_PCI:
>      case PT_IRQ_TYPE_MSI_TRANSLATE:
> @@ -617,7 +636,6 @@ int pt_irq_create_bind(
>      }
>  
>      default:
> -        write_unlock(&d->event_lock);
>          return -EOPNOTSUPP;
>      }

Just as a preliminary comment, as I had to come look here for patch 2:
With no other locking changes in this function, how can the above be
correct? Does this hunk belong into another patch?

Jan

