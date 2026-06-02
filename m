Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHClCFK8HmrZJgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 13:19:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8726A62D51F
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 13:19:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324761.1590260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUN9h-00081T-VI; Tue, 02 Jun 2026 11:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324761.1590260; Tue, 02 Jun 2026 11:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUN9h-0007yf-SN; Tue, 02 Jun 2026 11:19:33 +0000
Received: by outflank-mailman (input) for mailman id 1324761;
 Tue, 02 Jun 2026 11:19:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUN9g-0007yZ-FB
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 11:19:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUN9f-003O7m-NR
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 13:19:31 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ebc42-bab6-0a2a0a5309dd-0a2a45039442-4
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 13:19:31 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ebc43-672d-0a2a45030019-d1558030f052-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 13:19:31 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-490af320e2aso13014695e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 04:19:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490af60e03esm55658725e9.2.2026.06.02.04.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 04:19:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1780399171; x=1781003971; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mifwehXoMSqIw7W1QXJjwradM9rlYRoCGjKURdYbg28=;
        b=Lx5JoFRe59mwKjrlKXNrDleZYVuYwNbl8NdSH/aDMBXPjXadVfpHJywfUu+1RMDe44
         OINM+9WqmyqN1WW6RHUeiGTvUhwwyN4dNR4SchK7FRmnycDOCgLbfUfb+Nb8iOVM0FMT
         xOsAH7IyV9avFQGjibse93HuvaAIn7h/7ZMO1xRFT/g9quoJ4+ZhS7dya7kRPkMH9TDM
         IcWk9rFVMB/rxN73vthfuWv0y7iCB/C+RvG2FCUdf7CsqRK0B0jr0+r6sMOkGUjV6MwH
         +OHK7HFmzd7Fe8C4soMO5k+KBLSkF41iO5TAY2pMOrBZAf9+obSwbi/Ko8J0ar6bTZ7Y
         kbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780399171; x=1781003971;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mifwehXoMSqIw7W1QXJjwradM9rlYRoCGjKURdYbg28=;
        b=nBqAoiKNmNF+09NO5KogJjZnAR+rEapluOVgMRaJStYlY9Wsy3o9QPGI0QlqcueTBh
         LifgR2/S3SUi/wavKffUF081hGSV/MrkEK3BX1BTDt9XvhAIHbR6F+xAQOc42fa+S0tj
         SIgaFtKoaV3MkNkSYK05XdNcyjP0dCR3q1Yqt2hcvNzcS62Fb261eolxULuU0SDH8460
         d2oQV4/D+z2gTjRWSPAkwBwIvSwYeqMHZPO6QApMckL0w6bY1pMceMitiLGBqHKyJINE
         ylclNEOBS/Wpr0zGM0knnvuhFE+oUtH0hZ0VWA5cpAuGIzj8Gbq1kASLDsHrF4IfKd+o
         U6iw==
X-Forwarded-Encrypted: i=1; AFNElJ/GSkKNDkx1xHK9cRiEsX8NyJLONSIUOL+h+kG/Onb/T/P+MiMhe0MvWnVtcT299DDIE/HKbn2hY4w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1/QyDG1avHFwE32Vi1iYE9DWrIRM2pu6JBMKmlmFOGVRXCQ2J
	qixZ1r4LaqMxgVORhUI6THFdio3pxlWKmoEI4L+7l0rUg2Kh9WjB9dQHrrg/CVXC4Q==
X-Gm-Gg: Acq92OER2JTbWI9Le2ByQeI9evlvst6a9/wP5OV4q9NFOG3QBPTu/4QE+yO6mD+3R8v
	He2Qd0yaCWKgsyKZSQPBqtX6ArSINP7VCiQ2Pxjdi6MxbqNfLKZv5Tt8lXjxeNBseQGTXvlq+Zr
	Wtfd+lb8MSj98AGiwEdWQLzGuqxqlJEm+nxZAxA5hdr8qUiT/eMduEKVDhGJQswOD8WvYvh28Td
	V3TuhK5pTLbPSWmWhXukvEZTVlvoutz4GtPqtDetkf8D9HWHQSpjRirn/ubFSmhFPWL+hGC6cve
	ECzIS2R3sfvB52OeULqi9VULCgrPwxRbjcHw3ke2FUSgp+LpB3Ga4ieUAa2xazzU+AQ4Y2GCO9L
	wXDA5Xw778u5DARZ+YLmqaN8lGlFK1f/tILv07ulIQ+PHAn2lbdpzfhLkPDw9GOmgIb/JZ6AF+p
	bNObdHwA6tS9Mfnzbap0YpmCyOVbH0BvogCNU1ZhXSQSLC/bloWAh4Vq5WdngT8hhuF23JfbO/T
	tZl4rkVzuouXhrtTXdFLDbt3w==
