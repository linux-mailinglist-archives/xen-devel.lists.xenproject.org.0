Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A84874D6D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 12:31:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689784.1075081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riBy9-0004PX-IQ; Thu, 07 Mar 2024 11:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689784.1075081; Thu, 07 Mar 2024 11:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riBy9-0004Nj-FZ; Thu, 07 Mar 2024 11:31:25 +0000
Received: by outflank-mailman (input) for mailman id 689784;
 Thu, 07 Mar 2024 11:31:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qXJj=KN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1riBy7-0004Nd-Pw
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 11:31:23 +0000
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [2607:f8b0:4864:20::829])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 394e3abd-dc76-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 12:31:22 +0100 (CET)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-42f111283a6so3592031cf.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 03:31:22 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 o15-20020a05622a138f00b0042f176214fasm965633qtk.20.2024.03.07.03.31.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 03:31:20 -0800 (PST)
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
X-Inumbo-ID: 394e3abd-dc76-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709811081; x=1710415881; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gyNI05QeRLDuCft6Q0TMVa1za849GYTYdr1mWG2TE1c=;
        b=ntCYNutsOhgAMXZXQ/wmuUXsn4XhTOekDsUkZXXRl5x7504zHiqjitzqnDpqmQnilj
         TsTawj/Q51C0pWlsrUxGuGhCNc7jQ5jk/q7iAdd/d25Mf7mucL8XUAVzwMnA6xbXPXHw
         4z28HM3l+OQfeGhr6uaDHmh6+MuX9gLxuTcjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709811081; x=1710415881;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gyNI05QeRLDuCft6Q0TMVa1za849GYTYdr1mWG2TE1c=;
        b=iAZT/5e/YfPHj3pHcqQ/DMEMlIFO4M4HH5fYqf7hEZD0ypaQkRAjJy8vqxKdAHGE+N
         mm/ATCul1kUxsxDF+7wugCXsGV9S48L1zLngRyxj15ycrETrKOPkTfG71jFs2ZLQcm6x
         g3sCTICES2iyLo6tK+U/Szj0x67rd20haQ4M5OCGS4N+Z3ULsvkwHoT+g5IGT+fyP3OM
         0one3a5/JMLRiQoXEaTG/CUC2r+3DSMnJg5o2/1NZxNURpTMzCxS0c0AYQ+Cj37j2I54
         OarPs9+shn88CK78C5U1hZ1hrCwFSUvsd91+4IN2PSBYUbdCOyNUglLZaw/e1ZlZZgXJ
         HDjw==
X-Forwarded-Encrypted: i=1; AJvYcCXPJ2qnq3rxaGGF3ck4SsWPyzTFdjOKRxuUB7Hp7za3yi7lA74Ia+CImMdt692K+c9uQdriam84sV1SD8VZKw8yYBns7w86b014EuYpTOA=
X-Gm-Message-State: AOJu0YzZi1Z0cu9utoMTMwZTWN5hs1gZVAP66c5//n1I0xfZ1BY1aEqL
	vb4BCmZOTPC41uDB8gxymN0adH8STOSF68crmRhKRCMR0YrA8gfMChWJgR1mpI4=
X-Google-Smtp-Source: AGHT+IGtYy0wFJpKttynUChdkllZlPhsSAhmKnV1SNJVpAwgdECLP6mUVBoF1nPPzX1fH0+L7K4fjw==
X-Received: by 2002:a05:622a:1743:b0:42e:ec81:73ca with SMTP id l3-20020a05622a174300b0042eec8173camr8162498qtk.67.1709811081554;
        Thu, 07 Mar 2024 03:31:21 -0800 (PST)
