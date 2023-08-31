Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F06678F099
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 17:53:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594006.927176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbjyQ-0007Ij-BX; Thu, 31 Aug 2023 15:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594006.927176; Thu, 31 Aug 2023 15:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbjyQ-0007Gf-8e; Thu, 31 Aug 2023 15:52:46 +0000
Received: by outflank-mailman (input) for mailman id 594006;
 Thu, 31 Aug 2023 15:52:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pxdq=EQ=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1qbjyO-0007DD-4l
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 15:52:44 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b3991b1-4816-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 17:52:43 +0200 (CEST)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1bf1935f6c2so6324855ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Aug 2023 08:52:43 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a170902704a00b001b9da8b4eb7sm1413156plt.35.2023.08.31.08.52.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 08:52:38 -0700 (PDT)
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
X-Inumbo-ID: 6b3991b1-4816-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693497160; x=1694101960; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LKD9qFqmFZitD6OLdD4lyfJU5OvuNlWNTHaaowmgB/k=;
        b=h9RQ56kQalW3YRVLTaZkGzJuJj8da0BsTQMtAAe99MovSzLm3LgCJXGGpYLBQTYVKC
         nt52lXwNycgRW7NPqJbZPBk5mLAB077DqC4cueEwFvVGCSn41ATy5FUbexSpQikna7cc
         jSZPsqWRd0uN286DIAZe1CT4BPvIxz0wJ1pOgcn8PFidR87b9in2UYoYvduTi+19GFeX
         pnLQvDwQy9i/+lRZTiZkfgn/vcTa2fn6vwBLAQU5A8l3SDSYAelw7VfOzl4SpaEbd31K
         SNnZIrX1wgBSXFHFGrnm1RZTfTY09FCo3iiqNpCtKMDTaWpwr4mb8G7OjpIYIdGvEg7I
         qnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693497160; x=1694101960;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LKD9qFqmFZitD6OLdD4lyfJU5OvuNlWNTHaaowmgB/k=;
        b=kLTOJZAlMguOseQNnp7JprkMuaLtWyNGzcx4c+WxDBArxRzz0AuOzLspV/PYFT4b7x
         JANAk9ZpGNISae6KigYHmQ1eSQLCjPo+N7FyPRavgTYySbrFH8aBq65vzbYByVAheza4
         lLDj55HhBWdv4XbM7RePcdY6zK79g83q0/Pw0gHNLaCh0d9FA2Kn+vURYz59jpRlThm+
         dJConopey1EQ0DfvBaEXTd7rXmrG+XA/k38Ve5CpzKniptZ0qzprMnvoVR6NbfZZGV/q
         WSqaiyb1bWmhqqqQwolRRbRYcPux60Ed6ITWjSp0Zfg49xRrNFHZKwA9xc6iyjlF2/y+
         RrBA==
X-Gm-Message-State: AOJu0YzK01Pwtnq0i9EvwH/LSFzFaJyNqK65JwiSuFlKmsPsxZ10eGih
	Poal2G4lpFm8vWe5pibK+iD3PA==
X-Google-Smtp-Source: AGHT+IERCFmBzPxmrXgph50c3mHgrBYUSn0DLvtBvq9JrAm6Gygg3BxcyumHn3cIkJw7JhXYSOUQaw==
X-Received: by 2002:a17:902:d4c9:b0:1bc:1e17:6d70 with SMTP id o9-20020a170902d4c900b001bc1e176d70mr135168plg.24.1693497160385;
        Thu, 31 Aug 2023 08:52:40 -0700 (PDT)
Message-ID: <f751ab27-2d6e-19a2-a0bc-ca021a61a8f4@linaro.org>
Date: Thu, 31 Aug 2023 08:52:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 7/7] qobject atomics osdep: Make a few macros more
 hygienic
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eblake@redhat.com,
 vsementsov@yandex-team.ru, jsnow@redhat.com, idryomov@gmail.com, pl@kamp.de,
 sw@weilnetz.de, sstabellini@kernel.org, anthony.perard@citrix.com,
 paul@xen.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 berrange@redhat.com, thuth@redhat.com, philmd@linaro.org,
 stefanha@redhat.com, fam@euphon.net, quintela@redhat.com, peterx@redhat.com,
 leobras@redhat.com, kraxel@redhat.com, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org
References: <20230831132546.3525721-1-armbru@redhat.com>
 <20230831132546.3525721-8-armbru@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230831132546.3525721-8-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/23 06:25, Markus Armbruster wrote:
> +#define PASTE(a, b) a##b

We already have glue() in qemu/compiler.h.

The rest of it looks quite sensible.


r~

