Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34912AA93D2
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 15:00:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976117.1363354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBvQe-00087o-3E; Mon, 05 May 2025 13:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976117.1363354; Mon, 05 May 2025 13:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBvQd-00085U-Ur; Mon, 05 May 2025 13:00:15 +0000
Received: by outflank-mailman (input) for mailman id 976117;
 Mon, 05 May 2025 13:00:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6xZV=XV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uBvQc-00085O-S7
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 13:00:14 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e26b378a-29b0-11f0-9eb4-5ba50f476ded;
 Mon, 05 May 2025 15:00:13 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39c1efc457bso2900356f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 May 2025 06:00:13 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441ae456d7dsm124743805e9.1.2025.05.05.06.00.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 06:00:12 -0700 (PDT)
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
X-Inumbo-ID: e26b378a-29b0-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746450013; x=1747054813; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ckRb3816xOvrOSfUwo4e4ezXTtORSRAUO0FgMicU0EE=;
        b=NUNrYxSkDnDwS4WIIUnv0//4ZkALhzVqmTDGKNJARVRVO79ix51xQybrQcLhf+Ea1W
         RTV7Mi5428oj6d+dp5F3cZsoR+mHXv3yMPBVpUMW/UgPhkNoTBqUMjabYnz42zx20g4X
         oqsO7/AMO3h8PHi9FgMopHMSK5gvDYIZkmBLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746450013; x=1747054813;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckRb3816xOvrOSfUwo4e4ezXTtORSRAUO0FgMicU0EE=;
        b=HpCEQU79bBo65hsEDIGVC2H8fS60z5hHGwaYSZWrgxKWMMovJGWbAkIaNW/e9LSQSP
         bgQqB4D98OcnGfOfiW/RXWpM7pf4dhOUf8vluLFB8i2t8Vb8AXAqzsfh22CdiS31fmqs
         8F9kH+pZmZj0AM7oZmY1f1W6CujHWZtAUHtJ13ArvxpUCloXspn6ba7/CAxOEKaNwzme
         MibKjx4n4x9pmdZsGcQiY1IeLxuDcLhjAt6QL1gKKQ1HXPa2ZIyDh/wygvoCW0NYIKMZ
         pA7wp0iTXcqn7TwXi/QVDXBN3kOV/73HCLNFDuLYTAFjlgeli0loIiqKv75+oTv9Mo7A
         BO0w==
X-Gm-Message-State: AOJu0Yy0b5Tgk6fYsgWcjAlbFY+ruIrYPWkMCfD+Tw9a99zyIKtjzp9r
	5GAWcMk/pDArkYRMPdixuqboLBZT24VlSZp5vkTL+7PIW+CHwGykIht2XZ3MUwo=
X-Gm-Gg: ASbGncvdHIjionAVtrxwnq2kmH0Cws1ibnBhRHfmLyvshcTwYO47IL5qrj1ev+M4aX7
	IrKTh247EOh1t/0yBTPT/hsFy+vQJipxXoYsioxAneocZdO7nR6gMCKWjuDkW57gkbV5ghJhU7e
	XfcFTbpe7n0Ur001p88mkiJeTBhpg2c4/3LtcoX1vvBlWtiOIx9pszx+o/uQ+N5ZelZqPrGNIZf
	x0P3lF3BatvaLpvdSSm4yX4/Bttc7ptM1+D5AGrvzkKiO+gDoBDb+NgzOPnh4EYu1RrmAvDvukT
	YVxUa/1HiK9MFwXtThKy3amMvDrrVlqw1ycgTsEb5LYuI2l+YTmQ2J2KilAGS1V4Vk5RNj0AKxe
	mQhx52A==
X-Google-Smtp-Source: AGHT+IGIR2islggJYNlehilJg4010xIsu9DKOnt83vCTBASxQaD70HpLgNgl6pfbrS0yYhCp9CWqog==
X-Received: by 2002:a05:6000:40e1:b0:391:4bfd:6d5 with SMTP id ffacd0b85a97d-3a09fdd7bc3mr6082199f8f.52.1746450013399;
        Mon, 05 May 2025 06:00:13 -0700 (PDT)
Message-ID: <58c1c979-1dd7-4ed3-8eb6-2c7f7046fcf0@citrix.com>
Date: Mon, 5 May 2025 14:00:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Use __auto_type
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>
References: <20250505124646.1569767-1-andrew.cooper3@citrix.com>
 <707b9f833fd4cd0341ad09cbc3265ec9@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <707b9f833fd4cd0341ad09cbc3265ec9@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/05/2025 1:57 pm, Nicola Vetrini wrote:
> On 2025-05-05 14:46, Andrew Cooper wrote:
>> In macros it is common to declare local variables using typeof(param)
>> in order
>> to ensure that side effects are only evaluated once.  A consequence
>> of this is
>> double textural expansion of the parameter, which can get out of hand
>> very
>> quickly with nested macros.
>>
>> A GCC extension, __auto_type, is now avaialble in the new toolchain
>> baseline
>> and avoids the double textural expansion.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Julien Grall <julien@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
>> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> CC: consulting@bugseng.com <consulting@bugseng.com>
>>
>> The resulting build is identical.
>>
>> RFC.  This requires a MISRA change, as it currently manifests as a R1.1
>> violation.  Nevertheless, I think we want to start using in places
>> where we
>> currently use typeof(expression of <initilaiser>).
>>
>> Eclair run on this patch (expecting a failure):
>>  
>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1800631949
>>
>
> Hi,
>
> to make the analysis pass you need a couple of hunks in
> eclair_analysis/ECLAIR/toolchain.ecl:
>
> -name_selector+={auto_type, "^__auto_type$"}
>
> and add auto_type to the STD.tokenext config below around line 25,
> then later
>
> -name_selector+={ext_auto_type, "^ext_auto_type$"}
>
> and add "ext_auto_type" to the -config lines below
>
> around line 125, along with a reference to the gcc docs above the
> configurations and in C-language-toolchain.rst
>
> This is an extension, so it's usable without further MISRA impact.

Excellent, thankyou.

I'll leave this email out for discussion, and if it goes in a positive
direction, I'll submit a v2 with (hopefully) all the MISRA/Eclair
changes required.

~Andrew

