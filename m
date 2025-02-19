Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E135DA3BE86
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 13:49:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892832.1301777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkjW3-000292-7y; Wed, 19 Feb 2025 12:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892832.1301777; Wed, 19 Feb 2025 12:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkjW3-000267-50; Wed, 19 Feb 2025 12:49:27 +0000
Received: by outflank-mailman (input) for mailman id 892832;
 Wed, 19 Feb 2025 12:49:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CKsl=VK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tkjW1-000261-Dc
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 12:49:25 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f21ade99-eebf-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 13:49:24 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38f3ee8a119so2000600f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 04:49:24 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258cccd3sm17740746f8f.23.2025.02.19.04.49.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 04:49:23 -0800 (PST)
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
X-Inumbo-ID: f21ade99-eebf-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739969363; x=1740574163; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Nja4KWgLKlmAvT7KzIu2qL4+Lopp3PjXwUjsOS0lCBA=;
        b=kLOXBFudRh7m4WG1clJgFILtrJKpVnsrGcmI2u+qrkan6s8BEZnKDTJ7oGMJOcRn2s
         L6Rph0/fB9QPgNddZorp1FtyqVzJyEPSiqrK4cNN0kpaFJi3hWC1hrPWMyVuUhpr23l6
         YeBZ+kqXJO/cVcc7gjt69S0BtunR9rrVuF8EI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739969363; x=1740574163;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nja4KWgLKlmAvT7KzIu2qL4+Lopp3PjXwUjsOS0lCBA=;
        b=VYGGLJw87yzXuoyezYORgvdP/t6YDWmUJkkvBEdgugB6xaJEHGJz09+DGD5tnNmLG+
         QETl7QzpqPjoeTwjWUGbArY1WBEjnUFy1bTzetgFwCPNjbO6+bdODZdUndyo4/qYfCzL
         SbcGDAB0NVCbTjfddt6nizoNH+vHBGApmX5mtDoW45F/mk1JYrfIrwmaIW1qFf+BCVWh
         xrp5/WymQ1pkYUgpMRnWn9GVpZgSBlPEqU9ePLAXYRvkV2TP3OHWykIpw86yUzPRcZWA
         xWgM2trM3pEiQ3ZC851y3TKVOfQmldyin5Sm83b8T/4dL5+r508uNDyPTDQ+CwXMfnhX
         Fgpg==
X-Forwarded-Encrypted: i=1; AJvYcCV4NhSdRCs05+ETn2+H3IKgKA9xZXNTP4FA7VCH4GMsads+une2stIqLy8oRFAIsoevq6xF1zUZa/8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzN3t8zRrBSxyi/f/lP1OZJ8LPHq++Da0+J8IQIT2KUF/glgAed
	0Eqt7BaCMx+65mJgdiiAgJcolZS5XBVIOpXcMY/tgN+OO9hskB0xYUSFfyKTZ1c=
X-Gm-Gg: ASbGncuwz7AG3O31eR8nCVh31QU0Pj0FFOEw71cTmydeWpIqvuYJ9oQeUgzISLTGeXZ
	+PNrA/H4AAUr3oueaOeKlCg2UXPXqXkbJmXPmwci6kErppr2YNA0ax5Qca0ALAq+nWckS4B+VM7
	q1F9uskLgNSy/xQOlmnwRNP/6J9y99koStkwC33ZUBaPtuRfP8g+hGDEP9fNfIUJUVEFnPUAwfn
	jhLINQzzpdockeyacz2+Hpp8Eg5B0iOuU7Ld3RxXNunpwRpanpvdXfMiM2cC2fbvmEtF8L31JlE
	/PDxGe7aWIulkEqi+H/VDpMkwd2uqX0qyIgO7w9rx0oZhoRIQP0yaec=
X-Google-Smtp-Source: AGHT+IHQbyexbgnhv1Nzvbn7UK2oeyZY+AozEFLUCQfrS2LxfVI7z6FdX6iD+MLV6JJI1qP98AqBdA==
X-Received: by 2002:a5d:6d0e:0:b0:38f:5833:43ca with SMTP id ffacd0b85a97d-38f58334434mr3095155f8f.9.1739969363543;
        Wed, 19 Feb 2025 04:49:23 -0800 (PST)
Message-ID: <ded403ff-b12b-4794-bbad-f4726a132ada@citrix.com>
Date: Wed, 19 Feb 2025 12:49:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] code style exercise: Drivers folder samples
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Artem_Mygaiev@epam.com, jbeulich@suse.com,
 Luca.Fancellu@arm.com, roger.pau@citrix.com,
 marmarek@invisiblethingslab.com, anthony.perard@vates.tech
References: <20250216102108.2665222-1-andr2000@gmail.com>
 <b3f7614b-3a2b-4f17-be23-aa69c9f8e065@citrix.com>
 <ba3a8d0c-bc05-4d62-9c56-fc77d5969070@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ba3a8d0c-bc05-4d62-9c56-fc77d5969070@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/02/2025 5:11 pm, Oleksandr Andrushchenko wrote:
> Hello, Roger!
>
> Please find the branch with all the conversions [1].
> Unfortunately I cannot provide a branch as seen with
> diff --ignore-all-space as such a patch will not simply apply.
>
> Stay safe,
> Oleksandr Andrushchenko
>
> On 16.02.25 13:58, Andrew Cooper wrote:
>> On 16/02/2025 10:21 am, Oleksandr Andrushchenko wrote:
>>> There are two diff files which show what happens in case the same is
>>> applied to the whole xen/drivers directory:
>>> - first one is the result of the "git diff" command, 1.2M [3]
>>> - the second one is for "git diff --ignire-all-space", 600K [4]
>> Please can you format everything, and put it on a branch somewhere, so
>> people can browse.
>>
>> ~Andrew
> [1] https://github.com/andr2000/xen/tree/clang_ml_drivers_v002_diff

That appears to only be drivers/

Please do *everything*.  I want to see what this does to files I
consider to be pretty clean Xen-style.

~Andrew


