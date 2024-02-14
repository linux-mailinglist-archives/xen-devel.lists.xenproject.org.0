Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739348548AE
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 12:46:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680646.1058696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDiC-0000GR-6A; Wed, 14 Feb 2024 11:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680646.1058696; Wed, 14 Feb 2024 11:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDiC-0000EE-2T; Wed, 14 Feb 2024 11:46:00 +0000
Received: by outflank-mailman (input) for mailman id 680646;
 Wed, 14 Feb 2024 11:45:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Sn1=JX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1raDiA-0000E8-6J
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 11:45:58 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9dd9986c-cb2e-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 12:45:57 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a38271c0bd5so684742966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 03:45:57 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 s22-20020a170906285600b00a3d6590e4d7sm98842ejc.84.2024.02.14.03.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 03:45:56 -0800 (PST)
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
X-Inumbo-ID: 9dd9986c-cb2e-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707911157; x=1708515957; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w/Mu3JHm0P4wjycZ6WMNTmkQvj92o0r1X1GhbBbxUyM=;
        b=Mgbf4zoHumiITNIOsF+rLnHDAs8bDXi9LORQPDvLXusjyJD+paF+5RczfQVuz0q3sg
         Sbx1Z9PtEY6fftKGUbUoXTMCh0Yd9badFGG4JU32/psk604cslQwY0/nWFzpPWKPL63T
         FrTmWvphXfAHc+CyOMMq3M6KXBMObXfk/d1ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707911157; x=1708515957;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w/Mu3JHm0P4wjycZ6WMNTmkQvj92o0r1X1GhbBbxUyM=;
        b=TTCEuloNAHVz0x3kfaMUyOM0OBVbPQKzULBaEDVjXtS6bR3eg5hN8BW3QsqupBXiXG
         XAdMdTQLMiMgaGnypRC251Umrxw6Y2F+pf2BXsGcm6sQWVqM4z+3roS6ihOIhheBpVGA
         ACrjY2B8k7Y4EbM+8Nje37xp3oAS6rRwY1g7JpHs1w7XxVJdoFK5DKYCXUrxAw2GOGVa
         aPaDlgJUmJY+R0WF58MXC49EstX63stcRN8eEezbxitwMMhYNDbfNXH01QNTOf5AFLs+
         WEqq8L9fvoYdxQ4EJmVekzDZKjcpXXMb3BbExLJ/6kzQiCqgdf3at/8ik18xWevymRWx
         Wilw==
X-Gm-Message-State: AOJu0YwoTfTXkUqNelOcQA5IZuvLUOx3s41GdsbStkZCTlN62cN98x6C
	D1PlKZUyd4pQ0hnuZEJ/fVVuMKvzRkLFyQHvV0unXLYQXVBbdGz3YtAzgm7jMls=
X-Google-Smtp-Source: AGHT+IHBHws9hnAQs/21HEXnOV9LVtBy31PavabBJuaj1V/U/poOWA7qiTU93uV/O1IfJKvJjOy5/g==
X-Received: by 2002:a17:906:dc0a:b0:a3c:c980:5936 with SMTP id yy10-20020a170906dc0a00b00a3cc9805936mr1722493ejb.24.1707911156876;
        Wed, 14 Feb 2024 03:45:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUm87J+Fx14s8ChPQl/T6DKxtoD7gX1Xc1TPuV6lwXF2azO1Ebgm5YdR78n9regKIMlwSW30ieN2hXohYsOqnNMVUm+QLwHL8IEjpgyHoLS882LsdAy/TJEvMIgq9LQ7vZGEKBp00illLGl+Am92Agf0Kql4+3frpytGzjnsj9uM9AH7X81XUgR5YchVfaNfjAWCv18Tw==
Message-ID: <046415d5-d4f4-4870-a588-60637ea3bc3a@citrix.com>
Date: Wed, 14 Feb 2024 11:45:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] tools/ocaml: Add missing vmtrace_buf_kb field
To: Jan Beulich <jbeulich@suse.com>,
 Christian Lindig <christian.lindig@cloud.com>, =?UTF-8?Q?Petr_Bene=C5=A1?=
 <w1benny@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, David Scott
 <dave@recoil.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <9b9909c9e93cb540b3488c784935acc2bc9e071e.1707343396.git.w1benny@gmail.com>
 <3A858D7F-C953-4EF0-8919-AE96D6105AB1@cloud.com>
 <01b0d902-1903-4618-ad43-f625e57b61e1@suse.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <01b0d902-1903-4618-ad43-f625e57b61e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/02/2024 7:11 am, Jan Beulich wrote:
> On 08.02.2024 10:13, Christian Lindig wrote:
>>> On 7 Feb 2024, at 22:04, Petr Beneš <w1benny@gmail.com> wrote:
>>> Add the missing `vmtrace_buf_kb` field to the OCaml bindings to match the
>>> vm.cfg configuration, correcting an oversight from its initial introduction.
>>>
>>> Signed-off-by: Petr Beneš <w1benny@gmail.com>
>> Acked-by: Christian Lindig <christian.lindig@cloud.com>
>>
>> This looks correct from an OCaml perspective. Why was the new field added in the middle of the record type domctl_create_config and thus forcing changes to the index of fields coming later in the record versus just appending the new field to the record type?
>>
>> The critical bit is using the correct type in "Int32_val(VAL_VMTRACE_BUF_KB)” that matches the type "vmtrace_buf_kb: int32;” - which it does.
> Is this then perhaps also lacking a
>
> Fixes: 45ba9a7d7688 ("tools/[lib]xl: Add vmtrace_buf_size parameter")
>
> and hence wanting backporting?

It ought to have been part of that at the time, but I suggest not
backporting.

API changes in Ocaml are all breaking (module compatibility is checked
by hash).

Xapi is the only consumer of this interface.  I've fixed up the build
against staging, but we're not going to be running KFX under Xapi any
time soon.

Ultimately it's Christian's call.

~Andrew

