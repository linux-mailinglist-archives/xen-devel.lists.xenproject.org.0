Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KIIM1j8w2lXvQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 16:16:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3BD327AFA
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 16:16:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262595.1555045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5PyB-00018m-IW; Wed, 25 Mar 2026 15:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262595.1555045; Wed, 25 Mar 2026 15:16:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5PyB-000173-Fe; Wed, 25 Mar 2026 15:16:31 +0000
Received: by outflank-mailman (input) for mailman id 1262595;
 Wed, 25 Mar 2026 15:16:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5Py9-00016t-UW
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 15:16:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Py9-00DFuz-Ag
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 16:16:29 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c3fc49-e002-0a2a0a5209dd-0a2a4508ec98-18
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 16:16:29 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c3fc4d-1950-0a2a45080019-d155802cc897-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 16:16:29 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-487035181a7so30397735e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 08:16:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4871665647csm23210945e9.12.2026.03.25.08.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 08:16:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1774451788; x=1775056588; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b3Kwf2XG54CIgyY9uPMo+MCDlvtXL/0mUzcEbo0tGlc=;
        b=GnTKM64gdS4INsvAJ62nhjFvLMHbGC//xA/EDvahwOoTTlCFbs2imyJk2GSBWJzzbS
         Ftqih7r8RcZ9DCl6rR2FS8LGLiIL1Tl9OsvfAUFqqlYVtm9z3nfZYteXPx5DGv/tQtay
         MG7dLtQGwnL0Ey/0XxZPYMJhIFVmT12pqjwiNLxcBd/Mb6tLXsJKW7wbFd716D4AUpeG
         PFRMjORU7tVUKaKFIDmkudeHOejQI28uIK+HzHg9gHOXpkiWYBIJE00OSKdSGKBgokIW
         8CGsBMFdTGFMlHu/llMHqWif8Em5tBIreY1R0WF+EIceNhPqhpic2TH0QpbIZpY7c7x2
         8SFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774451788; x=1775056588;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3Kwf2XG54CIgyY9uPMo+MCDlvtXL/0mUzcEbo0tGlc=;
        b=bhAq9f0RwN+y5ooqRLEBTmgDlEi1saIvk70Ms9LF3bKoztpukEtDXP2iO2BT6FyKoV
         Pyn8wBCBH58BuyCOkOwQNa2DbKXWBUpvipUiHk9ziPUUeJE+QkcpTNL7T5LsDpUllmKe
         cMqzoE0gzLH+oCU6vDOq/MaVDbx3Iqa11HSVifbJBNCkMQrHJUDBhG/P9WUUS/VETKqv
         SqX9aMYlS4z1krtWvOXVVANrQMv3NUFgYAxuK1w4KE46WFEKtcniwcKqkdmXKkr0YJZs
         QmwkAzLX+behL9GNG5Hcswj4Dalm6GkbxjSatc+maCNshiCc1dyGw6k/dEtp0WajbDJa
         QrIg==
X-Forwarded-Encrypted: i=1; AJvYcCUi++mRMJ+qHVjUD5LyA5OPSxanD6uHSCAhIswx8KhWljnXwtyo08qtFh1V1bvS45t/eM/pkQqY7hk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8MuOw8vOue1G4xv/5IwccM+kZ+kyn3pRvsWa8rknK6bHsFRXw
	JeH+2Sja88tCmdzU0jhznLMtilIQfyVtvHmunh86LchA0sReMgOcjlN9IQUsZvBdKA==
