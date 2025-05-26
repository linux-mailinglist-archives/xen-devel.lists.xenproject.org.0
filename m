Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA34AC44B0
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 23:17:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997825.1378646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJfC2-0005bh-RZ; Mon, 26 May 2025 21:17:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997825.1378646; Mon, 26 May 2025 21:17:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJfC2-0005Zy-P3; Mon, 26 May 2025 21:17:10 +0000
Received: by outflank-mailman (input) for mailman id 997825;
 Mon, 26 May 2025 21:17:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkau=YK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uJfC1-0005Zr-9t
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 21:17:09 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7adb61e-3a76-11f0-a2fb-13f23c93f187;
 Mon, 26 May 2025 23:17:08 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a36e090102so1489406f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 May 2025 14:17:08 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4d3a74422sm5992051f8f.18.2025.05.26.14.17.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 May 2025 14:17:07 -0700 (PDT)
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
X-Inumbo-ID: c7adb61e-3a76-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748294227; x=1748899027; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F65WcQOxSpURa+C44yxcgHUue79IRuVXFTMohhUsTEs=;
        b=HMf7PL08tu2lxtU0diY6UD1MfyNeXvk3VjM7VdGEJa0GTy6OdgWzVoRNNL7PU+2Mlf
         Eb3p/Su8TmXKK/Rakmp4kOIlPTbwGfSohbomeWKMqolxmzTv3AKYIYeSPnes4tRU+TJc
         sPJfvMjpFhz/88CUnLFq6tejNQFkErDuBeWJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748294227; x=1748899027;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F65WcQOxSpURa+C44yxcgHUue79IRuVXFTMohhUsTEs=;
        b=LRZx/HOI92AveJaN2ztA4m6pYP+lVvfGz4q18wmJ/jb8G1mO++DdcNudjp/J+vz2fP
         FYs78Bezo+dQpImWHxFo30kx47lmcv1r5siwoqWNuVmZw4LEU02NXamgcnZS9Xr7lX0Q
         wdybckMRx/kYNglzucbLfpxURMQuVEi1HrCEnjxIOzab+iiLJZHKaV4rx0tPb7AEBdyT
         LnJu4hZMDqaXu73u+XFT4j7OvjqWCRG4GOMitrJQQjx7b2YToZrJVBxHKBQz4dQfbuff
         lLHeXEi5NIzGqgo+eqyeOD4zzIDD+EgQzPoenXt4uQr8q2qSqJPnaTNW9zKk/ExbEyX6
         520w==
X-Gm-Message-State: AOJu0Ywbg4LcQJsZYrjc8m2OGEXBVFCWpyw3VbCR2BK3sOMdKIIe+eQ2
	JUHwYhzHZ5C8gKiSSiN7LiOZ9IGhY1MBPcfAuTWzcvl+ezA28Zlj8lwRWWeoV9M2UiA=
X-Gm-Gg: ASbGncuTrJID/ZiiuOirP8HhgDTc2e1iwfjkbX+y6zO2VomkNM4mabJEptl53+edI7a
	eHKijNtD7LWHRnTJnM+uC35AmI5P0//V4XhdzfPFKbG3Sa7XY4z5zzjsoTe8FJFZbEF0B4IP8f0
	NIEH230mmFBrs1n12gdk+yKfw4fwYv7HFd+Cg+hKd4rLE9j18O9/6lF497f6y4Gtn01/l+kAxhl
	xmz6V7nGHLEknH2EFLot8tEogU6dw1zlHcxdv8ecA3rFDGpXBdSRi8fM/tBbl/VoI3b/Rr8HLI6
	U1EzkOublY6yhy/yMA23zIhimoxU3lKBgYqHAB4z1XX0t41b+I9sIk//V9CJ0cuJTNHT6BYRech
	rPsOenBIR1o34RUJz
X-Google-Smtp-Source: AGHT+IF3AfM8d4/JtmjhQvPFMwZMMs4imGmH9Gq9ldB+MondZgKG6OW4dGBqwtKoUoyv1SzpadS4CA==
X-Received: by 2002:a5d:61cc:0:b0:3a4:cfbf:5197 with SMTP id ffacd0b85a97d-3a4cfbf52b1mr5035394f8f.18.1748294227490;
        Mon, 26 May 2025 14:17:07 -0700 (PDT)
Message-ID: <11ea8686-ac41-44b5-8271-408c775c776a@citrix.com>
Date: Mon, 26 May 2025 22:17:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.18.5 PV dbregs fail
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xenproject.org
References: <aDSr8u-7w_Rbf4el@mail.soc.lip6.fr>
 <d019f9f9-6d45-43fe-b184-fc55f79d411f@citrix.com>
 <b1336e71-356c-46a0-b0c4-9fcbee3f92fa@citrix.com>
 <aDS27G05bJvSyd5o@antioche.eu.org>
 <0733f3dc-9f01-4e15-98ab-d7fd7c3e303d@citrix.com>
 <aDTLdL4irrkTLxje@antioche.eu.org>
 <ec1fa3bd-303a-49d2-95cb-2f873c66a7b1@citrix.com>
 <aDTVicaEm30HWHF6@antioche.eu.org> <aDTY0haMmVi497sh@antioche.eu.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aDTY0haMmVi497sh@antioche.eu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/05/2025 10:10 pm, Manuel Bouyer wrote:
> On Mon, May 26, 2025 at 10:56:41PM +0200, Manuel Bouyer wrote:
>> On Mon, May 26, 2025 at 09:30:53PM +0100, Andrew Cooper wrote:
>>> On 26/05/2025 9:13 pm, Manuel Bouyer wrote:
>>>> On Mon, May 26, 2025 at 07:50:14PM +0100, Andrew Cooper wrote:
>>>>> [...]
>>>>> Well, that range does include the aforementioned commit.
>>>>>
>>>>> Can you bisect around d32c77f471fb8400b6512c171a14cdd58f04f0a3 which is
>>>>> the backport of ^ in 4.18 ?
>>>> Sure,
>>>> with 0d5f15e and d32c77f the test pass, with cecee35 it fails.
>>>>
>>> Oh interesting, so the basic forwarding of #DB back into a guest
>>> (d32c77f) works fine, but the changes to emulated debug exceptions
>>> (cecee35) break.
>>>
>>> Anyway, I think I've spotted a logical error.  We do indeed end up
>>> calling x86_merge_dr6() twice, because of the TODO just out of context. 
>>> Does this help?
>> Yes, it works for cecee35; now testing with 4.18.5
> yes, it works with 4.18.5 too. All dbreg-related tests now pass again
> thanks !
>

Sorry I screwed it up so badly, and apparently also my own testing...

May I take that as a Tested-by tag on the patch then?

I'll get the fix merged once it's been reviewed, but 4.18 is in
security-only support right now and is unlikely to get this as a backport.

Are you able to take the patch logically for NetBSD?

~Andrew

