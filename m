Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAC2984AE7
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 20:37:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803301.1213825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stAOi-00016B-J3; Tue, 24 Sep 2024 18:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803301.1213825; Tue, 24 Sep 2024 18:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stAOi-00013C-F3; Tue, 24 Sep 2024 18:36:28 +0000
Received: by outflank-mailman (input) for mailman id 803301;
 Tue, 24 Sep 2024 18:36:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4pT6=QW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1stAOh-000136-G8
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 18:36:27 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7dbe7e1-7aa3-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 20:36:26 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8a7cdfdd80so822282566b.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 11:36:26 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f4f83asm115734566b.46.2024.09.24.11.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 11:36:24 -0700 (PDT)
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
X-Inumbo-ID: e7dbe7e1-7aa3-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727202985; x=1727807785; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pkxuQzhnUPsRRT3GWzr/LBjxJqEchw8HfnVWol+LXHQ=;
        b=Vj8SULAFjIRrFRePGDHjSpDb8Uyntub7jtIDLSXcpE53Bj5OJxUwIFJwrmYohhxqan
         EjUgGm5uGwWBeNgh4gOLWzrWNwkmzo+V0mkHtEfqtCoWLY1j73RmPYtNOlAeuyBLJxTL
         qynpfhM1x3jKb3yEG9ryBLyHBoM97RyF+8+64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727202985; x=1727807785;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkxuQzhnUPsRRT3GWzr/LBjxJqEchw8HfnVWol+LXHQ=;
        b=qBbFU6OQb8iE3u8P00JlY5905IICtuvU84l/oweMTFnYN67Je/OVYiLDZzdg07aVcT
         FN9zhxwGzKP0S6gZ12EuwkUCAuJiodUJzTXqUDLPOUg8gIH4p2OQGwesMtcrmODNZ/tI
         evwwD2ZKVOa+5TtMmn6GfK82JYBVDMssByVjveiGmxytC/L943wzNMwIO8P1lzklvPl6
         rqUT8LeRBwrvBHFbn9QVTlV36lsUD6z8Chf/HJJslMUC2UtMIVzCdH7i5AcBNL8xjZiK
         vQZe9v2HoJkQQTqdn50KWpvmlnCl2yg1RivnDu2mIOgP1jRPwiNvEtfmSXCIqjtKrB0d
         j2SA==
X-Gm-Message-State: AOJu0YyYKBhkxlh0SWx8yljWPIHOXtRBAEAtv+o2VHWxhoPW7FD5z+Tg
	9tt+sGK/AUxuxzOy4YTK1AOmUaoyRjSR/kXVwXL4SBMz90xdHEtrvFHBVTI+xyw=
X-Google-Smtp-Source: AGHT+IHDdozfsctBC6xtAwLyP5qEUSNmsWVPFwyovu5gU3y0Zs6/9xFEAAR3J9/Npni8T9xtSnmMdA==
X-Received: by 2002:a17:907:c7c8:b0:a7d:a080:baa with SMTP id a640c23a62f3a-a93a03b1a6fmr20260666b.34.1727202985335;
        Tue, 24 Sep 2024 11:36:25 -0700 (PDT)
Message-ID: <30c4303c-81a3-4507-80b5-08b1dbda6104@citrix.com>
Date: Tue, 24 Sep 2024 19:36:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/traps: Re-enable interrupts after reading cr2 in
 the #PF handler
To: Jan Beulich <jbeulich@suse.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240918130554.97345-1-alejandro.vallejo@cloud.com>
 <Zu2Cyan46VVs2oef@macbook.local> <D4DL2FFRNE6R.XTS6NS9L1PHX@cloud.com>
 <4fbfcaf2-f317-4b4f-9655-0f0c9e1e453b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4fbfcaf2-f317-4b4f-9655-0f0c9e1e453b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/09/2024 2:03 pm, Jan Beulich wrote:
> On 23.09.2024 12:14, Alejandro Vallejo wrote:
>> On Fri Sep 20, 2024 at 3:12 PM BST, Roger Pau Monné wrote:
>>> On Wed, Sep 18, 2024 at 02:05:54PM +0100, Alejandro Vallejo wrote:
>>>> Moves sti directly after the cr2 read and immediately after the #PF
>>>> handler.
>>> I think you need to add some context about why this is needed, iow:
>>> avoid corrupting %cr2 if a nested 3PF happens.
>> I can send a v3 with:
>>
>> ```
>>   Hitting a page fault clobbers %cr2, so if a page fault is handled while
>>   handling a previous page fault then %cr2 will hold the address of the latter
>>   fault rather than the former. This patch makes the page fault path delay
>>   re-enabling IRQs until %cr2 has been read in order to ensure it stays
>>   consistent.
> And under what conditions would we experience #PF while already processing
> an earlier #PF? If an interrupt kicks in, that's not supposed to by raising
> any #PF itself. Which isn't to say that the change isn't worthwhile to make,
> but it would be nice if it was explicit whether there are active issues, or
> whether this is merely to be on the safe side going forward.

My understanding is that this came from code inspection, not an active
issue.

The same is true for %dr6 and #DB, and MSR_XFD_ERR and #NM.

I think we can safely agree to veto the use of AMX in the #NM handler,
and IST exceptions don't re-enable interrupts[1], so #PF is the only
problem case.

Debug keys happen off the back of plain IRQs, and we can get #PF when
interrogating guest stacks.  Also, I'm far from certain we're safe to
spurious #PF's from updating Xen mappings, so I think there are a bunch
of risky corner cases that we might be exposed to.

And I really need to find some time to get FRED working...

~Andrew

[1] We do re-enable interrupts in order to IPI cpu0 for "clean"
shutdown, and this explodes in our faces if kexec isn't active and we
crashed in the middle of context switch.  We really need to not need
irqs-on in order to shut down.

