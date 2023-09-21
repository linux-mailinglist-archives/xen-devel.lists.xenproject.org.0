Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5BE7A9393
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 12:31:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606273.944060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjGxP-000644-4x; Thu, 21 Sep 2023 10:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606273.944060; Thu, 21 Sep 2023 10:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjGxP-00061B-1c; Thu, 21 Sep 2023 10:30:51 +0000
Received: by outflank-mailman (input) for mailman id 606273;
 Thu, 21 Sep 2023 10:30:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=95bz=FF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qjGxN-000615-Da
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 10:30:49 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecd6fe9e-5869-11ee-878a-cb3800f73035;
 Thu, 21 Sep 2023 12:30:46 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-401187f8071so4687665e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Sep 2023 03:30:46 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 y12-20020adffa4c000000b0031f5f0d0be0sm1367459wrr.31.2023.09.21.03.30.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 03:30:45 -0700 (PDT)
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
X-Inumbo-ID: ecd6fe9e-5869-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695292246; x=1695897046; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Cx8f/wRxGT2iXMS9T3APWIU29IB93CmsXP0o+iTo1/M=;
        b=nKSVrxp5dVPm2a/h1RWPKrvI1Un6yOcR2M75cZetZ7Eg/0JA+SgwqOd2ZL7dVqMb3u
         4IkckSmNpyNtkg/CsVf/wTnC29GqYQX9nr3+ipWVrnt3SSU8AQ7DLGNwCHQqVoDGPnyK
         lIBMURl9B6a+hmTbgWkPJMeXWNMCFMiQrVMwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695292246; x=1695897046;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cx8f/wRxGT2iXMS9T3APWIU29IB93CmsXP0o+iTo1/M=;
        b=b5B+rBuFU17JsMWoxuCYKuxHLruv68oNWJFrUgGV2uJiHwOZ/b9CT5SCNlBeF1Soo6
         WljT0MgQzYCHMEtTOsY1uBVflD+BQ+NUGbo0zAvFY9QDu2uO8VoDM5FtUoMDMvelXPNN
         HT/DJwZ3iweyPr6EYYoSMERvGfacoLMcfIeFkEp/x7Ruy19Dfzg5rq6q9/rbKK3J3XNa
         arsL3IXrlYEQiL/zdiph3y+MQedNgBeFmZReGt1ZlZS1H8U+PE5n/LFT2/0UN7x5oJyr
         ena9pTlHYk4t5oeT12iVb9Rdhg/aLTjY581zR/rSxmJtKWPhhFVa23znKXuTSd2J2XL0
         eO6A==
X-Gm-Message-State: AOJu0YzNC2f70oYrBt/I4jetl0IoaOFvyabuAhHaCGrnvs0meLVLXRqd
	yCXamU9bVjZhAlLKCu0zwIFnPA==
X-Google-Smtp-Source: AGHT+IE6GyFgp3lu5F0dt009bOw8H7PtHiCdsBOcft0Dcfq01nTjnR0ivyTMMocewgLbt26c5E6Dnw==
X-Received: by 2002:a05:600c:3011:b0:405:3622:382c with SMTP id j17-20020a05600c301100b004053622382cmr842860wmh.17.1695292246153;
        Thu, 21 Sep 2023 03:30:46 -0700 (PDT)
Message-ID: <842864d5-8b31-8329-7929-27453813ffd0@citrix.com>
Date: Thu, 21 Sep 2023 11:30:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v3 4/4] README: remove old note about the build
 system's python expectation
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Javi Merino <javi.merino@cloud.com>
References: <cover.1695104399.git.javi.merino@cloud.com>
 <83e6857f16eb000f8368fcd9995e0411f0177c2e.1695104399.git.javi.merino@cloud.com>
 <dff889ef-ec24-2cac-5565-18376f5e331b@suse.com>
 <e878bca9-74cc-d16a-134e-e4728ad0212d@citrix.com>
 <9003c40a-a9e9-4552-71c0-b5b6ea50c1d9@suse.com>
In-Reply-To: <9003c40a-a9e9-4552-71c0-b5b6ea50c1d9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/09/2023 6:59 am, Jan Beulich wrote:
> On 20.09.2023 21:40, Andrew Cooper wrote:
>> On 19/09/2023 7:50 am, Jan Beulich wrote:
>>> On 19.09.2023 08:30, Javi Merino wrote:
>>>> 5852ca485263 (build: fix tools/configure in case only python3 exists,
>>>> 2019-12-11) changed the configure script to test for the availability
>>>> of python3, python and python2 in that order.  It sets PYTHON to the
>>>> first one found in path.  You don't need to have a symlink to python.
>>>>
>>>> Remove the outdated note from the README.
>>> But that note also covers the hypervisor build, which isn't affected by
>>> ./configure, and even less so by tools/configure.
>> The hypervisor build equally doesn't python= specifying.
> I'm pretty sure that on at least one of my systems I need PYTHON=python3
> when building the hypervisor.

Not since c8a8645f1efe you haven't.

~Andrew

