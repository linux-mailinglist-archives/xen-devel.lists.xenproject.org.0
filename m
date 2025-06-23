Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B75DAAE4705
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 16:38:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022533.1398376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTiJb-0008O9-8p; Mon, 23 Jun 2025 14:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022533.1398376; Mon, 23 Jun 2025 14:38:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTiJb-0008LI-6A; Mon, 23 Jun 2025 14:38:31 +0000
Received: by outflank-mailman (input) for mailman id 1022533;
 Mon, 23 Jun 2025 14:38:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a94z=ZG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uTiJa-0008LC-4V
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 14:38:30 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9b99d70-503f-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 16:38:27 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-60c01b983b6so285573a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 07:38:27 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60a185449d5sm6150815a12.28.2025.06.23.07.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 07:38:26 -0700 (PDT)
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
X-Inumbo-ID: b9b99d70-503f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750689507; x=1751294307; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikbqEetpJuXeRpYBkQaHYywfRLiTbOC9Is/q48ZU/Q8=;
        b=UgxomK4EcgsbIyJ611ccKEpOXDlefAvTOCbtapoKC0hcpZLS35RbVnrIjKCTPt+RB3
         Ran1ZFOTklobbwvQbdC13nYCpxTHoEHGgrs7+CZ8IsSerLqlj2ldYkGV4XTlQwm4Rel0
         u66RUECHBJQaaPla5DcdrZ2As6DNMYOoO74uEyAJ+nkgANWRDNP7S95bXRUQ5J5hdRIO
         gKOpTKOTHFRD96treQtm7x/RiwgbPUdVEXzIem7TsXbon0XwisDPupqxinLIDo0Nupcx
         1+252dUrjXgt9xlE27BOONZF3/95Jkma0enkXWrXVwOp6IzqwhYajUtwfmMJ7phs9Pn2
         slOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750689507; x=1751294307;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ikbqEetpJuXeRpYBkQaHYywfRLiTbOC9Is/q48ZU/Q8=;
        b=Gk4feT527O7+u87sbgzHQGtUDH4n+HWffnp1vvub8wV0mPn/hkMBlLGOlly0C5CiOS
         PhTL2RFajVPQuOn5xU06wet2xaboUv7m/zBXz1OzW/AZPCkaTGDEPjzsP6ky8jlplHop
         sjjuOcwDYytq5TVJ+0+02zpxmGkCE3ArwegDL+DdFBK5YgEKeThVTnfCN3JNkjHQWoie
         ztPyBufgFRZyiMrQw/eS1cbo28XeQQVcCFvuAizlWa3GfKZNyopyGJZoxEKIs7CYhR8u
         yW2vmWhHsYKSGQ8i1W91JpyQ3b1lHJTw77IKVJijjC68fDFS18BbgyBBevc57W6h3ocx
         cUuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSlbYeHX7Q/Aolb04vcv555j09671pggti0HFQ0ctlZAs+sfbBQ2X0gPJM60CGH1EvNtW1/l6Fr6c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3ozJlnLhGL8/FzHpPOlFI3un7b5P928MAR+QhbDAzeidQaokh
	tDVM/gVcVdRvCQ3CbEI1Lr4tANCGxZa/LgG3VA8S+iKJ0BLYWQF2NqVG2bCInQ==
X-Gm-Gg: ASbGnctlW4jMRRMdMb7RK8A6YdYPv2b3kziLANUE2ZvedcWDQpPPvw9mmpbTyB+je88
	Vd29TiQOlThKJ/R+aM8SZI/eagUc6fhKDWRMU3bUkJIQTXLiNmV3VXKkxJB9bPnOccHVvsb9kIz
	rLbXGYwN+SQFSuClfgVrFtsAYLi8O0Uw8j96+f2IospAq3noKDl+w4Vb7S/+WreepbD+c4QYGE/
	HxcY62MntgMXyA5+qutygOyOtIVkmgapsQcBczYOkCl0GkVMALIT8GW0Ws1auGza4poAN/gzFeA
	+SThHif0S5LbF9Twwea35UY1VswN8Q0cQPJ3+wLzZXK9LjbAkTKc4oP54AEXJKDdTBri/qrOLgw
	furtiHdGt3eiytEqDTIFz5Oz5QNZsxP6Or3M=
