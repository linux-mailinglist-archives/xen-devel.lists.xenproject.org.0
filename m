Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBkYCKeKsWnkDAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 16:30:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FAA26692A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 16:30:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251287.1548492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0LW6-0004ZE-8W; Wed, 11 Mar 2026 15:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251287.1548492; Wed, 11 Mar 2026 15:30:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0LW6-0004X6-5f; Wed, 11 Mar 2026 15:30:34 +0000
Received: by outflank-mailman (input) for mailman id 1251287;
 Wed, 11 Mar 2026 15:30:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0LW4-0004Wu-94
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 15:30:32 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d100a5e-1d5f-11f1-b164-2bf370ae4941;
 Wed, 11 Mar 2026 16:30:31 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso12787045e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2026 08:30:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b66e3f8sm57716385e9.14.2026.03.11.08.30.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 08:30:29 -0700 (PDT)
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
X-Inumbo-ID: 3d100a5e-1d5f-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773243030; x=1773847830; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TnBjGglOCM2+cTSoF662KVFUlDTC7/gd10+p2p4fWmU=;
        b=XZntlPKsF/eM+Bb/8fvGADM/1RUmpCIZn68QN4g+fIuVf6+f3yIIc6BHOizVQ/7GBl
         ZxBtDo4pCHRfGc0mlnAbB7CUzcVZZPWPWk15aMkNI3l2gGC6RzXOYgQ7JzKkNh89W9uu
         2zdJpkz4zYTw4NmeMw9K3NBI3OSJhrz+n6L/S12g25gqxt5Qbhr/+cfHAOVDoArMaWmv
         HUuC9v4t5zqbprRPFEBo5lp16RcC42KUCdcmazFlnP56H8BMi8u3ZAy0SySpucfdPlH4
         3JEyXnGKpTC/4K1Qu/jq1nh5D2a+Gl/K6lVovSf8/etmX3a47/kXn4Ghb7zGsk6T1heQ
         Ndiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773243030; x=1773847830;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnBjGglOCM2+cTSoF662KVFUlDTC7/gd10+p2p4fWmU=;
        b=Zk42vaxlWMKwQAqu/+EUfhcJnXiIR1YUwKaTi4+CfrMPfM2ZtRII57UqG3se48dEtz
         LTkzCZ8e7JnZvTi0q0HakJUYg++e8vsZCXm+b5yXcK646FSE51E51jarS7UicHrIiSEu
         IlUtIa1ITWqaWrpqUP+AYLoEt74CktuiXtc5uyCnY5fIWuf6LlIyg+t+0u9bPviE+/S8
         /k5k/IXYpDnCkXMMobjSGgPo1t2oVnbb6v7sp3RK+PpshrE5i4omr0p/ML5FfI9bdWVr
         WuA8/KJuaTB9qjv7+o6KHL9cAzhI6vwHbGSYh5g7AGxOw3Ztrfh5jngAxiqv8Gcm00bP
         OPDg==
X-Forwarded-Encrypted: i=1; AJvYcCWwKiO8Fl8tN4I8BBKYws2ek8tb8xGfZfZSlVw0vXcXf645GIH4RmnB5u2POgc1p4cfsqoCc5gWnxI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwRh3ZYOhC0yxR1L/6Gy1JZM52kaOkspfnlqJPZjbLUTxkBENE
	jUS27an5JoVrgTfO1TXxkvl4gPU58nhoyfASuOBgqpb75xY3IPxYAoBnjuHvnXKbVIkup9CMQgA
	w3+A=
X-Gm-Gg: ATEYQzxfGB8DFWAMMG2BJIGgRELIMBro6BhXJydKV8EkxZ7UT5XzR6HaOfzsI4y+/ma
	rGzuAAGE2BzLbQUKsHcJ6NkVQq7rvrNyajRhyHdwhMncB8xUSei5i9jGrBs9EsBkAyyPXBiVh13
	tFiV/uaCmIXLS/Z2OkiCL00Zhg3IIljgIn+Md00modzRPIfT/Pt8VzO2yDrUn9jGWskjt+Z0w7Y
	F3dQN5QqkStA+Sv1eBHat/tuvZMWyUJ6+HjIuflObtGpsY8ZKe4DH7O8WEXQuL7C0dM7JDfcfad
	bQ+Td7RyxU5G25EtVdOGb69fZ3ED8TOF3EJ56Tw+mb2t7kwZi/JuJnBvavAppqndTVazK/x780i
	iP9qV5H+iWTOUhPJx40eaMYX8TCv2KTWUQnXvuDS5YJeXDjPYYZxfdg481oqSlJrq7tztFKdv5m
	VyhdmsBatTYHpBbO5Lo02pXZMP8BJYXyV6w6JJh8CMh6gjScf4AT0l6QvfjWgYt1Y3Nm5VAjszZ
	bZioDYtqTnwaF1hhNkYcVV3IA==
X-Received: by 2002:a05:600d:8497:10b0:485:482e:f6c6 with SMTP id 5b1f17b1804b1-4854f523a8dmr1026395e9.0.1773243030353;
        Wed, 11 Mar 2026 08:30:30 -0700 (PDT)
Message-ID: <fd63c116-da64-4356-9f56-305a48b61ae7@suse.com>
Date: Wed, 11 Mar 2026 16:30:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] x86/passthrough: Use extended destination ID in PT
 MSI bind/unbind
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <20260309123055.880050-1-julian.vetter@vates.tech>
 <20260309123055.880050-4-julian.vetter@vates.tech>
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
In-Reply-To: <20260309123055.880050-4-julian.vetter@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:julien@xen.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 89FAA26692A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.03.2026 13:31, Julian Vetter wrote:
> In pt_irq_create_bind() and _hvm_dpci_msi_eoi() replace the bare
> MASK_EXTR(..., XEN_DOMCTL_VMSI_X86_DEST_ID_MASK) calls with
> XEN_DOMCTL_VMSI_X86_FULL_DEST() so that the high 7 destination ID bits
> stored in XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK are included when
> computing the target vCPU for MSI passthrough IRQs. Increase the local
> dest and delivery_mode variables to uint32_t to match.

Why exactly would the latter also need widening?

> --- a/xen/drivers/passthrough/x86/hvm.c
> +++ b/xen/drivers/passthrough/x86/hvm.c
> @@ -281,7 +281,7 @@ int pt_irq_create_bind(
>      {
>      case PT_IRQ_TYPE_MSI:
>      {
> -        uint8_t dest, delivery_mode;
> +        uint32_t dest, delivery_mode;

Please prefer here (for dest) ...

> @@ -807,8 +806,7 @@ static int cf_check _hvm_dpci_msi_eoi(
>      if ( (pirq_dpci->flags & HVM_IRQ_DPCI_MACH_MSI) &&
>           (pirq_dpci->gmsi.gvec == vector) )
>      {
> -        unsigned int dest = MASK_EXTR(pirq_dpci->gmsi.gflags,
> -                                      XEN_DOMCTL_VMSI_X86_DEST_ID_MASK);
> +        unsigned int dest = XEN_DOMCTL_VMSI_X86_FULL_DEST(pirq_dpci->gmsi.gflags);

... the type you found already being in use here. See ./CODING_STYLE as to
the use of fixed-width types.

Jan

