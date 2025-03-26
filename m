Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14390A715D0
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 12:33:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927638.1330358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txP0X-0003aK-Rg; Wed, 26 Mar 2025 11:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927638.1330358; Wed, 26 Mar 2025 11:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txP0X-0003YK-P3; Wed, 26 Mar 2025 11:33:17 +0000
Received: by outflank-mailman (input) for mailman id 927638;
 Wed, 26 Mar 2025 11:33:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16MU=WN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1txP0V-0003Y9-US
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 11:33:15 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ad5d4a9-0a36-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 12:33:14 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso4924305e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 04:33:14 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f332adsm232190655e9.3.2025.03.26.04.33.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 04:33:13 -0700 (PDT)
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
X-Inumbo-ID: 1ad5d4a9-0a36-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742988794; x=1743593594; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wz1pPojnD86FxiGPp1RtCzUAV+1N6fuxzKDY+mWmWss=;
        b=OkGjHxmQliUa9Eb4WZ4qxw3j0frULfdsxADq1mTlfdS0XjmFS+sPRD3gpzEp8ySGD7
         gHdRjL27C0FhZFs6g/+JDhMvkYVoRtX6fJ8ExonJLnzNJDw12O8nMy436q8VsUUL5Kww
         i492+Fdjlh9EDo+uBS2XgGaF/N84LxyQA7roY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742988794; x=1743593594;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wz1pPojnD86FxiGPp1RtCzUAV+1N6fuxzKDY+mWmWss=;
        b=v+L+I+UiFyzKxMOCy5Y62M2HhIaGFT8npMRzmRhroYOyOZwnDUIjoHmLZM8sO6vITF
         ts2Y8A2IByV2f1vt1q49N28RvNXkF+JWEGPu6CJs5K9lFVhw4Yni7uS1TMz93qBH4YxY
         L4pAwEeoXKbAgarVTHeoHRdJ4gzVMTO+1TGOwH6kiK9+4lzkT0VGXCvNWfWk7dAnmWS+
         seDtlkyqavjQDTRyFIH2yoRZNvo5J9Grh7QbCyUYYnpGJfRzhlLHVLZkguzIClXV4JzL
         Dn4e2RpArF5eHCT8r4lNFNO4OD1NrxyCo4w4cBsh9vMaf6jfW/AzOSby3/6iLd3tjpIG
         k0Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVPhJf2hZJGZgbgmK+sKErpyCAQ9HdIm35DrjLOHxDF3BPTrE+NvG/dIUTBq/NHy+5zoA7B/wWVzi4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGfsRM0k7JnveRcjJ6P/9LzWFqqjiEuFhq7Z+G6HK4lS9li453
	Ee5y9jB10MUva6WmbIF+SZW2lyvIj3PUNeqh8a0Y8OBDqR61AdGsSftPdIPuYr4=
X-Gm-Gg: ASbGncsPpBL7aeO0sXVb5XEId2rVJS+P3zM3eKMlU90vOA5yXj0d4FPl3JOzryTUyv9
	TZ9w4jqGpVciSu+eGuzXWq+IFLUu2YXZoKDnBFvVfD5mfI0BspEwP8fgfCEn6tcDXtSXKFuSgkV
	xmmlqKAeYiZpfaiQxQyRTHtbiPVenLwzctVgEi0RjRFdqqA9dzJMNl7HhpC9RtRSG9cCHZ8cA/J
	yX6lcchSj/tdritENcMFcJkCkrhfMELH7/E6X5Qyxq5pBM1w5IBVAC/LXkT862XDN5qUw4xh/0c
	xiTmLgPQSH8jBNRMPcssV7HkhIIXAN92Jqe9yZgT5Y17yyOvOGkxEX5PJK6T+q6ZACV9zAVhNFm
	khhAjLmfy1g==
X-Google-Smtp-Source: AGHT+IFTDL+Bude+LviDN/fc/na61tKpfS4sFR6Ce+5Ujedmn1sbVT/yr3DnYB9BLKqdyGiE0IWFiA==
X-Received: by 2002:a05:600c:1d01:b0:439:8878:5029 with SMTP id 5b1f17b1804b1-43d77547ecbmr30941275e9.2.1742988793811;
        Wed, 26 Mar 2025 04:33:13 -0700 (PDT)
Message-ID: <c8e1d6fa-a77e-49bb-930d-372686df0c92@citrix.com>
Date: Wed, 26 Mar 2025 11:33:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/emul: Emulate %cr8 accesses
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250325174109.267974-1-andrew.cooper3@citrix.com>
 <20250325174109.267974-3-andrew.cooper3@citrix.com>
 <261b12d9-7125-4cee-acd8-a8ab3287b05e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <261b12d9-7125-4cee-acd8-a8ab3287b05e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/03/2025 11:19 am, Jan Beulich wrote:
> On 25.03.2025 18:41, Andrew Cooper wrote:
>> Petr reports:
>>
>>   (XEN) MMIO emulation failed (1): d12v1 64bit @ 0010:fffff8057ba7dfbf -> 45 0f 20 c2 ...
>>
>> during introspection.
>>
>> This is MOV %cr8, which is wired up for hvm_mov_{to,from}_cr(); the VMExit
>> fastpaths, but not for the full emulation slowpaths.
>>
>> Xen's handling of %cr8 turns out to be quite wrong.  At a minimum, we need
>> storage for %cr8 separate to APIC_TPR, and to alter intercepts based on
>> whether the vLAPIC is enabled or not.  But that's more work than there is time
>> for in the short term, so make a stopgap fix.
>>
>> Extend hvmemul_{read,write}_cr() with %cr8 cases.  Unlike hvm_mov_to_cr(),
>> hardware hasn't filtered out invalid values (#GP checks are ahead of
>> intercepts), so introduce X86_CR8_VALID_MASK.
>>
>> Reported-by: Petr Beneš <w1benny@gmail.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> --- a/xen/arch/x86/hvm/emulate.c
>> +++ b/xen/arch/x86/hvm/emulate.c
>> @@ -2288,6 +2288,10 @@ static int cf_check hvmemul_read_cr(
>>          val = curr->arch.hvm.guest_cr[reg];
>>          break;
>>  
>> +    case 8:
>> +        val = (vlapic_get_reg(vcpu_vlapic(curr), APIC_TASKPRI) & 0xf0) >> 4;
> No new #define then to use MASK_EXTR() here and ...
>
>> @@ -2333,6 +2337,17 @@ static int cf_check hvmemul_write_cr(
>>          rc = hvm_set_cr4(val, true);
>>          break;
>>  
>> +    case 8:
>> +        if ( val & ~X86_CR8_VALID_MASK )
>> +        {
>> +            rc = X86EMUL_EXCEPTION;
>> +            break;
>> +        }
>> +
>> +        vlapic_set_reg(vcpu_vlapic(curr), APIC_TASKPRI, val << 4);
> ... MASK_INSR() here?

No.  The logic wont survive fixing cr8 I don't think.

AFAICT, what we need is plain storage, and vlapic_{get,set}_tpr()
accessors which account for hw-disable, and then call back into
hvm_set_reg() to adjust intercepts.

~Andrew

