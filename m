Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24910A33448
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 01:52:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886972.1296551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiNSB-0007Bt-8E; Thu, 13 Feb 2025 00:51:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886972.1296551; Thu, 13 Feb 2025 00:51:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiNSB-00079J-5X; Thu, 13 Feb 2025 00:51:43 +0000
Received: by outflank-mailman (input) for mailman id 886972;
 Thu, 13 Feb 2025 00:51:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q8TG=VE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tiNS9-00079D-Ml
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 00:51:41 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afc076e1-e9a4-11ef-a075-877d107080fb;
 Thu, 13 Feb 2025 01:51:40 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso1915625e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 16:51:40 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a04f8c1sm34115635e9.8.2025.02.12.16.51.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 16:51:39 -0800 (PST)
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
X-Inumbo-ID: afc076e1-e9a4-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739407900; x=1740012700; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6IF8SPUYrIpIZBpYmbl2K7ITwIDK9Ps0skgmUs0R2tI=;
        b=MEGNVAADO2W5ZL6LDjtOUsqxpSMMvrfA5tasNgdex3+6SKWJTjFIF5vCU5hS+ZEUTP
         pEZcmZJoct+dtF2HVy0sTGj+I6awwSaPKpLiS9d/ZW8/oihbLshExyf0EdoU1moMcSqM
         A6Nesw5oPNuw/BLn99QFbNyWXb6ReKPyvWyPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739407900; x=1740012700;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6IF8SPUYrIpIZBpYmbl2K7ITwIDK9Ps0skgmUs0R2tI=;
        b=RD8U6b9T5C31yL6oDgcxcjPIrsBrBdJAjTqnwvxtm3CiRwzASnv4VWH94a01jTK4Ll
         3isLes/ni0Cu1DEqLaN0z10+lwNx8nQKXo0Rrqptyj++hTIGr5cdxYp0b6D+sulGp2hd
         8YlKYzrayhl59eZ5GrzgLXgugFSFm8XxjS/7TRb5eYucepesgDk2Z8LHkrU1jygKBI9h
         WF3owzoE4i/K+8HABj1YwvwPtySkrpJjZKNBCn/8DC1XTKf5LqBuj+PbkFuzTEZjMfzR
         j9uqt+e7wxS7pdTHTlRKpYMX+u2e5j6yiwEI17AhmNt60SiB92ndNTgdOHt8kqlPDF7H
         26rg==
X-Gm-Message-State: AOJu0YxLYoMilfH37ps/OZuKHsu6ZL4Dcwq7+KamZCNmc1T5WvfDLvAS
	+xwR64j3qOH/C+kTpSJYpmXDn/F0OKgK8E7W/CJ4pgPBGiqLvaqqVthtuAxpEK0=
X-Gm-Gg: ASbGncsjM1WKWbUCyC+r1m+nimVa/w07FTocPBij6nEFH3+A5OoM330jodC6QzhdgFv
	pF52ebrNtYJf1XTPLkOojP2v2bFfk1vVhgYBlPOAOYwaeG9tkTEaPaRIFtJIVbSsFuJUKJgt8kE
	EIf9xevGgnFIVhwq2xXwIsOTw6vNc9UdKk1PCv21l8U4p8qALYHDd1yMTjdmSAXB+YfTJmjU/6g
	uikPgYT81c9wcQydFxGOX7nX/Eui9CnX0YaHAJDVnCe0uXlCP0b0So++LHCWb/PQuV26bfOg44j
	99oAj0erXldhJIIFxO8bPubT9SbUP7HCxJN8fm7CtBIh5T+2US/KEUo=
X-Google-Smtp-Source: AGHT+IErefip8VZU1K3/LXlUx+hHU11GbgEhByS5JMBmBvVbXaU+MstvkfzVbRaQSRWtfT12PgbUYw==
X-Received: by 2002:a05:600c:4e16:b0:439:3050:1abc with SMTP id 5b1f17b1804b1-4395817a5edmr53206305e9.15.1739407900023;
        Wed, 12 Feb 2025 16:51:40 -0800 (PST)
Message-ID: <4d53aa6e-640d-4b49-9e45-0684fb263833@citrix.com>
Date: Thu, 13 Feb 2025 00:51:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG?] Wrong RC reported during 'make install'
To: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, committers@xenproject.org,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <69a52464-4e2e-43fc-9792-46d7a9614a80@gmail.com>
 <alpine.DEB.2.22.394.2502121347430.619090@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2502121347430.619090@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/02/2025 9:52 pm, Stefano Stabellini wrote:
> On Wed, 12 Feb 2025, Oleksii Kurochko wrote:
>> Hello everyone,
>>
>> During the installation of Xen on an ARM server machine from the source code,
>> I found that the wrong release candidate (rc) is being used:
>>   $ make install  
>>     install -m0644 -p xen //boot/xen-4.20-rc  
>>     install: cannot remove ‘//boot/xen-4.20-rc’: Permission denied  
>>     make[1]: *** [Makefile:507: _install] Error 1
>> My expectation is that it should be xen-4.20-rc4.
>>
>> I'm not sure if this behavior is intentional or if users are expected to set
>> the XEN_VENDORVERSION variable manually to ensure the correct release
>> candidate number.
>>
>> In my opinion, we should set the proper release candidate number after
>> "xen-4.20-rc" automatically.
>>
>> Does anyone have any thoughts or suggestions on how to resolve this issue?
> Hi Oleksii,
>
> I did a quick test and I see exactly the same on x86 as well. This patch
> fixes it, but then it would need someone to update the RC number in
> xen/Makefile every time a new RC is made.
>
> ---
> xen: add RC version number to xen filename
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

This is a direct consequence of the request to keep XEN_EXTRAVERSION at
"-rc" throughout the release cycle.

I'm having to manually edit that simply to create the tarballs
correctly, which in turn means that the tarball isn't a byte-for-byte
identical `git archive` of the tag it purports to be.

I'd not twigged that it mean the builds from the tarballs reported false
information too.

While I appreciate the wish to not have a commit per RC bumping
XEN_EXTRAVERSION, I think the avoidance of doing so is creating more
problems than it solves, and we should revert back to the prior way of
doing things.

~Andrew

