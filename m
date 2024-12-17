Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 158EC9F515B
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 17:46:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859558.1271680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaiH-0001cV-Tg; Tue, 17 Dec 2024 16:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859558.1271680; Tue, 17 Dec 2024 16:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaiH-0001Zu-Qu; Tue, 17 Dec 2024 16:46:25 +0000
Received: by outflank-mailman (input) for mailman id 859558;
 Tue, 17 Dec 2024 16:46:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=92kI=TK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tNaiG-0001Zi-BF
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 16:46:24 +0000
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [2a00:1450:4864:20::341])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 726b196e-bc96-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 17:46:22 +0100 (CET)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-4363dc916ceso16089895e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 08:46:22 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4363602c92csm122901245e9.15.2024.12.17.08.46.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 08:46:21 -0800 (PST)
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
X-Inumbo-ID: 726b196e-bc96-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734453982; x=1735058782; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IdGPcvFgwsVVkPk+FMas0OvqCO7S5xEsiFc1mcUlaNI=;
        b=v/PaD/4y/Soj8xBv3MfigHwTnMWBKRfgDE6TCBBFYK7//KRlGujZc4Td7a75+Pivy3
         GOYcbaKxjMpgYzn16iJcTPDNgmUPGnrT2NHmdAYXvLHzlPYdo5cDd0plWvC/l3/acBI7
         MXoLvdcGt7tlihTHGNVF2KSlThSH65Za+0Lfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734453982; x=1735058782;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdGPcvFgwsVVkPk+FMas0OvqCO7S5xEsiFc1mcUlaNI=;
        b=PMKCmmkLtkmmVEz8GDc1Ahcy4did9PkO279kg2GDTzF3KZ7Y0hb7mLBxeoa+G+vf20
         KsHBa7pGI1HTrp8MozfPARsKcFMx0XKUiPFDKas8BJiEJoUIlz/pGI1gNyVV8XkDPtFy
         JIUHHxKFL3AwRBSHICWDLDwuGRlK6YjeRbpdnOyU120VuPiPBocBqAZuadZli2dnRv9x
         hMZ7F783yBBh6e3UdUpRBvV9NHI5/4QKbUlmW/cC0W/iBm4s+FrSsBbsLn12q+8Sm97J
         TAI+jr7/vS37/CqHmPb0ovdFGwgYP/iIR/SgNNebPXZuSwslbPoQWA7Ix/2RIk7OWKE+
         QL6g==
X-Forwarded-Encrypted: i=1; AJvYcCVOmEzVLTLEty8/opHwsqBXy6KfJDvNyjX2SmH0ap/Y6Nm5c+GBo3u/f2TPQkdyj6w0jNxNZjFYZvQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwfVB59CAuo63DkC9AOH0MRkm/uwjCIGOkpAA6Uy6tcbQtyw0aK
	G4PrqcqwxS8VcFL/vOipAq1MM1s6jZ6UuykLGly3Ox8f5YV2WTZm4dp0tnubk8w=
X-Gm-Gg: ASbGncuojOHpY9xgIFV4QPjT7m91R0RujVdTAoM05HkPmU5wvbtT561gVksZF86mB5E
	NqIXcUYfiBkNSCBFxFS0Gtx6KRGxQJLg8+EU7Kj+qOpPjOyN/y0hHRlmzZdE1Ddmp+KlCM5YzzI
	8Mt8sHMyarLwM33C/QWeZ2qqOTRFL1D4ZkIt3+fJdNa2Kzupyuqf4jB92ZAyi+IlpmTpGwDpDYz
	e/1Sek8flcE5rSfaKJTRxAHi/FkYoGMNwmVRVICiUng19oMd6Scir49s1+LYl9yRDGT9C22CbPL
	HT0l7M+4xanXEp+zcCmB
X-Google-Smtp-Source: AGHT+IGs0Dy670I+5I6M10PJSD4gvrDLEuGlkuCI1+1BGUEsgLsPUJmySRboAVwwAVp/x2hDtwd0qA==
X-Received: by 2002:a05:600c:1583:b0:434:e892:1033 with SMTP id 5b1f17b1804b1-4364812a08cmr35311475e9.2.1734453981871;
        Tue, 17 Dec 2024 08:46:21 -0800 (PST)
Message-ID: <8d59f2a1-8fc2-44d0-8c87-fbdf5bcc4d77@citrix.com>
Date: Tue, 17 Dec 2024 16:46:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] eclair-analysis: Add usage of varargs extension for
 C99
To: Jan Beulich <jbeulich@suse.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
References: <bb0e1f3d0d4067b597c7cdae5ed9fc3e059d17ae.1734452569.git.nicola.vetrini@bugseng.com>
 <e85cb340-828a-4966-b5ca-09fca04e23ec@citrix.com>
 <d18e6d0e-c3f5-4fec-849c-94a7edb8ae36@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d18e6d0e-c3f5-4fec-849c-94a7edb8ae36@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/12/2024 4:45 pm, Jan Beulich wrote:
> On 17.12.2024 17:40, Andrew Cooper wrote:
>> On 17/12/2024 4:24 pm, Nicola Vetrini wrote:
>>> This extension name is missing from the current list of extension used
>>> by Xen, therefore is must be added to that configuration in order to
>>> avoid violations for MISRA C Rule 1.1.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> Given CI is broken, I've put this in for testing:
>>
>> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1592826906
> If this was fixing an earlier commit, shouldn't it come with a Fixes: tag
> anyway?

Yeah, it probably should have a Fixes, even if it is technically a
combined one with also changing the runner.

~Andrew

