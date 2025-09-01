Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4611DB3EA8D
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 17:32:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105072.1456041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut6VX-00049K-Kk; Mon, 01 Sep 2025 15:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105072.1456041; Mon, 01 Sep 2025 15:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut6VX-00046c-He; Mon, 01 Sep 2025 15:31:47 +0000
Received: by outflank-mailman (input) for mailman id 1105072;
 Mon, 01 Sep 2025 15:31:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wdOO=3M=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ut6VW-00046W-19
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 15:31:46 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4315227-8748-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 17:31:44 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45b7ebe667cso27437205e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 08:31:44 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e8ab093sm166520455e9.22.2025.09.01.08.31.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 08:31:43 -0700 (PDT)
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
X-Inumbo-ID: c4315227-8748-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756740704; x=1757345504; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/LCK3BYblwS3dsjFLWuWr7rz3GUXXMtWjPl9RMAgLf0=;
        b=UR2FT+icR83dTcjOgYHfVgR7dOtHAvNizDlauOcMsUCauz/o0DC02s2FWbowM3Yw5B
         CPUmL5lGenKorgoaN01d1eLQ8tFurNIngXkNlD1cEm29+GbZ71tSyfjztY/U8MVZgC1x
         vaG70lk77ISBOxHpng1p9gsjUzCbaAya7cgdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756740704; x=1757345504;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LCK3BYblwS3dsjFLWuWr7rz3GUXXMtWjPl9RMAgLf0=;
        b=tpQoBrGnC7QfNHb967uE6xob/4rndH5cXg5UwUZIoVBNjBiHZ6wgEGtW6FfEzwbL+M
         HYb1Pm7N4Z8KDZOz6jQ5xy+u4MYrnrwx/vwYTgkGuOJ+Qjq/aaaLkDe9mZD7LViEfY/A
         rqVCaPYVupowcOf9PGBe/lmTzEEtArLu8FOrEbAuNo0M1ecd0YmBSghYrqxMf3C+mkJH
         1OSLL5ZaGXfRx0lSWAvOqIjQyHX4yiD8JLAlSiBYZpFIR1szp1cvp14oIstV/jLBxSPQ
         S2RBxHwP7cIVvmwZCaILPyK6bxZPMglYXHTLtb7BS4bHFPvM2egm/9LGV9ix2qzkLYS0
         m5kw==
X-Forwarded-Encrypted: i=1; AJvYcCWXrfxg2ioizP2+QQMJo5lHjzGWsdS76xpGgt7TEDOOSinmaBff6gcen/lt2ajiOXp/Ru6GXoLVeIg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwY4uzAGzSZtHbVFx+Y6/sQQFCDqs4gbbFMlQ/pH6DZ+GyHxtlm
	2qiPSM9DS89pXa+rmbdHYPqbov2X+3GQpaYNgjWibSWodrkGy/paciMHItvijP/UYPo=
X-Gm-Gg: ASbGncsxbm2EPMg/zRmKOY3o2eeLYdml+k5o29yq4x7Tt88Q7hGL0OG+vxadkMHW2Og
	MAKibHX+ZKpOXDLUz+5DBBu5h7hR675xRKCm89pIOnwiLTiGOllMxqltOs5B8rGipvF74uMZY3+
	hljiTEXvz6JHWSJkZrHN6m6tyKXe7k+jUECPPahwQ5AFKPjlguGLeQKJYg1UFvmik+u/Jw+k3yB
	wkFbdCEy1pg1hRkZyUR0sYADuVTTBpaBPoKpF5OnP0KDQFJDNejr6gFeP7gjJ5U+2HoVEldv17L
	N5PIUFtHCyMTp29DmFNNON7AzSSyNk1J+rfb9I/r3kmtwK8g26QyP/FtZWi74OuTIVFnTZ2cUOb
	gb7PWob4ENkebyh1M/02aCrgAE4nMzXED8KIesuo+Q37Zbfdi5f5h0zj05R1SF6L0dd89MOsGq5
	z3q/U=
X-Google-Smtp-Source: AGHT+IFY+lKnQqiijWQO976vlEf/aScdW0PLwWCX2h63TfumaSkKsvmwXGy4fzJl41KaVXv4USystQ==
X-Received: by 2002:a05:600c:1d07:b0:453:2066:4a26 with SMTP id 5b1f17b1804b1-45b8553417fmr85561705e9.16.1756740704281;
        Mon, 01 Sep 2025 08:31:44 -0700 (PDT)
Message-ID: <677b8273-af33-4652-b81d-cf0748722515@citrix.com>
Date: Mon, 1 Sep 2025 16:31:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/23] x86/traps: Set MSR_PL0_SSP in
 load_system_tables()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-7-andrew.cooper3@citrix.com>
 <2ae92f1c-da23-42d0-a1cc-70dff04310cd@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2ae92f1c-da23-42d0-a1cc-70dff04310cd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/09/2025 10:23 am, Jan Beulich wrote:
> On 28.08.2025 17:03, Andrew Cooper wrote:
>> FRED and IDT differ by a Supervisor Token on the base of the shstk.  This
>> means that the value they load into MSR_PL0_SSP differs by 8.
>>
>> s3_resume() in particular has logic which is otherwise invariant of FRED mode,
>> and must not clobber a FRED MSR_PL0_SSP with an IDT one.
>>
>> This also simplifies the AP path too.  Updating reinit_bsp_stack() is deferred
>> until later.
> This last sentence looks to be ...
>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> v2:
>>  * Extend comment about clearing the busy bit.
>>  * Move reinit_bsp_stack() hunk into this patch.
> ... stale, according to this. Other than that:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Oops yes.  I'll drop.

~Andrew

