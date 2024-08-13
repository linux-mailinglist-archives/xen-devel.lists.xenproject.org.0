Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D749F950C96
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 20:56:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776553.1186711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdwgO-0002Nw-07; Tue, 13 Aug 2024 18:55:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776553.1186711; Tue, 13 Aug 2024 18:55:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdwgN-0002L4-SK; Tue, 13 Aug 2024 18:55:47 +0000
Received: by outflank-mailman (input) for mailman id 776553;
 Tue, 13 Aug 2024 18:55:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k7wN=PM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sdwgM-0002Kv-5E
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 18:55:46 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4d88cc6-59a5-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 20:55:44 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2eeb1ba040aso80323531fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 11:55:44 -0700 (PDT)
Received: from ?IPV6:2003:e5:8741:4a00:60e5:7bee:fc48:e85c?
 (p200300e587414a0060e57beefc48e85c.dip0.t-ipconnect.de.
 [2003:e5:8741:4a00:60e5:7bee:fc48:e85c])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5be9feb7528sm209603a12.82.2024.08.13.11.55.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 11:55:43 -0700 (PDT)
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
X-Inumbo-ID: a4d88cc6-59a5-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723575343; x=1724180143; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CL0U3SDUUykaULDpOU7zUo+SXuvTE2F0sAePe1MfE+Y=;
        b=Yi0b+qgHySeXxffGi0RthD8/JSYsmzKIrFo+eGRWdfdMa3LLP4HdKNIPB3VWY8/TuT
         AVFnyi1o62gwHOArqmFP/mL8AFAzz9C/bA71Vvg9QvLwagckYRK+jRDFMDaD4OQiDSL/
         CjMIqrCN2BxAe1UxPyrt2nJxThVZkBiv4qf156qAk8n4TjyQFX86bW4I7Yr5sffnm3wl
         LiNBGFgpv+J3TouwmTKQ61aXNYdu80YSmbdwlRW8uOfonvjzApTVHP0xsRnEF/ZqC6V4
         i10sRHASpSgVAfnM0YoRN3+FxzC/+Aloju2xkSG1wUlr+kLHkJeXkEi+Nb9t2UG8iFWX
         x+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723575343; x=1724180143;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CL0U3SDUUykaULDpOU7zUo+SXuvTE2F0sAePe1MfE+Y=;
        b=M+Ptw22TNRSUvxYz18+8G6w6htO6iNR3Vrgmu70h+QA/nyoMiH7alSD533yiAttQNV
         0itho75JDlwHHxVD7bD9pYKKeFDQHR4qt7LAarutaqPaY0f1TFInlobfKBmmbjUB7v0E
         XPcFZYNC1Bjo0n/AA8IJWlYyCoxFEUqelL9jVQeLyO585kH3W7ILobXwU5QvmaBaLZ0k
         UuKmUMg2GbhiVHEiuzg0vro+NNpJXaouSNoNdFk02JAeLKkq9XByBWeZR7PAOcpogCOl
         wDpMBwii4GJ2GSDViUGIwv7xEDjHDGC7vyRrDGy2gOwsl9Os/hviT99YmVUe+kQzDUC0
         2W+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7O5mpnEDxOGueHC2GHW+j9vvLXycaWGTVQtKw42pUV6MAFTyBi45i+fW8vDcQuyVI40DsWjH97Oc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXuyJlQiuX+fkpPeW+gLCyBTWF09BjGt2YBqCUc3jh73qFJqA5
	FXouDM6tJVtw7In8BEdPRlLbnPzurGZ1zF8I/dRMfPXocSk/IwdXljVvlDZzOG8=
X-Google-Smtp-Source: AGHT+IEN22P0n1AiwoAkSfZ9sdK0oQ4xnnzmFNoelj7AMOyQIB/xDEaYJqcydLVz8KcpeZtTOyC8bA==
X-Received: by 2002:a2e:bc1a:0:b0:2ef:2472:41c7 with SMTP id 38308e7fff4ca-2f3aa1c9518mr2509901fa.7.1723575343317;
        Tue, 13 Aug 2024 11:55:43 -0700 (PDT)
Message-ID: <d556e168-8542-4b93-81a9-a7054b5b69ba@suse.com>
Date: Tue, 13 Aug 2024 20:55:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AMD EPYC virtual network performances
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrei Semenov <andrei.semenov@vates.tech>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <959bbf84-24da-4da3-a059-dc1aa32b27ef@vates.tech>
 <352bba40-27fc-416b-985f-20e66c0c4b72@suse.com>
 <Zrqykdarr7JHaeOZ@mattapan.m5p.com>
 <ab4ca68e-ec1b-467f-9b89-38f63cc19b7c@suse.com>
 <ZruckufSjT0GkpJt@mattapan.m5p.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <ZruckufSjT0GkpJt@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13.08.24 19:49, Elliott Mitchell wrote:
> On Tue, Aug 13, 2024 at 01:16:06PM +0200, Jürgen Groß wrote:
>> On 13.08.24 03:10, Elliott Mitchell wrote:
>>> On Tue, Jul 09, 2024 at 11:37:07AM +0200, Jürgen Groß wrote:
>>>>
>>>> In both directories you can see the number of spurious events by looking
>>>> into the spurious_events file.
>>>>
>>>> In the end the question is why so many spurious events are happening. Finding
>>>> the reason might be hard, though.
>>>
>>> Hopefully my comments on this drew your attention, yet lack of response
>>> suggests otherwise.  I'm wondering whether this is an APIC misprogramming
>>> issue, similar to the x2APIC issue which was causing trouble with recent
>>> AMD processors.
>>>
>>> Trying to go after the Linux software RAID1, my current attempt is
>>> "iommu=debug iommu=no-intremap".  I'm seeing *lots* of messages from
>>> spurious events in `xl dmesg`.  So many I have a difficult time believing
>>> they are related to hardware I/O.
>>
>> Seeing them in `xl dmesg` means those spurious events are seen by the
>> hypervisor, not by the Linux kernel.
> 
> Indeed.  Yet this seems to be pointing at a problem, whereas most other
> information sources merely indicate there is a problem.
> 
> I'm unable to resolve those to hardware.  This could mean those are being
> synthesized by software and when crossing some interface they get
> reinterpreted as hardware events.  This could mean those are hardware
> events, but somewhere inside Xen information is being corrupted and the
> information displayed is unrelated to the original event (x2APIC
> misinterpretation?).
> 
> 
>>> In which case could the performance problem observed by Andrei Semenov
>>> be due to misprogramming of [x2]APIC triggering spurious events?
>>
>> I don't see a connection here, as spurious interrupts (as seen by the
>> hypervisor in your case) and spurious events (as seen by Andrei) are
>> completely different (hardware vs. software level).
> 
> The entries seem to appear at an average of about 1/hour.  Could be most
> events are being dropped and 10x that number are occuring.  If so, those
> extras could be turning into spurious events seen by various domains.

Even 10 spurious events per hour should not have a measurable impact
on performance.

> There is a possibility spurious interrupts are being turned into spurious
> events by the back-end drivers.

No, I don't think so.

> Jürgen Groß, what is the performance impact of "iommu=debug"?  Seems to
> mostly cause more reporting and have minimal/no performance effect.

I guess you are referring to the Xen option? I'm no expert in this
area.


Juergen


