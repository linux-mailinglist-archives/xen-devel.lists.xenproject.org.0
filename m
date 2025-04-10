Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B68DDA84902
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 17:59:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946047.1344072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2uJ2-0006Bn-E4; Thu, 10 Apr 2025 15:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946047.1344072; Thu, 10 Apr 2025 15:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2uJ2-00069e-BR; Thu, 10 Apr 2025 15:59:08 +0000
Received: by outflank-mailman (input) for mailman id 946047;
 Thu, 10 Apr 2025 15:59:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2uJ0-00069Y-Dx
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 15:59:06 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7f927a7-1624-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 17:59:01 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so10945595e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 08:59:01 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2338d802sm60117725e9.1.2025.04.10.08.58.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 08:59:00 -0700 (PDT)
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
X-Inumbo-ID: b7f927a7-1624-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744300740; x=1744905540; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2QEiA9FdsnEKwRKDmE3tUvD7/i0SnEOny2Zcohbc88M=;
        b=DBlvqtonT7ajvAdnIVwkYASYZjkT+dhDx3faBxJJRx1rNACunGBsi1xUYpqI+dKWcD
         zUnx1owOKf17Q4RaeLd5/74FyrxcD8cjpjlWbgvFpaqLjIoaC4Iwd9/cMTbGoD4NP3mY
         Hw/k6Tk3zQI+LckxZ9vxbpmJQao5+sUBXqYxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744300740; x=1744905540;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QEiA9FdsnEKwRKDmE3tUvD7/i0SnEOny2Zcohbc88M=;
        b=uL9Eryb2mTtWV+CkULLRRJkYRSGWbL8c2++ksysRKvdUOwmXo3Dzt0ksQzhKBq2LTF
         8dRUqFj6PAj9GsrHi29nT5E6vnRArCls3x3fZ07l+yne0vIxXQ7pgAX05HPDlwdA0/ms
         MM9YTkyFzvPzIGPiMngbqsKDg76uWq7CQDSqCn2UNWgQycbgYWxdNCDocAHJYPvHH+kJ
         XhSMILhtFUNV6sUTVJ9j6dCgT1oynrdedMRe0QvzRAef3trsarDtTMa+MXqVAS1HkbIU
         InuAZcz69CqQm/LMJrmoUA2tETCz7OnF4tCglvCl0LeRZNr09MQiczF1z0tKea4a7WnF
         nSLw==
X-Forwarded-Encrypted: i=1; AJvYcCV+Zy+TjgmcxWwKFXfQqj/Ue8Ik0tP+43wZp1eAOFy81mZyWFbvsB/RYfRV9f3N42U0bpCy4TUlLLs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1FTyJFQG/zJhL4DQLhAbVWEkNZxy+fdRFXACGCtfVO1IoE2zf
	smbzUXaT+dnL7aP5ijENyq+STxhSWsWH6romLs2bE7OMJnAbgs7e+OQYiC+HKdhJG6v3R5TarwC
	xVQo=
X-Gm-Gg: ASbGncu/ixep1oYtrxuVKNM6I20QDouzJY5uF7EgUpKSwuGlOgpe3/uIasPz7zT/W7H
	KBK2MhfihH0OGLmEG348T+JU2MHu9OwWy/sXrhe4L5a+s8aXmoRd1QuEw+fEJfA/F+R3NudjMVl
	LPCB7uCs8rL/Ja0Fhhc/U5RH8yH94z0DGfNhDbposnv9xf7+91EDfo8KPdQmXqPLNDMppfelINT
	SCCCYW85Rmn7NDeGMqT5KSInvCFfq1GKIQsIecJRpd0is83hKEHyipozmgToZb+ifMWfDFK1vK9
	1If7GmIGjc3PDw4H1+MDyKjyHIU2jKL/31WCuNv/n00R3ZNNBBnuXnTcHCtVotHS2LY8c2rOhbF
	XWLx5XcwF5HkOz7h5
X-Google-Smtp-Source: AGHT+IE7Iid/8kutM6eZ3b/lqbsvnP3KxKUtnooveMgBistXn6ltMr7wDcE4djrx+CjxZ7KRt1DWNQ==
X-Received: by 2002:a05:6000:40c9:b0:391:4559:876a with SMTP id ffacd0b85a97d-39d8fd8a19bmr2432317f8f.46.1744300740427;
        Thu, 10 Apr 2025 08:59:00 -0700 (PDT)
Message-ID: <6046d30b-b5ca-4867-9f24-831b469d1ee3@citrix.com>
Date: Thu, 10 Apr 2025 16:58:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH TEST-ARTEFACTS] Fix adduser --shell path
To: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20250410155531.29570-1-anthony.perard@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250410155531.29570-1-anthony.perard@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/04/2025 4:56 pm, Anthony PERARD wrote:
> We need the full path to a shell in `/etc/passwd`, otherwise `su user`
> doesn't work.
>
>     $ su user
>     su: can't execute 'bash': No such file or directory
>
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Would you like me to pick this up?

> ---
>
> Although, I don't know when this shell is been used, it seems that we
> get /bin/sh unless we start the container explicitly with `bash`, like
> containerize is doing.

I'm not sure why the x86 side is like that, but I didn't want to change
it gratuitously...

~Andrew

