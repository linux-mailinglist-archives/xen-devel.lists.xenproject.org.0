Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B2C7A0E54
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 21:28:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602677.939388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgs0Z-0004Kx-3q; Thu, 14 Sep 2023 19:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602677.939388; Thu, 14 Sep 2023 19:28:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgs0Z-0004IA-0a; Thu, 14 Sep 2023 19:28:11 +0000
Received: by outflank-mailman (input) for mailman id 602677;
 Thu, 14 Sep 2023 19:28:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uqVP=E6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qgs0X-0004I2-D1
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 19:28:09 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4f629f5-5334-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 21:28:07 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-31fa15f4cc6so1241760f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 12:28:07 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f4-20020adfdb44000000b00317f29ad113sm2539572wrj.32.2023.09.14.12.28.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 12:28:06 -0700 (PDT)
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
X-Inumbo-ID: d4f629f5-5334-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694719687; x=1695324487; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8RBeXJcgmWMKJvqZB5m47b/HjX9bLYO318KdOcckF7w=;
        b=mbHywGf9eslFPJvXI0gEw+YfTVlU4ZWwcw2IVU92hppno/LtCdQgfg6m3XjvPwZ0pD
         ot6ZRbhklbD1y7TgK5MnHZay6Z0R8Kkc/KzYjT860RRBCaaILqz3vLEL3hpuggT3ukhl
         ojhhXs+O/XD6YHqK4VOUNgUMCRgX2ruPOObS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694719687; x=1695324487;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8RBeXJcgmWMKJvqZB5m47b/HjX9bLYO318KdOcckF7w=;
        b=kGsBAjQnP75VLOlYkrob1WgJn73RhEfxsVi1ikEGhWGIAUGJr3RECyvEDiX/fEfpCI
         XWwOsirvHfQ3qhlxEsBPxOlIqeNS0b+pepJ/6cRzl/f6b7pG9ORCdSn8nthXUuhA3F8d
         9FWcc5+4ktCGdPuAtRHTF85/K5wA6Z3VffudEd0CNUSfTCsUeG/r56SvQ+2UnX8kvet1
         0NGrhpdlUEXtMdbxhRv9HApXHPsvRbls06c/IO1Cxhc6HurqUd2hNepwbWIbtyKhw8m1
         FbVsv2DGtkLPaBpg1F/n/yF0CnjVoY78fAz6sQHX9Pr82dZM0jC3CDP8V/l0DTepYXfj
         FnvQ==
X-Gm-Message-State: AOJu0YwXwj7jM4YeXvv0xVeYKSu5xpaSA+2vY5yU8tYlghtQSrEOH4MY
	fEZo9mHgy2EF5YtPCrrN5F5+thd4hJqxyU1OYqIP2w==
X-Google-Smtp-Source: AGHT+IHt512bZZk2GGdLMy2BDHdamN+s+RVlUweHqYB2wa48x4R+YqsqHN2UlKVUwX7vxSGvpEjeFQ==
X-Received: by 2002:a5d:5149:0:b0:317:6310:a616 with SMTP id u9-20020a5d5149000000b003176310a616mr5873998wrt.36.1694719686745;
        Thu, 14 Sep 2023 12:28:06 -0700 (PDT)
Message-ID: <0ab5dbd9-4bc4-8c3f-ea37-36454adb141c@citrix.com>
Date: Thu, 14 Sep 2023 20:28:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/8] x86/entry: Adjust restore_all_xen to hold stack_end
 in %r14
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
 <20230913202758.508225-6-andrew.cooper3@citrix.com>
 <099ac89d-ea37-352e-940e-91993c1649d9@suse.com>
In-Reply-To: <099ac89d-ea37-352e-940e-91993c1649d9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/09/2023 9:51 am, Jan Beulich wrote:
> On 13.09.2023 22:27, Andrew Cooper wrote:
>> All other SPEC_CTRL_{ENTRY,EXIT}_* helpers hold stack_end in %r14.  Adjust it
>> for consistency, freeing up %rbx to be used differently.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> The choice of %rbx was, iirc, for avoiding unnecessary code size increase
> (due to extra REX prefixes needed in some of the affected insns). I
> understand you view this as not a real concern, but I think saying so
> explicitly in the description would be at least desirable. After all there
> would also be the alternative of further parametrizing the involved macros.

Yeah I'm seriously not concerned about a REX prefix or two.

This is about making all the helpers more consistent, to cut down on the
number of errors involved in modifying this mess.

~Andrew

