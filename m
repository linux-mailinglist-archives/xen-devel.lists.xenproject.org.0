Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C01A8345A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 01:04:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944812.1343157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2eSx-0000n1-Tc; Wed, 09 Apr 2025 23:04:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944812.1343157; Wed, 09 Apr 2025 23:04:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2eSx-0000l2-Q4; Wed, 09 Apr 2025 23:04:19 +0000
Received: by outflank-mailman (input) for mailman id 944812;
 Wed, 09 Apr 2025 23:04:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbf/=W3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2eSw-0000kw-20
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 23:04:18 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5828b90-1596-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 01:04:15 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39c13fa05ebso72970f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 16:04:15 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f20b2c355sm15891535e9.2.2025.04.09.16.04.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 16:04:14 -0700 (PDT)
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
X-Inumbo-ID: f5828b90-1596-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744239855; x=1744844655; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+YY6KE25pqcMgIC76qez6rHyEAIe3UVLVAfnRXBHNNI=;
        b=MdPzKgM9pxhzk0gMDVLaIh5HX7SglIIWrZhYYekPwCyWOdo/DUnv83M0R6hPbg9sVe
         5c5fg01+FWkpRdNA0tHJkILRfI+diTqFCvzrMhR502HP3NrDvCuo8BHC+rGJOElZmL2n
         tLMR4Pyhm+BVFlvbVp//2uwzZnat4rxdkaKcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744239855; x=1744844655;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YY6KE25pqcMgIC76qez6rHyEAIe3UVLVAfnRXBHNNI=;
        b=hAEeBk+Czap7IEXuDi8m+ptxB3k+Pl9XvfXbYzB+XET8gY4giDEcHPR/6jEDdGhpL4
         KjtnhHwcgf/8oVaeaAdZQyLwBcDqWXiWVUjVMgVNHgDwcgEMn+xMQPidHWhg9JwSFhf/
         3qWZ5+zlMjAHTVKrdxx+PKY8PYUQEq10fzJ+Btr+ARRlmtCDXMM0ADpgSJnA4Rhq8Tkb
         c8YSC9+jpkIjTqjTkaeXDPyzFK/4ldR82JItD5Ck1Cu9hopgDcOCrHTqM+V1kMXB2GYV
         L34h82OTUv5hyNJqzBzYjptTDv2d3lt45anBx2VOFVpRFhKeJDKL3hBV2FaJeGBuR3ML
         o+Rg==
X-Gm-Message-State: AOJu0YyPt8xmAk1GYSlzx+s3yGFIE0GFg1mJPl53JnMMp0ebbKoCY9XG
	J5YYIR+2fDXgNy7LuWiwpW5tLt9Nwpzn0VrMIhxCFfOIWFB6AHihBfOHwRQTD2s=
X-Gm-Gg: ASbGncsEb6fY5t+4AwBvYW3e6Usa7KznPhXzx+6bZnVzGKc7G2AHYFMMhdxLjD4gBgP
	4LCeqZtfq7I6gsV0d5xRedhk+w1DoeyTIDGqnpV7ORCl1SoWnq6+6iYzREXML1dITG3AusLqZzq
	BNwzFY4F2zCj2HpDY9DlPPQz1tQ7Vct0qrLPofIZmS2xQibNb9DqswtJ9zb+bPC2q/p8g54B6kc
	9dhB1KjLWEq/sP5yrf1mCN9aYR7oozmA2nGgKroMO85++ezPTS62/hdo0kvQlKW6LP3JFA9m4sj
	XmfquJKTGde1TnX5lhcuYorRZ/Ci4KeqlD+LrBUTcUbAuyEFxnraDC8ZgRp2V3yOmyWNK0Lrkl/
	dJfnoOA==
X-Google-Smtp-Source: AGHT+IHflZWwYAgOWK4eCPFRX6eWiP/PLT0Nx5UM+3o4i0UauVoGD4cb+sGvVLYlb/ZVfF2K5tP8jw==
X-Received: by 2002:a05:6000:18ac:b0:391:20ef:62d6 with SMTP id ffacd0b85a97d-39d8f463b72mr352453f8f.11.1744239855195;
        Wed, 09 Apr 2025 16:04:15 -0700 (PDT)
Message-ID: <e0905f77-4cf3-46b9-b4c1-1ad9a6c841d3@citrix.com>
Date: Thu, 10 Apr 2025 00:04:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] Factor our x86-isms in the linux build script
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
 <20250409163702.2037301-7-andrew.cooper3@citrix.com>
 <Z_ao0d530OwAUqGW@mail-itl> <Z_b76k-NXoMPBRe_@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z_b76k-NXoMPBRe_@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/04/2025 11:59 pm, Marek Marczykowski-Górecki wrote:
> On Wed, Apr 09, 2025 at 07:05:21PM +0200, Marek Marczykowski-Górecki wrote:
>> On Wed, Apr 09, 2025 at 05:37:00PM +0100, Andrew Cooper wrote:
>>> ... in preparation to use it for arm64 too.  Rename the script.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Replaying without dockerfile in context, so it actually hits the list...

It did hit the list.  (I'm paying attention via my shadow subscription)

Lore seems happy too. 
https://lore.kernel.org/xen-devel/828cabc9-512f-4c2f-a7d7-b9c8963c1300@citrix.com/T/#mf8fba1fa1372985c108752f5179e3f1d7a688323

At a guess, Inumbo have reverted whatever was causing the problems with
dockerfiles in emails.

~Andrew

