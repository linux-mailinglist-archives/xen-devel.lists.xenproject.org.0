Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9717D93BC
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 11:32:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624311.972780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwJBs-0005Og-6I; Fri, 27 Oct 2023 09:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624311.972780; Fri, 27 Oct 2023 09:31:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwJBs-0005Mx-3T; Fri, 27 Oct 2023 09:31:40 +0000
Received: by outflank-mailman (input) for mailman id 624311;
 Fri, 27 Oct 2023 09:31:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eEfT=GJ=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qwJBq-0005Mr-G6
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 09:31:38 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fa51bb3-74ab-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 11:31:36 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4081ccf69dcso17473365e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Oct 2023 02:31:36 -0700 (PDT)
Received: from [192.168.10.177] (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id
 x11-20020adfffcb000000b003258934a4bcsm1356830wrs.42.2023.10.27.02.31.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 02:31:35 -0700 (PDT)
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
X-Inumbo-ID: 9fa51bb3-74ab-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698399096; x=1699003896; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QTs9kivD/Mfn/UAvscBipfMJBB8Bih4r6SL3tafSaEI=;
        b=ATXhDJPgrSWGseGAj7xU2zZvg5Ywcp/6uPsLZg9m9Szf6IRtnzKobKdz87nr8jzZIg
         oYff3KME7NNiw7zDabDIl2Xxiqxss8/2QYoIDbB/6/WQmsvU31qX1wE5zjea5iy4Ynh/
         jRwAQTubcImie/9aodY6bKcBorI4XLFTPK7pvbo7NqW84YmNSY5pYGXFOGermq6Xmrv5
         yMEYSgiGx0rgfCmDQotP03XSQ6bkprxqbN5vmEj7Lb3lipN+dy7r6k62YqmrGwTycu+g
         lEMh/Y6yIO9BFLVIGVQxGBGh5YC0FU60WChFZCsp79baP2pIVfc+ndrZRbsz0oD2vDY9
         oN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698399096; x=1699003896;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTs9kivD/Mfn/UAvscBipfMJBB8Bih4r6SL3tafSaEI=;
        b=jiBfZ7wYpXvi5Mhv7evjPExyotOsXalpD2wSrYBuSor7XuMFRHk8X0CTvGoyZgVKAO
         n80c26Z+QeeskAqNoOs7sDQHcDS/zKYYWX4XRfG+5j4LlkPWVigr/V3fTYgv3F2Lf0Kr
         l4C5sfVKTsoTxBDMdSrzgpF1DzYxriTujx5rCt5JbOStX3KxpjHUr8ToJNL53pHgbkfU
         FmW5aeOyg+JDa3jrMMo8hHnD8CVSQUBy2dZrURaOY9dcBj3a39JdNySychDWvl91SH/Z
         PbaGgg8F9FtuQZvLUXRl3HVXvvKpPqtSEy71ImgPoj7EWdLIVjKLciqmc5kfpJJQN1Lr
         UnFw==
X-Gm-Message-State: AOJu0Yy6ttzChTU3rtQx0fUOGy4Ae521TeSlUE1hJ336aGOvb9rSTIrq
	SFiOfDztfv1rYae3pnjFTjs=
X-Google-Smtp-Source: AGHT+IFMyYswcfqDBXUjHeiT0+hX+rLzRUjfI/ImjdtPGYKdKySflidFjyugVF6CSqz3WojMmjv6tQ==
X-Received: by 2002:a05:6000:80b:b0:32d:a045:cf71 with SMTP id bt11-20020a056000080b00b0032da045cf71mr3223387wrb.21.1698399095684;
        Fri, 27 Oct 2023 02:31:35 -0700 (PDT)
Message-ID: <7f5487e0-f794-4e58-8aa3-81ca3dc3f3db@gmail.com>
Date: Fri, 27 Oct 2023 10:31:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v3 23/28] net: report list of available models according
 to platform
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Bernhard Beschow <shentey@gmail.com>, Joel Upham <jupham125@gmail.com>
References: <20231025145042.627381-1-dwmw2@infradead.org>
 <20231025145042.627381-24-dwmw2@infradead.org>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20231025145042.627381-24-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/10/2023 15:50, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> By noting the models for which a configuration was requested, we can give
> the user an accurate list of which NIC models were actually available on
> the platform/configuration that was otherwise chosen.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   net/net.c | 94 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 94 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


