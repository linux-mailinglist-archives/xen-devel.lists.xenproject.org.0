Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA99ABAEC0
	for <lists+xen-devel@lfdr.de>; Sun, 18 May 2025 10:22:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.988845.1373242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGZHH-00061Q-PB; Sun, 18 May 2025 08:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 988845.1373242; Sun, 18 May 2025 08:21:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGZHH-0005yS-MO; Sun, 18 May 2025 08:21:47 +0000
Received: by outflank-mailman (input) for mailman id 988845;
 Sun, 18 May 2025 08:21:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uGZHG-0005yM-Po
 for xen-devel@lists.xenproject.org; Sun, 18 May 2025 08:21:46 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 223a630e-33c1-11f0-9ffb-bf95429c2676;
 Sun, 18 May 2025 10:21:44 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a3673e12c4so469151f8f.2
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 01:21:44 -0700 (PDT)
Received: from [172.18.118.114] (ip-185-104-138-24.ptr.icomera.net.
 [185.104.138.24]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca88990sm8815311f8f.68.2025.05.18.01.21.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 01:21:43 -0700 (PDT)
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
X-Inumbo-ID: 223a630e-33c1-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747556504; x=1748161304; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f5Q2VhUrKh64of+oRNqXiqXSIUuzb+feTKvi2o4J1Ig=;
        b=McUYVn3HbKPGtLXBAYFuk5AQ657xFxeWwhHKAjykgqtnemH9GulhNdks1NN0FHGSp/
         3zTuY2GCOSom1tzQDnkhNUIr+/pXQDp3NU6OuDv0atJjVz9kMUbEkM13W+KLO225uksl
         IGxbbJxloe/cNtIFsPCazPq4dqhjVknMbqsYr8h04fpFV+4sYxCfbCie4YwySl+PiG4M
         lyUgjn0nuZWuW3kG/BHKTodneFd0Xpgxd5osscBrrN7TU1IF8/1qusv327WHncEki/R3
         MZoBVbsZk8ubuwI+VkN4C0PejXkq9kum/8wuacvFQG7yDCyiEbL3NmOrRDg2uuTRM/sZ
         ZndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747556504; x=1748161304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f5Q2VhUrKh64of+oRNqXiqXSIUuzb+feTKvi2o4J1Ig=;
        b=s4bTnnOaBht8q+lw0kWatNu9Absl2BCA2y+/T5JfSxO3CcecZP21FaP4yvOeeH87e2
         EJibtS1IsLxE5Sd0P/sKbCypHz3lqneZgfAVFiPmyKx4CEutdQfXfE12JNRM2bFIMxrS
         YQLQC9VWtB1gl9tVoK1O5Df1OGvDFUd1vvJGSXkd9u7j7Wx+Sbj+vWPQn9KZZhNQcRcl
         zCMVwU40aHdph/a8nikXEveC+z1jzT7xRRG/Hxi0gZz/TC93JL2T+MPy2RXa+PxrCCLS
         yb9tXwrY+bB1Qtb3RxTaHamfp/wTbVNQtrw2uvdRKWzJ/Z18n3k/9ngmkR8Aj7T+wMDy
         8rlw==
X-Forwarded-Encrypted: i=1; AJvYcCWiP3k4xJO975f4hYc5O6+0HUGcH0+BEm+TrZcSrZnaboxSMgY9su7Rt0xJbFJRVohJbnJGP/QuVuM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzyj0wNiJ1ujokScoahCoqDGrrf1p0aAhilXsqQ95kOzRX4Mjqs
	qmihx9983x6sMZ76bBIwSH4WL3J8uqCDX67RjDCuFt1mvYPS4cIdH47SFuw96uxfPQ==
X-Gm-Gg: ASbGncsBCqD+llMglZyyufvhIrFCWiomkvA/xekViurAUqo9G2TE0OmyVCajGGHvUNc
	l++MLokNGR56oxVxrWguTzaUxFTFHvMQnczZ3f+VT6UHvWJAln9pOmZPKsgAQXvcPCFOwK0cN+s
	kh7i21sQ2FV4d/APwI4ZVHiMNByGp9rW4b8hboGT4R867h1tBIHOkATAQVv/krXYWIwKDtmGYkE
	aUY5BG0YCFz7GR1rwj78xiN1AGl827WA4DshP8m91JosTra7clwmA1NBNfDoKFro2EMMrpV2Wnb
	QlJorPX/mS1Nc7vVUwxHsSfrvXNfS717gg/bSNSN34zNcEHcsWQxIBehDGZe8nARVw4MQMDPELK
	e7HFzpLEUFg+Ag7T7aShlpHd6jB0AKFn5PuE=
X-Google-Smtp-Source: AGHT+IG4uWMv7xbl8vCbrEEEh9U66iwFwzMuX34cGCaIHJl6GsVfWHFHmS+R0ucJmYszPxeIRjGFGw==
X-Received: by 2002:a5d:64ee:0:b0:3a0:b72a:b36 with SMTP id ffacd0b85a97d-3a35c84bd82mr8129808f8f.36.1747556504018;
        Sun, 18 May 2025 01:21:44 -0700 (PDT)
Message-ID: <faba36cd-87a0-4e2e-ae63-0ec65f27b509@suse.com>
Date: Sun, 18 May 2025 10:21:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/stubs: Consolidate the stubs infrastructure in
 asm/stubs.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250516133326.49587-1-andrew.cooper3@citrix.com>
 <4a1a8582-7503-49ca-8d34-bce3e101734a@suse.com>
 <87a0546d-d2e4-4042-b34a-e35e2605123b@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87a0546d-d2e4-4042-b34a-e35e2605123b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.05.2025 15:49, Andrew Cooper wrote:
> On 16/05/2025 2:41 pm, Jan Beulich wrote:
>> On 16.05.2025 15:33, Andrew Cooper wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/x86/include/asm/stubs.h
>>> @@ -0,0 +1,37 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +#ifndef X86_ASM_STUBS_H
>>> +#define X86_ASM_STUBS_H
>>> +
>>> +/*
>>> + * Xen has several per-cpu executable stubs which are written dynamically.
>> This puts it pretty well. Yet in principle there may be further, perhaps
>> entirely different stubs in the future. Hence stubs.h feels a little
>> generic. What about exec-stubs.h?
> 
> stubs is quite generic; in fact, that was my feedback for struct stubs.
> 
> There is something to be said for the header file to be the same as the
> struct you want from it.
> 
> What did you have in mind for "different stubs"?  The only thing that
> makes these special (i.e. not regular per-cpu data) is that we need an
> executable mapping of them.  So, while I think it's reasonably likely
> that we'll gain other uses (although, we're losing LSTAR/CSTAR when FRED
> is enabled), I'm less certain what non-executable stubs would look like.

A while after having written my reply, I started wondering myself. Likely
we wouldn't normally call anything non-executable a "stub", so please
disregard my suggestion.

Jan

