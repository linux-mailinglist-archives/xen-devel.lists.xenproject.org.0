Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sN4AJWP6D2qESAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 08:40:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A475AF999
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 08:40:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316336.1585727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQJYG-00057g-V7; Fri, 22 May 2026 06:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316336.1585727; Fri, 22 May 2026 06:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQJYG-000568-RU; Fri, 22 May 2026 06:40:08 +0000
Received: by outflank-mailman (input) for mailman id 1316336;
 Fri, 22 May 2026 06:40:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wQJYF-00054K-8D
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 06:40:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQJYE-00DWME-DJ
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 08:40:06 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ffa43-2eae-0a2a0a5409dd-0a2a4503dd1a-18
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 08:40:06 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ffa45-672d-0a2a45030019-d1558033f1c7-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 08:40:05 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-488ab2db91aso72807585e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 23:40:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454ea134sm25151995e9.8.2026.05.21.23.40.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 23:40:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1779432005; x=1780036805; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HkWB3b716oQDbUQg3DPfRxUzoUOFI7+RS8DSdaj562Q=;
        b=O4OxGbuQ8/sghVZ+XIRLBnHPaZNozs/ongV21AWbnFo0l/rzByXNQN7H1/n1j+Tont
         oC3k9gHY3o2fMs68wd8BFIEL4W70C87+hFX1b5mnB/b2mnEg5lMv2z5EsClaccNUzvPv
         C73MBdCPKHme1TlBR/A+x6hzP1C5cW8/6gLSTnjbVKvYCVYdMYDLHXwG1tHaDmv7pYkF
         atwTYkng0GfOSh7wM2Q77nhlo4zQ5uY1bbRUJgisT62pKRfokgVeG2F1xVnCm0O148lL
         ZYoml+sjJ7fcEh20mXEvH5KT55QPdDL64+njTaFAqnDcA/14Dcv1xvsqmI0H1eeTycmA
         xKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779432005; x=1780036805;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkWB3b716oQDbUQg3DPfRxUzoUOFI7+RS8DSdaj562Q=;
        b=cTOSe6kIQpCMK+pozf8JlwEfwv9kUWhqYui6hqz+pcYJ/D6wrEXczKA0HdA73TXHCc
         CTNImck5upd59DpGbpLirARnEnxb3zXq789WIYaP141rIrQvkvDLDvWRCqN5Uq221+ZE
         Vg0lJ4T/VdjQU9RCmv7JRQv4NUfdYAjxUcEeJExMKeqpIq3JVJuud50GCtCQ28h1yzjq
         5C0+Z+Q5xN1gKFFfvgGiJK1zFE2HRHlle9EMsjCLRJQekSY/aiLVfoyyLv1tuRNYHafE
         6Vf8b+6xVONTaRFKgbATriMo+k5W8IZLRp/4IlBiX0nUdLiMJrzTEqHcLlLrjFFhsUob
         XMKw==
X-Forwarded-Encrypted: i=1; AFNElJ9iQb8grtrIvg5R2HMR0kOAgDiuY0SkdPuWzw+xH3ob/BR/EuEDWQtkpamh7HVuMt8jxYyc1SHjENM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNs56JjtZZfZSDxoMfq1bodF/LkgzKjpExsYV+ida2aD2Yoh0r
	Y5WsyDCuAoTumH3cFyjNRTTOm/e2stDfHMR3CoyzGxhtd7KocUPSsw+BxWLwF0++gg==
X-Gm-Gg: Acq92OGYMD11BJZHZDTPeua+xyfIDzIx/t/Nq4ZJfb6CvDcbjNJK3j0cAummqwonp9v
	0YiwgR8GNvHaDONr8UUy0Vem2EVhOga+33w8Cb5e7Ut+hes95aefU3ybKit0vXjcuR+nR3qzzq4
	vvz3MnDATFxMHoEc1QLY0om45wMDacXX9Mj/+wlaodjyM/hkI8aqf6JbgwEz/PcHHCRRnvRHCVE
	sK/dSIjlpIKfBrpdf9+lBo4wG0KwIIUKU88w1784IVHE3URI7NzsmuOSuH4sO/rylaCWqu6hAKA
	SqjZtDmfcfLcYLOtTapz7Jw00Zf617sqpafkETGKtynNBXVgLhUnSHNIP0qcYEFCa4ZVlBvOwfz
	3AX9yWW7kgYVqgekrKwRzEZ6oH0vRHWbLt416igJJFOYom0/gb2TyvfK+q6uysgOG1fJzcwuE7J
	Q16sDQZk05P1qiiBybI5/3NggPTi54LzvRZLINyMx4n/RhoLnkaSxcVtUPln4XR4UZtKTGVWcET
	aQIMIteedfHaN8=
X-Received: by 2002:a05:600c:4688:b0:490:4224:e0a2 with SMTP id 5b1f17b1804b1-49042ae265bmr24797115e9.33.1779432003603;
        Thu, 21 May 2026 23:40:03 -0700 (PDT)
Message-ID: <984c91b8-3d2c-4431-bdf1-4a333ac341d1@suse.com>
Date: Fri, 22 May 2026 08:40:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vPCI: resolve MISRA R10.1 boolean arithmetic type
 violation
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e23266191a366abe66d8104783d97578aa8734a4.1779428826.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <e23266191a366abe66d8104783d97578aa8734a4.1779428826.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1779432005-38348938-9916B21C/0/0
X-purgate-type: clean
X-purgate-size: 1573
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 04A475AF999
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

(extending Cc list)

On 22.05.2026 08:13, Dmytro Prokopchuk1 wrote:
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -586,7 +586,7 @@ static void cf_check bar_write(
>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
>              gprintk(XENLOG_WARNING,
>                      "%pp: ignored BAR %zu write while mapped\n",
> -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> +                    &pdev->sbdf, bar - pdev->vpci->header.bars + (hi ? 1 : 0));
>          return;
>      }
>  
> @@ -647,7 +647,7 @@ static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,
>          if ( guest_addr != bar->guest_addr )
>              gprintk(XENLOG_WARNING,
>                      "%pp: ignored guest BAR %zu write while mapped\n",
> -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> +                    &pdev->sbdf, bar - pdev->vpci->header.bars + (hi ? 1 : 0));
>          return;
>      }
>      bar->guest_addr = guest_addr;

Well. If I'm not mistaken we had discussed situations like this (long ago).
Imo the added verbosity gets in the way of readability. If we absolutely
cannot or don't want to deviate such constructs (of which I expect we have
more), then we ought to consider alternatives (like changing the variables'
types in the case here).

As to deviating: rules.rst, according to my reading, says that &, |, ^, or
shifts would be okay to use with a bool operand. What's wrong with also
permitting this for other operators?

Jan

