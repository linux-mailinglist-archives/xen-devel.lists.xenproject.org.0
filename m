Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGSFBReiwmm3fQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 15:39:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3F030A4E3
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 15:39:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260922.1554086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w52uK-0000jR-Nv; Tue, 24 Mar 2026 14:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260922.1554086; Tue, 24 Mar 2026 14:39:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w52uK-0000hz-L0; Tue, 24 Mar 2026 14:39:00 +0000
Received: by outflank-mailman (input) for mailman id 1260922;
 Tue, 24 Mar 2026 14:38:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w52uJ-0000gd-92
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 14:38:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w52uI-00B2oA-95
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 15:38:58 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c2a1df-bab6-0a2a0a5309dd-0a2a45049dda-44
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 15:38:58 +0100
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c2a201-c823-0a2a45040019-d155dd36d9ff-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 15:38:58 +0100
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-43b7481f9d3so1547728f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 07:38:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b8508285esm4067884f8f.19.2026.03.24.07.38.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 07:38:56 -0700 (PDT)
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
        d=suse.com; s=google; t=1774363137; x=1774967937; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uihOtPHOpbHzHK/IXYCXVIdMXn8PjkIDnqspB+4VMKU=;
        b=Tcp8QpkZp3KviUHSzTm7iFsIV95+qxESka7/aHjxG7sNamyLkzkrl+JoPxn+bTx74+
         88k7a34ow5AnWqLV29qTEoBTMcp+ZqfbC/PBZfYIOVFghJgk7DvshhM/1AbOuIIwaviJ
         2QhH1ymN92nI79viCQuLnDzzGfMZJPVN0iPpyNUgeowtMR2ycve4BEzUcuJDCvW7rxQI
         fQvzQMVuoKluqorpnA4L5udOuTbrOz/1Ger8bOs4qZKucTsDDF3GopPEGvCQP1tVhyhQ
         svzFLwxfbH7xl4/UaRL9MYrJGXeFwusXD5Xspz3vyr0P2lsTpwOH6Cm7uiPSdMflwjGL
         wjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774363137; x=1774967937;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uihOtPHOpbHzHK/IXYCXVIdMXn8PjkIDnqspB+4VMKU=;
        b=SzXzzC5vrTCFE6pMhaIrReYlp0PX4p3FiStdUDDye1/W7WN9huYzx2XwoNwSfI9j/S
         3a1ezmFKkSQeH+CJ42BdhUtBK/QRNdNUCbPT8HNO8aKiU8+8U5euJ2U74mNanWCcaEHu
         9ijp/H+CHVSdnM9kszAUgQ1Ki59TcJPR+K0/DLE6/UXJutVosRLk3SWWdanemb5VlBdi
         /Z3ACucB+6LXquaIaIuk+QI9WUF1M5kdThyUSLNpNRFF5oI/RwKr/9e8TUVEebCgE4Kp
         HkGL2R8cexol7SL+5fZmb29Sji+PKEIa4MRzrOAX/opK9HHjtZUmDtPx9fuZXniGpuOt
         Hlxw==
X-Forwarded-Encrypted: i=1; AJvYcCXIB5ZmZdTGAlN7toBzSqhmfMRdSzYZU2QNiNLKpfwBNdWOfsMvrUZNux1w4letctLqAzeL1QB6yVw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQTluitNWgWw4ADgpEtk2SM6/WOXEL995GIbUwgpw3tZUFQhsq
	D+iZaKXtIwyO1isft6ZGBY/qg3ez+JOsmApyLS/0cW6r3kgdmJzYpctEf1qWrWFAnQ==
X-Gm-Gg: ATEYQzz+9vcMuc86p9ebCNx3J2E4BhKFB1pcDT3LkZaHiBEw5Nc1FnT6JEP48jaup/x
	GX9Th3hRWRODKiryUYgmi+/2n31BMTOjokDgdPst8+9rxdGbPfGF55M3dQSYHoO4OZ+U+fVo8FF
	pb23X2drOUu75siOyhmnaoTPvC4T2SCeTG3iuXrblrpJENNrhDQLED/EcaInB1Y6Aj7CxSb2A7d
	z/58HBh0yIvb37gk4n+I3r88JTMKJCXii2pi/kWsGZ6OyKzJx2HaEBJB7ceYpLVwRQx3jXfCkfG
	IaOaR+vnpgm9B9ob9wGJ/XlUDwjGVtjwPhnLKmww3vU//aJpUfuYvVqrflDyPytuGprpyDTNsgs
	aMmEyjDFNzM+kDts6GxhAiLPd54j6kENeVA8f8siDHF1dzxPUF4xknCWADWxwYGS1FAyIQc8OlD
	523HXdv/4+WP0bMXCKg3BEvH3e+RDHZ+EGBdAWIBdo10Xy4bxSv3OskmzaGZfF7wOMcEhG4O49y
	hLmrZ2YhRSH0r0=
X-Received: by 2002:a05:6000:310d:b0:43b:43d3:62ac with SMTP id ffacd0b85a97d-43b6424ab83mr25070902f8f.18.1774363137428;
        Tue, 24 Mar 2026 07:38:57 -0700 (PDT)
Message-ID: <cddb4d30-5248-4ae3-834c-94044c0864c5@suse.com>
Date: Tue, 24 Mar 2026 15:38:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] xen/riscv: init_csr_masks()-related improvements
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773419622.git.oleksii.kurochko@gmail.com>
 <b283d6a8d59d66010f6249161245e4a7f4219589.1773419622.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <b283d6a8d59d66010f6249161245e4a7f4219589.1773419622.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1774363138-118789D1-BC58951B/0/0
X-purgate-type: clean
X-purgate-size: 977
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4C3F030A4E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13.03.2026 17:44, Oleksii Kurochko wrote:
> There is no reason to use _UL() in define-s sitting in C file hence use UL
> prefix instead.

Actually, only after sending the earlier reply, I noticed: s/prefix/suffix/.

> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -42,10 +42,10 @@ struct csr_masks {
>  
>  static struct csr_masks __ro_after_init csr_masks;
>  
> -#define HEDELEG_AVAIL_MASK ULONG_MAX
> -#define HIDELEG_AVAIL_MASK ULONG_MAX
> -#define HENVCFG_AVAIL_MASK _UL(0xE0000003000000FF)
> -#define HSTATEEN0_AVAIL_MASK _UL(0xDE00000000000007)
> +#define HEDELEG_VALID_MASK ULONG_MAX
> +#define HIDELEG_VALID_MASK ULONG_MAX
> +#define HENVCFG_VALID_MASK (0xE0000003000000FFUL)
> +#define HSTATEEN0_VALID_MASK (0xDE00000000000007UL)

With UL in upper case (for Misra), imo hex digits would better be lower case,
to visually better separate number from suffix. Also, not need for parentheses
around literal numbers.

Jan

