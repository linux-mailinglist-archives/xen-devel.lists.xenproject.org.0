Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12551889F97
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 13:33:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697741.1088817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rojWA-0005hf-Uf; Mon, 25 Mar 2024 12:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697741.1088817; Mon, 25 Mar 2024 12:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rojWA-0005g8-Rd; Mon, 25 Mar 2024 12:33:34 +0000
Received: by outflank-mailman (input) for mailman id 697741;
 Mon, 25 Mar 2024 12:33:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JU+D=K7=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1rojWA-0005g2-4X
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 12:33:34 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4308d4d-eaa3-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 13:33:32 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4148a6cc488so4684895e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 05:33:32 -0700 (PDT)
Received: from [192.168.21.70] (54-240-197-225.amazon.com. [54.240.197.225])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a05600c4f1500b004148ab95c36sm1780656wmq.41.2024.03.25.05.33.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 05:33:31 -0700 (PDT)
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
X-Inumbo-ID: e4308d4d-eaa3-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711370012; x=1711974812; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vmsNGz/SjS01nd2DN2qF7dW1osscxRz3VTWdKl4iAko=;
        b=SZ8cYYu1igi2ClpCeKKb221l4QwBpjCgLQtHoe1+VDSkuXn4+3KFZK1eEUuOBR7yLZ
         8p5dWZiohXinK+3Tmt2QxJeFoYenY9Eol9lEfRUqmaWpmuZuRErQQ1q5kPFaDtAxb2AO
         yki1Vy5NcJmQD7q12t+tbWDk5G/hVO/AxN7G+bNAuOvFyotiDAtnpwtJ5E2E813l4EAj
         MkssD77dpbilp+aGivL+aVUs9QfZgSwXoah95l6eAizMMl1mW1OfYOIaI+Tf5ajAaVWo
         tMmHpMmmKmZ1pFOsqI2/8E8b2W+Ze8u12FCzwLRzQW8s64rM8Szz4AVvh7dewftKAm7A
         Gs2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711370012; x=1711974812;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmsNGz/SjS01nd2DN2qF7dW1osscxRz3VTWdKl4iAko=;
        b=htLdeA7H3Ovo5AHkqSdtp+vzHOI594BxsC4JwkuiYwCYCtqmpAMmIKVHnN3c9cCMCw
         VxeN6k4WBOhd/cEmyE5gh0AsSX5vpzy26YTcKprKJ4GW4d19pFHbtRqzAiCEmZFV5hf2
         g1w0nsAQEDGPSrPWC393uTHruHXeoLVg9WjwxmgyNlhJ/kaPfs/K08psAi5Bv6Qk9GHU
         RCBHyh2ktDCkbjzIlHdr4RHed9BYL/pq4hqRaGtYvJnm+Yc4ca0t09pPYGmjZ2Hzbza7
         bZasp7vh6yeKYVewiWkKgUdXNuhixsSX6B1dO7rZ3EQR9JN9+zthPfmOUbFBXNYcV2bn
         m8tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGLZBT193pgNenD1t9mNo09BXezqrCyBTWEld5wGpAD8GVQrsz67XpYi7pU8kbfMOmFFqyeul0C0PEETQVMrzx8NxGiMLU3g0ENhrkRyw=
X-Gm-Message-State: AOJu0YxY19pGRv3DOr062ik1pc6dmaSLqw5ETHDa7hI9pMx8LMJhMHqy
	UAGYCkEATYaQKlGG+YEguiCDs/KP9+0OTp48w2XueOBveGkk2NHo
X-Google-Smtp-Source: AGHT+IG+27VzqWLIHxcr5Aj7meKj47pkoq0+ixCtIODoAioj8TBpbct8mifSSWcSJFFdnpr7uaRQ4g==
X-Received: by 2002:a05:600c:4792:b0:413:e8db:2c9b with SMTP id k18-20020a05600c479200b00413e8db2c9bmr5309307wmo.40.1711370011823;
        Mon, 25 Mar 2024 05:33:31 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <857282f5-5df6-4ed7-b17e-92aae0cf484a@xen.org>
Date: Mon, 25 Mar 2024 12:33:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: Xen NIC driver have page_pool memory leaks
To: Jesper Dangaard Brouer <hawk@kernel.org>,
 Arthur Borsboom <arthurborsboom@gmail.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Netdev <netdev@vger.kernel.org>, Wei Liu <wei.liu@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <CALUcmUncphE8v8j1Xme0BcX4JRhqd+gB0UUzS-U=3XXw_3iUiw@mail.gmail.com>
 <1cde0059-d319-4a4f-a68d-3b3ffeb3da20@kernel.org>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <1cde0059-d319-4a4f-a68d-3b3ffeb3da20@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/03/2024 12:21, Jesper Dangaard Brouer wrote:
> Hi Arthur,
> 
> (Answer inlined below, which is custom on this mailing list)
> 
> On 23/03/2024 14.23, Arthur Borsboom wrote:
>> Hi Jesper,
>>
>> After a recent kernel upgrade 6.7.6 > 6.8.1 all my Xen guests on Arch
>> Linux are dumping kernel traces.
>> It seems to be indirectly caused by the page pool memory leak
>> mechanism, which is probably a good thing.
>>
>> I have created a bug report, but there is no response.
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=218618
>>
>> I am uncertain where and to whom I need to report this page leak.
>> Can you help me get this issue fixed?
> 
> I'm the page_pool maintainer, but as you say yourself in comment 2 then
> since dba1b8a7ab68 ("mm/page_pool: catch page_pool memory leaks") this
> indicated there is a problem in the xen_netfront driver, which was
> previously not visible.
> 
> Cc'ing the "XEN NETWORK BACKEND DRIVER" maintainers, as this is a driver
> bug.  What confuses me it that I cannot find any modules named
> "xen_netfront" in the upstream tree.
> 

You should have tried '-' rather than '_' :-)

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/xen-netfront.c