Message-ID: <9e827057-9306-4a2a-8816-410661bf8892@citrix.com>
Date: Thu, 7 Mar 2024 11:31:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/virtual-region: Include rodata pointers
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ross Lagerwall <ross.lagerwall@cloud.com>
References: <20240305121121.3527944-1-andrew.cooper3@citrix.com>
 <20240305121121.3527944-3-andrew.cooper3@citrix.com>
 <87b82706-f538-4807-abaf-1e59cebd286b@suse.com>
 <CAG7k0EqWrPU0qocSJHyJAQca44LakQwZwAbiv5GRk-sQeaAYAg@mail.gmail.com>
 <82126c3a-0cde-452f-86aa-2571482f42aa@citrix.com>
 <76ce9dcf-8cac-44b3-9550-f516024bad6e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <76ce9dcf-8cac-44b3-9550-f516024bad6e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/03/2024 7:39 am, Jan Beulich wrote:
> On 06.03.2024 18:21, Andrew Cooper wrote:
>> On 06/03/2024 5:09 pm, Ross Lagerwall wrote:
>>> On Tue, Mar 5, 2024 at 2:17 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 05.03.2024 13:11, Andrew Cooper wrote:
>>>>> --- a/xen/include/xen/virtual_region.h
>>>>> +++ b/xen/include/xen/virtual_region.h
>>>>> @@ -16,6 +16,9 @@ struct virtual_region
>>>>>      const void *text_start;                /* .text virtual address start. */
>>>>>      const void *text_end;                  /* .text virtual address end. */
>>>>>
>>>>> +    const void *rodata_start;              /* .rodata virtual address start (optional). */
>>>>> +    const void *rodata_end;                /* .rodata virtual address end. */
>>>>> +
>>>>>      /* If this is NULL the default lookup mechanism is used. */
>>>>>      symbols_lookup_t *symbols_lookup;
>>>> While perhaps the least bad one can do without quite a bit more churn,
>>>> I'm still irritated by a virtual region (singular) suddenly covering
>>>> two ranges of VA space. At the very least I think the description should
>>>> say a word of justification in this regard. An alternative, after all,
>>>> could have been for livepatch code to register separate regions for
>>>> rodata (if present in a patch).
>>>>
>>>> A follow-on question then would be why ordinary data isn't reflected in
>>>> a virtual region. Aiui that's just because livepatch presently has no
>>>> need for it.
>>>>
>>>> Underlying question to both: Is the virtual region concept indeed meant
>>>> to be fully tied to livepatch and its needs?
>>>>
>>> Virtual regions were introduced for live patching but I don't think it
>>> is completely tied to live patching. It was introduced so that any code
>>> can participate in symbol lookup, bug frame and exception table entry
>>> search, rather than special casing "if livepatch" in many places.
>>>
>>> I agree that the virtual region concept is being abused here - it's just
>>> being used as a convenient place to store rodata start/end and doesn't
>>> really have much to do with the text start & end / bug frame / exception
>>> table entry search that the virtual region is intended for.
>>>
>>> Maybe Andrew can explain why he used this approach?
>> I feel the simplicity and obviousness of patch 3 speaks for itself.
>>
>> How do you propose fixing it differently.
> I'm not opposed to doing it the way you do, but I think it then needs
> clarifying (up front) what a virtual region really is. It looks to be
> morphing into a module description instead ... One easy option might
> be to have a comment next to the struct additions here making clear
> that this is rather an abuse, but chosen to be this way to keep things
> simple elsewhere.

The thing called virtual_region already describes 6 ranges, and I'm
adding a 7th.

It has been a module-ish description right from the very outset.  I
don't think it is fair to describe this as an abuse at all.

Is this going to satisfy the outstanding concerns?

diff --git a/xen/include/xen/virtual_region.h
b/xen/include/xen/virtual_region.h
index d05362071135..9d150beb8a87 100644
--- a/xen/include/xen/virtual_region.h
+++ b/xen/include/xen/virtual_region.h
@@ -9,6 +9,12 @@
 #include <xen/list.h>
 #include <xen/symbols.h>
 
+/*
+ * Despite it's name, this is module(ish) description.
+ *
+ * There's one region for .text/etc, one region for .init during boot only,
+ * and one region per livepatch.
+ */
 struct virtual_region
 {
     struct list_head list;

~Andrew

