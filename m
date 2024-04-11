Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A46948A155F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 15:16:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703914.1099868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruuH2-0008Jw-V3; Thu, 11 Apr 2024 13:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703914.1099868; Thu, 11 Apr 2024 13:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruuH2-0008H0-R8; Thu, 11 Apr 2024 13:15:28 +0000
Received: by outflank-mailman (input) for mailman id 703914;
 Thu, 11 Apr 2024 13:15:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eZ5N=LQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ruuH1-0008DM-He
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 13:15:27 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e16dfb9-f805-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 15:15:24 +0200 (CEST)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-78d743f3654so161902885a.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 06:15:24 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c5-20020a056214070500b0069b4f48003bsm499892qvz.100.2024.04.11.06.15.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 06:15:22 -0700 (PDT)
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
X-Inumbo-ID: 8e16dfb9-f805-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712841323; x=1713446123; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BDfkR508UhuMOpZ5Vqs7Nc/5Ex0M8PSv8lobDUUe+Xg=;
        b=M1HfHZttpNVR2sXlgXq9OZQLv/y9GS2vcmaX6flVLx8Ik9UJ8nMEMiDchbIde4WSie
         9RYNIy6Bg551Az149SSggV+uf6xRyL4QwT1aBCk/Jq0DcMZS2+p9xRFYptv2x9cY7fxz
         zBBuWz3zqPkB3u1rKKm0MbzRz7BfnbTz5aFt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712841323; x=1713446123;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDfkR508UhuMOpZ5Vqs7Nc/5Ex0M8PSv8lobDUUe+Xg=;
        b=pwV9aLPDX3Ka+S5uMZqVcWsbRAJblTZn2c3BOqjHab9wuL1oeuyMdaC3xs2dbKDJBv
         gz76BA4y/EDdQXgcb7V3EH6vCSF17/MFFlfPPRMtcIavEM0GQmtN+updZ+yepNTuYpUG
         djYZBBC6L5Punpur60lbP/U170ewC2b0QnbzIgEhSNqY560I71UAFe0afv/xvxFp8p1X
         pPr6B72eGQdLctZ7OJfuHQjGjXgmrViiGKQrdRuROUp6VBdAaegN176VJUC/qslVn/Qo
         HIFSUnRcyXVNl9QzxrLWyaDzu15TaqxMiQWDoUBs2YDBT4BvZw+Pu7ZmUeZit8D8ITpl
         w68Q==
X-Forwarded-Encrypted: i=1; AJvYcCVq3lbG10wmDS39+5AU4Cr8eF5jyLqkxIEaoQ2C+C5DT7+DvPwOj+udMI5jXch8ntRFZBIEurM81+rSmSiM2qmidL/Ysn84s71vlZLGzJM=
X-Gm-Message-State: AOJu0YxR+taGWEhaUoLMraetamLPzGL0w0pNHClHAVp+2BHfiQTfmoka
	8HcA8JzwNbsSNJCc/077F6d7+VY7mL9VtJBMZ9kZzXr7EZPQgHKHo671EF77Kzk=
X-Google-Smtp-Source: AGHT+IF4crVf6zgz8w+PYVeN+wUneb6+HHniyIhVd+tYy13GwcwL2vXdmVXc9s5qo+jOa76qjFo6uw==
X-Received: by 2002:a05:6214:5290:b0:69b:2703:8f37 with SMTP id kj16-20020a056214529000b0069b27038f37mr5073814qvb.8.1712841323152;
        Thu, 11 Apr 2024 06:15:23 -0700 (PDT)
Message-ID: <0d31894c-2541-4187-94f2-0ca88bace67c@citrix.com>
Date: Thu, 11 Apr 2024 14:15:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/acpi: Allow xen/acpi.h to be included on non-ACPI
 archs
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <20240405182031.396528-1-sanastasio@raptorengineering.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240405182031.396528-1-sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/04/2024 7:20 pm, Shawn Anastasio wrote:
> Conditionalize xen/acpi.h's inclusion of acpi/acpi.h and asm/acpi.h on
> CONFIG_ACPI and import ARM's !CONFIG_ACPI stub for acpi_disabled() so
> that the header can be included on architectures without ACPI support,
> like ppc.
>
> This change revealed some missing #includes across the ARM tree, so fix
> those as well.
>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
>  xen/arch/arm/arm32/mmu/mm.c     | 1 +
>  xen/arch/arm/arm64/smpboot.c    | 3 ++-
>  xen/arch/arm/domain_build.c     | 1 -
>  xen/arch/arm/gic-v2.c           | 1 -
>  xen/arch/arm/gic-v3.c           | 2 --
>  xen/arch/arm/include/asm/acpi.h | 1 -
>  xen/arch/arm/mmu/setup.c        | 1 +
>  xen/arch/arm/psci.c             | 1 +
>  xen/arch/arm/smpboot.c          | 1 +
>  xen/arch/arm/traps.c            | 3 ++-
>  xen/common/sched/boot-cpupool.c | 2 +-
>  xen/include/xen/acpi.h          | 8 ++++++--
>  12 files changed, 15 insertions(+), 10 deletions(-)


Pre-push testing found a randconfig error caused by this: 
https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/6602857882

Henry diagnosed this as "arm asm/acpi.h includes the arm asm/setup.h
then asm/p2m.h then finally asm/current.h".

pt.c uses smp_processor_id() explicitly, so should include
asm/current.h.  I've folded the following delta in to fix the issue,

diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
index a7755728aeda..da28d669e796 100644
--- a/xen/arch/arm/mmu/pt.c
+++ b/xen/arch/arm/mmu/pt.c
@@ -11,6 +11,7 @@
 #include <xen/sizes.h>
 #include <xen/vmap.h>
 
+#include <asm/current.h>
 #include <asm/fixmap.h>
 
 #ifdef NDEBUG


But I suspect this may not be the only instance.

~Andrew

