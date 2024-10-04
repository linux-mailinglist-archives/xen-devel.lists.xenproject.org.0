Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E66990B51
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 20:26:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810596.1223301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swn07-0005bx-TA; Fri, 04 Oct 2024 18:26:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810596.1223301; Fri, 04 Oct 2024 18:26:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swn07-0005aH-QY; Fri, 04 Oct 2024 18:26:03 +0000
Received: by outflank-mailman (input) for mailman id 810596;
 Fri, 04 Oct 2024 18:26:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kl2=RA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1swn06-0005aB-Hp
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 18:26:02 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b6c4f0b-827e-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 20:26:01 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5398e3f43f3so3059017e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 11:26:01 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e7bb57asm26199566b.178.2024.10.04.11.25.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 11:25:59 -0700 (PDT)
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
X-Inumbo-ID: 1b6c4f0b-827e-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728066360; x=1728671160; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kvGD4iXKrioedFb9sC9XN7kLk8pAXGsQ+qVVVhcpzTY=;
        b=t4NcB/OiyVnG0TmfhGflvpW0zK6ZMzmHoDh2MVt0CVCljVEKdg35VC5C8XjI3Tx2Sy
         HnKjJOtVPFE1qZ8tU1udmFjvROBbgn5Vo0Dl5JBBQset+wX0H0HZ2G++dpIZIeIfPVbt
         YUTTghBuL1CfMExOPGLLoZ6Lj0lVOemRMtL/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728066360; x=1728671160;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvGD4iXKrioedFb9sC9XN7kLk8pAXGsQ+qVVVhcpzTY=;
        b=Ue0WUKGS5/J4BKoFdULmzi+vG6HSsw5Z1pqQtTtoy43v+84lzBbXKymCRVS53UTvzo
         VlOV2Wz0oNFJRGkmzp9KgB2bOTFE7N9itGnwM5rQse4wU5ag5xGpntoq6G10LmusuqdW
         m5R833QEsJfWGxUYvokTNVG6VxTYxlkCpyUpYH8eyFQqBGl2ojiMaHWYHEGZM41a+NvW
         ekWa525duTPc6sKKso9BVcBchgwk9fHKWJ3tTdWheCC5JKntFKlaJW56WsgL98l1Qaow
         nTDGOd9m2H7MTbDBronEfCdxQlyrDJNOA2pKHS3xbjRxBa+c4MY7IWwwRI4+GSbmj36W
         eBGg==
X-Gm-Message-State: AOJu0YyxgWLCGxV3lPSAf1refRjhjW37XHHmAIFyuW6XkWjhT2PRAxFY
	K9ejo6c1WuIrTfhUWOJa8Q1Xe/ziS0voTh4qsxKeHnUpxEieyGg50BbQSVsn7S0=
X-Google-Smtp-Source: AGHT+IFc0fbPD0/xeag/dGbhfRUyfqozy5K/jaIT9fiSxvvtr/QSZUFs8xY69keTsaLAKr02qMRcDA==
X-Received: by 2002:a05:6512:280e:b0:539:9720:99d4 with SMTP id 2adb3069b0e04-539ab87da94mr2069642e87.28.1728066360432;
        Fri, 04 Oct 2024 11:26:00 -0700 (PDT)
Message-ID: <aae49e30-f726-4e59-b478-04ea7feffe0e@citrix.com>
Date: Fri, 4 Oct 2024 19:25:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CI: Fix builds following qemu-xen update
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241004172723.2391026-1-andrew.cooper3@citrix.com>
 <ZwAwoSOUQuRXeNIH@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZwAwoSOUQuRXeNIH@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/10/2024 7:14 pm, Anthony PERARD wrote:
> On Fri, Oct 04, 2024 at 06:27:23PM +0100, Andrew Cooper wrote:
>> A recent update to qemu-xen has bumped the build requirements, with Python 3.8
>> being the new baseline but also needing the 'ensurepip' and 'tomllib/tomli'
>> packages.
>>
>>  * Ubuntu/Debian package 'ensurepip' separately, but it can be obtained by
>>    installing the python3-venv package.
>>
>>  * 'tomllib' was added to the python standard library in Python 3.11, but
>>    previously it was a separate package named 'tomli'.
>>
>> In terms of changes required to build QEMU:
>>
>>  * Ubuntu 24.04 (Noble) has Python 3.12 so only needs python3-venv
>>
>>  * Ubuntu 22.04 (Jammy) has Python 3.10 but does have a python3-tomli package
>>    that QEMU is happy with.
>>
>>  * FreeBSD has Python 3.9, but Python 3.11 is available.
>>
>> In terms of exclusions:
>>
>>  * Ubuntu 20.04 (Focal) has Python 3.8, but lacks any kind of tomli package.
>>
>>  * Fedora 29 (Python 3.7), OpenSUSE Leap 15.6 (Python 3.6), and Ubuntu
>>    18.04/Bionic (Python 3.6) are now too old.
>>
>> Detecting tomllib/tomli is more than can fit in build's oneliner, so break it
>> out into a proper script.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> The changes on the gitlab side look fine. I don't know if the changes on
> the cirrus side are ok, but at least the seems to work, after looking at
> the build logs. So:
>
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks.  Roger has given his ack on Matrix, so I'll get this committed
right away to unblock things.

~Andrew

