Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W3p8NRbIHmo6VAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:09:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EDB62DDDA
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:09:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="DSaF27/x";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1324864.1590358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUNwM-0004I4-CH; Tue, 02 Jun 2026 12:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324864.1590358; Tue, 02 Jun 2026 12:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUNwM-0004Fc-9I; Tue, 02 Jun 2026 12:09:50 +0000
Received: by outflank-mailman (input) for mailman id 1324864;
 Tue, 02 Jun 2026 12:09:49 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUNwK-0004FJ-Vc
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 12:09:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUNwK-003BCd-C7
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 14:09:48 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ec7fb-e002-0a2a0a5209dd-0a2a45068d30-46
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:09:48 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ec80c-7371-0a2a45060019-d155802eeda7-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:09:48 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-490ac357c55so19377415e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 05:09:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e0f26csm61751235e9.2.2026.06.02.05.09.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 05:09:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1780402188; x=1781006988; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t42sFkTTl6xYDTmM3Yt4GU9RuQHaqpQ1i4lVN7yxk9w=;
        b=DSaF27/xlqcffKhJa3HpfZ4uMjPKjdndxA3FUvLhCk5i+p0PV2VuVoThfn3pnopu40
         8jZjpYSsVnUED/8sNZJ1cJ4/C/H9P3LQdiqM8gXNbzAnlRco7SJpNfLkgBXjGAJvfZxc
         gk101Zuj+hq73i8nVnbRShcmXaz2PFbt6BUPuTcMVhPuV/xdy65FNuo6ivTGXKLA5apQ
         Ttr5xpfa4p+6viGM4khSk6Z35K8Fg1B1OFziJ0wiLMVR6QJHMCSExmVtAN+hrtqNnfxq
         E8Jle1iFdVVVsQJxpVAmf3otxRIOPCEcOX4cyOMRbIR1K9l/wawoeaWegQ7OJx6QH/Fl
         TDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780402188; x=1781006988;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t42sFkTTl6xYDTmM3Yt4GU9RuQHaqpQ1i4lVN7yxk9w=;
        b=sv8clv3rABT9XaGRs01rMpApLb9xVleWcHaBofIXCPeg8260/OmcWJwb77y7T4Oebh
         QJYQ+M3P7ucLVJmnZN7Zvdo/eVPpiigSZinuT236m/2+xWCjfKVAUggCl1Ni3bUBUX8c
         wNWL+aEUOOq+PKZoMKE0tXpia2cl+Vpv+VZYQIk1PhsseUcVqP8ZiESnKI3mf+n9j2aI
         9RB8J4tJvyW+4mSG5Y0W0c+mgrPkgZEldVFwc5I45kQSwgh23/3Y3RlRf9Uqcb6gJ4cn
         7omlEqhJ7E7rGeRbPZi1R4wEyJw7Sq/mXAlvKvp5CSnIz7+5WxxvGQKMSIMk3PRu9ikp
         6Qqw==
X-Forwarded-Encrypted: i=1; AFNElJ+tcAHbBc7JI5qUvNKUTOhkxt2/2qsAkysdKTR3rtTLCAqLUyUooVoghPrf2PGJW0ZR54xjjQNm5ec=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQC2iRQB6fpn5Mit2BAOug/WJSVV9E8PQO1bD5jT+n6oH09Im+
	wO11ZoI5nqIdn2rylcDaHfiBDUp0RW6qlLNUoMTuc/ytIKH4ictRmYlSk8rmoIGTTA==
X-Gm-Gg: Acq92OFLSCqj1nC7xTfU5WOTr1Gn0UvOOEvZUYTywQD/nDw9k8dy8l65zO2eHCalAY0
	jJkBZT3WnQ/s3RqzWm8fDdpcMospinpE+TTrMRDQAWMSNfn0TovvVhMo+RIGiPdxHVETWkftnAF
	70XV2O0o8HYgZOEfUm/sOg+lnQpbv98iED3tZBfy1u2y1WH4XjD0sb5mhnqCVvCKdchgt7uQapQ
	5MteuCoeLuY4J8TKOKv0/AjxVPpXtTPjxNxLrR8QrzEP4/7QmludmzcvzGfnrIueJ/le9yMnnJr
	y0nLwmvKjdQnESOY1SjbyuH7S32fZSGtpoxkgthrEu+3Vv1Nl9hO1DBFLcwhaOUEfeANOzNvvq6
	AnnVQQ0rHyBKX0XRr/N+wLQ+EggFPKT3Y1SmimaBZzvln1Eo/Drp3CTj2AHM/e9p8YaLim35AFs
	MB5jwjseEV4T8R0IuSLsew8hHffoeeXlIDaXqCEBtzAH/iy596Uxh4LxItSopQm3+fJGQD699+E
	pmQSevWRrr20fkC+yQXdvprkw==
X-Received: by 2002:a05:600c:5915:b0:490:958f:2a5e with SMTP id 5b1f17b1804b1-490b071aa9dmr52992215e9.13.1780402187714;
        Tue, 02 Jun 2026 05:09:47 -0700 (PDT)
Message-ID: <7067092e-ba18-4513-a9b1-83ba084ccbb4@suse.com>
Date: Tue, 2 Jun 2026 14:09:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] Align all sections to 4KB
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
 <20260529153531.1341542-3-frediano.ziglio@cloud.com>
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
In-Reply-To: <20260529153531.1341542-3-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1780402188-84B65D75-BCF7D362/0/0
X-purgate-type: clean
X-purgate-size: 1385
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:frediano.ziglio@cloud.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33EDB62DDDA

On 29.05.2026 17:35, Frediano Ziglio wrote:
> Required by UEFI CA memory mitigation.

Imo this isn't enough for a description: At the very least you want to
point at where that requirement is spelled out. Additionally: How much
of an image growth is this going to be? Considering that elsewhere it
was already said that xen.efi is too large for certain purposes (and
hence e.g. debug info wants stripping there), size increase is a
potential issue.

> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -162,8 +162,8 @@ SECTIONS
>         __note_gnu_build_id_end = .;
>    } PHDR(note) PHDR(text)
>  #elif defined(BUILD_ID_EFI)
> -  /* Workaround bug in binutils < 2.36 */
> -  . = ALIGN(32);
> +  /* align to satisfy UEFI CA memory mitigation */
> +  . = ALIGN(PAGE_SIZE);
>    DECL_SECTION(.buildid) {
>         __note_gnu_build_id_start = .;
>         *(.buildid)
> @@ -330,6 +330,7 @@ SECTIONS
>    __2M_rwdata_end = ALIGN(SECTION_ALIGN);
>  
>  #ifdef EFI
> +  . = ALIGN(PAGE_SIZE);
>    .reloc ALIGN(4) : {
>      __base_relocs_start = .;
>      *(.reloc)
> @@ -355,6 +356,7 @@ SECTIONS
>    VIRT_START &= 0;
>    ALT_START &= 0;
>  
> +  . = ALIGN(PAGE_SIZE);
>    .sbat (NOLOAD) : { *(.sbat) }
>  #elif defined(XEN_BUILD_EFI)
>    /*

You say "all sections" in the title, yet this is not covering e.g. debug
info.

Jan

