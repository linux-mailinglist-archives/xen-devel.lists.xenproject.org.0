Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2CF846FF4
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 13:14:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675016.1050197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVsQF-0004wN-0C; Fri, 02 Feb 2024 12:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675016.1050197; Fri, 02 Feb 2024 12:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVsQE-0004tp-Sw; Fri, 02 Feb 2024 12:13:30 +0000
Received: by outflank-mailman (input) for mailman id 675016;
 Fri, 02 Feb 2024 12:13:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WgAc=JL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rVsQC-0004tj-VP
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 12:13:28 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 780ff4e5-c1c4-11ee-98f5-efadbce2ee36;
 Fri, 02 Feb 2024 13:13:26 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a2f22bfb4e6so287742266b.0
 for <xen-devel@lists.xenproject.org>; Fri, 02 Feb 2024 04:13:26 -0800 (PST)
Received: from [192.168.1.10] (host-92-3-248-192.as13285.net. [92.3.248.192])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a170906340300b00a35a659cab5sm832581ejb.179.2024.02.02.04.13.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Feb 2024 04:13:26 -0800 (PST)
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
X-Inumbo-ID: 780ff4e5-c1c4-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706876006; x=1707480806; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GWFDngQiKydBZrvoC97UkAJNkunw9jXVKneYEqNH8/Q=;
        b=RxIq8CXbCcJCt9NYHuDw3Kg3aLFhTonjKZJnybzLhvSI1/cHlGRf62JAwNweaKMr73
         ikezCEkGm92QUXf8PzPViye+W+4DETImiXgPUT46VwetZ/X4KXoHx+4HiU6R5xo6MCov
         eRddQ5mxvPETMbY52ka/Cmu+XI13VIDKYeg70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706876006; x=1707480806;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GWFDngQiKydBZrvoC97UkAJNkunw9jXVKneYEqNH8/Q=;
        b=fcnaG9j5HFJScPTPIO+nBsF9sEUam8xrreAvyz+aBM5RsuHQ639v5jdMReZSfa0Bwt
         zs29OGIwci3DeULFo7ZO2+ftf5/X1elMSrfLT+rjQwau4RP6XVG2JXPj5gKIdGG2SmX/
         CnkK0WSgXRdFbaiGc8AEOYmtgIQffpzrUKyj5pav4BEsjuqo8cTpbSLBkoWoou2kms6m
         Z46554qUHzs3WDDbzZ1FC1tUqFxVYnTZdXnDNAtxYrKJw63fC+JJy6o7RNzU83syCqEY
         r/X+Vov1MVwK4Zd1maBvaDTcgddfbIvj2JmaTNaiFf9eOowH3khynysleb3SmOoTNtot
         pJCA==
X-Gm-Message-State: AOJu0YxCDoKuwrkJ74qh0Gr7/TPKNGNd+qJkmIukN8knog7xNIegla4o
	wGYLML61n6CdWlW/fFQR9LcujhLzvuOd8vIqDS/J6LzNRmEANmo3+fTExj6smrU=
X-Google-Smtp-Source: AGHT+IGUcVMzO69A4hRoVddv0iznUXEm8+YyLbNNAZChAsNQrUwEeagWEbvUJ5tQUNcRJzHEw1ylNA==
X-Received: by 2002:a17:906:1c15:b0:a35:7132:26d5 with SMTP id k21-20020a1709061c1500b00a35713226d5mr5384692ejg.63.1706876006313;
        Fri, 02 Feb 2024 04:13:26 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUEtlZqQmBcMybdKlK5eyJuAKksfRctfHGdIvPslYibFdpAklSAstj6g+MpCu0rSZ6GOjmNr+2xx4fPjBaylrybO86H3NQL9bfYe+s+o3RuF0mJ/rYLKuM0lDPRDipwzJfcRQj8
Message-ID: <ac612937-bb9b-4838-a69a-0a6b5967889e@citrix.com>
Date: Fri, 2 Feb 2024 12:13:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/CPU: convert vendor hook invocations to altcall
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <27d828d2-fb4b-41fe-82e8-90720bd9ff8f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <27d828d2-fb4b-41fe-82e8-90720bd9ff8f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/01/2024 11:00 am, Jan Beulich wrote:
> While not performance critical, these hook invocations still want
> converting: This way all pre-filled struct cpu_dev instances can become
> __initconst_cf_clobber, thus allowing to eliminate further 8 ENDBR
> during the 2nd phase of alternatives patching (besides moving previously
> resident data to .init.*).
>
> Since all use sites need touching anyway, take the opportunity and also
> address a Misra C:2012 Rule 5.5 violation: Rename the this_cpu static
> variable.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> With LTO it might end up necessary to tag as __used more than just
> "default_cpu".

Why is it even needed here?

LTO can't rid early_cpu_init() of the default clause, so can't make
default_cpu unreferenced, I don't think.

> Perhaps __used would better be integrated into __initconst_cf_clobber,
> to be independent of the compiler potentially eliding structure
> instances.

Maybe.  I guess the issue here is that the tools really can't see the
connection between being in the clobber section, and alternatives going
and making a modification.

~Andrew

