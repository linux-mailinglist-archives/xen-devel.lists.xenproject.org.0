Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF587A1A8C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 11:29:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602969.939815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh56p-0000ZR-0v; Fri, 15 Sep 2023 09:27:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602969.939815; Fri, 15 Sep 2023 09:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh56o-0000WL-Sz; Fri, 15 Sep 2023 09:27:30 +0000
Received: by outflank-mailman (input) for mailman id 602969;
 Fri, 15 Sep 2023 09:27:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=upey=E7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qh56m-0000WF-T3
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 09:27:29 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14dd74c1-53aa-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 11:27:25 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-307d20548adso1801431f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Sep 2023 02:27:25 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 q11-20020adff50b000000b0031c71693449sm3983195wro.1.2023.09.15.02.27.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 02:27:24 -0700 (PDT)
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
X-Inumbo-ID: 14dd74c1-53aa-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694770045; x=1695374845; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rrxn31qdFyPW9BNgFY/Bk2Mhr8vWDuG++KxBiAye41c=;
        b=u0jcguaK7cokMzLYYBeVgUwcnDDbEG1wndOztfSW07cn/34LwwljFjc/BH+RIMN2W0
         Zkws6+OeIsbl8w9TCy8D8zvE2zFpR65bI22v9smWtpoB4Jgkz+ayKAr/wEMMqtCmoeTy
         E9nl9erWNrUif1ApN4ypIwRP5MPfdQeAS3eSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694770045; x=1695374845;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rrxn31qdFyPW9BNgFY/Bk2Mhr8vWDuG++KxBiAye41c=;
        b=ECBAc1dNUSwMxgLqFNc4Cc9VI6KeIwDhEGWFC3NeecvquryFF7Ci2DXTWgpOWBHF/I
         2Hz7RggVmRD9do+jvGDm0bE1iWRBPJ5ibEPeB9EkhV5uRKblDWVLJ2RR+CwPsi+cbtSD
         ZKfoUIe6Jy0P/S8cqHM0ZmRMEaCVHSo6an5rjA7DUpgyrWGoN5JDVCZ7eUTNsuid2d9s
         Van5ZVu+UTSQplAbQR0Cx16HHPcf4ACj3xjiWYXkrMLdej0d+XQO0mZVfHEETQQIZDLR
         1ykZRJFq8x8yGY8QNzN1oWxurg1SgXdR5rQzgnSEyRDO+rhAxHxeID8IaWrOepb+RjpB
         9pGA==
X-Gm-Message-State: AOJu0YyjgnI3LNL87EHTfHpzO+Vf40X4cpiYaOrubRM3qMXJbrYWFaxr
	hoEigCLGC5y7EHyk6RNQQ/VwLQ==
X-Google-Smtp-Source: AGHT+IH9I5QEPKjur3kAcPrzgTuBmCnS2eRswmuEsxlhKYXZCsm3/vowqKvACEaFexwSJ5ds8faECw==
X-Received: by 2002:a5d:4607:0:b0:31f:d8be:a310 with SMTP id t7-20020a5d4607000000b0031fd8bea310mr905821wrq.63.1694770045017;
        Fri, 15 Sep 2023 02:27:25 -0700 (PDT)
Message-ID: <a5a4e5e0-ec10-77e8-7c7a-9e89e2a9f172@citrix.com>
Date: Fri, 15 Sep 2023 10:27:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/8] x86/spec-ctrl: Extend all SPEC_CTRL_{ENTER,EXIT}_*
 comments
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
 <20230913202758.508225-5-andrew.cooper3@citrix.com>
 <e12f46d9-25eb-d564-4cb7-0e476e741725@suse.com>
 <35177e10-3306-69fc-4ece-bba453cbdb0c@citrix.com>
 <63f0afcd-1baa-ae78-cc01-5f2e2d606201@suse.com>
In-Reply-To: <63f0afcd-1baa-ae78-cc01-5f2e2d606201@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/09/2023 8:07 am, Jan Beulich wrote:
> On 14.09.2023 21:23, Andrew Cooper wrote:
>> On 14/09/2023 8:58 am, Jan Beulich wrote:
>>> On 13.09.2023 22:27, Andrew Cooper wrote:
>>>> @@ -319,7 +334,14 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
>>>>      UNLIKELY_END(\@_serialise)
>>>>  .endm
>>>>  
>>>> -/* Use when exiting to Xen in IST context. */
>>>> +/*
>>>> + * Use when exiting from any entry context, back to Xen context.  This
>>>> + * includes returning to other SPEC_CTRL_{ENTRY,EXIT}_* regions with
>>>> + * unsanitised state.
>>>> + *
>>>> + * Because we might have interrupted Xen beyond SPEC_CTRL_EXIT_TO_$GUEST, we
>>>> + * must treat this as if it were an EXIT_TO_$GUEST case too.
>>>> + */
>>>>  .macro SPEC_CTRL_EXIT_TO_XEN
>>>>  /*
>>>>   * Requires %rbx=stack_end
>>> Is it really "must"? At least in theory there are ways to recognize that
>>> exit is back to Xen context outside of interrupted entry/exit regions
>>> (simply by evaluating how far below stack top %rsp is).
>> Yes, it is must - it's about how Xen behaves right now, not about some
>> theoretical future with different tracking mechanism.
> Well, deleting "must" does exactly that

Nonsense.

*When* someone changes the logic such that there's an alternative route,
the comment necessarily needs updating.  And until that point, the logic
*must* behave in this way to be correct.

~Andrew