X-Received: by 2002:a05:600c:8508:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-490a2952644mr245616135e9.27.1780399170910;
        Tue, 02 Jun 2026 04:19:30 -0700 (PDT)
Message-ID: <3aef7763-aea3-496a-8c18-d3659f590373@suse.com>
Date: Tue, 2 Jun 2026 13:19:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/domain: fix UBSAN null pointer dereference of
 d->shared_info
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1779712171.git.oleksii.kurochko@gmail.com>
 <04dd784b6b9a4dfca9a313ea8802d8d514d65021.1779712171.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <04dd784b6b9a4dfca9a313ea8802d8d514d65021.1779712171.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1780399171-3957F938-29CF1648/10/73395122804
X-purgate-type: spam
X-purgate-size: 3170
X-Rspamd-Queue-Id: 8726A62D51F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 25.05.2026 15:20, Oleksii Kurochko wrote:
> It is legal to have d->shared_info equal to NULL for architectures which
> support only the FIFO ABI for event channel management.
> 
> Having d->shared_info == NULL leads to a UBSAN issue on such architectures:
>   UBSAN: Undefined behaviour in common/domain.c:325:10
>          member access within null pointer of type 'struct shared_info_t'
> 
> vcpu_info_reset() maps v->vcpu_info_area.map to the per-vcpu slot inside
> the domain's shared_info page for vcpus with id < XEN_LEGACY_MAX_VCPUS,
> and falls back to dummy_vcpu_info for vcpus beyond that limit.
> Extend the existing fallback condition to also cover the case where no
> shared_info page has been allocated, mapping the vcpu to dummy_vcpu_info
> instead. This is the correct behaviour: dummy_vcpu_info already serves
> as the safe stand-in for vcpus that have no usable shared_info slot.
> 
> Additionally, if an architecture supports only the FIFO ABI, setup_ports()
> should be updated to avoid a NULL pointer dereference of d->shared_info,
> since in that case there will be no pending events in
> shared_info->evtchn_pending and the pending flag of the FIFO event channel
> does not need to be set to true.
> update_domain_wallclock_time() accesses d->shared_info via shared_info()
> macro. On architectures that do not allocate a shared_info page (currently
> RISC-V, which runs guests in dom0less mode without the PV ABI), this causes
> a NULL dereference. The early return is safe: if there is no shared_info
> page, there is nothing to update. For all existing architectures (x86, ARM)
> that do allocate it, the guard is never taken and behavior is unchanged.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v2:
>  - Update commit message + subject.
>  - Drop Fixes tag.
>  - Handle migration of pending events from 2L and FIFO ABIs when arch
>    support only FIFO ABI.

What does this item describe? On an arch supporting only FIFO, how could
evtchn need migrating from 2L?

>  - Update the commit message.
>  - Protect some other places in common code from NULL pointer deref of
>    d->shared_info.

What I'm still missing is the description clarifying why other uses don't
need guarding (or that there simply are no other uses, which - however -
I doubt).

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -320,7 +320,7 @@ void vcpu_info_reset(struct vcpu *v)
>      struct domain *d = v->domain;
>  
>      v->vcpu_info_area.map =
> -        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
> +        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS && d->shared_info)
>           ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
>           : &dummy_vcpu_info);
>  }

At the example of this: The extra conditionals are dead code on x86 and
Arm. While the status of the respective Misra rule is still uncertain
for Xen, imo we'd be better off avoiding the introduction of new dead
code. Which in turn means we may need some kind of abstraction to have
these extra conditionals in place only for arch-es not supporting
shared-info at all.

Jan

