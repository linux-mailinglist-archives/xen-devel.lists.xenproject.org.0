Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E678D93AF98
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 12:09:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764073.1174382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWYvP-0002iM-DH; Wed, 24 Jul 2024 10:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764073.1174382; Wed, 24 Jul 2024 10:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWYvP-0002fd-9S; Wed, 24 Jul 2024 10:08:47 +0000
Received: by outflank-mailman (input) for mailman id 764073;
 Wed, 24 Jul 2024 10:08:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rh+e=OY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sWYvO-0002eH-GJ
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 10:08:46 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b64c23f5-49a4-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 12:08:45 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5a79df5af51so1362291a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 03:08:45 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30c2f88a5sm8704988a12.77.2024.07.24.03.08.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 03:08:44 -0700 (PDT)
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
X-Inumbo-ID: b64c23f5-49a4-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721815725; x=1722420525; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RHhXtf0M4XS1hQhJfCo1M7nbwTPl20P9gwGK7kao0KM=;
        b=C2Ux5rvluW8YtmArq+d/3Lr/1/sUsGPGiwRV1l1K3kdlKsyO3Mi5+al5bkkLJ42AyS
         fojvYjgRhoRC2dNxjO2Fx/fNHu2DyyCoy0EzeTPfEV4ZjjjeD674wRWCqrO9GCmLjN69
         fS5UzlAzsDye/ITSBTmuvIiY/xZIFezlpbEcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721815725; x=1722420525;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHhXtf0M4XS1hQhJfCo1M7nbwTPl20P9gwGK7kao0KM=;
        b=cEg7z0WOxg3N/rl01Ey9aVLQF1dtmOpsC7IIuknqPm6jPwIoKgOQfjw9APct+SQmYW
         +mDyNqtBu7RJ1i9pi+W4lBqSxIN962z5eWR5E1TiQVRoKly1EjMfQ1vheygf7/f+ZYqT
         ffkpIrlp/0UKME7Na2IB7Lk32MMWj4+ALjfF2mExROOKEpeRYFMzgqVep1pn1/Ow2/1z
         RMhcjGnNL0Ps2XL2B2DiPy4Z5t/gShZh6CUd9P1MIgCN9VG1SjlVGXgpSUXMnL2zVdHA
         ks8uupHX0vz0l7fhGobLE3xgyCzQoTp6Z6BZe15eH5tmmkqQwr0gPcG3IlMr33bHuyRs
         eIVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUFofi31q3PSUFnTf9Xp54XM16JI2bdblzakR+UwkYfV1UmCNqBUcgSP7qsdorkD6lRsj7hEXbDTbfazMjEFNvxOlSFQUWaMX7+dRNEdc=
X-Gm-Message-State: AOJu0YyjoHEdZHplOLs2OEpcdvFsK58hs/7zYUPzw4edJSldv8h/WpyC
	CvxLvDpdQSqqUBWQ93tWTQf1hzqkwIPEsiAR8BozAjEHBBjkXH8DZcXN0fM48C8=
X-Google-Smtp-Source: AGHT+IFtiAHcWWbsn22jOsjc2WE2dcCIcsHLZqIhNWm5dIcEH0/XqtyBho4xuOAuj6ZhJ5OC1r7taQ==
X-Received: by 2002:a50:cddd:0:b0:57d:4692:ba54 with SMTP id 4fb4d7f45d1cf-5ab1a4c106fmr1136391a12.6.1721815724923;
        Wed, 24 Jul 2024 03:08:44 -0700 (PDT)
Message-ID: <2e133087-bc2d-47f8-be93-3a356f7b2d0b@citrix.com>
Date: Wed, 24 Jul 2024 11:08:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/IO-APIC: Improve APIC_TMR accesses
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240723203701.208018-1-andrew.cooper3@citrix.com>
 <14104805-0f0e-4741-877f-24afffc816ce@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <14104805-0f0e-4741-877f-24afffc816ce@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/07/2024 8:56 am, Jan Beulich wrote:
> On 23.07.2024 22:37, Andrew Cooper wrote:
>> XenServer's instance of coverity complains of OVERFLOW_BEFORE_WIDEN in
>> mask_and_ack_level_ioapic_irq(), which is ultimately because of v being
>> unsigned long, and (1U << ...) being 32 bits.
> Which of course is bogus when the shift amount is masked down to 5 bits.
> May I ask that you express this somehow in the wording.

How about this?

Coverity's reasoning isn't correct.  (1U << (x & 0x1f)) can't ever
overflow, but the complaint is really based on having to expand the
RHS.  While this can be fixed by changing v to be unsigned int, take the
opportunity to better still.

>
>> Introduce a apic_tmr_read() helper like we already have for ISR and IRR, and
>> use it to remove the opencoded access logic.  Introduce an is_level boolean to
>> improve the legibility of the surrounding logic.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> The change is an improvement irrespective of Coverity's anomaly, so:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

