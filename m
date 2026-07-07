Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m2n5HJ0dTWpKvQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 17:39:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8A371D5D9
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 17:39:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="FlTe/RLK";
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356353.1610992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh7sy-0003G3-Uc; Tue, 07 Jul 2026 15:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356353.1610992; Tue, 07 Jul 2026 15:39:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh7sy-0003EO-Rj; Tue, 07 Jul 2026 15:39:00 +0000
Received: by outflank-mailman (input) for mailman id 1356353;
 Tue, 07 Jul 2026 15:38:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wh7sx-0003EI-Bu
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 15:38:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh7sw-00EYbs-Cs
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 17:38:58 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4d1d77-bab6-0a2a0a5309dd-0a2a450585f4-26
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 17:38:58 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4d1d92-3cb2-0a2a45050019-d155802ed540-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 17:38:58 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so28889165e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 08:38:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d6da9sm33905223f8f.12.2026.07.07.08.38.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 08:38:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1783438738; x=1784043538; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MvPm6IOBNFOlxLlVITBmfW48mA61ddb1fFH+9NPYdCY=;
        b=FlTe/RLKulv9TRk8VCudFOeHwciYK9VQ3X7zEJKJlf6hXL5jCTAzmw0T+f1g7w9B1T
         qZqRkXtLhc9MQHP6Tblkd24JHLfDYqcbcYyy0Q+wDeTQkxiXWjEJOuEwbmlOLVmzJ8vf
         vZeCFwYzaYxAiWD1Wdsnzcd43O8IZ+EZEoj+2OYIyn3YrvlBAoWWjvKs/WD/3jKeYOwx
         tcKvSC5QhGfCOxrn5i0upcKkjCj8uhtLvESbFDzMzJDhBM2pmtE4yHemW1fI8N208wM5
         k9RFxiOQZcir/uwsUwfHd4SP6edDEENO+mnXX5dZrHeyiZ1usLKif1n7+kBmKJVb8OcD
         Pn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783438738; x=1784043538;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MvPm6IOBNFOlxLlVITBmfW48mA61ddb1fFH+9NPYdCY=;
        b=mCfsF4rAbmLC5XIEaLKd2dIReMhNHkPhwns36r4i8S5FF1NSvDOA3tfDJOzZAvD8cW
         Tez0wK9HhFT8JmLPzqPSQkALbXwvTy754DOQf43En7g1G1CqN49lNaad/XaWEkZmI5il
         pdR8Z8RcsRyWBU0Pv4o5PifJFGYXCONH+5ZFI+X7jVFF9s5N/6mIsIM7EN2nxYZLZFWb
         jT35RYsRMQVCDvAveZyEXvk0mcIhtn8rGwhfEDAOdW/kGFH+8a6YcMUs3IdzbhYzwIEH
         eB5KkuzYlAvdLCXfHfZWQTi0ZOIMa2KVuJKhiiFzqI56fK9RMCZONdrk27m0+pOuvJkE
         atYA==
X-Forwarded-Encrypted: i=1; AHgh+RrHOOKad270r5fAz6eHtS9biw7uAYd+j4zWdGywIr85UPxgMdIwmn6H8jS7BCekiKzd2QFgsIRvwB4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFtQx5UoUiWnpOK82/aULWtI1st+mADqp2O9W+tdbaRPr68MRY
	0B8adv7i5XdMaPngrvAVX4XbcEeAUwNhCuDqAJvZYXvhRXECttXYAfrhr1VLabqSVA==
X-Gm-Gg: AfdE7ckx1U8/ZVLn2D3gxsxup2ejX0i43TdEUCLM2FMvojHWvF5iZ5TgQ0W39osQRB4
	EFw/dfbSoznl8+NDb2UDYiYEI7dqcBgM2hbyEbM2G/6gR9oTndhLgQ1ycK9hbtPjh4M8igb5OxK
	FIDYef7ypFI9PJjHh2EuO5cCObk++9Gm+0VNHRqc/FVnnk0ua9OppKjJobJF9JPKLJz+SgbTr2M
	pbjtDM1i3nfJzKmAW/cKr5LVzHqhgo7QV9AA18oQwOdW+9uOPdQmlVado3m84h5Ec0G/Y9NSMnD
	8uwbVUM466nppNUqhA0Ang655hdeHq1BJNEXExF0/MkoT8LFFZPbIZkuUth4EsplSxPUe2tnSht
	osluDzs6/FkMu/owVVN5eol67IQGHYJIW++m9v+PUK2m0OjTAiPxKCDj8o2KpDZGMmAvu8FSZZN
	/mFZn84biwp8B+mhvYkMG4wiCSAxko8h2fVpuCObVS8S1LiEhyL78qMiXUmYxB+dDlyyeqCcPPL
	4vg
X-Received: by 2002:a05:600c:4f87:b0:490:be14:bfda with SMTP id 5b1f17b1804b1-493df17fcb9mr56711575e9.6.1783438735820;
        Tue, 07 Jul 2026 08:38:55 -0700 (PDT)
Message-ID: <9a51b988-bb20-478e-91f8-16b17782019f@suse.com>
Date: Tue, 7 Jul 2026 17:38:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/18] ns16550: Parse into pci_sbdf_t directly
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1782747421.git.teddy.astie@vates.tech>
 <1782753820.8631fc262581453bbf619ec5b2062170.19f14687dc3000701b@vates.tech>
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
In-Reply-To: <1782753820.8631fc262581453bbf619ec5b2062170.19f14687dc3000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1783438738-15D0E2B8-CBFF8639/0/0
X-purgate-type: clean
X-purgate-size: 1899
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid,vates.tech:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF8A371D5D9

On 29.06.2026 19:21, Teddy Astie wrote:
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>  xen/drivers/char/ns16550.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index a3d6c46a73..cdc9122ff9 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -1571,22 +1571,22 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
>  #ifdef CONFIG_HAS_PCI
>      if ( *conf == ',' && *++conf != ',' )
>      {
> -        unsigned int b, d, f;
> +        pci_sbdf_t sbdf;
>  
> -        conf = parse_pci(conf, NULL, &b, &d, &f);
> +        conf = parse_pci(conf, &sbdf);
>          if ( !conf )
>              PARSE_ERR_RET("Bad port PCI coordinates");
> -        uart->pci_device = PCI_SBDF(0, b, d, f);
> +        uart->pci_device = sbdf;
>          uart->ps_bdf_enable = true;
>      }
>  
>      if ( *conf == ',' && *++conf != ',' )
>      {
> -        unsigned int b, d, f;
> +        pci_sbdf_t sbdf;
>  
> -        if ( !parse_pci(conf, NULL, &b, &d, &f) )
> +        if ( !parse_pci(conf, &sbdf) )
>              PARSE_ERR_RET("Bad bridge PCI coordinates");
> -        uart->pci_bridge = PCI_SBDF(0, b, d, f);
> +        uart->pci_bridge = sbdf;
>          uart->pb_bdf_enable = true;
>      }
>  #endif
> @@ -1670,22 +1670,22 @@ static bool __init parse_namevalue_pairs(char *str, struct ns16550 *uart)
>  
>          case port_bdf:
>          {
> -            unsigned int b, d, f;
> +            pci_sbdf_t sbdf;
>  
> -            if ( !parse_pci(param_value, NULL, &b, &d, &f) )
> +            if ( !parse_pci(param_value, &sbdf) )

Same as for the earlier change: A functional change of whatever kind wants
justifying. And the doc update wants to come right with it.

Jan

