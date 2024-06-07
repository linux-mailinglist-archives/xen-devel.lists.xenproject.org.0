Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2EF8FFD30
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 09:33:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736303.1142331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFU5r-0005Wp-Hq; Fri, 07 Jun 2024 07:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736303.1142331; Fri, 07 Jun 2024 07:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFU5r-0005Ub-EK; Fri, 07 Jun 2024 07:32:59 +0000
Received: by outflank-mailman (input) for mailman id 736303;
 Fri, 07 Jun 2024 07:32:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5uW=NJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sFU5q-0005UF-6q
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 07:32:58 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2880a403-24a0-11ef-90a2-e314d9c70b13;
 Fri, 07 Jun 2024 09:32:56 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-35e4d6f7c5cso1744579f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jun 2024 00:32:56 -0700 (PDT)
Received: from [172.31.7.231] ([62.28.210.62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35efa97b15dsm2334341f8f.81.2024.06.07.00.32.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jun 2024 00:32:55 -0700 (PDT)
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
X-Inumbo-ID: 2880a403-24a0-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717745576; x=1718350376; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jn3+J2hdR5Zt8nxW6//+WadLEYLKgqpbjzuBkN2w4Nw=;
        b=c0gyQeZdwae40IByf+PlgtH9sLaTHrnu4/hVW6Rxmx0xWNtIO9D+CpEnr2awU6NAEA
         B6z7wsa/0rHlSRv3oMDgYPq+xCRlWWWWgub8+85Uq5r8zHl0BM/Yg+ZHmJqW2kZoVLSv
         gFudpy1orUROiEKMAl6XJiWh+z6zxvN+dJ52HM/8zAXNzX61QRcO0FI1cDHLb+QZGa8S
         gCU26Nr1zfViGK0zvRo+UhP9G+zbRGd0E+Z1QgEgr61pIfkp3FrR9R8fkPgTKruIdzDI
         n7ABOF+Tt9mIrISXtvv9fDH13EAO2xrYYRmaljioe6WWO9QGAtAwdrXbN1WyfWBVc4ld
         rMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717745576; x=1718350376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jn3+J2hdR5Zt8nxW6//+WadLEYLKgqpbjzuBkN2w4Nw=;
        b=jCQ7klAYX/ZnTDF3adruxiZQ8uL+Tuy2NDf+tqBYdFi/aZxsOXwGYaFrCpjcUP16kR
         h4E4yHWX3Rl5x1njJN7+1hBpQNh0PymtEu8PQkZoFC9/wobQAkyyMww7uvtZ39vZnofm
         30ENSWymd1f1TvoBgM2GF2WzsQVnTMk6cOCynSOScQFb8MwLIYjksT38rcss9NIt5A4C
         pgcdAWI7YAH3f8hbe9irlFrMWGC+iS0IBYUJRmycJ5RpPe7xYdaGgN8XTOlxn4dJ7MdM
         zyVRnTTmefRGwRIWNU7UgBAZUiN8B3uLnAd8//cjkX51NGbqJiJ7gm049mpkKt5ljh9a
         g7QQ==
X-Forwarded-Encrypted: i=1; AJvYcCViiHlZjxVTLY+LRTgc8ts9TTCiCVXVukzylDnVHOKvE891WHRTt/7M/vDqoP4GRui3S+ShemRSzZAoYZmIfI5JyTVGYYzBqqTo1h2PHVQ=
X-Gm-Message-State: AOJu0YyhE/CSZ/ho/N+UlH6gAh/zKaatApOTCgihRVoQIR40dFRRK7ow
	bJgy+rX2AiHILp1sxux7HKa3Ysf0ZL6b+wwBGUp8MTD6PYjpxEgWfESoTMRkBA==
X-Google-Smtp-Source: AGHT+IGgdxa9bxzRdsBn9yD3bv+gx4uaZl/dnd8CZ6toQjuyK4IwQIoShp2NxNFXWOjEcOHSgWggmg==
X-Received: by 2002:a05:6000:4594:b0:35d:bfe3:1817 with SMTP id ffacd0b85a97d-35efed3f93amr1083501f8f.21.1717745575915;
        Fri, 07 Jun 2024 00:32:55 -0700 (PDT)
Message-ID: <ade6ba3c-5a53-463c-97fd-34f6ec7dacaf@suse.com>
Date: Fri, 7 Jun 2024 09:32:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 03/16] x86/p2m: guard altp2m routines
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
 <acb98c1c52613555a59cd27aad853a24caef0e19.1717410850.git.Sergiy_Kibrik@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <acb98c1c52613555a59cd27aad853a24caef0e19.1717410850.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.06.2024 13:11, Sergiy Kibrik wrote:
> Initialize and bring down altp2m only when it is supported by the platform,
> e.g. VMX. Also guard p2m_altp2m_propagate_change().
> The puspose of that is the possiblity to disable altp2m support and exclude its
> code from the build completely, when it's not supported by the target platform.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>

I question though whether Stefano's R-b was valid to retain with ...

> ---
> changes in v3:
>  - put hvm_altp2m_supported() first
>  - rewrite changes to p2m_init() with less code

... this.

Jan

