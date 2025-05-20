Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E32ABCF86
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 08:40:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990474.1374427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHGeP-00017p-95; Tue, 20 May 2025 06:40:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990474.1374427; Tue, 20 May 2025 06:40:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHGeP-00015E-5g; Tue, 20 May 2025 06:40:33 +0000
Received: by outflank-mailman (input) for mailman id 990474;
 Tue, 20 May 2025 06:40:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PJhk=YE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHGeN-000158-Q0
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 06:40:31 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 523b46b3-3545-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 08:40:29 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-600210e4219so7740314a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 23:40:29 -0700 (PDT)
Received: from [10.1.250.198] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d04e80asm684191666b.2.2025.05.19.23.40.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 23:40:29 -0700 (PDT)
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
X-Inumbo-ID: 523b46b3-3545-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747723229; x=1748328029; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EHrIl9SqLhG+x93e+6uTHRwIrOR2ARkYPPXCETZs/8Y=;
        b=SYPdvvQXYnNuAdjUiFMuXxkR499aFB2M3yuCaxc2PRkF8Auqjg/M63NilhavWps9Nt
         wFdE5jDokzWQpxkKOrDSWdh7XjdztRsgONZsAvCwgkLmT52ZBKJi1QXIu/tEp6kGIztI
         AjXNb2gAMxzPwg9oT4QOeJXtyVKE6LfLJoZjs8RK1Q0+IFcEmfUinZJjL732CyLrI76h
         Ik91Ig3ptUcO3cCp8HkM5WZCMvMSrplkar9kskE0y0qPURBMbTDFS2BcZH8BncqWY122
         cw4YsKJUiveXB4ZbSnx3m/C5yNxsJ7tXKE+V+8rwpbCCEvfXslzuOTyeruOxPcpGnnmY
         NRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747723229; x=1748328029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EHrIl9SqLhG+x93e+6uTHRwIrOR2ARkYPPXCETZs/8Y=;
        b=tBUir2YtO/gEHt8gCykTlLbGO6yt7jddNqWim/5LTQ17qkPtn9xiGKonQZ0Uz3Z3lB
         EW5c2pC5VXXjveumCNFqq7kj068/v4mZZdWsckln8g8vvu59bjeyUmOQfUsSEhJxS6pN
         JBRIv3h+UJDYdDOSPY1hIBF4YceDnGiNmkthnGOosfnkegg81cSbF06hqYZjXmxMofbY
         et/z1oJw7b0gFSLph4xX1OE5V8iBjxFCtHzAIUJtbC5TvyQjUKflz8G8sr8HOQR14ZXO
         NQ68NJXUGe8caZMUPGsRjjXsA80UMpDUcXdM13FpYm0JuO478LAyEPOHPK6QFuT7HRfq
         x+aw==
X-Forwarded-Encrypted: i=1; AJvYcCXS+2MWySa4GsER3dz070f3gkHSC3mNk8Dg4xIboZ+/ttmX3EvIhtrVVenvv8DtIxRf5e7URaQgZZQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzhXLXk+0iWw0j0TXiqbc+I4YTZ/mCIHjiBNEGEdxCAp1xst5/Z
	D9+GEZ5VJZ2RKUbnWCxKcGXYz/UOSjQZIQ1WgJRohbQtA91u1jA8HCGQ4TrKtslQmw==
X-Gm-Gg: ASbGnctRlOd/XJa+CluWI5vQesQQPi9kp4ln6RLYwc9AOeY+FUvC4UTnxh6JMUTTVm0
	jm6w/ZFidKkQGosZigEkRKFLtq3v2Y7ofc345zwEo2d8TSDbR3jRGukiCgo1F2rqK51M1gtsnZV
	4P1wmZRvALLa58fEFO7l7+2eIe4HGbuovIi6YqwrwPeAevP4XVgP4xw0aWJF+eP2hBE7Eo81iQX
	xSWhiR74RZ7M7OxnDe9rUT/dNV2zcwcMYul3fxBsM0LChzETh5iCwMCDTT6bEp+37BtJb2EXMI4
	WE+ikNJjxp5XyWLx3SXJl5vWHoLR6oX1udOxEsrgZTnfd3CcqiOvEHdLQjigIQ==
X-Google-Smtp-Source: AGHT+IHkndoa/Zy0Fo1vR3SHULvhrEuM+DuAka39CJBDS6RXuZT39cVrzmEJu0sxzprWWoTFtQQWWg==
X-Received: by 2002:a17:906:4ad8:b0:ad5:46a8:1ca4 with SMTP id a640c23a62f3a-ad546a82c11mr981906666b.7.1747723229294;
        Mon, 19 May 2025 23:40:29 -0700 (PDT)
Message-ID: <8d89f644-4ded-4490-ad23-518563d230d2@suse.com>
Date: Tue, 20 May 2025 08:40:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/10] vpci/msi: Free MSI resources when init_msi()
 fails
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-10-Jiqian.Chen@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250509090542.2199676-10-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.05.2025 11:05, Jiqian Chen wrote:
> When init_msi() fails, the previous new changes will hide MSI
> capability, it can't rely on vpci_deassign_device() to remove
> all MSI related resources anymore, those resources must be
> removed in cleanup function of MSI.

That's because vpci_deassign_device() simply isn't called anymore?
Could do with wording along these lines then. But (also applicable
to the previous patch) - doesn't this need to come earlier? And is
it sufficient to simply remove the register intercepts? Don't you
need to put in place ones dropping all writes and making all reads
return either 0 or ~0 (covering in particular Dom0, while for DomU-s
this may already be the case by default behavior)?

Jan

