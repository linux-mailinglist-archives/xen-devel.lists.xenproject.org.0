Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CB77DFC88
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 23:44:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627027.977868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qygQD-0004lJ-Mh; Thu, 02 Nov 2023 22:44:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627027.977868; Thu, 02 Nov 2023 22:44:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qygQD-0004jC-JQ; Thu, 02 Nov 2023 22:44:17 +0000
Received: by outflank-mailman (input) for mailman id 627027;
 Thu, 02 Nov 2023 22:44:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7M36=GP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qygQB-0004j5-VJ
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 22:44:16 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 591d0883-79d1-11ee-98d7-6d05b1d4d9a1;
 Thu, 02 Nov 2023 23:44:14 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-408425c7c10so10791305e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Nov 2023 15:44:14 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 fb14-20020a05600c520e00b0040841e79715sm461646wmb.27.2023.11.02.15.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Nov 2023 15:44:13 -0700 (PDT)
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
X-Inumbo-ID: 591d0883-79d1-11ee-98d7-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698965054; x=1699569854; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p0rB/2LsNl68vDxX1EJoSXT8XjF2Avfiz+vjjcUdzjg=;
        b=JLcMAIt8UN5sJtsrPlUHYoj/XU5WcIXaaeLloD31qT+5Y+kld3BfvrtbSarFzxt53S
         DJmt36LrYHp1gW7aCEt9DxddVnZfijRAbZNITdiQvVwwIS22/jKqmIh5HOsOWTHoQJH7
         +Su0qP3tGU6f8dpEHNcujeS/e7ypjdVbh0qyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698965054; x=1699569854;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p0rB/2LsNl68vDxX1EJoSXT8XjF2Avfiz+vjjcUdzjg=;
        b=vhfYUObnNepZTkZ7O9EbHTICxD/kosAH0x/hZz61fZ7uyfDDMreD4OxG8n2lnt/Bxo
         /j3aWRbnEwKGi7ybrBKNFcRah9dGcksGSzZy+IXTwgnl2QJgclCVl0QtxyxA+jBdahgN
         p3zuey3kvlqs0zovFtZfFmcNdhKsahg2n+g6jTR+vbDaDBDDLgj+Wt6/3jPUq60TpsI2
         UibTcHPhC/6ICpoJ0rh6FsDrIgNPpQYPaSIQtVIKBRipkjcoMFGMNneWe5+psYhl6g+R
         a4l3IZ4MMcfQKkCfyLaW+qzA82+78RTxuZt0FbbfGGJ1y1ZE/+Wo86TwvDvlqldcy++i
         Sd4Q==
X-Gm-Message-State: AOJu0YxzOzToClS0/4ftBI94uVjCVRTBASe7KhucVZE5j7NBysSSgdXZ
	weoAvlPUi8q2vD50VSBBTpWw3Q==
X-Google-Smtp-Source: AGHT+IHJcGAuj/8Xlb0Qt6xkr6jrs0biwA6mRBBjLti4Uw81ecVRYShj3rz677LXzH/H2fqk2iF1pg==
X-Received: by 2002:a05:600c:5250:b0:409:5a92:4718 with SMTP id fc16-20020a05600c525000b004095a924718mr5000283wmb.36.1698965054125;
        Thu, 02 Nov 2023 15:44:14 -0700 (PDT)
Message-ID: <1982dde0-8651-4de4-83f8-c39d50268d8e@citrix.com>
Date: Thu, 2 Nov 2023 22:44:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] xen/lib: remove the overwrtitten string functions
 from x86 build
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org, consulting@bugseng.com,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
References: <c313895654437fe154e989a7d633cca2ccc710d8.1698914967.git.federico.serafini@bugseng.com>
 <fd55a636-094f-4c9a-b57c-44fcefa1eb20@citrix.com>
 <alpine.DEB.2.22.394.2311021521500.2125691@ubuntu-linux-20-04-desktop>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2311021521500.2125691@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/11/2023 10:23 pm, Stefano Stabellini wrote:
> On Thu, 2 Nov 2023, Andrew Cooper wrote:
>> On 02/11/2023 10:21 am, Federico Serafini wrote:
>>> Remove the generic implementation of memcpy(), memmove() and
>>> memset() from the x86 build since a version written in asm is present.
>>> This addesses violations of MISRA C:2012 Rule 8.6 ("An identifier with
>>> external linkage shall have exactly one external definition").
>>>
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> As I said on one of the previous calls, this is an error in analysis,
>> not a bug in Xen.
>>
>> The behaviour when linking a library is well defined by the toolchain. 
>> Disassemble the final hypervisor and observe that there really is only
>> one implementation, and it's always the arch-optimised version when both
>> exist.
> This is done automatically by linker, right? I am asking because I was
> curious and searching through the build system but couldn't find a
> specific place where the dropping of the lib implementation of things is
> done.

It's a property of linking, yes.

There is a specified order that libraries are searched (L->R on the
cmdline, IIRC) and the first object in a library to provide the symbol
is the object that gets linked in.

There are corner cases where you can pull in unrelated code and end up
with multiple symbols of the same name, and this is explicitly mitigated
by having one (public) function per object file wihtin the libs.

~Andrew

