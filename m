Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2681AABEC6B
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 08:51:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991532.1375363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHdIH-0008JN-Fd; Wed, 21 May 2025 06:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991532.1375363; Wed, 21 May 2025 06:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHdIH-0008Hi-Cv; Wed, 21 May 2025 06:51:13 +0000
Received: by outflank-mailman (input) for mailman id 991532;
 Wed, 21 May 2025 06:51:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHdIF-0008HO-Fg
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 06:51:11 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa79f8cd-360f-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 08:51:10 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-601f278369bso5618112a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 23:51:10 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005ae3aed4sm8287753a12.75.2025.05.20.23.51.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 23:51:09 -0700 (PDT)
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
X-Inumbo-ID: fa79f8cd-360f-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747810270; x=1748415070; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YVYXZRLpOWkBJa2fhZ8pLQuu1LIkaD5CXf8JiwDR42U=;
        b=SQliSQsy+qVRmcSlL6jb/zPKRR7qzfZP1be4srf2L476EEcG5gz3JMnwVbnOJqmzVJ
         +92cIjDVch1E9wtJs42jWbas4OOPIxiOR5Udh6NpG7xzvHP3fa2YqYfP5sMDQ/ZaJGm5
         xCMZ+RWUO54xn9MnqLImmxWEBp2jxR8ISrjX0i7ScdoHMlFIqb0s0Eu2vuQED5lpyBg9
         eQ3+jj+UsvwlCkWFSE03baw6XX+U67rdKThny2bngXP1LdA+pZmyUYr+n4/dqYz0BF4f
         OL/bqEhQTyCPBMrkhnf1Nqr8DEsv3bmJypGji7zSt0KaKR9bwvOEMqCFP9CswKd9x3Ov
         j1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747810270; x=1748415070;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YVYXZRLpOWkBJa2fhZ8pLQuu1LIkaD5CXf8JiwDR42U=;
        b=Op/nGQaLo/rWaetyNaRw2+JTqGsCsg0uwirQ4Q9vFGzm1rj9kTwmNce+snekrkCYj7
         XyLVnGqoel3Trcn5AlYyXYRvp+6OSeZQmi75gdsg+tWhd6jpA3jhCdVi8AOB9LvyubzL
         coaLUZ1LB20UmzfnBOe5mdcjb8lZkXshrsbF87wNwH3J7meVEbHFQGU16mFzJc4v6ySN
         k9Kv87XtAIiXiJ2tlPmYSc0Hk/lKlvqwV8x2F6CXLCd/LNZicRTDXS/3YzzpLGp3FtUi
         2j2hAUgon8/kPCUfP20PEmLF+0JyC1sOQD9HE3BBxGH/JCR0zSiXlKu2RlKd3PPWA++Y
         kmcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXts0Xw8XkhyQaMis9fE3wYfQhBEmG1pMxL/8OK3z/PgeWDfakLxWE14OT4+rpYSrvRW/ERzYT8UA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygfCY2C5rjEIDKFqQS1hd+Ry/UUOMYCB11Dw9Q5S9y7wYqnZ1H
	I9Em3mmEi9Lmz2165ie44VVoAQFlwnxW74CQoIzRR0Am8X/wP8Ojx31Vh62tprp4uA==
X-Gm-Gg: ASbGnctYUyMw8i9H7b74u0WGCIKL5GOGjkduZbhk9/fRxfI6u6ONlfRJA6luaWnmIHv
	GThrPAZahrV0zx9Ji9oo4yd9/klPjxSXHWxHY4zzI6OhhtxQq4pqfkG27pWglhgn0gFD2SaZruN
	3KitpKK8fL2AXYbsfHusFzAzAh8ta1LNXkyV1fIRAkEHAIPVIklOXbiKK0zgCsp9/cXOkSuXt58
	TJN9sIznGx1siXsnK8x4XYlAeDU4Mq/guQ/6AdBRi/d0B+1nZilDdzy+B3vYed2gyIc/2clNvmo
	GbhNJJPofXjoM+vcHYSR1rHR+QPd/KTmtLxHVQ9DGof11vthDIvPfaGy5kRjA/Fd3yHBUNId
X-Google-Smtp-Source: AGHT+IG8iGzXj7eHx3TrMkdHB3lT2dCrQug4vhRdJXAexu7mDJlbJ8IgG/XNiwb8ZSc6mPkdaGmeYg==
X-Received: by 2002:a05:6402:34cd:b0:601:89d4:968e with SMTP id 4fb4d7f45d1cf-60189d49a3emr16840576a12.27.1747810269939;
        Tue, 20 May 2025 23:51:09 -0700 (PDT)
Message-ID: <dada3a76-6ad7-4c3d-8662-fb2e87910425@suse.com>
Date: Wed, 21 May 2025 08:51:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/domain: rewrite emulation_flags_ok()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com,
 xen-devel@lists.xenproject.org, dmkhn@proton.me
References: <20250516022855.1146121-1-dmukhin@ford.com>
 <20250516022855.1146121-3-dmukhin@ford.com>
 <e13d061a-16ee-4b8d-8d4a-db1bba609bdf@suse.com> <aC0EYzZgzCfOovVL@kraken>
 <alpine.DEB.2.22.394.2505201554440.2019926@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2505201554440.2019926@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.05.2025 01:00, Stefano Stabellini wrote:
> On Tue, 20 May 2025, dmkhn@proton.me wrote:
>> On Tue, May 20, 2025 at 05:24:33PM +0200, Jan Beulich wrote:
>>> On 16.05.2025 04:29, dmkhn@proton.me wrote:
>>>> --- a/xen/arch/x86/include/asm/domain.h
>>>> +++ b/xen/arch/x86/include/asm/domain.h
>>>> @@ -494,6 +494,12 @@ struct arch_domain
>>>>                                   X86_EMU_PIT | X86_EMU_USE_PIRQ |       \
>>>>                                   X86_EMU_VPCI)
>>>>
>>>> +/* User-selectable features. */
>>>> +#define X86_EMU_OPTIONAL        (X86_EMU_USE_PIRQ)
>>>> +
>>>> +#define X86_EMU_BASELINE        (X86_EMU_ALL & ~(X86_EMU_VPCI | \
>>>> +                                                 X86_EMU_OPTIONAL))
>>>
>>> That is, VPCI is neither baseline nor optional. Certainly at least strange.
> 
> I think Denis tried to keep the code more similar to the original. This
> way it is easier to review the code change and it seems correct. But at
> the same time it is easier to spot inconsistency that were present even
> before the patch.

Right, and that was in response to me complaining on an earlier version
that the behavior was (silently) changed. Yet doing it like this wasn't
the only way to address my comment there. At the same time (or already
before) I raised the question whether having such constants is helpful /
necessary in the first place. And now that their names don't reflect
their purpose, this question becomes yet more relevant.

Jan

