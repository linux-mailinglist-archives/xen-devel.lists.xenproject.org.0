Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9A48D7159
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jun 2024 19:23:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734283.1140471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDSRZ-0005r0-Ha; Sat, 01 Jun 2024 17:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734283.1140471; Sat, 01 Jun 2024 17:23:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDSRZ-0005oU-DT; Sat, 01 Jun 2024 17:23:01 +0000
Received: by outflank-mailman (input) for mailman id 734283;
 Sat, 01 Jun 2024 17:23:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OKEA=ND=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sDSRY-0005oO-Gg
 for xen-devel@lists.xenproject.org; Sat, 01 Jun 2024 17:23:00 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9714b85b-203b-11ef-b4bb-af5377834399;
 Sat, 01 Jun 2024 19:22:58 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so17158225e9.1
 for <xen-devel@lists.xenproject.org>; Sat, 01 Jun 2024 10:22:58 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4213860126fsm11921705e9.40.2024.06.01.10.22.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Jun 2024 10:22:57 -0700 (PDT)
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
X-Inumbo-ID: 9714b85b-203b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717262578; x=1717867378; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FDGrYeLcgdKuAo3gBXrytu7NThrt2CtnDzy2HWVr+co=;
        b=h7dT8M3IpXS8vRyG5to139reCSTau+gc0KYSoabmS/iu0H4P/iwuqYl2DlbXD0hVKb
         9zu5qLSPcwqneKijVSD5L3TO15dWqxS9WtbGtTzc1Xp8iNWmj3+i3RlG9nxfi60HWlcr
         O2AVFDWUyc64HVA7/GPeQeRr9lfMK1RdI4C64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717262578; x=1717867378;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDGrYeLcgdKuAo3gBXrytu7NThrt2CtnDzy2HWVr+co=;
        b=WFx7Q0crllnCUNeT+nW6EBM1NSrBQQkIJfEyISRaYFlXdbtO18O+8+Y02lpUW0dUFS
         o6zNt990l1rWBqfMb1eUBZSb+3tRvyzgjlHrpVoWfEXNUFCt9fwWdVvpkfjeKEfRxR8/
         ymRFbJnXIIeYiEvOJvzXq0ihzxcS+qVbbk7H8utY9vglPavbg2W+vB+MPjAmW79XdrXu
         fY6hCj7e7b7CcYDiTh4QCOh/jumo/vHLvid+VxpYrXCrSdKGmH2RJXagrH1+DsocBqb4
         l+f33AAkpfTtZpAtgzVbsNqNQ0RVgZuf1fv55kvkXoxWsgVDAr1R10TnTuEF9qGF8rj1
         MGeA==
X-Gm-Message-State: AOJu0YyRM1wTedCQRC7FWnJRurKhd0/r6UtIkfddxO+b7wKDKYvHjpPX
	/TcgTj+LtuvuF7q+CrQ2S6vT6dPEbkG7iozzdvEOjCnWuV+cDJQ+OyaOCWehVNc=
X-Google-Smtp-Source: AGHT+IHQ2DBhH0YpG8WfT/1QfBnC/7xVwSck+BbvxXoPTpWgFcWmVZzFDhN3EKi04t7oZkALzKHG0w==
X-Received: by 2002:a05:600c:19d4:b0:41a:4623:7ee9 with SMTP id 5b1f17b1804b1-421280f023bmr77038375e9.10.1717262577680;
        Sat, 01 Jun 2024 10:22:57 -0700 (PDT)
Message-ID: <1665f895-48c2-494b-891e-d50b8d78b49c@citrix.com>
Date: Sat, 1 Jun 2024 18:22:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 0/5] address violations of MISRA C rules
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1717236930.git.nicola.vetrini@bugseng.com>
 <b4267610-464b-479a-b886-12489c5e5a9b@citrix.com>
 <fa17cb21b7bba2dabf49bba5138c1cf2@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <fa17cb21b7bba2dabf49bba5138c1cf2@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/06/2024 6:19 pm, Nicola Vetrini wrote:
> On 2024-06-01 16:37, Andrew Cooper wrote:
>> On 01/06/2024 11:16 am, Nicola Vetrini wrote:
>>> Patches 1 to 4 address violations of MISRA C Rule 20.12 by deviating
>>> certain
>>> uses of some macros, while the last patch addresses some regressions
>>> introduced
>>> by the latest bitops series
>>>
>>> Nicola Vetrini (5):
>>>   xen/domain: deviate violation of MISRA C Rule 20.12
>>>   x86/domain: deviate violation of MISRA C Rule 20.12
>>>   x86: deviate violation of MISRA C Rule 20.12
>>>   automation/eclair_analysis: address remaining violations of MISRA C
>>>     Rule 20.12
>>>   xen: fix MISRA regressions on rule 20.9 and 20.12
>>
>> I've committed patch 5 because it fixes a blocking failure in Gitlab CI
>> from content already accepted for Xen 4.19.
>>
>
> Thanks
>
>> The others look fine to me, but you'll need to negotiate with Oleksii
>> (CC'd) to get them in, at this point in the release.
>>
>
> Well, having one more clean rule does look better for Xen, and the
> changes to the codebase are harmless enough, but ultimately given the
> closeness with the deadline I didn't really see a need to.
>
>> Given that this series makes x86 clean to Rule 20.12, shouldn't there be
>> a final patch making it blocking, to bring x86 in line with ARM?
>>
>
> Good point, I should have done that in patch 4. I'll do a follow-up
> patch.

FWIW, given how simple this series is, I'm +1 for including it in 4.19,
even at this point.  It is definitely nicer to have the disposition of
Rule 20.12 the same between ARM and x86.

Still - it's very much Oleksii's call.

~Andrew

