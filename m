Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A34779E03B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 08:53:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600976.936847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgJjz-00017N-RE; Wed, 13 Sep 2023 06:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600976.936847; Wed, 13 Sep 2023 06:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgJjz-00014w-OT; Wed, 13 Sep 2023 06:52:47 +0000
Received: by outflank-mailman (input) for mailman id 600976;
 Wed, 13 Sep 2023 06:52:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1hMa=E5=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qgJjy-00014q-PX
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 06:52:46 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24b992cd-5202-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 08:52:45 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-99c136ee106so802851666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Sep 2023 23:52:45 -0700 (PDT)
Received: from [192.168.4.254] (54-240-197-231.amazon.com. [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a170906941800b0098921e1b064sm7858241ejx.181.2023.09.12.23.52.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 23:52:44 -0700 (PDT)
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
X-Inumbo-ID: 24b992cd-5202-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694587965; x=1695192765; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YZ/yGI98Y177/By6+Sf86XceM2vTbQeJk7ABiqq79fg=;
        b=Anjy3AV32Bv1WiiRySwsDq/bqAXU94hAP5Doe/cMUYAcNwc1N1NsyJNc6v/9cf7IvU
         v9kHMPjyKy5qVdKMYQm07sDqV4752E4OL+MXxszWo9A2AX0Sn4ICiZHIccqzv4DB4Okl
         giLHsR0qoxfQcp3esl9QgmrQazMI7Zbm1XAy2/K/nsymcDOerFA3PhW6iHbdZ3uUELPF
         yCb6orwKsi4ngtd14vJFwPflsdm8Qo8cArF9bp4r/uNgpLWK8817kklMsCp0QfhXKUA/
         TgIVIrETnUu/5Zh3n0mq5Y5VuXwfRtT0TZjHESA2/fEiD9d9rq703+XGjcdZUG1w/NRE
         8hiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694587965; x=1695192765;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZ/yGI98Y177/By6+Sf86XceM2vTbQeJk7ABiqq79fg=;
        b=iY5+VrBgRyO4Zx+VPswkQ1zuuR/Xsic+FCu9Io0QH0r1foPmbAYi5TV2BHkl2YIL1o
         sO/pNhLpsiXMo9JMkurCPi0PHDF07maQqIbvbqNYNPqQSYZPCeJBhVAjs2lGD0ikskvm
         Hakki5gqxKv6mt+39bZk9nyqE8+/ka+dhDpUoppjQYAzNBm5qhTs3dVYglDVhzRzccNk
         Z2SAQuhZ6YnPPG9iaytNT7WpB0O/qn8CDNUfXWgL50X5SWsUwV7dmdPrnnmP18vaRuRu
         ElKbrnSFAbcxLY3BBMd3Sx/JwwIzUBgKfKBQdgl2Z56ubVeTUtclnFZLUsjV6kCaoksy
         oHhw==
X-Gm-Message-State: AOJu0YwsOIw2P324gLyEBlKriSkq6RwGHI7qoHIIqfHVS0TrGAT/O0nz
	zOpwgN1LXylXufgcbeLGhH0Qc6EKhCU05beB
X-Google-Smtp-Source: AGHT+IFXSIdNrVzpTf2lC7HE20MSJRIyVT8vdGbH2OOt/Z8ElzjNZWZ8w5bUaXLaU228QrY5tP6BHQ==
X-Received: by 2002:a17:906:535d:b0:9a9:e5a7:46ce with SMTP id j29-20020a170906535d00b009a9e5a746cemr1226382ejo.24.1694587964794;
        Tue, 12 Sep 2023 23:52:44 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <ff09aede-a0a5-2e08-0492-1c986d108b04@xen.org>
Date: Wed, 13 Sep 2023 08:52:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Reply-To: paul@xen.org
Subject: Re: [XEN PATCH 05/13] xen/ioreq: address violations of MISRA C:2012
 Rule 7.3
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Gianluca Luparini <gianluca.luparini@bugseng.com>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
 <771362e703548e55d4ccc420fa880585a5748c4f.1691053438.git.simone.ballarin@bugseng.com>
Organization: Xen Project
In-Reply-To: <771362e703548e55d4ccc420fa880585a5748c4f.1691053438.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/2023 11:22, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
> states:
> "The lowercase character 'l' shall not be used in a literal suffix".
> 
> Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
> If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.
> 
> The changes in this patch are mechanical.
> 
> Signed-off-by: Gianluca	Luparini <gianluca.luparini@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> ---
>   xen/common/ioreq.c      | 2 +-
>   xen/include/xen/ioreq.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Paul Durrant <paul@xen.org>


