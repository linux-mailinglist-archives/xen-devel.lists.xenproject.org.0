Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C427DE4F0
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 17:58:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626558.976886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyEXZ-0004HC-Gu; Wed, 01 Nov 2023 16:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626558.976886; Wed, 01 Nov 2023 16:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyEXZ-0004Ev-De; Wed, 01 Nov 2023 16:58:01 +0000
Received: by outflank-mailman (input) for mailman id 626558;
 Wed, 01 Nov 2023 16:57:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0NXV=GO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qyEXX-0004AM-Kb
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 16:57:59 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cede10bc-78d7-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 17:57:58 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40907b82ab9so6347105e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Nov 2023 09:57:58 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h9-20020adfe989000000b0032d687fd9d0sm288398wrm.19.2023.11.01.09.57.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 09:57:57 -0700 (PDT)
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
X-Inumbo-ID: cede10bc-78d7-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698857877; x=1699462677; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FLZ6tNQ/A2vbiZz2sPjqUss0ApEQ9rfGLrSINlMrlcQ=;
        b=HrHW3EeXOTD2wsksJHFpxYXrDjAgvBsZbFDA9h9Jb2etdbe108tD+9sSsHPkq9eZUl
         CBOke1EN4wTxNzuAMVq5kCtQHiu3kJFZo6MW1wRkFc4BaA5fW2BUdZo5Va8Bnz18kpIn
         I3e9HrOkd8cZS3tjqN+uWv8B3FyPxirMe7cqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698857877; x=1699462677;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLZ6tNQ/A2vbiZz2sPjqUss0ApEQ9rfGLrSINlMrlcQ=;
        b=BlcmOSVPHA1wtfSqieZ1NzKAlxl3KKilruOdj1yBcla9MN0UYuwAEgTleR0A+5VPb8
         ZSyXNt9mmi6p/VfGQx7dPJRh+OIqoQJUGZpCFLQk/DcXCw8RqdIRcxTXL+5M3bI4yo5/
         Uc3VQ334p4cUCp1EqAjMmXJPhx4RqPInXak9Ky5aoMVM9HZ2bFJ0ja6kXjdsROfmRbLG
         6UJl4oLuZkBl88fexOnTm4yRIc/Ez23+djDDpOfz8p95cr/5hfSprh7v6FOwOXP79T1D
         N7NgfH0NeQDjPEUvnOD9wFgjOLTtwY0aPDxYv2r/UFrmKOHiL2Lo9Zdl1C9cu3EaZUdq
         Ioyw==
X-Gm-Message-State: AOJu0YwsDPKgCFwLFAKQlKpGie3g7QWLsEseYpyvvpvQWJxLXoxAot2K
	c4artVHz2fHXbgH5aLRlgCXaUlUVSiFCIYV0tFY=
X-Google-Smtp-Source: AGHT+IFBo4oM/hRreaBXk2wb7bvdGk8J6SunxBAw7mqiXoA9kvEW1RxqO+/9Qvvi8m3EImtFHA936g==
X-Received: by 2002:a5d:584e:0:b0:32f:8b11:914e with SMTP id i14-20020a5d584e000000b0032f8b11914emr7816368wrf.8.1698857877523;
        Wed, 01 Nov 2023 09:57:57 -0700 (PDT)
Message-ID: <b3d8390f-1cd9-461c-9d98-364a01f33bb5@citrix.com>
Date: Wed, 1 Nov 2023 16:57:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] Mini-OS: don't crash if no shutdown node is available
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20231101090024.28934-1-jgross@suse.com>
 <20231101090024.28934-3-jgross@suse.com>
 <e287ebbb-77e4-461e-ae21-e2c6a8027686@citrix.com>
 <769a0a44-6a1c-40a9-aa8a-ddebd794cd79@suse.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <769a0a44-6a1c-40a9-aa8a-ddebd794cd79@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/11/2023 4:42 pm, Juergen Gross wrote:
> On 01.11.23 17:38, Andrew Cooper wrote:
>> On 01/11/2023 9:00 am, Juergen Gross wrote:
>>> It might be perfectly fine not to have a control/shutdown Xenstore
>>> node. If this is the case, don't crash, but just terminate the
>>> shutdown thread after issuing a message that shutdown isn't available.
>>>
>>> In fini_shutdown() clearing the watch can result in an error now, in
>>> case the early exit above was taken. Just ignore this error now.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
>> Which cases might we not have a control/shutdown node?
>
> Xenstore-stubdom. It should _never_ shutdown, and it isn't really under
> control of Xen tools (other than being created).
>
>> I'm all for coping better with its absence, but it's not a piece of the
>> Xen ABI which is optional.
>
> I'd like to differ here. See reasoning above.

If we're going to permit this configuration, then I think it needs an
extension to xenstore-paths to make it officially optional.

And I think it's reasonable to support, but I wouldn't go as far as
saying "never".  If you've cleaved the global xenstored in
twain/trine/etc, then individual parts of it can shut down normally.

~Andrew

