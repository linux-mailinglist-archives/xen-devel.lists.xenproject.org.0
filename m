Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BFD470104
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 13:54:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243823.421890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvfPF-0000m3-QU; Fri, 10 Dec 2021 12:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243823.421890; Fri, 10 Dec 2021 12:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvfPF-0000jH-NK; Fri, 10 Dec 2021 12:53:45 +0000
Received: by outflank-mailman (input) for mailman id 243823;
 Fri, 10 Dec 2021 12:53:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QdnD=Q3=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1mvfPE-0000jB-5q
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 12:53:44 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34724459-59b8-11ec-9d12-4777fae47e2b;
 Fri, 10 Dec 2021 13:53:43 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so8929542wmj.5
 for <xen-devel@lists.xenproject.org>; Fri, 10 Dec 2021 04:53:43 -0800 (PST)
Received: from [192.168.1.186] (host31-48-92-117.range31-48.btcentralplus.com.
 [31.48.92.117])
 by smtp.gmail.com with ESMTPSA id a198sm2828488wmd.42.2021.12.10.04.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 04:53:42 -0800 (PST)
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
X-Inumbo-ID: 34724459-59b8-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MqqlZyhoYH5VsQ1UfUV9Q7VMIcDmSWkliKoghQ+WXY8=;
        b=Uu2CVBSDDtiqCcV2JZyMktz3kVihFkZvv/BUEELddi5DpBhTb/4hNrWvQAvzJ+QAo5
         ejW1wXV+A8wmEu8g9/vtg+XMgYAmmcb38UyJfm2Tjg7JJCCXTQH9ySSSU0GzmeWxN6D9
         rBCBjS+SH2gilLL2twDogsYUNrzJuvPCEQqQnyuONGw7a6+XQMTPrDTuHP0q1FB5FxuK
         IHw+DxQZMYkxgrRGHN5KZrecWYj8zvRisQ091hVQenGn9kLfPDqvCoCAzz2MHrMgVk2y
         nZxgiQYvJhpZk/7cIhlzWQRNgnlWM32dgcI22UntDuVysv/X/GicCviKzmMfCX/5X6hl
         d7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MqqlZyhoYH5VsQ1UfUV9Q7VMIcDmSWkliKoghQ+WXY8=;
        b=ctD+3oe4caluoWIUcsYcYa5M5Nb2L3tt4PXJSOqjJhBY/6LtyEi/UVBHF2h4S3cRoP
         9xAVoe9BjNjwVOsKDkbgPaykTUGXm9PShKKjLU06jbj3LyqDIDkE0FP+undU2XlXnqRc
         4RGrT9uDRdtFr8seVtwQFULBEcU7WgzApadOok1LHvexmHpAQKMBBe8Ep8WLusxfYwdN
         9U9nx1o7qb9x83F6n3SQ1ohJJCZ9nbiGGqpwJOjMF3npe0IIN4iRV8B429j2KH2z9aG1
         vjbSAMfXXwSj7vYw2Agdthmu7h2+pTfva8TJYFVKzp2Cgl0DE8t0IWhSLsPCQ3YsB3Fl
         GsDg==
X-Gm-Message-State: AOAM531IVcQqMajcEPdhiTNxGXxn9PUXfJgsOEhKnAnvFseHrmtoKQNC
	6iXFMtwA8ORbPzWgtl3rd38=
X-Google-Smtp-Source: ABdhPJxR0IKIiLsfKlqAPZWx5GbQPSBiE57jEJL7d1waZI6PXeWRX1nBF8NjOu0HzHr3xinKsigJIQ==
X-Received: by 2002:a05:600c:3c8a:: with SMTP id bg10mr16451734wmb.106.1639140822539;
        Fri, 10 Dec 2021 04:53:42 -0800 (PST)
Message-ID: <1a32f152-2d87-4227-d316-14f47daf31ac@gmail.com>
Date: Fri, 10 Dec 2021 04:53:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Reply-To: paul@xen.org
Subject: Re: [PATCH 1/3] x86/HVM: permit CLFLUSH{,OPT} on execute-only code
 segments
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <10c7b3c0-c64f-3d12-06d3-8c408f7c9f4c@suse.com>
 <53d783d7-aa53-f2de-6aa3-bd266f176dfb@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <53d783d7-aa53-f2de-6aa3-bd266f176dfb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/12/2021 03:21, Jan Beulich wrote:
> The SDM explicitly permits this, and since that's sensible behavior
> don't special case AMD (where the PM doesn't explicitly say so).
> 
> Fixes: 52dba7bd0b36 ("x86emul: generalize wbinvd() hook")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Paul Durrant <paul@xen.org>

