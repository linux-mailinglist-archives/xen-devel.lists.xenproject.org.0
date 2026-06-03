Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LXK0OPVJIGos0QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 17:36:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4100E639431
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 17:36:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=a8QevXZa;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1326915.1592192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUndV-0000PP-PY; Wed, 03 Jun 2026 15:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326915.1592192; Wed, 03 Jun 2026 15:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUndV-0000NE-Ly; Wed, 03 Jun 2026 15:36:05 +0000
Received: by outflank-mailman (input) for mailman id 1326915;
 Wed, 03 Jun 2026 15:36:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUndU-0000Mm-8n
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:36:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUndT-00GQaI-Lb
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 17:36:03 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2049d9-5cb7-0a2a0a5109dd-0a2a4502e24c-24
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 17:36:03 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2049e3-af86-0a2a45020019-d155802eb932-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 17:36:03 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-490b915ded5so6844255e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:36:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f34413csm8102478f8f.21.2026.06.03.08.36.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 08:36:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1780500963; x=1781105763; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=98fnc1vhwMEe+rZvTvy6V6aeU/h6wI6BUHNXZumn3FM=;
        b=a8QevXZaJW4K/c+jEqIebuwieqnesWGNOkQB6bC3LLG9VVvrZZEUKaYj6ZPRdVYRTn
         hDvSsZ8kW2EznvsPU8QzNeeMsW42y5tDMIzn+bc1nFulfQOKCnZmBL/i9sYmRqJkoRgJ
         A9uRFI5rYlrn2J+X65Iqd37a8gx7amrtDM9WESpQA/NZPs/6dhVITYc1gyvhSc2uvP0U
         oCKWbrGmPU8FiDiRXEdRokHnzYD5icuZHUoUBSB2CmLPJ1ApAZd3IVIOmh4RgxV0YsGZ
         qXZISuNm3aGXeCDTZmE/M5orDnrmPDG4bx9rfYth5Y5I9bavbey0ULNOTG5B5OOv+Sdz
         Qo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780500963; x=1781105763;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98fnc1vhwMEe+rZvTvy6V6aeU/h6wI6BUHNXZumn3FM=;
        b=hZDlDlRuVGrQY6ug1kwKLZhGIerVdl5vRP94f7HcvPE1Z8bd9aD//WYtDIs1Tkw0UE
         IDV7kzBf2Y8D1G6MAXkZ/LsRO+MvPvaDej9pG67NKAmtmqWDqO7AeXdTDr9XHgHUJ13g
         wqFlUeYj4UiEv0JQaZXzMpaCZ6It5BCpmINrxL4X6piWPnlKeLFsXWf/bnz1u7g6lz3t
         waw0wZMvwTrdjH6KsgCcH7cS0qcSJwX4oIpv8tImPgHTQ84WfFZxGlOJEyJT4rIZMd6o
         KiPbyBDF9rwAB5w0HBv5ETltdHihB6v0IZZOLY1iEI+rcySdQFwvcQieit0P1rCbCxN3
         kt8g==
X-Forwarded-Encrypted: i=1; AFNElJ+F1liGP1++sAoolp/YDkV6na0fBGwNuyoWLxhSFodK5NsuDkz4S0320CjTAjTp2tEzbfuQKHf0fVk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwX092krM1vONmXXdYHtj++9OfRW/w05NDBMFtOT6/zIXEgsv9+
	jQmre6UmWe1dwyGC2a7Q0VXraw8d+L4/0KMH+Ws1EjTVp05g7DiS+Su0DeeSYucUyQ==
