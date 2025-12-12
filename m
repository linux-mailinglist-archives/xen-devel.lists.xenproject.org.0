Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 303FECB9435
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 17:32:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185555.1507665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU63D-0006Dn-0S; Fri, 12 Dec 2025 16:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185555.1507665; Fri, 12 Dec 2025 16:31:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU63C-0006BU-UD; Fri, 12 Dec 2025 16:31:26 +0000
Received: by outflank-mailman (input) for mailman id 1185555;
 Fri, 12 Dec 2025 16:31:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JhEj=6S=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vU63C-0006BO-7I
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 16:31:26 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffeaefcc-d777-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 17:31:24 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b76b5afdf04so262533066b.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Dec 2025 08:31:24 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa51754dsm622749966b.42.2025.12.12.08.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Dec 2025 08:31:23 -0800 (PST)
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
X-Inumbo-ID: ffeaefcc-d777-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765557084; x=1766161884; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jvKp9TljLAXn1f5nWZJFoBGlgtdsyUZLz01HqZ1Isqo=;
        b=maCFJUzmKIpxy58tkZoD67h92veFsh7bXXR4/ruZvcetyGl1ISUu9Luh+LI2GZqOtt
         h054aECT7uMk9RzMlqX7j0WciSpbJR5JdwnSQKNZSIdGRAkdsWFUkSXVouLxk+XTs7tF
         R4uVJRiG+byYtSGiIapmNCUd3bTBYjcG7swWrE/DGqpGmfZF+MNEw5aduKpMGXy6V1Yz
         jGszRRS4Ua2TUAtWrHlfo/IUnqx72IX45K5gJc7SA3Bh3jWFplbI/J68xcVt8VFWJ6g5
         KsQAkx16y+IX0jhW/PliYuUOFAx/ZJlCvAdZRV/zFy0v3GGw9qopb2xtQzDLSoqehnLs
         i9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765557084; x=1766161884;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jvKp9TljLAXn1f5nWZJFoBGlgtdsyUZLz01HqZ1Isqo=;
        b=HyM1nKXY0kvOvonGyKzx5VfwmaKluVnTVMJ5MvuZrOx6Fj6xaVmhllsQ0pv90qUygK
         rpTjcMtLayAdr76LS9q43zmRcKVq7Le4NHqHK6q/Je5hCKBFxfdsfaLuzwZkHwgQjxiH
         DxSKYdOcHtI65S6KVLFs80hWC0hciyP72RltbP2HK6tyyfUQ/aegG6ydbI3E5OD8aM3D
         lFeLqbHNcR6U0DSum5FgtjtTO9H5t4Ci0CDkmqfPRXBzNxfCtXedT1xogmDX6fDd4l01
         IVIKmRo/C1IvVXi7sr+zPJkjciJSOPqxfL1GQx55VmnVPLKZs0mpuwh/hVqLz1lGmz8n
         d73A==
X-Forwarded-Encrypted: i=1; AJvYcCWC+DHnAafLRyer15mB0mg94D6bUvaD7HH2FTR+Aw1L3iXFff+4I0CmrZHc9KMiBsg4wJHt5HqRWjc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwgkQLURyqEODIcjk1tsqz3NCBUDWWyG85fUSxpsXxHomCURcTG
	VPlMuYSBTgAOhW8HddZFvWbM3OOKgsMHtwofaP8QkT+efIYu0WWxAguW
X-Gm-Gg: AY/fxX5Pg47IW+GUMFGnNAIPvTrpEB2RH7MOZZBIm3TonYX0Q3uQVfr410O/6IilEdw
	yZnni/jHUCsqOC0yPiinFr2TM3JyCfa1NLtMqE5N3frIVkr5LOYaCtw4miUveVoe2ntwKNvHv+e
	xmibRXcrXeDJv7LIv32TOBm2h650h4bKVh8wVz1SZnjSfv5B75avRhNbagGjWGxOjybbqoXrMxh
	sxGZwbzTV6mqyHpFYJDuTRqlCyWurB//UupTSOlJ0f7s1unxFK0amGQjulsINFL3cwCt2YTe8Bf
	4jNKumzv/vfpdUN/ohEoDxYatCCqKACjMVphaK9mxdY9lYpWp7PSrk9V71wl90gSVJ3wbEohrRQ
	Jb8SWPodB/trumHl6DqcE7mblL4ARMJpxwo0QU5QgJyE1SrjzRNxpRlOHD+MOVuyTdDplNeCKF4
	oPZBNgQrXd6Ex9CQomhH6YN/ucD5f51zBgcl6CyzJ48nh4ctELbByOdTGRR56vXnl/IK0LP+U=
