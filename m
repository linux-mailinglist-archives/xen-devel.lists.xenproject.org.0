Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 766ED57E4DA
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 18:51:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373375.605551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEvsN-000098-Mq; Fri, 22 Jul 2022 16:51:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373375.605551; Fri, 22 Jul 2022 16:51:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEvsN-00006F-J6; Fri, 22 Jul 2022 16:51:43 +0000
Received: by outflank-mailman (input) for mailman id 373375;
 Fri, 22 Jul 2022 16:51:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/THL=X3=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1oEvsM-000069-23
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 16:51:42 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f4871fc-09de-11ed-924f-1f966e50362f;
 Fri, 22 Jul 2022 18:51:41 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id c22so3133379wmr.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Jul 2022 09:51:41 -0700 (PDT)
Received: from ?IPV6:2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9?
 ([2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a5d4352000000b0021e297d6850sm4797562wrr.110.2022.07.22.09.51.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 09:51:39 -0700 (PDT)
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
X-Inumbo-ID: 8f4871fc-09de-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LoqjoC9DXCi8ELLSQyxZ3VbyPqP+95OVLKZHKaBD+DM=;
        b=bDFcTRbS24frylBzidaFLX8xxbzBzeRRs4q8cq2FAMETbqh//lM0zJ7GJsf70m4Zna
         2SPZkFyNzwYSafJC7aE8px5pKS+nszEwPpYhs8vP8EPS+y7pP/YxuYl2qZBpDbzRTxTB
         VezvYnxCoZqd+ZWHOP4duQgAD3WnQrxTwE4RQFKw1gLzkkop2zYcjBpKJVGNHMjNDDml
         sPX1yzx80dd944YqHHOPmCtReg7ECsLpqtNGBDP68+tzUtexsOf1KDnv6oCXqu+r34Jt
         Hu9+sHgJ1Wy3ou+0MqX7fAtxDV4OHTATsnIKewIpPZ0r4etxqvF90/lABbXPqOqw9LER
         +aow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LoqjoC9DXCi8ELLSQyxZ3VbyPqP+95OVLKZHKaBD+DM=;
        b=vs62eGc2PjLVvOv5FDteJY2EVorc35nEJqJt+SRliOAvoqtpDaqXJrA/by1Noeawsm
         JbUDaj8qklB9BorNXUSL+X74X2x/kGY56XynuGBeJHu/TuksJDkHIZvvXkKUpqDxI0uk
         dQPhOevZMjQPH21niQe3W9Alxg/SatmlNzuH/SQZV1zM59ZcaxeX88qhQ8zO/+cSWBB2
         UPhsbCJVCUpgJkeMQES90W4aykJd7NC7J3ZAgFnSEMdJ7qt9q3cKxjTlIxxD48wFxbI2
         SI71gDiORRCjO2vxQ3dOq2BKCD4JVYr3OPwIlJp/6gYeRqE0lw/VsiK2HWZXolPckV0s
         qCCw==
X-Gm-Message-State: AJIora/rAmmyfWXP/tSS5Lmoc5meQuoKQYSxjHqAUyWFfPBB+0MXe+bC
	7btR1ciS/7kQoiYHpYXE+v4Vqan2ycjjfg==
X-Google-Smtp-Source: AGRyM1uF705CZIM9R/I7eKfx64bvf8vApg3yt7R0XUVI1vrCJMJSbxqcck8hPrXAtQd7IzNgVwEL6w==
X-Received: by 2002:a1c:5452:0:b0:3a3:2b9:6cfe with SMTP id p18-20020a1c5452000000b003a302b96cfemr470175wmi.112.1658508700555;
        Fri, 22 Jul 2022 09:51:40 -0700 (PDT)
Message-ID: <473cb9d3-dfd0-96fd-47c6-3dcd3e7b6f74@gmail.com>
Date: Fri, 22 Jul 2022 17:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v7 06/14] VT-d: allow use of superpage mappings
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
 <629e7e8a-b846-14cd-08eb-75433c8c3369@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <629e7e8a-b846-14cd-08eb-75433c8c3369@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/07/2022 13:46, Jan Beulich wrote:
> ... depending on feature availability (and absence of quirks).
> 
> Also make the page table dumping function aware of superpages.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>

