Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B11A48CA5
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 00:19:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898444.1307006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnn9U-0007Hk-Mk; Thu, 27 Feb 2025 23:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898444.1307006; Thu, 27 Feb 2025 23:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnn9U-0007GX-JL; Thu, 27 Feb 2025 23:18:48 +0000
Received: by outflank-mailman (input) for mailman id 898444;
 Thu, 27 Feb 2025 23:18:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jS7=VS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tnn9T-0007GR-Bt
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 23:18:47 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3148c372-f561-11ef-9aaf-95dc52dad729;
 Fri, 28 Feb 2025 00:18:46 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so10786305e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2025 15:18:46 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e484451fsm3413204f8f.63.2025.02.27.15.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 15:18:44 -0800 (PST)
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
X-Inumbo-ID: 3148c372-f561-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740698325; x=1741303125; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KKemdt4p/PXFI+TMcXPvjb6FxxMZcUvxy5qEYnxpFBQ=;
        b=dr36ZiVxSvM9Oa7jm7XUeeWNhsDZkj8FDOSt35ejKHOl8YSCiVFcK0zcr4tSwzxyZQ
         Y9wDBTeEWj4uvwseY4vsEUo+uLr/DvnhH3/cMvMSz58cEh2AAxlkeu55XUWyFA1X2y0E
         4Qfe2opDwVVacerRWWfSUBpX8X1+xjYT0qwV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740698325; x=1741303125;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKemdt4p/PXFI+TMcXPvjb6FxxMZcUvxy5qEYnxpFBQ=;
        b=loH8npNRC7H1tatvl+KXpO7D4MMwMjSWaUrPbwuC4O17nPaMTuOF9SUA1OsxEzx5ci
         Nay+Zt367ZqslvYq8CmeoX1+tFtQbmFOkjIW03gn2iA6NjGr3qjIuqujh/0GfmTQl65l
         V2JVAZi8pNTp6pS9azmM0W6LiCsClnROt5k8KkApj/zT4PkBo0ilNlww44LZzWpLQj5n
         8DJH81xP8st9nsW+ZtgpAzqQe7qthFPsPj+a3vPg8kcsgTSv8Pc3ldGEOyXSeG1d9+FG
         sSnsDzoTr/iCQom00wy9i8pSkhBa+k3WcLf/f0AI5liVQk+i3/UVvvQE3QRZJkQknkyG
         VCBw==
X-Forwarded-Encrypted: i=1; AJvYcCXBIYcERQOs6PXfLyw/Wbwev9x2nqvyaCbhdxS1/kYSJU5FC6xIjrn+ykudjalsjbzItwRVxaPqcyY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwA8HZ3ZdkYHgey1cTOXF9b5dCfvWaadjbQJJ2PYXJPU5W7eDux
	XmSP+RXOPNTeg5J3oZl0ZrsCatIk6VrfopZBaMyUoGsEC8AxWJJ6TU0yNZ7uoVU=
X-Gm-Gg: ASbGncuWnopVRhtHQEomDuZDpaOuXQnZLdqWLl5bMekTWf4t0+JBCYgolDjKJvtuhLF
	15LEa2fY7DdRzNH7Jj9B5bJPZ+m/BPrj+Q2BlurK8iqdjY6I8Xeo8/H5T+qx00D9Zirx3ytdgs+
	yFWx3jYjZ7aPW1DurXtvONnll3pCFggkBWzBzgH1LiXVloNuZQAo/FZTO4CbLMzbUisC6Zelu0I
	jkdnBNMsn1unGXgZlyHIJgR3K9lUWl2jJi8xK9/nVlEpLAhPHckbj4NzVx0pAIkoP+qDLxf2S5L
	NzSamEanXuVYGqSKa1VS5YoTaOXiIScOCXXmOp3FsBjC9rXKWkaLFYP7siha2Obexg==
X-Google-Smtp-Source: AGHT+IHYHpSy22uhQIl3YRiL5eZKzWQ7S3AQvdOS36XpDIB5kZBG63KOSYIBGREqrfOPEhEDpur/oQ==
X-Received: by 2002:a05:6000:188c:b0:38c:5bfa:a93d with SMTP id ffacd0b85a97d-390ec7c8f9fmr722294f8f.10.1740698325506;
        Thu, 27 Feb 2025 15:18:45 -0800 (PST)
Message-ID: <6e445e74-8a34-4981-b2dd-cafb70f4a867@citrix.com>
Date: Thu, 27 Feb 2025 23:18:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Fix comment about setting up the real mode
 stack
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241114182219.1983073-1-andrew.cooper3@citrix.com>
 <990887c0-d76f-4f8a-a6a6-c3dca49dcb91@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <990887c0-d76f-4f8a-a6a6-c3dca49dcb91@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/11/2024 9:28 am, Jan Beulich wrote:
> On 14.11.2024 19:22, Andrew Cooper wrote:
>> It may have taken a while, but it occurs to me that the mentioned commit fixed
>> a second problem too.
>>
>> On entering trampoline_boot_cpu_entry(), %esp points at the trampoline stack,
>> but in a 32bit flat segment.  It happens to be page aligned.
>>
>> When dropping into 16bit mode, the stack segment operates on %sp, preserving
>> the upper bits.  Prior to 1ed76797439e, the top nibble of %sp would depend on
>> where the trampoline was placed in low memory, and only had a 1/16 chance of
>> being 0 and therefore operating on the intended stack.
>>
>> There was a 15/16 chance of using a different page in the trampoline as if it
>> were the stack.  Therefore, zeroing %esp was correct, but for more reasons
>> than realised at the time.
> I'm afraid I don't follow this analysis. Said commit replaced clearing of %sp
> by clearing of %esp.

Correct

> That made no difference for anything using the 16-bit
> register.

True, but Xen's 16bit code isn't very relevant to the analysis. 
Fujitsu's BIOS is.

> I don't see how the top nibble of %sp could have been non-zero
> prior to that change.

Oh, that's a typo.  It should have been the 5th nibble of %esp.

Said nibble depends entirely on where the trampoline is placed in low
memory.

We first enter the trampoline in 32bit flat mode with %esp being the
absolute address of the stack. i.e. it's 0x000yyyyy with a 15/16th's
chance of the 5th nibble being non-zero.

Then we drop down into Real mode (non flat, because the trampoline never
overlaps the IVT at 0).  At this point we used to zero %sp which
preserves %esp's 5th nibble.

And in the case that went wrong, INT $0x15 corrupted memory that
happened to be in the Xen image.


Anyway, when I was debugging 11 years ago, I noticed that %esp was
nonzero in its upper half and, despite deciding this was suspicious,
couldn't figure out why and zeroing it all fixed the memory corruption.

I also didn't appreciate that `xor %sp, %sp` was strongly dependent on
the trampoline being at exactly trampoline_start + 64k.


Anyway, given that everyone seemed to be confused, I guess I need to try
rewriting the commit message.

~Andrew

