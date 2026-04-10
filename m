Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEmYCOzU2GmuiwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 12:46:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF803D5D0A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 12:46:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278717.1563483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB9N3-0006tO-4t; Fri, 10 Apr 2026 10:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278717.1563483; Fri, 10 Apr 2026 10:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB9N2-0006qH-W7; Fri, 10 Apr 2026 10:45:52 +0000
Received: by outflank-mailman (input) for mailman id 1278717;
 Fri, 10 Apr 2026 10:45:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wB9N1-0006px-52
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 10:45:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB9Mx-00FJdM-TE
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 12:45:47 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d8d4c2-bab6-0a2a0a5309dd-0a2a4502cf70-22
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 12:45:47 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d8d4db-42fa-0a2a45020019-d155dd33ec8f-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 12:45:47 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-43d5ec211abso984317f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 03:45:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e50044sm6498773f8f.25.2026.04.10.03.45.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 03:45:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1775817947; x=1776422747; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w5wtCTojcIeiVz86pyQmtALPC285FlCPpb0vrS7WcDI=;
        b=Tm9qDphm+OrGfF+ujS6lKNdUMkeOOUYrfMi65+Q2UtaLZhnbm0+HVE/XEzEnlSCqni
         FRyGWQhMOU/62yQpZg3QMDESg9eEfDyrlxtQFRZ7j91KPBswh6LhzhLN1K/OulorUBBN
         GXlp22wNNSdECLnRg41yccpu0Po/hI6imXu2FiKQkPuNX9y+zTrMYGY/bXe50F8rgJ0u
         shHcivsOimN98HroIxOANlLAYpZqx55PxEqUr1hbH6o7TXxd6SlkYkMgeAWPIEmUPXEB
         fxCjGRcl8kjVbSN32GtdKPOCjdJ4rgwRcEzOALUQQet62zevlYf46Ys0qU1zH7w1RgCB
         /2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775817947; x=1776422747;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5wtCTojcIeiVz86pyQmtALPC285FlCPpb0vrS7WcDI=;
        b=M7IaL6X6X47y3uLpgVkJtrnT6/6A5NrsqCd+A89L7OrgB0zOdsTWqNbmMavb89vCGM
         QbVGuxWbK6FXCJe80QesSAHJQV6sL6onxid2P+oruluATW/0PQvxRwIAEXulRnh5Ajpm
         3u1pnAz0N0s8g8btscp9BB8nS4x/KtzKLeeXYDzYoUMlWi5bUNlR23tAv5XFd0RkSJJ3
         td0ctgluZ8AOAomEizVCajbFYExMSakXtGiYyee+Y7T4Jz2R2TrD4L04oCBrSeDfj2pD
         8gAWCbbjjuVHBbGUKDoRuMep53QRkh7Wy7IMxPywN6IF+AUelGqz6EyNdwfPQRdxGoia
         KxvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAiwl7J+8nIHVw53tKAQdJjeCTAuREjmBSH/jg+WIRN6rrPSo82tktwXnRqcyHIOTwjAoKNsT/MZc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8GMlD8JfRGVVwajLPA9L8OBhNNPsaV9TvMj/GClmPAB+4ovQ1
	G8cs/kKVfPGiUfCGe8gBlO9lHBtnuvll4wX4W8SgdWkLwvagoUxvyxC34GOvjJWAyQ==
X-Gm-Gg: AeBDiet1chraqc/RbynST2V1M9tp5LT35KiYhQvVoVw4S6X04o7GOXDL7H6QQsI9SDt
	2ggmSlJ8/OrnHxXkvoyC00VZu6+QpRAMqj4cIMeudy4BgJB2NSOUsHJMF28wmYeZlSYXAX4o/n5
	SzPO8yfMt8Cc7wnGWTCyOQcysi8jL1fWopaCer4c0sOp7u+B5uD21q1lR5F9rJ7KlDYbuI+4uTw
	Ojr7yHNLUSoOv/uE34sd//o0TLsocsEUQqLAwn2h8bUBJOdPVxPepvFg/XcNsLjGfLAk2mpSfVx
	N4t/R2Zjy3dmnakhcHLuLYq09EDb/7igkhS6gkIpwmDAOQGr9qmRyfN63RiTDp2NFObqg/TORcn
	AHOKFiVoqtWuCYILVKxLN4sOhkrkwQ7Y9cwVnzkgfH5ehk763vaxQYo4HiKPKmWSaO+WAcZ95Vd
	qeaB9E1nb+oJ/oZXG5FZEP1c2Ek0bdzgDQ4zbL3XFToYAuSBqg04FtK/Q1AjSiHxj2vKDMij9vW
	jCZY4tK1KdiuUY=
X-Received: by 2002:adf:f04f:0:b0:43d:6787:9931 with SMTP id ffacd0b85a97d-43d67879b95mr1063789f8f.0.1775817947173;
        Fri, 10 Apr 2026 03:45:47 -0700 (PDT)
Message-ID: <1546f5c9-e270-465d-aa0b-4c4c0ec87c8a@suse.com>
Date: Fri, 10 Apr 2026 12:45:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/its: Decode BASER cacheability field before comparing
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>, xen-devel@lists.xenproject.org
References: <dba15db692025c75f8bd3a2c5dab2654eaa4e896.1775801199.git.mykola_kvach@epam.com>
 <0c68ca5e-51d3-42ee-aa27-301ffafefc5f@suse.com>
 <CAGeoDV_S=hQwKyc1aa-X_NZbB2n+QzxUfXpNDcvFehPi8h3adA@mail.gmail.com>
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
In-Reply-To: <CAGeoDV_S=hQwKyc1aa-X_NZbB2n+QzxUfXpNDcvFehPi8h3adA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1775817947-AFF29CD1-4DEFFA21/0/0
X-purgate-type: clean
X-purgate-size: 1285
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:mykyta_poturai@epam.com,m:xen-devel@lists.xenproject.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5CF803D5D0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.04.2026 09:08, Mykola Kvach wrote:
> On Fri, Apr 10, 2026 at 9:40 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 10.04.2026 08:09, Mykola Kvach wrote:
>>> --- a/xen/arch/arm/gic-v3-its.c
>>> +++ b/xen/arch/arm/gic-v3-its.c
>>> @@ -496,7 +496,8 @@ retry:
>>>          }
>>>          attr = regc & BASER_ATTR_MASK;
>>>      }
>>> -    if ( (regc & GITS_BASER_INNER_CACHEABILITY_MASK) <= GIC_BASER_CACHE_nC )
>>> +    if ( ((regc & GITS_BASER_INNER_CACHEABILITY_MASK) >>
>>> +          GITS_BASER_INNER_CACHEABILITY_SHIFT) <= GIC_BASER_CACHE_nC )
>>
>> Are you aware of MASK_EXTR()? This is one of the cases that we have it for.
>> Really all *_SHIFT constants should be purged, as they can be calculated
>> from their *_MASK counterparts (leveraging MASK_{EXTR,INSR}() to keep the
>> code readable).
> 
> I wasn't aware of this macro, thanks. I will take a look.
> 
>> Further, doesn't gicv3_lpi_set_proptable() have the same issue with
>> GICR_PROPBASER_INNER_CACHEABILITY_MASK?
> 
> Fortunately, GIC_BASER_NonShareable is equal to zero, so the condition
> there is not affected.

I fear I don't follow. In

    if ( (reg & GICR_PROPBASER_INNER_CACHEABILITY_MASK) <= GIC_BASER_CACHE_nC )

where does GIC_BASER_NonShareable come into play?

Jan

