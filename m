Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A06D48B3BFF
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 17:47:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712952.1113864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Nlx-00061m-GF; Fri, 26 Apr 2024 15:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712952.1113864; Fri, 26 Apr 2024 15:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Nlx-0005z8-DF; Fri, 26 Apr 2024 15:46:01 +0000
Received: by outflank-mailman (input) for mailman id 712952;
 Fri, 26 Apr 2024 15:46:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LIFE=L7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s0Nlw-0005z2-IV
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 15:46:00 +0000
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [2607:f8b0:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 129e52ef-03e4-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 17:45:58 +0200 (CEST)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6ea2f95ec67so1130228a34.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 08:45:57 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h30-20020a05620a21de00b0078d667d1085sm6331898qka.84.2024.04.26.08.45.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 08:45:56 -0700 (PDT)
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
X-Inumbo-ID: 129e52ef-03e4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714146356; x=1714751156; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FUS+C4npIg+hHkhDi8zHZuIKdJsIARWsLls/Dw6CeYE=;
        b=fcyDsxh3snNslPBGdHTW717WTexZ8LLmsYmXWfXokt4HZX/zHgLGc6B3t46Rb9qfoQ
         /o7Ug1zHAj5lbERpEl7GnY7u0Lpi470zcDWnn5JzTXHh9DlXvPic1pmTSPZ+5g8XKryd
         b9fU5ZxBbLBNYYzY/jKh/qrFBgmfZh/kKJYYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714146356; x=1714751156;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUS+C4npIg+hHkhDi8zHZuIKdJsIARWsLls/Dw6CeYE=;
        b=w7YdgTVvw2WLJwI9jfJyTAbHxQ4HGyZ63WWXVoXNbPA6kH/c2prkmZee0jvFNjYZOj
         fQUZDAiXiKNJ+qPdSdwcslcaG4mlaQAgx7dyGTmLHctqjT4fkezVagI0TyMbF5vLGCbb
         OERfcM1Xo4kc09x2QaoZhpOk/MwF2qwKbkwX9UrAIT81d39CsuxrbiSybp+ohPpt+ZDE
         F2LogO6h9ULn/bTNJ4+GA8Ts1DJjmNAawdtyDKwlRG692PgSgInG6Z1MWgUGgoYybUIu
         Y/3aKIXfbA1bYt7vh3wkZlp5xTGxFZe2k12qfX9i75FJaVUmso1q/rD/sUsHeDUgxtNO
         q03A==
X-Gm-Message-State: AOJu0YxbkYHavGQp+wF+psyyBHPbDlMbaxTQx+7CecH6pYq4wtfg+Z2z
	/jYzyYX/xO5yWej8HS+xa39UsHSFhMek1SIk8QKhzQdnDASlHY6XRp6ugBKzSTZlJOb4YaJtfAD
	i
X-Google-Smtp-Source: AGHT+IFAGRpJPQW5I3lPUU7ndiGl2AraRLIlh42Dcg87YivoELQH5fvKQABRblAAYKkO/lt7OndJJQ==
X-Received: by 2002:a9d:6492:0:b0:6eb:7d9b:386d with SMTP id g18-20020a9d6492000000b006eb7d9b386dmr3614838otl.32.1714146356615;
        Fri, 26 Apr 2024 08:45:56 -0700 (PDT)
Message-ID: <880ea017-d9d2-427d-a358-ce8ba176ba3f@citrix.com>
Date: Fri, 26 Apr 2024 16:45:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/hvm/trace: Use a different trace type for AMD
 processors
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@cloud.com>,
 Anthony Perard <anthony.perard@cloud.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Olaf Hering <olaf@aepfle.de>
References: <20240426143231.4007671-1-george.dunlap@cloud.com>
 <20240426143231.4007671-2-george.dunlap@cloud.com>
 <aecae47b-eba6-4544-a566-8eb259d11a41@citrix.com>
 <CA+zSX=b40xNSX2yNcnESW3ev3ZG5Esyp_+-9ADaWuLEmzpvr5A@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CA+zSX=b40xNSX2yNcnESW3ev3ZG5Esyp_+-9ADaWuLEmzpvr5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/04/2024 4:29 pm, George Dunlap wrote:
> On Fri, Apr 26, 2024 at 4:18 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> On 26/04/2024 3:32 pm, George Dunlap wrote:
>>> In xenalyze, first remove the redundant call to init_hvm_data();
>>> there's no way to get to hvm_vmexit_process() without it being already
>>> initialized by the set_vcpu_type call in hvm_process().
>>>
>>> Replace this with set_hvm_exit_reson_data(), and move setting of
>>> hvm->exit_reason_* into that function.
>>>
>>> Modify hvm_process and hvm_vmexit_process to handle all four potential
>>> values appropriately.
>>>
>>> If SVM entries are encountered, set opt.svm_mode so that other
>>> SVM-specific functionality is triggered.
>> Given that xenalyze is now closely tied to Xen, and that we're
>> technically changing the ABI here, is there any point keeping `--svm-mode` ?
>>
>> I'm unsure of the utility of reading the buggy trace records from an
>> older version of Xen.
> Yeah, I thought about that.  If nobody argues to keep it, I guess I'll
> rip it out for v2.

That's the way I'd suggest going.
>>> Signed-off-by: George Dunlap <george.dunlap@cloud.com>
>>> ---
>>> NB that this patch goes on top of Andrew's trace cleanup series:
>>>
>>> https://lore.kernel.org/xen-devel/20240318163552.3808695-1-andrew.cooper3@citrix.com/
>> The delta in Xen is trivial.  I'm happy if you want to commit this, and
>> I can rebase over it.
> It's trivial in part *because of* your series.  Without your series I
> would have had to do a bunch of munging around with DO_TRC_BLAH_BLAH
> to make it compile.  In fact, I started doing it directly on staging,
> but quickly moved onto your series to save myself some time. :-)

Ah.  I'll be refreshing mine next week.  Given that it's missed
everything since 4.16, I'm not intending to let it miss this one...

But I've still got a few things which need to go out before the
past-post deadline.

~Andrew

