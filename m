Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD627E09A2
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 20:50:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627343.978341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qz0BP-0005tB-Dt; Fri, 03 Nov 2023 19:50:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627343.978341; Fri, 03 Nov 2023 19:50:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qz0BP-0005qq-B6; Fri, 03 Nov 2023 19:50:19 +0000
Received: by outflank-mailman (input) for mailman id 627343;
 Fri, 03 Nov 2023 19:50:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=va+T=GQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qz0BO-0005qk-1V
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 19:50:18 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 361490e7-7a82-11ee-98d8-6d05b1d4d9a1;
 Fri, 03 Nov 2023 20:50:17 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32f7bd27c2aso1635269f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 Nov 2023 12:50:17 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 f16-20020adff450000000b0032fb7b4f191sm2256009wrp.91.2023.11.03.12.50.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Nov 2023 12:50:16 -0700 (PDT)
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
X-Inumbo-ID: 361490e7-7a82-11ee-98d8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tibco.com; s=googleworkspace; t=1699041016; x=1699645816; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dw1KxyFf/ZyRIX2bXOtGfCz+sH1TNbRRmAYCq3USUCs=;
        b=iAughmNQaRXWO9gyEyLKUJmsbmWi4WPdDsLD+iYg9XKhnV6Jr+E0Vi2Z+UANa9n/Bl
         yU5pRGOp4ar6g4AOMydadcXbEKqlK/iosLrfrGeJxL/D4heQMw0CABiQmhgK2VO6vYpT
         /q3B72OIVDU9fXoqQ32GZsXHGPH0VdS6HJ59elldEWvENoXYFMuhv6E4+irVMV4sWLP0
         +7iQ4TOBMRAdSu0dhKDEomiwiyocA9lxbbCpznize0t7FR95nzK8+7bmUlK873Q7xt8b
         SCFAqb7BqFoCztPVmkQgyr2kBl44bn7dIxRLrtbmFeMLBZMsB3v5lDm8aLnAwJZmNPqW
         Vd7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699041016; x=1699645816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dw1KxyFf/ZyRIX2bXOtGfCz+sH1TNbRRmAYCq3USUCs=;
        b=eWNsrdzix9NBg3T37ulXdwobyye6k4CJYnnJ6BjpymmEtYREHqS/qtc48wWQ5atHzy
         36O+U5QSbMLTHNpgh/ADpa59I6t6Tf0ruRb6Vx71VV/WryRfUgTQ78yPk2p6OHgrrIqM
         pTyrzPsMQ/Qlw529hkAmJXsg/sd2ZgTFPnX4yTzrO3k8hckxz/voBAqAk1cw2AgQ4F/b
         aurNfUQyEZfK07FzESCDbtQFy4aVQtaHnCHKtKmw+AH2B6AXJU8fa5Xem993P+F6IRrk
         u8YWE4JckO5b8sV2bI4ihOK3n1kQMo0L/iZRkgaYjFzr2jrBqa0Bo/ECAZf/mzolzR3U
         AEsg==
X-Gm-Message-State: AOJu0YxlHUNUWbzxhJw02hywal+HIawItUEaCyCxxd0/ExQvI2K0ON0z
	2X0Z8vAbs6aoq6nIvaymCP0E2g==
X-Google-Smtp-Source: AGHT+IHFtYClmcesLpQQF8aL3m3IwdclJsueLsVRRvARObYqMdN3IK/kJGVdJ40JjNLUu61LnBAbfQ==
X-Received: by 2002:adf:e0d0:0:b0:32d:81fe:7104 with SMTP id m16-20020adfe0d0000000b0032d81fe7104mr15292943wri.63.1699041016254;
        Fri, 03 Nov 2023 12:50:16 -0700 (PDT)
Message-ID: <e4d1a87f-fdf3-4461-b212-1ed28c93019b@tibco.com>
Date: Fri, 3 Nov 2023 19:50:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.18 0/2] golang: Binding fixes
Content-Language: en-GB
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>, George Dunlap
 <george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Xen Security <security@xen.org>
References: <20231103194551.64448-1-jandryuk@gmail.com>
From: Andrew Cooper <andcooper@tibco.com>
In-Reply-To: <20231103194551.64448-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/11/2023 7:45 pm, Jason Andryuk wrote:
> These two patches refresh the bindings which have gone a little stale.
> I used two separate patches since the XSA-443 one may want backporting.
>
> Jason Andryuk (2):
>   golang: Fixup binding for Arm FF-A
>   golang: Fix bindings after XSA-443

Bah - the security team did mess up there.

Also, we very clearly need the Golang bindings to be a blocking build
test in GitlabCI to avoid repeats of this in the future.

I'm tempted to the Gitlab change ought to be for-4.18 too.  Henry, thoughts?

~Andrew

