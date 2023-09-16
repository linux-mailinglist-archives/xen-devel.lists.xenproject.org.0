Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739957A30AD
	for <lists+xen-devel@lfdr.de>; Sat, 16 Sep 2023 15:40:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603595.940640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhVWL-00028x-4H; Sat, 16 Sep 2023 13:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603595.940640; Sat, 16 Sep 2023 13:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhVWL-00025Y-0I; Sat, 16 Sep 2023 13:39:37 +0000
Received: by outflank-mailman (input) for mailman id 603595;
 Sat, 16 Sep 2023 13:39:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTkj=FA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qhVWJ-00025S-0b
 for xen-devel@lists.xenproject.org; Sat, 16 Sep 2023 13:39:35 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 774cd4d0-5496-11ee-9b0d-b553b5be7939;
 Sat, 16 Sep 2023 15:39:32 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9adc75f6f09so247843166b.0
 for <xen-devel@lists.xenproject.org>; Sat, 16 Sep 2023 06:39:31 -0700 (PDT)
Received: from [192.168.1.10] (host-92-12-44-130.as13285.net. [92.12.44.130])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a170906481200b0099329b3ab67sm3765760ejq.71.2023.09.16.06.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Sep 2023 06:39:31 -0700 (PDT)
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
X-Inumbo-ID: 774cd4d0-5496-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694871571; x=1695476371; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0WVR1ZfQmnoXTH+rRhZVDJGEv5xsoTIUhGtnLKQdZmM=;
        b=MSbV8oW4twdNCzqkOHuJDVnXO7VRjksaLR5h1aECRxA2n9A9PWuuSaDTS8WDLVguzf
         H2R90Aw7+4uxJW/eSMWLw4qzBthea97PpAOA4/0SllrC7Oxk/eUBCnZMDaHnV12neBie
         8oG2X5jr4fTs+xQWhMgJLiGoS5zY4inD4Np0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694871571; x=1695476371;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0WVR1ZfQmnoXTH+rRhZVDJGEv5xsoTIUhGtnLKQdZmM=;
        b=kEllHjvgXcdcxM8Pe/wsGfIN5JNd4IG+5nl5SvHrmHGo0/epyXAM8L+NU+VTWQKSIC
         DKPv6Sp8inVIuzn3zFo+kMzVpApZ7UPerF/81SxcSbWwhCj8bFqG+adKs5CEdpJGdJvA
         gVsbOHMZBdI1JQknir6ZJK3YnQy5BaxQIVhk8Hs8wQUaDmiKCZcxkOzu2cHArxXn+Mt0
         bgjmQQrBbz4qGKtyliBFDLy/jzg3XWJZLp3mLZQRZDVoteKSsms4rKeFrgY5IwgsidIz
         L4VmhjUP7+iD71iDIcxIpzvemgPK4pGlvcSEpfRNkk9nEi0ZU17SR6+O1atZhjEDvPIe
         pTEg==
X-Gm-Message-State: AOJu0YySsQ9+VD3nHb+Z6VF4JyuPZqAVL/TQe3taYttprosqn2oY4ILj
	mYRmAvfBJU3T9eElfnBo7E7bIw==
X-Google-Smtp-Source: AGHT+IEyZaa0HbBRw1p4liNj89QqQ6EruCz64a+ocP9xOYVi3XS3JiHNWoTL5KRlMld37j/Gom5mHw==
X-Received: by 2002:a17:906:1092:b0:9a9:e5bb:edc5 with SMTP id u18-20020a170906109200b009a9e5bbedc5mr3998326eju.65.1694871571399;
        Sat, 16 Sep 2023 06:39:31 -0700 (PDT)
Message-ID: <67872b7c-4155-1298-9dfe-0b8f5b977606@citrix.com>
Date: Sat, 16 Sep 2023 14:39:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 7/7] x86/pv: Rewrite %dr6 handling
Content-Language: en-GB
To: Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
 <20230915203628.837732-8-andrew.cooper3@citrix.com>
 <0aee121e-a2ac-1c6c-be33-59d842419708@gmail.com>
 <17514c61-a561-b5a7-8b8f-8c3d8dbd845f@citrix.com>
 <4671299c-0fae-0744-cf53-0cce89bf764c@gmail.com>
In-Reply-To: <4671299c-0fae-0744-cf53-0cce89bf764c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/09/2023 2:10 pm, Jinoh Kang wrote:
> On 9/16/23 21:56, Andrew Cooper wrote:
>>>> -    /* Save debug status register where guest OS can peek at it */
>>>> -    v->arch.dr6 |= (dr6 & ~X86_DR6_DEFAULT);
>>>> -    v->arch.dr6 &= (dr6 | ~X86_DR6_DEFAULT);
>>>> -
>>>>      if ( guest_kernel_mode(v, regs) && v->domain->debugger_attached )
>>>>      {
>>>> +        /* Save debug status register where gdbsx can peek at it */
>>>> +        v->arch.dr6 = x86_merge_dr6(v->domain->arch.cpu_policy,
>>>> +                                    v->arch.dr6, pending_dbg);
>>>>          domain_pause_for_debugger();
>>>>          return;
>>>>      }
>>>>  
>>>> -    pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
>>>> +    pv_inject_DB(pending_dbg);
>> ... this, which will merge all new pending bits into the guest's DR6.
>>
>> If the guest chooses not to clean out DR6 each time, then it will see
>> content accumulate.
>>
>> To your earlier point of shadowing, we already have to do that.  DR6 is
>> just one of many registers we need to context switch for the vCPU.
>>
>> PV guests, being ring-deprivieged, trap into Xen for every DR access,
>> and Xen handles every one of their #DB exceptions.  This is one reason
>> why I split the work into several parts.  PV guests are easier to get
>> sorted properly, and patch 1,2,5,6 are all common improvements relevant
>> to HVM too.
> That confirms my knowledge.  Honestly if I got such a foolish remark
> I would question the reviewer's understanding of PV mode (not that you did
> anything wrong).  Sorry for wasting your time.

Not at all.

This is exceptionally tricky, and as you can see from the v1 series,
don't assume that I know it all perfectly.

The specifics of PV guests are unique to Xen, and there are 0 people who
understand it fully.  For example, doing the sanity testing for this v2
series, I rediscovered the completely undocumented properly that a PV
guests IOPL is separate from an architectural ideal of IOPL, defaults to
0 which has the meaning "guest kernel takes a #GP for access to IO ports".

Please do continue to ask questions like this if you're not sure.  It is
not a waste of time cross-checking that the logic is correct.

~Andrew

