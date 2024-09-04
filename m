Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D4096B4FA
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 10:40:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789929.1199588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sllXy-0008II-41; Wed, 04 Sep 2024 08:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789929.1199588; Wed, 04 Sep 2024 08:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sllXy-0008F7-19; Wed, 04 Sep 2024 08:39:26 +0000
Received: by outflank-mailman (input) for mailman id 789929;
 Wed, 04 Sep 2024 08:39:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xmFz=QC=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1sllXw-0008F1-Kk
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 08:39:24 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f395924-6a99-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 10:39:22 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53343bf5eddso8205899e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 01:39:22 -0700 (PDT)
Received: from [192.168.25.172] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891d6f9esm780890366b.154.2024.09.04.01.39.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 01:39:20 -0700 (PDT)
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
X-Inumbo-ID: 2f395924-6a99-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725439162; x=1726043962; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tixYp3nhsYq5+GShEjePgnmr4HahST2e1ih7q8qaGjU=;
        b=Dbhb6cIe+S5u7LVfN6UfOhcs2Cz3ADuDaoZrYrcIX2SLzFrs6YFpPGFH5eM/Y9SMp4
         M1wtXYEM+FUc02Vk10bkpBeILfuxHUDVtW7n7I8/Jozp4HTxupiVGDVxJyYpKraoSxkc
         3e4ARJ8fyr7Tj8KA5t5h88tmSbW9HJ0YKv8DtCfFr5FbG9Pk3WiD4phidKFIFCEOb69N
         O+zC9fqK5red879jPMGnl8IVn4dQ42N1zcUzVG4CY3Fx5n4xCuSQfJzJUDvD8KK8lfB3
         Xl3MUebBLMv5t7lNkA6s3kICDi03U8frT+Kaoj/N7WR1nsLrlbZ3xt52DHs2nH75ZuRM
         kYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725439162; x=1726043962;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tixYp3nhsYq5+GShEjePgnmr4HahST2e1ih7q8qaGjU=;
        b=JnQzNE6nHQlQ+H1sZeztS1rSLhIi8cIjXU1trATi9I7PHlZqWwEmNsokIIa8pShK0a
         +OgYggQU8TkHv9hjTICzIVB3YI9qWchQZG2n0P/TuAlWY+CRGZfnZJH08BaT/5eZsQWS
         KibGZqQrjzHNccXHGi8bh7i6E1Cg+yzsuAelZiIYEfb1hFXbknT8Q66ARy3VzHBAJZwe
         OKRLNoMHGtbmjVwinEJnjQsDKN2PDGH3Zu0KQHfxY8eme/TgeyL/7gEMD0xyd9W9BTOP
         l/BqjCoYC0FKFup7T4Jvg3Sb6a0X9c3uGTE8VGK8qUnkNVEpzb+qre2+fk+xQaWhN0pw
         jmvA==
X-Forwarded-Encrypted: i=1; AJvYcCWJO6fkXF5K3UK+4L5w8gAIwweK3cWr0x62gZC9Fm/dCqVvkuEc7iuhzhmdu3SkTLinzDMzCAw1KfQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFWX9RPGJIqatZCsXLf13YMqIzFrHaObC/4w7bGc66ix+OQe5N
	msvX5lHXcXwW2DZ4vdMaaEbEG8o7ByZR4YN896DuBEjKaGz6cxxS
X-Google-Smtp-Source: AGHT+IESIaHQqxRquojdxdrZ1WDr+GmLt0K5QGcaaw9+2n5ZskwgEXd24fluz80fnoMCXlw6ZVcpig==
X-Received: by 2002:a05:6512:1101:b0:530:c239:6fad with SMTP id 2adb3069b0e04-53546a566d0mr11259609e87.0.1725439160915;
        Wed, 04 Sep 2024 01:39:20 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <c3f6df7e-780e-4c00-9d09-95d690166878@xen.org>
Date: Wed, 4 Sep 2024 09:39:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH] blkif: reconcile protocol specification with in-use
 implementations
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Owen Smith <owen.smith@cloud.com>, Mark Syms <mark.syms@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20240903141923.72241-1-roger.pau@citrix.com>
 <99b15fe5-34e0-44e4-a351-d510ae67b5a4@suse.com>
 <ZtgYnAeXSamlGKgC@macbook.local>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <ZtgYnAeXSamlGKgC@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/09/2024 09:21, Roger Pau Monné wrote:
>> In the absence of that I'm afraid it is a little harder to
>> judge whether the proposal here is the best we can do at this point.
> 
> While I don't mind looking at what we can do to better handle 4K
> sector disks, we need IMO to revert to the specification before
> 67e1c050e36b, as that change switched the hardcoded sector based units
> from 512 to 'sector-size', thus breaking the existing ABI.
> 

But that's the crux of the problem. What *is* is the ABI? We apparently 
don't have one that all OS subscribe to.
 From your findings it appears that the only thing that will work 
globally is to define 'sector-size' is strictly 512 and deprecate any 
large sector size support of any kind.

   Paul


