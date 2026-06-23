Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g7b8HhWaOmplBQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 16:37:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D17746B7F61
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 16:37:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=bGeS5n10;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344343.1603434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc2Eq-0003fP-09; Tue, 23 Jun 2026 14:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344343.1603434; Tue, 23 Jun 2026 14:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc2Ep-0003cc-Tl; Tue, 23 Jun 2026 14:36:31 +0000
Received: by outflank-mailman (input) for mailman id 1344343;
 Tue, 23 Jun 2026 14:36:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wc2Eo-0003cW-41
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 14:36:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wc2En-001TCH-Gt
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 16:36:29 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3a99e7-bab6-0a2a0a5309dd-0a2a450bb626-18
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 16:36:29 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3a99ed-5e53-0a2a450b0019-d155dd35e4a9-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 16:36:29 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-460662fcb4eso3814274f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 07:36:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-466667881b4sm33570697f8f.24.2026.06.23.07.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 07:36:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1782225389; x=1782830189; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oMoavhTonPQREKHRTi3SIWWrfOUCOC7cTaBaNUzUe6s=;
        b=bGeS5n10lnkIVQFiRarjkPOE9wQJ0kfCVdwfnY5DPbZijFQI1Fbn+K/JFFpuku4S1R
         Ww9ZkoCi3ureR+Hq6xfq8erC6p3BQ8z2Hi7IJv1XqydRSZITzcxHff+2BLyqCJrPt3Q9
         rxCAQHa9wYVxO7N0UeIUsdKfhBqz/6vV8IbBGdgxGoqSy2J/wAiTmWg4KhgNa1VnkYcw
         1ltZe20BrCBumpeL8baIrifjNQuSMqN/BqS4DEd+btXRM4Vf6rBCwKhhs/gahC45Hq9P
         85ePuFTmWS7ffnlU5jde+SGpUwaz1+IkSR84lNsYVnSl2WhgYzNJKox9y86GgAoJQ+XT
         HgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782225389; x=1782830189;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMoavhTonPQREKHRTi3SIWWrfOUCOC7cTaBaNUzUe6s=;
        b=KxA60l9S0x7O0p3ye4ulzruNyEBdJeDdIN2n99QzN1jqOvtTEqJ8x1ht2Nxgdh+XBM
         DmmwbjlhqG7bICQR14LIoWnZe0kBeZv3eEP6gBf/ErW6L/RyPhPKrP6FqVtYjwFUGU9u
         lcsUANJaCD2WE2VNougHwYU+IZ8tEJCspMN0i+jCQ75TKNx9Vz6cr5+XogeF/nFWZBHu
         ma7t8pVZW0C1SHvcJO51/qVlNtdbYbZxWrzkfa+XO6KAB+pRzzzI0k3lRxTI78aDU7wE
         8lNtrQQBDoZPwOtyDE7D7zGaObcDoa6bpXNrft92/Ghgq8F33Opq6pNLIlojJmyk+4yC
         tsRQ==
X-Forwarded-Encrypted: i=1; AFNElJ/eCAkz+JFZEBGR318OJvvp6AFDhEE/utrOy6b/d1W0RZKPGgSR1wSZ7kVHoWTeZdcvDnisPp0G8HE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyS3EYSXdfM1A+eWzGp8IzPUlJ4L6z6zRDkwSGs4LBdj4m64/JK
	Vg0/kRncND/0tf3iNgYetpW7+OQHD0Vr16WfcTTbazIV9OvwYEcwbGeKQxqyYu4npw==
