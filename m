Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 309E49861CD
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:02:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804078.1214970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTWY-0002X9-NU; Wed, 25 Sep 2024 15:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804078.1214970; Wed, 25 Sep 2024 15:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTWY-0002Ua-KI; Wed, 25 Sep 2024 15:01:50 +0000
Received: by outflank-mailman (input) for mailman id 804078;
 Wed, 25 Sep 2024 15:01:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lFoA=QX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1stTWX-0002UM-R6
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:01:49 +0000
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [2a00:1450:4864:20::542])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16b192f1-7b4f-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 17:01:48 +0200 (CEST)
Received: by mail-ed1-x542.google.com with SMTP id
 4fb4d7f45d1cf-5c26311c6f0so9175146a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:01:48 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4d7461sm1949256a12.79.2024.09.25.08.01.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 08:01:47 -0700 (PDT)
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
X-Inumbo-ID: 16b192f1-7b4f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727276508; x=1727881308; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1MCZb60QhK/Rr+sCxhHKJ7u+GPMudZGwn+ivkscnWPw=;
        b=SWXaEmR+OGgBaxoG1qwkrvJl4fFzROfJhiGNOU+L0fp4HB6gnpQbrd9rjFTvFPUeAM
         eFW0TmZb1bYO4uzpPDMSbuaUgDISCACYFd7IVA+8BtlLtcO5EhWEd5RXvD47GD3yQj3Y
         2UaqoI2F7EvOwh6F0Of6ijFii52jZPv+I1Qm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276508; x=1727881308;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MCZb60QhK/Rr+sCxhHKJ7u+GPMudZGwn+ivkscnWPw=;
        b=KcqsfB2M3zGrIq/j0PmG4yTYDrpX06kK7NjGylHFKdYYIMfUC5cfnuzHbsjYsxClTL
         Y5zCSLLncRojqiNH+L54FWVQbGPZ4YAUrfWGaQQst7eQI1JJ8c/HxfKaVjoEDEcFpUPt
         ++gv09gD+hLrDYFYvfvnKuF+PWAB+YoGG9koJ5LbzC6DovX0Uq0yjn/lUUD3qf1GaQwt
         W2UhxQYssNRJHbnmeLdQf4MUKA+k5ISyciEVy31XXmUxLkzPFxc1cx64HTwRFz8OcbIC
         64v4fDUYLbuOVDcKH8xGVLEqF6jvdpoVH9lHbzW90dGVr+iV0WqVtmuCrNMdlBeQdTAO
         OLCA==
X-Gm-Message-State: AOJu0YwMPfkrgj/HsCWCkkz9qdEGV1CfjYvJRbGrrMgBFzXohEJDK4kR
	czDu0T4x5ZyHgHOSDFmQr7OWBcKSnHQMFZS+GiTQ0Jqb6v1SEC0lDQ4IC5l6Pp0=
X-Google-Smtp-Source: AGHT+IH6e2hAR8UAU/Zmzj0oIrwegdg8j0gCyKXMv0i6FJtBKMZHwtHxFOpniYTrF1vPqHmQqYgW9w==
X-Received: by 2002:a05:6402:40c5:b0:5c5:b67e:6bcf with SMTP id 4fb4d7f45d1cf-5c72061b570mr2728086a12.8.1727276507630;
        Wed, 25 Sep 2024 08:01:47 -0700 (PDT)
Message-ID: <8130a934-95c7-48e4-8f0e-d92f61625d29@citrix.com>
Date: Wed, 25 Sep 2024 16:01:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] changelog: add note about blkif protocol fixes
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>
References: <20240912132347.28756-1-roger.pau@citrix.com>
 <0246f345-76db-4633-bb8d-4c6bc735fe61@citrix.com>
 <ZvQRo5upeHjxKTbu@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZvQRo5upeHjxKTbu@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/09/2024 2:35 pm, Roger Pau Monné wrote:
> On Wed, Sep 25, 2024 at 12:18:59PM +0100, Andrew Cooper wrote:
>> On 12/09/2024 2:23 pm, Roger Pau Monne wrote:
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>>  CHANGELOG.md | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>> index 26e7d8dd2ac4..8864ea7eafad 100644
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -9,6 +9,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>  ### Changed
>>>   - On x86:
>>>     - Prefer ACPI reboot over UEFI ResetSystem() run time service call.
>>> + - Fixed blkif protocol specification for sector sizes different than 512b.
>> It's minor, but blkif is common, so should go ahead of the "On x86"
>> subsection.
> Oh, it's in common (indentation wise) it's just after the x86 section.
> For other release notes we have the x86/ARM/... sections first, and
> afterwards the common changes.
>
> I don't mind putting the common changes first and the arch-specific
> ones later, but it should likely be documented somewhere.

I'm just preempting the formatting round I typically do each release.

~Andrew

