Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B258551E0
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 19:15:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681136.1059757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raJmj-0000X9-8S; Wed, 14 Feb 2024 18:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681136.1059757; Wed, 14 Feb 2024 18:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raJmj-0000V3-5R; Wed, 14 Feb 2024 18:15:05 +0000
Received: by outflank-mailman (input) for mailman id 681136;
 Wed, 14 Feb 2024 18:15:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Sn1=JX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1raJmh-0000Uu-PP
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 18:15:03 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7d028da-cb64-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 19:15:01 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a3d5e77cfbeso14120366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 10:15:01 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 vs2-20020a170907a58200b00a3d5b5221bbsm587020ejc.141.2024.02.14.10.14.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 10:15:00 -0800 (PST)
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
X-Inumbo-ID: f7d028da-cb64-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707934500; x=1708539300; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KiNv5W7Gl51WblfWE3TFKqwR1YncW99F/nk5SJm2mOI=;
        b=Hg0H++UNCmGYYTZW1Zl5F241dn9OI1Sy/dgsJPG7s9TZP1aKDzPlDcnftu0ErnDvLs
         5+oIO7FF2ON5dNvgkE0Hlq7ybE+rScIhgIDvngQeHXHADJ1dQM9/dSdLN8jIBYjZ0Zde
         V2qZwIl+tbZcdscjPQIztXWxCws2n/0cWoZ7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707934500; x=1708539300;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KiNv5W7Gl51WblfWE3TFKqwR1YncW99F/nk5SJm2mOI=;
        b=sZ5TuHaGx5/dIHi8sK0enhEb+NuT8eDOAUw3Ix279tKhKlm1IRgP0g+rT+8cZc9CDa
         Z1LcWhP7I2/Tnzz1spmplkM641vwyXkftHBDdv/qLEX8ZTk9jv7PtURvK9h5pw1egyuB
         jexh445g2MZfbZE61As3QYok+W/kOuYyjgxKsVrG2y01hJ240MGl6dmaOZtfliOewlum
         2RXIG/6o/TLAunVaPYeqGfeiJr2xMtwZFan+FzjPXcDxxI8Z4oZqcNv1xqWw6w9FUN66
         VZ7onNhf/yUgDpUFXjdNWgS2eZc8pHYKgR+SkTO8D4AoEIOLrO4IqOtnOZC/4BZ+W4Ft
         DkUg==
X-Forwarded-Encrypted: i=1; AJvYcCW7fnJkuDeLdzQ6Hhg42gF7NonPXIUVoiaSYPCp6WswFQpSOKIDSiIYAXKs3gzTj27dKPiFGYp7MKJsM0kU/ufqlNjcQodyUaITqSecU50=
X-Gm-Message-State: AOJu0YyaLoJ0WW7188YXfjTExp7BvPeuAk1Q9Urpsrok2ms4rdtZFHg2
	URdvGXPRGPRETxvStSBqUx376seprbaQk2anzlBPQAVPP+dpteEUVEvNsGY2MRo=
X-Google-Smtp-Source: AGHT+IGQr9AYSCNGpfF0jsRcXPNupd0f8qz3oUzdVSQu/jaNPrwaZx5MpUKINwnu4QoVOo1r6SHYZw==
X-Received: by 2002:a17:906:ce2b:b0:a38:5b3c:7c9b with SMTP id sd11-20020a170906ce2b00b00a385b3c7c9bmr2622254ejb.18.1707934500614;
        Wed, 14 Feb 2024 10:15:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX1Ozpg+kqyWXYNMWuHBvH3WNB66Wci6cgRvadLAb6f4BJueS//7AaV8cH6cIAbQDuoKwaYF9NQzPVD1sEwnDEfVo9YAXTn0KpuL3gEBesy8/US1jK6DRrebH/qxeFnbH6ve5Q7wBtkdduiuMzBlR+4RH90NB4mjk5+ehDsS26ZFbaM7lt88u9uNO/NOyz2B2QsTBZIGgZV+fruIqG5JMMWRQwJ/Z6RowvbS8a1w6vU3+EQwmK/Lwms0bS8qFGnvWV2kdIzfH3kScF/x1xz7AZsvPO5MmZ/zN0ndKBNWGwNAkwS/8KZc2A0MOWai00=
Message-ID: <219340f5-8378-42aa-84cf-bbb0bb0fb486@citrix.com>
Date: Wed, 14 Feb 2024 18:14:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/altp2m: p2m_altp2m_get_or_propagate() should honor
 ap2m->default_access
Content-Language: en-GB
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <1b854c6b38787675294c58eea25556ce241b2b4f.1707213023.git.w1benny@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1b854c6b38787675294c58eea25556ce241b2b4f.1707213023.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/02/2024 10:08 am, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
>
> This patch addresses a behavior discrepancy in the handling of altp2m views,
> where upon the creation and subsequent EPT violation, the page access
> permissions were incorrectly inherited from the hostp2m instead of respecting
> the altp2m default_access.
>
> Previously, when a new altp2m view was established with restrictive
> default_access permissions and activated via xc_altp2m_switch_to_view(),
> it failed to trigger an event on the first access violation.  This behavior
> diverged from the intended mechanism, where the altp2m's default_access
> should dictate the initial permissions, ensuring proper event triggering on
> access violations.
>
> The correction involves modifying the handling mechanism to respect the
> altp2m view's default_access upon its activation, eliminating the need for
> setting memory access permissions for the entire altp2m range (e.g. within
> xen-access.c).  This change not only aligns the behavior with the expected
> access control logic but also results in a significant performance improvement
> by reducing the overhead associated with setting memory access permissions
> across the altp2m range.
>
> Signed-off-by: Petr Beneš <w1benny@gmail.com>

It appears that all discussion has completed.

So unless anyone screams, I'm going to commit this with Tamas' ack as
he's the major user of this functionality.

~Andrew

