Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B416379C6D9
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 08:22:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599926.935537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfwmM-0002Co-AH; Tue, 12 Sep 2023 06:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599926.935537; Tue, 12 Sep 2023 06:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfwmM-0002AG-6Z; Tue, 12 Sep 2023 06:21:42 +0000
Received: by outflank-mailman (input) for mailman id 599926;
 Tue, 12 Sep 2023 06:21:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lhkB=E4=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qfwmL-0002AA-3D
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 06:21:41 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1369e76-5134-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 08:21:38 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-31c65820134so4830233f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 23:21:38 -0700 (PDT)
Received: from [10.5.2.12] ([15.248.2.224]) by smtp.gmail.com with ESMTPSA id
 e14-20020adfa44e000000b0031c5d74ecd8sm5173965wra.84.2023.09.11.23.21.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 23:21:36 -0700 (PDT)
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
X-Inumbo-ID: a1369e76-5134-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694499697; x=1695104497; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pmc1im2jRUUJY70q+gaCtMdNgClASrd4LE2h9eP6ZpI=;
        b=szdlKhLK78sufsAMbJlsTm6QAOeopr+IHnyyTXHFN1Gog5Jt5FEGPiiLqd2RscuXrB
         ITGmWJ1segE2GQMpx9qHtoNbXaFsPegv2x1jqtWYufGHhFRgk/b+bU7NMronoDGBb7Dd
         nK0tctRtZ6tj7uB5MHDTYGZP9cgR6WWiz6QhgAk4b6TcrqvIZGxbyNBKLGP7VL3M9v9q
         iGBEe0aNZYgGYDQIYcAwfhVf+HQi9AwUTrZMtRovT74MPWMyWC87JlqFBSTV5LY2WJcD
         c2+t1kSnyqJpybxL84ApEvY/wDENiy7J6N0RnlkKDv3ab6wdCV/lCcLxS6li0AMOMU9r
         C9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694499697; x=1695104497;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pmc1im2jRUUJY70q+gaCtMdNgClASrd4LE2h9eP6ZpI=;
        b=Yc2MlviHXwu4Ep6KjTf0svmQueDRq8OHJWbrM5V3E4Fl+gUzq3E73dVdyzRGw7BFyS
         Ba16Iq7ZQV+qi9LSvUxA6vkzMC+OZuLkfpHhc0pb6Q055NCnAIycdcyHlSh62+T+HH9P
         Evam2QaGQkIEg0Y25zIPj2a8l+A42lx0xlrg8Jr9oNlhHS5H3LiRO6bBneumC7KjO1H+
         v891ZJTeCuaudu4IN36X8ZLihINTvLYykmDCLzTEscIVJjn5DbFwGM8W+bJlXV4u7DlE
         gV/+yVzxM+c7CoIQiwrd+gohz8CBqHMRJeNEPkoiILr4kyRUen7HjrGAeO+ZlE11VV98
         1HZg==
X-Gm-Message-State: AOJu0YwdhCcPMpmuVemkn270vJ0EQEAvEAL9DcxkxgMKI0b7x2INZxat
	pWZUs28R4AbFfVJe6dV/Gqs=
X-Google-Smtp-Source: AGHT+IGXC2G3F3EJNOB0gm9/RMy7O7032wa51U6ZuXNZU8RGJ7haiIqqUbaLjzGywTyetiQx7ccQMw==
X-Received: by 2002:adf:e48c:0:b0:319:6e5b:c7d7 with SMTP id i12-20020adfe48c000000b003196e5bc7d7mr9791751wrm.30.1694499697219;
        Mon, 11 Sep 2023 23:21:37 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <22cf127f-9348-d449-cc6c-7f87c4d01de4@xen.org>
Date: Tue, 12 Sep 2023 08:21:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Reply-To: paul@xen.org
Subject: Re: [XEN PATCH v5 3/4] x86/viridian: address violations of MISRA
 C:2012 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Gianluca Luparini <gianluca.luparini@bugseng.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1693219887.git.simone.ballarin@bugseng.com>
 <4581fc2e3292f761336639a1881e05775e681874.1693219887.git.simone.ballarin@bugseng.com>
Organization: Xen Project
In-Reply-To: <4581fc2e3292f761336639a1881e05775e681874.1693219887.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/08/2023 12:03, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type and also to other
> literals used in the same contexts or near violations, when their positive
> nature is immediately clear. The latter changes are done for the sake of
> uniformity.
> 
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> Changes in v4:
> - change commit headline
> - add Reviewed-by
> 
> Changes in v3:
> - create this commit for 'viridian.c' and 'hyperv-tlfs.h'
> ---
>   xen/arch/x86/hvm/viridian/viridian.c         |  2 +-
>   xen/arch/x86/include/asm/guest/hyperv-tlfs.h | 28 ++++++++++----------
>   2 files changed, 15 insertions(+), 15 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


