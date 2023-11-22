Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5CC7F5154
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 21:13:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639143.996110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5tae-0007BK-Os; Wed, 22 Nov 2023 20:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639143.996110; Wed, 22 Nov 2023 20:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5tae-00079B-Lm; Wed, 22 Nov 2023 20:12:52 +0000
Received: by outflank-mailman (input) for mailman id 639143;
 Wed, 22 Nov 2023 20:12:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q+k4=HD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r5tad-000795-3f
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 20:12:51 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81f188ac-8973-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 21:12:49 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3316a4bc37dso73214f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 12:12:49 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a5d61c4000000b00332cb846f21sm245750wrv.27.2023.11.22.12.12.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 12:12:48 -0800 (PST)
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
X-Inumbo-ID: 81f188ac-8973-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tibco.com; s=googleworkspace; t=1700683968; x=1701288768; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kp3/DE0tKgatPjpvnLbIqk+LaKclpl8a78v385uA4CY=;
        b=hGiAMGwgMqKup4Z2xM3TcFGoqH2dxXqnsPVAEIciwTDFUxp6URivCe7aAhrrR9KN8z
         PO7tfIYvU6cd1kf9fdLaXVZCc5ysF2YYp1bS1RSZwYWejJKm/z81XH5+JYNpQ6+OTrFn
         55mtJBpb9K8OwHSruEJdgd+bILhc4fhobfblOy4T/lAmGZb810BiYIlTgFHE7ajz3FOX
         S17PxMb1SaQOmyBscFZO150qoC8rE0OJpqp+FG/RcoetFQUygtd9dGfuHMRxom7mpi6c
         u2bY2TIgAXSjLBRfe2s7KXUCc1QWX9KfcrXFuQVGEevo835GYvSGCt2/8PtqrRlJmRBU
         Wqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700683968; x=1701288768;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kp3/DE0tKgatPjpvnLbIqk+LaKclpl8a78v385uA4CY=;
        b=oE1It8a5TdLB2OlaYuWC7Sec/MLHFoybC49dhQXA/g4J3FwufKFWmdShLTXNZcjbR7
         8RuiXbTLYKz4sIpQ/bFffBKRqCLhX3tNRpJEXn9PQIYPF4syA8rDkda7hSgSYlRASeqG
         Ld0DEvWnYoXMr9vW41w/Tk8N8dwcHwwR/Bh+Qbczgt/aDi/htZv5ScAhGQvGZ8NDd7iQ
         fwO8cA8qbURvY7ZSrH7bYjgMNAKH6KcX2QGf+RwcjtfCjYRkN1GO4Z+/l3dZ/aNBcs/x
         IzI8hWjSqcxsSzjF8Rwe9Smf+daltiTpl2HY6+z+gtQALldImVfqAO/C0bhVo42HMjIa
         Ermw==
X-Gm-Message-State: AOJu0YwHX9kQNusRguiO1m5N6E6MRdOEqtkVL5x2yiDoutGNKmWhDDIS
	CksD6m49knVYoUQkBfaliSjeSw==
X-Google-Smtp-Source: AGHT+IHEVBjTdXFO82U/NBuU0/zxBDJWgvoUgewPRlsVsXd4WizCZX8CK2FYOmifhFmidaQ6mQAy1Q==
X-Received: by 2002:adf:ec4e:0:b0:332:c5bd:1d9e with SMTP id w14-20020adfec4e000000b00332c5bd1d9emr2216525wrn.4.1700683968514;
        Wed, 22 Nov 2023 12:12:48 -0800 (PST)
Message-ID: <3b679c0f-0fd2-4efd-a4ba-6ce6e4d1289b@tibco.com>
Date: Wed, 22 Nov 2023 20:12:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] tools/pygrub: Fix bug in LIMIT_FSIZE env variable
 override
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231106150508.22665-1-alejandro.vallejo@cloud.com>
 <20231106150508.22665-3-alejandro.vallejo@cloud.com>
From: Andrew Cooper <andcooper@tibco.com>
In-Reply-To: <20231106150508.22665-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/11/2023 3:05 pm, Alejandro Vallejo wrote:
> The env variable must be interpreted as an integer. As it is, the override
> logic simply causes an exception.

Fixes: e0342ae5556f ("tools/pygrub: Deprivilege pygrub")

> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  tools/pygrub/src/pygrub | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/pygrub/src/pygrub b/tools/pygrub/src/pygrub
> index 08540ad288..327cf51774 100755
> --- a/tools/pygrub/src/pygrub
> +++ b/tools/pygrub/src/pygrub
> @@ -89,7 +89,7 @@ def downgrade_rlimits():
>      # write permissions are bound.
>      fsize = LIMIT_FSIZE
>      if "PYGRUB_MAX_FILE_SIZE_MB" in os.environ.keys():
> -        fsize = os.environ["PYGRUB_MAX_FILE_SIZE_MB"] << 20
> +        fsize = int(os.environ["PYGRUB_MAX_FILE_SIZE_MB"]) << 20
>  
>      resource.setrlimit(resource.RLIMIT_FSIZE, (fsize, fsize))
>  

This change on its own is correct, so Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com>

However, there's a bug/misfeature which you've copied in patch 3, so
I've inserted a patch 2.5 to try and fix it in a nice order.  It's
probably a little rude to merge the pythonic-fix into this functional fix.

~Andrew

