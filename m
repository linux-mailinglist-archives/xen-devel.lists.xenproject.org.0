Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C82392A00B
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 12:22:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755270.1163582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQlVG-0008To-HI; Mon, 08 Jul 2024 10:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755270.1163582; Mon, 08 Jul 2024 10:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQlVG-0008RX-ET; Mon, 08 Jul 2024 10:21:50 +0000
Received: by outflank-mailman (input) for mailman id 755270;
 Mon, 08 Jul 2024 10:21:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DP+Y=OI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sQlVF-0008RR-6j
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 10:21:49 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1d8a302-3d13-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 12:21:47 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a77c0b42a8fso521849966b.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 03:21:47 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58fd6c67567sm3642612a12.21.2024.07.08.03.21.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 03:21:46 -0700 (PDT)
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
X-Inumbo-ID: e1d8a302-3d13-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720434107; x=1721038907; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eyvsG5+mdls2Rqr+aBjJCNOU8DoDuwP2mw7vAvx3Y9w=;
        b=L4lEDH3oqIBFxQ5xiQuSV5bmU0M8V2aQJgsMUKRHLLXWwoDv7Zo8Kwtxr/ONQdtu4L
         CrFJwn3kYIZFU7G3iqtq4DMzUKkXxpCwQVOIZXfqMnS2J/1UymHL84jD87G2p8agw7Wv
         FGMWNDW10efhsYdK+AHrxtfCh5ye72XNK7wO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720434107; x=1721038907;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyvsG5+mdls2Rqr+aBjJCNOU8DoDuwP2mw7vAvx3Y9w=;
        b=Juu1hMr3QUbKmNvO6ue4U1MijCZnoqWsQ3NzOcKkoVnavwmEPuDXBYbzzevkZy1umx
         koemIl9TYogfNGsVw+D0IbKRhkontNL7X4mr2MZ3hi95e/Y3S6Gtd7gSLiA/x5/GiNrk
         WekKyZ15w7P6I3F65kwfwP2kIrKZzGSseA+uQgRC6BQYZcEEJ5SZtX308Fm3ffT5UuCb
         Y1aEG4sxdIpPxR/H4Ob4rtmDgFvbP7qmyS2oLnyigb9cwCyEUq5kSu6LSn6GmkyH/xsp
         GXihsca2WhHhMYqLmF8l5K33yMnc2T4Ug87h+1xGorhA6yAye0mBit6bBiVmjf2BWz4L
         4qiw==
X-Forwarded-Encrypted: i=1; AJvYcCXDK6pDkURVH3qqKZS07a6PDiHzh2uHOpH5jYL8g3oa/1d4r5A4t2rcIIt5ac494iyRAhQcc3luyuikg8dsZwjnwobIIzVhcntkokZwQ/Y=
X-Gm-Message-State: AOJu0Yx2jhIuhQHSaX52kDZHZOK5P73QZI9HuIeep4zESE3yCISfzgWC
	lRHthsGCuBNYrNCHnX8UBimlwvd0ZOf2FD/5tEl3irBEn2FCLXZNtA5gPxlgO1Y=
X-Google-Smtp-Source: AGHT+IG4D8hSNBLKpLKucR9VEOenhRV7yHZo7zi4/W8b3iFRDM34QABbWUB6Aotrc4X6vlNUIkuU/w==
X-Received: by 2002:a17:906:3698:b0:a77:b7fe:66c8 with SMTP id a640c23a62f3a-a77bd9e46b4mr886930866b.15.1720434106981;
        Mon, 08 Jul 2024 03:21:46 -0700 (PDT)
Message-ID: <431e9e51-6cbb-42ec-b6c5-f1f35d5d85bc@citrix.com>
Date: Mon, 8 Jul 2024 11:21:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 6/6] build: Drop xorg-x11 as a build dependency
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240705152037.1920276-1-andrew.cooper3@citrix.com>
 <20240705152037.1920276-7-andrew.cooper3@citrix.com>
 <afec5c5c-8de8-4795-b470-ec78339f982e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <afec5c5c-8de8-4795-b470-ec78339f982e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/07/2024 7:49 am, Jan Beulich wrote:
> On 05.07.2024 17:20, Andrew Cooper wrote:
>> The history on this one is complicated.  The note to README was added in
>> commit 1f95747a4f16 ("Add openssl-dev and xorg-x11-dev to README") in 2007.
>>
>> At the time, there was a vendered version of Qemu in xen.git with a local
>> modification using <X11/keysymdef.h> to access the monitor console over VNC.
>>
>> The final reference to keysymdef.h was dropped in commit 85896a7c4dc7 ("build:
>> add autoconf to replace custom checks in tools/check") in 2012.  The next
>> prior mention was in 2009 with commit a8ccb671c377 ("tools: fix x11 check")
>> noting that x11 was not a direct dependcy of Xen; it was transitive through
>> SDL for Qemu for source-based distros.
>>
>> These days its only the Debian based dockerfiles which install xorg-x11, and
>> Qemu builds fine in these and others without x11.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> There may be one more past dependency, but I'm not sure since I don't know
> the package split in the distros you touch files for. In unmodified_drivers/
> (removed in 4.14) there was a use of the lndir utility coming (on SUSE
> distros) in xorg-x11-util-devel. Then again unmodified_drivers/ may never
> have been of any interest to gitlab-CI.

Huh.  I've not come across lndir before, but we've got an opencoded
forms of it in several places.  (tools/include, and
tools/firmware/xen-dir, maybe others.)

Still - as a build dependency, it should be the main xorg package, not
the *-dev{el} package.  Whether a dev{el} package pulls in the main
package is distro-dependent.

4.15 is the oldest tree we test in Gitlab CI, and I don't believe we
built unmodified_drivers/ in prior versions either.

Either way - I don't think this alters the outcome of the patch.  I can
add a paragraph to the commit message noting that there might have been
another unspecified dependency on xorg ?

~Andrew

