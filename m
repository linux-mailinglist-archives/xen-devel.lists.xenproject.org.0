Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84609AD3762
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 14:54:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010757.1388942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyUS-0001T5-Fc; Tue, 10 Jun 2025 12:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010757.1388942; Tue, 10 Jun 2025 12:54:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyUS-0001RG-Ba; Tue, 10 Jun 2025 12:54:08 +0000
Received: by outflank-mailman (input) for mailman id 1010757;
 Tue, 10 Jun 2025 12:54:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NC6Z=YZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uOyUQ-0001RA-VK
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 12:54:06 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe175ccb-45f9-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 14:54:06 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-452f9735424so13255255e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 05:54:06 -0700 (PDT)
Received: from [192.168.86.29] ([90.250.112.104])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5323b33c3sm12379957f8f.34.2025.06.10.05.54.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 05:54:05 -0700 (PDT)
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
X-Inumbo-ID: fe175ccb-45f9-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749560046; x=1750164846; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WNlZXeMraDrgtGtTXbICWe/QhiwuILX4YO9zqFplcpk=;
        b=rl9kSINQ1pqZRxRzdLuXL0REXlpnmSPM8Qdn0KyYkcHf7l/x3njgpLxjMBYp9G3Me3
         HmFFhJIpTqGCkwpu+aBTDIFCzaoIwUMIzEosDOO6GpFMTrBrUziPvzJdTUI2XJxxQ7lR
         OX9wNhzj+W3a8bDKRstUAGyVSMp1kwkBnbB+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560046; x=1750164846;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNlZXeMraDrgtGtTXbICWe/QhiwuILX4YO9zqFplcpk=;
        b=No3JMkgqCYLEyYoigolfeQ56Esv8KMlXb4CGpReEJIiJ3Q4CJs/O5oxCDZo/mdi+o1
         1syzmUohV5jyOr64n/17TizRyDBYVoRdTbcAHd42/VibOHWFYS701BE/Zpq4gqTRLqoA
         O9oIPZ1soqvTUviYeDH6bhrT/HdyapI58f2ywOHW3B9iBQ4+BInnuc4Ym/tYysZ2V5ii
         fdyt05r/RsHrG7mhZkI1bvSTZ3/igT9GfWASsL9Qbt7at2CSxQ2WOWzW6sxtBj+m95ep
         VNixHWrLYLibYVWwmZ03LPGO0DnuyqaMVPEnzaeS8EFMtdrzNzuTYg36zPDCLBSPox1y
         mO6w==
X-Gm-Message-State: AOJu0YwqjH604638y7OPui7NND8wE6THuLVwcAbFhqlqtpKdCpp3GlEq
	QuKZw1CBDY3FUJLYcFuRB/TyzDcLJbtpaVzUBuI72ejDv9w/Pjxd2IoNFuBKmiT+lAA=
X-Gm-Gg: ASbGncs5xzT16yWPrhE5Zgnbs7JyiAzn94dEjvA+bcx2YPUTj9KBDB+E/CC3rzJihl5
	GMAOSNVC88pS3c5QMTgAknV4A/UaEwMLNYCOCg9TZno8EcpdvWbcVF/ugQxTzjGluuwg7F+ujMo
	Pb0qKH1DsgzV6zdbTWy2aYipnYahwLf794HY+bvzyMReq29fhCLUdoR/ZnP/D3nMyxFEELbg+0I
	euNLFDJK3jgNWE0fMpbwySoVRqCFIFMa2tdi0LVuioPBsS/UNQ2awTTxsfmI3OuRivkcij47jwp
	X4eJgQy/Sazf4N3x79UZVCA8S6Q+0She3pO4aaSdN7fDZW2ODuc5CYMLwTElUEIzLUt9de9/IbM
	=
X-Google-Smtp-Source: AGHT+IFTQoa5AB2hLrhsfmA7M8Pw6aQPFwJ5PP0J2tzzYyVHbD4gfhZWxg+uJhXI2n0bmkTw5ukYww==
X-Received: by 2002:a05:600c:a08d:b0:442:d5dd:5b4b with SMTP id 5b1f17b1804b1-452014d4449mr170571685e9.31.1749560045476;
        Tue, 10 Jun 2025 05:54:05 -0700 (PDT)
Message-ID: <480626d3-550a-4836-adc3-0af96d7e1fd7@citrix.com>
Date: Tue, 10 Jun 2025 13:54:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] console: add relocation hook
To: Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.defc562b917978814c8359bbd04f1dadba33fb77.1748182535.git-series.marmarek@invisiblethingslab.com>
 <4f1889dc03ec4aa2cc0cd2bd14523a2c6f670bdb.1748182535.git-series.marmarek@invisiblethingslab.com>
 <0b17da9c-57db-4a8b-90af-e53e45cb1243@citrix.com> <aDSLNeFRZWoxMTEt@mail-itl>
 <66cfdee6-5dc2-4139-8550-ef441fa7a7a0@suse.com> <aEGu6-6dGqc_WUlg@mail-itl>
 <ea285192-c39c-43b4-a879-7ca4ff7f9b4a@suse.com> <aEHBAsLFvZni1_5Y@mail-itl>
 <83c22da9-62c5-4fb2-bc2d-f34ad5956d3e@suse.com> <aEMPMa0-1XwlbsPM@mail-itl>
 <cb408883-c6c7-4cd3-819c-0e5978086dd2@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <cb408883-c6c7-4cd3-819c-0e5978086dd2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/06/2025 8:52 am, Jan Beulich wrote:
> On 06.06.2025 17:54, Marek Marczykowski-Górecki wrote:
>> On Fri, Jun 06, 2025 at 08:26:33AM +0200, Jan Beulich wrote:
>>> On 05.06.2025 18:08, Marek Marczykowski-Górecki wrote:
>>>> On Thu, Jun 05, 2025 at 06:05:02PM +0200, Jan Beulich wrote:
>>>>> On 05.06.2025 16:51, Marek Marczykowski-Górecki wrote:
>>>>>> On Thu, Jun 05, 2025 at 04:42:53PM +0200, Jan Beulich wrote:
>>>>>>> Why is it that this ring is dependent upon Xen's position? If the ring was
>>>>>>> dynamically allocated, it wouldn't change position when Xen is moved.
>>>>>> The console is setup quite early, I don't think I can allocate memory at
>>>>>> this stage, no?
>>>>> But you allocate before Xen is moved, I suppose.
>>>> Well, I have those buffers in BSS exactly to avoid the need to allocate
>>>> them (or rather: have bootloader allocate them for me).
>>> Yet them remaining in .bss is now getting in the way. Imo moving them to
>>> .init.* and adding proper allocation is going to be easier than the hook-
>>> ary you are proposing.
>> So, when would you propose to allocate them? Wouldn't that be yet
>> another hook?
> Exactly one, yes. Given Andrew's earlier reply my understanding was that to
> get things correct in your proposed model would end up requiring more than
> one. However, the point in time where move_xen() is called is still too
> early to allocate memory a (somewhat) normal way - even the boot allocator
> gets seeded only later. So I guess console_init_preirq() may need to inform
> its caller how much memory is going to be needed later on (and what address
> constraints there are, if any). Then a suitable chunk would need setting
> aside kind of like it's done for kexec. That address would then need to be
> passed into the new hook.

How about initialising the console using _va(_pa(xxx)) of the Xen
datastructures?

Xen is mapped into the directmap (pagetable handling depends on this),
so these pointers will work right from the very outset, and will
(intentionally) refer to the old position.

After relocation (specifically, before we free the old Xen image), we
can drain in-flight requests and update the pointers.

~Andrew

