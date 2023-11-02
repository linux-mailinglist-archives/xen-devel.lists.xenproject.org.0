Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DA37DFAC4
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 20:16:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626962.977729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qydAt-0007Is-QV; Thu, 02 Nov 2023 19:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626962.977729; Thu, 02 Nov 2023 19:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qydAt-0007Fg-N9; Thu, 02 Nov 2023 19:16:15 +0000
Received: by outflank-mailman (input) for mailman id 626962;
 Thu, 02 Nov 2023 19:15:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7M36=GP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qyd9m-00073V-A8
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 19:15:06 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 210154d1-79b4-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 20:15:05 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32db188e254so759696f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Nov 2023 12:15:05 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 o25-20020a5d58d9000000b0032db430fb9bsm86201wrf.68.2023.11.02.12.15.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Nov 2023 12:15:04 -0700 (PDT)
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
X-Inumbo-ID: 210154d1-79b4-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tibco.com; s=googleworkspace; t=1698952504; x=1699557304; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/WFlO5lpcERroBO4vg9LKLz1TVeISTzTk/LnAiyB/nU=;
        b=C0oc0F3Cs61gsKm8dXP9OU/fxLJYLpikboHawFlHcm4NoDwGSzANzkmAJTjlsnPcvO
         H+H1zPS21p3HWZCrDEE6/7jE5d5aa72oXjwQJQKZp2C5byFvq2Uk0kCPnmKOs1hy5Kyj
         RVUEJO3tD2o+rr7BiNIHu4v/EQdkmKesgIp8AybggyEtQrbJZyo7cmgDYkXpGeFnH0dx
         pFmskGju4/EUZhWPlMr/9+gTmXpQmtYdtM6BLKEEiBoQ/NZ8109tPf3M5XVaq0rMf9yZ
         N4Xzr+a4g8L1hDOD2dye8H9ZG6u3Eg78XnO92Sc5eN46XsgDV+s6ohzEZ9BczqtLdsb5
         Bkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698952504; x=1699557304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/WFlO5lpcERroBO4vg9LKLz1TVeISTzTk/LnAiyB/nU=;
        b=HqwBGPmEU/At6HdXzlbZeY7XLS7yMZRS5OvUSCb13ONcbRE1PV0JevlqlIeffEKVjH
         nWgTKFEjFJZqyPNS6ctNVFU6EgIKkB9NWeDBVEZIYWtL83dF9WwcMXF5qgV6K+Q8H0lt
         nouMQfPRGLiXH4XYzYrxp1WimX577OWfXj5d/4JnYeTIBKhQ5x3kqQlJhRljAjmkXZ42
         8r2l2bYivm8ct6JkQLZrricqJeEbbB+2MPD9+lRWn783khvtCEoRV5oCHM1Pafs+2TU6
         FBT7z1lEd/d4mEckhJ/4vpOGQalTl7wHXaoD8G95cy5WUeu2oPLYNP2jHm/EtsZe2WBf
         Z3Fg==
X-Gm-Message-State: AOJu0Ywf94FJl5Fc+lqmznssGg4nN43n6fP567sHN2crlrpAIlJJtRPg
	JcoRUGJ4i7yh5Wk6vTD6FZGZtQ==
X-Google-Smtp-Source: AGHT+IFBmphUMvsMFvEc7S3O26TJBTgSA7J0oyGM6imNppL2Ap9ufBGhyndUXj1hmp4AFMCve9gRMA==
X-Received: by 2002:adf:d1e4:0:b0:32f:7c6c:aa14 with SMTP id g4-20020adfd1e4000000b0032f7c6caa14mr15146689wrd.37.1698952504596;
        Thu, 02 Nov 2023 12:15:04 -0700 (PDT)
Message-ID: <feb6578d-9c2f-4e7f-ab1b-af588c22165b@tibco.com>
Date: Thu, 2 Nov 2023 19:15:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/29] tools: add a new xen logging daemon
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-3-jgross@suse.com>
 <CAKf6xpt6LwSB2QaCnW7MvKJWq5rkR6qoFEG4ZCKVqv3MKeMMuQ@mail.gmail.com>
 <9b60fe7c-a960-4463-a0cf-1126ba29bcaf@suse.com>
From: Andrew Cooper <andcooper@tibco.com>
In-Reply-To: <9b60fe7c-a960-4463-a0cf-1126ba29bcaf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/11/2023 7:44 am, Juergen Gross wrote:
> On 01.11.23 19:36, Jason Andryuk wrote:
>> On Wed, Nov 1, 2023 at 10:27 AM Juergen Gross <jgross@suse.com> wrote:
>>>
>>> Add "xenlogd", a new logging daemon meant to support infrastructure
>>> domains (e.g. xenstore-stubdom) to write log files in dom0.
>>
>> As I understand it, your new daemon is a generic 9pfs backend, which
>> you use for logging.  I think naming it something like xen9pfsd would
>> more accurately describe its functionality.
>
> Fine with me. I'll wait a little bit to see what others think.

FWIW, I too looked at xenlogd and thought it probably wasn't ideal, but
I was going to wait until glancing at the whole series before suggesting
an alternative.

If it really is a generic 9pfs backend, then +1 to Jason's suggestion,
although preferably as xen-9pfsd for improved legibility.


But a couple of other remarks while I'm here.

It's great to see that it only uses stable libraries, and I hope that
remains true to the end of the series.  If we end up wanting unstable
APIs, can I suggest that we take the opportunity to stabilise them as a
prerequisite.

In this patch, stop_me needs to be volatile or read with
ACCESS_ONCE()/etc.  The only thing stopping GCC turning it into an
infinite loop is sleep() being an external call.  daemon_running may
need similar treatment, depending on how it gets used in later patches.

~Andrew

