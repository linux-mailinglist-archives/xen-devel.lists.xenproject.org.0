Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDE47CF1CE
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 09:56:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618961.963351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtNtM-0002zb-Gp; Thu, 19 Oct 2023 07:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618961.963351; Thu, 19 Oct 2023 07:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtNtM-0002x0-Cl; Thu, 19 Oct 2023 07:56:28 +0000
Received: by outflank-mailman (input) for mailman id 618961;
 Thu, 19 Oct 2023 07:56:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7/TV=GB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qtNtK-0002wm-S9
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 07:56:26 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00961b57-6e55-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 09:56:25 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-31c5cac3ae2so6516209f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Oct 2023 00:56:25 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a5d5388000000b0032da8fb0d05sm3804977wrv.110.2023.10.19.00.56.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 00:56:24 -0700 (PDT)
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
X-Inumbo-ID: 00961b57-6e55-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697702185; x=1698306985; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fE8Nf7x8RRI+OI25jOOfzdmfK7poX9Ji/hlUQN1g50c=;
        b=vPeQ72qbJFAKJqxpbrZaswVI+n7pVa07E9svsU1Ydwjk4KK/N5uDjNPNcstFyq9daG
         hgJN/Jb0T1nJkXuIkshjRQXJPtOfhlDd7KXZbNCCz0/2msUdGOXsHa5aQd4tLO3y9tvT
         3rOXcJ6uTWbSLkpQ8IU8PbpxLpqekT5XkzRFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697702185; x=1698306985;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fE8Nf7x8RRI+OI25jOOfzdmfK7poX9Ji/hlUQN1g50c=;
        b=RIUORogjGx8t58nqaRzF7QkSDGAUN6n1nH4KIIV1YL15B0j8WQdv3hj3Q70dZVkw0G
         k6lVVJ7R1mjqKTuM4TCZUYFxnPvQl2d7rtq9kiD7hZnMbNhz6fk25BLH5SfUZkr5V2FI
         L9TmHyqM9MwngzzG+2Lxms9qr3+axfp014MWlzm4pMs2I+uRFwOs1eRaFndYQjopexK+
         eb7UfgP2k2mpTOoDNbAYK72cj/cETHKCFoYlqXeEiG/QIoFx8BKSHBjs2mt7ZTSLVNHz
         k5kuMXp1Q1hs8A8tGiE6x67BTVu8tHOdPIbg1wgnS4qOMbvV011EeoSa5ZOL2c59PzW7
         mTzw==
X-Gm-Message-State: AOJu0YxHiUaie7y8ofk2qR4lM3WmebYiLOfX7oTtbr+SxTUUMNTOTNLH
	Mj6lSRbwBUSscSFspf6j/yDCuQ==
X-Google-Smtp-Source: AGHT+IFMkFDNM7o7SXXAlhOHdaXDAfBGvOrcy+utRRulLGhIgmsFg47zFN+of+ZnW+MUrT8AasD7LQ==
X-Received: by 2002:a5d:6349:0:b0:32d:8108:504 with SMTP id b9-20020a5d6349000000b0032d81080504mr1060062wrw.61.1697702185191;
        Thu, 19 Oct 2023 00:56:25 -0700 (PDT)
Message-ID: <6f107d27-f5f2-4e8c-b029-dd25c8d3c678@citrix.com>
Date: Thu, 19 Oct 2023 08:56:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: andrew.cooper3@citrix.com
Subject: Re: [XEN PATCH][for-4.19 v3] xen: address violations of Rule 11.9
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 jbeulich@suse.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
References: <d760ef0c088dc15ecc411b83640735123444f887.1697636446.git.nicola.vetrini@bugseng.com>
 <35abc556-2f66-4498-b567-87e6a3216d50@citrix.com>
 <alpine.DEB.2.22.394.2310181745300.965337@ubuntu-linux-20-04-desktop>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2310181745300.965337@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/10/2023 1:54 am, Stefano Stabellini wrote:
> On Thu, 19 Oct 2023, andrew.cooper3@citrix.com wrote:
>> On 18/10/2023 2:42 pm, Nicola Vetrini wrote:
>>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>>> index ee7aed0609d2..1b00e4e3e9b7 100644
>>> --- a/docs/misra/deviations.rst
>>> +++ b/docs/misra/deviations.rst
>>> @@ -199,6 +199,11 @@ Deviations related to MISRA C:2012 Rules:
>>>         See automation/eclair_analysis/deviations.ecl for the full explanation.
>>>       - Tagged as `safe` for ECLAIR.
>>>  
>>> +   * - R11.9
>>> +     - __ACCESS_ONCE uses a 0 as a null pointer constant to check if a type is
>>> +       scalar, therefore its usage for this purpose is allowed.
>> This is still deeply misleading.
>>
>> There is an integer, which happens to be 0 but could be anything, used
>> for a compile time typecheck[1].  In some cases this may be interpreted
>> as a pointer constant, and is permitted for this purpose.
>>
>> ~Andrew
>>
>> [1] I know I wrote scalar typecheck in the comment, but I suspect that
>> what I actually meant was non-compound-type typecheck.
> To help Nicola find the right wording do you have a concrete suggestion
> for the text to use?
>
> Reading your reply, I am guessing it would be:
>
> * - R11.9
>   - __ACCESS_ONCE uses an integer, which happens to be zero, as a
>     non-compound-type typecheck. The typecheck uses a cast. The usage of
>     zero or other integers for this purpose is allowed.
>
> Andrew, please confirm? Nicola, please also confirm that this version of
> the text would be suitable for an assessor.

Yes, that paragraph was intended as a specific suggestion, but I see I
did miss __ACCESS_ONCE() off the start.  Sorry.

And yes - we should probably just leave it as "a compile time
typecheck".  Anything more specific isn't relevant here, and isn't
trivial to describe either.

~Andrew

