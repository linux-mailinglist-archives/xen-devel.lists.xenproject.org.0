Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGfEAojFCmpC8AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 09:53:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D90A568297
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 09:53:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311618.1581734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOsmp-0005EJ-Rp; Mon, 18 May 2026 07:53:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311618.1581734; Mon, 18 May 2026 07:53:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOsmp-0005BO-Of; Mon, 18 May 2026 07:53:15 +0000
Received: by outflank-mailman (input) for mailman id 1311618;
 Mon, 18 May 2026 07:53:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wOsmo-0005Ak-DH
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 07:53:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOsmn-00HDrG-P4
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 09:53:13 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ac569-2eae-0a2a0a5409dd-0a2a4509c564-0
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 09:53:13 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ac569-2497-0a2a45090019-d1558030b9b4-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 09:53:13 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-48ff4f8ef0dso22018765e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 00:53:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e768acesm37691141f8f.7.2026.05.18.00.53.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 00:53:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1779090793; x=1779695593; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6o4dEWfFLVoVAzK2gWY2XaZYcgIdeeGk9U5DH4jBTMo=;
        b=BkGgIqAjX+6WArZ7Dof2lF3T8OehJMYGyTI9gGDBvIF3HPQ1KT1wCcrKzMjxE4udSG
         5Zes8imPjlBQT6rfK2In1+OJbm60nABXdDjZNt9BZM4IXyHR4D/Wb0z6r6LBCvP+DGlV
         hd4p1Q4iSCUYtUeiUGq7uJ6idVjCioLsjjoRfd6ke/uAp5VU6fMPWSttOatBMq7Dvqfa
         fkLNTfVKpnzTTBoYwIsq4vBvJE9+lE8kd6GwftFDcZ18Ny9MHkhzAlLCt3ZInGt8Ai42
         FoW8X8WUB6iqSlIORUHNQ3R2C2EL/33CZ4ZDij9qZA5HpXaDwiazih1qG14SSuS4+/NM
         1LuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779090793; x=1779695593;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6o4dEWfFLVoVAzK2gWY2XaZYcgIdeeGk9U5DH4jBTMo=;
        b=o2ef4w17PtT+9hYhTce3i+moRuO3ru/jm2ocbEa/4MlPYN/2st0aIrhQdAZYyms3s+
         bzj0px2HWsH356ZQ3TS2LOjnveDL/6SoWKe0sDfou442Yc6+ICYkxl5tugW+Z/nSbD7F
         zg+r3AUV6fWDKrnbZ1+Kk5e81upnxNueXb74Ul8H9cwfrAxdDgzoYPkHtJwHyrDdRjOu
         KAk1N9fcmi92UK4UOL5fVAsu1hvpw5s2I0d249xBmPJbvzxT1s06xtGNkk4HBeLccCNy
         /EQiTsRZ2zRTMq+zSJWi+Xhynf7JdVa5uHu9XbVEiPdf79tUfdah/NgIAdK0/i+b3i74
         4rBw==
X-Forwarded-Encrypted: i=1; AFNElJ+ho2KI1C7HGhgDLbAjTn6yn9/4FOkPfEIkLP4J8Nkb60NxKQa3cZ9FLB2T6FeOlFAAvVgFWSNzvzA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfbPpO7wM7k4+YeatoAI19n0hMmftiN8mYVded2LNAwI2bpWxt
	C1e/Bz9icyRhr9kW+tmK9rd0iQFN/uGzJs27YVCUo749tKwJ/zQu8sfTFJGlrzlXow==
X-Gm-Gg: Acq92OHS32i65ThRkrZJGuQXKVLTYjhLlSlRxrvCiuPaX8pySOqxxiyXLMj2d0mUC+p
	BihYJv/dUo4+eRAYtGggQyXt2q4beV18vLIDlqrEfxdIh/WLSmjZLwpwE61AYKJ95LtOJxf3dE7
	2iJQ+59U0OyVWkCTlkuxenS+a3E//tngYxZKRb1OOYCGbExImy92n0zsNWQBdL/cnAjoNX0tMc4
	VYuhx/I6VaWgqrGvHDsw733KNEQaHfziWhcYuT/C0aQ+83AEE8gwuJarxfOYopsNFMotKzpo7Pu
	YtnK4MfwFh2vAS63gR7TF07RIIyHKFRgdmCpBnw8RUwxqzH8nf8bFqTqOyH0Wxbh1PRbBeqm+/e
	o7yYjGA4e8uCitv4OOJjpyogpeJ4aG+adYmJJvdfNwlme/770FjNS6C+AljQgJb7puJ7Y02yzlt
	+Oz8wGaypVQvkTsKols3JqfID4h9oKW+RmZPQx4Xe/NUH5H/lUAwiJmfFOXoY5EmJV0ZUdVhDl6
	/N1h7GruRzHL4w=
X-Received: by 2002:a05:600c:a406:b0:489:e126:b757 with SMTP id 5b1f17b1804b1-48fe63297b9mr172930825e9.25.1779090793096;
        Mon, 18 May 2026 00:53:13 -0700 (PDT)
Message-ID: <559dc10a-d390-4723-8c52-f649a7acf8e0@suse.com>
Date: Mon, 18 May 2026 09:53:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v6] x86/svm: Support vNMI on capable hardware
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260514175623.1869042-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260514175623.1869042-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1779090793-37D7FA53-26E40D05/0/0
X-purgate-type: clean
X-purgate-size: 1114
X-Rspamd-Queue-Id: 6D90A568297
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,gmail.com,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:abdelkareem.abdelsaamad@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jason.andryuk@amd.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 14.05.2026 19:56, Andrew Cooper wrote:
> --- a/xen/arch/x86/hvm/svm/intr.c
> +++ b/xen/arch/x86/hvm/svm/intr.c
> @@ -33,6 +33,12 @@ static void svm_inject_nmi(struct vcpu *v)
>      u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
>      intinfo_t event;
>  
> +    if ( vmcb->_vintr.fields.vnmi_enable )
> +    {
> +        vmcb->_vintr.fields.vnmi_pending = true;
> +        return;
> +    }

How does all of this work during migration to a vNMI-incapable host? The
hw feature is used ...

> --- a/xen/arch/x86/hvm/svm/vmcb.c
> +++ b/xen/arch/x86/hvm/svm/vmcb.c
> @@ -185,6 +185,8 @@ static int construct_vmcb(struct vcpu *v)
>      if ( default_xen_spec_ctrl == SPEC_CTRL_STIBP )
>          v->arch.msrs->spec_ctrl.raw = SPEC_CTRL_STIBP;
>  
> +    vmcb->_vintr.fields.vnmi_enable = cpu_has_svm_vnmi;

... unconditionally when available (i.e. the feature not being there
won't prevent the migration), yet the vnmi_{pend,block}ing fields are
lost during migration (aiui). Are building on the fact that all of this
state is already getting lost while migrating?

Jan

