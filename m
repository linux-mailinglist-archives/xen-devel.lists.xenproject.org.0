Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C692E7DCDFC
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 14:39:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625774.975398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxoxA-000651-DK; Tue, 31 Oct 2023 13:38:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625774.975398; Tue, 31 Oct 2023 13:38:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxoxA-000637-Ag; Tue, 31 Oct 2023 13:38:44 +0000
Received: by outflank-mailman (input) for mailman id 625774;
 Tue, 31 Oct 2023 13:38:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9ZX9=GN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qxox8-000631-So
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 13:38:42 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd83b4fa-77f2-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 14:38:41 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9c603e2354fso1156258766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Oct 2023 06:38:41 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 gu9-20020a170906f28900b0099293cdbc98sm1005835ejb.145.2023.10.31.06.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Oct 2023 06:38:40 -0700 (PDT)
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
X-Inumbo-ID: cd83b4fa-77f2-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698759520; x=1699364320; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hhvn9mRF282DMzFJkBug0SVcBFxu6eu50Z5C0LNX8Lg=;
        b=Hqqn8v9dz9RpEoikzWCPHU7YUw5fxwH7taETGsBn9DQWcOkMzKffwUlvQq+uzZAcDC
         YecMBmR0jQnFJy3y2F4z74xnfs9NHcZ4l3BW86WGi9FTqJg65qw6P4SBPSrDy90PyiuH
         2IRg8KA7oNbMqmGuZfu/LyCXKGC9UB2A8Sg8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698759520; x=1699364320;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhvn9mRF282DMzFJkBug0SVcBFxu6eu50Z5C0LNX8Lg=;
        b=vpHnuGBPZW2pzzoEzLsl8XpltOQ7QbPhl2KiKZVnSmWNP0wOFC8s0lkA5wNOAW7JOT
         kSju21NT8Ijc+bl2mzGxaNWWo5I7LUiMhuuXSJ2qmtvsUFJAyBeQv5WTdSRSZeJCGLh4
         t2uYdqQjmI35xCTkyQz0kD2PshIYc9cZmufwdUUvxP3fBvp94sM5LqsnvFQ2IaDC7Xsh
         gnVGtRlEoxYJ1sd0Q8Sk3Un6PQfTwywLl6x3h8owT/28SBuKcbjqrBmV7kypKXwtygY/
         oGle4gfjYZ9LK8i1tVl9Cz2wjCxNxMIr2+E64cZV8p5O1cOekKP4SBo4M9f9EkXdv3W7
         D0fA==
X-Gm-Message-State: AOJu0YyRiwzmqusP9r7VzyMVT8d4aHOajUWcDn3ggwenCAOoTh0X5t3P
	SnNSCjezqbb/vhYaBoBFlIt1IA==
X-Google-Smtp-Source: AGHT+IFCI3WuMF4V1Atz4p5RzeS7+ButZEZVqw8ITP9IVBBW3Yc22aYucRHIpM6RrXgf237Ow2gt6g==
X-Received: by 2002:a17:906:7b52:b0:9b2:cee1:1f82 with SMTP id n18-20020a1709067b5200b009b2cee11f82mr2299083ejo.7.1698759520457;
        Tue, 31 Oct 2023 06:38:40 -0700 (PDT)
Message-ID: <37bcdf0c-75be-4390-8758-d53f097d5b88@citrix.com>
Date: Tue, 31 Oct 2023 13:38:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.19 3/3] CHANGELOG: Keep unstable section
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <20231031131954.3310725-1-andrew.cooper3@citrix.com>
 <20231031131954.3310725-4-andrew.cooper3@citrix.com>
 <d2a5b85e-e25a-458e-b3ad-0821eb106e85@xen.org>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d2a5b85e-e25a-458e-b3ad-0821eb106e85@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/10/2023 1:31 pm, Julien Grall wrote:
> Hi,
>
> On 31/10/2023 13:19, Andrew Cooper wrote:
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Henry already provided a similar patch [1]. The only reason it is not
> yet committed is because we haven't yet set a final date for 4.18 and
> I want to avoid any clash when that patch will appear.
>
> Cheers,
>
> [1] 20231023092123.1756426-5-Henry.Wang@arm.com

This section should not have been deleted in d9f07b06cfc9.

It's fine to have an unstable section before the 4.18 date is confirmed,
and the section must exist before staging is re-opened for 4.19 content.

I don't mind which of these two patches gets committed, but one of them
is getting committed today ahead of staging re-opening.  Part of
branching ought to ensure that this section exists.

Henry, your choice.

~Andrew

