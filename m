Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1E3AB1FF0
	for <lists+xen-devel@lfdr.de>; Sat, 10 May 2025 00:29:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980456.1366914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDWD1-0003C1-TR; Fri, 09 May 2025 22:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980456.1366914; Fri, 09 May 2025 22:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDWD1-0003AV-Qe; Fri, 09 May 2025 22:28:47 +0000
Received: by outflank-mailman (input) for mailman id 980456;
 Fri, 09 May 2025 22:28:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZc7=XZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uDWD0-0003AP-If
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 22:28:46 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7d5a1fc-2d24-11f0-9eb5-5ba50f476ded;
 Sat, 10 May 2025 00:28:45 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso19009125e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 15:28:45 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd32f24fsm83663935e9.16.2025.05.09.15.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 15:28:43 -0700 (PDT)
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
X-Inumbo-ID: f7d5a1fc-2d24-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746829724; x=1747434524; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q6Mv2KUNJ1pEFAJxliR+wXXJ2uTuxdCYPeUE7WHu20E=;
        b=TEqzcS9vd5hfb8SjcUfPUtrORd87ljdH7kz4dc2ZdQFG/oA4oD1vHCWo7ELaUJ1NWb
         /avxvO5EVkGfCGOZTrnQNuM6yAM6sv5HNoFbW9YB9p9dZnM9Lf57VQ/+CzkoN6tFlF2M
         xUP5jmkYG6pzZ1wzHOF7VC3L8N4rz4FIAJwrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746829724; x=1747434524;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6Mv2KUNJ1pEFAJxliR+wXXJ2uTuxdCYPeUE7WHu20E=;
        b=V8EXVP2oGd7iCmTlmY3+UU97156fzNlkDMS/HBXTIaWCkgkLooBc2aMowrKttwM1Ik
         cUfktS61hekK87s77A9HJdyS0lXAxhvdBc+sIErdtNUyLrEVYuc2LIw95JMJ2S92ewch
         T0deQotL5iNhSeH43cWCxBYn57ngbia6hw1LOy1YN81bQZ2jr/H6q8jN2Hk3QHAiXndy
         2Y+Z7IiIRFI7bBBGqam4rmvLQg2qkk892YKWhBdZtfpfnm2X23r3DJPFjAQPC+Z3HlZH
         Wodmy73KyJdHYm5MDsYZ8h2nvbba9tKFXWKUwXSxf3iPGvAG21DUSkg9PpvGX5Ikoize
         8Irw==
X-Gm-Message-State: AOJu0YyQuzi5vF5Me4X9hlxutmJ2gA53dSkMAUV+OxqrUcCiESTZhF0M
	F+j6baoPc7niWm1ReeCIkD+GZeHJiA+MQ0CsU5boyx6VqUDLWKHEZNHuEXCIhz8=
X-Gm-Gg: ASbGncv7hVvnHU/T7izhvrFtsda5Ha3wHlYspPL+5PB1uGUKrt0HUe7t5AS27mm6j/Z
	JMAPDxaAcCgC6ku1kukNdddiAuHJH8StHEdRgRJcZzL+kUzH1ydPGG/oj1/HfRL1cRXDQew7kB3
	S9IZIfd8f2C0y6o/zUx8AliINJFWRYf8GQiAPXMkynMAYyPmrOf/Z40EHzOOB+tb2jPlMzYiXhr
	t43MAcUoj2I6x10/6QckmJ1eQogElptFi1oo/2xLibFriGqR9t/uKJ8fYmlYD1OvtDBhtp9+v4l
	uITw0nUr42JsHugpZbCanamVrtKlz14Ur4NX7tH/Bqax9EXxe23+lTCxkFyXaVUvBile2qFEC1R
	wLsD04a/DOwfvXdfFpbXFRzLGhtw=
X-Google-Smtp-Source: AGHT+IFN3xO/KhMKZUHcxpXbrpXezOjFti6lE4V+tAC6aU7badc5rhgXG02hmj5P6BBVPRFw/p6aSg==
X-Received: by 2002:a05:600c:4e45:b0:43b:cd0d:9466 with SMTP id 5b1f17b1804b1-442d6d44b3cmr44554575e9.9.1746829724392;
        Fri, 09 May 2025 15:28:44 -0700 (PDT)
Message-ID: <863d49fc-22a2-4bf3-880d-5da331c73f8a@citrix.com>
Date: Fri, 9 May 2025 23:28:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86: x86_emulate: address violations of MISRA C
 Rule 19.1
To: Stefano Stabellini <sstabellini@kernel.org>,
 Victor Lira <victorm.lira@amd.com>
Cc: xen-devel@lists.xenproject.org,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250502233535.3532279-1-victorm.lira@amd.com>
 <alpine.DEB.2.22.394.2505051611190.3879245@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2505051611190.3879245@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/05/2025 12:12 am, Stefano Stabellini wrote:
> On Fri, 2 May 2025, victorm.lira@amd.com wrote:
>> diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
>> index 8e14ebb35b..d678855238 100644
>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -527,8 +527,8 @@ static inline void put_loop_count(
>>          if ( !amd_like(ctxt) && mode_64bit() && ad_bytes == 4 )         \
>>          {                                                               \
>>              _regs.r(cx) = 0;                                            \
>> -            if ( extend_si ) _regs.r(si) = _regs.esi;                   \
>> -            if ( extend_di ) _regs.r(di) = _regs.edi;                   \
>> +            if ( extend_si ) _regs.r(si) = (uint32_t)_regs.r(si);        \
>> +            if ( extend_di ) _regs.r(di) = (uint32_t)_regs.r(di);        \
> NIT: code style, alignment of the \
>
> Can be fixed on commit.
>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