X-Google-Smtp-Source: AGHT+IFNT6lKz4U6/bCSbYWIXznTxQpb7xfEzHXr9YduNTPEuMTJNyRC9ZIAWfGi4lJN0fc6b+AcEg==
X-Received: by 2002:a17:907:d22:b0:b76:b76e:112a with SMTP id a640c23a62f3a-b7d235c7f18mr248045466b.11.1765557083664;
        Fri, 12 Dec 2025 08:31:23 -0800 (PST)
Message-ID: <23de700d-7ffc-44ac-a8fe-22e69aaaaebf@gmail.com>
Date: Fri, 12 Dec 2025 17:31:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen/riscv: add RISC-V virtual SBI base extension
 support for guests
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1764582112.git.oleksii.kurochko@gmail.com>
 <d17dcac47752681eed6703360389dd542433ab3e.1764582112.git.oleksii.kurochko@gmail.com>
 <275721bc-07c2-4f69-93c2-e6d3022fee4f@suse.com>
 <5154e129-675b-4027-b97f-257559c7ea50@gmail.com>
Content-Language: en-US
In-Reply-To: <5154e129-675b-4027-b97f-257559c7ea50@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/12/25 4:25 PM, Oleksii Kurochko wrote:
> On 12/8/25 4:15 PM, Jan Beulich wrote:
>> On 01.12.2025 11:24, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/vsbi/vsbi-base-extension.c
>>> @@ -0,0 +1,52 @@
>>> +
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#include <xen/lib.h>
>>> +#include <xen/sched.h>
>>> +
>>> +#include <asm/processor.h>
>>> +#include <asm/sbi.h>
>>> +#include <asm/vsbi.h>
>>> +
>>> +extern unsigned long __ro_after_init sbi_spec_version;
>>> +extern long __ro_after_init sbi_fw_id;
>>> +extern long __ro_after_init sbi_fw_version;
>>> +
>>> +static int vsbi_base_ecall_handler(struct vcpu *vcpu, unsigned long 
>>> eid,
>>> +                                   unsigned long fid,
>>> +                                   struct cpu_user_regs *regs)
>>> +{
>>> +    int ret = 0;
>>> +    struct sbiret sbi_ret;
>>> +
>>> +    switch ( fid ) {
>>> +    case SBI_EXT_BASE_GET_SPEC_VERSION:
>>> +        regs->a1 = sbi_spec_version;
>> Wouldn't this need to be the minimum of what firmware supports and 
>> what Xen
>> supports / knows about? (Assuming backward compatibility among the spec
>> versions of course.)
>
> The base extension is mandatory (according to the spec), and based on 
> some Linux
> commits from contributors to the OpenSBI spec, it is also intended to 
> allow
> backward compatibility and probing of future extensions (although I 
> was not able
> to find this explicitly stated in the spec).
>
> However, none of this guarantees that everything else is backward 
> compatible.
> For example, the entire v0.1 SBI has been moved to the legacy 
> extension, which
> is now an optional extension. This is technically a 
> backwards-incompatible
> change because the legacy extension is optional, and v0.1 of the SBI 
> does not
> allow probing.
>
> Regarding what should be written to|regs->a1|, I think you are right: 
> it should
> be the minimum of what the firmware provides and what Xen supports. 
> Otherwise,
> if|sbi_spec_version| is set to 2.0 and we return 2.0 to the guest, the 
> guest might
> try to probe the DBGN (which Xen does not currently support) extension 
> and use
> it instead of the legacy extension for the early console.

I think we could still introduce the following in Xen:
   #define XEN_SBI_VERSION_MAJOR 0
   #define XEN_SBI_VERSION_MINOR 2
and pass it to the guest as:
   regs-> a1 = (XEN_SBI_VERSION_MAJOR << SBI_SPEC_VERSION_MAJOR_SHIFT) | XEN_SBI_VERSION_MINOR;

IMO, this should be sufficient because:
1. We can fully emulate the base extension in Xen without calling into OpenSBI.
    This covers the case where OpenSBI might return version 0.1,which is unlikely, as all
    boards with hypervisor extension support at least 0.2, and in practice even 2.0, while we
    report 0.2 to the guest.
2. Even if OpenSBI returns, for example, version 2.0 and we tell the guest that we support
    0.2, it should still be fine, as the base extension is at least backward compatible.

In other words, I think we should care only about what Xen supports and provide it to a
guest. Any concerns about that?

~ Oleksii


