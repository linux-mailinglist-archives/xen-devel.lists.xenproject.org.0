Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDhICWUujGl8iwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 08:23:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9A3121D9D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 08:23:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226993.1533331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq4Yy-00022K-Bz; Wed, 11 Feb 2026 07:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226993.1533331; Wed, 11 Feb 2026 07:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq4Yy-0001zd-9G; Wed, 11 Feb 2026 07:23:04 +0000
Received: by outflank-mailman (input) for mailman id 1226993;
 Wed, 11 Feb 2026 07:23:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vq4Yw-0001zX-Ft
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 07:23:02 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f26a9f7-071a-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 08:23:01 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4834826e555so26235435e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 23:23:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d82a4c4sm201525115e9.10.2026.02.10.23.22.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 23:23:00 -0800 (PST)
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
X-Inumbo-ID: 7f26a9f7-071a-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770794580; x=1771399380; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SZpozOWmJ8KfTot1zodG+tnuaQ9zL8nqZQp1QUhuLg8=;
        b=VR8TOqnuA90RREk+vgFDubABX3C2XnMsayWQmgrug0XdWxJpBkxS7ebmrSIModY32a
         aKtuYZzbwNtIfnWLaNJf04sRSrIzZC+fpCtO8RznZH5SMMyHL2KIan5KNJcNZnF2qW4u
         Zz/y5F+s3JCVhmJRXe0AkaIfTC9qo7dFfHl1R4fqSX/xYDA6340s/Ly34LDOTXmFsO9M
         /G+Ud8hNPqv1RgRhCybmafULrTQjNAWOhYGAasybg22eNOE0EcKhOHFIU5NXrTV7Evh3
         kxg3vJ6jyZ09J8qgQ7nX+dZRq+ssLrGuKyF6ErsDOO+R0EI95ZFwXh1lhW6BzjRwzyUf
         j8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770794580; x=1771399380;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZpozOWmJ8KfTot1zodG+tnuaQ9zL8nqZQp1QUhuLg8=;
        b=GB6Ymsw5MCF+Wm5iyBimg76WIYkaQWV7N7k2h2niy6JSqjPes4fflT3HiatEHUtxNu
         nDJBQ2ovFZu10HCC9z33ZOfVes2IDRlF4x+4/VEyCTib0lRxa7tvhSkoDvJTbRVO4VNZ
         s6aLmFR/k3Y0jBywKk9lTM6+fzI0zjCypiAozP+Nn07mgG+/KWsfAxBMPTkuX/wvG27g
         rVOc4gs8esVvMRo4spIA28wW7y3g9KfLbVtMk4jJlVNxjIIcVeRSQDV3neQEYt0aN1aI
         Cm6R/9rolfDeXCtaHGR1uPFGuJgbvIPUOXDSoM1bTFTvdfCsR0l5dvnwbQPy06lIrA2A
         BOkA==
X-Forwarded-Encrypted: i=1; AJvYcCWMQfvK9aZH7IEyNjcaiCPt4UwD+X3RdbrqNt5jTnbkHC0+VJc7mhpdkBTMoR7VHX8ewIjEXm5kceo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQW6qZnTQiPXH5T8Xj+aaYUJnohCR6nCo1stLaVAKs6Mw+pYHO
	d3fyaMp8CIeatJFIjI/DmU9mBSxQgZp3fHVzaH4CnmTRfKtw8G3BdYtXKOOcBBrPqA==
X-Gm-Gg: AZuq6aL+nwoWF8PNIDVl6zDuqEUcUHtCG1VeJO/6xArPmN3iuH7CY2YTaYLfCbWtuZ2
	H9DV9QlUleGNquyiTf5rYAr2GCtiUOIgZtbmwzRdq5ZoAbmg9zAoTPfQkzYWOcN/FNWAxegLdXd
	cV9SFdDcBE99Hp+ajTtDtVdCH7aYA3BhC5U08tIn8phA9gEbdiRJ4vTZKUWSVNGZk49qp3dLKoj
	CfOUF8op0QMysj7rJtVMp9gulcm53ufxkG4J3uxk4lC4GCsY2TQuQf92UANFJgns9NVhXs6/No+
	kaAR6PLpxwz7e+wke5ELGdOltu5kI9BReZv+AmKTphAcT/Bk719oP0Z2+bkibFfB87kYYObiqp1
	0bJ0odHFEtDOph4f23Y3NzyWXOG0YY8sr6jbLkVSV51e9QByW4KnD/eTJN32zTZL29FQoLfK/UK
	6YqTa+o19lte47LMz6LxsFA/giZs3tAMZ4mFdmRBJaOFdBoFDwkP89oY/VedlYDv1D535eDtyQG
	TbPo76AjgPQCJtqUpjyaSbc9g==
X-Received: by 2002:a05:600c:1d0b:b0:47e:e20e:bbb2 with SMTP id 5b1f17b1804b1-4835b8f7e6amr21375485e9.7.1770794580421;
        Tue, 10 Feb 2026 23:23:00 -0800 (PST)
Message-ID: <e115459b-8f4b-4211-8259-7807765d8fec@suse.com>
Date: Wed, 11 Feb 2026 08:22:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/16] xen/riscv: avoid reading hstateen0 when
 Smstateen is not implemented
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
 <d26b9103def3ff86524e1306c63cd84e217c8f11.1770650552.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <d26b9103def3ff86524e1306c63cd84e217c8f11.1770650552.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6F9A3121D9D
X-Rspamd-Action: no action

On 09.02.2026 17:52, Oleksii Kurochko wrote:
> If the Smstateen extension is not implemented, the hstateen0 CSR is
> considered non-existent. Any attempt to access it will raise an
> illegal-instruction exception.
> 
> Guard the hstateen0 dump with a runtime check for Smstateen support to
> avoid triggering traps when dumping CSRs on systems that do not
> implement this extension.
> 
> Fixes: 3babc8d2e546 ("xen/riscv: dump GPRs and CSRs on unexpected traps")
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

It is, aiui, independent of patch 1 and hence can go in right away.

> @@ -144,7 +145,12 @@ static void dump_csrs(const char *ctx)
>        (v & HSTATUS_SPV)  ? " SPV"  : "",
>        (v & HSTATUS_GVA)  ? " GVA"  : "");
>      X(hgatp, CSR_HGATP, "\n");
> -    X(hstateen0, CSR_HSTATEEN0, "\n");
> +
> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
> +    {
> +        X(hstateen0, CSR_HSTATEEN0, "\n");
> +    }

I was going to ask for the braces to be dropped, but I notice they are
required as long as X() isn't properly adjusted. This is why even for
local use macros we should take a little more care when introducing
them, so they can be used without having to pay too close attention to
their actual implementation.

Jan