X-Gm-Gg: AfdE7cl4Zz3PXY8AB6w0x50JO8dS5ZrKxFm8axcXJR7IPhGHNeAR1f/P3b5e+DH8H8I
	+a5cE8W/fZeE8u5VX5UvWm3HbGCqAxv/E/K51eJRzzzSTjEoL6NfF9Cd7Hu/ZpsI188af4BG8P1
	V9uS+VEmJboOua0IHh4MJAOep8tJMFOdwrjxwHeqzTwjA37NjWAKQWK5p3s16FtQTjvPucZyAi/
	LyNnIdiTMbUp2W44MTK9EluB+LOWvTKJNfBTXyH5bZf3PhjDxgMv+Sr2s3Ql+uky48za70oB1wq
	im0+OhGIx7JyY4I/EnxkUbKbocsLWGDhO9DgQ8xW6wIOB81JaxysFsXQKzaeiyHsSWFb6u5xnz3
	Tx56Hd6KTQIOO3kFQo2c5O/szwghUo1e1/lmhoTYIIGPQEXESlHxDRjlAQ5qtre7U0PbJQVPNYi
	3d3ZYDJoZCEC64/HadloZVzIlXe27XuBoDX4DOU0dwSThvHp9Z28GSvtjR2pKWQSK+VIhxkyZe4
	bIMtysrCV1LAZA=
X-Received: by 2002:a05:600d:6402:20b0:492:1e36:1fe9 with SMTP id 5b1f17b1804b1-49240eb56b9mr231640175e9.37.1782225388888;
        Tue, 23 Jun 2026 07:36:28 -0700 (PDT)
Message-ID: <56f2436c-3088-4196-bf60-f38fe8e3317a@suse.com>
Date: Tue, 23 Jun 2026 16:36:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] x86/kexec: add new struct kimage_segment
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 ross.lagerwall@citrix.com, xen-devel@lists.xenproject.org
References: <20260622151833.3397692-1-kevin.lampis@citrix.com>
 <20260622151833.3397692-4-kevin.lampis@citrix.com>
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
In-Reply-To: <20260622151833.3397692-4-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1782225389-4DBFF00E-4DFD7482/0/0
X-purgate-type: clean
X-purgate-size: 1685
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.lampis@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D17746B7F61

On 22.06.2026 17:18, Kevin Lampis wrote:
> --- a/xen/common/kexec.c
> +++ b/xen/common/kexec.c
> @@ -920,9 +920,10 @@ static int kexec_load_slot(struct kexec_image *kimage)
>  static int kexec_load(XEN_GUEST_HANDLE_PARAM(void) uarg)
>  {
>      xen_kexec_load_t load;
> -    xen_kexec_segment_t *segments;
> +    struct kimage_segment *segments;
>      struct kexec_image *kimage = NULL;
>      int ret;
> +    unsigned int i;

Restrict this variable's scope to ...

> @@ -930,14 +931,22 @@ static int kexec_load(XEN_GUEST_HANDLE_PARAM(void) uarg)
>      if ( load.nr_segments >= KEXEC_SEGMENT_MAX )
>          return -EINVAL;
>  
> -    segments = xmalloc_array(xen_kexec_segment_t, load.nr_segments);
> +    segments = xmalloc_array(struct kimage_segment, load.nr_segments);
>      if ( segments == NULL )
>          return -ENOMEM;
>  
> -    if ( copy_from_guest(segments, load.segments.h, load.nr_segments) )
> +    for ( i = 0; i < load.nr_segments; i++ )

... the sole loop it's used in?

>      {
> -        ret = -EFAULT;
> -        goto error;
> +        xen_kexec_segment_t tmp_seg = {};
> +        if ( copy_from_guest_offset(&tmp_seg, load.segments.h, i, 1) )

Nit: Blank line between declaration(s) and statement(s) please.

I also see no need for the variable to have an initializer.

> --- a/xen/include/xen/kimage.h
> +++ b/xen/include/xen/kimage.h
> @@ -18,12 +18,19 @@
>  
>  typedef paddr_t kimage_entry_t;
>  
> +struct kimage_segment {
> +    XEN_GUEST_HANDLE(const_void) h;
> +    uint64_t buf_size;
> +    uint64_t dest_maddr;
> +    uint64_t dest_size;
> +};

size_t and paddr_t instead of uint64_t?

Jan

