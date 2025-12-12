Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB214CB91BD
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 16:26:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185488.1507605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU51I-0001w8-1v; Fri, 12 Dec 2025 15:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185488.1507605; Fri, 12 Dec 2025 15:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU51H-0001ug-VI; Fri, 12 Dec 2025 15:25:23 +0000
Received: by outflank-mailman (input) for mailman id 1185488;
 Fri, 12 Dec 2025 15:25:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JhEj=6S=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vU51G-0001ua-J1
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 15:25:22 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c49cd990-d76e-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 16:25:20 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6418738efa0so2629306a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Dec 2025 07:25:19 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64982040e2bsm5517984a12.6.2025.12.12.07.25.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Dec 2025 07:25:18 -0800 (PST)
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
X-Inumbo-ID: c49cd990-d76e-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765553119; x=1766157919; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qsx71SfY8ENXmCY+aS8orXuS6MifDjwJC6JXAXxzUfg=;
        b=Ofqz/ZPaa8rrYbU4foK5Kld2Ex5zQcgpfVeRrygfPm8hCpTN3XxpfKNHs4QDon+kN+
         sDxzJbQQ0kUrnb06zqHCPhzQEU8G7Zj2aM10rZ5xITePJOhMxubnOAqIApxInwMJGKCx
         fluIe4gXeH4aIOw8LlBQoHf3mJSAXtUFfCO6osOUz2lvTgVKOv+wfYx4K7uL+x+FNIOL
         ta09JWl6xZif+CI1vx0jVkCdYWjrwVYVZXqqlWd03XpyIWPuvjLNwUasZRyKPpg5KXr+
         kAj4ac2tGAfHR/O0Se+autlbXCDIvBhtTyjfYD/cZ4LlUbgPNPPcYDTCO18LbvXmsLGJ
         LUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765553119; x=1766157919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsx71SfY8ENXmCY+aS8orXuS6MifDjwJC6JXAXxzUfg=;
        b=jCqFLTZF7qBL5NtqsYfbtghTgZ/4YuhsgHp89Ej4Rkw0rqymII78ysXD6SxlRh+y2c
         Fz1Fxb1ZQNHm7H4a7zf69WWvBYjxjO7t4vYWixpKjhPTwnd3k5qXNaAY0b6J4TsPW8V5
         9MVCUJBBSgMVFtoAOiu1/bQg+FOLY9dFDkNklAuBvW6mGKZY/xkP8pD4oglfKx4lLL93
         bHYNAEqzz6/KJtUYTmIhXq/+iQUgGo4qWa6MuiGNu3IGKSrMeKvSAy+xCM2ogHf8naNw
         vdZHqpfOZi/foyH9YfHdQpTpCVITG2tFZEVbrYF04O5ymeNkPH6IT+yYfFFyb0iZsHRC
         QSmg==
X-Forwarded-Encrypted: i=1; AJvYcCVmyqh5MPpGGIjREvzmG2XP84B04DWBiApMi5+M28SsScUmZQMRQN5xhAVVmhexZeRqaMCZoquC0ek=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMXDOaiyWHFlOrBL+47fVj9xsBvSQk4TVsE8KxZOyh6fAoAfE5
	wlC+XfGaiCGyCL859NDR6zpiLaTsW8mrUmNTfFVOpjnUVYe3FL4/bpZg
X-Gm-Gg: AY/fxX78Pj85eMXcTATb5fsJCBsXSOyYBORVfV/6nBsw795rmUGJ4qxRPLGfxbYk1di
	Dyg6jMjaq6ulHO5YIiZ1CG0e0q4I78thTuIYdH4rY4RFKG3LofWKNaO8Z7rl3lrbmof2C0o+q2H
	XLWsgAudoL9o2RxQd1odQv57XcfFgqtj9aALH4tVGgcVIuVJs/3fqooAoAg0bQ54NfStT45PVEe
	9CKM4BvBhmebpZCBHwX2f5SfPOGUf8xRWmrLVCIvl2kCpZ/mFs3TdA67Wa1f5A3VluMHxkmgW6q
	FJaMMX+UJvI9lg3xDikljVw0bj4YNB+x/E+qNvNuRsnhRU8RNe94ufmhVovJeDw58T/4pOASuRe
	QWbaIJKNwMo9yR5/9oIyNfaSyI3K50OIc/nslkAo4t91OXzBF81wkZ4ddzrHunj5Lq3CWijzzFq
	yq0sgljbt7bqDPyk2V7ynGHQNgc0aIyoWJ5vPrvOwDnsk7JCj0t3LhCUqRZezg
