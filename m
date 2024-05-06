Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7635B8BCBE6
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 12:22:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717472.1119803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vU1-0003XX-2T; Mon, 06 May 2024 10:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717472.1119803; Mon, 06 May 2024 10:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vU0-0003Ul-Vq; Mon, 06 May 2024 10:22:08 +0000
Received: by outflank-mailman (input) for mailman id 717472;
 Mon, 06 May 2024 10:22:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0G4=MJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1s3vTz-0003UC-1m
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 10:22:07 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c6d330f-0b92-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 12:22:05 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41ecd60bb16so8872715e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 03:22:05 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.211.4])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a05600c354e00b004169836bf9asm19292525wmq.23.2024.05.06.03.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 03:22:04 -0700 (PDT)
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
X-Inumbo-ID: 7c6d330f-0b92-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714990925; x=1715595725; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ilbeC+ygufH5V3ZDcZlT+wqSJLkVPE09rEah8GFOVCk=;
        b=xGQNF5z+QfvukIsJsl9Wrei59lt3BJpEKRw1j5JKXUBJ0dG8SEKxSm4W8BOczOHEDT
         G3KOhMRZUBhpkd3fRVxZUCP/1NSlblNGwU+O0wpOcQzHGy165i4WbLnYB/NcMB5iW7vQ
         QMnX5W7/8g3UEMG4VWToeFSB+TlRarXG4InN8XDiq7ZN5l7VsUS0k5pQvIew9TNZDQCq
         TFDyFnyE9x3upB4I5ciEgc9QSZBpQryja9QqJOY5/6bl0IJ9T1Jir20YkNK8GbZoiyYZ
         B7+kOniCY5hSowBllWPX+vet7TUSADvBP7Woq2nEk7i/oxytmgSK7KcqQi2ybV71wtVY
         K8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714990925; x=1715595725;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ilbeC+ygufH5V3ZDcZlT+wqSJLkVPE09rEah8GFOVCk=;
        b=R/J/5WnBcaevSls1S4dicckayD3f9G7R1Eae7g4WbkeM4LLKV3qVjibYR4k18F1PwD
         aKJaUkVBpBMIXOD7UUMBdE5xLNlW6pP9LNjF3UTzgTqkDmJxuh9b6lTkc/IPwJ40mmTR
         RzkHv3pYT4BqY7g2gV2QDSDb0GXiW4TE+qdSbn3FOixqNrA15dRRxVxwoAaUmnXOeO4x
         bCE9j/qZ5jeF4js49svOjgYJ3AFF/gaAEpKRkoEMwf8DWP1LdW6e5iYo+lqZ4KB6sNY1
         wnaRDp3tm3u2kW2nG3TcH0F7BFXquK6b56kNMNSQAUgJ0S3xTfoL8J1wvcsnZWEMG/a5
         EdBA==
X-Forwarded-Encrypted: i=1; AJvYcCUMF2vJYUhE5PfoYsiyLoh1jB9m/5Ayc43avmWw5JelAIPZu2lKypOzZPYW6DU/PqlexyWweWlhQzXZTw85gTps1N/DeGvGRPJlr4sM0ug=
X-Gm-Message-State: AOJu0YwWzq7GWPEQouskSyuqf51/rAbVvCdVdyO5H716NwoDJDtSMguh
	Paurto3Ut6wj8BZa135REe4Vyyyi0U6V+aKu8ZY+b+ETDtUaTAosCec3lOPMf3Q=
X-Google-Smtp-Source: AGHT+IEz3G/PqHe9VAmMjR3NKpgGTo5GDm13K4iOusz17D1sWq1x/nyWqplNUACy0Iv4lUzLKKVUdA==
X-Received: by 2002:a05:600c:1e09:b0:418:a706:3209 with SMTP id ay9-20020a05600c1e0900b00418a7063209mr10481700wmb.31.1714990924971;
        Mon, 06 May 2024 03:22:04 -0700 (PDT)
Message-ID: <c8194252-5048-4b7c-8890-0f275e61aee2@linaro.org>
Date: Mon, 6 May 2024 12:22:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/17] xen: mapcache: Break out
 xen_ram_addr_from_mapcache_single
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Cc: sstabellini@kernel.org, jgross@suse.com,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
 <20240430164939.925307-7-edgar.iglesias@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240430164939.925307-7-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/4/24 18:49, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Break out xen_ram_addr_from_mapcache_single(), a multi-cache
> aware version of xen_ram_addr_from_mapcache.
> 
> No functional changes.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>   hw/xen/xen-mapcache.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


