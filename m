Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC57092A364
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 15:02:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755388.1163734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQnzx-0005Z7-Bp; Mon, 08 Jul 2024 13:01:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755388.1163734; Mon, 08 Jul 2024 13:01:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQnzx-0005WQ-6A; Mon, 08 Jul 2024 13:01:41 +0000
Received: by outflank-mailman (input) for mailman id 755388;
 Mon, 08 Jul 2024 13:01:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=suqh=OI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sQnzw-0005WK-BY
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 13:01:40 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35b56725-3d2a-11ef-8776-851b0ebba9a2;
 Mon, 08 Jul 2024 15:01:37 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ee7a1ad286so40725551fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 06:01:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b0d368d7csm6451088b3a.49.2024.07.08.06.01.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 06:01:34 -0700 (PDT)
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
X-Inumbo-ID: 35b56725-3d2a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720443696; x=1721048496; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uL0hE67Ydn+R0/zDjfEInfi3gxBOrPQfKAs1IdzrTAs=;
        b=Y+ER2Uk4NfypjfHXzaBeHHhoXjcO2igPfox2TgHB5o9CcXVxWx8NbEvtdu9InYslv4
         EmrP90D18RDoSFK5hroQXoMvNNMFj5HVbx46gzM1vetpt603ZCybdN4QHReOP3wUBC7M
         apeotcD4SUdKnyiV3sxkv2MZwZvkKGjFTtuoQ/H+r9Vt64NhQQ0Ra4lHySZzuM0E4b5W
         +fV66IFdH2ntzbvRmfHVuI56lulXUcUwjhSx7NaU9n2lSUZJr9Krozgt08XcVLbrV2ln
         UEbNsimOwt4Mni1li9kQ3TD827wHQj8tlyl48rRDPqCL+VOsGT8mLbGK2zyZ0V9y1083
         82Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720443696; x=1721048496;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uL0hE67Ydn+R0/zDjfEInfi3gxBOrPQfKAs1IdzrTAs=;
        b=epwJgtjI1wopP9hnaaw+kdXZ6BQQGwI9oJd9y95KAV8Otm50YS9cazi8f8Ok89JSIn
         W1K4Dih0I8A9qNPS540AlQ5jX8z7Wm+2yNMilEvVdZXrsrlicU2oymihQylxhYyvQs5m
         fHlAZy9xCBNkhxYEwnUIOUKyn5TAtP9PBFfJ+0zpSYi6ycIgHdeJAlEQe6+gMv4sQvcj
         jCVDpTHSN7PIu5Sq7wyEfdba/RZBNu5micqRiSYqjMJhiWughNDjckf5PPt0HlzdoGva
         Q2UBTfBe6DrkerEMP8mgUKPqQglmQN0Fx6oRuy2/v4AtJl1QbfESaI4U6x/qS+X/wcfi
         k9Zw==
X-Gm-Message-State: AOJu0Yzz8J0jWLDXg5FuUbXJKnSkEYsU5S+ApfruKeOsw2G/+nqS+lRj
	A4+PbNHbqtFxeYlkXZaO8qPcxe8tDJA+gqZYFYA8H/OeM44tHm5zt305EgkbSg==
X-Google-Smtp-Source: AGHT+IE7hdu1y1Z2nN+1CAEMLUlc1BaQ2A2kKmBunJwgknc97iVlJv1V7X5LccVzTu85drP4fvOB9Q==
X-Received: by 2002:a2e:9eca:0:b0:2ec:558d:4e0a with SMTP id 38308e7fff4ca-2ee8ed933bfmr90501341fa.19.1720443694608;
        Mon, 08 Jul 2024 06:01:34 -0700 (PDT)
Message-ID: <ff729e47-2727-4af2-84b9-d23ad976d3f3@suse.com>
Date: Mon, 8 Jul 2024 15:01:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: GNTTABOP_setup_table yields -1 PFNs
To: Taylor R Campbell <riastradh-xen-devel@NetBSD.org>
Cc: xen-devel@lists.xenproject.org
References: <20240708125016.D3FE284E5A@mail.netbsd.org>
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
In-Reply-To: <20240708125016.D3FE284E5A@mail.netbsd.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.07.2024 14:50, Taylor R Campbell wrote:
>> Date: Mon, 8 Jul 2024 11:09:21 +0200
>> From: Jan Beulich <jbeulich@suse.com>
>>
>> On 06.07.2024 04:22, Taylor R Campbell wrote:
>>> On a Xen 4.14 host (with extraversion=.0.88.g1d1d1f53), with version 1
>>> grant tables, where GNTTABOP_query_size initially returns nr_frames=32
>>> max_nr_frames=64, a NetBSD guest repeatedly queries
>>> GNTTABOP_setup_table for successively larger nr_frames from 1 up.
>>
>> First question: Is there some earlier GNTTABOP_setup_table that you invoke?
>> I'd expect (and also observe) nr_frames=1 initially.
> 
> Not that the guest OS invokes.  Perhaps the bootloader, pv-grub 0.97,
> might invoke GNTTABOP_setup_table?  I looked around but couldn't find
> an obvious source for pv-grub 0.97.
> 
>> Second: The version you name is pretty unclear from an upstream perspective.
>> Leaving aside that 4.14 is out of support, it's entirely unclear whether you
>> at least have all bug fixes in place that we have upstream (4.14.6). Without
>> that it's hard to see what you're asking for.
> 
> It looks like it's based on commit:
> 
> commit 1d1d1f5391976456a79daac0dcfe7157da1e54f7
> Author: Roger Pau Monné <roge.rpau@citrix.com>
> Date:   Tue Dec 1 15:34:55 2020 +0100
> 
>     x86/vioapic: fix usage of index in place of GSI in vioapic_write_redirent
> 
> Does that help to narrow it down?

Only in so far as telling us that this looks to be far behind.

>  (I don't know if I can rule out local changes, though.)

Which, however, would be relevant.

Any chance you could try, against the version you presently run, the XTF patch I
sent earlier? Assumes of course you're at least lightly familiar with XTF
(xenbits.xen.org/xtf.git).

Jan

