Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E3BBA92E2
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 14:16:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132838.1471090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3CnP-0005nD-O8; Mon, 29 Sep 2025 12:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132838.1471090; Mon, 29 Sep 2025 12:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3CnP-0005lc-Ku; Mon, 29 Sep 2025 12:15:59 +0000
Received: by outflank-mailman (input) for mailman id 1132838;
 Mon, 29 Sep 2025 12:15:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3bM2=4I=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v3CnN-0005lP-WB
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 12:15:57 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d9a1d71-9d2e-11f0-9d14-b5c5bf9af7f9;
 Mon, 29 Sep 2025 14:15:57 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6349e3578adso8651934a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 05:15:57 -0700 (PDT)
Received: from [192.168.8.247] ([212.222.86.216])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634a36521c2sm7688750a12.20.2025.09.29.05.15.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 05:15:56 -0700 (PDT)
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
X-Inumbo-ID: 0d9a1d71-9d2e-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759148157; x=1759752957; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0uJfdq99ZFSj4Y7ZmIXLFXFPVLt8HZtLsTj6lm3PIkw=;
        b=bfM1QmTu/Jm/c6lBBbBLMe0bNOzQw/PyJ2kf1LbgrnQ+RN3XsZQSGqj4iYKzjP28/n
         5r6aJGMbwrGxX9YLigc1QYefk8gugpZ8r1zqgee+zX0syOLXEO+vk4DFms67oXuHp8+r
         K5/L5rMvVfofd/HQrmmDnDPmwi9mYbE/jW8us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759148157; x=1759752957;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uJfdq99ZFSj4Y7ZmIXLFXFPVLt8HZtLsTj6lm3PIkw=;
        b=hLNnlAAP+5I0xVcPwFdxMwzfsXGN0lOjW6EUQXFZY1u8U91t5EY8ZzUzBbxcjIcVdd
         zpJ7NDbAzp5ZJ/Fasgz/upkGpoETkmt1s0V2aE45mQ1fPcNkRhqS/I3DT62zJWdi7Wxv
         Ds9L0luyQswOKzWT/F16HToAmSU0TAbqY+7XcMVZrbT3PZgVetOC4tXd3nk8PCxdz4bO
         Siu9kZEuJCl5CwyoGyEx/un6pDF8mXL8GAKogVguRf6WsjjuJCNE/M+t36Ll34RM+fxd
         larNbrZ2gboi8uBdvHzm+XWsWxY9rRzgUEK6MSlBgAz966WCgNL0M1+A6Yl4kH/xDDD0
         6zDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbFEguDQwMJLuJFC/SEHXIBPluc0DEfblHuOjq6KQYb7ukiS6abSw+2s1Wr3P3rggHqtYJ2riYHdU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzT9e35atLqY9U1+CAxqEeo7382MUK5b482dqv1k0dFBqpsWBjc
	CTS/vJld2xpceZ3dIxgWlb1GqGuASggCjGBXH6xDf0n8RhljbV0VjRmojICwM012jVM=
X-Gm-Gg: ASbGnctxqI6vXuR49Giu7JB1IsVedPy7Idsa0N7C1Hfeit/knbCfloGD6xgZCbmxkO3
	mYQEBKcr1d14QeIdau0cAofEHVoOClnd2gImt1Q1ovB2la3m96lJa7eTGNMHGASg7CGtr0cVWbO
	RknmvPPr4tS/2VxBzxuN6GJqj1Tt5ZgfUm8D+JLAX/mptYu/q+yMpT1xkeuP+NUpfCmE8+P+EHD
	O5wFRz5eHhFnj974FJdQXg7oP+lUisd7tnDn6bIUOvXVFb+WnWUY1tfHsASkl/ocqePqEghap7U
	cxnDkNmBONUzlTnPDSbrmT1jmufJmbETZmKwNGNjb92JXdxCJgzN99nNetWLeNGycX4OhcHSXNt
	cwhjvj75Uqr0U/Xfe4l4CWgtQ8wdTYmupCPnp9+zDTuj5AqOZUw==
X-Google-Smtp-Source: AGHT+IG+ObOrbFlBdfLKftFP83HBRU6kXRjU/nNZIECrK3tlnMWooBc8R/EonH1/wn4QX3Q0fFqfmw==
X-Received: by 2002:a05:6402:748:b0:629:3f9d:b06c with SMTP id 4fb4d7f45d1cf-6349faa220emr11522403a12.33.1759148156629;
        Mon, 29 Sep 2025 05:15:56 -0700 (PDT)
Message-ID: <14953714-b760-4365-b6bd-5bfd038a145a@citrix.com>
Date: Mon, 29 Sep 2025 14:15:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 8/8] Update CHANGELOG and README with dependency on
 json-c
To: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250929120756.46075-1-anthony@xenproject.org>
 <20250929120756.46075-9-anthony@xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250929120756.46075-9-anthony@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/09/2025 1:07 pm, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
>
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thankyou for doing this.  v2 looks much cleaner.

