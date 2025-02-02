Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 817B5A24E75
	for <lists+xen-devel@lfdr.de>; Sun,  2 Feb 2025 14:57:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880363.1290437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teaTK-0003ZS-7x; Sun, 02 Feb 2025 13:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880363.1290437; Sun, 02 Feb 2025 13:57:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teaTK-0003XB-57; Sun, 02 Feb 2025 13:57:14 +0000
Received: by outflank-mailman (input) for mailman id 880363;
 Sun, 02 Feb 2025 13:57:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=okHa=UZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1teaTI-0003X5-Gh
 for xen-devel@lists.xenproject.org; Sun, 02 Feb 2025 13:57:12 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98f72ecb-e16d-11ef-99a4-01e77a169b0f;
 Sun, 02 Feb 2025 14:57:10 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aaedd529ba1so492058166b.1
 for <xen-devel@lists.xenproject.org>; Sun, 02 Feb 2025 05:57:10 -0800 (PST)
Received: from [10.101.4.108] ([89.207.171.161])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a59862sm588318266b.178.2025.02.02.05.57.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Feb 2025 05:57:09 -0800 (PST)
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
X-Inumbo-ID: 98f72ecb-e16d-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738504630; x=1739109430; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8mzXUq5J3QrgO2HjDwPAHkjQrWmqFhB25bMOYK67Dag=;
        b=i0swmADFHdhXxzAEzqLNjeRnbEpAQuh8KNOIEptRfkOAh2mj2OjvZ2PDtF7scTcsVN
         PmXhQKOQYC+xizylPayQSUe5eArrdUe/CONxQ0R6YOJkcK/XG9Wj4nWtr2Z068b1jn9g
         Y2TEGpcaiV+P6wa/EPghVor0nIKyLdhJW3NlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738504630; x=1739109430;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mzXUq5J3QrgO2HjDwPAHkjQrWmqFhB25bMOYK67Dag=;
        b=pTPSenX5ErIapjj2gyLRxE70WrSzCPbrQmqp+g0IJ7SufXRHxmaLbBMAKeUv58dkLn
         DZNdzseNYOBXG2y05tlfzVlKfZkLzk/7XutNJOaPi/aF78IdKIO7c92jZpqB/0/tVGWk
         Zgt5oLX1raVc5I6AdUwrUnxk2XU4tnCkEOYWd0AXRTiKNb5Dm668zUhQ62bYwGTDvuvt
         qExmxLCrMbJLvNYoR7/4+tS6q5e5JyQhaU3N1/9/SnIATTBgnJsy/45L01NAmKHT3d35
         kH92yB9OZEd/j/Y3o8+4nvJnE2YL4q9TXJAfx+AyM24G0EP+qy6kY8ee3eAAO/ZEfv1A
         82Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWBE6iRea9uPWQQKCXEIK8QmapRsCwUhEX3X/DZ+nA1NBq5U7/In5whZgajyW6ZB7OebxK8q5j6P6s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwkVyhgyhqGlxJNqgmW5E/JYmNw3qYJikeFsnyCHS4JctZGxJgP
	taHEc47MV5jQJu/QhYuhGp12pmlpunPv5LscATBtuXdc912ZO9iFtONIr92X+3yvb7MrD0NOnx2
	x4+c=
X-Gm-Gg: ASbGncuiqtCFuTJQepyLI12csMEcXK/NTs59W7qzDhnBLC5o1/NMmHQQO4vi92OLmGN
	tiJKNuRNoKXO1ebvuTZXOenFOfnKyi27Cnud9l4pD1T9QHosXDGjNsbO9YfqK8m1NgpMNKakMXu
	ey0ydMuhdHxk0Ty75KPOB9D/FY+dig4h9ZuQXGSoSWYJXe+g7C4gkx/Ta6uB3kZ6dUnhp+O/SQ3
	cItJL0gePtq65DYTyEa1cAtee6wMiCh/7jY+X9AqDdQssuLDa+kk06eB94m+qNIyyeaFZ97vZoM
	exzECW9E4SCcFPa66/xAg+psML0=
X-Google-Smtp-Source: AGHT+IHX+sAWGpXYYUSmVsxXUuTUCF/gDbpXtHxs5mcwIRY+zoKwN0K/LpLoNaJanD8S12LK1ceq1w==
X-Received: by 2002:a05:6402:270b:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5dc5efec180mr43004025a12.23.1738504630183;
        Sun, 02 Feb 2025 05:57:10 -0800 (PST)
Message-ID: <82e9f4f8-a9e9-416b-b6cf-cdd803c5de1b@citrix.com>
Date: Sun, 2 Feb 2025 13:57:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20? 3/3] AMD/IOMMU: log IVHD contents
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <2bb9d3c4-0761-4d63-8193-29293e35eb04@suse.com>
 <b0b8c35f-5c88-46bb-a882-9ff737683367@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b0b8c35f-5c88-46bb-a882-9ff737683367@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/01/2025 11:13 am, Jan Beulich wrote:
> Despite all the verbosity with "iommu=debug", information on the IOMMUs
> themselves was missing.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

