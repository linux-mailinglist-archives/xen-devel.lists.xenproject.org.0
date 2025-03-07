Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 576D6A56DA6
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 17:26:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905185.1313033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqaWw-0002Cd-TQ; Fri, 07 Mar 2025 16:26:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905185.1313033; Fri, 07 Mar 2025 16:26:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqaWw-0002B3-Q9; Fri, 07 Mar 2025 16:26:34 +0000
Received: by outflank-mailman (input) for mailman id 905185;
 Fri, 07 Mar 2025 16:26:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxnO=V2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tqaWv-0002Ax-5e
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 16:26:33 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb4576f0-fb70-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 17:26:27 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so13008045e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Mar 2025 08:26:27 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd93cc2esm55314085e9.30.2025.03.07.08.26.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 08:26:26 -0800 (PST)
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
X-Inumbo-ID: eb4576f0-fb70-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741364787; x=1741969587; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2+eLkAS5fc0YTW2wyqSjdY5F/l/loYkj8j5GqQ53A4U=;
        b=ZWM8Sb1PQnTBe4ToL9wSTJQl8zr+9Ev12/GxSxSQD5iB0VzIuHbVhXmP5ajH1ZPvuc
         cyI5i+aq5SKYVfP75XtpGST5uZlgvxmcYtZy2vWMntYhk1zfsyMNT5ZxpbClm5vVHbed
         dTT2jKbnRw0AVshprSymTJjPYrPxODdDUOVxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364787; x=1741969587;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+eLkAS5fc0YTW2wyqSjdY5F/l/loYkj8j5GqQ53A4U=;
        b=h5SJ2PzdA62qoCW5O+JTZnFsU+6jtcL68Ac0lTVieVtTxdJEwOsQy0XadTGYVYtRys
         kDWVQKF6iyTnYMNtcIOwSKI7Sqw6yvI0Ny4eYNbFm6vHjumtetefc0tGE6YyZMZr9jyY
         zilFVklBYymsAgzBlGoFiAxdrPQWcfwfoMIJATPeI41UC12brCGQA5hfME0Cqd1Ekkd+
         VthTxCiyAuRW8/Y24TMfuSQjlxV29pugTqVy+S+Omehgqzo0BymVoqq3G/QynHbP4Eo7
         OO1SL25k/hLy66K0eWLOaEMUe7JOIHH0KNSRI9eMaBDXc8vJJusH+VHo8YZmV4YKeBxq
         qpfA==
X-Forwarded-Encrypted: i=1; AJvYcCWWMOEpOiXrInw4ozq9SnS5ZKsJrmEapods8EQI04y07d1fj9WDeGfA7Hyr8v0vEDcqZatSWPfqCG4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztGMhTtWWt8zEa/M/bCO+N1tXPL5NbCusuwdtpzXK/3tE939sx
	OXEFR/N5zObG1zcMxPO1cvEnGD2KvM0XQcxYc/kEFMLu5Nsk5swlTby7lQcIo3c=
X-Gm-Gg: ASbGncsFoQbnpsY9KwgQf9LaWFdCUd+P0zqy29UF0BwYVq8m7ILsxX8kmi9/uEpMErX
	c3c3ZryY/pb+PZiMVtqxd9c8u8j/YXCCMklTp0VhOhmsurGsgloYBkZ8/M3UvqBBEgmhEzYTf69
	AdcyOTepc18cNsCx1QHeEWF0LX9vG9v2bV3/qTydEvFHh/+hf8JjXqqCvRox4S5VfJhdDVxju2h
	LfLmzPGYWzyZMB1cefBzDeb1W+gozHiKksCBDELmu/7+beujZPDAo3WQoJtn5HBYE7qpRSBNwqh
	sy85qOQbnnn/38g54XB5dhBAqwX2zlo8kYXmeyGT+VcNIDR1of0zP7WduRKycICxYLSy913feoM
	A45py0024
X-Google-Smtp-Source: AGHT+IHJ9HFBYWcyb1TnYD8Q/Cc2bci2BGN6NmDoeX0qh63llNA7yEvfO6jA2Fi8bZAz8eI8lL0mLw==
X-Received: by 2002:a05:600c:524c:b0:439:5747:7f2d with SMTP id 5b1f17b1804b1-43c5a63049dmr26432465e9.21.1741364786945;
        Fri, 07 Mar 2025 08:26:26 -0800 (PST)
Message-ID: <75335424-eef1-4d52-a86a-caefdf4b0623@citrix.com>
Date: Fri, 7 Mar 2025 16:26:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/23] xen: introduce hardware domain create flag
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-2-jason.andryuk@amd.com>
 <eca6c919-043b-4e7b-a04d-639406ca1332@citrix.com>
 <cc4e26f9-e198-4677-8873-343f49d0f1ac@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <cc4e26f9-e198-4677-8873-343f49d0f1ac@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/03/2025 2:55 pm, Jason Andryuk wrote:
> On 2025-03-06 17:39, Andrew Cooper wrote:
>> Second, you've created a case where we can make multiple hardware
>> domains, yet it is very much a singleton object from Xen's point of
>> view.
>
> hardware_domain still remains the check for is_hardware_domain(), so
> it's still a singleton.

Multiple domains can pass in CDF_hardware and latest-takes-precedence
for hardware_domain.

That only exists because late_hwdom is a bodge and relies on stealing.

> A later ARM patch for the dom0less code adds a panic() if the device
> tree defines a second hardware domains.

Another option might be to strip out late_hwdom, and do this more
nicely.  I have little confidence that it works, seeing as it only gets
touched to fix build issues.

Either way, I think the common code wants to be ultimately responsible
for refusing to create multiple hardware domains.

>
>> But, by the end, I think we do need to have reasonable confidence that
>> only a single domain can be constructed as the hardware domain.
>
> What do you think about multiple control/privileged domains?

Well, I am the author of
https://github.com/xenserver/xen.pg/blob/XS-8.2.x/patches/xen-domctl-set-privileged-domain.patch
and this is deployed in production for XenServer+HVMI.

"Works on my hypervisor".

~Andrew

