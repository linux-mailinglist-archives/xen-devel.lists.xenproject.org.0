Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA344562EF
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 19:51:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227568.393618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnmV0-000637-56; Thu, 18 Nov 2021 18:51:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227568.393618; Thu, 18 Nov 2021 18:51:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnmV0-00060g-2E; Thu, 18 Nov 2021 18:51:06 +0000
Received: by outflank-mailman (input) for mailman id 227568;
 Thu, 18 Nov 2021 18:51:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ezFO=QF=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1mnmUy-00060a-R1
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 18:51:04 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b10b774-48a0-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 19:51:04 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id 133so6304054wme.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Nov 2021 10:51:04 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:70ff:9fb9:79eb:9599?
 ([2a00:23c5:5785:9a01:70ff:9fb9:79eb:9599])
 by smtp.gmail.com with ESMTPSA id s13sm10091855wmc.47.2021.11.18.10.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 10:51:03 -0800 (PST)
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
X-Inumbo-ID: 7b10b774-48a0-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1PAPO3Y2RtSMMlsrgkt2gZHEkvgCvamHQZpPUYVi3Bs=;
        b=cjH7Zk8pEa6SxKvbVF46haj4Q/XjZOFvcXTxGGERE6rSFcLR1a/jxEUtd/+T0NTjLg
         WhKdo6c+7/UnYDuxJ8OUyoGzwiNqJLppJyaYfpSDzdgwc4KEDiim9gPH4a+O6ChsyL2W
         v8/Y4P9S/EeCDqWy7LlKAk0H/YZSwsZZNSgAGapP8/9NdBGO3wnKiubBWwF4NLwkC/42
         5mcIqLhv4yyBt4jSu3bwpeF46EN/lIXMXf705J2LKS9zXCoBrFU9xbAZlwbrbwiiZpXs
         Flvheg6jPj50xbI7WJVD5AYdiWu3j+woyAAorE9VKti0gau13N8HC9K4OVhY98W5JQN4
         gGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1PAPO3Y2RtSMMlsrgkt2gZHEkvgCvamHQZpPUYVi3Bs=;
        b=8PmbibyA+VdCWkYmvLFQs25T/Jcv9WNRWLROTJcEoQRb+Z2lqq9Cuj61T5v8HQXKIR
         g9GUbxibWILJMkC9EEZA94slDwI1H6/jUT/DswLtflXRRlozEe1nPsE3J2ibcmXxoj74
         CiAWfZ+btCvHaDrL8ZOaMwCv/TPg2AIBJ3tpScZMjsydeGcwIv6J1uYY119nA+RThfjY
         l+V/+McEh6DkCklIllB0Q3d6FRpD74yTtHlPJq3tqj0kzBMJfOus6qW+1J0zTqBiOeAx
         B44nRwx6R+OJ0dKg3KBc3CBJ98Kx0XldCUV1+PXiamlI2B7C7lJXH6/L9JLQoR2+V9xJ
         Klvw==
X-Gm-Message-State: AOAM532NDlK5enpVeIf/GU8zrjfJ21A50io7H5VP31WMhqFDLbF5s7u1
	CHekZI/dNCewbHhP/0/pzx37VNNqwJg=
X-Google-Smtp-Source: ABdhPJx4dcY9J1CXoUub35JYPSU7NBqGVs1bdMNjGe9xq1zA0NdB/KutOBeCrYRkFJWn97UA1wochQ==
X-Received: by 2002:a05:600c:3486:: with SMTP id a6mr12486811wmq.32.1637261463670;
        Thu, 18 Nov 2021 10:51:03 -0800 (PST)
Message-ID: <c3e007e0-8ba9-c58b-4332-70d2cbaeedef@gmail.com>
Date: Thu, 18 Nov 2021 18:51:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Reply-To: paul@xen.org
Subject: Re: [PATCH 3/3] x86/Viridian: fold duplicate vpset retrieval code
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
References: <c8e8767b-111c-5eec-15c4-a7cb60a99283@suse.com>
 <4aa6c9b4-dcaf-38e9-0b22-394f22ae898d@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <4aa6c9b4-dcaf-38e9-0b22-394f22ae898d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2021 13:14, Jan Beulich wrote:
> hvcall_{flush,ipi}_ex() use more almost identical code than what was
> isolated into hv_vpset_to_vpmask(). Move that code there as well, to
> have just one instance of it. This way all of HV_GENERIC_SET_SPARSE_4K
> processing now happens in a single place.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

