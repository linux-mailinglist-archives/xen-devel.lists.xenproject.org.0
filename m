Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA92AA0DD9
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 15:50:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972663.1360976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9lLI-0008Oz-Nh; Tue, 29 Apr 2025 13:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972663.1360976; Tue, 29 Apr 2025 13:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9lLI-0008N6-Ks; Tue, 29 Apr 2025 13:49:48 +0000
Received: by outflank-mailman (input) for mailman id 972663;
 Tue, 29 Apr 2025 13:49:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yPhw=XP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u9lLH-0008N0-TS
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 13:49:47 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf5c6c1c-2500-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 15:49:46 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so31144485e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 06:49:46 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2a1dc3sm187956305e9.13.2025.04.29.06.49.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 06:49:45 -0700 (PDT)
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
X-Inumbo-ID: cf5c6c1c-2500-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745934585; x=1746539385; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fHr3kWZDvYDn+wGyjsQpXgEi8ultNXxdbwxO4yNBoi8=;
        b=g3tiAZu1qCSaYTB/7ENxOxXtFjWF/x/5aROS8H5Jo94tx6PgOm+3Qg78Xoq+JV7xFz
         fr9lGpRzXruv/5gkU821tOnZdHWmPSapmxs5vk/TctB4jIJPzT8qNS0dUKz/8FziPTUA
         rCJMnCg2ikv/SgnTPvr015LuMJSfe3mVs8R+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745934585; x=1746539385;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHr3kWZDvYDn+wGyjsQpXgEi8ultNXxdbwxO4yNBoi8=;
        b=RdmNx3xftx2wfM/IsB0R7kOvOT/e+WxxAYOaU11jd8lfwqjeBJulv4Dx9UTY9NExFz
         HaGA55PaBWB3YsN8py7vRj7gTrwKCvJ7oyY3MhE9KzNNs0XsiAyU73tyXl/uyatn2WcW
         iZCLEghBRLMzAW0zRNTLX0j0DpZgPMe1dvngjUtCbXJOz+h5MvDOjeeYnlBHK4t/Ds6B
         kq32xZc6qvKS9gKXdaPFdpabdKOmj8zt8vzubmw1X7C680/Nahpko8U3TAj5QaXZws8H
         ZASnTgi97X9VteIoEHPMTEB99dIWE9b++E0/rP4HD7ScfS1TTH6RCCyugHPJsvjioX4r
         0b/w==
X-Forwarded-Encrypted: i=1; AJvYcCVwyYw2q30a23bGQdv5N3LclpP7q5iNLC4R2bJ7acsdelM69OZNLIdnpMYZkaKemx8JWzsUmTJLOjQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpU4gvZ6YTHzYpV8v5pvd4pUa6LMwVuh4EuyyXfvhIYYvmPQ33
	78+vAzOXaqWN/Vp+QQAhhaup2X6tnpzxFm4pwsY6T0R0JMGMt48tGSF+WLoHmtg=
X-Gm-Gg: ASbGncuMBQmkdpynYfOsdFXnF7eWKSaJ0VDqTp3X8GnLn7ucvJgKD/Q37phaJlsP8hp
	fzNZ6ObWv+Ngh+mIp5lJMm4npfbvpF13s6ze84ckBdP1xP+4fEre01BQa73//L1DEQYQpPoSXFI
	4uTZVeJkaoK+O0NR4VBEeYvKLxDZu24kcUdeZwxVO/he/2TUDNGd1X2dYRrG67cTnKpEGMDoUsj
	ZK/nHwlvErvbFoGkj8j+uobennfhIzLpmq/qlbqICb/bRwFNugDFVUayBPxLJ4IdfRdrKN1bvcA
	RmgvPcD0f5eGt/4lkGJDh6QFY2i8V69gMqcvA9jesA2sWm+J9HtNTSAmyi8at0GyOnSUmOcoWEx
	oVP2ZVQ==
X-Google-Smtp-Source: AGHT+IGbhJwDN89kNonKyA6XemTWNEn8IaRN1hdVUHbV/7kAgNeJZMVqms+VqkAVJ8MxmGRdW59dgQ==
X-Received: by 2002:a05:600c:a207:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-441ad659435mr14088615e9.11.1745934585381;
        Tue, 29 Apr 2025 06:49:45 -0700 (PDT)
Message-ID: <6f9f9499-1dea-4963-9b00-41142259305c@citrix.com>
Date: Tue, 29 Apr 2025 14:49:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: drop underscore-prefixed {maddr,virt} <=> page
 conversion macros
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <09ac878a-fcbf-479a-9628-1cb08ff77a9e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <09ac878a-fcbf-479a-9628-1cb08ff77a9e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/04/2025 9:54 am, Jan Beulich wrote:
> Unlike the ones converting to/from frame numbers, these don't have type-
> safe overrides, and they also can't gain any within our present type
> system. Unsurprisingly we also don't have any uses of the underscore-
> prefixed variants.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

