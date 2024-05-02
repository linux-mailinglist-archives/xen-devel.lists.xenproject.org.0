Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA7A8B9A94
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 14:15:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715784.1117684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2VKj-0008Nk-SC; Thu, 02 May 2024 12:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715784.1117684; Thu, 02 May 2024 12:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2VKj-0008La-PR; Thu, 02 May 2024 12:14:41 +0000
Received: by outflank-mailman (input) for mailman id 715784;
 Thu, 02 May 2024 12:14:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/qc=MF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s2VKi-0008LU-7H
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 12:14:40 +0000
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [2607:f8b0:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bdaf03c-087d-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 14:14:39 +0200 (CEST)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3c6f785208dso1491999b6e.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 05:14:39 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ew9-20020a05622a514900b0043a7f359414sm419310qtb.19.2024.05.02.05.14.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 05:14:37 -0700 (PDT)
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
X-Inumbo-ID: 8bdaf03c-087d-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714652077; x=1715256877; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P6UgqazcQrB/QSFU5qYZhBirP/WJ5vy9WnvmGqckGTA=;
        b=PaSfcmMSIbfF6mo85yWHQIs1kvj1xtPNZBpcwUYh47gw6oaAX9FSMtkDPT327q6sBm
         AV6saTQR0uCD0bs0+9630d7gG001yH6/JtLZs1Et3WkkHitS2C/F3j+8Das8nVfjZlIy
         RGs3RLVMBnzhsot8glnQqWL9zroN4ry0EDEhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714652077; x=1715256877;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6UgqazcQrB/QSFU5qYZhBirP/WJ5vy9WnvmGqckGTA=;
        b=GtUSTZeqZqoc8FQl64gfc0FMQRco/o9APb2lOcgfHqEp2IIIDCcz+lTNeRRBdTxpof
         ny+zzK3XnWWWoCfQ1Q/h88ljhozVvRw9GyuokDlqpFS7s8myBmXjjjcyDalssifTedhd
         MBfqtmp00aWL3RZxYsbkv2BDRPEuLyIA6uz7RAYZao5G3/ttvBQF9KuuX6t/fw2b8Nr6
         /kVC09M6O9b6T/Fqfm+cvP/SbyV0ksATqAX4KmKh9JuZvA9zriPHFOFtUMBm3LezS3OQ
         WObZUX9d4uW14DGrGvH8eOHI8AD2DNqJ6L+YWuQkC5QLv7E8WM2IADaM9th8BPEAE4Cr
         +wmg==
X-Forwarded-Encrypted: i=1; AJvYcCVtB/MY5d7DDRWjeeyk2e6URMCetk7EwXbXyCoNFSuqUGEaSi0qC1dZv7n8j1P7PRytiT6C6q7bbgv9Qx3Pom3uB6v/UR64BcnAz5cAW88=
X-Gm-Message-State: AOJu0YzvaQfHvilBc0zEDcQ3L1fmIlRPgKqo255f8AQPOh1v7HpQPhU6
	54D3WxbKigtB1H+NyYn8gx4KF3NTB9XeFIOmEY28x8ll/8CKVW0eO+vqTVujCfo=
X-Google-Smtp-Source: AGHT+IFyGsBkiapu+KmVh9ucflrVZkDv11+1yyhhhZmBtAZhIkrdgxHcuOiJxc75+m7dCZq2rRqVRw==
X-Received: by 2002:a05:6808:f04:b0:3c7:2f77:a102 with SMTP id m4-20020a0568080f0400b003c72f77a102mr7595012oiw.26.1714652077676;
        Thu, 02 May 2024 05:14:37 -0700 (PDT)
Message-ID: <ee407b03-a1aa-4fa0-a700-71278f643489@citrix.com>
Date: Thu, 2 May 2024 13:14:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] tools/xen-cpuid: switch to use cpu-policy
 defined names
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240430082901.77662-1-roger.pau@citrix.com>
 <78d009f4-6610-4fcf-9cdc-ee1081e6c763@suse.com> <ZjDVN6kexFD0vcT2@macbook>
 <f1e594f7-2bf2-4898-824f-abd407690644@suse.com> <ZjDqHfdjUE1CTk1W@macbook>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZjDqHfdjUE1CTk1W@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/04/2024 1:54 pm, Roger Pau Monné wrote:
> On Tue, Apr 30, 2024 at 02:06:38PM +0200, Jan Beulich wrote:
>> On 30.04.2024 13:25, Roger Pau Monné wrote:
>>> On Tue, Apr 30, 2024 at 12:37:44PM +0200, Jan Beulich wrote:
>>>> On 30.04.2024 10:29, Roger Pau Monne wrote:
>>>>> @@ -301,21 +52,32 @@ static const char *const fs_names[] = {
>>>>>      [XEN_SYSCTL_cpu_featureset_hvm_max] = "HVM Max",
>>>>>  };
>>>>>  
>>>>> -static void dump_leaf(uint32_t leaf, const char *const *strs)
>>>>> +static const char *find_name(unsigned int index)
>>>>>  {
>>>>> -    unsigned i;
>>>>> +    static const struct feature_name {
>>>>> +        const char *name;
>>>>> +        unsigned int bit;
>>>>> +    } feature_names[] = INIT_FEATURE_NAMES;
>>>>> +    unsigned int i;
>>>>>  
>>>>> -    if ( !strs )
>>>>> -    {
>>>>> -        printf(" ???");
>>>>> -        return;
>>>>> -    }
>>>>> +    for ( i = 0; i < ARRAY_SIZE(feature_names); i++ )
>>>>> +        if ( feature_names[i].bit == index )
>>>>> +            return feature_names[i].name;
>>>> ... a linear search, repeated perhaps hundreds of times, looks still a
>>>> little odd to me.
>>> I didn't benchmark what kind of performance impact this change would
>>> have on the tool, but I didn't think it was that relevant, as this is
>>> a diagnostic/debug tool, and hence performance (unless it took seconds
>>> to execute) shouldn't be that important.
>> As indicated, performance itself isn't much of a concern here. My earlier
>> question wants reading in relation to the other question raised, regarding
>> the script maybe wanting to produce macro(s) more suitable for the purpose
>> here.
> Hm, we could maybe produce an array of strings, one per feature bit
> (features without names would get NULL).
>
> I will see, albeit my python skills are very limited.

See how Xen's cmdline parsing uses feature_names; they're intentionally
sorted already.

But, having gen-cpuid.py write out something that's closer to what
xen-cpuid.c wants is also very easy to do.

~Andrew

