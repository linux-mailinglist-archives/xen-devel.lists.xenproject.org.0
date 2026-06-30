Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LL9VIzCsQ2oNewoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 13:44:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A606E3C4F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 13:44:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=fRiQAHdB;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1348753.1606449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weWt5-0006lF-NR; Tue, 30 Jun 2026 11:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348753.1606449; Tue, 30 Jun 2026 11:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weWt5-0006iR-J1; Tue, 30 Jun 2026 11:44:23 +0000
Received: by outflank-mailman (input) for mailman id 1348753;
 Tue, 30 Jun 2026 11:44:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weWt3-0006iI-ML
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 11:44:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weWt2-005bA4-Dn
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 13:44:20 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43ac09-2eae-0a2a0a5409dd-0a2a450598e6-38
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 13:44:20 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43ac13-3cb2-0a2a45050019-d155dd34b0ed-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 13:44:19 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-472326ca506so1428706f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 04:44:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4756778fac3sm6545975f8f.32.2026.06.30.04.44.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 04:44:18 -0700 (PDT)
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
        d=suse.com; s=google; t=1782819859; x=1783424659; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=prVNE2+hvpF/2KDH2sWcfWK95egB1t75JcKalp+SI3M=;
        b=fRiQAHdBL947F1BZ/SyoUal+yLMkLRBOhXAqPbdz27KLlcEt5uczfl+oSIQwFYua7C
         YV1JH3/kg4WmN7qMPLzCis9cgpjvwZtnq9OAE/R7oEVefBUSNrueYYqSRONQSKX8bXdU
         +KZt7OKGy1u9q5YFwMhsXOYVmtkJ2Ue1ilkYLcqMNXR2AZ4BZ9ZSNSPfaVEkltOu8MZO
         Rc5KaydtqpzhfDIPDTnG7U63XGYkr9Bx2VBLy8ROzbbmCYHJ9DtlNKz61hnEx4lILUVa
         CnqQtQcVOyt4dYL2w0CcqdW29LzaqytVjVBOEcY1kdxv18De6jSTBbh673NMHjpdRkGv
         EBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782819859; x=1783424659;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prVNE2+hvpF/2KDH2sWcfWK95egB1t75JcKalp+SI3M=;
        b=PYCYk0CdyFGTBv18yIMhPB6vqPGJhlg1aSmJHXcd1mw9ZJJSoETDYjpa2r3FTY89M6
         vYW1ap/1qWzLjaDfjupM2TKit0D32wk85+cRMBw/t2AjbGjEQLaXrUO+/cfZBi6guh7t
         nFJWPvc53Nnfy8TqXmS0rYMaZWS23P20d16XZcQmVf8CRrIF76rmtn20nveU+4sWrJLj
         vZM2MlhON1L/84pD47cjehlkGeiWeTLK1LOYBFK+FcB1ZCIa5xzn1MG1Jb9jV+wwCMrf
         PqIgho2T6Ms7XPB6Zc2z8ZhxdtuG1CZHCuW0ySYTAeZZUKfQn2V+RnDLWI/dRDFKmprw
         1yKQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnBHVifvVPC8I+UaWGqolKO6R0tpLaFHBttf4gB9PZdfBRvTnXrr82AhVsV0YbFMbUsfqvl5Oj4Xg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwRgQLcw1+yTP+YuGsrkgyVaXqEWZ3CWGaBs9HaqZxXsqM7ByjQ
	h9l1IJ7x1nMio4kDL+qM3EM8v2S6maIaW34b/uE/JoVbBPxlWor4guwiLD+pHQhmOv7j1Omwxq+
	kqwQ3Ew==
