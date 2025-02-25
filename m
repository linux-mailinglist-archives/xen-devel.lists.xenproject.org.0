Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FB9A43FC0
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 13:55:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895784.1304431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmuSQ-0005OA-Lv; Tue, 25 Feb 2025 12:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895784.1304431; Tue, 25 Feb 2025 12:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmuSQ-0005LF-ID; Tue, 25 Feb 2025 12:54:42 +0000
Received: by outflank-mailman (input) for mailman id 895784;
 Tue, 25 Feb 2025 12:54:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MqP+=VQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tmuSO-0005L8-ES
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 12:54:40 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9f49101-f377-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 13:54:35 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38f3486062eso4708137f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 04:54:35 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd86cc8bsm2249892f8f.34.2025.02.25.04.54.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 04:54:33 -0800 (PST)
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
X-Inumbo-ID: a9f49101-f377-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740488074; x=1741092874; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Sa0E1jHupZ+PsjrfW8QjiTdx67hLaOO+YIbXCl6dwro=;
        b=XMzK3k1wQ0Vjy+yqEYNw/CPGTaGgd5iKjopZreRXEjMsu3KnOXkQITVXVFcPHVb8N+
         xPOSHE2Cl2JCCbV0+atwF7bqy+fFc2TmRXZPaTvjV5FmXt5SmYQ+hHLYPm5eFI9iXfE3
         qvc5nFlsBbXGeWWaFwvXS1+nJz0UR/gd6FpRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740488074; x=1741092874;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sa0E1jHupZ+PsjrfW8QjiTdx67hLaOO+YIbXCl6dwro=;
        b=QZTvvaMj3OX6riqbYpHC/1FRa+pMcmin017SkWS8z0HGLCZCPsvGQcgt2a8cKgbJ/4
         0/hnJrnUfcbjtrJllaVyBXFik2iXPNToJI+W0HFVw5WLfwTfYO/z8w5iyf0zg9ON9L0X
         B8UaUfXUh57T1LQ18WeIarTbzK+cCiszk3fbC6siYu5frqx+qEYBlnLP/snCsMe88zzf
         pNNUjues1Q749l36AJdDS+ABNAgJatFH1ZKkHPZzsm2tfI7/X912Hwc7f69ia7Y9lx1t
         4znpVRMPqXLrOLKzR2rguxLEIBc8UqOh9Jxv0952rBhp8uPLW5mEaDZpyodiYN3MWtVI
         7QOA==
X-Forwarded-Encrypted: i=1; AJvYcCWeRK7GL0ZEcfMDJQ6BuokLJV0X/fjLsnqUzm+k5vDrxhkLJE9TBUSqJlwmKkvXWhMoCn7oEG/tXgk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxAz/mbaqaMjgGA1+T22zvSwXXzeb/FIJ4USNNMeoBupK6wvaU
	r/JCDj4dx/DzSynb5/rc+eYfab2pX/uTJ8Xqa6GsEIxr0KZ6GrQdwZ6DKFdjD1w=
X-Gm-Gg: ASbGncsgRCAraC7yHr/ILkwVep1CRYX+NLMHYNIFyfugbP91aNqtmPuEhUc3lAr7Xw2
	QUEYgBMYsCfF1rQD1/7iHblNv8H2hXiHdqwee/rMSCTpSImy0hkNzgGvNH3v4jR8qbWJ5dog97X
	ug6tu5vH05FhtfM9kCmKrFhnY2/C/OyaVbeyOzofdTr4DL/rnw7Ne3MaHxO/tszUsYk//Ztp8Tn
	E7HAZ6lve+yZbZdqAC86ysEYLKgUoXqEikmicbvDQUK9ZUfgn74yL95MtTc70XxD8EtnhDXtsA+
	X9tfcVmAy3ppTI8UkvzkbCfgrt7B5XVlyBr6l8hDqTGe4bBxjiLyZgX/MoUauM2zbg==
X-Google-Smtp-Source: AGHT+IHO/ftvQVp37QRG/w0gD77A07pZPYJilf/j0cILG6ZH3alxBm9ays1mosyeNMSA0qhcm4WFOw==
X-Received: by 2002:a5d:47ca:0:b0:385:d852:29ed with SMTP id ffacd0b85a97d-38f6f0affc2mr12784609f8f.36.1740488073970;
        Tue, 25 Feb 2025 04:54:33 -0800 (PST)
Message-ID: <0ced63b8-e674-4a88-a979-ff807afe3576@citrix.com>
Date: Tue, 25 Feb 2025 12:54:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] x86/IDT: Rename idt_table[] to bsp_idt[]
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
 <20250224160509.1117847-5-andrew.cooper3@citrix.com>
 <fa0cd84c-a3a7-44c8-af62-3e8da91a6d1a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <fa0cd84c-a3a7-44c8-af62-3e8da91a6d1a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/02/2025 9:00 am, Jan Beulich wrote:
> On 24.02.2025 17:05, Andrew Cooper wrote:
>> Having variables named idt_table[] and idt_tables[] is not ideal.
>>
>> Use X86_IDT_VECTORS and remove IDT_ENTRIES.  State the size of bsp_idt[] in
>> idt.h so that load_system_tables() and cpu_smpboot_alloc() can use sizeof()
>> rather than opencoding the calculation.
>>
>> Move the variable into a new traps-init.c, to make a start at splitting
>> traps.c in half.
> Hmm, I'd expect a file of that name to contain only __init code/data, and
> hence for it to be possible to ...
>
>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -65,6 +65,7 @@ obj-y += spec_ctrl.o
>>  obj-y += srat.o
>>  obj-y += string.o
>>  obj-y += time.o
>> +obj-y += traps-init.o
> ... use
>
> obj-bin-y += traps-init.init.o
>
> here.

AP bringup and S3 resume will have a rather hard time working if that
were the case.

Plenty of it does end up being __init, but not all.

~Andrew

