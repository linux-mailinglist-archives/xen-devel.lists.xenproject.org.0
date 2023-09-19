Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA7C7A674D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 16:50:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604853.942375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qic38-00015N-Cr; Tue, 19 Sep 2023 14:50:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604853.942375; Tue, 19 Sep 2023 14:50:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qic38-00011R-9M; Tue, 19 Sep 2023 14:50:02 +0000
Received: by outflank-mailman (input) for mailman id 604853;
 Tue, 19 Sep 2023 14:50:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rlr/=FD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qic36-0000us-Ij
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 14:50:00 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce51a708-56fb-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 16:49:59 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-31dcf18f9e2so5472013f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Sep 2023 07:49:59 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l26-20020a056000023a00b0031ff1ef7dc0sm12886307wrz.66.2023.09.19.07.49.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Sep 2023 07:49:58 -0700 (PDT)
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
X-Inumbo-ID: ce51a708-56fb-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695134999; x=1695739799; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4hE7bwPjWW4X/BXoz7Ezkh4KFlLquy1qrkixf+YZYQ=;
        b=GxkW7useXSV0XygSeexhJHoNABDuORBr+BK/bTkYlOahxY+gylnsxkdanDSMnu7g1x
         9Xe2yKf8odTzqwPeZUl0/BXl5cT/6TabLwF/uot3GHCsE8uI/o7/C835e+KwD2cBiI2w
         8VM/OVlXDl7pF9emPhsZ4dcMQsNa6tdWODTOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695134999; x=1695739799;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4hE7bwPjWW4X/BXoz7Ezkh4KFlLquy1qrkixf+YZYQ=;
        b=R8I3HIButds9nssebZwerO3OpekOxFrjlhf7F1+IaVH0KTNuMTKtKDXZV79dn36asQ
         WnZLuFucNH3dDmVTt9Vxt+OzKnGuO0R5nu7tXGKnB09Tdw93LSlQq9tXgdLvrns6UWLp
         6QridASOUukimsK93CeNdahq3fc7/LA8DM4Ka7shUjLT9pPlHU5TZ8lFTXQ2Fh6mZqzk
         lANes1bU8HatI8cD9WitKWHPyifNcVSqeh3dH0K2k/6tzU6r0jSOp+boOHuCrmfU4PHf
         /xjuVPJANJd01ooJqmsvq0vup0gFJ5MkwmIoXcvK6DPHavg/cwQyAzAKwwwB29cd58Cb
         gA5Q==
X-Gm-Message-State: AOJu0YwOfGBVklC/m6KQNGNKgsGYbMsaQ/F3jGBhOIATPl2uU/k6Tppc
	lK4cqbeE6I9zDIepu6lf3gI2Rg==
X-Google-Smtp-Source: AGHT+IF4t5bbsDnDoaMWQpzZ8I5rR/QKzhBcUBaoS+MutVbtLB96PcF22KvUnvLpX3aKflMf3tuMyA==
X-Received: by 2002:a5d:6dcd:0:b0:31a:ea9a:b602 with SMTP id d13-20020a5d6dcd000000b0031aea9ab602mr9631228wrz.1.1695134998920;
        Tue, 19 Sep 2023 07:49:58 -0700 (PDT)
Message-ID: <855377db-18c7-47ee-27b6-a6dcbd586cbc@citrix.com>
Date: Tue, 19 Sep 2023 15:49:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: Fix check_ist_exit() assertions
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230919103514.1076888-1-andrew.cooper3@citrix.com>
 <a576bdac-42b2-3d62-dbf5-200fa68d7513@suse.com>
In-Reply-To: <a576bdac-42b2-3d62-dbf5-200fa68d7513@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/09/2023 12:46 pm, Jan Beulich wrote:
> On 19.09.2023 12:35, Andrew Cooper wrote:
>> The patch adding check_ist_exit() neglected to consider reset_stack_and_jump()
>> leaving C and entering one of the Xen exit paths.  The value in %r12 is stale,
>> and depending on compiler decisions may not be 0.
>>
>> This shows up in Gitlab CI for the Clang build:
>>
>>   https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/5112783827
>>
>> and in OSSTest for GCC 8:
>>
>>   http://logs.test-lab.xenproject.org/osstest/logs/183045/test-amd64-amd64-xl-qemuu-debianhvm-amd64/serial-pinot0.log
>>
>> The justification for ensuring ist_exit is accurate in the exit paths still
>> stands, so zero %r12 in reset_stack_and_jump() to indicate a non-IST exit.
> I did think of this as an option, but I don't think this covers all cases.
> If we take #DB while in a PV guest, that'll be an IST entry. Assume further
> that we re-schedule before re-entering the guest. Upon the vCPU being
> scheduled back in we'll have %r12 clear with an on-stack indication of
> having taken an IST guest exit.

This is nasty, and we would easily have that behaviour if e.g. GDBSX was
attached to the vCPU in question.

In that case, technically it's the other scheduled vCPU which is
undergoing the ist_exit, but regs->entry_vector will be different and
invalidate the check.

I guess for now I'll have to relent on checking on the exit-to-guest
paths.  I don't see any other feasible option.

~Andrew

