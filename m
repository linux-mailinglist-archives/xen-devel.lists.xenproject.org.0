Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A87950370
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 13:16:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776148.1186295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdpVa-00015b-6z; Tue, 13 Aug 2024 11:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776148.1186295; Tue, 13 Aug 2024 11:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdpVa-00013a-38; Tue, 13 Aug 2024 11:16:10 +0000
Received: by outflank-mailman (input) for mailman id 776148;
 Tue, 13 Aug 2024 11:16:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k7wN=PM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sdpVZ-00013U-F1
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 11:16:09 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 704ee7eb-5965-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 13:16:08 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5bd13ea7604so3763294a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 04:16:08 -0700 (PDT)
Received: from ?IPV6:2003:e5:8741:4a00:60e5:7bee:fc48:e85c?
 (p200300e587414a0060e57beefc48e85c.dip0.t-ipconnect.de.
 [2003:e5:8741:4a00:60e5:7bee:fc48:e85c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f3f4592esm62124566b.26.2024.08.13.04.16.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 04:16:07 -0700 (PDT)
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
X-Inumbo-ID: 704ee7eb-5965-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723547768; x=1724152568; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EoP0tRVfzxJeZMfFko5q/tlhB7DnyQb+0Eu7OPUZLYk=;
        b=SpuN6U53jGs6DjFHYpN29L7hDXZWFSFyukraIFoJ8LWwL61DjqSGEpT+dh08zNOIXA
         bodxkHmdfYGtx7z9q0zOwfMfFb8Kfu9fgpN4PNCUd6/LCamMNBvFsQLsHhUTnKBVOM6n
         nojEb3krYPxaOXaaEt7NjjCNTNYFa49hmKioqww7x/1jL2W95zPenvjECRK56xEKEfZD
         xn0Xo6gUnS1hg7sxTal00ACeTAJTZQw0GvXxHvV7VPPoDGAI68J+UDZ5vP/DFjuDu866
         bPNyluGvhyqWjvXIFAM4b2V7WoJe27O8eb9wEBH20G7+d+XzljwMeiQXH9o79+EPtgk9
         jJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723547768; x=1724152568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EoP0tRVfzxJeZMfFko5q/tlhB7DnyQb+0Eu7OPUZLYk=;
        b=josBg+w09Cxoz6pOuxxSTj+W3cOy7NYtSH3m3IwKcrU2rDJsIQSSM66EyZ1ZqoiBAH
         cilLtpULlk/y50G88Oxwy6WTTPJR302LuFkhX0tWAB4JuxapZjigeJiMQ5EiAIzMQ8IC
         l42bhTiOju7jT/SG5020Ven9REqCH5ZD7n9b8Ph2Fdmv8+cco+ZQXGzHg+q6BfR1pEe5
         /WxnzYS8ymUo3WlH5Hyqj2UHiD8aWjVhPkyFOV1Bs6cDdybAZSsMGOBvwRIPLCU5t8Wl
         lX5MoXM51R11KNQFrwVV9rWmRg7RIeD9brhBVYATOGVj2fg33LMVVcS8/9lTCMBHxfNf
         6EzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSfYoIlrBcJwRvuyS+aw+Z3SpZkutNbn4CH1PrFAnAtI767bCcoob3Rxs1CMsABk5dlMhdIr/RqG0VzpZVvexWnBjMKhW9WLYwshz9m4w=
X-Gm-Message-State: AOJu0YxlC6BImrtEoGNJd1GpEPVsuXH2rziOL9YqXAxDnq22Xy2l2vBY
	SlFK3JtGvLrVKWZ+efBSibcpEfPHkRhU0CndvP1B3q/X720pxxOBy2VPTigEDoY=
X-Google-Smtp-Source: AGHT+IFOBdcCjM5lmvme4GWY5MzakbZGHggm4WjCZgZ24kzqM4XwWxPKUvAnJ2PYZctfxZRJ46WQSg==
X-Received: by 2002:a17:907:c0f:b0:a7a:c812:36bb with SMTP id a640c23a62f3a-a80ed1aa7bcmr246643366b.8.1723547767685;
        Tue, 13 Aug 2024 04:16:07 -0700 (PDT)
Message-ID: <ab4ca68e-ec1b-467f-9b89-38f63cc19b7c@suse.com>
Date: Tue, 13 Aug 2024 13:16:06 +0200
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
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <Zrqykdarr7JHaeOZ@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13.08.24 03:10, Elliott Mitchell wrote:
> On Tue, Jul 09, 2024 at 11:37:07AM +0200, Jürgen Groß wrote:
>>
>> In both directories you can see the number of spurious events by looking
>> into the spurious_events file.
>>
>> In the end the question is why so many spurious events are happening. Finding
>> the reason might be hard, though.
> 
> Hopefully my comments on this drew your attention, yet lack of response
> suggests otherwise.  I'm wondering whether this is an APIC misprogramming
> issue, similar to the x2APIC issue which was causing trouble with recent
> AMD processors.
> 
> Trying to go after the Linux software RAID1, my current attempt is
> "iommu=debug iommu=no-intremap".  I'm seeing *lots* of messages from
> spurious events in `xl dmesg`.  So many I have a difficult time believing
> they are related to hardware I/O.

Seeing them in `xl dmesg` means those spurious events are seen by the
hypervisor, not by the Linux kernel.

So IMHO this is not a kernel issue.

> In which case could the performance problem observed by Andrei Semenov
> be due to misprogramming of [x2]APIC triggering spurious events?

I don't see a connection here, as spurious interrupts (as seen by the
hypervisor in your case) and spurious events (as seen by Andrei) are
completely different (hardware vs. software level).


Juergen

