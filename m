Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7301093BC84
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 08:25:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764647.1175138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWrul-000649-1e; Thu, 25 Jul 2024 06:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764647.1175138; Thu, 25 Jul 2024 06:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWruk-00062P-V3; Thu, 25 Jul 2024 06:25:22 +0000
Received: by outflank-mailman (input) for mailman id 764647;
 Thu, 25 Jul 2024 06:25:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/jnY=OZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sWruj-00060X-IB
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 06:25:21 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa686db8-4a4e-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 08:25:20 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a7aa4ca9d72so23357666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 23:25:20 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad41983sm35993866b.108.2024.07.24.23.25.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 23:25:19 -0700 (PDT)
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
X-Inumbo-ID: aa686db8-4a4e-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721888719; x=1722493519; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DQTDIw25o9tj4BCQ2SvHzxN+J5CCzsukrTbMLcryhQU=;
        b=PNGCtsktbCLUnPV7BYe26m0fuk/4Z5ybxMYGd7rCm4VPIRr+FLERi0lKUnCqDkB8lE
         lvodwOY67c7Zqrn+Oq6RE00iUjMOWaVrERDEvsD1a+9cdps6xghs3s+HQ4DVsFHldfrP
         u8rPUZiEJO72vBMlk+JV2yXqzQxk0hppgkq8Cxs+SNzQ2f+IknDPzqz/CLcqMflhZ2Am
         ZJPJqFV9MKEBHB0f6T82KsBlv+PFTJMBvkeicsa6dw5r8rqYRc+q46JgBRaz7QoiSWxl
         KBUbtuocRSm7PawEOv8/xm3pu8Kut/FLh8Y4RMVK1Enius6095lZzBO6S1bzreeEEJPu
         FT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721888719; x=1722493519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DQTDIw25o9tj4BCQ2SvHzxN+J5CCzsukrTbMLcryhQU=;
        b=TEwSuTPDZhJsaaDQPIg1C9d8aotOUmhNT548UnM0RAzILQyNuRja5QsAvTOO7C+Mx6
         VoxlbHKXiiUe8qMUeUH0Sq5roplEaJmmeCODqfow++6IHuf510Nb3FPnamgulZih+Avz
         hO3/XSy0SwHdReWRolW8W/j7Qz2DNJ3UfrCezZGjA4d2jZ5WiHDLtmk46mCBxvTYwMN5
         TXklU9zmqyNXNlHc+RlxWVhiz2punHQJe7AQEnXGbQmLyPzdQXFnKVJWrk+gis3x1PYQ
         KfJIxFsOJxOr60GFEpjV+nDT+paVFsQbV/HbZgvUWeINFfcjTf7IMd6DA/jQivbJqtpK
         ak5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUC2qaAJWtE+IrS+QUgO48j2tOiRooBUinK3dYWGsWQR6lmPxQrtYkoh2c12F6It9TQQ5/QssBJHckfF8zUkWoqSvwT2HQ2/kFQH6lnBJs=
X-Gm-Message-State: AOJu0YxsJe6r19gysPOYoIJe1rfMymtpEuff+o+q2xBA8x7RT+1VAfaK
	sbo3vkpAjB0yGJhrW56X+dWr1U47RjUtDXCcvzDJRZb3EquolRgWXX5iR7FYz2g=
X-Google-Smtp-Source: AGHT+IH9XJZZ/soxZciMQtO7yiJTM5uei0LGraN598e42YLk/RTTRYj/7cJIBsI3WCnySWiu/cd7BQ==
X-Received: by 2002:a17:907:a08:b0:a7a:ab8a:384 with SMTP id a640c23a62f3a-a7acb931dedmr46908866b.64.1721888719376;
        Wed, 24 Jul 2024 23:25:19 -0700 (PDT)
Message-ID: <7b76ceae-181d-4371-8feb-195fd4cc6d90@suse.com>
Date: Thu, 25 Jul 2024 08:25:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mini-os: remove sanity_check()
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20240722150141.31391-1-jgross@suse.com>
 <20240722150141.31391-5-jgross@suse.com>
 <20240722213544.hjyohnoz4mtcfltr@begin>
 <884d746c-47e4-4d0f-87a9-e2a03d2a3286@suse.com>
 <20240724224431.jelemlo6tt2jgaw2@begin>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240724224431.jelemlo6tt2jgaw2@begin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25.07.24 00:44, Samuel Thibault wrote:
> Hello,
> 
> Jürgen Groß, le mar. 23 juil. 2024 08:36:13 +0200, a ecrit:
>> On 22.07.24 23:35, Samuel Thibault wrote:
>>> Juergen Gross, le lun. 22 juil. 2024 17:01:41 +0200, a ecrit:
>>>> Remove the sanity_check() function, as it is used nowhere.
>>>>
>>>> Since any application linked with Mini-OS can't call sanity_check()
>>>> either (there is no EXPORT_SYMBOL for it), there is zero chance of
>>>> breaking any use case.
>>>
>>> Don't we still want to keep it around, at least as formal documentation
>>> of the expected status of the list?
>>
>> Hmm, is it really worth the extra code?
> 
> I have already seen such kind of piece of code getting very convenient
> when tracking odd bugs.

What about putting it under CONFIG_TEST then?

This would keep it in the source and it would even be compile tested by
a simple "make testbuild", which is a simple test I'm always doing
before submitting a patch.


Juergen


