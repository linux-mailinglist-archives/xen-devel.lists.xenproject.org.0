Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22263AE46C0
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 16:31:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022526.1398366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTiCW-0006yN-IH; Mon, 23 Jun 2025 14:31:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022526.1398366; Mon, 23 Jun 2025 14:31:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTiCW-0006wl-Fi; Mon, 23 Jun 2025 14:31:12 +0000
Received: by outflank-mailman (input) for mailman id 1022526;
 Mon, 23 Jun 2025 14:31:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a94z=ZG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uTiCV-0006wf-EM
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 14:31:11 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b472b13b-503e-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 16:31:09 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ade5b8aab41so890550466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 07:31:09 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae054083c87sm712594066b.89.2025.06.23.07.31.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 07:31:08 -0700 (PDT)
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
X-Inumbo-ID: b472b13b-503e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750689069; x=1751293869; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXMOrPWTU/o+DCEqk62seDI9irkUb2xOGAhRsca1Lz8=;
        b=ZXsbOFZNyQAxf/WCVQRIkUzeKUQeQDsJQ0WUAhUNPxCsRscFzACiKy9i4quNguolYO
         oINdTDK94+kobC+aAbrv22GO9DCjWjfyfP/bVJJBecf6bSE83gP178+EdZPW3bjkm0fa
         9L3D6yX6mjJJf4J9UuzWfpk1oUkrvkEhHhACSkjQhbSkYrN0xNta36/gr2hcCPQByY9W
         iWhLTiQh8mtG8V0m1ZiIdNWkSCNYFHYIefUfKjBX+dE8kHWN4wUt/wkKHenNcenV1CjQ
         hR6WCt88259oJYgPwEO8fD8uFyVdB7NcNDUvuwLn2yoBSOiyqoe5Pw+ZF7boXeqhamvi
         737A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750689069; x=1751293869;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bXMOrPWTU/o+DCEqk62seDI9irkUb2xOGAhRsca1Lz8=;
        b=jWMIdUKYGGJhgabSpO9zJvEQBPl9hdH2KcCV6FJAagO7VylVCmS3y+FUyuj/Fe3Cuq
         flpk20NGpULkEAPb+9Uv4fNrLEyPHkMpzJIyejUFOvoegCMH2MuCM4QYtl7in03U1lug
         AsbJArE4CILD4o7c4lvlAxe40F7nbLqVMctwKdLDvrYFfr9PXsxaSQLBIKvtKft9r8OZ
         0h0UIia2lrYLvUnjjSc5rTw7GokyQudO2bWhsoMiDMGsLEhJEBBE8Zwh/vFKJ77CFcZ2
         stRUnY7r3iMrKVVIEL9cjnfyLwE6Pn86VY9DhGCy6l2hixSUS5wRkv7QZE8F99Zd/fPY
         Te9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgYAam2mNgmISEhs9vP4sBNzqoumzwvb9NsGCa2i8MbNXbp4NgNaC0Eycf/JZgQMD7IF9ruDZJwE8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyC/knkgtpjOl/t9TsCJx2PmTPn88snKt461CAcJZ8xRSNO8S64
	bwSmovlzgKbAn66l8WKlsx0Uywai/3OZMtULcOIwz++kIfzqEs3rd+99
X-Gm-Gg: ASbGnct3hVFH29WoTHG9Kb5A6wA324ldsO8zQ/V2Mi1vAjhDOLI7sbCRDa7Qp2b4/mQ
	AYbY9Ww634ZP7WhJ9k8/ITn6+VdeTPMNHySpAcD3TWOkX/ojdkIXLA2tl6l3B1bL5rSH1FSqSgB
	xKid3mWk1hOyM1DRKBZ1/1kENP8tNBN2MmTRJUsJjM+U82NtoQHpA8nbBsP/Px66ITdwZOf+egy
	HLR9VYB2nF2MivI5WdIfw0q7kluk2nPkfXuXNF+Pb4hqlPNCI/yVDFmRfFZoNXB4ZsJYYlaa1wp
	6lq7QEQz8OvYM2M76eaDbQGgGgXikIEzHvTYG9jtFmO0fFVuwXLTAuzY5di3V1o0vh3JLbvP1ZK
	QmsfUCCu17k475Fsa5OPsAYOIwFDKTTSSnmvtVoereqXqcQ==
X-Google-Smtp-Source: AGHT+IGVaAPXwRJJGNRjIX6xLs6j6gEwx6uuugUZBalDARDYJtZI8KiLk3p+VTjeZTB19xV4WYpIpA==
X-Received: by 2002:a17:906:c10f:b0:ae0:a353:223a with SMTP id a640c23a62f3a-ae0a3534ca5mr53469566b.7.1750689068447;
        Mon, 23 Jun 2025 07:31:08 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------UnS0Rv1O8TFjlHLv3WAIGagw"
