Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0BD6C9EDD
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 11:04:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515082.797627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgimN-00047y-4J; Mon, 27 Mar 2023 09:04:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515082.797627; Mon, 27 Mar 2023 09:04:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgimN-000456-0b; Mon, 27 Mar 2023 09:04:39 +0000
Received: by outflank-mailman (input) for mailman id 515082;
 Mon, 27 Mar 2023 09:04:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xFYs=7T=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pgimL-0003cf-CK
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 09:04:37 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6548ad1e-cc7e-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 11:04:35 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id y14so7885002wrq.4
 for <xen-devel@lists.xenproject.org>; Mon, 27 Mar 2023 02:04:35 -0700 (PDT)
Received: from [192.168.26.216] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a5d430d000000b002d75ef32032sm17594498wrq.68.2023.03.27.02.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 02:04:34 -0700 (PDT)
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
X-Inumbo-ID: 6548ad1e-cc7e-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679907875;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IeW3JOtl79P4h19QSrAjezOiQKqJvZ5XGjr/mFCgLF8=;
        b=KdPgUcOUttb4VuwP3TS2j+HxDR6qoeXv8hDgEMHfF8nKVpUKGv6KLG6rxR8dexRe4x
         bycDPB6vu67rXAgjz+Rt8/ovlklhiPBj6n4p+7iB2ERg1E/GFJsbuviHMjMAOLUR9EUf
         5J8Sa+5MqE73EnBceXFGBfcxY5Xt/TgOD7f4vNyEhoxYn/J18O4Ssw7C9uOEQP4Z4JM8
         IyRxsyOyr1iORBWFxDtRJf6UZeAJMz08DpzqaGK87bPVGsKq3lyzKsQ43IizJ36ERv2A
         YRrAmNHrdXWZNBxdZVq0rsdCnhXAzQRUY2ZCPMw+VfT1K9QFr+9KMHPccvRbU/8zAQMV
         9Q/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679907875;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IeW3JOtl79P4h19QSrAjezOiQKqJvZ5XGjr/mFCgLF8=;
        b=BhF5VrRereAzH/gHvTL+HwsbFYOf53QcUqUss6Y0giMSD1r804b5+rAUDfJuWgi3+i
         xS3hnCNDi0w7p9YbfvHEElTL7MQXfZB2YQZXl7Pmg8e+xAlVRKooqFYvvNliIohLNJGM
         JhADEYfqz6AneL5OJvCynMv1eWDAdVYM1CLTySJlGvw+F7o5Tj6+7Mb7kQjObmeAz6/Y
         D0NgaclGG6MVrE7sFEsyJw75uX8UqzgFoc66oJHD/wgo2pqnyksuJDdNJlG+812E4Hkf
         kEajJLmrmzUeSduuZMgwp37jFme3mMZYx3sdgx2L+5RFFo/2rbrNac0Xyaz6zxPRPZGy
         UcpQ==
X-Gm-Message-State: AAQBX9eUxd/cbHPHTvIvw0qsiSrvVkzOEQgnyXjenlwhxxyGqRpiDQrp
	vHgzvw0sXoBpimK0vwSzdgY=
X-Google-Smtp-Source: AKy350YNxkfy6IOA56E0WFYwIMXU7I9spsD1DLtgWxU5JCd/dMGUPvsMws1K0rdvEqgYxVdDzVDW+g==
X-Received: by 2002:adf:e484:0:b0:2ce:a938:ecc9 with SMTP id i4-20020adfe484000000b002cea938ecc9mr8877647wrm.69.1679907874447;
        Mon, 27 Mar 2023 02:04:34 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <990111ae-d2ba-5bfc-457d-bacb2b6ffb43@xen.org>
Date: Mon, 27 Mar 2023 10:04:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Reply-To: paul@xen.org
Subject: Re: [PATCH 2/2] xen/netback: remove not needed test in
 xenvif_tx_build_gops()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Cc: Wei Liu <wei.liu@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, xen-devel@lists.xenproject.org,
 Jan Beulich <jbeulich@suse.com>
References: <20230327083646.18690-1-jgross@suse.com>
 <20230327083646.18690-3-jgross@suse.com>
Organization: Xen Project
In-Reply-To: <20230327083646.18690-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2023 09:36, Juergen Gross wrote:
> The tests for the number of grant mapping or copy operations reaching
> the array size of the operations buffer at the end of the main loop in
> xenvif_tx_build_gops() isn't needed.
> 
> The loop can handle at maximum MAX_PENDING_REQS transfer requests, as
> XEN_RING_NR_UNCONSUMED_REQUESTS() is taking unsent responses into
> consideration, too.
> 
> Remove the tests.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   drivers/net/xen-netback/netback.c | 4 ----
>   1 file changed, 4 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


