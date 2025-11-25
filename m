Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA0CC8370B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 07:17:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171574.1496591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNmMM-0000cX-2c; Tue, 25 Nov 2025 06:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171574.1496591; Tue, 25 Nov 2025 06:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNmML-0000Zd-WB; Tue, 25 Nov 2025 06:17:05 +0000
Received: by outflank-mailman (input) for mailman id 1171574;
 Tue, 25 Nov 2025 06:17:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RmC5=6B=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vNmMJ-0000ZV-M7
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 06:17:03 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ae53876-c9c6-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 07:17:01 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so53517665e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 22:17:01 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf3aef57sm221641805e9.11.2025.11.24.22.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 22:17:00 -0800 (PST)
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
X-Inumbo-ID: 5ae53876-c9c6-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764051421; x=1764656221; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PPPfFfN/KUZJSdg4GVyykKSiNQuZspsjOUrb6Yk6o8M=;
        b=HY2eL3QQTBJF4MyA3H36SEh9d8hsnNk777bseoQxaXwm8KlxVwMvLtDlddfbDE8WNW
         ZLAc8Z7giWut530xuEBeNbessbQKJGoKV2juqh05fRXtNMd0ePH4QQh0UD3zEp+HZ9xp
         mXZ9eyTKxmGuJRk/nBJTgg6CufzfFWMIwy2TRmro3hyNuTOspXW1fObD2y1s1Wu8QDNr
         sd/PCZfM+RRQKI2sXVhzs9HkzTPXKnfilmUyOGauVQgTpLLl+TEF0hL8ICJj/UqeU9R5
         9EP7LWfhjhpYGYm05Ey0MDKr+8jQ493kSe9N+8c9Q3jaIusc9ikFXUVdDJzQ7ViK2U7B
         /wnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764051421; x=1764656221;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPPfFfN/KUZJSdg4GVyykKSiNQuZspsjOUrb6Yk6o8M=;
        b=BDAvhCxZSlSvsE4IoUg23bu7GuCmv9h9+5JasE+o7Sr2RStbptcKvqP9E/J+3Ic9y5
         yPrU+k5JEBvEGnhTgUB/d91+MJpjf8dUO6PB4KHBF8qXubmaipJEwH/yEvWQ62M5qDHg
         tNqK0ehtXhR28G+wsTy3fO2SEXyOAVuYx1kbLfV1+ApxrqRjud/ktWBd/Hx18P/nJrXX
         vQwcAMHbT7SHg/njjYGVUo7Jui7HVqrc61SPMZkfE/Eq3t+q6JpS3V8VXrFFBirVrnI5
         I936z+TobJDGdiYn8Yw0kRBAuHlfqkB1kbFE6JhS5Dm9pkWDuhoSdaF+oGKInD0LJs4L
         R1vw==
X-Forwarded-Encrypted: i=1; AJvYcCU2xKOGprhKwvBCgx+r3j3K/XPmlaem8Dv3Kk5FOJyrNZ3WZ0aevGcvzt9ccw0AGH+T5+5cJ6QNdIg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLsWpXpPYj5utLAcpS1uWk3xcoaXl9Ac/I/NNaHXYlJ+kt392P
	d0rO+hxctocfXXlzXNISPVPHOxs/7oLgagjF4Ffmr5KwdiE7Yi1TZTcmijuieAQH2NE=
X-Gm-Gg: ASbGncspfs9jrJ0v8rWrD/SuosKTHIdVqtcSlwjKaBB2dxxfy0ckksoHzIf17UCqCpE
	VHI0NrD3ruZ/ZJR6yrJz3ttatrluTlqScpbUeiYcqYA75sWv8Z61Fo+3uknWDYjlP3T8u0K11BC
	Qq7FvKWYSgCsGF8dKRdnlV216+f2Tcn4Inyfh6DoFrwEemcdBIHe4CwU4bwirZ9zwXfDpfFdNzy
	FSH+zuU9ZnDwLJaOSm1QN6JqkDMf4fyhamrf9WDMWaq+I/AGEN2rC/SvBZet//T9OCrI2x3Zat5
	2GyxP8Kw+zovgUQtpDvF9Q2dWTUJmiMHEbXWtZVaMJdgHMji107gjM7rX/lvU9miVMEIs+sSO88
	1TKL1Bhx4ZhYHp1RHX4g/y4NUWZ4K29XGIgR6DP8lWCWRdjZAR00BB37v+ZJOs4a7Z8cnD97Jhm
	GcKjpEZX6tmwovHwIeFhTJmeXSR7dQ1++R6l4nvnBb4jS+20AxMwVw6g==
X-Google-Smtp-Source: AGHT+IEZ8yeE/n/51O0eDQmUGk/RzXgmUxX0n0wP7TPhPNjZtJBLXLV0NRiL/n6XCwlWTPrAzRjq6A==
X-Received: by 2002:a05:600c:8b37:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-47904b1ab30mr12560125e9.16.1764051420782;
        Mon, 24 Nov 2025 22:17:00 -0800 (PST)
Message-ID: <fed0991f-0ad8-4da4-a182-1bd0c7ec6b9f@linaro.org>
Date: Tue, 25 Nov 2025 07:16:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/15] tap-solaris: Use error_setg_file_open() for
 better error messages
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: arei.gonglei@huawei.com, zhenwei.pi@linux.dev, alistair.francis@wdc.com,
 stefanb@linux.vnet.ibm.com, kwolf@redhat.com, hreitz@redhat.com,
 sw@weilnetz.de, qemu_oss@crudebyte.com, groug@kaod.org, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, kraxel@redhat.com,
 shentey@gmail.com, npiggin@gmail.com, harshpb@linux.ibm.com,
 sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 edgar.iglesias@gmail.com, elena.ufimtseva@oracle.com, jag.raman@oracle.com,
 sgarzare@redhat.com, pbonzini@redhat.com, fam@euphon.net, alex@shazbot.org,
 clg@redhat.com, peterx@redhat.com, farosas@suse.de, lizhijian@fujitsu.com,
 dave@treblig.org, jasowang@redhat.com, samuel.thibault@ens-lyon.org,
 michael.roth@amd.com, kkostiuk@redhat.com, zhao1.liu@intel.com,
 mtosatti@redhat.com, rathc@linux.ibm.com, palmer@dabbelt.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, marcandre.lureau@redhat.com,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, qemu-riscv@nongnu.org
References: <20251121121438.1249498-1-armbru@redhat.com>
 <20251121121438.1249498-5-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251121121438.1249498-5-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/11/25 13:14, Markus Armbruster wrote:
> Error messages change from
> 
>      Can't open /dev/ip (actually /dev/udp)
>      Can't open /dev/tap
>      Can't open /dev/tap (2)
> 
> to
> 
>      Could not open '/dev/udp': REASON
>      Could not open '/dev/tap': REASON
> 
> where REASON is the value of strerror(errno).
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dave@treblig.org>
> ---
>   net/tap-solaris.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