X-Google-Smtp-Source: AGHT+IFMjXfSG/5K2lLeZfcSQHldZMt3wa0gfgMKdM9D8WWg2UFwcexbQ7l2XVhcaIhkQNTuInn4yA==
X-Received: by 2002:a05:6402:27cc:b0:608:477d:2b65 with SMTP id 4fb4d7f45d1cf-60a2409480bmr10985517a12.15.1750689507105;
        Mon, 23 Jun 2025 07:38:27 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------DZEaixMA40TFnmdeEXmlCTAk"
Message-ID: <5bc59f3e-d41c-48cc-9be6-c2918c9dc465@gmail.com>
Date: Mon, 23 Jun 2025 16:38:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/17] xen/riscv: introduce
 sbi_remote_hfence_gvma_vmid()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <5c614593a1710c737f5509ebb165efd8f857df30.1749555949.git.oleksii.kurochko@gmail.com>
 <542a4f54-705d-4f4e-b155-13375561baac@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <542a4f54-705d-4f4e-b155-13375561baac@suse.com>

This is a multi-part message in MIME format.
--------------DZEaixMA40TFnmdeEXmlCTAk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/18/25 5:20 PM, Jan Beulich wrote:
> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>> It instructs the remote harts to execute one or more HFENCE.GVMA instructions
>> by making an SBI call, covering the range of guest physical addresses between
>> start_addr and start_addr + size only for the given VMID.
>>
>> This function call is only valid for harts implementing hypervisor extension.
> We require H now, don't we? It's also odd to have this here, but not in patch 1.

Yes, we required it. I will drop this part from the commit message and the comment
above declaration of sbi_remote_hfence_gvma_vmid().

>
>> --- a/xen/arch/riscv/sbi.c
>> +++ b/xen/arch/riscv/sbi.c
>> @@ -267,6 +267,15 @@ int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
>>                         cpu_mask, start, size, 0, 0);
>>   }
>>   
>> +int sbi_remote_hfence_gvma_vmid(const cpumask_t *cpu_mask, vaddr_t start,
>> +                           size_t size, unsigned long vmid)
>> +{
>> +    ASSERT(sbi_rfence);
>> +
>> +    return sbi_rfence(SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA,
>> +                      cpu_mask, start, size, vmid, 0);
>> +}
> sbi_remote_hfence_gvma() may want implementing in terms of this new function,
> requiring the patches to be swapped. Provided (see comment there) that helper
> is actually needed.

It makes sense.
But it seems like there is no need for sbi_remote_hfence_gvma() as we have VMID introduced.

~ Oleksii

--------------DZEaixMA40TFnmdeEXmlCTAk
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/18/25 5:20 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:542a4f54-705d-4f4e-b155-13375561baac@suse.com">
      <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">It instructs the remote harts to execute one or more HFENCE.GVMA instructions
by making an SBI call, covering the range of guest physical addresses between
start_addr and start_addr + size only for the given VMID.

This function call is only valid for harts implementing hypervisor extension.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
We require H now, don't we? It's also odd to have this here, but not in patch 1.</pre>
    </blockquote>
    <pre>Yes, we required it. I will drop this part from the commit message and the comment
above declaration of sbi_remote_hfence_gvma_vmid().

</pre>
    <blockquote type="cite"
      cite="mid:542a4f54-705d-4f4e-b155-13375561baac@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/sbi.c
+++ b/xen/arch/riscv/sbi.c
@@ -267,6 +267,15 @@ int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
                       cpu_mask, start, size, 0, 0);
 }
 
+int sbi_remote_hfence_gvma_vmid(const cpumask_t *cpu_mask, vaddr_t start,
+                           size_t size, unsigned long vmid)
+{
+    ASSERT(sbi_rfence);
+
+    return sbi_rfence(SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA,
+                      cpu_mask, start, size, vmid, 0);
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
sbi_remote_hfence_gvma() may want implementing in terms of this new function,
requiring the patches to be swapped. Provided (see comment there) that helper
is actually needed.</pre>
    </blockquote>
    <pre>It makes sense.
But it seems like there is no need for sbi_remote_hfence_gvma() as we have VMID introduced.
</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------DZEaixMA40TFnmdeEXmlCTAk--

