Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9B88BCB55
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 11:56:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717418.1119605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3v5R-0004O2-Lk; Mon, 06 May 2024 09:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717418.1119605; Mon, 06 May 2024 09:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3v5R-0004Kq-IL; Mon, 06 May 2024 09:56:45 +0000
Received: by outflank-mailman (input) for mailman id 717418;
 Mon, 06 May 2024 09:56:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0G4=MJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1s3v5Q-0003QW-Hd
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 09:56:44 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f193b721-0b8e-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 11:56:44 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-34ddc9fe497so1059881f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 02:56:44 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.211.4])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a5d67ca000000b0034dcc70929dsm10241487wrw.83.2024.05.06.02.56.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 02:56:42 -0700 (PDT)
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
X-Inumbo-ID: f193b721-0b8e-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714989403; x=1715594203; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s2OtRlS9dnyJBli43HIli/2qfBfNu58F4VWyD11DfUE=;
        b=Jiw5UHhy3w3WwogIy73wEVaZEVX64RHlgHbUBwdp5UKkIRMK025F325Edv3nAxsOma
         m6kN5ARNOq2r0JleBJXUzRKSopAiUW+Bv8AU8t/cfAbsa9nowfjbJJdPTQAy3hYZXaAQ
         6frX7XdEv7GRwpdxTBc6GydtME/Z+hXhHecxAxPunbRt23CijdpBgvaREhqQ7jcQF5fQ
         xNyuINoYHTY/zneuOsjh+sOKgnu4bnbslhqqzcwSQhaecUi7kZ/fCg/yJQN8LDezd1af
         b1TXOiLuGJnlfcfeBH/ut+jOOiEKmpi6k+L6l0CbMty1ZJsBMbk4hON71kZ+j5VgYOwP
         QrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714989403; x=1715594203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s2OtRlS9dnyJBli43HIli/2qfBfNu58F4VWyD11DfUE=;
        b=ZzItR74Zma6yIM4ZFT2IHu6rcb223w8XQ/JYbHoQwNFb6vvB4OO3hugkAPgtSbHbje
         oyzpbhKtsk/grwVQPw3T23p43ePHAS8+XGzxAPYna+0jx02ZYoRMFO65A7Jx6ub4qYxG
         WLIzfUuMwzt9fdqI8MhRTQqNooFo3nW1+fx0yVGYrqfhHPvgdna/8U262aPuwyIQ5Ypb
         fvLWA2KnOF3Dn8UJmZG8cmeugdBEPjqUSMFQUICkoOOTIxqsaLbPFg5zFq4aTH/+PyrB
         3RzMNIww1gGl5c+tOe55W4dkXsBHB8x03AgFnMtA7IoQiHSsamX+qI/MTq47TRwtO5IJ
         nZ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXxge3bqvjaUzrV/oAPf7eA8G0bGCB1ZuZTyFhrYnTIjilJMclWS7x49sxwl76xZpV+DsCT3ImlqH+BdlplyVT5uylXlgIShf/G0b1fB0=
X-Gm-Message-State: AOJu0Yxr+DvZJJC4yVI7HLLTdZxdfKpU/uCI5KpS6nLVw0kaYdoD2qaW
	zsavPBIexYYmAXmVcVCVPPwQfUNq3BVhvPEjnNUAEjUtbeWWsrE93C6ftHCsWlU=
X-Google-Smtp-Source: AGHT+IEpGXuliabLS0yW1g8DkYrIw9Px9sWJY4J0BCzBVjcaQz/xa9RWsgkxol5KxbdMskmUDHBnXQ==
X-Received: by 2002:a5d:6dcc:0:b0:34c:f507:84b6 with SMTP id d12-20020a5d6dcc000000b0034cf50784b6mr7858286wrz.41.1714989403409;
        Mon, 06 May 2024 02:56:43 -0700 (PDT)
Message-ID: <47bd7984-39b9-44af-964c-d04620cb6e7e@linaro.org>
Date: Mon, 6 May 2024 11:56:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/17] softmmu: Pass RAM MemoryRegion and is_write
 xen_map_cache()
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Cc: sstabellini@kernel.org, jgross@suse.com,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, xen-devel@lists.xenproject.org
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
 <20240430164939.925307-14-edgar.iglesias@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240430164939.925307-14-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/4/24 18:49, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Propagate MR and is_write to xen_map_cache().
> This is in preparation for adding support for grant mappings.
> 
> No functional change.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>   hw/xen/xen-mapcache.c         | 10 ++++++----
>   include/sysemu/xen-mapcache.h | 11 +++++++----
>   system/physmem.c              | 31 +++++++++++++++++++++++--------
>   3 files changed, 36 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