X-Google-Smtp-Source: AGHT+IGp2DjCLvtutjD4U7N8WcKeRA8y6iGg1Yzc39Atqf8sU3QphKZmY0xKmSCu6+K5otLdCdNjPQ==
X-Received: by 2002:a17:907:608d:b0:b77:1d75:8b78 with SMTP id a640c23a62f3a-b7d23cb3a2fmr259807166b.53.1765553118314;
        Fri, 12 Dec 2025 07:25:18 -0800 (PST)
Message-ID: <5154e129-675b-4027-b97f-257559c7ea50@gmail.com>
Date: Fri, 12 Dec 2025 16:25:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen/riscv: add RISC-V virtual SBI base extension
 support for guests
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <275721bc-07c2-4f69-93c2-e6d3022fee4f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/8/25 4:15 PM, Jan Beulich wrote:
> On 01.12.2025 11:24, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/arch/riscv/vsbi/vsbi-base-extension.c
>> @@ -0,0 +1,52 @@
>> +
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/lib.h>
>> +#include <xen/sched.h>
>> +
>> +#include <asm/processor.h>
>> +#include <asm/sbi.h>
>> +#include <asm/vsbi.h>
>> +
>> +extern unsigned long __ro_after_init sbi_spec_version;
>> +extern long __ro_after_init sbi_fw_id;
>> +extern long __ro_after_init sbi_fw_version;
>> +
>> +static int vsbi_base_ecall_handler(struct vcpu *vcpu, unsigned long eid,
>> +                                   unsigned long fid,
>> +                                   struct cpu_user_regs *regs)
>> +{
>> +    int ret = 0;
>> +    struct sbiret sbi_ret;
>> +
>> +    switch ( fid ) {
>> +    case SBI_EXT_BASE_GET_SPEC_VERSION:
>> +        regs->a1 = sbi_spec_version;
> Wouldn't this need to be the minimum of what firmware supports and what Xen
> supports / knows about? (Assuming backward compatibility among the spec
> versions of course.)

The base extension is mandatory (according to the spec), and based on some Linux
commits from contributors to the OpenSBI spec, it is also intended to allow
backward compatibility and probing of future extensions (although I was not able
to find this explicitly stated in the spec).

However, none of this guarantees that everything else is backward compatible.
For example, the entire v0.1 SBI has been moved to the legacy extension, which
is now an optional extension. This is technically a backwards-incompatible
change because the legacy extension is optional, and v0.1 of the SBI does not
allow probing.

Regarding what should be written to|regs->a1|, I think you are right: it should
be the minimum of what the firmware provides and what Xen supports. Otherwise,
if|sbi_spec_version| is set to 2.0 and we return 2.0 to the guest, the guest might
try to probe the DBGN (which Xen does not currently support) extension and use
it instead of the legacy extension for the early console.


>> +        break;
>> +    case SBI_EXT_BASE_GET_IMP_ID:
>> +        regs->a1 = sbi_fw_id;
>> +        break;
>> +    case SBI_EXT_BASE_GET_IMP_VERSION:
>> +        regs->a1 = sbi_fw_version;
> Same concern here, but see also below.

For SBI_EXT_BASE_GET_IMP_ID, I think we want to return XEN id which is according
to OpenSBI spec is 7.

Something similar for SBI_EXT_BASE_GET_IMP_VERSION, maybe we want to return Xen
version code (XEN_FULLVERSION).

>
>> +        break;
>> +    case SBI_EXT_BASE_GET_MVENDORID:
>> +    case SBI_EXT_BASE_GET_MARCHID:
>> +    case SBI_EXT_BASE_GET_MIMPID:
>> +        sbi_ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
> This may be okay to do for the hardware domain, but hardly for DomU-s.

I don’t see an issue with returning the vendor, microarchitecture, and
processor ID. This is essentially what other hypervisors do.

What would be better to return? Returning 0 could be an option, and according
to the RISC-V spec:
   This register must be readable in any implementation, but a value of 0 can
   be returned to indicate the field is not implemented.

So returning 0 would simply indicate that the field is not provided for case
of DomUs, and provide it for hardware domain.

Would it be better?

>
> Same concern for SBI_EXT_BASE_GET_IMP_ID.
>
>> +        ret = sbi_ret.error;
>> +        regs->a1 = sbi_ret.value;
>> +        break;
>> +    case SBI_EXT_BASE_PROBE_EXT:
>> +        regs->a1 = vsbi_find_extension(regs->a0) ? 1 : 0;
> At least for hwdom doesn't this also need combining virtual and
> underlying physical lookup, if for some extensions you may pass the
> requests down to the physical one (as done above)?

I think I understand your intention, but I am not 100% sure that we need to
perform a physical lookup. There may be implementation-specific cases where
a call is emulated by the hypervisor instead of being passthroughed to
OpenSBI.
In other words, it could be the case that an extension is fully emulated
without requiring support for the corresponding physical extension.

~ Oleksii


