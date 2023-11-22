Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5A87F515A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 21:16:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639146.996119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5te0-0007pC-7Y; Wed, 22 Nov 2023 20:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639146.996119; Wed, 22 Nov 2023 20:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5te0-0007nF-4m; Wed, 22 Nov 2023 20:16:20 +0000
Received: by outflank-mailman (input) for mailman id 639146;
 Wed, 22 Nov 2023 20:16:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q+k4=HD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r5tdy-0007n9-7z
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 20:16:18 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd7114b4-8973-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 21:16:16 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4083f61322fso950745e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 12:16:16 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 q19-20020a05600c46d300b004064e3b94afsm499121wmo.4.2023.11.22.12.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 12:16:15 -0800 (PST)
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
X-Inumbo-ID: fd7114b4-8973-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tibco.com; s=googleworkspace; t=1700684176; x=1701288976; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=63umfG6ROvXrows/LhUD3BHDisBQC0AuPxoDkYko8vc=;
        b=S/FXh3b8/QpUXmLLVv3tzvm7MXfh8QlAFTE8sUFjpel9I0s0DPPFuoZSCrtcDZzCFj
         xJCAzLsqb12EsEOr0IYWgCxBNFWIGQvFFsFnukKYkcW01Xt4CUnU756hiBZwPA00aTfh
         bDy/H9NHeGbCMReJ1AI4yHPU0SpE1CjmJ4wFDsjhIWu6r1iXqD6SYogVpZ9cvwjPR8DQ
         Av9Z3cPrnfFu36xEjJs3jcIEA9qSP3FTBSaL5GYgW2aNiK+jnTf2WZ9n45rEnOCTXEM2
         exU8LLyZ+tPHBZIfp52Etfy9rVzF8Ssih2cf6VrWMJeERKW5fPdpUEPiHYOci6Ff7InW
         uihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700684176; x=1701288976;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=63umfG6ROvXrows/LhUD3BHDisBQC0AuPxoDkYko8vc=;
        b=I4Gsc9Iew5JnKGTkkAccZ8VuJmLGHeenvZ+HM0zEl2Wd+5qws0uIx3SlUqIPXQQQwv
         pUFoip1zfrONJkfk/JYFcZYJp0vHOLgeuW5IYg76CzHLTtBk10DarTA+qITZJ+0Kwl6w
         EpcBO7vovxiB1/0vlABkvuHIYTDbYnMrs502/MdBvey+tuJv4Z5RuHDcpKQ/rVrnZ0Vx
         +/h/+li/DJzoqAwAqqMoShlOnnMjKut8A128JNzLGzdveJtPxWNQH+pR/WLHXDBefej9
         SkjyTBvJY9lHOFvQ6wgC8e1TLVQQWSq1sy7IbOj3CXANtnTqfB2BvgnvcBmX7vsRXxPG
         LmtQ==
X-Gm-Message-State: AOJu0YwAq9XdgJgrgsiQ9u7WjJL35r96D0sGT3eujN+RJc4PB6q0snd9
	tRLRRBhCHerLEXnYYC3qmN9EpQ==
X-Google-Smtp-Source: AGHT+IEG3lXF3pWNgKUZCkTYECoP4oBlmVclFSskGE8w/AdLdKGGjFA1YA1No5Gjit0OyNKNPHG/5g==
X-Received: by 2002:a05:600c:46cd:b0:408:4083:fbf2 with SMTP id q13-20020a05600c46cd00b004084083fbf2mr2804299wmo.22.1700684175788;
        Wed, 22 Nov 2023 12:16:15 -0800 (PST)
Message-ID: <72585cdd-756b-49f6-b97f-7bb739217e6c@tibco.com>
Date: Wed, 22 Nov 2023 20:16:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] tools/pygrub: Restrict depriv operation with
 RLIMIT_AS
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231106150508.22665-1-alejandro.vallejo@cloud.com>
 <20231106150508.22665-4-alejandro.vallejo@cloud.com>
From: Andrew Cooper <andcooper@tibco.com>
In-Reply-To: <20231106150508.22665-4-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/11/2023 3:05 pm, Alejandro Vallejo wrote:
> diff --git a/tools/pygrub/src/pygrub b/tools/pygrub/src/pygrub
> index 327cf51774..b96bdfd849 100755
> --- a/tools/pygrub/src/pygrub
> +++ b/tools/pygrub/src/pygrub
> @@ -75,6 +80,11 @@ def downgrade_rlimits():
>      resource.setrlimit(resource.RLIMIT_CORE,     (0, 0))
>      resource.setrlimit(resource.RLIMIT_MEMLOCK,  (0, 0))
>  
> +    max_ram_usage = LIMIT_AS
> +    if "PYGRUB_MAX_RAM_USAGE_MB" in os.environ.keys():

With the .keys() dropped as per patch 2.5/6,

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Happy to do this on commit.

