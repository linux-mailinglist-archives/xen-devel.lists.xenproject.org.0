Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 208AFABB019
	for <lists+xen-devel@lfdr.de>; Sun, 18 May 2025 13:38:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989018.1373361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGcLJ-0000iI-El; Sun, 18 May 2025 11:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989018.1373361; Sun, 18 May 2025 11:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGcLJ-0000g9-CG; Sun, 18 May 2025 11:38:09 +0000
Received: by outflank-mailman (input) for mailman id 989018;
 Sun, 18 May 2025 11:38:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uGcLI-0000er-Il
 for xen-devel@lists.xenproject.org; Sun, 18 May 2025 11:38:08 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91b52ed2-33dc-11f0-9eb8-5ba50f476ded;
 Sun, 18 May 2025 13:38:08 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a367ec7840so584369f8f.2
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 04:38:08 -0700 (PDT)
Received: from [172.18.118.114] (ip-185-104-138-68.ptr.icomera.net.
 [185.104.138.68]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442fee0d216sm96895835e9.26.2025.05.18.04.38.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 04:38:07 -0700 (PDT)
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
X-Inumbo-ID: 91b52ed2-33dc-11f0-9eb8-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747568287; x=1748173087; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SnQRWMmIf3B5ilXU5R1PFjc1RhI5ZUdJRKxRApkykH8=;
        b=esAEoiIInoZ2ESYi5yEpV2RKd1pizfMDXu+ppArbdIYqnKK+Lh2JlCoTgCNPa/pm21
         zSr+Icp/R4PJAL3yjEYfQSk7hyw6z+lisWcxZ477r79D9RTaTi0dkAQb4AWdrJWwCi+D
         PdBCwADMe2xkUDLL1Qc7+RIQNadrvSopovY0kFZkaoD875l40EzHeCApKY5Jmpqz9avS
         Fh56DtsHA917gc/6nZ/rIVSZho2+PDvitfoAFw1wddXIj5cts4IldSV1dcRatRh/PAfb
         tiy/p+j9xcTxQKFd2KE7SWw8UK52gJfFRCMR7CHZdPrdn73rdxIZsLiDGEBdAJR83ebS
         6sNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747568287; x=1748173087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SnQRWMmIf3B5ilXU5R1PFjc1RhI5ZUdJRKxRApkykH8=;
        b=OlX0drSiRcBii19ExKl8w7exMKKDs08w2OdBfK0mTH+tMIbqAKZR5VAarbv/CGLkMB
         qxP/rnkW4QwEEiATgB+bs13q19ETeU7Tjf/XZk/TagFWv/W3YEioP15mNOQHIiyM36k0
         up6c4sHkngRCvi8zLdTbnjNx6PQ3loNxFEvduDqWApMzCh0gVfh24Y0ltMpT4Fbe5wiz
         SNaJ9yvgnzVLNRMGV5Q/vYHSL7oLaaV9AW1NdszQiO8iPSe/b/Fvbylmc7Sg3Hlw5Kdb
         ZvRoXTxgtk9R+cQ6rsLW5AbfjgPlsfkVetAO4wObJ96/knj6exnVLGF/cLgQA0WLEVNj
         2jDg==
X-Forwarded-Encrypted: i=1; AJvYcCVQEShiT4rztdiNLbWGpOr9DI/Cw/9Aqyj1qfzMnm7sq7LLEaujrjSJcBLQtD2cqvtVfxYxWwMvpqE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgF59Cd7LjTutaAHM6klrIjCY4kQ9n0THajxc1x6b5uWBJ9gll
	GSn19kaDz7PaJ97URB+HTcDu6n5btelT7+vQfTNSd5Jy8kZ0EPxip6/wuxb8//qnJw==
X-Gm-Gg: ASbGncuISz2dRW/np7pslGs2VGh7rnQyJYdCvAT1dpkDC7mnpeNIB6E+DZ+89GTSs25
	G+ZK9hzj+4vl12b2+kvteFcgERIZtO05OJtxfqpjIH2gOPFL8aJ/5Dt9iicSX7J65GaL6YM2XAL
	8TtgefQH5MQiKA4LlYqe2Ceg6azyjbf35BwAxo4rzDYKXKhWftdcdHv6ny5MiQRoCxnwU5QiwdI
	Hv9Fef7KtbcwVH+70U++CxKFa7OQ3dllyUTO0XzUXjelRpAV9Srw4Mn+R06hb0NCkh3IgnzWYEP
	B3GvrlQttOapgC1e+6qqJe4Vag+6mAKlX7VDEOTwmMez9A0j8UiRWRftkKyN/DLPbpzZCAaxIXY
	8IdY/7yPkShxLAsk9MX3IbHOJ
X-Google-Smtp-Source: AGHT+IHoFuETHi1SOfs6lDE985+jOAh1brNzeadiaTFP50x7DFPBJ0PE38tzKjE+tdOlYfnVIRUJog==
X-Received: by 2002:a05:6000:420f:b0:3a3:6991:dcbb with SMTP id ffacd0b85a97d-3a36991e1bamr2856439f8f.12.1747568287436;
        Sun, 18 May 2025 04:38:07 -0700 (PDT)
Message-ID: <8bf8072f-c379-416a-9d7d-912db7084e67@suse.com>
Date: Sun, 18 May 2025 13:38:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] x86/hvm: limit memory type cache flush to running
 domains
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250516094535.63472-1-roger.pau@citrix.com>
 <20250516094535.63472-6-roger.pau@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250516094535.63472-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.05.2025 11:45, Roger Pau Monne wrote:
> Avoid the cache flush if the domain is not yet running.  There shouldn't be
> any cached data resulting from domain accesses that need flushing, as the
> domain hasn't run yet.

This again plays into what we started discussing already: There may still be
data in caches due to Xen or toolsstack behavior. Imo to compensate we'd need
to do one flush right before unleashing the domain. Yet of course this makes
sense only when we make sure to not have (cachable) mapping in Xen for any of
the affected ranges. Hence, with that not presently being the case, ...

> No change in domain observable behavior intended.

... I agree here, thus ...

> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

The situation may want discussing a bit more in the description, though,
which would make me feel less uneasy about that R-b.

Jan