Message-ID: <80460b90-ffb9-44e9-83ba-0f81b3b05e92@gmail.com>
Date: Mon, 23 Jun 2025 16:31:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/17] xen/riscv: implement sbi_remote_hfence_gvma()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <ea7a15c0ecfd2bae95c11a92e4c0cb71b155140f.1749555949.git.oleksii.kurochko@gmail.com>
 <728ee92b-0e4f-4ccb-8c6e-54687bd75c62@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <728ee92b-0e4f-4ccb-8c6e-54687bd75c62@suse.com>

This is a multi-part message in MIME format.
--------------UnS0Rv1O8TFjlHLv3WAIGagw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/18/25 5:15 PM, Jan Beulich wrote:
> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>> Instruct the remote harts to execute one or more HFENCE.GVMA instructions,
>> covering the range of guest physical addresses between start_addr and
>> start_addr + size for all the guests.
> Here and in the code comment: Why "for all the guests"? Under what conditions
> would you require such a broad (guest) TLB flush?

Originally, it came from Andrew reply:
```
TLB flushing needs to happen for each pCPU which potentially has cached
a mapping.

In other arches, this is tracked by d->dirty_cpumask which is the bitmap
of pCPUs where this domain is scheduled.

CPUs need to flush their TLBs before removing themselves from
d->dirty_cpumask, which is typically done during context switch, but it
means that to flush the P2M, you only need to IPI a subset of CPUs.
```

But specifically this function was introduced to work in case no VMID support
as we can't distinguish which TLB entries belong to which domain. As a result,
we have no choice but to flush the entire TLB to avoid incorrect translations.

However, this patch may no longer be necessary, as VMID support has been
introduced and|sbi_remote_hfence_gvma_vmid()| will be used instead.

>
>> --- a/xen/arch/riscv/sbi.c
>> +++ b/xen/arch/riscv/sbi.c
>> @@ -258,6 +258,15 @@ int sbi_remote_sfence_vma(const cpumask_t *cpu_mask, vaddr_t start,
>>                         cpu_mask, start, size, 0, 0);
>>   }
>>   
>> +int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
>> +                           size_t size)
>> +{
>> +    ASSERT(sbi_rfence);
> As previously indicated, I question the usefulness of such assertions. If the
> pointer is still NULL, ...
>
>> +    return sbi_rfence(SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA,
>> +                      cpu_mask, start, size, 0, 0);
> ... you'll crash here anyway (much like you will in a release build).

I will drop ASSERT() for rfence functions.

Thanks.

~ Oleksii

--------------UnS0Rv1O8TFjlHLv3WAIGagw
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
    <div class="moz-cite-prefix">On 6/18/25 5:15 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:728ee92b-0e4f-4ccb-8c6e-54687bd75c62@suse.com">
      <pre wrap="" class="moz-quote-pre">On 10.06.2025 15:05, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Instruct the remote harts to execute one or more HFENCE.GVMA instructions,
covering the range of guest physical addresses between start_addr and
start_addr + size for all the guests.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Here and in the code comment: Why "for all the guests"? Under what conditions
would you require such a broad (guest) TLB flush?</pre>
    </blockquote>
    <pre data-start="66" data-end="277">Originally, it came from Andrew reply:
```
TLB flushing needs to happen for each pCPU which potentially has cached
a mapping.

In other arches, this is tracked by d-&gt;dirty_cpumask which is the bitmap
of pCPUs where this domain is scheduled.

CPUs need to flush their TLBs before removing themselves from
d-&gt;dirty_cpumask, which is typically done during context switch, but it
means that to flush the P2M, you only need to IPI a subset of CPUs.
```

But specifically this function was introduced to work in case no VMID support
as we can't distinguish which TLB entries belong to which domain. As a result,
we have no choice but to flush the entire TLB to avoid incorrect translations.</pre>
    <pre data-start="279" data-end="420">However, this patch may no longer be necessary, as VMID support has been
introduced and <code data-start="367" data-end="398">sbi_remote_hfence_gvma_vmid()</code> will be used instead.</pre>
    <pre>
</pre>
    <blockquote type="cite"
      cite="mid:728ee92b-0e4f-4ccb-8c6e-54687bd75c62@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/sbi.c
+++ b/xen/arch/riscv/sbi.c
@@ -258,6 +258,15 @@ int sbi_remote_sfence_vma(const cpumask_t *cpu_mask, vaddr_t start,
                       cpu_mask, start, size, 0, 0);
 }
 
+int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
+                           size_t size)
+{
+    ASSERT(sbi_rfence);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
As previously indicated, I question the usefulness of such assertions. If the
pointer is still NULL, ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    return sbi_rfence(SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA,
+                      cpu_mask, start, size, 0, 0);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... you'll crash here anyway (much like you will in a release build).</pre>
    </blockquote>
    <pre>I will drop ASSERT() for rfence functions.

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------UnS0Rv1O8TFjlHLv3WAIGagw--

