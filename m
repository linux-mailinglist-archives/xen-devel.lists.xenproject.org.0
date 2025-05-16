Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E128EABA610
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 00:50:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987645.1372866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG3tD-0007SB-Tb; Fri, 16 May 2025 22:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987645.1372866; Fri, 16 May 2025 22:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG3tD-0007Or-PN; Fri, 16 May 2025 22:50:51 +0000
Received: by outflank-mailman (input) for mailman id 987645;
 Fri, 16 May 2025 22:50:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T4W4=YA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uG3tC-0007OD-3e
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 22:50:50 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35b1028f-32a8-11f0-9eb6-5ba50f476ded;
 Sat, 17 May 2025 00:50:48 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-442f5b3c710so19554495e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 15:50:48 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f33690f0sm119572855e9.1.2025.05.16.15.50.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 15:50:47 -0700 (PDT)
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
X-Inumbo-ID: 35b1028f-32a8-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747435848; x=1748040648; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LSOyo5iWZVzBT+iqi2WHlb33LaJUvkDHoNdDgAEM24c=;
        b=AgJn6hMMlZKlhbNKpuHzMDZ9QUNvGKEewHxvZP7IYyOsmQ0HUr1yrRo0ruHAdDZ10S
         /T7KFkl0aAdPdjguX4WTpdaESoPR0Juxuk9oXO4P4A7l+Hdyp8rtJitjTpEPK29aameG
         EKdrJw1kzj9zQ3iVD9oqFM3iJ4Js0uGGJfkFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747435848; x=1748040648;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSOyo5iWZVzBT+iqi2WHlb33LaJUvkDHoNdDgAEM24c=;
        b=L8H9RqYQzYSfY+1bi9sGVST6wFuWc6fcj+NRy61EJt6q3MG7LtuFA5G6aUILrJR/2f
         lidYX0kWOBxcfq8abyfTnrrlsU/zkuA0AgVSVwM/DKDAYONio+AbBQsVlmhKptVCinwD
         0xj4CMaMoYBcyBfHRCUuKHMMhmRAO596UZcMvca8NwIBUIgn1p4s+mZ0UVYax/QtZoaq
         d6zjsVcwITmdgWc7uiMLH85aa1n2zWtkaQJDjqB6BLiF7oKyHWoeL4yQtLR+qg2sVPgV
         /2mrqYSirRwFHvbJZJb0wYCLyrElMIJ8JE1Xm7YHzgRq4cUIEZNJ84qoXL5IS/HOywUi
         7WsQ==
X-Gm-Message-State: AOJu0Yyh8cjMO5C+vcvxsyVv1GENxydPu/Rui9uByO+2u8Op17ylvnmw
	CcwIgk5cgR/wLyMTK+lGKCvONEBKb53ZkZ661R5ZYwxAigIj2Y/kx04pckIHBlcTiBJxvGxwhFB
	HJqaD
X-Gm-Gg: ASbGncsdlVQyCg4Qp1ZuB1oMt3eG94c2dYi2S6HZFxY+SDfmlyhfoN4PEEmcZDNcB4F
	LFOOxM9zDzg+mIeJsD+ypl5f1wvlO1sDbzNQUjreWJ4181lUN4aZe0mj2nxswKXxnIB00k+pbmG
	FAr6q87maH/R5FIwUI84IuR8NaKFF6p50IJ4fy93a58jKAy6hnZXf18zvZ1KdlWJuHvjt5BA43t
	IMSVpSa4rtr80sh2bF+/E0AZH7cGnjndskiIJwAgd+bvxHcxSdYxNIcn3Uh4/9Vki2CE7FWI0GG
	8hCji7lJXFiwWaXiuJFX9/MID05nVbYvmQK3hDuyPMtdJ9BjOprUcxRydJwQyscmy2vF+9cznEA
	ys5r1hSLCab/cRd9P
X-Google-Smtp-Source: AGHT+IERSOLKISk//LWo9nDxiA9Y0C2ZMvIzZmtB+xIqvyUmN28GQe8MxU0o8/PmWx0COmTW5aRQEw==
X-Received: by 2002:a05:600c:34d4:b0:442:e0e0:250 with SMTP id 5b1f17b1804b1-442fd67200emr53108385e9.29.1747435847747;
        Fri, 16 May 2025 15:50:47 -0700 (PDT)
Message-ID: <54b07cf2-1a7a-429b-820e-945d82d9830b@citrix.com>
Date: Fri, 16 May 2025 23:50:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/vlapic: Fix handling of writes to APIC_ESR
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250303185352.86499-1-andrew.cooper3@citrix.com>
 <20250303185352.86499-2-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250303185352.86499-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/03/2025 6:53 pm, Andrew Cooper wrote:
> Xen currently presents APIC_ESR to guests as a simple read/write register.

This turns out not to be true.

I'm trying to finish off the XSA-462 XTF PoC, and my detection for this
case wasn't working.

It turns out that there was no write path for APIC_ESR ever wired up
(i.e. I got my analysis wrong about how vlapic_reg_write() behaved with
no APIC_ESR case).

Errors could only ever accumulate, and could never be cleared.

The behaviour following this patch is correct, but the commit message
describing the prior behaviour is not.

~Andrew

