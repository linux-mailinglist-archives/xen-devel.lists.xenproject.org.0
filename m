Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1378725AF
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 18:31:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688874.1073580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhYby-00033N-Jr; Tue, 05 Mar 2024 17:29:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688874.1073580; Tue, 05 Mar 2024 17:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhYby-00031L-Gr; Tue, 05 Mar 2024 17:29:54 +0000
Received: by outflank-mailman (input) for mailman id 688874;
 Tue, 05 Mar 2024 17:29:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sXiD=KL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rhYbw-00030z-Ls
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 17:29:52 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f763c41d-db15-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 18:29:49 +0100 (CET)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-7882e94d408so160983185a.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 09:29:49 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 c11-20020a05620a164b00b007882c4a273dsm1930017qko.128.2024.03.05.09.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 09:29:46 -0800 (PST)
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
X-Inumbo-ID: f763c41d-db15-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709659787; x=1710264587; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DPgb3b1v+essC29DVEvEo1M5JN3RWeEK3t6EvjJlEYA=;
        b=EnqIn49pb5eHOY//JTIaHQy6Huaxc8byyrr5NN3wZsivSXLK+GrgwvYSoJ6jkf4yVI
         zdZnnFJUnS0sflpZdWck5Cwg7i03MZQIZRTbY0ZhPDhWvuUseltW9eVoc2XOP8HR9OIo
         JvdtW9RSN2+mWob6qo2SD6OCfLCmcQ9wRNAgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709659787; x=1710264587;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DPgb3b1v+essC29DVEvEo1M5JN3RWeEK3t6EvjJlEYA=;
        b=Lr8TcrGuHe/YuwLb90Jo/HT+S4YevT5rjxUsReTF8ctPvncy0jXK+YnLIKKTw+anyo
         NEoxGIh+/9h5ZqaOqTOH3gPmzGuW/bJ+9kVkR6VaoyzzTMVMBBFrIwb7loPiCcTmsyfY
         d0sGYaTjYH5Nxg91VwGFgFxyu54iMBOeKOa4EWvH6oXWjMlASk/mZ8P2HeBvTQNf8ObB
         E5nkPLBCnXGxksefajMv46hkCDyvgylOAwa0lgTgTXrlWZbbaP5/aV8vaAT3MZEQrKZv
         MzTbiEXL7X9SlnO2OMBwU2FtQQ6vXjJghfArxlYFRClNqg7R1pqQRAUrfxrF4hEKcbtg
         RN7w==
X-Gm-Message-State: AOJu0YzhmhjnOFNgOq1u+wwphbSb3NTpGbYeIDmCogjArOI7nmTwNeI4
	05QKBcNDTR2wBSc3+vyNdbtuALDZj/ALuAhZKJhjCx1VDi1DzpOjJPHutCR0TePFSVH51JJxTZq
	c
X-Google-Smtp-Source: AGHT+IGsNH3IV8t4buHHz5+Y1t8P0/DmYCk6KYG3uwBzTNlCrAekWUbVz85diLSOyOpUHgqvYB/UQQ==
X-Received: by 2002:ae9:e418:0:b0:788:1909:63bc with SMTP id q24-20020ae9e418000000b00788190963bcmr2493890qkc.51.1709659787152;
        Tue, 05 Mar 2024 09:29:47 -0800 (PST)
Date: Tue, 5 Mar 2024 18:29:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] automation: introduce non debug clang based tests
Message-ID: <ZedWiO79LqxaQwoE@macbook>
References: <20240229095529.17723-1-roger.pau@citrix.com>
 <20240229095529.17723-3-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240229095529.17723-3-roger.pau@citrix.com>

FWIW, this is not tied to patch 1, so can go in independently.  I
think it's a worthwhile improvement.

Thanks, Roger.

On Thu, Feb 29, 2024 at 10:55:29AM +0100, Roger Pau Monne wrote:
> The generated code between the debug and release builds can be quite
> different, as a note 2ce562b2a413 only manifested in non-debug builds due to
> the usage of -O2.
> 
> Duplicate the clang based test in order to test with both debug and non-debug
> Xen builds.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  automation/gitlab-ci/test.yaml | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 8b7b2e4da92d..dedca794b257 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -422,13 +422,20 @@ qemu-smoke-x86-64-gcc:
>    needs:
>      - debian-stretch-gcc-debug
>  
> -qemu-smoke-x86-64-clang:
> +qemu-smoke-x86-64-clang-debug:
>    extends: .qemu-x86-64
>    script:
>      - ./automation/scripts/qemu-smoke-x86-64.sh pv 2>&1 | tee ${LOGFILE}
>    needs:
>      - debian-bookworm-clang-debug
>  
> +qemu-smoke-x86-64-clang:
> +  extends: .qemu-x86-64
> +  script:
> +    - ./automation/scripts/qemu-smoke-x86-64.sh pv 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - debian-bookworm-clang
> +
>  qemu-smoke-x86-64-gcc-pvh:
>    extends: .qemu-x86-64
>    script:
> @@ -436,13 +443,20 @@ qemu-smoke-x86-64-gcc-pvh:
>    needs:
>      - debian-stretch-gcc-debug
>  
> -qemu-smoke-x86-64-clang-pvh:
> +qemu-smoke-x86-64-clang-debug-pvh:
>    extends: .qemu-x86-64
>    script:
>      - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee ${LOGFILE}
>    needs:
>      - debian-bookworm-clang-debug
>  
> +qemu-smoke-x86-64-clang-pvh:
> +  extends: .qemu-x86-64
> +  script:
> +    - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - debian-bookworm-clang
> +
>  qemu-smoke-riscv64-gcc:
>    extends: .qemu-riscv64
>    script:
> -- 
> 2.44.0
> 

