Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE870AF94E5
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 16:03:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033427.1406797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXh0R-0007zA-Df; Fri, 04 Jul 2025 14:03:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033427.1406797; Fri, 04 Jul 2025 14:03:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXh0R-0007w9-Az; Fri, 04 Jul 2025 14:03:11 +0000
Received: by outflank-mailman (input) for mailman id 1033427;
 Fri, 04 Jul 2025 14:03:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jMLS=ZR=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1uXh0Q-0007w0-L9
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 14:03:10 +0000
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [2607:f8b0:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c16fb92-58df-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 16:03:07 +0200 (CEST)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-73b0ea4e138so812489a34.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 07:03:07 -0700 (PDT)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-73c9f735144sm388064a34.14.2025.07.04.07.03.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jul 2025 07:03:05 -0700 (PDT)
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
X-Inumbo-ID: 9c16fb92-58df-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751637786; x=1752242586; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XNq0c8GL5ZyhDYOqX8QVyvyzFsqz5xU7FqcEI7jxulc=;
        b=AXuM09qfI01iTghr9EAyAKj9lNAejIl8NI+azsed5Lq1wLApHgBTsBCLum5XnTmsrN
         Qs/t9w3dn//7UuBnfqUHmkY2WsVow6Cejb7va+Gzk6MNIxexWbCXcgaBri3uXipTsEZ6
         zcMEbWatzCkjRCUmvii0o0JG3ub71GOwVzp61zAsXzURDhnG2z6klttJ74uJPu0Dxoju
         l7KI6KRof3A5kICgb465JiWbMliHVSlrdimKrE6XofoTX7isavp8U+TvMANHqA2Xg9pL
         9AjE6mYIqdkNbTChrhgd3ae14RE+STBOsa+VK6PtcS3uBCBz0vVEShYtHWzCiENKFmJs
         l5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751637786; x=1752242586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XNq0c8GL5ZyhDYOqX8QVyvyzFsqz5xU7FqcEI7jxulc=;
        b=ETjvrlZUoen1t98w7O20NF6QEBjdOR+5VKrcNuY+jm7EBpFxA8UU3+eaGEH/dza/9b
         vikrrIvnRUhaumRNJnx9RytROTxYkQmdfDggncY6BX9uRYDbqFeXkX5ph7Teu3RnGUJV
         xbrn3ikt6t/BL67EoAAReTrEiQcnE+SX9bfm1sESzukyet3vVIDYzWohHLPxu/7fLcTw
         mZ0CAKBzIds7FPU/VMgASfRyLuIxVCGVhzHw1wHYuJ68PGwhcnpSlGpzJlReYEzmiId9
         Sd0VcyD3YJMp0///DjqtG0PHVzdFGXT3LzEWhphJ0ta7O8WPkZo+KaAExbLFRzfVbZWq
         nbmA==
X-Forwarded-Encrypted: i=1; AJvYcCU6DspoXT7K7QBh2cv9AKum6EUJ81a6pkBpP9dMU2ojxxPmrRc4D9AKUeIHPv69B1uHZQoe/5Zqilw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1+hPO0aosAHRo61SbNqL/XGPIUBCF1amutRhi+EFtj7OP2g+V
	rMzpXM7dpDOFs3l/0RtgsVPsv4ownL2ykxkrwhshafGfA+FKVqlT98UFYfRrP2M7Imk=
X-Gm-Gg: ASbGncu7OAHUx5Aeg2qOBDNsT9MQihZ5rQGPgoGa+HqMb7aKZSxjYkK7qENWSSCu0Z1
	aHMJ5LAiVExy0kYmt7jfL+UrhdE17qC7wjuLs9Kqiv6dCWkg6bosKkgBCj8/fURKZKI1be6gg5F
	k+o3VJV+sYZ+NSRTInSJeFMk7OXLtBpebsUhq8QjfoSTswNz4HhxiJlNFTE8tnkFsh1eiuAb+kX
	xYBAmM9QD6OXeAji9cUBHVDJybx6vAL3IrMP5zqyMDiu8rWtPkiHuDEfloALsNNAmxZvfMouRfU
	TvOhBadhj3q6ta5e2PeBr6rzxk86J1IIXErN9KZv4phfpH8UCYIvgtJigfkR5ly8LTIijQeiMbt
	G/r4BHTynJQJIa07EKbDmaspXJc72iLIm56VndKq8
X-Google-Smtp-Source: AGHT+IHCjZMWku2sXb4MaomGmkFzos2MmBGatOccfc0k+r2F+uBCum+atRQEn6lI9s8yQAG5RNVFtg==
X-Received: by 2002:a05:6830:4d86:b0:73a:8a8a:5151 with SMTP id 46e09a7af769-73ca66dc922mr1238051a34.17.1751637786225;
        Fri, 04 Jul 2025 07:03:06 -0700 (PDT)
Message-ID: <68bd424d-0249-4c74-a7a1-d0f46d46a835@linaro.org>
Date: Fri, 4 Jul 2025 08:03:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 38/39] accel: Extract AccelClass definition to
 'accel/accel-ops.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Mads Ynddal <mads@ynddal.dk>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Warner Losh
 <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250703173248.44995-1-philmd@linaro.org>
 <20250703173248.44995-39-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250703173248.44995-39-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/3/25 11:32, Philippe Mathieu-Daudé wrote:
> Only accelerator implementations (and the common accelator
> code) need to know about AccelClass internals. Move the
> definition out but forward declare AccelState and AccelClass.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   MAINTAINERS                 |  2 +-
>   include/accel/accel-ops.h   | 50 +++++++++++++++++++++++++++++++++++++
>   include/qemu/accel.h        | 40 ++---------------------------
>   include/system/hvf_int.h    |  3 ++-
>   include/system/kvm_int.h    |  1 +
>   accel/accel-common.c        |  1 +
>   accel/accel-system.c        |  1 +
>   accel/hvf/hvf-all.c         |  1 +
>   accel/kvm/kvm-all.c         |  1 +
>   accel/qtest/qtest.c         |  1 +
>   accel/tcg/tcg-accel-ops.c   |  1 +
>   accel/tcg/tcg-all.c         |  1 +
>   accel/xen/xen-all.c         |  1 +
>   bsd-user/main.c             |  1 +
>   gdbstub/system.c            |  1 +
>   linux-user/main.c           |  1 +
>   system/memory.c             |  1 +
>   target/i386/nvmm/nvmm-all.c |  1 +
>   target/i386/whpx/whpx-all.c |  1 +
>   19 files changed, 70 insertions(+), 40 deletions(-)
>   create mode 100644 include/accel/accel-ops.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

