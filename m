Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10130A88A9B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 20:01:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951110.1347249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4O7m-0007YD-5N; Mon, 14 Apr 2025 18:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951110.1347249; Mon, 14 Apr 2025 18:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4O7m-0007Vb-2g; Mon, 14 Apr 2025 18:01:38 +0000
Received: by outflank-mailman (input) for mailman id 951110;
 Mon, 14 Apr 2025 18:01:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KxE1=XA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4O7k-0007Rd-2i
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 18:01:36 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8121d13d-195a-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 20:01:35 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-399749152b4so2509767f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 11:01:35 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96cf1asm11820785f8f.39.2025.04.14.11.01.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 11:01:34 -0700 (PDT)
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
X-Inumbo-ID: 8121d13d-195a-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744653695; x=1745258495; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3ewjUxNJ4N4IJRWi354QXmEENDpMbqQXNCGsBxm5HXo=;
        b=FUdoNxbA8jt4KrdiwZ17jDLyAvu/Dv93SuNl7pP3hsUSUGAIgCdS5+tIXt3L2Nq8Hh
         0NdbH1zL2bYaZbVwmfgF7gqNkhiSPT5n71HO14Sek/R6jB0EwhBe3O1RVhtmQKjW86ES
         SSKqjYGfDAIiiqH15P/Svo7BnCpZL+SRN2fYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744653695; x=1745258495;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ewjUxNJ4N4IJRWi354QXmEENDpMbqQXNCGsBxm5HXo=;
        b=M1uv6akN9ZpFhj37baEqwRo+xHlztCQHHRQJ6iSay2W36PDaxraBSs+gHeq1MuN89A
         EpkMAkFf9a963kVKsxnVV73mcHWe1VFQ6M/yBPn7KGBFOtFBAlwyKvzXFBdUJDwW0fLj
         pigeriorQvH+bQujMxbcba55JrubFF2W4vrolxCYo9YAGZzaUJTiSvjgmAY5wg9vnUo7
         RhcNWTaFsyI7oyS2D9D2ZVtwule+iTiw19jwnA2YTH63B1cAgl2j12DgpFYYl5427YkK
         3wu+AwIAtal2Itt1r1o04wFiSMRREOXUVwx4tmKWOSnbReDKwP4QtsvaLVI7KpuGfVhd
         KjEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdf4T0D8vOnVno5q6+XrsoU5WM5Y0SSEp96aNKJFPJTOj0ebF5i1TfMuneRQnZCJyATIzNMW2cDbc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxUI3ObLpfn1pFRmjQxtvCrFk9/GgActaps5yCHbL15AOT6PIsY
	/lidM7rHU7/Cu24VS2m9JpQRu4Pl9vVX9+YLkmmEp5xL8ZMrs+toU4XueBKew3s=
X-Gm-Gg: ASbGncuJa4YP0ibMRI8ZerwjTNoy6rQxbCxQ6wNwqn2F6qpb9qsqkqTAsEPHNT7li3/
	igckfgb45vPTacYZ5qzbI+OXxSRMI8k/VwbdCZ3uEAuIHUAbkGJtN5zDbpsd11yV7TZ1IaM+CVK
	6zqP5P8jGailgV4YCKnLxJsn8try8FGuwdxC9C4107ndMDLQoEAwVNbPBs0Kew4RKLkCmy5W0LQ
	qaTKpbdowKqUQF6AbNtnyATsYWbWFXRN3rVkjayPemkhMwrOK8EexcAtnpBRDwleKu3gX+PGiP2
	G5LvHy65QHIvmaT17fxNsPXGcq2kLXUgevc5coPXnBq6U2bT+2Ry4RUq1kQ6OtbYN/fluWAiwEV
	HTVdPEg==
X-Google-Smtp-Source: AGHT+IEN+EpmQaN9MBqeLMogGYTS6d8DqvxHZukKX/x7iTqbUe739OnqzUawM8G3fw3PDX3dYmIlKw==
X-Received: by 2002:a5d:64aa:0:b0:39c:1257:febb with SMTP id ffacd0b85a97d-39eaaed6048mr11179717f8f.59.1744653694742;
        Mon, 14 Apr 2025 11:01:34 -0700 (PDT)
Message-ID: <cc480b65-c1b7-4384-8d18-8a0cd6e7cfea@citrix.com>
Date: Mon, 14 Apr 2025 19:01:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] CI: Include microcode for x86 hardware jobs
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Anthony PERARD <anthony@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
References: <20250414110903.2355303-1-andrew.cooper3@citrix.com>
 <20250414110903.2355303-7-andrew.cooper3@citrix.com> <Z_1JuudeZAXihzwb@l14>
 <e0bfbfa1-4130-420c-8db3-4ac520ac49de@citrix.com> <Z_1MLobG_FyndTg4@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z_1MLobG_FyndTg4@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/04/2025 6:55 pm, Marek Marczykowski-Górecki wrote:
> On Mon, Apr 14, 2025 at 06:47:07PM +0100, Andrew Cooper wrote:
>> On 14/04/2025 6:45 pm, Anthony PERARD wrote:
>>> On Mon, Apr 14, 2025 at 12:09:03PM +0100, Andrew Cooper wrote:
>>>> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
>>>> index 1b82b359d01f..ac5367874526 100644
>>>> --- a/automation/gitlab-ci/build.yaml
>>>> +++ b/automation/gitlab-ci/build.yaml
>>>> @@ -306,6 +306,7 @@ alpine-3.18-gcc-debug:
>>>>        CONFIG_ARGO=y
>>>>        CONFIG_UBSAN=y
>>>>        CONFIG_UBSAN_FATAL=y
>>>> +      CONFIG_UCODE_SCAN_DEFAULT=y
>>> Is there a change
>> DYM "chance" ?
>>
>>>  that this patch series gets backported? Because that
>>> new Kconfig option won't exist.
>> Yes, I do intend to backport this whole series in due course, and yes,
>> I'm aware.
> A more backport-friendly way would be add ucode=scan to xen cmdline.

Yeah, but they're too long already IMO.

Needing to override defaults to make our CI system useful is a good hint
that the defaults are wrong.

Same for console_timestamps, which isn't even deployed consistently
across the testing.

~Andrew

