Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKerI6xJ5mnSuAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 17:43:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E215242E816
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 17:43:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286273.1567378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEqmR-0000TH-SW; Mon, 20 Apr 2026 15:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286273.1567378; Mon, 20 Apr 2026 15:43:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEqmR-0000Qw-OM; Mon, 20 Apr 2026 15:43:23 +0000
Received: by outflank-mailman (input) for mailman id 1286273;
 Mon, 20 Apr 2026 15:43:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wEqmP-0000Q2-VJ
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 15:43:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEqmP-00BTxY-Bq
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 17:43:21 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e64985-bab6-0a2a0a5309dd-0a2a450191e4-24
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:43:21 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e64999-c1f2-0a2a45010019-d155802bb5d9-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:43:21 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-488b150559bso24874805e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 08:43:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a52583fe7sm29335045e9.13.2026.04.20.08.43.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 08:43:20 -0700 (PDT)
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
        d=suse.com; s=google; t=1776699801; x=1777304601; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yengZ7hhRPyDJ8cmzPowC1Z+H6tZSiWNJjKoi8LZG1I=;
        b=XTrdSlPs8JFcwiokCyT7zxCQuuaBj3Xg9rIZo84ZAvC4Q/bCQZ3DA2PoiC3IqC5nGa
         5+/tO2fDQDWALte4dY+nXW7aZwmWZW2FgGbLiDxr7FKPB2w/aVZXCFtPmPJUHsLaw52M
         C5SEqHSNOjaOx8f5i/huwmhzH6ucHGZnHr9GbTdtrzxzMw3OCCijFGRg9AIdlqJtCzXU
         Xlu/0z666PZRaDPnvghdJ5vwaCP5Wj4BOnp0yP1KroKC8lgAeliCm5OJk7TDop+uObaj
         nBuIhWzzI9StlzhCbu3zskHNCu6jt43ADI3MLXJ+opNmiV/ZnpnUxCbgFmA9AE1pRo2F
         eyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776699801; x=1777304601;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yengZ7hhRPyDJ8cmzPowC1Z+H6tZSiWNJjKoi8LZG1I=;
        b=TDxqczz6nCX3KDiQoIpPAp6SF5SLXN2E1OjNfqjrb2rRrAFYsCeh5pIqZ68K4E+ZUq
         quaEntDs3UXJRRCx9Fk/tcOGqiJQYPA1hCGYiwtOgFTBD+1BkrRJyt1Y9pVdGUXm8rxB
         JMylDyTRCHsqO2KmlFAP31/8Pnar2T9laZ3dTZj18X0/qmBR118ImKhHbFNRlnuugrFG
         u6HXrgvaxn8cukCpCHbCUy/se4N+FguteY/E030eSMxSQcrhJkfjzxK/8ku3pyteW7Zd
         QTOWHPyIwpF24WGYjEPp+YxwZ+G+wfZzUld2+1AUJJIeFC6il4nMLFxu8lGr64S1rOpi
         GuOw==
X-Forwarded-Encrypted: i=1; AFNElJ9kksNjO5QmdxI3P7bHIMAcsMDh0rszn+EY1IhqJ7/PyGyRXZSkPGAjOTf/0R6uoHhk27ninz59dW4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwydrKQ34tZSiVuUHCjbN6E6M9IKJn+1CO+wM4mhQfgK73uSAHd
	o+ryuSAQ9MGB554hgd6tvl3Qv1Yfngwt5Um6tYAsvxnEaVEYuv670zisnc96Q6n5Gg==
X-Gm-Gg: AeBDievFadRT44gPHlrFbFWjKau/+SuyYZq32MOp8JVL76L12UFkS2nhIp+5BmtKUX9
	Agqp1GkHuLd/VoW7eYmHUnvKCMDHKVd9YdPNvpL43azbcS0e0SdbvJlephcncrvMwHkebQSPhun
	LRvNNBJ5LKiawW1VePC7DQwj36iZSh3k0z4o0yyfq7ZRVh6Qzn585GWrZZ0Jbaxcg0P4DyZ3QTe
	B1l6TndqbYaT4yiTwLSV4NMzrEECxG9RUAGQDIhC3htbRDLL1JXZh2BcuyGn2ka0qlO04Hd9WUp
	iyle6nplRzKd5VHEt84XAxHQbn2MXrlaENIXmWlF6NcHYN21cnIG4YXs/5HNagY4S515tTQODYB
	gdEODHQAUeoLTnAWr+YR9E9+LgF/EGAUmr8uWeXkPeJaCPKykY8zHStfs1eNBpNrtygS0lP/oNE
	ki5Er8/HJbvSI6MgEKgFQ3tjYJHPLvMZzGrWD8qH49cp+CpRsBvXhfsFKEbKy884+kpqYV7bxkD
	n7Ph1Wl9QEzVrZzwp9Aa+Saag==
X-Received: by 2002:a05:600c:348b:b0:489:5022:39a4 with SMTP id 5b1f17b1804b1-4895040c025mr43975565e9.9.1776699800496;
        Mon, 20 Apr 2026 08:43:20 -0700 (PDT)
Message-ID: <82c7f0f8-4ea7-449b-ac7c-2a044f83028c@suse.com>
Date: Mon, 20 Apr 2026 17:43:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] xen: fix len type for guest copy functions
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
 <9154aea41a11bc0ba95ad15c217db79d029dd119.1775836193.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <9154aea41a11bc0ba95ad15c217db79d029dd119.1775836193.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1776699801-BC617FF4-BD82409F/10/73395122804
X-purgate-type: spam
X-purgate-size: 2241
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E215242E816
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.04.2026 17:54, Oleksii Kurochko wrote:
> Widen the len argument of copy_to_guest_phys_flush_dcache() and the
> copy_to_guest_phys_cb typedef from unsigned int to unsigned long, as
> the function can be used to copy large blobs such as the initrd which
> may exceed 4GB. Update the internal copy_guest() len argument to
> unsigned long accordingly.
> 
> Change the type for local variable size in copy_guest() to avoid
> compilation error because of type mismatch.
> 
> raw_* wrappers above copy_guest() keep returning unsigned long to
> avoid type narrowing; it is not an issue for raw_*'s len argument
> to remain 'unsigned int' since the assignment to copy_guest()'s wider
> unsigned long parameter is safe and there is no raw_* users who
> are using a value bigger than what can fit into 'unsigned int'.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
With two suggestions: For one, the patch subject prefix may want to be (or
include) "arm:", to draw Arm maintainers' attention. And then ...

> --- a/xen/arch/arm/guestcopy.c
> +++ b/xen/arch/arm/guestcopy.c
> @@ -53,7 +53,7 @@ static struct page_info *translate_get_page(copy_info_t info, uint64_t addr,
>      return page;
>  }
>  
> -static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
> +static unsigned long copy_guest(void *buf, uint64_t addr, unsigned long len,
>                                  copy_info_t info, unsigned int flags)
>  {
>      /* XXX needs to handle faults */
> @@ -65,7 +65,7 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
>      while ( len )
>      {
>          void *p;
> -        unsigned int size = min(len, (unsigned int)PAGE_SIZE - offset);
> +        unsigned long size = min_t(unsigned long, len, PAGE_SIZE - offset);

... I think we'd be better off avoiding min_t() whenever possible, i.e.
when min() can sensibly be used (preferably, unlike originally here, also
without a cast). PAGE_SIZE being of type long, "PAGE_SIZE + 0UL - offset"
would look to be an option. Yet of course Arm maintainers may dislike
that form ...

Jan