X-Gm-Gg: Acq92OFik+VfQ2ggh+228drdH7Q/ybJIq8J/OclkyQmj/+vP1KK4EeIk5hw2rOo9dSS
	CzWXHViDkVIsucObfFV2phxoVa3JfuUxfPAjpKT+wwkE01b9QUwPtof052cv3fqg+tOg/JGWz48
	bnS4kEerf27m+REDQnHphIDaRns7eSeMMEjfPT2cY5yUwzfyVP+k+uksgPgKCtcC9yVNj4h1qbX
	dLVTDqNH3u//RU/cUqrxK+cX9gBPDL+24xlMyqMR4Wnh+cQUNuyQZaq1ppCATF+VF5dfG/SmKdO
	CZQUHUje/bLpwsH/n9sPOSQmHLUSpwrz+m5lkurXxmGf0bT7JvZCjnkkQQF8XAuH9yDATFHRLOW
	djo+S8iMiEvN9+aev9X8QzoNe4GgTg/HZUh0fNDqcXKcO7uO8cM073EUH/1bkWmP5K3w5uREFXE
	jiSDbFj8iCQXRUDKPuC+LPK0/xdMyfAu6o7d3U+dhbhjYDKW4K8d1LSbT8mYqvqE4IWwY9a90lW
	azEcSYo4czEfG/ApwqUQK1ROQ==
X-Received: by 2002:a05:600c:64c9:b0:490:bb20:de64 with SMTP id 5b1f17b1804b1-490bb20deadmr24854465e9.5.1780500962764;
        Wed, 03 Jun 2026 08:36:02 -0700 (PDT)
Message-ID: <efeb7cd6-e66c-47bb-8497-d695e19dffa2@suse.com>
Date: Wed, 3 Jun 2026 17:36:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/26] xen/riscv: add missing APLIC register offsets,
 masks to asm/aplic.h.
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <736349477470f316da7020c4c1c7e92e37470d31.1778250616.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <736349477470f316da7020c4c1c7e92e37470d31.1778250616.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1780500963-81D77161-35F3E688/0/0
X-purgate-type: clean
X-purgate-size: 1836
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:from_mime,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4100E639431

On 08.05.2026 16:43, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/aplic.h
> +++ b/xen/arch/riscv/include/asm/aplic.h
> @@ -15,6 +15,11 @@
>  
>  #include <asm/imsic.h>
>  
> +#define APLIC_REG_OFFSET_MASK   0x3fff

This I can see this as wanting to live separately. Yet ...

> +#define APLIC_TARGET_IPRIO_MASK 0xff
> +#define APLIC_TARGET_GUEST_IDX_SHIFT 12
> +#define APLIC_TARGET_EIID_MASK  0x7ff

... what (set of) register(s) do these apply to? Perhaps ...

> @@ -26,6 +31,36 @@
>  #define APLIC_SOURCECFG_SM_LEVEL_HIGH   0x6
>  #define APLIC_SOURCECFG_SM_LEVEL_LOW    0x7
>  
> +#define APLIC_DOMAINCFG         0x0000
> +#define APLIC_SOURCECFG_BASE    0x0004
> +#define APLIC_SOURCECFG_LAST    0x0ffc
> +
> +#define APLIC_SMSICFGADDR       0x1bc8
> +#define APLIC_SMSICFGADDRH      0x1bcc
> +
> +#define APLIC_SETIP_BASE        0x1c00
> +#define APLIC_SETIP_LAST        0x1c7c
> +#define APLIC_SETIPNUM          0x1cdc
> +
> +#define APLIC_CLRIP_BASE        0x1d00
> +#define APLIC_CLRIP_LAST        0x1d7c
> +#define APLIC_CLRIPNUM          0x1ddc
> +
> +#define APLIC_SETIE_BASE        0x1e00
> +#define APLIC_SETIE_LAST        0x1e7c
> +#define APLIC_SETIENUM          0x1edc
> +
> +#define APLIC_CLRIE_BASE        0x1f00
> +#define APLIC_CLRIE_LAST        0x1f7c
> +#define APLIC_CLRIENUM          0x1fdc
> +
> +#define APLIC_SETIPNUM_LE       0x2000
> +
> +#define APLIC_GENMSI            0x3000
> +
> +#define APLIC_TARGET_BASE       0x3004
> +#define APLIC_TARGET_LAST       0x3ffc

... these? And then is ...

>  #define APLIC_TARGET_HART_IDX_SHIFT 18

... this also covering some part of them? Can't they (a) live together and (b)
have some kind of connection to what they apply to?

And then why is there again a mix of *_SHIFT and *_MASK?

Jan

