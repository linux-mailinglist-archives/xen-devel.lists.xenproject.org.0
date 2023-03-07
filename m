Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CC96AFA48
	for <lists+xen-devel@lfdr.de>; Wed,  8 Mar 2023 00:27:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507937.782141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZghs-00087S-Op; Tue, 07 Mar 2023 23:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507937.782141; Tue, 07 Mar 2023 23:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZghs-00084O-Lt; Tue, 07 Mar 2023 23:26:56 +0000
Received: by outflank-mailman (input) for mailman id 507937;
 Tue, 07 Mar 2023 23:26:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NnZl=67=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pZghr-00084I-LT
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 23:26:55 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bda5b2e-bd3f-11ed-87f5-c1b5be75604c;
 Wed, 08 Mar 2023 00:26:54 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 o38-20020a05600c512600b003e8320d1c11so1357357wms.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 15:26:54 -0800 (PST)
Received: from [192.168.10.175] (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 f18-20020a05600c43d200b003dec22de1b1sm13821337wmn.10.2023.03.07.15.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 15:26:53 -0800 (PST)
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
X-Inumbo-ID: 8bda5b2e-bd3f-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678231614;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tuqFRgIuZ4P97LUA0hRJCkk0C0eemYPFkyeXQF2boOM=;
        b=a7jjDE5/nroPUvZUdQGYuZH+NSoL9h33sE5iCq0oYHg4Hbj8944n5rk4m88leuqL1B
         bjL7HRkZlMtD+WYGYKvyey1rdRkgyu348vuMXqaYEoVvMQXAkOxoe9NfijoBTyPM5C0a
         PpWWQamVA+Gw+EdBrUacjS6NW6vO7pJJc/+iPsKdCWGrcou/bP8QGmcGgpAzWVOSlmJH
         OLQjufO9XBgbgrB8FfDBGTkDADWsvuRTLThVh7STn+Wo3yzpsmLjsan5KnbD186ObNFl
         qEj4NZ2YfT7tf4GHJc8JZtP+iZ47OpmEr8ZnEKUOdZRh1ZOP8ZlWCHXmqP6HIH7Pvekh
         38JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678231614;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tuqFRgIuZ4P97LUA0hRJCkk0C0eemYPFkyeXQF2boOM=;
        b=418WKHsN3rZDnQfUptTuqQQverSB6ssAkGh8nDfY0J28uY2PMegVE9npa4Qi4I4XR7
         mChnrfntwzdPzO3iAPYRUicyUNGeiSgElDrSG2+WMy5LCq/a89y3rC0EQVhfyYuN47J8
         1B+yElJQJlKMSEIExET+IAnkQo38tMgbYCkQdzkzthPWHnvYBNUspAErZT07X54KDphL
         4U+o8sHTDMtqIjEOjjfStFHMRTxOli8oe93eFCWBS5uFY+3Cmm0B3Ru9NnE9XwafUrgp
         p/u7BKXWI6JcrsTmffctBxyYYAgXVFDqZEmoqyJGhbrC2Jyp3TrFMiOXq0n44XXNRJhW
         J+qA==
X-Gm-Message-State: AO0yUKU2St7681N+qKTJQxsmUQjOl2n/leOTqO6eNQ4tse9Tae5BX60z
	F6PwWOnoV1j0JpbeRtzWcQp2Sg==
X-Google-Smtp-Source: AK7set8ug5hknOh4vkpJs2RhDAU7Vjyrmms2iGRmH9fXFjP0uGJsjSrbu9zfoiZnz7US8ToinF7N6Q==
X-Received: by 2002:a05:600c:35d2:b0:3ea:f6c4:5f2a with SMTP id r18-20020a05600c35d200b003eaf6c45f2amr13331768wmq.17.1678231614174;
        Tue, 07 Mar 2023 15:26:54 -0800 (PST)
Message-ID: <17f90f14-dfc2-cb8b-d408-cfe403deae5f@linaro.org>
Date: Wed, 8 Mar 2023 00:26:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PULL 00/27] Enable PV backends with Xen/KVM emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20230307182707.2298618-1-dwmw2@infradead.org>
 <c53bca89-53d3-11ca-a768-dc7e9143e7b1@linaro.org>
 <16e41045564e3dfc988a636081022321b3dbcfe8.camel@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <16e41045564e3dfc988a636081022321b3dbcfe8.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/3/23 23:34, David Woodhouse wrote:
> On Tue, 2023-03-07 at 21:20 +0100, Philippe Mathieu-Daudé wrote:
>>
>> This tag only appears in the cover letter, and is missing in each patch.
>> It would have been acceptable if it were in the PR tag, but
>> the tag (which for some reason isn't displayed in your cover letter)
>> is simply "PV back end support for emulated Xen".
>>
>> You can fetch a series with tag applied with b4:
>> https://github.com/mricon/b4
>>
>> You can post signed PR with easily with git-publish:
>> https://github.com/stefanha/git-publish
> 
> Indeed, while I knew that the testing had been done, I didn't actually
> have that Tested-by: tag to cut and paste until after I'd pushed the
> tree to gitlab for CI, and signed the tag.
> 
> But I realise that I can just update the tag, since it's signed and it
> was only referenced by name. And nobody but you has looked yet so
> nobody will notice... this one look better?
> 
> https://git.infradead.org/users/dwmw2/qemu.git/tag/refs/tags/xenfv-2

LGTM, thanks!

