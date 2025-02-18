Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59402A3A04B
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 15:45:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891780.1300825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkOqo-00067F-Ue; Tue, 18 Feb 2025 14:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891780.1300825; Tue, 18 Feb 2025 14:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkOqo-000657-Rj; Tue, 18 Feb 2025 14:45:30 +0000
Received: by outflank-mailman (input) for mailman id 891780;
 Tue, 18 Feb 2025 14:45:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J6eQ=VJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tkOqn-00061H-M8
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 14:45:29 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe803af1-ee06-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 15:45:28 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso36446585e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 06:45:28 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f7979sm14980182f8f.83.2025.02.18.06.45.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 06:45:27 -0800 (PST)
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
X-Inumbo-ID: fe803af1-ee06-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739889927; x=1740494727; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZkqYJNgrmr8nrxZeCLkbegx8IRhLuMnWymVqkuxHe5k=;
        b=S57peWW55dl6hhpBKGEEy0oPat1C3DQDCYp0GoquvAj0d7wIFp1jmiyObQPGS71KKv
         153iv/MlN8zL4zTYYJLD6Lkd+AzvvYQhcoyAgKIk/vn30hFOOjUEj/mxG4C/OTiXtqKX
         UVbf79jc7eMCJkChIMIpe5PW5lfh1fDB/zbjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739889927; x=1740494727;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZkqYJNgrmr8nrxZeCLkbegx8IRhLuMnWymVqkuxHe5k=;
        b=SpL1NLVFGn03PH6AyTIXp2pdTOF7EYqE7jnQOz/e2CnM2kcsSVVg5q5L2x3X98ANS9
         MLAKN/Fj3i6+z94xW3kxkRH1Ze5hfMTCmfXJQiH7WXaivfRtHj4gWzUElmd5wlspB/vV
         nzPIPuFD6+oSygmf6Mzkc4h+SHzeuTsFxzWdqq/7RJ0wS7HkoH5KrT+p+KEEDl2Y2JBX
         V6NJ3wS1UzJU1VXrtnuiE+vl7ZvtIRFi1JU2G/HaX+fPtvJIortnG8MqHEHEF8/Snty8
         qSS8ICgwuMhrMFQYnwDvoSAyT2Ax6pm9QzJMDW5r0HtQsznQmZ9pIaz0/aZMfy1gK6V3
         a4WA==
X-Gm-Message-State: AOJu0YwN/2Z/2BFwlhTNVzEVURFFZbTxbF4+vMB+d0jUld+0+ldAZg6Y
	b4EybM3dP0bJcJcgzlYimqQUSHq4An8MjvdfKFyAMmrqz6JR6Vg26Jlwc2dzM5g=
X-Gm-Gg: ASbGncv+dTliIjFEol5l8ucCzE/O8RiapManjumSIl8PHggYBM1PFsSfhuvljt6j3CI
	Gb3yyAJs1gu+hPy7rcrrico7jCXxRT9iDS5m/eHJ2+o1o4i9qPZM0J5VQ2bcNVJvzsDF1NL9+lV
	nvfeN/N3M6Rn8fSrDLkHrz9aY8jIdzQKPZKfr0vLbxtDreR3r6BF63pPaktHywYT6PtPn1a9/FH
	9ldUcm6wyWKs9He4xs2ExlJ82+x1QAxiSVv4V+RUFl7qMRGbtM658rswhXfLhvrTXXgX0R5WhUs
	iaHpZvC0tebA72mx1QCOb3WBgvvrrUJ0Z/3WQtVmjjkPqzU8q+aMIn4=
X-Google-Smtp-Source: AGHT+IFYVft/kIJ+62HRRV+TEZ1h+c9NaxmdTMi1gBSsWG4/UI9ktxis/Z+A4Ozx1gZZy4EejEhEpw==
X-Received: by 2002:a5d:5888:0:b0:38f:27d3:1b3b with SMTP id ffacd0b85a97d-38f33f11925mr11692128f8f.11.1739889927464;
        Tue, 18 Feb 2025 06:45:27 -0800 (PST)
Message-ID: <22d66aba-45e7-46c7-9aaf-7809a9fadb80@citrix.com>
Date: Tue, 18 Feb 2025 14:45:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/svm: Separate STI and VMRUN instructions in
 svm_asm_do_resume()
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250217161241.537168-1-andrew.cooper3@citrix.com>
 <20250218143739.623451-1-andrew.cooper3@citrix.com>
 <799c5a1b-d083-4b93-be44-a204a8b845f8@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <799c5a1b-d083-4b93-be44-a204a8b845f8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/02/2025 2:42 pm, Jan Beulich wrote:
> On 18.02.2025 15:37, Andrew Cooper wrote:
>> There is a corner case in the VMRUN instruction where its INTR_SHADOW state
>> leaks into guest state if a VMExit occurs before the VMRUN is complete.  An
>> example of this could be taking #NPF due to event injection.
>>
>> Xen can safely execute STI anywhere between CLGI and VMRUN, as CLGI blocks
>> external interrupts too.  However, an exception (while fatal) will appear to
>> be in an irqs-on region (as GIF isn't considered), so position the STI after
>> the speculation actions but prior to the GPR pops.
>>
>> Link: https://lore.kernel.org/all/CADH9ctBs1YPmE4aCfGPNBwA10cA8RuAk2gO7542DjMZgs4uzJQ@mail.gmail.com/
>> Fixes: 66b245d9eaeb ("SVM: limit GIF=0 region")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2:
>>  * Move after the speculation actions.
>>
>> Emailed out just for completeness.  I've queued it in my for-4.21 branch.
> It'll want backporting, so I wonder if we should persuade Oleksii into
> taking it for 4.20.

If Oleksii is happy, I can put it into 4.20.

~Andrew

