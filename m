Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEEE9669D6
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 21:33:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786602.1196197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk7N1-0003tR-63; Fri, 30 Aug 2024 19:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786602.1196197; Fri, 30 Aug 2024 19:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk7N1-0003r3-2R; Fri, 30 Aug 2024 19:33:19 +0000
Received: by outflank-mailman (input) for mailman id 786602;
 Fri, 30 Aug 2024 19:33:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YGfl=P5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sk7Mz-0003qx-1j
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 19:33:17 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b36ad83c-6706-11ef-99a1-01e77a169b0f;
 Fri, 30 Aug 2024 21:33:15 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a8677ae5a35so236352366b.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2024 12:33:15 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891da22bsm244749466b.182.2024.08.30.12.33.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Aug 2024 12:33:13 -0700 (PDT)
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
X-Inumbo-ID: b36ad83c-6706-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725046394; x=1725651194; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kUTKmBU9MMaOEmcCXoXNsZMfgR4Ehc4WJxU3g0vHFuQ=;
        b=DvG8MURsHs9OgUnqwjDvwWMR6YLXedwy5Os2L9SmUTCMuGSxLb6rWdMtVtF2CH7yVG
         bag6bP3D5vx+EGpvJsxTwiZKnmVMmzyNXt1FzFbosUVlj8OLTji1kP5wOuV3mIFUb4Y0
         q7XZsLOZXnDC1yfR7LQjhb13iGvahDESuiciI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725046394; x=1725651194;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUTKmBU9MMaOEmcCXoXNsZMfgR4Ehc4WJxU3g0vHFuQ=;
        b=qNUS/mBP53qrAiSrhPiPtxuweWYCHOCCTWeHfOGx+c8anrhj/9RGsyWvcCVmz2vB+z
         3fdYirJvdRTeJC+SepZRxY5aTimMuXIKkbNX9h6FmBmoJ9THmSifsMlePxsnVSoQUAS9
         ClrEWZ0tvohmVq3VG8vjlKYYgUDii9j92ir42KmZKYLlyCucj1yXYUbr+VhNdwSR3m9a
         xrMJ/nWtgCxE7uST0bM9Ze3gnPNEbb0fV9koAeeYwmME2hdSM135qx5KI4JV8i5on/6+
         z2VShXNTH1hlz9ISgqGhqYp+rfFN1EwN/+AH3Yc97UOfazuGzqPcbhDbGuDPp8jTu894
         pxrw==
X-Forwarded-Encrypted: i=1; AJvYcCUrPvLpzyO8ZyB8+hZHAHI7uv3fZgXlZVaPIHq/kd0FxuNkhU6oafftWV6Conpb4lxh5GZ8EqvokLI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMC67hZ0X3QzfjAJm0Obg6CXB9d/nOgsNp6t1enTgAhVOpJ27F
	3cuW98zyvmh0p+7iS47QqM4sjIF5HedTGzQ9iv79K46cKsm9m+Fxj3W+02We5r0=
X-Google-Smtp-Source: AGHT+IEE2bxYGxUQ738mUgAXWfF2fqvmmj26ELQL7sMa1A54T+bSfomBHbiiw6Zzht9xFugXbqDYxA==
X-Received: by 2002:a17:907:3f2a:b0:a86:bb90:93fa with SMTP id a640c23a62f3a-a897fa75198mr536567966b.44.1725046394002;
        Fri, 30 Aug 2024 12:33:14 -0700 (PDT)
Message-ID: <bc04ec24-a273-408c-9342-ec37c4951f1a@citrix.com>
Date: Fri, 30 Aug 2024 20:33:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] xen/bitops: Switch from __pure to attr_const
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
 <20240828220351.2686408-3-andrew.cooper3@citrix.com>
 <116eba82-9075-4d38-86b7-6ee0001b4a87@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <116eba82-9075-4d38-86b7-6ee0001b4a87@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/08/2024 3:07 pm, Jan Beulich wrote:
> On 29.08.2024 00:03, Andrew Cooper wrote:
>> All of the ffs()/fls() infrastructure is in fact (attr) const, because it
>> doesn't even read global state.  This allows the compiler even more
>> flexibility to optimise.
>>
>> No functional change.
>>
>> Reported-by: Jan Beulich <JBeulich@suse.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
>>
>> v2:
>>  * New
>> ---
>>  xen/include/xen/bitops.h | 16 ++++++++--------
>>  1 file changed, 8 insertions(+), 8 deletions(-)
> The various arch_* forms didn't have __pure and hence also don't gain
> attr_const presumably because we deem these attributes ineffectual for
> always-inline functions? On that basis
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

It's not quite that.

The non static-inline ones definitely do need the attribute.  That's the
only thing the optimiser has to operate with.

The static inlines shouldn't need it for GCC's benefit.  GCC will
apparently (according to buzilla) silently drop the attribute if it
believes it to have been erroneous.

However, Eclair does care about the attributes even on static-inlines as
part of it's side-effects analysis for various rules.

Therefore I've been putting the attributes on the APIs we expect code to
be using, but not on the arch_* infrastructure.  Whether this is the
right balance remains to be seen.

~Andrew