X-Gm-Gg: ATEYQzwVc4kegb1AURJovJRG/PpH0zxuy3sLAyWEZyD9Og1R03/LU9UyGRLktRr2a9s
	YdrPEtuDL55iSuO6YiReGv5zI3+5+tEaKIfCEvUruTk/NOIBe6hJRgTlBxne3mdIV+dhZ+5Dd4F
	TvPT7PF82evfLG9sJO+jwCja6EebURZuKMaKGpF/sHl3DwOQQPvK+8ipkUa9phTHK/XDJqtQxjc
	69N80IkCnUJIidzRHqFQrd8Ymd4HSqfb1eTNumlxRFifwnJUef70q3o9ov70lqCV6f9ZHtDWP+M
	45uT/v7vIxmfwuZfIwIIDwQMxWYP14J319lV0goRqmIluapJgON/mS+EyvYnvh2kjYIru+5mK3D
	+Oa/KYPWeu74G2ATbATVfGUx31BFigatevhe7h+hKagC9rVoFmIYbc5TuL8TqS5x6OF3tkfUWFe
	NBXT8odP/YTrvjxU1WoKIXWqBtX1tRsP5Zm7PvYapUd5EGBHj63TsnFWqoBG22e2Aa8kpDY0O+f
	nWklGflAK62zVY=
X-Received: by 2002:a05:600c:6287:b0:486:fc94:d8f2 with SMTP id 5b1f17b1804b1-48715fe2ad3mr52740005e9.14.1774451788446;
        Wed, 25 Mar 2026 08:16:28 -0700 (PDT)
Message-ID: <751e1d3e-d95a-4129-8baa-450a53d15efa@suse.com>
Date: Wed, 25 Mar 2026 16:16:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] x86/acpi: Integrate BGRT preservation with status
 reporting
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, sarkarsoumyajyoti23@gmail.com,
 xen-devel@lists.xenproject.org
References: <20260324123312.11076-1-soumyajyotisarkar23@gmail.com>
 <20260324123312.11076-3-soumyajyotisarkar23@gmail.com>
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
In-Reply-To: <20260324123312.11076-3-soumyajyotisarkar23@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1774451789-E3096726-B19AAA3F/0/0
X-purgate-type: clean
X-purgate-size: 1956
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,apertussolutions.com,invisiblethingslab.com,gmail.com,lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:soumyajyotisarkar23@gmail.com,m:andrew.cooper3@citrix.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:sarkarsoumyajyoti23@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3D3BD327AFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24.03.2026 13:33, Soumyajyotii Ssarkar wrote:
> @@ -327,6 +328,11 @@ static int __init cf_check acpi_parse_hpet(struct acpi_table_header *table)
>  	return 0;
>  }
> 
> +/*
> + * Invalidate BGRT if image is in conventional RAM (preservation failed).
> + * If preservation succeeded, image is in EfiACPIReclaimMemory, which
> + * won't match RAM_TYPE_CONVENTIONAL check, so table remains valid.
> + */
>  static int __init cf_check acpi_invalidate_bgrt(struct acpi_table_header *table)
>  {
>  	struct acpi_table_bgrt *bgrt_tbl =
> @@ -754,5 +760,7 @@ int __init acpi_boot_init(void)
> 
>  	acpi_table_parse(ACPI_SIG_BGRT, acpi_invalidate_bgrt);
> 
> +	efi_bgrt_status_info();
> +
>  	return 0;
>  }

Does this really need doing from here? If you called it ...

> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1911,6 +1911,22 @@ static bool __init cf_check rt_range_valid(unsigned long smfn, unsigned long emf
>      return true;
>  }
> 
> +void __init efi_bgrt_status_info(void)
> +{
> +    if ( !efi_enabled(EFI_BOOT) )
> +        return;
> +
> +    if ( bgrt_info.preserved )
> +    {
> +        printk(XENLOG_INFO "EFI: BGRT image preserved: %lu KB\n",
> +               bgrt_info.size / 1024);
> +        printk(XENLOG_INFO "EFI: BGRT relocated from %p to %p\n",
> +               bgrt_info.old_addr, bgrt_info.new_addr);
> +    }
> +    else if ( bgrt_info.failure_reason[0] )
> +        printk(XENLOG_WARNING "EFI: BGRT preservation failed: %s\n",
> +               bgrt_info.failure_reason);
> +}
> 
>  void __init efi_init_memory(void)
>  {

... out of this function, it could be static and no stub (misplaced in
the earlier patch) would be needed either.

Furthermore, is the EFI_BOOT check really needed? Without taking either
of the EFI boot paths, neither bgrt_info.preserved nor
bgrt_info.failure_reason[0] would have been altered from their initial
values.

Jan

