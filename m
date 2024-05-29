Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A25B8D3660
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 14:28:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731860.1137609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCIPP-00053y-9P; Wed, 29 May 2024 12:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731860.1137609; Wed, 29 May 2024 12:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCIPP-00051G-6o; Wed, 29 May 2024 12:27:59 +0000
Received: by outflank-mailman (input) for mailman id 731860;
 Wed, 29 May 2024 12:27:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U3iI=NA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sCIPN-00051A-Lk
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 12:27:57 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0949662-1db6-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 14:27:56 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4211249fdf4so18314445e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 05:27:56 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42100fad7fasm211038455e9.38.2024.05.29.05.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 05:27:55 -0700 (PDT)
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
X-Inumbo-ID: e0949662-1db6-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716985676; x=1717590476; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o0im46VMvTgzf4CgpxLpfyG0tO3nmPdi92aMWun6A3U=;
        b=KUb4RRdHLI2vuXJ+h00fC7xsxwTijWMHRUbaYcHW8oOxrRQ2PANDoDaapU6yCKlmjQ
         g/unyPn5n0RRP96rhczt9iCDaKt09Ooi3Gc3sAxzea7xG1hyqzp/WD6vFHRVrPFkKQR9
         BOhIYMihp4EEjVE5T+fT7iXZj6CKG2YlKVtamhU4tC1Byz6wtR4tulVKa9I4EVRLWJvC
         trEfm9WKD+joD0o0uQ3Ih1cMuB23mn48lojM+u9qRghUTOsiSs4wNzG014auPbAVqeDL
         KlR1yUq5H/8iq2ipjBRg58+nMwy/WCMt+sW7a2sivCwHV8o1f4uo968XznGD8NZXJIzJ
         eQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716985676; x=1717590476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o0im46VMvTgzf4CgpxLpfyG0tO3nmPdi92aMWun6A3U=;
        b=sU+/uOgOk3EZDwkB+PM5aCtxgBqjpPCWMchrLYZ/pcxf0daBh3cXJ5qhElTbi4Aeuw
         lMWN1totWma807BvF77JS6eLRjuUsNcZwfa+aC7QOfoAIlPLprCPtvHib5qKe7ZKiznS
         7bpMMVMC8JfLj1mkIgrxJLxh+HscNohYVeH6KH8IAjy+5ov6KyrK0FoWAXA/qhWabpTB
         BtGk2cecSbbZS+WCg9Cx8mrrjnm1ZbY4HtKkT6spLJNg3u6xB568JnMIW5bPmghkDm8h
         wLl2f6dDrvUqDgN7BVmGfv4Hfbdt5e2tl/hLUzMtpZ8eaNhiY2SRCSWR/4/XJ7a0M3VI
         pWqw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ0zhInG4VHyuCDppKD+RZQ05X0gHDVuIEU2vXElKQWbZqAsyBpc+AoyH6hPFv/UX8oP4wmavDuthCAUa1MvRwosSAGEpoyAhKB8VIJDM=
X-Gm-Message-State: AOJu0Yw4UmmDxzoqYNhuYcZcu9/yMawqqRwStouNHs3OV/4jaAfmZK1o
	39b64K67vWR+b4dSCYlq7KFFdZ1JpncxYxxQxsbHyb2Ok079URn/uhBxeduidvw=
X-Google-Smtp-Source: AGHT+IGh33p4hKsb6CQ/ea4derqiTxXb5sBTzSj5MqjCQx3uSuJyvMs24xDjjXfWO5KMwaEt87X2sA==
X-Received: by 2002:a05:600c:5593:b0:420:2b2e:f6e7 with SMTP id 5b1f17b1804b1-42108a79034mr125180765e9.17.1716985675868;
        Wed, 29 May 2024 05:27:55 -0700 (PDT)
Message-ID: <0c53415d-3394-455a-a6b5-99d3efb92318@suse.com>
Date: Wed, 29 May 2024 14:27:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/xenbus: handle potential dangling pointer issue in
 xen_pcibk_xenbus_probe
To: yskelg@gmail.com, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: skhan@linuxfoundation.org, sj@kernel.org,
 Austin Kim <austindh.kim@gmail.com>, shjy180909@gmail.com,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20240529122232.25360-1-yskelg@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240529122232.25360-1-yskelg@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.05.24 14:22, yskelg@gmail.com wrote:
> From: Yunseong Kim <yskelg@gmail.com>
> 
> If 'xen_pcibk_init_devices()' fails. This ensures that 'pdev->xdev' does
> not point to 'xdev' when 'pdev' is freed.
> 
> Signed-off-by: Yunseong Kim <yskelg@gmail.com>
> ---
>   drivers/xen/xen-pciback/xenbus.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/xen/xen-pciback/xenbus.c b/drivers/xen/xen-pciback/xenbus.c
> index b11e401f1b1e..348d6803b8c0 100644
> --- a/drivers/xen/xen-pciback/xenbus.c
> +++ b/drivers/xen/xen-pciback/xenbus.c
> @@ -54,6 +54,7 @@ static struct xen_pcibk_device *alloc_pdev(struct xenbus_device *xdev)
>   	INIT_WORK(&pdev->op_work, xen_pcibk_do_op);
>   
>   	if (xen_pcibk_init_devices(pdev)) {
> +		pdev->xdev = NULL;
>   		kfree(pdev);
>   		pdev = NULL;
>   	}

NAK.

This doesn't make any sense, as pdev is freed.


Juergen

