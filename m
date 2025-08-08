Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B868B1F055
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 23:43:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075260.1437704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukUsR-0003Be-3c; Fri, 08 Aug 2025 21:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075260.1437704; Fri, 08 Aug 2025 21:43:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukUsR-00039Y-0N; Fri, 08 Aug 2025 21:43:51 +0000
Received: by outflank-mailman (input) for mailman id 1075260;
 Fri, 08 Aug 2025 21:43:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukUsQ-00039R-3V
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 21:43:50 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3f33e95-74a0-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 23:43:48 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-459e72abdd2so15064865e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 14:43:48 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c4530b3sm32343148f8f.34.2025.08.08.14.43.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 14:43:46 -0700 (PDT)
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
X-Inumbo-ID: c3f33e95-74a0-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754689427; x=1755294227; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z7etg8bUSQj0ZxnUbnxf2Ljs7wMJYzMLw77Dh+fZK0Q=;
        b=Q69SeEgvhGvTG51obOJLn+qsA35lSBPxrrWDBLdfZdygyvFbFsEZVs86DV6GTgKbG9
         fm4BZZ9xjn5EuESfqCluOxvncMJVHsbWsr3Gqr1M7i6oOGMllGPXbsCXyyUYfUJiCHgy
         1ub6qEdv/Bex8+kyjiAqPivS74xVI3OJJ7nho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754689427; x=1755294227;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7etg8bUSQj0ZxnUbnxf2Ljs7wMJYzMLw77Dh+fZK0Q=;
        b=MDlWmYvd06ghe7O5zp2I4knFRjWmYTP7nKHtsl/K5rFOwNX+aHvPQZ6Ih1bC5qg0wY
         JGlw54YY3AqqDOBqEg7Qm5eS2JZbPgokHrB+tSRK8Kwgethcc3SWEy/dUE8+Tofhkmth
         fXumvUpezsJkJkN2yt76ILm+AK67FE1g44eRgf53Bz5b2/OIpUD9jsNy3SSFBsRA+ZtW
         I7pGunIZGpBDQXYWPLMkJ4oaBDOvccABp/yDxBFyW6K3r+cs2Km+ZnhLygjvqHioJ+2p
         ZWyex1YTAQsDQLWBwldcYf7uoMFzL9qsbH3GZmM8kN7scOhazqKNHIuS5cyZ+Gi92YVO
         1oyA==
X-Forwarded-Encrypted: i=1; AJvYcCUz8fGPM/Hzm69jC9sY1zcJjN/5M0efSzXMWmGDdyvzbxbcN2oWpYQRyxd/LrPp4E63IXg8rN9Y9KQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5dZ6RNwiz2yhsCjzem49WtarU/AVaSAWIAg5UxDwrkEWQCVHg
	xLn+U9LoV+LLjUBuANmPU24KKApy4RklqAVTGZTc6GeL30pAhhCByD6DgliAGBPg5sA=
X-Gm-Gg: ASbGnctdifq3wVUpkQAhpjFyxnb7NrVE6Fca6eFySuTpjXwmwzguG4LHNOOLl4At+ux
	cT7CXWD6GHatyV0rQkZWHUFWhgDD+yYvHWyy3xLOKj6UmZDPy9caxdTbDPlFtn4rO2kxQiaj6yb
	fIssuk80E5oHACxQibt3J6X1mQhTKa7SXPN6QzDr4wSbknMffb9FlDduiRC0fDqlo5ot4KPgnSf
	o/Esmq2S+RDCm6xZfL4CCqw6+6W5V1oBFc/hxRc75fZF/FVbfJLB/LjPhcUl3MRcJ68Lcbqw3r6
	qrzIbN/nfvMCK/CdQWX4NfQXZn+guXptvd2MZYEevU1mTs373RJt5xiAv1YYSJvxbR2plTZxG76
	Ufk9ohvRjUHN1UIsS2Zp5KHfVAAzlRXYCIEqKxeoaZ6VjWwQu0tlf2tcVO/EXxHQJbpym
X-Google-Smtp-Source: AGHT+IEZAbV+KgYol0es5wU1H/XaJMYEQD5piXhCrk5CG5eYJbQ/P7Tabe2Sowp27pHmGU4M0iKMUA==
X-Received: by 2002:a05:600c:474f:b0:456:1d61:b0f2 with SMTP id 5b1f17b1804b1-459f4fc32fbmr46905455e9.30.1754689427348;
        Fri, 08 Aug 2025 14:43:47 -0700 (PDT)
Message-ID: <0a57848b-c9c6-4f57-befb-195a9766daba@citrix.com>
Date: Fri, 8 Aug 2025 22:43:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/2] automation/eclair: ECLAIR configuration changes
 due to GitLab runner update
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, consulting@bugseng.com,
 dmytro_prokopchuk1@epam.com, jbeulich@suse.com,
 Doug Goldstein <cardoe@cardoe.com>
References: <1283be3b76d76814af244bbca544f6a3b74a04de.1754689062.git.nicola.vetrini@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1283be3b76d76814af244bbca544f6a3b74a04de.1754689062.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/08/2025 10:40 pm, Nicola Vetrini wrote:
> Update configurations to adapt to the new syntax used by the newer
> version of the tool in the GitLab runner.
>
> No functional changes.
>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> This will of course need coordination with me to update the runners
> just before committing the patches, as any analysis done in between will
> fail due to syntax errors in the tool configuration files.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

