Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDnhNrJW1mn5DwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 15:22:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 503C53BCC8B
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 15:22:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276134.1561719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wASrd-0003C8-Rh; Wed, 08 Apr 2026 13:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276134.1561719; Wed, 08 Apr 2026 13:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wASrd-00039Z-Oz; Wed, 08 Apr 2026 13:22:37 +0000
Received: by outflank-mailman (input) for mailman id 1276134;
 Wed, 08 Apr 2026 13:22:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wASrb-00039T-TU
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 13:22:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wASrb-008oiI-9H
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 15:22:35 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d65691-5cb7-0a2a0a5109dd-0a2a4503c97a-34
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 15:22:35 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d6569a-02b3-0a2a45030019-d155802de980-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 15:22:35 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-488a29e6110so44140895e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 06:22:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488c5dc1b15sm18068805e9.28.2026.04.08.06.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 06:22:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1775654554; x=1776259354; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=03HJzs5JH+YVgFOmrMFJzV/KPs5HvOAEBwhiF1zw+Ks=;
        b=IT5xq/lpTtOvlSfLTu4Q8LmPFzYY2SMZkeAtskUvoSpQUfI7H/VACfC5wFK8jCWD7e
         hAR9SO/Zx3SsmwiJRhjL1Z47xO+m7SrfsbWnAwGkGP/8Jg/25jwqtmSioey9OcQbTwZQ
         WzA1AjkEDbylkcm0XGF4FUnLMdeEjhz+/HWZF4qdvbxgojvr36yYBtjCLpqqSDlc7sWk
         4pbDm6isZ8U6afQmeAa7duX1YEL9R+9pHQBexoYDjxBFPFJB4Oes8e7z/r7GOYHoiDg5
         ZIbfFYTNOCPpgIne1WDbf7VVVcrgpyo6qQeYynfTDr4OqkzlZnmgJpse3jqYxourPIBG
         wUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775654554; x=1776259354;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03HJzs5JH+YVgFOmrMFJzV/KPs5HvOAEBwhiF1zw+Ks=;
        b=Ynofvn2Q+vD5UjEDLGrFjtsdZb3JaxMBYN02B0j8+JbXZpHUTUj+fUBhU6mPeN0xX/
         6iRIcAOdbtnB1lzzd/A5trv73GN/bxTcWjmCAcQqIhLt3i5qaIJ+1a7iZ39FzeF11hsc
         AdzA9Rmb6XhZfV88UKlSO9nU7iPaBrINwTuuigiAi+/YHO7PLkdPpz769M8y5QheIeZR
         ALiHXfz3ZokM/+aezOyd4EIzLPT4ZUdU682EZDg7e3X8R+pDKAh6R5tycOfWJEyrOtA5
         VlsFS8PPiNhdzj8pec6Ju/3SOqwwNK67IGis2dWw29sC4Umm9lsPdTx8OE9YJfepuAbk
         Mhuw==
X-Forwarded-Encrypted: i=1; AJvYcCWUZnXtMEhGDlRig9MgRcmWktt9FdjD/Bwdshs/QLVBRpPHxcXBLt9hHGjh5MktaZW77kgctPN7aTM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyE8XGCz887lp/AMulOxzo/9Tmqpl+Vn1qfBzFjIR+AnsEKeEb1
	DQcyNwWejYEY0oTFIG6k7Yz4uz063euUeDCsmzND6ApX+i2B4VUpPjHaca65HFKPug==
X-Gm-Gg: AeBDievNZhB6YNaI6MkfakOPhSga11TnQF9z7oYmElvmVTMAfB0rqxe5e21WwJxirNR
	7pFhN0sQVIFgSYOGHyWQAJioyQTWt2A9VcIABF9rhf/eNstJtICQ7fYpgBWzY9FXc/J05AR4FVX
	dufFUcZem4pa3Okr377fmZg0I+bOudCeizL9y+XQtgK8hie+CNAkBiM1tNPvDbHWQ0cjvrFaLdF
	h3fG4AYFMWRQvfCb9Fvs8LTFlfZbFQTOM7F1xA72Hbuo2BvnHWGeQMtj20LcPqtkLpdf5ySbVn1
	9tmlQACejxRCuFLBxPao5uVnzeax3qiBAca63imPGqTtk7sXEXNYAr4m/ky+FP8O+W2YvKtzCrE
	2t425v3ZBAqZICbPTwM2DMssRyTE7kuXfMA/aDRL9qS1bebs91Dukk8jcGUa2X2xS5Gz5BCW4Q0
	RNqC0ATRHjJNJ6Q1fzimE5To4Sv5IzCwpArZXtrpD0oaojLqGgs7YiIXsHzmxB4ozGTWWQnBk0m
	/yQ0wqhVYxpCSU=
X-Received: by 2002:a05:600c:138f:b0:47e:e076:c7a5 with SMTP id 5b1f17b1804b1-4889970e3c4mr290296245e9.11.1775654554566;
        Wed, 08 Apr 2026 06:22:34 -0700 (PDT)
Message-ID: <984f15a8-c474-40fd-9a9c-c73ae6d02ae8@suse.com>
Date: Wed, 8 Apr 2026 15:22:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/x86: Check supported features even for PVH dom0
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260408125521.104660-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20260408125521.104660-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1775654555-C9F3DC9A-2B84C115/0/0
X-purgate-type: clean
X-purgate-size: 1129
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:frediano.ziglio@cloud.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid,cloud.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 503C53BCC8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08.04.2026 14:55, Frediano Ziglio wrote:
> The supported features ELF notes was tested only if the dom0 was
> PV. Factor out a function to check ELF notes and reuse it even
> for PVH.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -320,6 +320,20 @@ unsigned long __init dom0_paging_pages(const struct domain *d,
>      return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
>  }
>  
> +int __init initdom_check_parms(
> +    const struct domain *d, const struct elf_dom_parms *parms)
> +{
> +    if ( parms->elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type == XEN_ENT_NONE )
> +        return 0;
> +
> +    if ( is_hardware_domain(d) && !test_bit(XENFEAT_dom0, parms->f_supported) )
> +    {
> +        printk("Kernel does not support Dom0 operation\n");
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}

Merely as a remark - personally I would have made a function like this return a
boolean. Both call sites would imo benefit from that.

Jan