X-Gm-Gg: AfdE7ckbGJYREDhvgtTtztoAuGB3j0AUt7hlmgl1xy5JSEyaAXPC9m4EFfAkcOMJl1a
	vAYc5HUb026y1Kxoj4xzQdFWzDQ4lgTjObPxN6lXPxh7UkmJw8WjAu4MWqsxdQHQz0cFkhIP8uV
	eeG2MdJgNntYsRKi8ZqO+puAZKaaPZBcU3pfd0ljiyZNtTDA9jiP1G801aq4z9gz4MHtsvk8CVJ
	4+9k4IirSMao969XtSSyt1cU1izhgKardD+/M4aDc6VOjG5KZu3HHLyP+HjIlkloARNXQs3O6cK
	KQZQzI1YVD/ou+qbsyUxNqzZvSn9BKItFJCirGldV4dN33MO84UkCpL2RNqgFtO8FLxyrBFnrrO
	HPbNDDTmqCiuoKlvDzw53TpG5AWTwFtWLsJgSMlRhKWkKRxIyldbcCBHTHxczOSkl4EFaP2cBfv
	d4NQcG1J1yHtSekmFrAWgBFINlVNIDnyWPRHElpqLtWRuNCtgyONWfj254nkFPreQRcr6YJAn5O
	dBw
X-Received: by 2002:a5d:64e6:0:b0:475:f0f0:9ef3 with SMTP id ffacd0b85a97d-475f0f0a15amr2186598f8f.56.1782819858874;
        Tue, 30 Jun 2026 04:44:18 -0700 (PDT)
Message-ID: <b0900c5f-03eb-4b80-9cbd-56368b0ffde7@suse.com>
Date: Tue, 30 Jun 2026 13:44:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/18] pci: Use pci_sbdf_t in pci_add_device()
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1782747421.git.teddy.astie@vates.tech>
 <1782753810.8631fc262581453bbf619ec5b2062170.19f1468572a000701b@vates.tech>
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
In-Reply-To: <1782753810.8631fc262581453bbf619ec5b2062170.19f1468572a000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1782819859-16D162B8-4C226186/0/0
X-purgate-type: clean
X-purgate-size: 2517
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1A606E3C4F

On 29.06.2026 19:21, Teddy Astie wrote:
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -662,12 +662,11 @@ unsigned int pci_size_mem_bar(pci_sbdf_t sbdf, unsigned int pos,
>      return is64bits ? 2 : 1;
>  }
>  
> -int pci_add_device(u16 seg, u8 bus, u8 devfn,
> -                   const struct pci_dev_info *info, nodeid_t node)
> +int pci_add_device(pci_sbdf_t sbdf, const struct pci_dev_info *info, nodeid_t node)

Nit: Overlong line (like already pointed out for v2).

>  {
>      struct pci_seg *pseg;
>      struct pci_dev *pdev;
> -    unsigned int slot = PCI_SLOT(devfn), func = PCI_FUNC(devfn);
> +    unsigned int slot = sbdf.devfn, func = sbdf.fn;

Andrew pointed out an issue here for v2, and you addressed only half of his
comment.

> @@ -729,14 +727,14 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>              if ( !pdev->ext_cfg )
>                  printk(XENLOG_WARNING
>                         "%pp: VF without extended config space?\n",
> -                       &pdev->sbdf);
> +                       &sbdf);
>          }
>      }
>  
>      if ( !pdev->info.is_virtfn && !pdev->physfn.vf_rlen[0] )
>      {
>          unsigned int pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_SRIOV);
> -        uint16_t ctrl = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_CTRL);
> +        uint16_t ctrl = pci_conf_read16(sbdf, pos + PCI_SRIOV_CTRL);

Quoting from my v2 reply:

"Are changes like these two actually worthwhile to make? sbdf, being a function
 parameter, can be modified in the course of the function. pdev->sbdf, otoh,
 cannot (for being in a const struct field). If further sbdf, throughout the
 function, never had its address taken, the compiler may be able to produce
 better code."

> @@ -818,14 +816,14 @@ out:
>      pcidevs_unlock();
>      if ( !ret )
>      {
> -        printk(XENLOG_DEBUG "PCI add %s %pp\n", type, &pdev->sbdf);
> +        printk(XENLOG_DEBUG "PCI add %s %pp\n", type, &sbdf);
>          while ( pdev->phantom_stride )
>          {
>              func += pdev->phantom_stride;
>              if ( PCI_SLOT(func) )
>                  break;
>              printk(XENLOG_DEBUG "PCI phantom %pp\n",
> -                   &PCI_SBDF(seg, bus, slot, func));
> +                   &PCI_SBDF(sbdf.seg, sbdf.bus, slot, func));

My v2 remark here also wasn't addressed. Please can you make sure to address
_all_ review comments before sending a new version?

Jan

