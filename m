Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2D88B3A9B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 17:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712894.1113790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0N9c-0001qt-5s; Fri, 26 Apr 2024 15:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712894.1113790; Fri, 26 Apr 2024 15:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0N9c-0001pN-2w; Fri, 26 Apr 2024 15:06:24 +0000
Received: by outflank-mailman (input) for mailman id 712894;
 Fri, 26 Apr 2024 15:06:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LIFE=L7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s0N9a-0001ow-7o
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 15:06:22 +0000
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [2607:f8b0:4864:20::f31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8978944f-03de-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 17:06:20 +0200 (CEST)
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-6a04bae512aso12457126d6.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 08:06:20 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r12-20020a0ce28c000000b0069b58b97ed2sm7917577qvl.28.2024.04.26.08.06.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 08:06:18 -0700 (PDT)
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
X-Inumbo-ID: 8978944f-03de-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714143979; x=1714748779; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aEx5ln2bhdD4y3LvDXLHSkOsgDQ88hhidoE5ke/RJ+c=;
        b=q0mThBkjmAx4GiURKpxahEN7b5NODKCrOelZWYPH5i9ktKWW4fR2qpcFs7y2NRfqil
         YsQLrLAbWSu7tIgLNIHOmX4hZWWzK4FLayh9fdWOyJdcn0+OSIHRW7YuzI3f0PlJxTd7
         LBBlVRtTs+g65GlQaupYB9CpGMqFSZHnsCORY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714143979; x=1714748779;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEx5ln2bhdD4y3LvDXLHSkOsgDQ88hhidoE5ke/RJ+c=;
        b=evxSlvuQXme89fhzkX4Xm0/39GwZuq3W3zdohjmnucSFlJOiH6LgEKKMIkMIRqtL1h
         9XwOY4CB+5sDuVqXRm7jBYWM2qmOZNEpFNM74avz1qjqykTup2dlsfdTfATEBFotOV6p
         VwtTySXue0go4iIp9guuFGcewzP5NnMuhVoU0z+rDZo+xsuUnHQ/DPaCK2p1gjcydNWv
         G2+mShKGLcedaHM27ZImnbjZ5OeA8irvHe+z2JJmzXFfgfOl2opyJAdx2CvkZ6fJ04N7
         AkxDQLGMrE0FRphAqLA1jtA9B+KKijQw3UlXt5zp/259SCB30o8K8j9UVLFfL2fkHwiK
         54IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEdFPry/FWjRHFIIS4RhF9Wz4/ilFjC8r1hGTeneihgVWwDEZFQ09WWW/umUSE/G10wsDkHGqg/6gKtWLKbISVRpVC6meI6pvTG2o0BHs=
X-Gm-Message-State: AOJu0YwVGssyLhLBms+o7LoEos0tiqCiuRwJQxRvff645Ga8bhbbtQU4
	X9VuTp0yrfY1UnPgFxVXCsmg+LRjOgWdHZy8wKrCcszYDHNZhOZbsPjPgNkWgoU=
X-Google-Smtp-Source: AGHT+IE5TbOym3CMg2CnBQ99S6tYPTE4iAOtgr53byEpvcaXJWs2xewr5u8S9nkqmcKBNUJi3OaSbw==
X-Received: by 2002:a05:6214:21ea:b0:6a0:af44:f21 with SMTP id p10-20020a05621421ea00b006a0af440f21mr2041973qvj.36.1714143979037;
        Fri, 26 Apr 2024 08:06:19 -0700 (PDT)
Message-ID: <76b27178-b860-4148-8878-43afc4f042da@citrix.com>
Date: Fri, 26 Apr 2024 16:06:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] tools/xenalyze: Ignore HVM_EMUL events harder
To: George Dunlap <george.dunlap@cloud.com>, xen-devel@lists.xenproject.org
Cc: Anthony Perard <anthony.perard@cloud.com>, Olaf Hering <olaf@aepfle.de>
References: <20240426143231.4007671-1-george.dunlap@cloud.com>
 <20240426143231.4007671-3-george.dunlap@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240426143231.4007671-3-george.dunlap@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/04/2024 3:32 pm, George Dunlap wrote:
> To unify certain common sanity checks, checks are done very early in
> processing based only on the top-level type.
>
> Unfortunately, when TRC_HVM_EMUL was introduced, it broke some of the
> assumptions about how the top-level types worked.  Namely, traces of
> this type will show up outside of HVM contexts: in idle domains and in
> PV domains.
>
> Make an explicit exception for TRC_HVM_EMUL types in a number of places:
>
>  - Pass the record info pointer to toplevel_assert_check, so that it
>    can exclude TRC_HVM_EMUL records from idle and vcpu data_mode
>    checks
>
>  - Don't attempt to set the vcpu data_type in hvm_process for
>    TRC_HVM_EMUL records.
>
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Although I'm tempted to say that if records of this type show up outside
of HVM context, then it's misnamed or we've got an error in Xen.  Any
view on which?

~Andrew

