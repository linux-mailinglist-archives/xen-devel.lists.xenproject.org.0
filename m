Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F930979C5C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 10:00:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799292.1209238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq6eS-0003kA-IG; Mon, 16 Sep 2024 08:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799292.1209238; Mon, 16 Sep 2024 08:00:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq6eS-0003fz-FE; Mon, 16 Sep 2024 08:00:04 +0000
Received: by outflank-mailman (input) for mailman id 799292;
 Mon, 16 Sep 2024 08:00:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OuWe=QO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sq6eQ-0003Gr-L0
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 08:00:02 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab11344c-7401-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 09:59:58 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f74b6e1810so36008371fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 01:00:00 -0700 (PDT)
Received: from [10.9.6.216] (vpn-konference.ms.mff.cuni.cz. [195.113.20.101])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bb89e1fsm2395943a12.72.2024.09.16.00.59.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2024 00:59:59 -0700 (PDT)
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
X-Inumbo-ID: ab11344c-7401-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726473600; x=1727078400; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qudf2MQ3UZQreuuw4+jXlv16vEaaWx0V0RrDsu0g1yU=;
        b=W+gjQm2SuD5pFwp3AHoEhuWXNc3vNzZg35+vfJDjZysJ8bqgyZykF3Pi/riCq13N7B
         o9iF4VMhanKggSZ+GvR/yWUIyLtkOZPtUye4t+gHqTLe/W2mFzY8wy28TBrcESyxQRX/
         4JSNMQwRh4kq7pkGC5cZ9syAeornMQRdXPxr1lfrYf5MRnH3Vd/yaEqo3CvKdamUJU67
         M4CvYWvg3eICDUP+t+zwfpZQguyWgXKYHJaE9CWKVzIlsXMP7LgHkt96C+cxhleaK588
         kaCipOSq8+VApxpQIMM9bd+N7vc7igoZUYLed+pABk34oQ8x7Nz2MNMIS66rkhdYpo3M
         51ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726473600; x=1727078400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qudf2MQ3UZQreuuw4+jXlv16vEaaWx0V0RrDsu0g1yU=;
        b=diLKb//M0UunFJlTw2+e7Qeux3J3oJlklzR+v/omgT92a0ZAo9TigQtUldPrmjxUdB
         VIOt4Ys7Wvymbjorlt4Gi6Tf8E4c1TznPL+nac5BxwiV1+cvEWZt/HCgCShVIMYw+DGw
         FhnVhcuYoTyVC88abcGuI4EKefiCblJttn8m0kEvBtAd2dCR8AF/fR0PspKplMA72CEt
         wOl1HQ9muwgDPFCclLxnwa74G5Sk5qNGeh/oU0Dqs1ZbCKBe/vyUOIxxyRjOcLBFVYmM
         z0xv5r4QwL9DL2inEvnzT5eE8X2Y2ycv5EuR5LmG2mi0n7PLM3TIfijsT8fmSKHKN1k9
         abWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd0U8JFR5Aui+hW6rMrMzJ3ZDelbYpW+snwaEFwe3lUGs9HPrHk78Vib7GxOGQMEWQml6V+AYrP3U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvGrDi0cCiuYvggiVy4OCV5vurouHGaqavQtA6bSh8EfVz/YYr
	CnjRkuvZ/dK5QzLvTmodT02Tz+JHoQvejqRpZ81yVaEasIMgQrtyv2UHmknAUQ==
X-Google-Smtp-Source: AGHT+IHdIkWMQR3aesRlGasdjYBJwe3tel2LE9D2ZWT2mM68cxw2NsWVmqtGdan6xXJwpw0uQcQ4aA==
X-Received: by 2002:a2e:611:0:b0:2f3:cd4e:b929 with SMTP id 38308e7fff4ca-2f787f1cbe0mr55700981fa.34.1726473599876;
        Mon, 16 Sep 2024 00:59:59 -0700 (PDT)
Message-ID: <d0075562-6a21-4a87-b7f5-854f09c0743a@suse.com>
Date: Mon, 16 Sep 2024 09:59:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/swiotlb: fix allocated size
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
References: <20240916064748.18071-1-jgross@suse.com>
 <20240916064748.18071-3-jgross@suse.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20240916064748.18071-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.09.2024 08:47, Juergen Gross wrote:
> The allocated size in xen_swiotlb_alloc_coherent() and
> xen_swiotlb_free_coherent() is calculated wrong for the case of
> XEN_PAGE_SIZE not matching PAGE_SIZE. Fix that.
> 
> Fixes: 7250f422da04 ("xen-swiotlb: use actually allocated size on check physical continuous")
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -147,7 +147,7 @@ xen_swiotlb_alloc_coherent(struct device *dev, size_t size,
>  	void *ret;
>  
>  	/* Align the allocation to the Xen page size */
> -	size = 1UL << (order + XEN_PAGE_SHIFT);
> +	size = ALIGN(size, XEN_PAGE_SIZE);

The way you're doing it has further positive effects, as the size
is now also no longer needlessly over-aligned. May want mentioning
in the description. Hope of course is that no-one came to rely on
the up-to-next-power-of-2 allocation anywhere (which of course
would be a bug there, yet might end in a perceived regression).

Jan

