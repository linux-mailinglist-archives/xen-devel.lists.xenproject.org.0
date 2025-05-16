Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 027CFABA68C
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 01:24:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987752.1373002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG4Py-0001OF-Kt; Fri, 16 May 2025 23:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987752.1373002; Fri, 16 May 2025 23:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG4Py-0001Ma-I3; Fri, 16 May 2025 23:24:42 +0000
Received: by outflank-mailman (input) for mailman id 987752;
 Fri, 16 May 2025 23:24:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T4W4=YA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uG4Px-0001MQ-Bk
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 23:24:41 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f026171b-32ac-11f0-9ffb-bf95429c2676;
 Sat, 17 May 2025 01:24:39 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a365a68057so177296f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 16:24:39 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442fd4a0a5dsm51194205e9.0.2025.05.16.16.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 16:24:37 -0700 (PDT)
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
X-Inumbo-ID: f026171b-32ac-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747437879; x=1748042679; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gs+W4avg9rzloGEWyeULyfi7kt4lquxj3Poh2XAH+qU=;
        b=QaavKXG9ko/EiKGKMA7nbzL8Mh0kBo8ocDpcPRF0+DRJYT5xdN6xxD8Etn/MzvA6fT
         I1yvpR38ojeX2vzdjTsYOXzPEALmO3dLhGP+IkgLPBnh48EM633UQsNBjp+uXJZnC50k
         N6KFCRC7j1A5HBp/WIDDlOW5njzk1pydAja7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747437879; x=1748042679;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gs+W4avg9rzloGEWyeULyfi7kt4lquxj3Poh2XAH+qU=;
        b=XU0byimvqx1t2UBO3ToKbfvrT5WUhD4YJiVBuOtXoY+NvB+jiLo0aACETvPwpJEhhm
         NTXs/RjFHR1bmO9QjP86uKwVGFY+OrVeknhtRjgrZ86jQfrA2SVddavmlS9UCGuD6KPN
         AzEwERBVx/HqRhrQs1eSIltC/WTHzePCf4JS+uSA+Pj1FBdrxcCUDe44Ek4QKgxM8U+t
         iijS9jlazAHijTp1r9HiQ+rxVg9l7g0CShPLk170ygxFLw+06L8sC0rbgJxQmJc38MNM
         4caSZ/YhnnjTpciP0nefRx9xfFa6lN4xVxqDULiu3/q5ZN3mDO+s4KuJjz/Bx0bm8QE7
         gdcg==
X-Forwarded-Encrypted: i=1; AJvYcCVM/1GrrGraoswQ8Zu7bIwwKxzX8uNlemzH2LTYqBp9mYJ1CGKdEtVbn+j4I1yoQ5nVMP9H9+EN2+E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxg5rWxpuvzhoWThRL8nQyDTuuzPZqrB2SrZFaIIOEwVWlqS5V/
	Fqupa96SmOHO3w1/IG8qfHlWCWzOiCmCd8QFE0aXyq66NJrQDA3mw11FtX5J5/nePvfbTQ6SZLh
	tnXyj
X-Gm-Gg: ASbGnctSJIEq3I0pG3SflsWnSw43T+d94Acr9CBde4jVe4nETr9sV5e6PqXGwtCfGzu
	seaE3dxVhHvbjW8HI8eYSX3chmhv6R0sesXCdW64YcydkOXN6j0r0nY/3uGum8TIUea2FgUClun
	hoVTMIycI/sHY5g933nsWTFMXgA5rLMRMDQhQWb+UipgBk1yP4KIOOUZrcMZVEP0f16qdLYXcwc
	59QHzW2AbnDDKHx/kfWnyqtSCjPhYIVEq1j3F4buuutW9xJd781NhzO2d6yFXnphKigAGf/FQcg
	ymG7g9tnfw8QAYplt/DXWbG69RP946yqjlEY+DOgBkv7kcr17atw0cydx9KdQsRtNx4s8YRtWKy
	QeolDjreq6p1Y3RdV
X-Google-Smtp-Source: AGHT+IHMpL1ahXu98M5O7fxr4CAAuFIc0z60PHexSuTY7dm+p6Tah4XL6MufrOYhCYXVg3RvQtPUUQ==
X-Received: by 2002:a05:6000:2913:b0:3a3:655e:d472 with SMTP id ffacd0b85a97d-3a3655ed55cmr798519f8f.47.1747437878909;
        Fri, 16 May 2025 16:24:38 -0700 (PDT)
Message-ID: <9c00c3b0-bbf2-42e9-84e7-8d61ac44f4e1@citrix.com>
Date: Sat, 17 May 2025 00:24:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] xen/x86: add inclusion guards
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, jbeulich@suse.com, julien@xen.org,
 roger.pau@citrix.com, sstabellini@kernel.org, bertrand.marquis@arm.com,
 Federico Serafini <federico.serafini@bugseng.com>
References: <alpine.DEB.2.22.394.2505161618280.145034@ubuntu-linux-20-04-desktop>
 <20250516232130.835779-2-stefano.stabellini@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250516232130.835779-2-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/05/2025 12:21 am, Stefano Stabellini wrote:
> From: Federico Serafini <federico.serafini@bugseng.com>
>
> MISRA C Directive 4.10 states that:
> "Precautions shall be taken in order to prevent the contents of a
> header file being included more than once".
>
> Add inclusion guards where missing to address violations of the
> guideline.
>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

