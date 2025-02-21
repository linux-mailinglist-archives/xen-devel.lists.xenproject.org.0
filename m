Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A2FA3F38E
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 12:57:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894396.1303112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlRep-0006vh-Sb; Fri, 21 Feb 2025 11:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894396.1303112; Fri, 21 Feb 2025 11:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlRep-0006tK-PD; Fri, 21 Feb 2025 11:57:27 +0000
Received: by outflank-mailman (input) for mailman id 894396;
 Fri, 21 Feb 2025 11:57:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jkcg=VM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tlReo-0006tE-MW
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 11:57:26 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03b9f32f-f04b-11ef-9896-31a8f345e629;
 Fri, 21 Feb 2025 12:57:24 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-54622829175so1829616e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2025 03:57:24 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091029b75esm28379051fa.103.2025.02.21.03.57.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2025 03:57:23 -0800 (PST)
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
X-Inumbo-ID: 03b9f32f-f04b-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740139044; x=1740743844; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0uKcYmDWg/l39t1zz7PJ/+8mzMURa3TLsZ9iTNnVZY=;
        b=LvD5kjWDyNdXNotjVB56xU9u8ABWDnD9h1EOnGHlL+P9S3qAdi0a8ukmJF5tF4uNrg
         oDIkfVWGo5gr1YRbe8VBENN+eyxX9scLBfLPhWekXOwvPrbvIwFqNmDz0w8oeldfDL7j
         Bsy3fe6bQ7N2ZVJwz1cAdo5mvM5lqtJwdZkKOv+rcIuWJywRk4HwNT4M9IM6CYeGCQrj
         Hh+jsAIFb8J4InCS7FnSeg+UOjtO37Ra2vLjrEmshhz17TQUXnCjjChByDBSfLLACf1V
         Ddo/RrLo/p3AV78fPxqOKhINkX6tYIKBDzjZ0YOXoNQpE/V3nSv7y7omxluVh6Taw9Q8
         edYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740139044; x=1740743844;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e0uKcYmDWg/l39t1zz7PJ/+8mzMURa3TLsZ9iTNnVZY=;
        b=DXvuFeo76Zk7hsOqJHPuyYKSLUHDSlwD57/d55oAlhTNEERbNfaT6UqeK8krwLKkHb
         bsC9egOkrraDFqgUFWgk6beEC3o4XUYTp4fKM6Q2kbz23Ub9wzEHoApcD5a/lgqUckzP
         AnO29NxrU8Qj0fxOQwq78lQF9jrFYh09MZ6pLfQhxpHXelkAGEIrfSa1BRQy3YzyMskA
         umfl9zNSPvie95wiV2MoA0czsejdnvHdBlX5/DXUvpFIUx6kRQqFg51+WMcSmoYLdrP/
         sIgS4bIlbVmJyvD/mbhBpd770Nowx4PCiYK/Kk0tXQchuV/IveE29haK8nVh/FLNyMO6
         i54w==
X-Forwarded-Encrypted: i=1; AJvYcCV72Ne9lWGYgbhnQN7fZciXbDAFqlNM476FUfrKDZ7fHjQJFD8oRWapo0Y6/eE0OVdRvX5W9p5NPTI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw2ZsiPyHaH6bEhtHOnAUsfYCUtPyLbbPtjMODRKUeC9d45IMla
	srpxvTRbeEkFguvz0g5CQGi048soKzaYv4KaSISNsTxbCoaHElGL
X-Gm-Gg: ASbGncslkaa6I/kznN38JLGkrGzDldDIGW5Yj+xiOFqmOb670bAOe7606WapbeTrxZF
	6Vd3URM8L0TSOycbiAmOKqN1ITsJ5+99lDoVGg0tyua5OAI3oBxvL2bcpaB7yQBChXXKEyTP3vf
	Madgfr50evEOocRRRmj+JWq0lLMcz7G+VKCFZ2Quir9ouwp3g1xB0VfUnPktwSMGXIt9W1LfOeN
	8CF21akyRW5yTCQbkVx4uFG5Z9YtqNsMfd/eI7y4PDMeEJOd67jJmW0pbfXNdv7gDVnkyY4B/7c
	Ymo2V3ZHlJIv3itmRDwmHwc/69Aa/RZkqXo=
X-Google-Smtp-Source: AGHT+IFKb6b4vR9JUq8n+dFUq/iIMi0tq4Ypn+ZdFFyQ/qOeoSj6IUMokReOR2X1ar8QADYERT2PUg==
X-Received: by 2002:a05:6512:2256:b0:545:280e:4b7f with SMTP id 2adb3069b0e04-54839145111mr1043022e87.27.1740139043760;
        Fri, 21 Feb 2025 03:57:23 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------GWo0QK5BBSvmCU5uz80l0Pqj"
Message-ID: <d7b833b3-780c-449c-a07b-3b7198a0fa62@gmail.com>
Date: Fri, 21 Feb 2025 12:57:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v7 1/4] automation: drop debian:11-riscv64
 container
To: Jan Beulich <jbeulich@suse.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1740071755.git.oleksii.kurochko@gmail.com>
 <659bd8c00e79be1a47fc2aae75accd69b3bedaf4.1740071755.git.oleksii.kurochko@gmail.com>
 <d2a9d3f1-0584-4c9c-95c5-5babf0ffde06@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d2a9d3f1-0584-4c9c-95c5-5babf0ffde06@suse.com>

This is a multi-part message in MIME format.
--------------GWo0QK5BBSvmCU5uz80l0Pqj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/21/25 9:35 AM, Jan Beulich wrote:
> On 20.02.2025 18:44, Oleksii Kurochko wrote:
>> There are two reasons for that:
>> 1. In the README, GCC baseline is chosen to be 12.2, whereas Debian 11
>>     uses GCC 10.2.1.
> Which README is this? Not the one at the root of the tree, afaics, which
> continues to mention only x86 and Arm.

I missed to add this patch:https://gitlab.com/xen-project/people/olkur/xen/-/commit/57901e60066e93d986670aa91fb390774c965d3f.

Would it be enough just to do a reply for this patch series and send what git format-patch gives?

~ Oleksii

--------------GWo0QK5BBSvmCU5uz80l0Pqj
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/21/25 9:35 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d2a9d3f1-0584-4c9c-95c5-5babf0ffde06@suse.com">
      <pre wrap="" class="moz-quote-pre">On 20.02.2025 18:44, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">There are two reasons for that:
1. In the README, GCC baseline is chosen to be 12.2, whereas Debian 11
   uses GCC 10.2.1.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Which README is this? Not the one at the root of the tree, afaics, which
continues to mention only x86 and Arm.</pre>
    </blockquote>
    <pre>I missed to add this patch: <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/olkur/xen/-/commit/57901e60066e93d986670aa91fb390774c965d3f">https://gitlab.com/xen-project/people/olkur/xen/-/commit/57901e60066e93d986670aa91fb390774c965d3f</a>.

Would it be enough just to do a reply for this patch series and send what git format-patch gives?

~ Oleksii
</pre>
  </body>
</html>

--------------GWo0QK5BBSvmCU5uz80l0Pqj--

