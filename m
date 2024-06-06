Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B605F8FDF42
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2024 09:01:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735924.1142045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF77x-00024p-3v; Thu, 06 Jun 2024 07:01:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735924.1142045; Thu, 06 Jun 2024 07:01:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF77x-00022z-1J; Thu, 06 Jun 2024 07:01:37 +0000
Received: by outflank-mailman (input) for mailman id 735924;
 Thu, 06 Jun 2024 07:01:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tbpc=NI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sF77v-00022t-NW
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2024 07:01:35 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bced227-23d2-11ef-b4bb-af5377834399;
 Thu, 06 Jun 2024 09:01:33 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42155143cb0so8927405e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jun 2024 00:01:33 -0700 (PDT)
Received: from [172.31.7.231] ([62.48.184.126])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42158110dfesm46190115e9.19.2024.06.06.00.01.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 00:01:32 -0700 (PDT)
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
X-Inumbo-ID: 9bced227-23d2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717657293; x=1718262093; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kcHwOpjlqmnRFryITdq4y5cZLPA7is7PXKp9r4JTpW4=;
        b=axkLH3jjNha/nAEXGjweFUQRUjuz0y2zsUtxzPQS/+GtlLGT9/oVQAi5Bs9qRRWlzj
         ChuBUfJG2KgSHxA37Y2fxi7PfrXy3FAUivRXaMfB+D0C53d29LoZqb8JnJz7xWVkNjZd
         7rXf/Qn92kYOeXuG75fmxgWJfMs7sFawqNfZCbRU6oWIplCsne6ajnpEsKvrDnsDo1mO
         LHtuS3P1xU2sVdezB/d7mZoSf44Omey5+JB+uxY7Asyqs07QyS/RbKTk7rg7/mbcUb2v
         wgnS4aAG2haP1PLrzChEnoeviaeZJcSKxRBsLR5uv7UaPtjHZoS6UU96Yo7ej6l3GlDn
         F5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717657293; x=1718262093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kcHwOpjlqmnRFryITdq4y5cZLPA7is7PXKp9r4JTpW4=;
        b=fzBfk7bTCBs6cLJwDE047lxRobl0yQnPa/Sv1HbbRIFFizqheez+R0LRqDTOGaV3l8
         9+c7Dx8gPPrymVCaRETO5zaxjSYYns7GHhWWXcamxEkmUGoCzscdTliEQV4L07GH30vs
         vlXGdxSvXNRuin8HEFfbFmbyQGNhihY6VhA23ydEKESDVG38ex76nDRZ00gYFPXThgbf
         xpOsRFUvawUAOBXEA2whVwrbTkuqM4BZ6j/TIjjyRhs60lbxeN22p5bdAItx8oh32RU+
         MZAZJLALlM9EP991mt2uri1LNleJDvDJgUwsxp1zDHwbW8NVyc+mjk1cfO/IiXT97nxt
         +wlw==
X-Forwarded-Encrypted: i=1; AJvYcCUING0JC7gquF5WJQQOQocHo81S/mSbUPWY9gJWfx1Ee/9hvpr9GutKErcJdPJ9cRvuz71iM8aFIxT2wynv7UyiaQMExD1NepWOV+bIpCg=
X-Gm-Message-State: AOJu0YylyjC8TZeKaSJM9NIWk6PT2FND59kyABRZpjytp8tE9a4YnIJR
	DwikSIEfBB4l6xoxeX7o29MgNZtEcWtCyUBVRUBxjQFl+YX19IYgTJcFMhKwgQP+QznUeTw8Mdi
	cpA==
X-Google-Smtp-Source: AGHT+IFUcmy+QDcGzDE8wqGF2nBatdk2jNpe1Scm26jSMDOfqU6a1yYXXHpwbMJYQJBqWjyo1LVEKw==
X-Received: by 2002:a05:600c:1f90:b0:419:f911:680a with SMTP id 5b1f17b1804b1-421562c33a1mr45341425e9.1.1717657293137;
        Thu, 06 Jun 2024 00:01:33 -0700 (PDT)
Message-ID: <efd0ad53-b052-4e71-aeb6-394367199218@suse.com>
Date: Thu, 6 Jun 2024 09:01:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/cpufreq: clean up stale powernow_cpufreq_init()
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org
References: <20240604084629.2418430-1-Sergiy_Kibrik@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20240604084629.2418430-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.06.2024 10:46, Sergiy Kibrik wrote:
> Remove useless declaration. The routine itself was removed by following
> commit long time ago:
> 
>    222013114 x86: Fix RevF detection in powernow.c
> 
> No functional change.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

This actually addresses a Misra rule 8.6 violation, afaict. Would
be good to mention in the description (happy to add a sentence
when [eventually] committing).

Jan

