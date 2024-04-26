Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A10428B33EB
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 11:26:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712599.1113401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0HqR-0004Fh-Ci; Fri, 26 Apr 2024 09:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712599.1113401; Fri, 26 Apr 2024 09:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0HqR-0004E1-9T; Fri, 26 Apr 2024 09:26:15 +0000
Received: by outflank-mailman (input) for mailman id 712599;
 Fri, 26 Apr 2024 09:26:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LIFE=L7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s0HqP-0003j3-Vm
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 09:26:13 +0000
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 060b334b-03af-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 11:26:13 +0200 (CEST)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-43969307359so12023771cf.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 02:26:13 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 kf22-20020a05622a2a9600b00434a041d310sm7726594qtb.16.2024.04.26.02.26.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 02:26:11 -0700 (PDT)
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
X-Inumbo-ID: 060b334b-03af-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714123572; x=1714728372; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HqG6gnKHSAGTiM2IURHK+HU8sY5bT7kNa/o07cI4jFI=;
        b=rdxpV/VNyvanrcsV/efp9rodQMUn/kqwWO5A+1UcpOqXfXfvPms8cyV9ZjuaK7jWqL
         L2Dmr8S+r8fStpTnd6VRawqCGGmD+a4vJaQn4kEoyZsvjvqkF+AuFuGJxKNbKw2KMSYB
         kUarYVn6RGk2jHe0BBn0MtmiVq/UwCsePVxXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714123572; x=1714728372;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqG6gnKHSAGTiM2IURHK+HU8sY5bT7kNa/o07cI4jFI=;
        b=lWs7Klrv3AJR+7ddfBsAhcULCIFISHoGT/PksLiyNOMsXjEsTYl5mCJDUbOKt6IEbk
         rALxoqahAes6Rb1mEertV7+kgSFJ3C+KD7raJosqE41l7h/M7c+KWZdDjkM4ov2XbMiS
         lUOJ29d93QhjMOHmUc7qlqhN0m6WVjbNuYqaacNHT/g1kpStb0aV9G6O6+CISfI98K8d
         CevNWrjhtgByhF6a74DOhBvvnhL2F/SftPa5jLsWQBksycdtG1dwpPWz2NGuDJZ57nNp
         XwMQM8zRLWiuw4/opl2eiMQse3EGaa63h30eTR047RxM9GQP58hix9xfVZyMAg0U2cIj
         MOLw==
X-Gm-Message-State: AOJu0Yxx4wXe0aJtLh35Y4dUZiR5Vi6ZPMVM8GXsk0go4lkOvJNCiyqW
	AIs1OBlB6o1mB4J8wqOtFrN0IQDgRV0CTWWmcDykTb/vJKM3ZPRjpYsN1Idz9/U=
X-Google-Smtp-Source: AGHT+IFJrKAxABRo+f61oTcjzeX3ejiFbMPq4z7KuPMOQpV33Zl/VIa/jyXeD2fSHDb2OykEP1rKmg==
X-Received: by 2002:ac8:5a0d:0:b0:439:b55f:db06 with SMTP id n13-20020ac85a0d000000b00439b55fdb06mr2631368qta.54.1714123572065;
        Fri, 26 Apr 2024 02:26:12 -0700 (PDT)
Message-ID: <74b57e28-c006-44fa-87f0-da37f0539dbc@citrix.com>
Date: Fri, 26 Apr 2024 10:26:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tools/{c,o}xenstored: Don't link against libsystemd
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240425173216.410940-1-andrew.cooper3@citrix.com>
 <20240425173216.410940-2-andrew.cooper3@citrix.com>
 <b5e242fa-daf1-43a2-afd2-cc1ad1bd4dc1@perard>
 <341c5901-254e-4ad2-b935-6b586cd25f2e@citrix.com>
 <413a63de-07ec-43a9-ae60-6b0cfdd61312@perard>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <413a63de-07ec-43a9-ae60-6b0cfdd61312@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/04/2024 9:51 am, Anthony PERARD wrote:
> On Thu, Apr 25, 2024 at 07:16:23PM +0100, Andrew Cooper wrote:
>> On 25/04/2024 7:06 pm, Anthony PERARD wrote:
>>> On Thu, Apr 25, 2024 at 06:32:15PM +0100, Andrew Cooper wrote:
>>>> libsystemd is a giant dependency for one single function, but in the wake of
>>>> the xz backdoor, it turns out that even systemd leadership recommend against
>>>> linking against libsystemd for sd_notify().
>>>>
>>>> Since commit 7b61011e1450 ("tools: make xenstore domain easy configurable") in
>>>> Xen 4.8, the launch-xenstore script invokes systemd-notify directly, so its
>>> That's not enough, it's needs to be `systemd-notify --ready` to be a
>>> replacement for sd_notify(READY=1).
>>>
>>>> not even necessary for the xenstored's to call sd_notify() themselves.
>>> So, sd_notify() or equivalent is still necessary.
>>>
>>>> Therefore, just drop the calls to sd_notify() and stop linking against
>>>> libsystemd.
>>> Sounds good, be we need to replace the call by something like:
>>>     echo READY=1 > $NOTIFY_SOCKET
>>> implemented in C and ocaml. Detail to be checked.
>>>
>>> Otherwise, things won't work.
>> Hmm.  It worked in XenRT when stripping this all out, but that is
> I don't know how XenServer is setup, maybe it doesn't matter?

In theory it's straight systemd, but I could also believe that Xapi
checks for the pidfile too.

>  Anyway...
>
>> extremely unintuitive behaviour for `systemd-notify --booted`, seeing as
>> it's entirely different to --ready.
> Yes, this --booted option should probably not exist, and there's
> `systemctl is-system-running` that does something similar.
>
>> I've got no interest in keeping the C around, but if:
>>
>> [ -n "$NOTIFY_SOCKET" ] && echo READY=1 > $NOTIFY_SOCKET
>>
>> works, then can't we just use that after waiting for the the pidfile ?
> Run `systemd-notify --ready` instead. Hopefully, that will be enough.
> ($NOTIFY_SOCKET is a socket, and a bit more complicated that I though,
> it can start with "@" for example)

I'll do a prep patch to adjust launch-xenstore after which this patch
should be fine in this form (modulo a tweak in the commit message).

~Andrew

