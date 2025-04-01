Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 580D1A784B7
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 00:29:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934866.1336457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzk6G-0002sR-73; Tue, 01 Apr 2025 22:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934866.1336457; Tue, 01 Apr 2025 22:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzk6G-0002qz-42; Tue, 01 Apr 2025 22:28:52 +0000
Received: by outflank-mailman (input) for mailman id 934866;
 Tue, 01 Apr 2025 22:28:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KZod=WT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tzk6E-0002qt-4A
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 22:28:50 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adca464e-0f48-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 00:28:47 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-39149bccb69so5360014f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 15:28:47 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b60a9ddsm15454590f8f.0.2025.04.01.15.28.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 15:28:46 -0700 (PDT)
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
X-Inumbo-ID: adca464e-0f48-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743546527; x=1744151327; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2Gmb1F6DHF04vcoQt+CZ0+WF6QKxkKQAgKdgbUSv2vQ=;
        b=jl4uKoK8UcbxLmlw4NAq1j194sXCzVMvnYtIF7+/hvp/t1BZzlp2veNtfi+KHYZO8d
         odrnc1wGiwGAJ8UMWaJxCh08aFRzSO6ljft8w9cYgFrPDhaVHQphQgdy1z+pBPr+O1Rf
         hGtlAE71e5mQ4J4NP36D709rhuIiAWODQAG6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743546527; x=1744151327;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Gmb1F6DHF04vcoQt+CZ0+WF6QKxkKQAgKdgbUSv2vQ=;
        b=C1iPfpE3U9LyU0m/aEVf1pxI2RdmnZ07fpSB/soASwE96pWYkCNKpsmxct4yANBNOi
         m+eqPa5HBbfnlmMrzXiw65S4PNQf6qLfgaLVg341HL96gc7Q2SmCIbBCRHuAD+ERDrX2
         vAln9sJhR8RZ5r48Xab43u8TztzicdXSzMOGArrZ24wYbX6+PlFJb3FkhjBaZUdYWiMu
         51OQP9Ly8ENEIqmZ4ZeIy24lqPwF07wDNv++MSwmhbKcJVpCg63uWGPpvgW8acO1lnt4
         bBofqkQWI08xlKC34rZSE2u4aDg+SZUULWJJW7G9awlOkpRh514lnMoGlOuv5ek8iTs/
         kGeA==
X-Forwarded-Encrypted: i=1; AJvYcCVJepjKB0j34ioeoyDzIIW2HnvCFo2wMYTqi4B6Y/Omqn+FtUD2fRmMekAG+3PIiOeCSN7lkOCPYDI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzcDqnmLGLgHEvgB1iGzbPdfXUXluArNfFl7NOvqMK58HTLuQ7
	gbppeHSHGvjuBz1ZL7gCzbaAPpktZz6nono429LDbsC/A01ZIC20RjJloBquUF4=
X-Gm-Gg: ASbGncuWlAbhNEFdFQJSfvJ7Sr344pEv7yb1gM4dgKnAWgOKnqMMH/SOvMiqhkH/7S5
	QiLUJYO++4X9unF++KeK/M1vFhCI/gKvLY9j7gnpg6I+OXNG2Qc6+vqb0eMZasUqzUjtvq6PQOT
	aybP9J9dLLbtpIqgny7cfyl9W1n25kgO7CeJYZpkqzHLtulXUoGVHT+u2u7lwstiwuy9oBIPLhW
	h6uS4VxJ5mM69AR7KmeuKlF73QjpFL/NhvVGkmRBo1m/jeXEWGtss1F4EqYO5KV+a2fHer7Yk1a
	Ymd02+y87o371r3n+N3LHtmlHFd+K74mrbWPwIweVmvmXxviM/hTIbE8EsBq7DwcfIagvbAzj0c
	HVMq+MtM4dQ==
X-Google-Smtp-Source: AGHT+IGAZIItCNEWZSso9ZOs4K9nL4V8LczqJYRLcdA8ThLy6YVLSIA1WSZgY6rpkr5C/Jl/3kCjrg==
X-Received: by 2002:a05:6000:4203:b0:39c:1f0b:8f6f with SMTP id ffacd0b85a97d-39c297538f4mr156922f8f.24.1743546527194;
        Tue, 01 Apr 2025 15:28:47 -0700 (PDT)
Message-ID: <86249b96-ae02-41c9-9aa9-08958b26b87a@citrix.com>
Date: Tue, 1 Apr 2025 23:28:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] x86/asm: remove HAVE_AS_CLAC_STAC
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250401222105.79309-1-dmukhin@ford.com>
 <20250401222105.79309-6-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250401222105.79309-6-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/04/2025 11:21 pm, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
>
> The new toolchain baseline knows the STAC/CLAC instructions,
> no need to carry the workaround in the code.
>
> Resolves: https://gitlab.com/xen-project/xen/-/work_items/203
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

