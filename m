Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34324A559F1
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 23:40:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904155.1312116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJsS-0003R2-C8; Thu, 06 Mar 2025 22:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904155.1312116; Thu, 06 Mar 2025 22:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJsS-0003Oi-91; Thu, 06 Mar 2025 22:39:40 +0000
Received: by outflank-mailman (input) for mailman id 904155;
 Thu, 06 Mar 2025 22:39:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YZnl=VZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tqJsR-0003Oc-0F
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 22:39:39 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e252b1dc-fadb-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 23:39:37 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43bc48ff815so7975625e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 14:39:37 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd94913fsm31472515e9.37.2025.03.06.14.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 14:39:36 -0800 (PST)
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
X-Inumbo-ID: e252b1dc-fadb-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741300777; x=1741905577; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=URkZIt9aNGkAepz09WJxJ+Xvv5GX00VbOGGfRXjdOFQ=;
        b=CIVD6TziPPellNTiT0U8VP78rOEzhVEape65c08Q/1i55Gtxguta/L3Mx2qcIL7/Ta
         2ad7g1ZR0xNgKdnVbCJT0DL5MqghjDSP4Cnb6N6AFrEiro01n+/lHzUt8I4bzce0EzQ9
         gQZHJdbHIFcnVlh50CBR04EGTNXVtx9BvH074=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741300777; x=1741905577;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URkZIt9aNGkAepz09WJxJ+Xvv5GX00VbOGGfRXjdOFQ=;
        b=T6plhOHq5SZ1arGsuoeSozV0bNHXQiT0Ds3RBosPpCKshGWqtakIWsfPeuoW3DM8Ck
         VrHKo5VROjXLCg1FwPDMrPCmrfa+GFBSu6Mz3ZG0VODsNjxXKwxFASDBBDCVCPJzlVfU
         MDFcWaDv+4sWvN30WzSzxqqAR1Dgt5iEWe08p3Dd0KZNAR7VNEZ2Z5Aj9jCGV0rCoQtw
         hY8QBLhpT75myxSkO376xSS6Ys7yzgxY5Qf/E9Xyw/UwUVDDW9Ne5sTO5BqoI8cyJ0ce
         JPeVC1Pp/qqQ/pLlxaTJ0DzqdEWcDlxvh1IpYmKBjKXDCK8LLTTvk9DMFPM/XBqqPMrq
         E5NA==
X-Forwarded-Encrypted: i=1; AJvYcCUWptx0MXtI8XEPn3RdTAOCeMQzRumQeK06g7/oZ1Mbc4UQHWZ+6jD0RIENw7X3RUW8+qbz/nOydKA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJTKQVtku6xonjrRn74aWg1GSAPNJa07rEiWgwtgB82SkTFGtJ
	xyvlI1awZmA0HVXLczyKb2Shw1DmDkypSRy8hZCjJe28IDz8pA33riXrmf+OyRw=
X-Gm-Gg: ASbGnctvM9On5NHYtO3FrdMrkeEBpNl+GAgSoXVjsNoh8xnJ7k0R0Xfw70G9AeXN66l
	tNe/c6YnsRNHGOWb+AuSITssRgDakmknLwVjdqjopfXZJtS9wWhEWu2zqtpY5u1fdXE0OUN+3On
	LtBG+6ZI++44CYfeYmI6ToZFv+yeBsViEZU94je4RWLkjLImoBgQWbNxVmltPkwvQt9WO7r4Mvt
	7Ke630gCqA0k5ofBSJ9b4LgYDzcT+u+Yq4HZsIL5wciiXgz0i+sdWIs8rMTj6LWig9ZyucJ/Vda
	8hOI8Ly/qAgfq8B/B0GbKbL4tRpxvsGDncSQOkFz55b3iRz8Z/RVuwB4yvcwNLEUc1AkMqg74CG
	ttsW8xFUQ
X-Google-Smtp-Source: AGHT+IE+BdwaO9nPG6A5mHSq3Cuh3FcesrApG8m8kDqRF6n0Y6dBYUDUOmjw4GDsnjqHgNvcFBNjKg==
X-Received: by 2002:a05:600c:474b:b0:439:9434:4f3b with SMTP id 5b1f17b1804b1-43c5a61b6c6mr8311535e9.8.1741300776940;
        Thu, 06 Mar 2025 14:39:36 -0800 (PST)
Message-ID: <eca6c919-043b-4e7b-a04d-639406ca1332@citrix.com>
Date: Thu, 6 Mar 2025 22:39:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/23] xen: introduce hardware domain create flag
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-2-jason.andryuk@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250306220343.203047-2-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/03/2025 10:03 pm, Jason Andryuk wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>
> Add and use a new internal create domain flag to specify the hardware
> domain.  This removes the hardcoding of domid 0 as the hardware domain.
>
> This allows more flexibility with domain creation.
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

I definitely like the removal of the late_hwdom bodges.

However, there are several things to be aware of here.

First, CDF_privileged probably wants renaming to CDF_control, now that
CDF_hardware is being split out.

Second, you've created a case where we can make multiple hardware
domains, yet it is very much a singleton object from Xen's point of view.

This might be ok it's addressed by later in the series.  One especially
nasty bit of late_hwdom was how dom0 started as both, then the
late_hwdom stole dom0's hw-ness.  I expect untangling this is more
complicated than a single patch.

But, by the end, I think we do need to have reasonable confidence that
only a single domain can be constructed as the hardware domain.

> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index 3de5635291..b5e82578c3 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -50,6 +50,8 @@ void arch_get_domain_info(const struct domain *d,
>  #else
>  #define CDF_staticmem            0
>  #endif
> +/* Is this the hardware? */
> +#define CDF_hardware             (1U << 3)

No, this one CDF flag isn't the hardware.  That would be the CPU we're
running on.

~Andrew

