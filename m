Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D9599584E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 22:22:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813512.1226492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syGiQ-0004Lo-NM; Tue, 08 Oct 2024 20:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813512.1226492; Tue, 08 Oct 2024 20:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syGiQ-0004Iv-KP; Tue, 08 Oct 2024 20:21:54 +0000
Received: by outflank-mailman (input) for mailman id 813512;
 Tue, 08 Oct 2024 20:21:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJPt=RE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1syGiP-0004IX-QH
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 20:21:53 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3f964e6-85b2-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 22:21:51 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-37ccd81de57so118707f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 13:21:51 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-430699b6953sm2421075e9.33.2024.10.08.13.21.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 13:21:50 -0700 (PDT)
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
X-Inumbo-ID: f3f964e6-85b2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728418911; x=1729023711; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vv1P0se2TnaWRZaX5tyrz94ZvHqWZ3HIsOyXouv73Qk=;
        b=ceJoCW+FCSzYtF2dTrahKmdR9AtUc8vkT7uolGq8cpFzZxQc/1houhH1Sk2xuHTuSG
         pAraeH73aWbIG5U5Bl94Tm8AJsXxmQDqwjCD4HI3axNGrMzWDqZidBeOgoyq7Kq7/609
         iJHs2IATU7nGChJt8UHpM69tiOlEUl/9IJtOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728418911; x=1729023711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vv1P0se2TnaWRZaX5tyrz94ZvHqWZ3HIsOyXouv73Qk=;
        b=N43t2JFgU1Gdph8/NK/5tJ4e2GKfqh5raq/o7X/3BGz8KTWQRSq9kpph2nVf2GykA7
         MBwH9SLCpb0Vc1rp6MA7osAmr2sg0Dt4gJ1ixxv9xK5IPxV14E4BZGTLjtOZNnqzXxZT
         WnZ8/Zz89MhF8gp0VLtclP+osreLdFSEJrnGcI+vVFIKSsqYpBI7iIeKFQw4D/oPHxaq
         RSCvLkTtDPBTtMFv8eIDIoWsruNhCYla44pl7skmIjnyBoHOmtnvtC8XvrsRSwV08rFJ
         5Hxk5krohaNNhGZg9cuKplyyLmZRzyolzL97tcbSaT9FrsN2iMuLqzlqXzYx8oEkBqg3
         v10w==
X-Forwarded-Encrypted: i=1; AJvYcCUPjjCjjS4NBHwYVIrdZ7M2PaWSI5jXg744W5mTjk+YrBGybM/jzFl3g5Osm435gAxgacwUad4wgVM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyg/vcDJLGuxDfWIFTi6VadSbXgiBz7nz6glvo5cVuViewt7u0R
	Ll0CuMmG4P4Yb12Z2V1jUc0psN235jQwYjgoSW3MS01O/KCQRigkmQ3kZEOr9PE=
X-Google-Smtp-Source: AGHT+IExkvZ6cYALHv56+Fza6VOj63aUy9TvJMlMrwQ6H2g6A/IkIWUbGy/ISveAAYzvHOeyZSKrNg==
X-Received: by 2002:a5d:6d4f:0:b0:374:bf6b:1021 with SMTP id ffacd0b85a97d-37d29350e99mr2667399f8f.27.1728418911039;
        Tue, 08 Oct 2024 13:21:51 -0700 (PDT)
Message-ID: <140e7be0-2d00-4673-917e-8f9da206c792@citrix.com>
Date: Tue, 8 Oct 2024 21:21:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CI: Stop building QEMU in general
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20241008155023.2571517-1-andrew.cooper3@citrix.com>
 <ZwVddI62BTAtMUls@l14> <056fbcc4-71f1-4ce1-aae6-bb3a7192aefb@citrix.com>
 <alpine.DEB.2.22.394.2410081151240.12382@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2410081151240.12382@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/10/2024 7:54 pm, Stefano Stabellini wrote:
> On Tue, 8 Oct 2024, Andrew Cooper wrote:
>> On 08/10/2024 5:27 pm, Anthony PERARD wrote:
>>> On Tue, Oct 08, 2024 at 04:50:23PM +0100, Andrew Cooper wrote:
>>>> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
>>>> index c668736bdc2f..c83e0bdbe119 100644
>>>> --- a/automation/gitlab-ci/build.yaml
>>>> +++ b/automation/gitlab-ci/build.yaml
>>>> @@ -339,6 +339,7 @@ alpine-3.18-gcc-debug:
>>>>    extends: .gcc-x86-64-build-debug
>>>>    variables:
>>>>      CONTAINER: alpine:3.18
>>>> +    QEMU: y
>>> Could you use a different name for the variable? This is exposed as an
>>> environment variable, it could easily be used in a build system already,
>>> like used to store a path to a QEMU to use.
>>>
>>> We don't really have a name space for CI variable, but maybe
>>> BUILD_QEMU or BUILD_QEMU_XEN would be less likely to clash with other
>>> usages.
>>>
>>> Otherwise patch looks fine.
>> A can switch to BUILD_QEMU, but I don't plan to repost just for that.
> The patch is fine.
>
> BUILD_QEMU is a bit better. BUILD_QEMU_XEN or BUILD_QEMU_DM would be
> even better to clarify we are building a QEMU version to serve as device
> model. It is a pity that typically we call qemu-dm the ancient QEMU
> fork because "qemu device model" is more meaningful than "qemu xen".
>
> Anyway, pick your preference and feel free to change the variable name
> on commit.
>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks.  I think I'll go with BUILD_QEMU_XEN because that what the rest
of Xen's build system calls the thing being discussed here.

~Andrew


