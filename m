Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E987E2616
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 14:52:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627997.978977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r001S-0002OI-Mo; Mon, 06 Nov 2023 13:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627997.978977; Mon, 06 Nov 2023 13:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r001S-0002Ld-KB; Mon, 06 Nov 2023 13:52:10 +0000
Received: by outflank-mailman (input) for mailman id 627997;
 Mon, 06 Nov 2023 13:52:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gUrR=GT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r001R-0002LX-28
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 13:52:09 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac7397f9-7cab-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 14:52:07 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4083cd3917eso34529595e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 05:52:07 -0800 (PST)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c30d300b004063c9f68f2sm12085344wmn.26.2023.11.06.05.52.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 05:52:06 -0800 (PST)
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
X-Inumbo-ID: ac7397f9-7cab-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699278726; x=1699883526; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O32cHMpdyaCz5LOPRe7uLWNtRlMxmfU4hBpS+Ae/FCI=;
        b=LhrD3zZd40xGkFTbLPYgmsMvONc+FXTx+JaW9a1MxnvKAZwYoHvsSNSUjUV9EMrOaJ
         UjSGaS3N4dLJi0xtX7KOWC/uEgWiW9TqVL76HwZ2Fy9XrRMlcxS0m3Jz5kbDy8+s/5Yv
         5WTjNiZQPVbOPkPkgcgGrXvfawOdJrRQDTqtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699278726; x=1699883526;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O32cHMpdyaCz5LOPRe7uLWNtRlMxmfU4hBpS+Ae/FCI=;
        b=mUQfpdYJZDq4yQUK46dEF8BlpLIl8SWx+2rggk0o9WGOGz54q8lbV7HB2TFcLgwIxD
         5dSBzXjBoy9dVU1E+22m+ybsJWinnkWAjmY6yzKW1FfUaL1+Ff1LMKNXxsTdEL+5mC0K
         iiMzDkeG8WqOlLPlVqgzFgPEpbR2Q9CQZZ6rPtV7T7+a7Z0pGp8weFjZU5hkHOoIZibu
         UoqiIIYokIDKGdA119PRpyh9YQpwXoYP1wdcoKYqR3p5n5yH7iiAjQHQ00nW/ZLb4ev/
         hbaiawPCgPv4MvVaQPcFNvICundOR7FSubc0uqYTVi7s3YkglxpL6/3AawxZHnWJjZfM
         PKPg==
X-Gm-Message-State: AOJu0Yy/OWWrYMTTLtYDM+ECRdwS5HyohQaSU5B6ho4L8HI99198T+CN
	h/GacUCaV9/Q10aH0FOxCx6MdA==
X-Google-Smtp-Source: AGHT+IFRIJJnS6INwHLdDLvL+iK9jG2mVGnXOQei+CLPHVVj94iCTskJQXoAHVlSbwYA8ahhGKi1xw==
X-Received: by 2002:a05:600c:4f44:b0:408:389d:c22e with SMTP id m4-20020a05600c4f4400b00408389dc22emr24384256wmq.25.1699278726701;
        Mon, 06 Nov 2023 05:52:06 -0800 (PST)
Message-ID: <e13a9138-9415-4009-a427-8367013152e2@citrix.com>
Date: Mon, 6 Nov 2023 13:52:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.18 0/2] golang: Binding fixes
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
 <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Xen Security <security@xen.org>
References: <20231103194551.64448-1-jandryuk@gmail.com>
 <e4d1a87f-fdf3-4461-b212-1ed28c93019b@tibco.com>
 <CE0D9014-BD9A-45C5-90EA-94EF780D5100@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CE0D9014-BD9A-45C5-90EA-94EF780D5100@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/11/2023 5:38 am, Henry Wang wrote:
> Hi Andrew,
>
>> On Nov 4, 2023, at 03:50, Andrew Cooper <andcooper@tibco.com> wrote:
>>
>> [andcooper@tibco.com appears similar to someone who previously sent you email, but may not be that person. Learn why this could be a risk at https://aka.ms/LearnAboutSenderIdentification ]
> (+Your work email address since this reply somehow ended up with my filter,
> I found this email a bit later, sorry for the late reply.)

sigh.

It seems a Thunderbird update has clobbered my configuration, and for
reasons of the corporate merger, @tibco is still our probably accounts.

I'll see about fixing up.

~Andrew

