Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CZvKJFaHQmrU9AkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 16:55:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9BE6DC557
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 16:55:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="Tc/wmU7P";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1347680.1605513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weDO0-0003y5-0F; Mon, 29 Jun 2026 14:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347680.1605513; Mon, 29 Jun 2026 14:54:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weDNz-0003wg-SV; Mon, 29 Jun 2026 14:54:59 +0000
Received: by outflank-mailman (input) for mailman id 1347680;
 Mon, 29 Jun 2026 14:54:58 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weDNy-0003wa-5k
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 14:54:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weDNw-00EO1D-Sc
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 16:54:56 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a428734-e002-0a2a0a5209dd-0a2a4505b00a-22
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:54:56 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a428740-3cb2-0a2a45050019-d155dd30cce5-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 16:54:56 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-46efdcbe20dso460768f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 07:54:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4734df60acesm13109076f8f.25.2026.06.29.07.54.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 07:54:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1782744896; x=1783349696; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7zsKTcEu6yFRYeWGMX2vzHza/0alv7VMDwuzTsFwXXg=;
        b=Tc/wmU7PizSkKPDOeEAPeSZyH4jZhfHqJ0us6/f1ZyEUhG8CsJrdw4rj7TcOJgVJiF
         PCLkS/LEUa8kGD1uDF8Z2p34LtL/JtAxASr5YbxznOCG1ltD4lLmITzUKhMC5vzCJPMF
         sYJ3w7sFJoguzKTBkb+gfDtWSR0zA9eFqnMN6yowTCXirq7RKMMGqyHawvs16RgFmHZz
         Jlr/NoTB32mNFWvcA6mVHYLQeGuEEPd+Qeto0dvxzKlqNuEydTOkqQcbrPhFvxtpriDb
         wclJbxWgoWY/ZoTxMhQhA7ce1t0+km7a6mUT57GgEV+bx7NRDgxxaao2/ApRKfODmcoN
         pf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744896; x=1783349696;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zsKTcEu6yFRYeWGMX2vzHza/0alv7VMDwuzTsFwXXg=;
        b=VYuJri0J90yPEqj0iElJAlE6OMJM5r4sGrLgDcTd9XuzFpBMCpPbKXOn4u36xbw0mk
         vWaKUmHHMlox1He8YQHH5R2Pv4lh6LlFjL5SGvqtkvGa9k0nSWoxw0DnEQ+AzbY9Qj90
         SAe4hHVrXpWH/R7JAsTJF/DItNFXsx4Gr0+++twTUZHmC/U8ScuYa9lG1BArdcGwJg7r
         ZxLx2uSewnFYqSVNvgtzAeO2pL3idceN/98PLh5B6n3KU7HRL62M1u+WhtunlFdn204J
         V3S9LMIUuy3BM9i7CtvzSLQDdbHVJ0eaAQIYFyZTUaKu1F1HIhBIlCQIDwbjIvOEKfW6
         VAQg==
X-Forwarded-Encrypted: i=1; AHgh+Rpa/ubf5oM0aICLeHAJb97kyc8RDSeY5kmFPe/Q2AYfawFK+uQ7Q7WM/jcGfIajSEq+kUds5n9HwWg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4gff1LUE4ZhjNNxnknF4RTXxC2PcMIgquWkW5O0B/3fJSuBQS
	gN/yKlRyr3kG8KoG6E6yTNn5p56PDIiYuFwzrc9os3WI3o7V3whCJ2GEk0suHZZesg==
X-Gm-Gg: AfdE7cnPxkunr0joVHSXWvnUvfPOVmdMohh4vkDWV3KvYKd9dS+BKfm068s4vGkjqPy
	peSgcgW4I8R1dSafWAS1mpO2p3qnGi9tglPukwI6iEcw/o9Dr2EiJSME3iFH9Ue0WHiSiw2eMSw
	XSND6aoEA/7k3ws4HD3lwtxss2g7boCdEcYxZhGqHMQYv5JfhKoLtFI/RSLeqLhmD/kDlpgd1TY
	RZowfoJ5owhgeCSkeTzkUof3N52rc0UNhjB0S9EJUh1hG24kZnysOXUy+coF8K0DvyIKHd7ebtt
	zcVbUbErsBOmW5dszWxHxmlR//ANArxqJQ65AZpwHMU5cI0Bs1WUqoextCf5sU/WDh/WJjynFZj
	xmRVBUHTF9Z80dMMgY3d8fv59CX/X6PqjeFiR99Jdt9QoA1hqY9Lf5f5X3dc5tJ8dyUCnZcfPi6
	50s7cU73DsmYIHuLek8JJWg+G1fBEM64773epz1jbSEPQxlPYq1EGZjtHtRY3MmQ7COeOoJymzx
	kCF
X-Received: by 2002:a05:6000:46c3:b0:46e:8226:96ba with SMTP id ffacd0b85a97d-46e822697cemr18024129f8f.13.1782744896111;
        Mon, 29 Jun 2026 07:54:56 -0700 (PDT)
Message-ID: <07ea2433-35cf-40e1-a06a-17c90aca3ca3@suse.com>
Date: Mon, 29 Jun 2026 16:54:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/25] xen/riscv: introduce per-vCPU IMSIC state
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <98936eb92e39aae0b56049d6c94cfd468f559397.1782487661.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <98936eb92e39aae0b56049d6c94cfd468f559397.1782487661.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1782744896-16F172B8-868C9401/0/0
X-purgate-type: clean
X-purgate-size: 1006
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED9BE6DC557

On 26.06.2026 17:46, Oleksii Kurochko wrote:
> @@ -312,6 +318,35 @@ static int imsic_parse_node(const struct dt_device_node *node,
>      return 0;
>  }
>  
> +int vcpu_imsic_init(struct vcpu *v)
> +{
> +    struct vimsic_state *imsic_state;
> +
> +    /* Allocate IMSIC context */
> +    imsic_state = xvzalloc(struct vimsic_state);
> +    if ( !imsic_state )
> +        return -ENOMEM;
> +
> +    v->arch.vimsic_state = imsic_state;

May I suggest that you make the pointer globally visible only after ...

> +    /* Setup IMSIC context  */
> +    rwlock_init(&imsic_state->vsfile_lock);
> +
> +    /*
> +     * xvzalloc() already cleared the context, so guest_file_id == 0, i.e. the
> +     * always-available s/w IMSIC VS-file. Only vsfile_pcpu needs an explicit
> +     * initializer as its s/w VS-file value is NR_CPUS rather than 0.
> +     */
> +    imsic_state->vsfile_pcpu = NR_CPUS;

... having set up fields? Then:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

