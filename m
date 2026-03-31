Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHuBIqyZy2mYJQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 11:53:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E852C367653
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 11:53:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268831.1558023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Vmk-00021h-Be; Tue, 31 Mar 2026 09:53:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268831.1558023; Tue, 31 Mar 2026 09:53:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Vmk-0001yv-8B; Tue, 31 Mar 2026 09:53:22 +0000
Received: by outflank-mailman (input) for mailman id 1268831;
 Tue, 31 Mar 2026 09:53:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7Vmi-0001yp-Ot
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 09:53:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7Vmh-00BLMJ-Sq
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 11:53:19 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cb998c-e002-0a2a0a5209dd-0a2a450cd358-12
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 11:53:19 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69cb998f-f93d-0a2a450c0019-d155dd2be16d-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 11:53:19 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-43b87970468so4897090f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 02:53:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf90424fcsm21066707f8f.32.2026.03.31.02.53.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 02:53:18 -0700 (PDT)
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
        d=suse.com; s=google; t=1774950799; x=1775555599; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y7iSkdwsr8Da3sth56YaQEbb24kVM2rBJC3YUVWOatA=;
        b=A4ixTmm4edTonUR5X0yr2pze+0FRqV+bRgG+xgYgdgQVCKyLVufkx/ChPcNWNAKekR
         cpMc7mPpiEC0bOeugnJ43CQjCQDFiRavVDxapDFoJX1CDHKdcrHgrmg2EZ/zAUVNnCq9
         9jbr201IDqlJGLH5kOIuF+zQeL/UVJ0rPjLBqmURnaKw5Dy9Vk4CVK8v06g7qbDoPI2p
         kwjRyr9ENIPdr7QBNgs2vlOuoF3giYIF8A0DmOIi+7oDEVlEJ4ToGQpg8Ygfc6UcmMIg
         ejQIc8yHzILTE/5VeY6CO0ylWnRlcH/norJdVcHJvjXr4ADCZQIT4WwrpgYlgBBALlc9
         Ro/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774950799; x=1775555599;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7iSkdwsr8Da3sth56YaQEbb24kVM2rBJC3YUVWOatA=;
        b=SSKwJj2Cje7XXbsvcptU1c3nZM5IBMKmKtXWtNRWUV4fNYJZy8qL/1sHFzfAnf3wqV
         BRbkOWVpr5Ll9poozLGfMsht8hFOosvVKlCTBMHD9C5yWbQfXFVrgax1iXNl6fZ0NZFP
         VTu6drDuRKjnjEDRXMcL0UluuwmrYPLdXrekh+paAosUyPbv7dWJ8OmzxbYOL5E4Psny
         b2vy3eypUWPQWRVp3btkA865LghZtho4FDK1AtPl7AAWroJKfUo4/RGkK4SdnnnW03o2
         5Ags5AGpil5nPfBOc6+lgO7IpVpzduUpeRe2n9LBosyf4h6IfEEMO8Y7hhxzW/8xAORU
         SFHA==
X-Forwarded-Encrypted: i=1; AJvYcCVquortzmgJorm7BNTxnmDXC633n76mmBmSB0dyov57dyS8z0bZMDuIxRaT3prkNaNqVTSa4fY75y4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLqJ4FNzmxIywLCws/PTJQZUiMvjp+qDXAdToKgJ+zI1Ca+/16
	Fh3PyLiMB2vL9bTpTnMryoLARBsZC/BOworycjcu35EeJYY+wsgp+eQvNNUfBG9rXg==
X-Gm-Gg: ATEYQzzMQCNTmCp5wvtZwdN4qViqQsSXYOYjiD13GCNzBzj48W8nEPt4nRXTvz9S6Ez
	cR3HQMKG+kRwQT92MMhwYIiVqER7DjKl6GP3NB5WqBMkU8qEn3RESLiUiK20rmU73JgUp2Nxbzs
	8CGDwoBTdW+GN6rKHgdZUE6GyTQKUph2fWTF+JzmQgUFsPKuzlPfnNemXEgPT+1CGKfaAZTcnxz
	/fkNwUE6uT4zmWlVV1xzbTpxkvfITi6ReFrsfSYgKGr1IZvEU0jNkfG0hy3ltBezcRqePjB0yzv
	ZMI2BWX04uIBUFR7LHEqDjt4qEplWm35i1mrmqCLCTXFOIaiuk0tNtVLz2mbdWtjjUrRx942EIH
	QScI6VGORkyBpAfkGqM05Ubpg0QzW6GBuvJ1ccUxh6r4UOI7L5ecUDVlWhn2TjYHsePVT58faJ5
	99SKR0EZF+Vf5HxQ/iD/3vukO+ksmT7UBzsHiIWhXIiMxMAiJBWroKLe10rdWQzjOHtoLaeS4Q8
	p9z7eE4GBzD8QA=
X-Received: by 2002:a05:6000:430b:b0:43c:fe7a:491e with SMTP id ffacd0b85a97d-43cfe7a4b9amr12424633f8f.32.1774950799047;
        Tue, 31 Mar 2026 02:53:19 -0700 (PDT)
Message-ID: <b202c2c9-e313-4abb-8613-2aea0e6c0500@suse.com>
Date: Tue, 31 Mar 2026 11:53:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] vpci: add a wait operation to the vpci vcpu
 pending actions
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1772806036.git.mykyta_poturai@epam.com>
 <ec941fbf4f8bde23fc3867e47f5ada028f8003aa.1772806036.git.mykyta_poturai@epam.com>
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
In-Reply-To: <ec941fbf4f8bde23fc3867e47f5ada028f8003aa.1772806036.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1774950799-F68AC734-53B96A62/0/0
X-purgate-type: clean
X-purgate-size: 745
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E852C367653
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.03.2026 12:08, Mykyta Poturai wrote:
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -212,7 +212,26 @@ struct vpci_vcpu {
>      /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
>      const struct pci_dev *pdev;
>  #ifdef __XEN__
> +    enum {
> +        NONE,
> +        MODIFY_MEMORY,
> +        WAIT,
> +    } task;

Unlike structure or union fields, the scope of enumerators is global. I
don't think generic names like NONE and WAIT should be introduced into
global scope. At the very least VPCI_ wants prefixing to them, albeit
VPCI_NONE of course isn't to going to read very well either. Hence
either replace "NONE" there as well, or use e.g. VPCI_OP_* as a prefix.

Jan

