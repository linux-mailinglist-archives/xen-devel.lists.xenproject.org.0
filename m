Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D59A9711E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:37:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963137.1354192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FgR-0007nw-1G; Tue, 22 Apr 2025 15:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963137.1354192; Tue, 22 Apr 2025 15:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FgQ-0007lH-UE; Tue, 22 Apr 2025 15:37:14 +0000
Received: by outflank-mailman (input) for mailman id 963137;
 Tue, 22 Apr 2025 15:37:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9r0M=XI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7FgP-0006Us-W8
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:37:14 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a90402aa-1f8f-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 17:37:12 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso53184395e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 08:37:12 -0700 (PDT)
Received: from [192.168.86.29] ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5cf2easm178560685e9.31.2025.04.22.08.37.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 08:37:11 -0700 (PDT)
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
X-Inumbo-ID: a90402aa-1f8f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745336232; x=1745941032; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4M3NQO1R9Y+RPywxsZg+mVkXKrfH+NxzjZBUECv19gM=;
        b=YWn3u4oEP5zGaMqhqURTMoe2STOCS1eq3I4tvtU9KXm12sny5JhdMqAqzyTTk76q3H
         gkTyCNsIAx9tQw3PhxLloCGyt9sD0XD4V4bDnfPHaeTkbk36uvCXCYLZKSdwx1AukTFk
         xpDseCY00/S53oK5aAwjrDWOpxUOCuvrUdoxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745336232; x=1745941032;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4M3NQO1R9Y+RPywxsZg+mVkXKrfH+NxzjZBUECv19gM=;
        b=OCVsxOXw9VFic9WsSId2aVmGYa03RWSea7+l/DLvXORPJ4HZsfl37taTFglMmrfPZY
         oXqoqp4Bpz7Qf1wf0n3kRZkqIypc9cLj2gB2MWs9J4+ZDilamvlBVRwF+GA7mdNHIf+e
         9AmzXpawPMXxnhI3CmN4izjIpfoe4z24P+VmNJfZ2UsFcMDGYhtk5d2LVR1kNUtAodlh
         zrwcnAx7t4ElZsrsEV5ahB+ERnA5d5E64SEgI+FGM8p2NodPDk5St5A21q2hFlfIEhlH
         vuSFUNrIr1FTAuPldrioL3KqAkJcgJhmwzqqCLb61f9JCUOaemaGxiPvWnj4StIBJHfv
         g18g==
X-Forwarded-Encrypted: i=1; AJvYcCXfQhJJZLtXr4QYLMd8nWPUS6f+0rdtPkm1E7FieD9CVvaK2BV5pEp79HvV3cRSeGQ2IxcNI4Cktac=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHCYXE7a4ozbxMDZrA7ULYLx5pLP2RQyzjmKzNkYTnktyrFpAJ
	RQUU8gxSx+D7Ovk5xD3HzR2d4Kn/dbIkWko9Jg1d03maCG3qHPn54YR/nK3m0ro=
X-Gm-Gg: ASbGncuP4UzVp0jNSBhj3M9mWiQNcUTyZ2fFT2ws+1XuQsJCuw8fpVDNJvFpgRpRnwF
	4m001+BYg01D7IPWVevSZllPotsUkbqbKEG6tita9qKSj9kX9w2ulah0UtrbeUrf3KrlAolBSvl
	R2bFfAYyYZxr9ENO9SvTeDHCtUsjqLy6sq2zovfCoyGyrA+kIUrEEjAsJSWDeuH8lsJxMp5sA2I
	66q4MghdVDQn5ytzIGvPCsMq+YE+Qmrxhig13Hy9uaGkoOhtaEBTCR++aHniiFbHCWMl1VmhrZr
	dDJeCuYm/dowvNrWx4VLBq5HgBwN+fbO7DHDedU5Y31kBArHsn7zgw==
X-Google-Smtp-Source: AGHT+IFcxQesg0zcJ/QrkOPfU37o00FmPt/lu6zUa5CggsQV2s1SKWn3CCGK5L0toYo32ruNNuDeFA==
X-Received: by 2002:a05:600c:3d96:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-4406aba6809mr149324465e9.17.1745336231747;
        Tue, 22 Apr 2025 08:37:11 -0700 (PDT)
Message-ID: <233f9fd0-b531-4373-998e-1e7295357ae2@citrix.com>
Date: Tue, 22 Apr 2025 16:37:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/21] lib/sha256.c: add file
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 trenchboot-devel@googlegroups.com
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
 <92b461c8d5981a523293341346274b6cc1b76d9b.1745172094.git.sergii.dmytruk@3mdeb.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <92b461c8d5981a523293341346274b6cc1b76d9b.1745172094.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/04/2025 4:06 pm, Sergii Dmytruk wrote:
>  xen/include/xen/sha256.h |  12 ++
>  xen/lib/Makefile         |   1 +
>  xen/lib/sha256.c         | 238 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 251 insertions(+)
>  create mode 100644 xen/include/xen/sha256.h
>  create mode 100644 xen/lib/sha256.c

I added SHA2 a little while back, derived from the Trenchboot tree.

See 372af524411f5a013bcb0b117073d8d07c026563 (and a few follow-up fixes).

It should have everything needed, but we can adjust if necessary.

We need to integrate SHA1 in a similar way.  Xen now has various MISRA
requirements to adhere to, which requires some adjustments, but I can
advise if it isn't clear from the sha2 work I already did.

~Andrew

