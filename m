Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE55642A7E
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 15:39:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453754.711351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2CcC-0005x5-Sm; Mon, 05 Dec 2022 14:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453754.711351; Mon, 05 Dec 2022 14:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2CcC-0005um-Ox; Mon, 05 Dec 2022 14:38:40 +0000
Received: by outflank-mailman (input) for mailman id 453754;
 Mon, 05 Dec 2022 14:38:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Al6T=4D=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1p2CcB-0005ub-E1
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 14:38:39 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81656b44-74aa-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 15:38:38 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 n9-20020a05600c3b8900b003d0944dba41so5474024wms.4
 for <xen-devel@lists.xenproject.org>; Mon, 05 Dec 2022 06:38:38 -0800 (PST)
Received: from [192.168.6.151] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a5d434c000000b00241bd177f89sm14163461wrr.14.2022.12.05.06.38.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 06:38:37 -0800 (PST)
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
X-Inumbo-ID: 81656b44-74aa-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ta40CWGoCabBWWb+cWxjc/DA/QadHc37Z/Nw+3VKEPo=;
        b=YbJlcoZQn6wCdbgM7zjho+xcIKqWbDhFahrDfQiy074ndPa+/nbyOLgwXV+fVJoROV
         xMgEsBqsKQoLUsPOuqBBFUFSbvGEBrRiLLAEEtqd8wINrSnSSvPN5uInUwCJ+gGsBhwt
         DhTFIC1w1OK9gVwCV0TXTpjKdwl2+cM8NhMitQMUxwEP0OfOf5XTKzyuVgjhF17U8iha
         EVPDxLvYxrVT8N9c8LFLHovkaA9/lz4eocFSnfIk3Y8HK23vM+cGFIsBj9eDRbVb4l5k
         qgv7e+9+YF8l+LTF5UYDKDEma8nmpOONindsoUv2qhUkq4NDnWD/+FrHFmRDYBVBOOdf
         QGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ta40CWGoCabBWWb+cWxjc/DA/QadHc37Z/Nw+3VKEPo=;
        b=NdWrbv/QXq/bndfTiVCjtAaSazZq37wn9ucxSKx9795OCaPsqAG0BzAmGTN/EeqF6L
         7smw5UNDHDonc3BTVjxuSWFm1ZauQwfZdsrSvTsJCN7HM6vJlUBoFrDqQGGA6FjecI9q
         hfRQGmHx0nXv3M06KllOlNLaY7ooC6iRjIVUx7Mzfo9E2R66wI7j1Z7IeH+qvOGLFNlH
         in6oTZcnB1rghdcmNBjtFrTP5AdcMWW++nPizQQIxJJ7YsYP2cGZs7mcwou40+HLgDyT
         a26+3Ki88yvRdmMvEiT1bwmPmznv/uLMhU3YLj6UJyDjp2Bb3FO0mN4rZCiPEMNbaIH0
         SaCQ==
X-Gm-Message-State: ANoB5pmcNEd0LFLNEbgZo8KXOVHT8676HYrOQoTZzILGU787tqBK5Taf
	DkBpmDtboNV1oHKdgjsl5Pc=
X-Google-Smtp-Source: AA0mqf72DGuSWzCpUwe9yDc2iLM2n+0etmet0hOZh30STSilHGxDXbYthNWIGCHigIPgM/UOR0Qg1Q==
X-Received: by 2002:a05:600c:3514:b0:3cf:e0ef:1f6c with SMTP id h20-20020a05600c351400b003cfe0ef1f6cmr52359780wmq.75.1670251117813;
        Mon, 05 Dec 2022 06:38:37 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <ef302bc7-5c55-2bb5-d159-27fd6a8ed9df@xen.org>
Date: Mon, 5 Dec 2022 14:38:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH net] xen/netback: don't call kfree_skb() under
 spin_lock_irqsave()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org
Cc: wei.liu@kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, jbeulich@suse.com, jgross@suse.com
References: <20221205141333.3974565-1-yangyingliang@huawei.com>
Organization: Xen Project
In-Reply-To: <20221205141333.3974565-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2022 14:13, Yang Yingliang wrote:
> It is not allowed to call kfree_skb() from hardware interrupt
> context or with interrupts being disabled. So replace kfree_skb()
> with dev_kfree_skb_irq() under spin_lock_irqsave().
> 
> Fixes: be81992f9086 ("xen/netback: don't queue unlimited number of packages")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Paul Durrant <paul@xen.org>

