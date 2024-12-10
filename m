Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B78769EB69F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 17:38:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852899.1266561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL3Ey-0002Ab-QF; Tue, 10 Dec 2024 16:37:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852899.1266561; Tue, 10 Dec 2024 16:37:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL3Ey-000297-M0; Tue, 10 Dec 2024 16:37:40 +0000
Received: by outflank-mailman (input) for mailman id 852899;
 Tue, 10 Dec 2024 16:37:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Xbj=TD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tL3Ew-00028v-PX
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 16:37:38 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 111170af-b715-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 17:37:38 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aa543c4db92so348806366b.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 08:37:38 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa69e874fa3sm172516866b.114.2024.12.10.08.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:37:37 -0800 (PST)
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
X-Inumbo-ID: 111170af-b715-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733848657; x=1734453457; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6+v6qyh0QPV3NY4BNC990GyixrxR4cFnNB0rO8+l/c0=;
        b=sFFJECP34uC3LaRb+J0zL+WEkufcjJyPVD2yfpp/pwJSEqhInEVhyJ6CX5zluOxT3E
         HuBtu+Y5OXvvBTLz4xjVKJ6pY1OBq/DQrlTBfCH79lTr3jeUxjpV8IEDLAwldrHazQfM
         IZzPxdxd0TL58ZwqblTgq/+l8/wN6xGTqRo/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733848657; x=1734453457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+v6qyh0QPV3NY4BNC990GyixrxR4cFnNB0rO8+l/c0=;
        b=lGl27PlwhZ3nZLNAtfMcEpeDT0CV/3e1Wcg/UR62PVSUL6sVopVmd4KGQxi+tPeEGL
         wlqrmc9mugdnHhrFfd45uXeQ8TU2Dh8HCdSLJKYcu9tis63LXLck6xLnoqMZrKIWgDrp
         yVpUvyv8f9FRv2wSLWYdT5sHYfxCoCYDxw2Twmk8VFMOh8VqFbAZrDKHJdTxH2pIPvdb
         GCjI5RNFWOe9EbO6rUSc3r5qm1wSsdjcx8FmTAQT7YezwueyV/75MSqBuEJ2g0FJSZUY
         DL9Mi8GkcOAQjW9omw6F5XUXgqJdL11TP3V1dYchiP4aE8VJ+TqVCgRfR2jJ1LQEohbA
         DRYA==
X-Gm-Message-State: AOJu0YzXcYt89LB4x8YndIGhTs9HuJdPQd+SjA3KJolQHVnnJ6tMhEgd
	tpSM34F93NmDG/5DLiqYPx7Lipu8tZFTfaJrBN6cPUv1BqSQ3R7e0Ty+dQ13KKuuTGlQqgcUMO6
	F
X-Gm-Gg: ASbGncvswVhjln5Yw25AIsdzMXv3RRfTYeu34Ul0Bzhsgxw92/iSMPS14RYjDhVyy+L
	A1woENl0L34RrdlYjreGqSZKFKV0daFXQE91RmtiSLrJ5X01zSifP3ERj2QVfLN8bMStTulVeew
	+wPXONRpQJvpzOqkXhnvk4g5xfHfeP7m0GRrG/Bcsu69kEjoP9tytM8zjg7jevfbHC8Vk/uD1M1
	h1mz9/YSSHnpiKbScK2XYyM/3h3/1HpklHqZp9mhrBT4Gx6u8zIwu1yHAWPnco=
X-Google-Smtp-Source: AGHT+IE4kD/ZaUWrj0I6I2DrNKxxyKDg/Daa9Ojnzwli/zW7wBC4BUz8sdYONdu1Bq+JE6vekqtUvw==
X-Received: by 2002:a17:906:1db2:b0:aa6:8d51:8fdb with SMTP id a640c23a62f3a-aa69cd37751mr519015766b.19.1733848657463;
        Tue, 10 Dec 2024 08:37:37 -0800 (PST)
Date: Tue, 10 Dec 2024 17:37:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/vpci: fix memory type in guest_mem_bar_read()
Message-ID: <Z1huUDOTgJIB8qTE@macbook.local>
References: <20241210162546.403882-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210162546.403882-1-stewart.hildebrand@amd.com>

On Tue, Dec 10, 2024 at 11:25:44AM -0500, Stewart Hildebrand wrote:
> Currently, if bar->type is anything other than VPCI_BAR_MEM32, the
> memory type bits get set to PCI_BASE_ADDRESS_MEM_TYPE_64 in the returned
> value. This leads to the wrong memory type for, e.g. VPCI_BAR_EMPTY.
> Only set PCI_BASE_ADDRESS_MEM_TYPE_64 when the bar type is
> VPCI_BAR_MEM64_LO.

I'm confused, VPCI_BAR_EMPTY shouldn't use guest_mem_bar_read() in the
first place, as its read handler should be vpci_read_val() instead.

Is there something I'm missing from init_header()?

        if ( size == 0 )
        {
            bars[i].type = VPCI_BAR_EMPTY;

            if ( !is_hwdom )
            {
                rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
                                       reg, 4, (void *)0);
                if ( rc )
                    goto fail;
            }

            continue;
        }

AFAICT guest_mem_bar_read() should only handle BAR types that are
either VPCI_BAR_MEM32, VPCI_BAR_MEM64_HI or VPCI_BAR_MEM64_LO, and
that seems to be correctly handled?

Thanks, Roger.

