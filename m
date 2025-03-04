Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E17A4DE8D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 13:58:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901087.1309058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpRpq-0000Lk-On; Tue, 04 Mar 2025 12:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901087.1309058; Tue, 04 Mar 2025 12:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpRpq-0000Jl-Ka; Tue, 04 Mar 2025 12:57:22 +0000
Received: by outflank-mailman (input) for mailman id 901087;
 Tue, 04 Mar 2025 12:57:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Z5M=VX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tpRpp-0000Jf-3u
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 12:57:21 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34baa52f-f8f8-11ef-9ab4-95dc52dad729;
 Tue, 04 Mar 2025 13:57:19 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43996e95114so38076955e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 04:57:19 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bc1b5db02sm73611105e9.19.2025.03.04.04.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Mar 2025 04:57:18 -0800 (PST)
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
X-Inumbo-ID: 34baa52f-f8f8-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741093039; x=1741697839; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U7+8yf+kO6SCQF2Ra8gqCxZZwPKkRR/MGi/VZcvIARs=;
        b=mrslzGZRj9GJRWJqPGgV/cbnBtMha438+XpaWB/YJYWrHlhvINBXq4HdZUfye4EIkF
         Ajc7+ksDccouqZAz5xrLHy260g2X23cQh6w51MR8vk5VCCjPB6TURX+xVMU+7/UDaW/L
         bGyN0L30fwhvA/SMVjCp7qEn9VmgpJhKXyQD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741093039; x=1741697839;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7+8yf+kO6SCQF2Ra8gqCxZZwPKkRR/MGi/VZcvIARs=;
        b=v+z0Be/PlTaibaR1aRSISHvQVkF6k0aVer6qfh460b0GTe+2KEgeveV+5umv6//wiw
         19mIc1sD3IgHGCfG79iYQX9xfr5v/LAufn/+6LTkJYL/3L4mR6SRyD7HXTiEWYqI+JJy
         biveT7qNEV5u0fkK7v3re+ti5LFttIlaJiTU25bo0Hpwi9ucZzd2doBdhB0S2VxLOL+e
         iiMzy1FOPvI8Xjg5C94wcHorlbhXjDO2kbD9fpFO7yDZocDtSKu4XDMW6RnkorY1qItV
         5n3SV3IEyeHhkcOBUdG6KgXuMJK5MkGgMqZhv+Xh+WN1BvhQawUZ/+5jWGawRrVr5kgR
         1ChQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAB4COGKU9lMr5HFRuTsMIbfgz/SATriqrJm6D0lVnXXIlc9CrBjnVpTnxtZGiSermOnOJd7HPnCc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSHN668Qi0uPKgnbtetNfokuf05N1KY2GPyZNpIWPZndIFUXEU
	x1tG/6fnmdiK0EvYxRQ6jbuSitB13+/eJ5q+Mqla3epfnLAUzrgGOcIMuHUTZWk=
X-Gm-Gg: ASbGnct/T/ws3f19A8xirr98Ir24omnlq+X/hJewAvY8Qk6hY0Bbr7vXiqExnB8UEs2
	ZdfvHJPVvmKUYiqWRjTb8mdBoa980xgW09kSl5w/v3sy29mlWJgJzaaVa1QmPXtPErL7GQfM2zm
	0KK3Ml8VglYhGeQz7Mz4m9Zk4l9WEwVpqwTXierk4erP7RIvV7EqZbe7c2UtjkbQwzpwON6toKS
	DDyTZWbIZ8tXraAqa+CBgZXuo66eMQ76pM2a4XnemWaTKgcnHt61cBQ5VPCVo4AZs2PBOY+NVdE
	8WhCsCVXxW87noX8DAHWLgTbHuJ540qZFRlHiNA1vRLGmdiYB9/rUZhLsc4Gu/W8VHfqnMxRBVZ
	BBuoGJTaR
X-Google-Smtp-Source: AGHT+IGpEXObqtEyqhFxe0BWsVsyHRDkvfhulLDJHKu+9Dr6B9xfNzI9DQfzIob9L3J5BbOdkSbsxA==
X-Received: by 2002:a05:600c:1d05:b0:43b:c5a3:2e0e with SMTP id 5b1f17b1804b1-43bc5a3301emr58830365e9.5.1741093038709;
        Tue, 04 Mar 2025 04:57:18 -0800 (PST)
Message-ID: <eb27f4a6-6326-43a8-9be9-b8b13e0de244@citrix.com>
Date: Tue, 4 Mar 2025 12:57:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] common: remove -fno-stack-protector from
 EMBEDDED_EXTRA_CFLAGS
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20250217024848.3059635-1-volodymyr_babchuk@epam.com>
 <20250217024848.3059635-2-volodymyr_babchuk@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250217024848.3059635-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/02/2025 2:49 am, Volodymyr Babchuk wrote:
> This patch is preparation for making stack protector
> configurable. First step is to remove -fno-stack-protector flag from
> EMBEDDED_EXTRA_CFLAGS so separate components (Hypervisor in this case)
> can enable/disable this feature by themselves.
>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Now that 4.21 has opened, I've picked up this patch as it's ready, and
not overly intertwined with the subsequent patches.

~Andrew

