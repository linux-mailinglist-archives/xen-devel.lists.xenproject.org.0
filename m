Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E6C8BCB3C
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 11:54:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717404.1119563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3v1t-0001Ky-FD; Mon, 06 May 2024 09:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717404.1119563; Mon, 06 May 2024 09:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3v1t-0001IB-Cb; Mon, 06 May 2024 09:53:05 +0000
Received: by outflank-mailman (input) for mailman id 717404;
 Mon, 06 May 2024 09:53:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0G4=MJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1s3v1s-0001I5-5r
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 09:53:04 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d67731f-0b8e-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 11:53:02 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-51f300b318cso2036528e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 02:53:02 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.211.4])
 by smtp.gmail.com with ESMTPSA id
 s20-20020adfa294000000b0034e285d818dsm10325541wra.32.2024.05.06.02.52.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 02:53:01 -0700 (PDT)
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
X-Inumbo-ID: 6d67731f-0b8e-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714989181; x=1715593981; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TPCl+61dRvUZ43xraXeNfSbdX7BxsyMvGiFdXcYoCwY=;
        b=pwYfrPLqtrci2e7yfF7JVk4A+Ir0uYFoCKlVwZgsu6F1igJTowc0VJSL+A/9EDBJ4k
         oenf0CZZLUR5/1xh/yXRiFdrnIMXVQmQWQf36bpTWBrUjZ75L3jGA9KKUKsTzlEaqba7
         rIx0rx4x7FV5NpkAaDyUJg7rgn72o4VDn4Gggs0MyRpZ7M3m6ATQm/5GYoez5o/CMxyF
         cfpp4d1foWuF+FCaGs1WrMUxHMT6FERly/6yZ8R9y4aPkvIp+gNXW7Qo65tEA9VsleoX
         syVjeUYcr2owo5nc+7e3767NDbrbQKcAMD4rH+ulbNnBxbSmJruMM9Q6yYmyA7GRh5pa
         UETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714989181; x=1715593981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TPCl+61dRvUZ43xraXeNfSbdX7BxsyMvGiFdXcYoCwY=;
        b=ajKmLTf0Vkuv1M2SaqRcvwMrIn60hGPw0oinwT+5gzy7IKFY82cdgTbieohCaBPBwO
         A1xugA/nJySdBUgySya/8bxtamd6rEEU1WEXwlHiwWgjLgKzilDxzhsfKLnGwRkf4iBf
         Allnzu55t3FvIr4DMAj5SkcwlhiLag0/9R5ZqshhmXmis0LobZzGLrLwkFqlzX5K2MrY
         0QU8t1v23M6bulJhZvjcVd+o/2Oszf3gQk9qjIVEdfhxqtDCYFOq6zaZzdtL0PECbrjL
         Z6IxII4sQLeycpQme5yt+bFC/N0RJz1vbz0IgKhhYkSYLnSi6zjM2jT+VxZWG0N7INdl
         pqLw==
X-Forwarded-Encrypted: i=1; AJvYcCXASKhMYd5lvGHP9j2dkaJ+EIet4TMPl3dp+HGvZ9u5huQUYp2VgqQKHMtI3Z3ziDWr5B6VbLJLgE+NU3qdvZzJXxZClqHUNg8B/B6jLAo=
X-Gm-Message-State: AOJu0YwlrAoPzi+L1T+wjDeAm+b8VI/zgMOD4H3vCp8DEn/+W1h0mOGM
	uL6REm6/6EBMqvp/1quyBVBo5XJS2AsTzGH4MBpMolr19YYetvsFZBWVamUWiWI=
X-Google-Smtp-Source: AGHT+IE6VEab3Nb48zWWttMEjaLYBNaijuvXZUWASOQIGE7LaA6yDT6c1ODOLkonnCdy4GCZ52lmBg==
X-Received: by 2002:ac2:43bc:0:b0:51c:15fa:b08 with SMTP id t28-20020ac243bc000000b0051c15fa0b08mr5054250lfl.69.1714989181528;
        Mon, 06 May 2024 02:53:01 -0700 (PDT)
Message-ID: <e43695d7-e13c-4bb3-a9ff-0a5739cbeb79@linaro.org>
Date: Mon, 6 May 2024 11:52:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/17] xen: mapcache: Refactor lock functions for
 multi-instance
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Cc: sstabellini@kernel.org, jgross@suse.com,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
 <20240430164939.925307-4-edgar.iglesias@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240430164939.925307-4-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/4/24 18:49, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Make the lock functions take MapCache * as argument. This is
> in preparation for supporting multiple caches.
> 
> No functional changes.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>   hw/xen/xen-mapcache.c | 34 +++++++++++++++++-----------------
>   1 file changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


