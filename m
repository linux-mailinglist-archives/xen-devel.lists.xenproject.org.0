Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 698F98C1E2D
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 08:36:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719524.1122309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5JrK-00021z-3x; Fri, 10 May 2024 06:35:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719524.1122309; Fri, 10 May 2024 06:35:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5JrK-0001zR-0y; Fri, 10 May 2024 06:35:58 +0000
Received: by outflank-mailman (input) for mailman id 719524;
 Fri, 10 May 2024 06:35:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YvKo=MN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1s5JrH-0001zL-PT
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 06:35:55 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d4195a5-0e97-11ef-909c-e314d9c70b13;
 Fri, 10 May 2024 08:35:54 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a5a157a1cd1so398883266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2024 23:35:54 -0700 (PDT)
Received: from ?IPV6:2003:e5:873c:a500:6aaf:b7a7:7c29:ae5c?
 (p200300e5873ca5006aafb7a77c29ae5c.dip0.t-ipconnect.de.
 [2003:e5:873c:a500:6aaf:b7a7:7c29:ae5c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b17fb4sm150003366b.222.2024.05.09.23.35.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 May 2024 23:35:53 -0700 (PDT)
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
X-Inumbo-ID: 8d4195a5-0e97-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715322954; x=1715927754; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lxCNtcupovxNdLpa4liNmJ+Aj9ToML7xaMOdcpDzR+Y=;
        b=SF7zVFeIM3i73fgLW6lkyCCl9lxuD99rZsqcGpmQs5NuoDtScuZ1DsaB5NyvM/817L
         liDGX/BoUnaoLy9FmgKaKXi3v5TcYwYVb5sBl4xABsuUphZbIgheN0gtkzEFfPVbMYyS
         x3zfMvkB7GuOHh/18/PHEK0p6JOQvy1BYVxoY6Qzuh4gC24I5GGNesJ6QXeZV5hjNywM
         WH3+VLHCBXXGmnENiUbruoasocZYQU3QMOjO9fBFqQvAp0BOAxdS3aG+kmFxrOWt4IbZ
         NKHxYK5T5RsieX/EQkr9Wwwc6IfS2WIgzUtvwnQ21woK74BGxstq7IEjP+KToeygLqMF
         SAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715322954; x=1715927754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lxCNtcupovxNdLpa4liNmJ+Aj9ToML7xaMOdcpDzR+Y=;
        b=pj+9ARsH0a4zGKok4ePKmxdel2A725+WyXYq6ZWUzrYwAW6eNmH5ZMYkD6N33r7Mds
         j+mByR6RIfQeAM8428WSNavK4Qpr3UOrOpYjn+SEE4/36zwEVhhI7wVGflg03SjSk9/9
         RDOdSjmZH5rRA0rmy5VAq9T5GymXUW2HO3/h4QxGykvwbubSCabWWjh1laIdHWGwkr7I
         HgJgzv8r63V4SgSpLvck9XWkCDhbJXkHkRCAVN2pp7TmhEoLTsIvljNWRTHZf3sm4oZx
         BPmBiXpnGs5HzRA+uO4IBC9Ln15BCZmm7AiSJPnqhWKNaogg/U9V4cP/7hvhiEg1Aiuu
         yWsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZNfDE1DSVkI3BeTrQoeLynL0A/uD8g3UhMbxead8a+tOissvLYxz52JnTMWBz3C8krZDPfeHvlKSVtOdT9xeZLT52vodtsAigvXCXbu4=
X-Gm-Message-State: AOJu0YyYMFJnogqopOh+PCsJMwn86dlMwWGeAFchtAuytchr0eROnQ/G
	8UR2uxatsQMdEtB/9G7UQBOQxSVV89ylmdgHqUtnUvoB9XgBOrXm5d2AyxtgSMA=
X-Google-Smtp-Source: AGHT+IEsYqtRcknYkEI9dadmuP1mmqjZ/X8PJ/ypoow+HFuD3UV69F9PwuJeDUZtGN2n3mzgj3MI8A==
X-Received: by 2002:a17:906:e297:b0:a59:afdd:590d with SMTP id a640c23a62f3a-a5a2d66a335mr85754966b.51.1715322953917;
        Thu, 09 May 2024 23:35:53 -0700 (PDT)
Message-ID: <7bc9a67e-a73a-4c12-9e35-01cb8db27fe1@suse.com>
Date: Fri, 10 May 2024 08:35:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: add extra pages to unpopulated-alloc if
 available
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
References: <20240429155053.72509-1-roger.pau@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240429155053.72509-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29.04.24 17:50, Roger Pau Monne wrote:
> Commit 262fc47ac174 ('xen/balloon: don't use PV mode extra memory for zone
> device allocations') removed the addition of the extra memory ranges to the
> unpopulated range allocator, using those only for the balloon driver.
> 
> This forces the unpopulated allocator to attach hotplug ranges even when spare
> memory (as part of the extra memory ranges) is available.  Furthermore, on PVH
> domains it defeats the purpose of commit 38620fc4e893 ('x86/xen: attempt to
> inflate the memory balloon on PVH'), as extra memory ranges would only be
> used to map foreign memory if the kernel is built without XEN_UNPOPULATED_ALLOC
> support.
> 
> Fix this by adding a helpers that adds the extra memory ranges to the list of
> unpopulated pages, and zeroes the ranges so they are not also consumed by the
> balloon driver.
> 
> This should have been part of 38620fc4e893, hence the fixes tag.
> 
> Note the current logic relies on unpopulated_init() (and hence
> arch_xen_unpopulated_init()) always being called ahead of balloon_init(), so
> that the extra memory regions are consumed by arch_xen_unpopulated_init().
> 
> Fixes: 38620fc4e893 ('x86/xen: attempt to inflate the memory balloon on PVH')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


