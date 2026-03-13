Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIDoKfIAtGnCfAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 13:20:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DB1282DA0
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 13:20:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253631.1549769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w11Tq-0003Cb-Be; Fri, 13 Mar 2026 12:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253631.1549769; Fri, 13 Mar 2026 12:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w11Tq-00039d-8Q; Fri, 13 Mar 2026 12:19:02 +0000
Received: by outflank-mailman (input) for mailman id 1253631;
 Fri, 13 Mar 2026 12:19:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w11Tp-00039W-4l
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 12:19:01 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfedd9a2-1ed6-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 13:18:58 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-439c9bdc1eeso2072727f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 05:18:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe23afc5sm19128232f8f.39.2026.03.13.05.18.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2026 05:18:57 -0700 (PDT)
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
X-Inumbo-ID: cfedd9a2-1ed6-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773404338; x=1774009138; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=52jXBomZWL3JEa/wyjMyxyAZPY7yH4Sam9twuFIZvpI=;
        b=ca8GnyF6Rp1DK0R8kzQXipyQzuR2tRyY+NvXzsW1AfNv4jC3teSQRddKfVMFKnYd39
         bDZAG/gnpHzUPk5+kJBxVws/Pksp+tcoNW6WxrGgTaMYfZCK8aDPXxQzFxVC/fqVk8Ne
         KOFbr+7zEhdtWkh5DEu1ZqaiWvHudxnFySsPOUwRajWIzI+9RIhGR/eZ33eF+jNxqCK0
         VMbC8/WmXXSHEkeWRcmDlXwOD0gAHzqeepLwN155w05SYywWajrSX6nJPjWxIMu7cX+t
         xvk4x4i4c1L26nFdltKKuIL+qmcUEuL4iEEkjHgRG0WCqIg6q4kqapF2etU0mr5YE6+J
         o3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773404338; x=1774009138;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52jXBomZWL3JEa/wyjMyxyAZPY7yH4Sam9twuFIZvpI=;
        b=jKrbPELe+cMmr7k0b5uezAur50kISg8mUmd3uGk9ooYLAPOXOmgEs+YkLF+aZK+Nky
         wXHOKhEoELbAmAi1lzekm9Ck8DUADWUQltCCz+RGtsrs/SOS4OX4Q7d1DFno4piCMETN
         JckvsdRCOg5gt8LAdzh2/wL2bEzC6z3AVQ2LlVE3je7R2ZjsFZarf02H8brOCaBtaZtq
         n8Lphyv7fruJmt9YsRxU1tCZfFwsOuGaE1b3chVUkKlw2w3fbPDaa7i5tQbltaK8MRbo
         QtCJzm/LmpEv/bBTYKz4iGAp2xEpxo1alH1HpdEKwyK3KUUK9kGqSzW3iARWUkUV+pdg
         /f8A==
X-Forwarded-Encrypted: i=1; AJvYcCVy08sVs/rrmmCsBdiGQKLgHgxq2p7+qKrTTFVxwiyvK4iJ2zG8iRoSRmR0FyT+BQezcEzg5g7zzRk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZwuCUsMNswJFnjQj4CfT4PkiqpZRYN0e3N56loJmM41A8UyE5
	jJkgHsXq5/Obu8Jyswqo0PNuwoY2QYv9v87pVILOiEIEafwMd8mMxgshvtD/6CHdVQ==
X-Gm-Gg: ATEYQzyC+fwlqIFYqjjgoI48BoSEeoMHNcHSPLGEIBGnjN77g2LyPV0iIeQHoWo/hxI
	Gf6qFegKFz8z2oqfv9BM+A4jk/b8hfu2FuhrXedpY4Vx7juF1BoGSkQc7YE6NO8KCC+H7K3VNpX
	BRenvOOv5LIWGbiPdC8Lsy5ScIQ8xxno8w0qaUXLlUivKp7pKkuq6y1VJBPIjCBcrzUwUuccHbV
	fTCz61YlKg39uqDWioaRgvSIG+WITMSJga0qA8vZLanI2i9CYBdWcRQOnW9RG/7C9DstTIvy85G
	i6OfIiPld3wo79XnaoVSqYKOfHDuHiM9Zzg+vwDk5CHtbAdnf39S7AhhC7GJtqZNKk1UFCEi7gW
	HwY9U1MpkMzvZYd2MRg9KdLsaId6KRtu2S8yc52ZYsBKf7usrb+PwYG3mtV4rGayZA8IUT5HkqA
	N66cMhBaIkJyOmOcjotMTuGiWt+5QymTkD/esqT52T2gdm+q8fkM0E80LrWr344v1L6D0r4pP9D
	1nkp3X6R8cHLWc=
X-Received: by 2002:a05:6000:2511:b0:439:d74f:da94 with SMTP id ffacd0b85a97d-43a04d78fc2mr6154010f8f.5.1773404338006;
        Fri, 13 Mar 2026 05:18:58 -0700 (PDT)
Message-ID: <812694e4-e1bd-42d3-aae5-5bcbaee85678@suse.com>
Date: Fri, 13 Mar 2026 13:18:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm/pci: address violations of MISRA C Rule 20.7
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1773399567.git.dmytro_prokopchuk1@epam.com>
 <e2ff9382c0427114fb569fd07f8f44f76d8c5d74.1773399567.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <e2ff9382c0427114fb569fd07f8f44f76d8c5d74.1773399567.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 03DB1282DA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13.03.2026 12:44, Dmytro Prokopchuk1 wrote:
> @@ -139,14 +139,14 @@ static void pci_config_write(pci_sbdf_t sbdf, unsigned int reg,
>      void pci_conf_write##size(pci_sbdf_t sbdf,              \
>                                unsigned int reg, type data)  \
>  {                                                           \
> -    pci_config_write(sbdf, reg, size / 8, data);            \
> +    pci_config_write(sbdf, reg, (size) / 8, data);            \
>  }
>  
>  #define PCI_OP_READ(size, type)                             \
>      type pci_conf_read##size(pci_sbdf_t sbdf,               \
>                                unsigned int reg)             \
>  {                                                           \
> -    return pci_config_read(sbdf, reg, size / 8);            \
> +    return pci_config_read(sbdf, reg, (size) / 8);            \
>  }

I guess the trailing backslashes would better stay aligned? (Can likely be
addressed while committing.)

Jan

