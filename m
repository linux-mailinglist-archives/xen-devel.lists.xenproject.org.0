Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3BE7E9DD6
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 14:52:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631604.985112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2XM9-0004Qe-2e; Mon, 13 Nov 2023 13:52:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631604.985112; Mon, 13 Nov 2023 13:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2XM8-0004Nx-Vi; Mon, 13 Nov 2023 13:52:00 +0000
Received: by outflank-mailman (input) for mailman id 631604;
 Mon, 13 Nov 2023 13:51:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0l9s=G2=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1r2XM7-0004LQ-8u
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 13:51:59 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d03689fb-822b-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 14:51:58 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-507bd19eac8so5911915e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 05:51:58 -0800 (PST)
Received: from [10.17.77.191] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a056402074b00b0053da3a9847csm3736181edy.42.2023.11.13.05.51.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 05:51:57 -0800 (PST)
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
X-Inumbo-ID: d03689fb-822b-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699883518; x=1700488318; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2JwnpTav/UWDGi+9Qj0ID7d5E6A/wZkBtycg+sKmIRk=;
        b=bulsC19TfQf/TGhIL1VYETKK6+X2IHNgAkdEYPvdIpP0DJ8eROpZPaW3OTG+aycuXE
         Eu3B60mzYt/4xYrQ8SVeIuUgSGN462ryNjkMtMlMEryZTFVJtmV+7Bd1KEY5TYI7jDAb
         eaIODum8H9SN4TyuNGeQU5AKeMYHAR8IZGXQMcwCpZ7dAzxw/6Ozv7sJzUeftBcBBrX3
         6GII7aQzngVbFmZqAIbd2rZvdPxU4jdaCOspbfu98clo6npBQfZEQzRWB1lUhXBc6DX5
         WemP8WgGUSPGaHcP9PR0htTBTr+UqUk+rfmSsAb4X24vyj8hsJcXwZc6YesToPQ/U3qV
         I22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699883518; x=1700488318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2JwnpTav/UWDGi+9Qj0ID7d5E6A/wZkBtycg+sKmIRk=;
        b=LAmpwHN4uUSrGNu7X31ndlNXCeVgzgL8WTOg5IyYoSUW71q+uf5geVQyLQrL2bGz/Q
         nrZ8j/u1gHemD/WFawaJcRI2bC7+jfvcvVfBW5VmkcrxBnMC2Nb8QjnRBU/GrXUfJFtD
         HKZKrQVQOA4R7S0/tQ2jprWX/45Xbn7cpvIChmhmsrM4oseCeF2x4ciyo5w+I9cZzsSE
         RAqHt1HTQit6EBvL6YdL4RvCsmeR42FNq3VF6GME2f8WNhcl8+nABRzAz22yzkMmsmpD
         5yKLjqrBtzjS3lzzSYVwyfvDEnVBGG1WUZDsNKoCwFXtQ578ObfqKuv6fy1j7QYQH3KI
         9O4A==
X-Gm-Message-State: AOJu0YzfysstHIdMy4OlWZ3Y3xFN6XC9eRwmz7+h3ONwXVjiUhJDMilZ
	yia1SIPVmqBlpug5XvyQtvE=
X-Google-Smtp-Source: AGHT+IFv0uWlgXZcytYlL2U+zbig+zZeYsk4Fm4X4XPq4fCBTaoCxu4F+vbhvbrNq2lIm2g0JeXb1g==
X-Received: by 2002:a19:6d03:0:b0:509:43cc:18b with SMTP id i3-20020a196d03000000b0050943cc018bmr4409477lfc.30.1699883517610;
        Mon, 13 Nov 2023 05:51:57 -0800 (PST)
Message-ID: <f1480f64-86ae-4f7a-909e-7afe3275cddb@gmail.com>
Date: Mon, 13 Nov 2023 15:51:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] xen/events: fix delayed eoi list handling
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
References: <20231016062831.20630-1-jgross@suse.com>
 <20231016062831.20630-2-jgross@suse.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <20231016062831.20630-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16.10.23 09:28, Juergen Gross wrote:


Hello Juergen

> When delaying eoi handling of events, the related elements are queued
> into the percpu lateeoi list. In case the list isn't empty, the
> elements should be sorted by the time when eoi handling is to happen.
> 
> Unfortunately a new element will never be queued at the start of the
> list, even if it has a handling time lower than all other list
> elements.
> 
> Fix that by handling that case the same way as for an empty list.
> 
> Fixes: e99502f76271 ("xen/events: defer eoi in case of excessive number of events")
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>


Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

> ---
>   drivers/xen/events/events_base.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
> index 1b2136fe0fa5..0e458b1c0c8c 100644
> --- a/drivers/xen/events/events_base.c
> +++ b/drivers/xen/events/events_base.c
> @@ -601,7 +601,9 @@ static void lateeoi_list_add(struct irq_info *info)
>   
>   	spin_lock_irqsave(&eoi->eoi_list_lock, flags);
>   
> -	if (list_empty(&eoi->eoi_list)) {
> +	elem = list_first_entry_or_null(&eoi->eoi_list, struct irq_info,
> +					eoi_list);
> +	if (!elem || info->eoi_time < elem->eoi_time) {
>   		list_add(&info->eoi_list, &eoi->eoi_list);
>   		mod_delayed_work_on(info->eoi_cpu, system_wq,
>   				    &eoi->delayed, delay);

