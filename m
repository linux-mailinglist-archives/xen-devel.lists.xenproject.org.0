Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4C086ADE1
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 12:45:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686497.1068637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfIMx-0007Id-AS; Wed, 28 Feb 2024 11:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686497.1068637; Wed, 28 Feb 2024 11:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfIMx-0007Gb-7a; Wed, 28 Feb 2024 11:45:03 +0000
Received: by outflank-mailman (input) for mailman id 686497;
 Wed, 28 Feb 2024 11:45:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIhW=KF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rfIMw-0007GQ-DA
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 11:45:02 +0000
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdffc24d-d62e-11ee-afd7-a90da7624cb6;
 Wed, 28 Feb 2024 12:45:01 +0100 (CET)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-787bb0d85eeso336684685a.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 03:45:01 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j12-20020a37c24c000000b007872b549a89sm4499431qkm.41.2024.02.28.03.44.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 03:44:59 -0800 (PST)
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
X-Inumbo-ID: cdffc24d-d62e-11ee-afd7-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709120700; x=1709725500; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T2AITKqOVUg1v9b8sdlxfW9BrUJXH6ZaTM0gzMJSIFY=;
        b=fOEEAsu3gkHsNG7ALuyihsIiq5WHLxEap3xg2N2RhG+WycokRrwpcTvnigh6fREsAY
         h3PO85VZucH8rXGrLiVpiZCh6ly/f2r0RSLY61pTTYAd84dP++yG1MSOQQuHfbtD79Eq
         oq/qW2q18xloLS2f5ZGJaO235P8ASOfv08nAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709120700; x=1709725500;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T2AITKqOVUg1v9b8sdlxfW9BrUJXH6ZaTM0gzMJSIFY=;
        b=FYLu1q7zEIwMvfvTiGWQg+2aZmUq+Olg52uunpIYRMJ/IGMYGlUh8G3L93r0kmP1st
         TlTIhIuhYrrAiyz96cE2mCuY+8k7kt0uHu1nTh046vKF+SL38kcr4aVaGCuYWtOFmVAV
         hcGRcNhm54OxD5CzP+9JohSOzmZ3JtAzJ1eAZoCAaKRT+e/gTJoQbsn3YR463+5VA3mJ
         dsh6lP1suaLsrFL5n+6NZXr+7jjrDo09eGAxhPYP+Bhkm26VXiVw8wQMMEqnuei86lOT
         JpM49ANUfmqV1AG0IQ5ljQgBThfUc09Yq7iGZwVEwQPys98hegLYVR5uwUOfq5x0yinG
         KqGg==
X-Forwarded-Encrypted: i=1; AJvYcCXm4j7omhN0gaf6H6FktepI6K4c21jmqggLIrLqtGojNt5YYJR0lA0iTN55GDjPtTbymzYd7yKO3mD1OHPYaTDMYo58BmZH9v9Ty6bHH7k=
X-Gm-Message-State: AOJu0Yx5kqbN6eeRLZMQdCZyV0qILEqN7GSxONEv8k2OEt7PIywYIbGe
	eoywv67qINCHXlBpazK2JWofcoxjYG5Eh2Uyq5nzj+cwFl+TD0xeQuqGoU7rd/k=
X-Google-Smtp-Source: AGHT+IH8epyiw6KAhOoQIKwNU9v/4Vp0yj8aCewbC6fKssBADbv3N7892yX7ldqlHs8onHgVibFDIg==
X-Received: by 2002:a05:620a:ec4:b0:787:c4bd:2460 with SMTP id x4-20020a05620a0ec400b00787c4bd2460mr4511405qkm.36.1709120700324;
        Wed, 28 Feb 2024 03:45:00 -0800 (PST)
Message-ID: <48b48de3-b0e6-4294-91c5-cade0a72c3d1@citrix.com>
Date: Wed, 28 Feb 2024 11:44:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: preparations for 4.18.1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 Kelly Choi <kelly.choi@cloud.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
References: <7dc621a0-924c-499c-86c1-c35ec1f34ec2@suse.com>
 <ca4fe67a-3efd-4ce5-b37d-e68b1bf4c1a7@citrix.com>
 <3e131a4d-652a-4759-bf8a-2564b6c3859e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3e131a4d-652a-4759-bf8a-2564b6c3859e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/02/2024 8:27 am, Jan Beulich wrote:
> On 27.02.2024 15:57, Andrew Cooper wrote:
>> Looking at the XenServer patchqueue, a couple to consider but nothing
>> jumps out as critically urgent.
>>
>> b6cf604207fd and 098d868e52ac as oxenstored perf fixes, although there's
>> one incremental (non-functional) fix I'm still waiting on an ack on. 
>> The backport to 4.18 is trivial.  The backport to 4.17 is miserable but
>> I've already done it.
> I wouldn't normally consider such for backport, but I'm not opposed if the
> oxenstore maintainers agree (now Cc-ed) and if I can leave putting in these
> two backports to you.

I'm not overly fussed.  On our side, it came in as a bug, but we also
have scalability limits specified where upstream Xen doesn't.

>> cf7fe8b72dea which is the CPUID rescan on microcode load.
> This is already there on the 4.18 branch, and it isn't applicable to the
> upstream 4.17 one (I assume you did backport the commit referenced in the
> Fixes: tag to your XenServer tree).

Ah yes.  The rescan raw patch has been in our patchqueue since 2018, and
I keep on forgetting how poor we are at getting that work complete.

Sorry for the noise.

~Andrew

