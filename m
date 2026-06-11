Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sWXnKEXFKmqHwgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:25:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB65672B2F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:25:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=UgWM9dl3;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1335667.1597853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgL2-0005I6-HR; Thu, 11 Jun 2026 14:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335667.1597853; Thu, 11 Jun 2026 14:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgL2-0005Bl-E2; Thu, 11 Jun 2026 14:24:56 +0000
Received: by outflank-mailman (input) for mailman id 1335667;
 Thu, 11 Jun 2026 14:24:54 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wXgL0-00059B-Bn
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 14:24:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXgKz-006oCD-OM
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 16:24:53 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2ac527-5cb7-0a2a0a5109dd-0a2a45048a8e-30
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:24:53 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2ac535-1dec-0a2a45040019-d1558036cd3e-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:24:53 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-490aaeabdb4so53721535e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 07:24:53 -0700 (PDT)
Received: from ?IPV6:2003:ca:b70d:3054:345c:e2ed:ca23:72c4?
 (p200300cab70d3054345ce2edca2372c4.dip0.t-ipconnect.de.
 [2003:ca:b70d:3054:345c:e2ed:ca23:72c4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e52a54a1sm50050525e9.3.2026.06.11.07.24.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 07:24:52 -0700 (PDT)
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
        d=suse.com; s=google; t=1781187893; x=1781792693; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Uyqx5RU4X8dwws89SGmJH89G6IgazxjsfZpMpm+xJiI=;
        b=UgWM9dl3qZjvn2R9GTseyXCGa5Or30vbGEr/jro8rUjFAkGdGX/5+wXNWa88/jFYHX
         q+l5RPM+C0Obq8529kWSP9+ycx3PipvTUDr5piWR5sZvAb3H2UiqNHpCR/idy96k/rCC
         1+WQJhid9XZBE9bQ5Aq0x3UQnIWKdHUvmGGz2EMLu3CZyZnFyXl30pNXQX+O3KdXL0+w
         BzZkZsdReVNSw4Aag+4WSQ/fZof6TTeAYJf1/5Mqc3rPkxllPu1SJczmO+weqDrIAPo1
         XqOFyX9ykbJ/VbkhZjeMhSfkDQckKdxtWeuftdl2n5wUmBl9WR76UKmlXG7+yKE5yZBq
         Nr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781187893; x=1781792693;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uyqx5RU4X8dwws89SGmJH89G6IgazxjsfZpMpm+xJiI=;
        b=DkrlQHsF3HbDtMsY+uvcAf/SGfG+FhOt4TklruFopEm5Qq4zlAgQvL3eP3/jhOkQtG
         eDtpZSxFSh06bBRxYa86vGI0HU6xhULBA4ZG5wmSbjzkEfJCXh2mPCjFcWZabVqOxj9m
         y34j0+DbBEpeYs7h6Paf6b+7Xic8cgwYAqANgQ9ej/4x30lb8hGxX34aiXlCol/y1FGW
         8mMwqe1nMh+AxuM2SLTM6CoiI7wD4XDnfj8E2mGMQB8YYKHwt6O1BQsW4trylO9sB6UC
         jnnIC7xn6bfYbgMOu9IVFZ9VJ72mM6doZWU5T+cw8BNcbvnEj5K9zrHJKRZ5FPoc4p86
         1OgQ==
X-Forwarded-Encrypted: i=1; AFNElJ8LG+BgtsB3/wyo0bZcA2XnYIXa8jaNUimqT75lhj4webkSHUMPCcQSaSRrUR1fAGQmj7Ereew9LAM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpOz0uYHH7RCltGZ2lO1D4syoc8jQtSpSRv3unPSBEjK6TZ/DQ
	76JS8iMnugKKuhMskl87vkfwt49qRCKRJPQAU4GcqREfPW9c1MDjEdJ4/7kzEZ48AA==
X-Gm-Gg: Acq92OEcJMcwgpIKDw83bD6zlmrxzFMHDI/lZSuiGrH+nEeThVD4gjGh8PgSL3cRAWb
	DmVU4agtRJFvIU9Yg9MkNZVXKQB8xR21ymdjaJAR179YZ98DTF/qFRaTBVchi+cT+l8eLCB2Fgs
	hdmuByf+f0O6UqZTpKsgknAmBgaVVcY5c9jfa0w54HXFMNh2zzKEZyydkQFiweC1FNmUNMDVAjv
	iyvtYyQwvkjfJMETa8dITWf/vInsJu7QLtSPdw/Arc19Fdo7V8OLcFB+OM3PmAqAUl4NZ6G6NOe
	hEv7wvuwJIHuXCrNlv8VM/XdNFUcGM6N1ybMJyQxiRs74XZpYT4r8NqVTNHN4vvHOp7xR5FudaB
	ik82CrlWWtTlBLPiKDrrOyEtS8guDJ3Z2QDVcs/EdGHNE3u1r0BTYkgKLk5Qbi5k4UrJqbqfKO+
	QlE3QfQjbg54Bq0Iv2tXiei/DgJ5Nr6QeG/iP9e4qfZe42ptMeF4Gmh2W8OOemzeTo/RBT0am2e
	7WD0nXAiv/rAPU9A8s3/57l27XFk8BKQ84QRvTM8GOgky+gE1hjFHL8rxZ4tvrS4KGSSLQ=
X-Received: by 2002:a05:600c:535a:b0:490:e18f:d0db with SMTP id 5b1f17b1804b1-490e563e68bmr30999005e9.26.1781187892961;
        Thu, 11 Jun 2026 07:24:52 -0700 (PDT)
Message-ID: <aa06a820-3543-4fdb-8824-06a0008b8e0a@suse.com>
Date: Thu, 11 Jun 2026 16:24:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] x86/kexec: Implement new EFI load types
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
 Kevin Lampis <klampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20260609154518.779757-1-kevin.lampis@citrix.com>
 <20260609154518.779757-6-kevin.lampis@citrix.com>
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
In-Reply-To: <20260609154518.779757-6-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1781187893-425603FF-8B722098/0/0
X-purgate-type: clean
X-purgate-size: 478
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.lampis@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:gerald.elder-vass@cloud.com,m:klampis@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FB65672B2F

On 09.06.2026 17:45, Kevin Lampis wrote:
> --- a/xen/arch/x86/include/asm/bzimage.h
> +++ b/xen/arch/x86/include/asm/bzimage.h
> @@ -47,4 +47,9 @@ struct __packed bzimage_header {
>          uint32_t        payload_length;
>      };
>  
> +static inline uint64_t kernel_alignment_offset(void)
> +{
> +    return offsetof(struct bzimage_header, kernel_alignment);
> +}

Why the uint64_t return type? If at all, size_t. Yet likely unsigned int
would suffice.

Jan

