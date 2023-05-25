Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C559371110C
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 18:33:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539771.840966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Dtg-0004DT-VV; Thu, 25 May 2023 16:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539771.840966; Thu, 25 May 2023 16:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Dtg-0004BO-Rs; Thu, 25 May 2023 16:33:04 +0000
Received: by outflank-mailman (input) for mailman id 539771;
 Thu, 25 May 2023 16:33:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PUrY=BO=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1q2Dtf-0004Ax-1B
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 16:33:03 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf578314-fb19-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 18:32:59 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-30ab87a1897so737285f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 May 2023 09:32:59 -0700 (PDT)
Received: from [10.95.98.145] (54-240-197-226.amazon.com. [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a5d508f000000b002ceacff44c7sm2245602wrt.83.2023.05.25.09.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 May 2023 09:32:57 -0700 (PDT)
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
X-Inumbo-ID: cf578314-fb19-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685032378; x=1687624378;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VGXhwShJtq5AojMIg498oGlzsbOIfhMUdgCHR/Nlq2g=;
        b=KZ8H4xV7Q0YczJWdvBXuGZiLYdvqjjHyRV/1tz+UK8vGo05Veam+EPARyikJrD4iSL
         inJqPW3ci9sGwtiCi9A3i9yyA0nOjKEfqxTNjValKA1qqwa/+y4ERbjguyTYPn3xMDwN
         f4DxNmBdVCQ2I2mp1/iZBQyR8vSrcgTcjC9S/IidGKeNweEjKnSZpebpWrpGdtCVbFRh
         t4OaDQhbG2p1s/HNyeDYtcbxzzn9K+yxIiuYQvIU9W8GRZqV30ZTnM47SUdNGOuEEahX
         m3CW8fB0HBUZrrXjYVDvTDW/IuVRY95tjy4qtFtLmPYv5oR9JaC0mW8eLlo0Rw9+gkut
         ytxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685032378; x=1687624378;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGXhwShJtq5AojMIg498oGlzsbOIfhMUdgCHR/Nlq2g=;
        b=ECe3X06cNUmAyweLfd6vPHRNDCTsLvfMWRdXrWklHs1cIkfq0lYT8h800NzwuH7h92
         zljg6p8+fT0vUK52bnH5gxh0a9QLVf7ZCA+ba9hWWSnRS7/tb3PhnQ1pDLp3ph2pROME
         SY4fecSEwlRdS9m/6Fu6SRK8nUkript8SAAAUyFCdFo45L20oWZxeosIEs88ITql5Q+W
         BvyWltmPQdQdXvrw+QlzNceLxsO9xpJZeSdLHsefm8GZ35hKxT1lyBtxmp/pLXJt1yiV
         kknF17D4dc+iFweHEKRl5zsfXApSgCIrMhnt4+NRRVNPEopvoIhXxB8NgPhUlMT8n4eI
         8Xrg==
X-Gm-Message-State: AC+VfDwkp0uV0zf0P/L8ZohZ0sUeCuf+3awp8aYV4GBCsap6C7r2VUY4
	0eTMIrApviJaa/iUJ1YblHs=
X-Google-Smtp-Source: ACHHUZ6S4mOH9xjAEGvKpNWZjARkRluwpr/syuFuaxhIXRseNcOolvZbC3ZIiCDBpN+uyVMVJ5wm1g==
X-Received: by 2002:a5d:494f:0:b0:309:4988:7f83 with SMTP id r15-20020a5d494f000000b0030949887f83mr2823677wrs.20.1685032378193;
        Thu, 25 May 2023 09:32:58 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <1527f564-1e41-9ea5-4ef1-249988b81c04@xen.org>
Date: Thu, 25 May 2023 17:32:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Reply-To: paul@xen.org
Subject: Re: [PATCH v1] x86/hvm/ioreq: remove empty line after function
 declaration
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230525152527.10281-1-olaf@aepfle.de>
Organization: Xen Project
In-Reply-To: <20230525152527.10281-1-olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/05/2023 16:25, Olaf Hering wrote:
> Introduced in commit 6ddfaabceeec3c31bc97a7208c46f581de55f71d
> ("x86/hvm/ioreq: simplify code and use consistent naming").
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>   xen/arch/x86/hvm/ioreq.c | 1 -
>   1 file changed, 1 deletion(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


