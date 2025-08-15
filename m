Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 720FAB27AF3
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 10:28:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082962.1442640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umpnZ-0003qR-PD; Fri, 15 Aug 2025 08:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082962.1442640; Fri, 15 Aug 2025 08:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umpnZ-0003ou-MK; Fri, 15 Aug 2025 08:28:29 +0000
Received: by outflank-mailman (input) for mailman id 1082962;
 Fri, 15 Aug 2025 08:28:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFbR=23=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umpnY-0003oo-95
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 08:28:28 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1032b6a-79b1-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 10:28:27 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45a1b05fe23so9468945e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 01:28:27 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1cda0021sm47814355e9.13.2025.08.15.01.28.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 01:28:26 -0700 (PDT)
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
X-Inumbo-ID: d1032b6a-79b1-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755246507; x=1755851307; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MqJ92Se36d2J1W6EeVLUW+3FLWK0HcX3Of0xKvlV+zU=;
        b=BBd8Vg1w4p1ZyQ6hz9n8zo/PsAtJ9r8h8X0RB7Rz6II6WqP+AseJfQP1ZV3sMNrUJl
         NG0OXdTS1sE/YI0b99ken2F3NSK7zvRe8ErYEzH8Nu31xbyl08nrqrHZukQXeYYYIGjg
         ipvCJFIR8EtvFg/d22dSCQcv1TAOzrB/Nwwn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755246507; x=1755851307;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqJ92Se36d2J1W6EeVLUW+3FLWK0HcX3Of0xKvlV+zU=;
        b=t6+Q1YsJhj1rHsq0CsC4VyJ3W0EYjPyyLxfjDWl48v+f0L8wvBdagd6qg8Hi3y4F/Q
         w1uMDRKpwNfTz+LFiel6na/Fb4E4yyYUPhSLcZZ8cieqfYYP90Qcb8TqDtu9poIiHnlo
         dQnyCfNdaVN71AelchB1YKhlJa7lWdcQPMueg5imcwalw0zsvTqPG05M7yRgnEtvx1wJ
         mP5mQO6cfOJREc2E5x+OaPwqjvdcGmnwbTQneEf46pbAyJZdFbq+qVqgqOSMgheCISw1
         jgvcpbtK7/DYzfzhCALbtuIvdkgWoJGgcUuk5hljZZO690YTyBhaq+JNdnENcP4Q6mqx
         g9kw==
X-Forwarded-Encrypted: i=1; AJvYcCXZvX85d6VR8tJIRRz7XchBGGhoC/n4m2/YeBQLou3xwzO+rOQWe93m4t4cce9xTobmp+cSMH4LH9o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNhc92gEzbpSVdwNgz5szOhwSPilWBsH+9QLOb79BoLBoMfFp/
	D3vmsdgCALvxnMsTTboYRV7dRgr8csNOmifkcgkWyN8x//4/yqrFPuupkUQETg0kSvg=
X-Gm-Gg: ASbGnctZZr7CyHXG8KHpKXPqcYAujNQFzyTQqw4RcXiAEkHYWGz4q2aMGTSY8sCLzKP
	vzGX8T1uc91xS6wCrv8umavUFjUm9eTaV6XM5MJatCkCBtlPAjK/3HNuW9aChTBAlxn0zYJFm6o
	kEBw+W8eiKBQ5uoM3XFI6ecU2w8it8yuyfpLDAcDGutaGZJjRzrmuqQ6EyaATu0LqW3BI/v6BG1
	TSk6f8QAazIbe/nG7ctvCYJiTNp1mjMYmRUukHO9KJjanNSsdzF9P57kSNcN7tjq9ZcI6QyXimV
	GNK7caSNs28g/TZGLQwH35kl/yqT4V22ppWnljJ6ldsd5vlrz/r0FUi0BiwursRfWOuVwckQ2H+
	YndKMi0dXTPMdF4MTem/zITydMsiMlqvbP+xc44jsQOTat2H8aAaB0DlO/nu2DZ01VsPO
X-Google-Smtp-Source: AGHT+IHPuMZYxjC/HdTcb66xNNpob0t8AiqzTTbqVpsL8iCJwZibAM378k6sNxiFtXl7WXikg2ckMA==
X-Received: by 2002:a05:600c:3b84:b0:458:7005:2ac3 with SMTP id 5b1f17b1804b1-45a230f5c66mr6648925e9.21.1755246506753;
        Fri, 15 Aug 2025 01:28:26 -0700 (PDT)
Message-ID: <a2f8167b-cfcc-4729-892b-d2994aa77f84@citrix.com>
Date: Fri, 15 Aug 2025 09:28:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/22] x86/traps: Move load_system_tables() into
 traps-setup.c
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-10-andrew.cooper3@citrix.com>
 <a4a88d7a-8c1f-4170-a1fe-afafcad0c8ea@suse.com>
 <9e955bff-c145-4a52-af4f-a7055fc9aa67@citrix.com>
 <8e0b4a82-3189-4446-96a8-921d8ae44a21@suse.com>
 <5def44a3-4139-4870-94f2-cb895078f968@citrix.com>
 <0e9878a9-fb0d-4d18-ab15-eb248629b192@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0e9878a9-fb0d-4d18-ab15-eb248629b192@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/08/2025 9:22 am, Jan Beulich wrote:
> On 14.08.2025 20:09, Andrew Cooper wrote:
>> On 14/08/2025 9:55 am, Jan Beulich wrote:
>>> On 13.08.2025 13:25, Andrew Cooper wrote:
>>>> On 12/08/2025 10:19 am, Jan Beulich wrote:
>>>>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>>>>> Since commit a35816b5cae8 ("x86/traps: Introduce early_traps_init() and
>>>>>> simplify setup"), load_system_tables() is called later on the BSP, so the
>>>>>> SYS_STATE_early_boot check can be dropped from the safety BUG_ON().
>>>>>>
>>>>>> Move the BUILD_BUG_ON() into build_assertions(),
>>>>> I'm not quite convinced of this move - having the related BUILD_BUG_ON()
>>>>> and BUG_ON() next to each other would seem better to me.
>>>> I don't see a specific reason for them to be together, and the comment
>>>> explains what's going on.
>>>>
>>>> With FRED, we want a related BUILD_BUG_ON(), but there's no equivalent
>>>> BUG_ON() because MSR_RSP_SL0 will #GP on being misaligned.
>>> That BUILD_BUG_ON() could then sit next to the MSR write? Unless of course
>>> that ends up sitting in an assembly source.
>> It's the bottom hunk in patch 14, which you've looked at now.
>>
>> Personally, I think both BUILD_BUG_ON()'s should be together, because
>> they are related.
> I don't really agree, but I also won't insist on my preference to be followed.
> IOW please keep as is.

Thankyou.  Can I consider this to be A-by then?  (This, and the rename
to percpu_early_traps_init() are the only two remaining items in the
entire first half of the series.)

~Andrew


