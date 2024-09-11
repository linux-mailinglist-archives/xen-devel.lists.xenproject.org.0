Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B8797546A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 15:48:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796652.1206398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soNge-0005Dm-Bq; Wed, 11 Sep 2024 13:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796652.1206398; Wed, 11 Sep 2024 13:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soNge-0005B2-9F; Wed, 11 Sep 2024 13:47:12 +0000
Received: by outflank-mailman (input) for mailman id 796652;
 Wed, 11 Sep 2024 13:47:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9RHL=QJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1soNgd-00059f-HX
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 13:47:11 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 571ac0d3-7044-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 15:47:09 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8d24f98215so632505066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 06:47:09 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25979fa3sm608373866b.71.2024.09.11.06.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 06:47:07 -0700 (PDT)
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
X-Inumbo-ID: 571ac0d3-7044-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726062429; x=1726667229; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7GKXn5AEPeBxuf8ORPgVxUssFF2U8bk8zpNsLkoCYB4=;
        b=BuY6mA9Dn4xVN4+Ze+dNsSVI5ypmUHDwP5ZkwsR3+oE7J6JUNFLmGeiX65wNOwJXm3
         PZE30Mn28YwZ6eeQXqEcmxJwd0GxN+b3HKsAgVZeJRoR89XwxatCAk4hfw9lJZw+bPWp
         kN3P8xYqTDA0rCWEjCEpAMUGYbLa3EqVFYhkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726062429; x=1726667229;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GKXn5AEPeBxuf8ORPgVxUssFF2U8bk8zpNsLkoCYB4=;
        b=v1aocXnXzVU0jZVW0ETyisqiGeXPUxXs5+txFB+jyFNP5oEaodDpVO188PNtQapCXa
         XmLhYV5s8YGLj/0tBxoUGwUwpi1TkZIFPYMbIgKRI7pQgBUTOVFP0tCDPreoEFa2kMQI
         3guSy6MpDKBvGEQ20fY0XmZIjmnSpIkkU1krje1vY9QDhIm/KJll9Vhh0UToME2jIJ2l
         X4aYdc+MW+EBVtPRGNm/4fUuhJJvaXK59DKJnsvHYufPwJ/T5De98fpN7FBG+vqLwzb/
         XGLRvrHuvcwpdPIktGQpMlqvPx6/h0fAR4Gyh0f8SXr16Fi4MXxb+UzzX3awG9+uX6Xj
         WnWg==
X-Forwarded-Encrypted: i=1; AJvYcCVF1gJyGuYebdcqe0tl4gH2iW6ab7+NMoQHX2i/iaLLxyHU+udrV8vs5ljBwVNNk5ZoenKGgJ8XniQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx697eOfKmpDkfH/svs+XnBLkEjVbJuKezl/tyzSlbbN0He4E8R
	EWwixUKsQbm289LLRzIlZApJvLMsWYheGKGqsifSH6nACu/T9n7MeKu0jP37cFc=
X-Google-Smtp-Source: AGHT+IGZLrS6/7edmtQViz2nd6oLg0/5kwyiU9pXUgex3fABayLtGiV5OcKpiFtLQ93HxNJ44cgiNg==
X-Received: by 2002:a17:907:e8e:b0:a8a:8cdb:83a7 with SMTP id a640c23a62f3a-a8ffae0483fmr381333366b.54.1726062428149;
        Wed, 11 Sep 2024 06:47:08 -0700 (PDT)
Message-ID: <9c4a3427-1306-416d-92ce-ca8f2ebc3ebb@citrix.com>
Date: Wed, 11 Sep 2024 14:47:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] x86/HVM: drop stdvga's "stdvga" struct member
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <dc3faf7d-0690-46e6-8fbc-67a177a1e171@suse.com>
 <08544fc6-bca0-4c69-8f88-3745ed351d53@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <08544fc6-bca0-4c69-8f88-3745ed351d53@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/09/2024 1:28 pm, Jan Beulich wrote:
> Two of its consumers are dead (in compile-time constant conditionals)
> and the only remaining ones are merely controlling debug logging. Hence
> the field is now pointless to set, which in particular allows to get rid
> of the questionable conditional from which the field's value was
> established (afaict 551ceee97513 ["x86, hvm: stdvga cache always on"]
> had dropped too much of the earlier extra check that was there, and
> quite likely further checks were missing).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

