Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C68A9CACA
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 15:48:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968121.1357819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8JPj-00021r-MJ; Fri, 25 Apr 2025 13:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968121.1357819; Fri, 25 Apr 2025 13:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8JPj-0001zw-JC; Fri, 25 Apr 2025 13:48:23 +0000
Received: by outflank-mailman (input) for mailman id 968121;
 Fri, 25 Apr 2025 13:48:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6c45=XL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u8JPi-0001zq-Fb
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 13:48:22 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f33021c2-21db-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 15:48:21 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3912d2c89ecso1853013f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 06:48:21 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e5e198sm2458113f8f.97.2025.04.25.06.48.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 06:48:20 -0700 (PDT)
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
X-Inumbo-ID: f33021c2-21db-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745588900; x=1746193700; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2Aj0qQhdDdSu+7vuox4DRSnuw2xxvVia3cAtIMoOdDo=;
        b=VdZS8jafonVDtyeXYuBjHML1ywrC+mIrjznuikb9XL5pUcZY2l8OVaitWFmgGz9Ugp
         N0+4HSYMV8WtdAIeu/VZ4mWk1Woe3p/10JFNgzkqCvN3DzJYC4lCN++riKbc+95KC/dV
         hZcB81fh/3DKibKtsUtUAVIG/Eu4o+fOHRppM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745588900; x=1746193700;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Aj0qQhdDdSu+7vuox4DRSnuw2xxvVia3cAtIMoOdDo=;
        b=gh2bX+e/z35kQkPUmMrEfnZvW5IR0UkaTe93ptG4COPQl/4pPZ3oG/lsdbnNPVwtFL
         vC8O4g0MdD4e0AkfbVsGFaBuPZnOhJZbgVZmLfQmA/piuoT4Eq+6IXVmBtbev+z1vjoo
         mYeBvw25GtNWqH4MxfNuMIQI9TcTl+YXQ78JLtlB5k+StuZPMM1ndCTsRi8Ax273VWcY
         l23n0S226C8pZMpMIl9wGAhTcUWDT9SIbw6sJ+kPzSJsC7WtziWBRAr7YC2Lf95T5NEn
         68LgHGJwBEgIizSqGJW1LwlZ43Tvg7AsqmOgkK9v/DNf91y2Nhi82m/PMzzbdst2T7V5
         udwg==
X-Forwarded-Encrypted: i=1; AJvYcCUem+m7lQJbvIWP9cyzB60IX4Qmt8/pDEdoTtLZRYlMuqlhDAdsTSH7BiZV809SReznWgau/depClA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdZjZIIlNdN0b7nR/W+5gHIeViowaPcwVsVGgDdXUpPdu1mxDw
	f/m/qt+adLVjcXUNElCA8DHWMP8f0CsXdZH7EowjF5S+mJIq3u4qktbn0ppqO5A=
X-Gm-Gg: ASbGncvqZet+p7m+BtriyOqvsz+fevkUZL9Uln4NVCwhXVJhajV3ghkijuQalk0Ydn2
	uYDzOn7v+BSIzgzLZGdONbKj3mqqpuaKQwQTwfMk1eMwJAHn87ytDT134X7tgcSsQrZlM5aGl4n
	REGjOHJtt1dX3AM0RDksxYUQ4Cz3fPNiqUZhcG4kRx3pbAKvyFcvAFGxDTqFbHVt6iGL3FC96W+
	V9QaARxcAAZXkhesIyTVMr/AL7b5sxMorDPqUkd3gn+le4Ey8RKgDh0M2HFfml7WYxNtH52jXAE
	daLvlsXu5F4RNcGYFZ1B/p9tJ2dksogZc50hYl+z778VpHLHZrvW5Ms/5Lt2eHTJhcFtu7WkrP0
	rpb5k5g==
X-Google-Smtp-Source: AGHT+IGrK5pVHH14e84YVu7zDTH60AnjDHi6FGIsMHUWf6vrOQPakGfNZW15P6pJtxprUCfq6aBM4A==
X-Received: by 2002:a5d:6d82:0:b0:391:4559:876a with SMTP id ffacd0b85a97d-3a074f2ecbemr2032759f8f.46.1745588900535;
        Fri, 25 Apr 2025 06:48:20 -0700 (PDT)
Message-ID: <25666272-71b9-4ec6-8a77-a3b419132d83@citrix.com>
Date: Fri, 25 Apr 2025 14:48:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/mm: Introduce mm-types.h
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250425112415.245585-1-andrew.cooper3@citrix.com>
 <20250425112415.245585-2-andrew.cooper3@citrix.com>
 <e5c6b448-945c-4c93-a3d6-e6e598102c2b@suse.com>
 <74bf3a58-6c90-4123-80e3-b72ba67ea46d@citrix.com>
 <654dd5d3-b235-4f5b-9ad6-b3f1281434d2@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <654dd5d3-b235-4f5b-9ad6-b3f1281434d2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/04/2025 2:13 pm, Jan Beulich wrote:
> On 25.04.2025 15:05, Andrew Cooper wrote:
>> On 25/04/2025 1:48 pm, Jan Beulich wrote:
>>> On 25.04.2025 13:24, Andrew Cooper wrote:
>>>> The type used for pagetable attributes/permissions is currently unsigned int,
>>>> but needs to become architecture dependent as PPC needs unsigned long.
>>>>
>>>> Introduce mm-types.h to house pte_attr_t.
>>>>
>>>> Given the new toolchain baseline, we can use __has_include() now to remove the
>>>> need for boilerplate on most architectures.
>>> That's true now, when it's just pte_attr_t that's there. Memory management,
>>> however, is pretty different between architectures, so I wonder if in the
>>> longer run any one will remain that actually can use the common header.
>> Anything in xen/mm.h is common and needs architectures to provide (or
>> use the defaults) the bits required.
>>
>> asm/mm{,-types.h} still exist (when necessary) to provide the
>> arch-specific extensions.
> Sure, but you kind of avoid my question: Are you reasonably certain more than
> one arch will still be able to use the defaults, once a few more things appear
> in this header? (IOW: Won't we be better off having each arch have its
> asm/mm-types.h right away?)

I can't predict the future, but my gut feeling is that it's not going to
diverge very much.

If needs be, we can go to conditional override for specific bits.  Or,
if I'm wrong, I'm wrong.  It's not hard to change.

~Andrew

