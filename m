Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7819A3BDE3
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 13:17:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892768.1301718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkj0q-0003H1-TT; Wed, 19 Feb 2025 12:17:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892768.1301718; Wed, 19 Feb 2025 12:17:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkj0q-0003Dt-Qh; Wed, 19 Feb 2025 12:17:12 +0000
Received: by outflank-mailman (input) for mailman id 892768;
 Wed, 19 Feb 2025 12:17:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QLUF=VK=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tkj0o-0003Dn-Gf
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 12:17:10 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7064ccf9-eebb-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 13:17:08 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so68452925e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 04:17:08 -0800 (PST)
Received: from [10.81.43.31] ([46.149.103.14])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a055910sm210166295e9.9.2025.02.19.04.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 04:17:07 -0800 (PST)
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
X-Inumbo-ID: 7064ccf9-eebb-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1739967428; x=1740572228; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RiB0H3djkiBrdEqPNlu/ZbyOsdVvUYhn3oufuIbn9XE=;
        b=GUDMP6X49WgwfCtR5AZbnweX37M2+j1NOx8YAJdS4eosDKkAOgaFeLmNDROfbTLicl
         brc8TS6QvWJYVDn7sb+FRbd8QQvZCTRkNnOkUcQ10Ko+wsGoOzrLpHqwroOc5dYWgjXP
         /23nLVsBmoRDg7DsS56oGEAVpaVznZvwdtF+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739967428; x=1740572228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RiB0H3djkiBrdEqPNlu/ZbyOsdVvUYhn3oufuIbn9XE=;
        b=dgFy/KiE1BG3d99TDD3VeCWw1+vFbSC9FD9+irruqZjE6vk8z3h64ZhJuz9N//bTYc
         hmhoMh6RhR5Nu7tHNP+ahcf6mc9Nk+2Xz14XFDVm+3tLTmmmTZi37KsuPEG7XHi7uDnk
         AK77U1NvOZQBZvILrJ6uzwKBClubf5LM+mxyELpFc8So3I/JtjdsiG1zFNA+Y64QnDy2
         GkOCoV9i2zb67Q0l3Ie/JtmgT3fXQrQ6um9S7waHOG1ceEd5rVU0XmMzVAdcj3SVJirs
         mumTs30HTYy2/XY3R9dweyPE4z40aB/VrAQRRC3c4SrK3e3hUax2cz09rWxT/jEshUWy
         2sfg==
X-Forwarded-Encrypted: i=1; AJvYcCWv7sMkra14B4nEIJzRBy0hQwsSSnmqD08yL6fnJrSHXvAAVyFnIYyx7BCw0JMl2AMWMNGxOWTsg6Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySO5+QAGunTl6Y6TuiU1Lc5W+F85PMvBwjF1+0l9zeQ0rUNpBM
	H6JlwFVYKoKAknGe168xEqNGiPo9ZA9qXRnrved+bw7HYusl1FFtOWfWxL4RpzE=
X-Gm-Gg: ASbGncuxUv6WNAsTdXXGaAUWINh7yyHmq0wDALRw0reGpvr7WjUWYNfjY+s9KUfcRGM
	d3TdJCZ8WHnDcgQ8fQqeGA67Ooxkqy+SF8vBVFWtBcUTTyn0sd0IAzGvN4dBs6eXES8SAOjgMbL
	dAVwPEO3qTFOTwjCGl9BM76BV4deImXG/wNvPxoT1dB2KPuokKc8zGcD5O1WRP1eXFelOxRpeSw
	f0RC1GMTF3OtYNVscPwV6R3WnV4fa8bNOiIZqeosY4rq/E7KjHQSpJsAc/rjHsIvmebCQyrRZDm
	Rv32b1JLBs5pfUDI7eI1ooU2
X-Google-Smtp-Source: AGHT+IFxN/artzEBSlnBGVj6ksGzmrMfriGStbNXlMLSlG5UMNkcHxYeky1d78Brac9JT5Uy+ZALaQ==
X-Received: by 2002:a05:600c:3b8c:b0:439:9ee2:5534 with SMTP id 5b1f17b1804b1-4399ee257f2mr14370955e9.12.1739967427971;
        Wed, 19 Feb 2025 04:17:07 -0800 (PST)
Message-ID: <a37cb01f-6848-4c84-85e1-855c33b2e1da@cloud.com>
Date: Wed, 19 Feb 2025 12:17:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN RFC PATCH v6 07/11] iommu: Simplify hardware did management
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1739785339.git.teddy.astie@vates.tech>
 <56ac13967ba7dfbb229c65450c79f6838a3aee9f.1739785339.git.teddy.astie@vates.tech>
Content-Language: en-US
From: Frediano Ziglio <frediano.ziglio@cloud.com>
In-Reply-To: <56ac13967ba7dfbb229c65450c79f6838a3aee9f.1739785339.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/02/2025 10:18, Teddy Astie wrote:
> Simplify the hardware DID management by allocating a DID
> per IOMMU context (currently Xen domain) instead of trying
> to reuse Xen domain DID (which may not be possible depending
> on hardware constraints like did limits).

Minor: here and in the title, did should be DID if it's the acronym, 
otherwise can be confusing.

...

Frediano


