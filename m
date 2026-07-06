Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DToHF5xaS2qsPwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 09:34:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AACAA70D998
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 09:34:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=eCCHYufJ;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355080.1609877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgdqg-0003qo-Lc; Mon, 06 Jul 2026 07:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355080.1609877; Mon, 06 Jul 2026 07:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgdqg-0003pM-Iu; Mon, 06 Jul 2026 07:34:38 +0000
Received: by outflank-mailman (input) for mailman id 1355080;
 Mon, 06 Jul 2026 07:34:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wgdqf-0003pA-EY
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 07:34:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgdqe-000y57-LO
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 09:34:36 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4b5a83-5cb7-0a2a0a5109dd-0a2a4507bc16-20
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 09:34:36 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4b5a8b-9c8e-0a2a45070019-d1558035b498-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 09:34:36 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-493c733f15aso27352525e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 00:34:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce11497sm280355075e9.12.2026.07.06.00.34.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 00:34:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1783323275; x=1783928075; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PKjKDqe3Ft4ViRBEUvsPV0dWOvJrntPmhyZVACdci3o=;
        b=eCCHYufJczHtwlz9FC1b748X6clSgg5UytSDy5A3AqHvfLD2pcukqbysf9UvtMidkw
         ubodLkh4a6YJg9t2Ujf6m6+jvTHI6TPJ5gjLGA4FP8k5t/6PvNyvvd2Vn7j+RRB0MMgh
         uiqRXzg6dECDmooWp/xuzg5FjgwZsuckPdkIrH/h2MV3LUBP8ElX0NzsXyIMZFfmvhQ+
         qmeeyjh6A8LxcPc25fZsqZcv+Mq43Ct8B8G1e8GDkt27r4kb/uzqb5LQBq0g2gj9sa09
         pf9sFt89xoYBzgWz9pPxuZlJANXgqPxHeEDhpbZcSGz7a9kKDqgdcNQd+OctfOVeohfY
         LCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783323275; x=1783928075;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKjKDqe3Ft4ViRBEUvsPV0dWOvJrntPmhyZVACdci3o=;
        b=flY7k1i5M8tAN1PjFC1g4Qpvg0E6IW1LH1PnzlDgmBTET0BnUflS3Wo85q7p/CZ479
         7qoNMDrBipQVnTLVBVmybDUw0wZnTQiILjJpjTBmZduYNEbsCe29UZFrbQFSJXc0v6NI
         zx5gjCPD4ni/58kcqppcep/0izCQBW5LMDkQjG+ot+pITuTXKTK2FWeDs7xYHmimkj+O
         w4glC2jtLxKwAUqAL6/I4uFnklZU0oY1o1ce5fpEN4CrJWwWtI7S2uVoxKYi4l0Pz9yh
         jg2sXj+fYYJ5XPcxtpHi/KxxMQb8NfQgfWjQMopv5Ed/ESNPhXdXfW3OTf8IbnSfl+ov
         gdcA==
X-Forwarded-Encrypted: i=1; AHgh+RqdjLGQb34WJQH3trREakaSb8ScuNOLbDn4ao2GUagvTs/4y93/SX3O5TspFa8zq+W5RYr25XUWE8g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzeBltsB73PDoxjQQ9jWU+ms6B6D2CUU+T+W3RjA04y5LBQbgxY
	/P07RZrtQ749XnoF+uJ6eoXxSTifc0pngVamZK1qBxZIUF1BCR6tK/+zPvflAvoT4g==
X-Gm-Gg: AfdE7ckV3qxshXmeLzqi7QfG19ORM0C8cs1CdoJnZvosI3wObQyp1bRu+E7kxGC2UhU
	tJZ+sMtgWuF/GwETlz0rYAh3cGnV5L6Oeg/zl+4/6bwkU6/Fdd50dToldiH/UYiw5AR5pnlY0vu
	LYpKK5UWtiZaUPjV0xMy8unwVGncaz6UDIFmL67PPgGQhH70ym1KPfmvzMxHIyIE9SV15vbyXpk
	4ugC+Jq8Mixs3mUTkZJzmxmvcXtj25Dl4G9b7MJCsE9LBox1b0EQ0nOIbB9OpHGaqp1XxyrJbzv
	6K0vlQ7V4AXnUocVc7/5DsbEjTdplvxbcI4VsoZCW3lauv+fd6z7DQT6OrqlVPVpJKuOjjTEKih
	yTcdJH3N2L1TUYbArkBePaiDEZ4f20Rg6Qes7ZZ65t2jO/gZKrxzjIufwU7vaYg2s1M+ND+v1m0
	DeZO/Rk7IrgxKk4E5GuM00YAN1RaEEE/24x0pU5t1Y79PCO04OlF6snyzrx6868eDd+pzqhOmcy
	jXX
X-Received: by 2002:a05:600c:3506:b0:493:be08:c372 with SMTP id 5b1f17b1804b1-493d11dd320mr104492505e9.17.1783323275489;
        Mon, 06 Jul 2026 00:34:35 -0700 (PDT)
Message-ID: <d09788a2-b8ab-4ef1-9973-aed9c50578d1@suse.com>
Date: Mon, 6 Jul 2026 09:34:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3.1 02/18] pci: Use pci_sbdf_t in pci_add_device()
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <1782753810.8631fc262581453bbf619ec5b2062170.19f1468572a000701b@vates.tech>
 <1783096203.8631fc262581453bbf619ec5b2062170.19f28d0d9fc00080a8@vates.tech>
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
In-Reply-To: <1783096203.8631fc262581453bbf619ec5b2062170.19f28d0d9fc00080a8@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1783323276-FD72125E-C9843896/0/0
X-purgate-type: clean
X-purgate-size: 1771
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: AACAA70D998

On 03.07.2026 18:29, Teddy Astie wrote:
> @@ -729,14 +726,14 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
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

There continue to be unnecessary changes here, like these two. Even if only
to limit churn, such changes imo better wouldn't be making unless they
offered a clear gain.

> @@ -818,14 +815,16 @@ out:
>      pcidevs_unlock();
>      if ( !ret )
>      {
> -        printk(XENLOG_DEBUG "PCI add %s %pp\n", type, &pdev->sbdf);
> +        unsigned int func = sbdf.fn;
> +
> +        printk(XENLOG_DEBUG "PCI add %s %pp\n", type, &sbdf);
>          while ( pdev->phantom_stride )
>          {
>              func += pdev->phantom_stride;
>              if ( PCI_SLOT(func) )
>                  break;
>              printk(XENLOG_DEBUG "PCI phantom %pp\n",
> -                   &PCI_SBDF(seg, bus, slot, func));
> +                   &PCI_SBDF(sbdf.seg, sbdf.bus, sbdf.dev, func));
>          }
>      }
>      return ret;

Is there a reason you retain "func" as a variable? As sbdf isn't used any
further, you could fiddle directly with sbfd.fn. (Then again I realize
some helper variable may be needed anyway, to be able to detect the field
having wrapped.)

Jan

